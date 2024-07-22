/obj/item/clothing/suit/storage/toggle/labcoat
	name = "labcoat"
	desc = "A suit that protects against minor chemical spills."
	icon_state = "labcoat_open"
	item_state = "labcoat" //Is this even used for anything?
	icon_open = "labcoat_open"
	icon_closed = "labcoat"
	icon_drape = "labcoat_drip"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(
		melee = 0,
		bullet = 0,
		bomb = 0,
		bio = 50,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/toggle/labcoat/poofy
	name = "formal labcoat"
	desc = "A longer labcoat that protects against minor chemical spills."
	icon_state = "labcoat_formal_open"
	item_state = "labcoat_formal" //Is this even used for anything?
	icon_open = "labcoat_formal_open"
	icon_closed = "labcoat_formal"
	icon_drape = null

/obj/item/clothing/suit/storage/toggle/labcoat/cmo
	name = "biolab overseer's labcoat"
	desc = "Bluer than the standard model."
	icon_state = "labcoat_cmo_open"
	item_state = "labcoat_cmo"
	icon_open = "labcoat_cmo_open"
	icon_closed = "labcoat_cmo"
	icon_drape = null

/obj/item/clothing/suit/storage/toggle/labcoat/chemist
	name = "soteria chemist labcoat"
	desc = "A suit that protects against minor chemical spills. Has an orange stripe on the shoulder."
	icon_state = "labcoat_chem_open"
	icon_open = "labcoat_chem_open"
	icon_closed = "labcoat_chem"
	icon_drape = null

/obj/item/clothing/suit/storage/toggle/labcoat/virologist
	name = "soteria virologist labcoat"
	desc = "A suit that protects against minor chemical spills. Offers slightly more protection against biohazards than the standard model. Has a green stripe on the shoulder."
	icon_state = "labcoat_medspec_open"
	icon_open = "labcoat_medspec_open"
	icon_closed = "labcoat_medspec"
	icon_drape = null
	armor_list = list(
		melee = 0,
		bullet = 0,
		bomb = 0,
		bio = 75,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/toggle/labcoat/science
	name = "soteria scientist labcoat"
	desc = "A suit that protects against minor chemical spills. Has a purple stripe on the shoulder."
	icon_state = "labcoat_tox_open"
	icon_open = "labcoat_tox_open"
	icon_closed = "labcoat_tox"
	icon_drape = null

/obj/item/clothing/suit/storage/toggle/labcoat/medspec
	name = "soteria specialist's labcoat"
	desc = "A suit that protects against minor chemical spills. This one has marks of security."
	icon_state = "labcoat_medspec_open"
	item_state = "labcoat_medspec"
	icon_open = "labcoat_medspec_open"
	icon_closed = "labcoat_medspec"
	icon_drape = null

/obj/item/clothing/suit/storage/membrane
	name = "membrane labcoat"
	desc = "A longer labcoat with buttons on the side. It has a significantly larger collar than the standard lab coat, to help protect your face from your mistakes."
	icon_state = "labcoat_membrane"
	item_state = "labcoat_membrane" //Is this even used for anything?
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|ARMS
	armor_list = list(
		melee = 0,
		bullet = 0,
		bomb = 0,
		bio = 50,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/suit/storage/toggle/labcoat/purple
	name = "purple labcoat"
	desc = "A normal labcoat with purple highlights. It seems to have a patch removed from its back, the company it belonged to long lost to time."
	icon_state = "purple_labcoat"
	item_state = "purple_labcoat"
	icon_open = "purple_labcoat_open"
	icon_closed = "purple_labcoat"
	icon_drape = null

//Sprites by dromkii
/obj/item/clothing/suit/storage/toggle/labcoat/field
	name = "SI Field Labcoat"
	desc = "Specially made for protecting men and women of science in the dangerous wilds of Amethyn, this labcoat features lightweight armor inlays over strategic locations to protect vital organs. \
	Features an assortment of pouches and straps to secure your samples for extraction."
	icon_state = "si_plasticoat"
	item_state = "si_plasticoat"
	icon_open = "si_plasticoat_open"
	icon_closed = "si_plasticoat"
	icon_drape = null
	permeability_coefficient = 0.50 //It's a plastic labcoat, it protects well against chemical spills
	siemens_coefficient = 0.60 //Default for all armor
	body_parts_covered = UPPER_TORSO|ARMS|LOWER_TORSO|LEGS
	tool_qualities = list(QUALITY_ARMOR = 100)
	matter = list(MATERIAL_STEEL = 5, MATERIAL_GLASS = 5, MATERIAL_PLASTIC = 20)
	max_upgrades = 1
	armor_list = list(
		melee = 6,
		bullet = 5,
		energy = 6,
		bomb = 15,
		bio = 50,
		rad = 25
	)
	extra_allowed = list(
		/obj/item/storage/bag/fossils,
		/obj/item/storage/bag/xenobio,
		/obj/item/storage/bag/produce
	)

