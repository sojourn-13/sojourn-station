//The bullet scanner! Used for bullet holes and sharpnal

/obj/item/device/bullet_scanner
	name = "\improper Bullet Scanner"
	desc = "A small device used to scan bullet holes or laser marks to get more data on the gun that fired it."

	icon = 'icons/obj/device.dmi'
	icon_state = "ano_scanner"
	item_state = "lampgreen"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	origin_tech = list(TECH_MAGNET = 1, TECH_ENGINEERING = 1)
