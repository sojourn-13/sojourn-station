/obj/item/clothing/glasses/powered/thermal
	name = "optical thermal scanner"
	desc = "Thermals in the shape of glasses."
	icon_state = "thermal"
	item_state = "glasses"
	action_button_name = "Toggle Optical Matrix"
	origin_tech = list(TECH_MAGNET = 3)
	vision_flags = SEE_MOBS
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	flash_protection = FLASH_PROTECTION_REDUCED
	price_tag = 500
	matter = list(MATERIAL_STEEL = 3, MATERIAL_GLASS = 2, MATERIAL_PLASTIC = 5, MATERIAL_DIAMOND = 2)
	tick_cost = 0.5

/obj/item/clothing/glasses/powered/thermal/emp_act(severity)
	if(ishuman(src.loc))
		var/mob/living/carbon/human/M = src.loc
		if(M.glasses == src)
			to_chat(M, SPAN_DANGER("[src] overloads and blinds you!"))
			M.eye_blind = 3
			M.eye_blurry = 5
			// Don't cure being nearsighted
			if(!(M.disabilities & NEARSIGHTED))
				M.disabilities |= NEARSIGHTED
				spawn(100)
					M.disabilities &= ~NEARSIGHTED
	..()

/obj/item/clothing/glasses/powered/thermal/Initialize()
	. = ..()
	screenOverlay = global_hud.thermal

/obj/item/clothing/glasses/powered/thermal/syndi	//These are now a contractor item, concealed as mesons.	-Pete
	name = "optical meson scanner"
	desc = "Used for seeing walls, floors, and stuff through anything."
	icon_state = "meson"
	off_state = "demeson"
	origin_tech = list(TECH_MAGNET = 3, TECH_ILLEGAL = 4)

/obj/item/clothing/glasses/powered/thermal/onestar
	name = "type-73 zhenchayuan goggles"
	desc = "Previously nothing more than a prototype, these Greyson Positronic thermal goggles are incredibly battery-efficient."
	icon_state = "onestar_thermal"
	off_state = "onestar_thermal"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_GLASS = 2, MATERIAL_PLASTIC = 5, MATERIAL_PLATINUM = 2) // GP tech all use platinum
	tick_cost = 0.25 // 400 ticks on a stock cell. Incredibly efficient due to being cutting edge tech, also justifies the research node rather than just taking syndie ones.

/obj/item/clothing/glasses/powered/thermal/plain
	toggleable = FALSE
	activation_sound = null
	action_button_name = null

/obj/item/clothing/glasses/powered/thermal/plain/monocle
	name = "thermonocle"
	desc = "A monocle with a thermal lens installed."
	icon_state = "thermoncle"
	flags = null //doesn't protect eyes because it's a monocle, duh

	body_parts_covered = 0

/obj/item/clothing/glasses/powered/thermal/plain/eyepatch
	name = "optical thermal eyepatch"
	desc = "An eyepatch with built-in thermal optics."
	icon_state = "eyepatch"
	item_state = "eyepatch"
	body_parts_covered = 0

/obj/item/clothing/glasses/powered/thermal/plain/jensen
	name = "optical thermal implants"
	desc = "A set of implantable lenses designed to augment your vision."
	icon_state = "thermalimplants"
	item_state = "syringe_kit"

/obj/item/clothing/glasses/powered/thermal/thermal_helmet
	name = "thermal imaging goggles"
	desc = "A pair of thermal goggles stuck to your helmet, has a slot for a medium battery inside."
	icon_state = "bulletproof_ironhammer_goggles_thermal"
	item_state = null
	off_state = "bulletproof_ironhammer_goggles_thermal"
	action_button_name = null
	toggleable = FALSE
	darkness_view = 7
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	flags = ABSTRACT
	suitable_cell = /obj/item/cell/medium
	spawn_with_cell = FALSE

	tick_cost = 1

/obj/item/clothing/glasses/powered/thermal/thermal_helmet/Initialize()
	. = ..()
	screenOverlay = global_hud.thermal
