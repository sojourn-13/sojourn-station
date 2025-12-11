// Base fluid object - backport scaffold
// Represents a depth-based water tile capable of spreading & evaporating.

/obj/effect/fluid
    name = "water"
    icon = 'icons/effects/liquids.dmi'
    icon_state = "water_shallow"
    layer = SHALLOW_FLUID_LAYER
    plane = FLOOR_PLANE
    anchored = TRUE
    mouse_opacity = 0
    density = FALSE

    var/fluid_amount = 50                // Depth units
    var/last_process = 0
    var/temperature = T20C
    var/spread_cooldown = 0
    var/pushing = FALSE

/obj/effect/fluid/Initialize(mapload, initial_depth)
    . = ..()
    if(isnum(initial_depth))
        fluid_amount = clamp(initial_depth, 0, FLUID_MAX_DEPTH)
    // Merge with existing fluid on turf
    for(var/obj/effect/fluid/F in loc)
        if(F != src)
            F.fluid_amount = min(FLUID_MAX_DEPTH, F.fluid_amount + fluid_amount)
            ADD_ACTIVE_FLUID(F)
            return INITIALIZE_HINT_QDEL
    ADD_ACTIVE_FLUID(src)
    update_visuals()
    apply_environment_effects()

/obj/effect/fluid/Destroy()
    REMOVE_ACTIVE_FLUID(src)
    return ..()

/obj/effect/fluid/proc/update_visuals()
    if(fluid_amount <= FLUID_EVAPORATION_POINT || fluid_amount == FLUID_DELETING)
        qdel(src)
        return
    var/ratio = clamp((fluid_amount / FLUID_DEEP), 0, 1)
    alpha = round(FLUID_MIN_ALPHA + (FLUID_MAX_ALPHA - FLUID_MIN_ALPHA) * ratio)
    if(fluid_amount < FLUID_SHALLOW)
        icon_state = "water_shallow"
        layer = SHALLOW_FLUID_LAYER
    else if(fluid_amount < FLUID_DEEP)
        icon_state = "water_mid"
        layer = SHALLOW_FLUID_LAYER
    else
        icon_state = "water_deep"
        layer = DEEP_FLUID_LAYER

/obj/effect/fluid/proc/process_fluid()
    if(QDELETED(src)) return
    // Evaporation threshold
    if(fluid_amount <= FLUID_EVAPORATION_POINT)
        qdel(src)
        return

    // Slow decay (placeholder until full temperature/evap model)
    if(prob(1))
        fluid_amount = max(FLUID_EVAPORATION_POINT, fluid_amount - 1)

    // Lateral leveling to neighboring fluid tiles (lightweight)
    if(world.time > spread_cooldown)
        spread_cooldown = world.time + 5
        passive_level_flow()

    update_visuals()
    apply_environment_effects()

/obj/effect/fluid/proc/passive_level_flow()
    var/turf/T = loc
    if(!istype(T)) return
    var/list/adj = list()
    var/total = fluid_amount
    for(var/d in GLOB.cardinal)
        var/turf/N = get_step(T, d)
        if(!N) continue
        var/obj/effect/fluid/F = locate(/obj/effect/fluid) in N
        if(F)
            adj += F
            total += F.fluid_amount
    if(!length(adj)) return
    var/avg = total / (length(adj) + 1)
    if(fluid_amount > avg + 5)
        for(var/obj/effect/fluid/F in adj)
            var/diff = min((fluid_amount - avg) * 0.3, fluid_amount - avg)
            if(diff <= 0) continue
            F.fluid_amount = min(FLUID_MAX_DEPTH, F.fluid_amount + diff)
            fluid_amount -= diff
            ADD_ACTIVE_FLUID(F)
    // If we dropped below evaporation point, cleanup next tick

/obj/effect/fluid/proc/add_depth(amount)
    SET_FLUID_DEPTH(src, fluid_amount + amount)
    update_visuals()
    apply_environment_effects()

/obj/effect/fluid/proc/remove_depth(amount)
    LOSE_FLUID(src, amount)
    update_visuals()
    apply_environment_effects()

/obj/effect/fluid/proc/apply_environment_effects()
    if(QDELETED(src))
        return
    for(var/atom/movable/A in loc)
        if(A == src)
            continue
        A.fluid_contact(src, fluid_amount)
