// Welder that use plasma flasks
/obj/item/weapon/tool/plasma_torch
	name = "Plasma Welder"
	desc = "A welder that use cryo-sealed hydrogen fuel cell to weld with the heat of a sun."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "welder"

	eye_hazard = TRUE
	degradation = FALSE
	create_hot_spot = TRUE
	switched_on_qualities = list(QUALITY_WELDING = 80, QUALITY_CAUTERIZING = 50)
	toggleable = TRUE
	max_upgrades = 0
	heat = 2250

	var/obj/item/weapon/hydrogen_fuel_cell/flask = null // The flask the welder use for ammo
	var/use_plasma_cost = 1 // Active cost
	var/passive_cost = 0.3 // Passive cost

/obj/item/weapon/tool/plasma_torch/New()
	..()
	if(!flask)
		flask = new /obj/item/weapon/hydrogen_fuel_cell(src)

/obj/item/weapon/tool/plasma_torch/Process()
	..()
	if(switched_on)
		if (use_plasma_cost && passive_cost)
			if(!consume_plasma_fuel(passive_cost))
				turn_off()

/obj/item/weapon/tool/plasma_torch/proc/consume_plasma_fuel(var/volume)
	if (get_plasma_fuel() >= volume)
		flask.use(volume)
		return TRUE
	return FALSE

/obj/item/weapon/tool/plasma_torch/proc/get_plasma_fuel()
	return flask.plasma

/obj/item/weapon/tool/plasma_torch/consume_resources(var/timespent, var/user)
	..()
	if(use_plasma_cost)
		if(!consume_plasma_fuel(use_plasma_cost*timespent))
			to_chat(user, SPAN_NOTICE("You need more hydrogen fuel to complete this task."))
			return FALSE

/obj/item/weapon/tool/plasma_torch/check_tool_effects(var/mob/living/user, var/time)
	if(use_plasma_cost)
		if(get_plasma_fuel() < (use_plasma_cost*time))
			to_chat(user, SPAN_NOTICE("You need more hydrogen fuel to complete this task."))
			return FALSE
	..()

/obj/item/weapon/tool/plasma_torch/examine(mob/user)
	..(user)
	if(!flask)
		to_chat(user, SPAN_NOTICE("Has no fuel flask inserted."))
		return
	to_chat(user, "Has [get_plasma_fuel()] unit of fuel remaining.")
	return

// Copying the superior proc because I don't know how to insert the plasma cost in the middle.
/obj/item/weapon/tool/plasma_torch/ui_data(mob/user)
	var/list/data = ..()

	if(use_plasma_cost)
		data["hydrogen_fuel"] = flask ? flask.plasma : null
		data["max_hydrogen_fuel"] = flask.max_plasma
		data["use_plasma_cost"] = use_plasma_cost
		data["use_plasma_cost_state"] = initial(use_plasma_cost) > use_plasma_cost ? "good" : initial(use_plasma_cost) < use_plasma_cost ? "bad" : ""
		data["use_plasma_cost_max"] = initial(use_plasma_cost) * 10

	return data

/obj/item/weapon/tool/plasma_torch/turn_on(mob/user)
	.=..()
	if(.)
		playsound(loc, 'sound/items/welderactivate.ogg', 50, 1)
		damtype = BURN
		START_PROCESSING(SSobj, src)

/obj/item/weapon/tool/plasma_torch/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/items/welderdeactivate.ogg', 50, 1)
	..()
	damtype = initial(damtype)

/obj/item/weapon/tool/plasma_torch/is_hot()
	if (damtype == BURN)
		return heat

/obj/item/weapon/tool/plasma_torch/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(flask, usr))
		flask = null
		update_icon()

/obj/item/weapon/tool/plasma_torch/attackby(obj/item/weapon/W as obj, mob/living/user as mob)

	if(flask)
		to_chat(usr, SPAN_WARNING("[src] is already loaded."))
		return

	if(istype(W, /obj/item/weapon/hydrogen_fuel_cell) && insert_item(W, user))
		flask = W
		update_icon()

/obj/item/weapon/tool/plasma_torch/update_icon()
	..()
	if(flask)
		add_overlay("[icon_state]_loaded")