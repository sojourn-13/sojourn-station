// Fluid system defines (backport scaffold from Baystation PR 22765)
// NOTE: Full feature parity not yet implemented; this file provides macros & constants.

#define FLUID_EVAPORATION_POINT 3          // Depth a fluid begins self-deleting
#define FLUID_DELETING -1                  // Depth a fluid counts as qdel'd
#define FLUID_SHALLOW 200                  // Depth shallow icon is used
#define FLUID_OVER_MOB_HEAD 300            // Depth over mob head (drowning threshold)
#define FLUID_DEEP 800                     // Depth deep icon is used
#define FLUID_MAX_DEPTH (FLUID_DEEP*4)     // Arbitrary max value for flooding
#define FLUID_PUSH_THRESHOLD 20            // Amount of flow needed to push items
#define FLUID_CONDENSE_MULTIPLIER 20       // Depth added per condensed gas unit
#define FLUID_DROWN_TICK 20                // Life ticks between drowning damage
#define FLUID_DROWN_OXY_DAMAGE 4           // Oxygen damage per drown tick
#define FLUID_EXTINGUISH_THRESHOLD FLUID_SHALLOW

// Active source tracking
#define ADD_ACTIVE_FLUID_SOURCE(T) SSfluids.water_sources[T] = TRUE
#define REMOVE_ACTIVE_FLUID_SOURCE(T) SSfluids.water_sources -= T
// Active fluid tiles/objects
#define ADD_ACTIVE_FLUID(F) SSfluids.active_fluids[F] = TRUE
#define REMOVE_ACTIVE_FLUID(F) SSfluids.active_fluids -= F
// Adjust depth helpers
#define LOSE_FLUID(F, amt) \
    F:fluid_amount = max(-1, F:fluid_amount - amt); \
    ADD_ACTIVE_FLUID(F)
#define SET_FLUID_DEPTH(F, amt) \
    F:fluid_amount = min(FLUID_MAX_DEPTH, amt); \
    ADD_ACTIVE_FLUID(F)

// Blocked directions cache (windows/doors) for flooding performance
#define UPDATE_FLUID_BLOCKED_DIRS(T) \
    if(isnull(T:fluid_blocked_dirs)) { \
        T:fluid_blocked_dirs = 0; \
        for(var/obj/structure/window/W in T) { if(W.density) T:fluid_blocked_dirs |= W.dir; } \
        for(var/obj/machinery/door/window/D in T) { if(D.density) T:fluid_blocked_dirs |= D.dir; } \
    }

// Flood neighboring turfs wholesale (high depth propagation) - dry_run prevents creation
#define FLOOD_TURF_NEIGHBORS(T, dry_run) \
    for(var/spread_dir in GLOB.cardinal) { \
        UPDATE_FLUID_BLOCKED_DIRS(T); \
        if(T:fluid_blocked_dirs & spread_dir) continue; \
        var/turf/next = get_step(T, spread_dir); \
        if(!istype(next) || next.flooded) continue; \
        UPDATE_FLUID_BLOCKED_DIRS(next); \
        if((next.fluid_blocked_dirs & GLOB.reverse_dir[spread_dir]) || !next.CanFluidPass(spread_dir)) continue; \
        flooded_a_neighbor = TRUE; \
        var/obj/effect/fluid/F = locate() in next; \
        if(!F) { \
            F = new /obj/effect/fluid(next); \
            var/datum/gas_mixture/GM = T:return_air(); \
            if(GM) F.temperature = GM.temperature; \
        } \
        if(F) { \
            if(F.fluid_amount >= FLUID_MAX_DEPTH) continue; \
			var/new_amount = min(FLUID_MAX_DEPTH, F.fluid_amount + FLUID_DEEP); \
			SET_FLUID_DEPTH(F, new_amount); \
        } \
    } \
    if(!flooded_a_neighbor) REMOVE_ACTIVE_FLUID_SOURCE(T)

#define FLUID_MAX_ALPHA 160
#define FLUID_MIN_ALPHA 45

// Shared overlay accessor
#define APPLY_FLUID_OVERLAY(img_state) \
    if(!SSfluids.fluid_images[img_state]) SSfluids.fluid_images[img_state] = image('icons/effects/liquids.dmi', img_state); \
    overlays += SSfluids.fluid_images[img_state]
