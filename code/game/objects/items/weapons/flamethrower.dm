/obj/item/weapon/flamethrower
	name = "flamethrower"
	desc = "You are a firestarter!"
	icon = 'icons/obj/flamethrower.dmi'
	icon_state = "flamethrowerbase"
	item_state = "flamethrower_0"
	flags = CONDUCT | NOBLUDGEON
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_COMBAT = 2, TECH_PLASMA = 1)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_STEEL = 5)
	var/pressure = 1 //more pressure = longer flame but greater fuel use
	var/lit = FALSE	//on or off
	var/operating = 0//cooldown
	var/turf/previousturf = null
	var/obj/item/weapon/weldpack/canister/mytank = null



/obj/item/weapon/flamethrower/Destroy()
	if(mytank)
		qdel(mytank)

	return ..()

/obj/item/weapon/flamethrower/update_icon()
	cut_overlays()
	if(mytank)
		add_overlay("+ptank")
	if(lit)
		add_overlay("+lit")
	return

/obj/item/weapon/flamethrower/examine(mob/user)
	..()
	to_chat(user, SPAN_NOTICE("The pressure valve is set to [pressure]x normal pressure, and the pilot light is [lit ? "lit" : "unlit"]."))
	to_chat(user, SPAN_NOTICE("There is currently [mytank ? "a" : "no"] welding fuel canister loaded."))
	if(mytank)
		to_chat(user, SPAN_NOTICE("The fuel canister is [mytank.reagents.total_volume]% full."))

/obj/item/weapon/flamethrower/attackby(obj/item/I, user)
	if(istype(I, /obj/item/weapon/weldpack/canister))
		if(mytank)
			to_chat(user, SPAN_NOTICE("There appears to already be a fuel canister loaded in [src]!"))
			return
		else
			var/obj/item/weapon/weldpack/canister/C = I //typecasting
			mytank = C
			user.remove_from_mob(C)
			C.forceMove(src)
			update_icon()
			return
	else
		..()

/obj/item/weapon/flamethrower/AltClick(var/mob/user)
	if(operating)
		return
	switch(pressure)
		if(1)
			pressure = 2
			to_chat(user, SPAN_NOTICE("You adjusted the pressure valve. You'll now shoot at [pressure]x normal pressure."))
			return
		if(2)
			pressure = 3
			to_chat(user, SPAN_NOTICE("You adjusted the pressure valve. You'll now shoot at [pressure]x normal pressure."))
			return
		if(3)
			pressure = 1
			to_chat(user, SPAN_NOTICE("You adjusted the pressure valve. You'll now shoot at [pressure]x normal pressure."))
			return

/obj/item/weapon/flamethrower/attack_self(var/mob/user)
	if(lit)
		to_chat(user, SPAN_NOTICE("You turn off the pilot light. You will now spray people with unlit fuel."))
		lit = FALSE
	else
		to_chat(user, SPAN_NOTICE("You turn on the pilot light. You will now spray people with burning fuel."))
		lit = TRUE
	update_icon()


/obj/item/weapon/flamethrower/afterattack(atom/target, mob/user, proximity)
	if(istype(target,/obj/item) && user == target.get_holding_mob())
		return
	if(mytank.reagents.total_volume < pressure * 5)
		to_chat(user, SPAN_WARNING("Your flamethrower emits a nearly-intangible puff of vapour, the fuel tank is running empty!"))
	if(!lit)
		flamer_unlit_fire(target, user, proximity)
		return
	else if(get_dist(target, user) <= round(2.5*pressure))
		var/turf/target_turf = get_turf(target)
		if(target_turf)
			var/list/turflist = getline(user, target_turf)
			mytank.reagents.remove_reagent("fuel", pressure*5)
			flamer_lit_fire(turflist, user, get_dir(user, target))
			return
	else
		return

/obj/item/weapon/flamethrower/proc/flamer_lit_fire(var/list/turflist, mob/user, fire_dir)
	if(!lit || operating)	return
	operating = 1
	for(var/turf/T in turflist)
		if(T.density || istype(T, /turf/space))
			break
		if(!previousturf && length(turflist)>1)
			previousturf = get_turf(src)
			continue	//so we don't burn the tile we be standin on
		if(previousturf && LinkBlocked(previousturf, T))
			break
		new/obj/effect/decal/cleanable/liquid_fuel/flamethrower_fuel(T, amount = pressure*25, fire_dir, get_turf(src))

	previousturf = null
	operating = 0
	return

/obj/item/weapon/flamethrower/proc/flamer_unlit_fire(atom/A, mob/user, proximity)
	if(A.density && proximity)
		A.visible_message(SPAN_WARNING("[usr] sprays down [A] with fuel from the [src]!."))
		mytank.reagents.splash(A, pressure*5)
	else
		var/obj/effect/effect/water/chempuff/D = new/obj/effect/effect/water/chempuff(get_turf(src))
		var/turf/my_target = get_turf(A)
		D.create_reagents(pressure*5)
		if(!src)
			return
		mytank.reagents.trans_to_obj(D, pressure*5)
		D.set_color()
		D.set_up(my_target, round(2.5*pressure), 3)
	return

/obj/item/weapon/flamethrower/full/Initialize()
	mytank = new mytank(src)

/obj/item/weapon/flamethrower/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(mytank, usr))
		mytank = null
		update_icon()
	else
		..()
