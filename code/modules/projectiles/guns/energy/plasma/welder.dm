// Welder that use plasma flasks
/obj/item/tool/plasma_torch
	name = "plasma torch"
	desc = "A welder that uses a cryo-sealed hydrogen fuel cell to weld with the heat of a sun. While better than a conventional welders and even rivaling greyson prositronics its \
	costly fuel supply and risks involved stopped the tool from ever seeing commercial success, a choice for a specialist and nobody else."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "welder"
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_MHYDROGEN = 1, MATERIAL_TRITIUM = 1)
	eye_hazard = TRUE
	degradation = FALSE
	create_hot_spot = TRUE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 7, TECH_PLASMA = 7)
	switched_on_qualities = list(QUALITY_WELDING = 60, QUALITY_CAUTERIZING = 25, QUALITY_WIRE_CUTTING = 25)
	worksound = WORKSOUND_WELDING
	toggleable = TRUE
	max_upgrades = 3
	heat = 2250

	var/obj/item/hydrogen_fuel_cell/flask = null // The flask the welder use for ammo
	var/use_plasma_cost = 0.1 // Active cost
	var/passive_cost = 0.03 // Passive cost

	var/obj/item/gun/hydrogen/plasma_torch/gun = null // Hold the gun the welder turns into.

/obj/item/tool/plasma_torch/Initialize(mapload = TRUE)
	..()
	flask = new /obj/item/hydrogen_fuel_cell(src) // Give the welder a new flask when mapped in.
	update_icon()

/obj/item/tool/plasma_torch/New()
	..()
	update_icon()
	if(!gun)
		gun = new /obj/item/gun/hydrogen/plasma_torch(src)
		gun.welder = src

/obj/item/tool/plasma_torch/loaded/New()
	flask = new /obj/item/hydrogen_fuel_cell(src)
	..()

/obj/item/tool/plasma_torch/Destroy()

	if(gun)
		gun.welder = null
		gun = null

	. = ..()


/obj/item/tool/plasma_torch/Process()
	..()
	if(switched_on)
		if (use_plasma_cost && passive_cost)
			if(!consume_plasma_fuel(passive_cost))
				turn_off()

/obj/item/tool/plasma_torch/proc/consume_plasma_fuel(var/volume)
	if (get_plasma_fuel() >= volume)
		flask.use(volume)
		return TRUE
	return FALSE

/obj/item/tool/plasma_torch/proc/get_plasma_fuel()
	return flask.plasma

/obj/item/tool/plasma_torch/consume_resources(var/timespent, var/user)
	..()
	if(use_plasma_cost)
		if(!consume_plasma_fuel(use_plasma_cost*timespent))
			to_chat(user, SPAN_NOTICE("You need more hydrogen fuel to complete this task."))
			return FALSE

/obj/item/tool/plasma_torch/examine(mob/user)
	..(user)
	if(!flask)
		to_chat(user, SPAN_NOTICE("Has no fuel flask inserted."))
		return
	to_chat(user, "Has [get_plasma_fuel()] unit of fuel remaining.")
	return

// Copying the superior proc because I don't know how to insert the plasma cost in the middle.
/obj/item/tool/plasma_torch/nano_ui_data(mob/user)
	var/list/data = ..()

	if(use_plasma_cost)
		data["hydrogen_fuel"] = flask ? flask.plasma : null
		data["max_hydrogen_fuel"] = flask.max_plasma
		data["use_plasma_cost"] = use_plasma_cost
		data["use_plasma_cost_state"] = initial(use_plasma_cost) > use_plasma_cost ? "good" : initial(use_plasma_cost) < use_plasma_cost ? "bad" : ""
		data["use_plasma_cost_max"] = initial(use_plasma_cost) * 10

	return data

/obj/item/tool/plasma_torch/turn_on(mob/user)
	.=..()
	if(.)
		playsound(loc, 'sound/items/welderactivate.ogg', 50, 1)
		damtype = BURN
		START_PROCESSING(SSobj, src)

/obj/item/tool/plasma_torch/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/items/welderdeactivate.ogg', 50, 1)
	..()
	damtype = initial(damtype)

/obj/item/tool/plasma_torch/is_hot()
	if (damtype == BURN)
		return heat

/obj/item/tool/plasma_torch/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(flask, usr))
		flask = null
		update_icon()

/obj/item/tool/plasma_torch/attackby(obj/item/W as obj, mob/living/user as mob)
	if(istype(W, /obj/item/hydrogen_fuel_cell))
		if(flask)
			to_chat(usr, SPAN_WARNING("[src] is already loaded."))
			return

		if(insert_item(W, user))
			flask = W
			update_icon()

/obj/item/tool/plasma_torch/update_icon()
	..()
	if(flask)
		add_overlay("[icon_state]_loaded")

// This is where the welder transform into a gun
/obj/item/tool/plasma_torch/verb/switch_to_gun()
	set name = "Disable Safeties"
	set desc = "Disable the safeties, making the plasma torch able to shoot like a gun."
	set category = "Object"

	if(!gun) // Safety check if somehow there isn't a gun.
		gun = new /obj/item/gun/hydrogen/plasma_torch(src)
		gun.welder = src
	if(flask) // Give the gun the same flask the welder has, but only if there's a flask.
		gun.flask = flask // Link the flask to the gun
		flask.forceMove(gun) // Give the flask to the gun
		flask = null // The Welder got no more flasks
	usr.remove_from_mob(src) // Remove the welder from the user
	usr.put_in_hands(gun) // Put the gun in the user's hand
	src.forceMove(gun) // Move the welder into the gun
	usr.visible_message(
						SPAN_NOTICE("[usr] deactivate the safeties of the [src.name]."),
						SPAN_NOTICE("You deactivate the safeties of the [src.name].")
						)
