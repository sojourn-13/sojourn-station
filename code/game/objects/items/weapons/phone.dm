/obj/item/phone
	name = "dial phone"
	desc = "An old rotary dial phone. Who uses these anymore?"
	icon = 'icons/obj/items.dmi'
	icon_state = "red_phone"
	flags = CONDUCT
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_SMALL
	attack_verb = list("called", "rang")
	hitsound = 'sound/weapons/ring.ogg'
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 4)
	preloaded_reagents = list("plasticide" = 20, "copper" = 6, "silicon" = 10)
