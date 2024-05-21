#define TANK_DISPENSER_CAPACITY 10

/obj/structure/dispenser
	name = "tank storage unit"
	desc = "A simple yet bulky storage device for gas tanks. Has room for up to ten oxygen tanks, and ten plasma tanks."
	icon = 'icons/obj/objects.dmi'
	icon_state = "dispenser"
	density = 1
	anchored = 1.0
	w_class = ITEM_SIZE_HUGE
	layer = BELOW_OBJ_LAYER
	var/oxygentanks = TANK_DISPENSER_CAPACITY
	var/plasmatanks = TANK_DISPENSER_CAPACITY

	var/list/allowed_items = list(/obj/item/tank/oxygen, /obj/item/tank/air, /obj/item/tank/anesthetic, /obj/item/tank/plasma)

/obj/structure/dispenser/oxygen
	plasmatanks = 0

/obj/structure/dispenser/plasma
	oxygentanks = 0


/obj/structure/dispenser/Initialize()
	. = ..()
	for(var/i in 1 to oxygentanks)
		new /obj/item/tank/oxygen(src)
	for(var/i in 1 to plasmatanks)
		new /obj/item/tank/plasma(src)
	update_icon()


/obj/structure/dispenser/update_icon()
	cut_overlays()
	switch(oxygentanks)
		if(1 to 3)	add_overlay("oxygen-[oxygentanks]")
		if(4 to INFINITY) add_overlay("oxygen-4")
	switch(plasmatanks)
		if(1 to 4)	add_overlay("plasma-[plasmatanks]")
		if(5 to INFINITY) add_overlay("plasma-5")

/obj/structure/dispenser/attack_ai(mob/user)
	if(user.Adjacent(src))
		return attack_hand(user)
	..()

/obj/structure/dispenser/attack_hand(mob/user)
	ui_interact(user)

/obj/structure/dispenser/ui_state(mob/user)
	return GLOB.physical_state

/obj/structure/dispenser/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "TankDispenser", name)
		ui.open()

/obj/structure/dispenser/ui_data(mob/user)
	var/list/data = list()
	data["oxygen"] = oxygentanks
	data["plasma"] = plasmatanks
	return data

/obj/structure/dispenser/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	switch(action)
		if("plasma")
			var/obj/item/tank/plasma/tank = locate() in src
			if(tank && Adjacent(usr))
				usr.put_in_hands(tank)
				plasmatanks--
			. = TRUE
			to_chat(usr, SPAN_NOTICE("You take [tank] out of [src]."))
			playsound(usr.loc, 'sound/machines/Custom_extout.ogg', 100, 1)

		if("oxygen")
			var/obj/item/tank/tank = null
			for(var/obj/item/tank/T in src)
				if(istype(T, /obj/item/tank/oxygen) || istype(T, /obj/item/tank/air) || istype(T, /obj/item/tank/anesthetic))
					tank = T
					break
			if(tank && Adjacent(usr))
				usr.put_in_hands(tank)
				oxygentanks--
			. = TRUE
			to_chat(usr, SPAN_NOTICE("You take [tank] out of [src]."))
			playsound(usr.loc, 'sound/machines/Custom_extout.ogg', 100, 1)

	update_icon()

/obj/structure/dispenser/attackby(obj/item/I, mob/user)
	if(is_type_in_list(I, allowed_items))
		return eat(user, I)
	else if(QUALITY_BOLT_TURNING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_BOLT_TURNING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
			if(anchored)
				to_chat(user, SPAN_NOTICE("You lean down and unwrench [src]."))
				anchored = FALSE
			else
				to_chat(user, SPAN_NOTICE("You wrench [src] into place."))
				anchored = TRUE
		return
	else if(user.a_intent != I_HURT)
		to_chat(user, SPAN_NOTICE("[I] does not fit into [src]"))
		return
	else
		return ..()

/obj/structure/dispenser/proc/eat(mob/user, obj/item/I)
	if(!(is_type_in_list(I, allowed_items)))
		return FALSE

	var/full
	if(istype(I, /obj/item/tank/oxygen) || istype(I, /obj/item/tank/air) || istype(I, /obj/item/tank/anesthetic))
		if(oxygentanks < TANK_DISPENSER_CAPACITY)
			if(!user.unEquip(I, Target = src))
				to_chat(user, SPAN_WARNING("[I] is stuck to your hands!"))
				return FALSE
			oxygentanks++
		else
			full = TRUE
	else if(istype(I, /obj/item/tank/plasma))
		if(plasmatanks < TANK_DISPENSER_CAPACITY)
			if(!user.unEquip(I, Target = src))
				to_chat(user, SPAN_WARNING("[I] is stuck to your hands!"))
				return FALSE
			plasmatanks++
		else
			full = TRUE

	if(full)
		to_chat(user, "<span class='notice'>[src] can't hold any more of [I].</span>")
		return FALSE

	to_chat(user, "<span class='notice'>You put [I] in [src].</span>")
	update_icon()
	return TRUE
