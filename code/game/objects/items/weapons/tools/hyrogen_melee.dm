// Hydrogen Sword, like an energy sword that use hydrogen fuel cell. It explode if it is EMP'ed while active.
/obj/item/tool/hydrogen_sword
	name = "hydrogen-plasma sword"
	desc = "An energy sword that uses super heated hydrogen shaped into plasma. \
	The only thing preventing this from blowing up in your face is a magnetic field produced by the hilt."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "sword"
	item_state = "hydrogen"
	origin_tech = list(TECH_PLASMA = 10, TECH_POWER = 5, TECH_COMBAT = 12, TECH_MATERIAL = 7)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_MHYDROGEN = 0.8, MATERIAL_OSMIUM = 0.8, MATERIAL_TRITIUM = 0.8)
	force = WEAPON_FORCE_WEAK
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 3
	throw_range = 5
	no_double_tact = TRUE //for now.
	w_class = ITEM_SIZE_SMALL
	switched_on_qualities = list(QUALITY_WELDING = 5, QUALITY_CAUTERIZING = 25, QUALITY_CUTTING = 50)
	worksound = WORKSOUND_WELDING
	embed_mult = 0 // It shouldn't get embedded in, it's a blade of fire.

	var/active = FALSE
	var/active_ap = ARMOR_PEN_EXTREME
	var/active_force = WEAPON_FORCE_LETHAL // It's a blade of super-heated plasma.
	var/active_throwforce = WEAPON_FORCE_LETHAL // Less damage when thrown.
	var/active_w_class = ITEM_SIZE_HUGE // Can't put that in a backpack while active
	var/emp_burn_min = 25 // How much burn damage do the sword do to neighboring mobs if EMP'ed while active
	var/emp_burn_max = 50 // How much burn damage do the sword do to neighboring mobs if EMP'ed while active
	var/obj/item/hydrogen_fuel_cell/fuel_cell = null // The flask the sword consume to stay active
	var/use_plasma_cost = 0.1 // Active cost

/obj/item/tool/hydrogen_sword/no_starting_fuel
	spawn_full = FALSE //For rnd

/obj/item/tool/hydrogen_sword/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/tool/hydrogen_sword/Initialize(mapload = TRUE)
	..()
	if(spawn_full)
		fuel_cell = new(src)

/obj/item/tool/hydrogen_sword/examine(mob/user)
	..()
	if(fuel_cell)
		to_chat(user, SPAN_NOTICE("[src]'s fuel gauge is at [(fuel_cell.plasma / fuel_cell.max_plasma) * 100]%"))
	else
		to_chat(user, SPAN_NOTICE("[src] doesn't have a fuel cell inserted."))

/obj/item/tool/hydrogen_sword/proc/activate(playsound = TRUE, force_update = FALSE)
	if(!force_update)
		if(!fuel_cell || active)
			return
	active = TRUE
	force += active_force
	throwforce += active_throwforce
	armor_divisor += active_ap
	sharp = TRUE
	edge = TRUE
	w_class = active_w_class
	tool_qualities = switched_on_qualities
	if(playsound)
		playsound(src, 'sound/weapons/saberon.ogg', 50, 1)
	update_icon()

/obj/item/tool/hydrogen_sword/proc/deactivate()
	if(!active)
		return
	playsound(src, 'sound/weapons/saberoff.ogg', 50, 1)
	active = FALSE
	refresh_upgrades()
	tool_qualities = initial(tool_qualities)
	update_icon()

/obj/item/tool/hydrogen_sword/attack_self(mob/living/user as mob)
	if(active)
		deactivate()
	else
		activate()
	add_fingerprint(user)

/obj/item/tool/hydrogen_sword/attackby(obj/item/W as obj, mob/living/user as mob)
	if(istype(W, /obj/item/hydrogen_fuel_cell))
		if(fuel_cell)
			to_chat(usr, SPAN_WARNING("[src] is already loaded."))
			return

		if(insert_item(W, user))
			fuel_cell = W
			update_icon()
	else
		..()

/obj/item/tool/hydrogen_sword/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(fuel_cell, usr))
		fuel_cell = null
		if(active)
			deactivate()
		update_icon()


/obj/item/tool/hydrogen_sword/emp_act(severity)
	if(active) // Blow up.
		deactivate() //stops a feedback loop
		var/turf/T = get_turf(src)
		src.visible_message(SPAN_DANGER("[src]'s active magnetic field get disturbed by an EMP, violently exploding and scorching everything nearby!"))
		explosion(T, 0, 1, 2, 4) // Explode
		new /obj/effect/explosion(T)
		for(var/mob/M in view(1, T)) // Burn every mob nearby.
			to_chat(M, SPAN_DANGER("You feel a wave of heat scorch your body!"))
			M.take_overall_damage(0, rand(emp_burn_min, emp_burn_max))
	qdel(src)


/obj/item/tool/hydrogen_sword/attack(mob/M as mob, mob/living/user as mob)
	..()
	playsound(src.loc, 'sound/weapons/blade1.ogg', 50, 1, -1)

/obj/item/tool/hydrogen_sword/Process()
	if(active && fuel_cell)
		if(!fuel_cell.use(use_plasma_cost))
			src.visible_message(SPAN_NOTICE("[src] run out of hydrogen!."))
			deactivate()

/obj/item/tool/hydrogen_sword/update_icon()
	cut_overlays()
	item_state = "[initial(item_state)][active ? "_active" : ""]"
	if(active)
		add_overlay("[icon_state]_active")
	update_wear_icon()


/obj/item/tool/hydrogen_sword/refresh_upgrades()
	..()
	w_class = initial(w_class)
	if(active)
		activate(FALSE, TRUE) //So we dont null are on state
		SStgui.update_uis(src)