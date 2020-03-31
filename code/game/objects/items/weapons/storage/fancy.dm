/*
 * The 'fancy' path is for objects like donut boxes that show how many items are in the storage item on the sprite itself
 * .. Sorry for the shitty path name, I couldnt think of a better one.
 *
 * WARNING: var/icon_type is used for both examine text and sprite name. Please look at the procs below and adjust your sprite names accordingly
 *		TODO: Cigarette boxes should be ported to this standard
 *
 * Contains:
 *		Donut Box
 *		Egg Box
 *		Candle Box
 *		Crayon Box
 *		Cigarette Box
 *		MRE containers
 */

/obj/item/weapon/storage/fancy/
	icon = 'icons/obj/food.dmi'
	icon_state = "donutbox6"
	name = "donut box"
	max_storage_space = 8
	var/icon_type = "donut"

/obj/item/weapon/storage/fancy/update_icon(var/itemremoved = 0)
	var/total_contents = src.contents.len - itemremoved
	src.icon_state = "[src.icon_type]box[total_contents]"
	return

/obj/item/weapon/storage/fancy/examine(mob/user)
	if(!..(user, 1))
		return

	if(contents.len <= 0)
		to_chat(user, "There are no [src.icon_type]s left in the box.")
	else if(contents.len == 1)
		to_chat(user, "There is one [src.icon_type] left in the box.")
	else
		to_chat(user, "There are [src.contents.len] [src.icon_type]s in the box.")

	return

/*
 * Egg Box
 */

/obj/item/weapon/storage/fancy/egg_box
	icon = 'icons/obj/food.dmi'
	icon_state = "eggbox"
	icon_type = "egg"
	name = "egg box"
	storage_slots = 12
	can_hold = list(
		/obj/item/weapon/reagent_containers/food/snacks/egg,
		/obj/item/weapon/reagent_containers/food/snacks/boiledegg
		)

/obj/item/weapon/storage/fancy/egg_box/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/weapon/reagent_containers/food/snacks/egg(src)

//MRE food
/obj/item/weapon/storage/fancy/mre_cracker
	icon_state = "crackersbox"
	name = "enriched crackers pack"
	storage_slots = 5
	icon_type = "crackers"
	can_hold = list(
		/obj/item/weapon/reagent_containers/food/snacks/mre_cracker
		)

/obj/item/weapon/storage/fancy/mre_cracker/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/weapon/reagent_containers/food/snacks/mre_cracker(src)

/*
 * Candle Box
 */

/obj/item/weapon/storage/fancy/candle_box
	name = "candle pack"
	desc = "A pack of red candles."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candlebox5"
	icon_type = "candle"
	item_state = "candlebox5"
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT


/obj/item/weapon/storage/fancy/candle_box/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/weapon/flame/candle(src)

/*
 * Crayon Box
 */

/obj/item/weapon/storage/fancy/crayons
	name = "box of crayons"
	desc = "A box of crayons for all your rune drawing needs."
	icon = 'icons/obj/crayons.dmi'
	icon_state = "crayonbox"
	w_class = ITEM_SIZE_SMALL
	icon_type = "crayon"
	can_hold = list(
		/obj/item/weapon/pen/crayon
	)

/obj/item/weapon/storage/fancy/crayons/populate_contents()
	new /obj/item/weapon/pen/crayon/red(src)
	new /obj/item/weapon/pen/crayon/orange(src)
	new /obj/item/weapon/pen/crayon/yellow(src)
	new /obj/item/weapon/pen/crayon/green(src)
	new /obj/item/weapon/pen/crayon/blue(src)
	new /obj/item/weapon/pen/crayon/purple(src)
	update_icon()

/obj/item/weapon/storage/fancy/crayons/update_icon()
	cut_overlays() //resets list
	add_overlay(image('icons/obj/crayons.dmi',"crayonbox"))
	for(var/obj/item/weapon/pen/crayon/crayon in contents)
		add_overlay(image('icons/obj/crayons.dmi',crayon.colourName))

/obj/item/weapon/storage/fancy/crayons/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/pen/crayon))
		switch(W:colourName)
			if("mime")
				to_chat(usr, "This crayon is too sad to be contained in this box.")
				return
			if("rainbow")
				to_chat(usr, "This crayon is too powerful to be contained in this box.")
				return
	..()

////////////
//CIG PACK//
////////////
/obj/item/weapon/storage/fancy/cigarettes
	name = "Kholat Pass packet"
	desc = "A packet of six Kholat Pass cigarettes."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "cigpacket"
	item_state = "cigpacket"
	w_class = ITEM_SIZE_TINY
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT
	storage_slots = 6
	can_hold = list(/obj/item/clothing/mask/smokable/cigarette, /obj/item/weapon/flame/lighter)
	icon_type = "cigarette"
	reagent_flags = REFILLABLE | NO_REACT

/obj/item/weapon/storage/fancy/cigarettes/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette(src)
	create_reagents(15 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one

/obj/item/weapon/storage/fancy/cigarettes/update_icon()
	icon_state = "[initial(icon_state)][contents.len]"
	return

/obj/item/weapon/storage/fancy/cigarettes/remove_from_storage(obj/item/W as obj, atom/new_location)
	// Don't try to transfer reagents to lighters
	if(istype(W, /obj/item/clothing/mask/smokable/cigarette))
		var/obj/item/clothing/mask/smokable/cigarette/C = W
		reagents.trans_to_obj(C, (reagents.total_volume/contents.len))
	..()

/obj/item/weapon/storage/fancy/cigarettes/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!ismob(M))
		return

	if(M == user && user.targeted_organ == BP_MOUTH)
		// Find ourselves a cig. Note that we could be full of lighters.
		var/obj/item/clothing/mask/smokable/cigarette/cig = locate() in src

		if(!cig)
			to_chat(user, SPAN_NOTICE("Looks like the packet is out of cigarettes."))
			return

		user.equip_to_slot_if_possible(cig, slot_wear_mask)
	else
		..()

/obj/item/weapon/storage/fancy/cigarettes/oblast
	name = "\improper Oblast Gold packet"
	desc = "A packet of six Kholat Pass cigarettes."
	icon_state = "cigpacket"
	item_state = "cigpacket"

/obj/item/weapon/storage/fancy/cigarettes/volga
	name = "\improper Volga Imported packet"
	desc = "A packet of six Volga Imported cigarettes."
	icon_state = "Bpacket"
	item_state = "Bpacket"

/obj/item/weapon/storage/fancy/cigarettes/lena
	name = "\improper Lena Sunrise packet"
	desc = "A packet of six Lena Sunrise cigarettes."
	icon_state = "Bpacket"
	item_state = "Bpacket"

/obj/item/weapon/storage/fancy/cigarettes/severnaya
	name = "\improper Severnaya Special packet"
	desc = "A packet of six Severnaya Special cigarettes."
	icon_state = "Dpacket"
	item_state = "Dpacket"

/obj/item/weapon/storage/fancy/cigarettes/federal
	name = "\improper Federal Star packet"
	desc = "A packet of six Federal Star cigarettes."
	icon_state = "Dpacket"
	item_state = "Dpacket"

/obj/item/weapon/storage/fancy/cigar
	name = "cigar case"
	desc = "A case for holding your cigars when you are not smoking them."
	icon_state = "cigarcase"
	item_state = "cigarcase"
	icon = 'icons/obj/cigarettes.dmi'
	w_class = ITEM_SIZE_TINY
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT
	storage_slots = 7
	can_hold = list(/obj/item/clothing/mask/smokable/cigarette/cigar)
	icon_type = "cigar"
	reagent_flags = REFILLABLE | NO_REACT

/obj/item/weapon/storage/fancy/cigar/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/cigar(src)
	create_reagents(15 * storage_slots)
	update_icon()

/obj/item/weapon/storage/fancy/cigar/update_icon()
	icon_state = "[initial(icon_state)][contents.len]"

/obj/item/weapon/storage/fancy/cigar/remove_from_storage(obj/item/W as obj, atom/new_location)
		var/obj/item/clothing/mask/smokable/cigarette/cigar/C = W
		if(!istype(C)) return
		reagents.trans_to_obj(C, (reagents.total_volume/contents.len))
		..()

/*
 * Vial Box
 */

/obj/item/weapon/storage/fancy/vials
	icon = 'icons/obj/vialbox.dmi'
	icon_state = "vialbox6"
	icon_type = "vial"
	name = "vial storage box"
	storage_slots = 6
	can_hold = list(/obj/item/weapon/reagent_containers/glass/beaker/vial)


/obj/item/weapon/storage/fancy/vials/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/weapon/reagent_containers/glass/beaker/vial(src)

/obj/item/weapon/storage/lockbox/vials
	name = "secure vial storage box"
	desc = "A locked box for keeping things away from children."
	icon = 'icons/obj/vialbox.dmi'
	icon_state = "vialbox0"
	item_state = "syringe_kit"
	max_w_class = ITEM_SIZE_SMALL
	can_hold = list(/obj/item/weapon/reagent_containers/glass/beaker/vial)
	max_storage_space = 12 //The sum of the w_classes of all the items in this storage item.
	storage_slots = 6
	req_access = list(access_virology)

/obj/item/weapon/storage/lockbox/vials/Initialize()
	. = ..()
	update_icon()

/obj/item/weapon/storage/lockbox/vials/update_icon(var/itemremoved = 0)
	var/total_contents = src.contents.len - itemremoved
	src.icon_state = "vialbox[total_contents]"
	src.cut_overlays()
	if (!broken)
		add_overlay(image(icon, src, "led[locked]"))
		if(locked)
			add_overlay(image(icon, src, "cover"))
	else
		add_overlay(image(icon, src, "ledb"))
	return

/obj/item/weapon/storage/lockbox/vials/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	update_icon()

/*
 * Box of Chocolates/Heart Box
 */

/obj/item/weapon/storage/fancy/heartbox
	icon_state = "heartbox"
	name = "box of chocolates"
	icon_type = "chocolate"
	var/startswith = 6
	max_storage_space = 6
	max_w_class = ITEM_SIZE_SMALL
	can_hold = list(
		/obj/item/weapon/reagent_containers/food/snacks/chocolatepiece,
		/obj/item/weapon/reagent_containers/food/snacks/chocolatepiece/white,
		/obj/item/weapon/reagent_containers/food/snacks/chocolatepiece/truffle
		)

/obj/item/weapon/storage/fancy/heartbox/New()
	..()
	new /obj/item/weapon/reagent_containers/food/snacks/chocolatepiece(src)
	new /obj/item/weapon/reagent_containers/food/snacks/chocolatepiece(src)
	new /obj/item/weapon/reagent_containers/food/snacks/chocolatepiece(src)
	new /obj/item/weapon/reagent_containers/food/snacks/chocolatepiece/white(src)
	new /obj/item/weapon/reagent_containers/food/snacks/chocolatepiece/white(src)
	new /obj/item/weapon/reagent_containers/food/snacks/chocolatepiece/truffle(src)
	update_icon()

/obj/item/weapon/storage/fancy/heartbox/Initialize()
	. = ..()
	update_icon()

/obj/item/weapon/storage/fancy/heartbox/update_icon(var/itemremoved = 0)
	if (contents.len == 0)
		icon_state = "heartbox_empty"
