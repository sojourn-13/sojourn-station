/obj/item/stack/ichor/purging_ichor
	name = "purging ichor"
	singular_name = "Dose"
	desc = "A thin glob of green fluid used for purging toxins from the body."
	icon = 'icons/obj/stack/items.dmi'
	icon_state = "purging_ichor"
	matter = list(MATERIAL_BIOMATTER = 2)
	origin_tech = list(TECH_MATERIAL = 4, TECH_ENGINEERING = 3)
	amount = 5
	w_class = ITEM_SIZE_SMALL //just so you can place same places that a brute pack would be
	price_tag = 0