
/*
 * Lunchbox
 */

/obj/item/storage/lunchbox
	name = "heart lunchbox"
	desc = "With love."
	icon_state = "lunchbox_heart"
	item_state = "lunchbox_heart"
	w_class = ITEM_SIZE_NORMAL
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = DEFAULT_NORMAL_STORAGE
	attack_verb = "lunched"
	price_tag = 5
	can_hold = list(
		/obj/item/reagent_containers/food,
		/obj/item/material/kitchen/utensil,
		/obj/item/tool/knife
		)

/obj/item/storage/lunchbox/rainbow
	name = "rainbow lunchbox"
	desc = "Rainbow bow."
	icon_state = "lunchbox_rainbow"
	item_state = "lunchbox_rainbow"

/obj/item/storage/lunchbox/cat
	name = "cat lunchbox"
	desc = "Meowbox."
	icon_state = "lunchbox_cat"
	item_state = "lunchbox_cat"

/obj/item/storage/lunchbox/lemniscate
	name = "church lunchbox"
	desc = "Because even the faithful need to eat."
	icon_state = "lemniscate"
	item_state = "lemniscate"

/obj/item/storage/lunchbox/lemniscate/full
	name = "lemniscate lunchbox"
	desc = "Because even the faithful need to eat. Comes with a special blend of highly helpful food stuffs packaged and meant to be shared."

/obj/item/storage/lunchbox/lemniscate/full/populate_contents()
	new /obj/item/reagent_containers/food/snacks/poppypretzel/holy(src)
	new /obj/item/reagent_containers/food/snacks/poppypretzel/holy(src)
	new /obj/item/reagent_containers/food/snacks/toastedsandwich/holy(src)
	new /obj/item/reagent_containers/food/snacks/toastedsandwich/holy(src)
	new /obj/item/reagent_containers/food/drinks/cans/cahors/lemniscate(src)
	new /obj/item/reagent_containers/food/drinks/cans/cahors/lemniscate(src)
