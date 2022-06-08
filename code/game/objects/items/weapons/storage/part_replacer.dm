/obj/item/storage/part_replacer
	name = "rapid part exchange device"
	desc = "Special mechanical module made to store, sort, and exchange standard machine parts."
	icon_state = "RPED"
	item_state = "RPED"
	w_class = ITEM_SIZE_HUGE
	can_hold = list(/obj/item/stock_parts)
	storage_slots = 50
	use_to_pickup = TRUE
	allow_quick_gather = TRUE
	allow_quick_empty = TRUE
	collection_mode = TRUE
	display_contents_with_number = TRUE
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = 200
	matter = list(MATERIAL_PLASTIC = 5, MATERIAL_STEEL = 2)

/obj/item/storage/part_replacer/mini
	name = "compact rapid part exchange device"
	desc = "A special mechanical module made to store, sort, and exchange standard machine parts. This one is compact, making it easier to transport, but holds less."
	icon_state = "RPEDMINI"
	item_state = "RPED"
	w_class = ITEM_SIZE_NORMAL
	storage_slots = 20
	max_storage_space = 80
	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_STEEL = 2)