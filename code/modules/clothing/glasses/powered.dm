/obj/item/clothing/glasses/powered
	name = "powered goggles"
	desc = "A set of generic powered goggles."
	icon_state = "night"
	item_state = "glasses"
	action_button_name = "Toggle Optical Matrix"
	toggleable = TRUE
	prescription = TRUE
	active = FALSE
	var/tick_cost = 1
	var/obj/item/weapon/cell/cell = null
	var/suitable_cell = /obj/item/weapon/cell/small

/obj/item/clothing/glasses/powered/Initialize()
	. = ..()
	if(!cell && suitable_cell)
		cell = new /obj/item/weapon/cell/small(src)

/obj/item/clothing/glasses/powered/Process()
	if(active)
		if(!cell || !cell.checked_use(tick_cost))
			if(ismob(src.loc))
				to_chat(src.loc, SPAN_WARNING("[src] shut down."))
			toggle(ismob(loc) && loc, FALSE)

/obj/item/clothing/glasses/powered/get_cell()
	return cell

/obj/item/clothing/glasses/powered/handle_atom_del(atom/A)
	..()
	if(A == cell)
		cell = null

/obj/item/clothing/glasses/powered/toggle(mob/user, new_state)
	if(new_state)
		if(!cell || !cell.check_charge(tick_cost) && user)
			to_chat(user, SPAN_WARNING("[src] battery is dead or missing."))
			return
	..(user, new_state)

/obj/item/clothing/glasses/powered/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
		cell = null

/obj/item/clothing/glasses/powered/attackby(obj/item/C, mob/living/user)
	if(istype(C, suitable_cell) && !cell && insert_item(C, user))
		src.cell = C

/obj/item/clothing/glasses/powered/science
	name = "science goggles"
	desc = "Powered goggles with access to the scientific hud."
	icon_state = "purple"
	item_state = "glasses"

	tick_cost = 0.1

/obj/item/clothing/glasses/powered/science/Initialize()
	. = ..()
	screenOverlay = global_hud.science

/obj/item/clothing/glasses/powered/meson
	name = "optical meson scanner"
	desc = "Used for seeing walls, floors, and stuff through anything."
	icon_state = "meson"
	item_state = "glasses"
	off_state = "demeson"
	vision_flags = SEE_TURFS
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	origin_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_GLASS = 1)
	price_tag = 250

	tick_cost = 0.1

/obj/item/clothing/glasses/powered/meson/Initialize()
	. = ..()
	screenOverlay = global_hud.meson

/obj/item/clothing/glasses/powered/night
	name = "night vision goggles"
	desc = "Powered goggles that pierce through the darkness."
	icon_state = "night"
	item_state = "glasses"
	darkness_view = 7
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	off_state = "denight"
	origin_tech = list(TECH_MAGNET = 2)
	price_tag = 250

	tick_cost = 1

/obj/item/clothing/glasses/powered/night/Initialize()
	. = ..()
	screenOverlay = global_hud.nvg


