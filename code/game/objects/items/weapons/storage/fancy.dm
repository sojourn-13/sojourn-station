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

/obj/item/storage/fancy/
	icon = 'icons/obj/food.dmi'
	icon_state = "donutbox6"
	name = "donut box"
	max_storage_space = 8
	var/icon_type = "donut"
	matter = list(MATERIAL_BIOMATTER = 1)

/obj/item/storage/fancy/update_icon(var/itemremoved = 0)
	var/total_contents = src.contents.len - itemremoved
	src.icon_state = "[src.icon_type]box[total_contents]"
	return

/obj/item/storage/fancy/examine(mob/user)
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

/obj/item/storage/fancy/egg_box
	icon = 'icons/obj/food.dmi'
	icon_state = "eggbox"
	icon_type = "egg"
	name = "egg box"
	storage_slots = 12
	can_hold = list(
		/obj/item/reagent_containers/snacks/egg,
		/obj/item/reagent_containers/snacks/boiledegg
		)

/obj/item/storage/fancy/egg_box/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/reagent_containers/snacks/egg(src)

//MRE food
/obj/item/storage/fancy/mre_cracker
	icon_state = "crackersbox"
	name = "enriched crackers pack"
	storage_slots = 5
	icon_type = "crackers"
	can_hold = list(
		/obj/item/reagent_containers/snacks/mre_cracker
		)

/obj/item/storage/fancy/mre_cracker/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/reagent_containers/snacks/mre_cracker(src)


//Kriosan treats

obj/item/storage/fancy/dogtreats
	icon_state = "dogtreat"
	name = "\improper packet of Kriosan treats"
	desc = "A small purple packet with a handful of Kriosan treats, a hardy snack well beloved by Kriosans the galaxy over."
	storage_slots = 4
	icon_type = "dogtreat"
	can_hold = list(
		/obj/item/reagent_containers/snacks/dogtreats
		)

obj/item/storage/fancy/dogtreats/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/reagent_containers/snacks/dogtreats(src)
	update_icon()

/obj/item/storage/fancy/dogtreats/update_icon()
	icon_state = "[initial(icon_state)][contents.len]"
	return

/*
 * Candle Box
 */

/obj/item/storage/fancy/candle_box
	name = "candle pack"
	desc = "A pack of red candles."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candlebox5"
	icon_type = "candle"
	item_state = "candlebox5"
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT
	can_hold = list(
		/obj/item/flame/candle
	)

/obj/item/storage/fancy/candle_box/populate_contents()
	for(var/i in 1 to 5)
		new /obj/item/flame/candle(src)

/*
 * Crayon Box
 */

/obj/item/storage/fancy/crayons
	name = "box of crayons"
	desc = "A box of crayons for all your rune drawing needs."
	icon = 'icons/obj/crayons.dmi'
	icon_state = "crayonbox"
	w_class = ITEM_SIZE_SMALL
	icon_type = "crayon"
	can_hold = list(
		/obj/item/pen/crayon
	)

/obj/item/storage/fancy/crayons/populate_contents()
	new /obj/item/pen/crayon/red(src)
	new /obj/item/pen/crayon/orange(src)
	new /obj/item/pen/crayon/yellow(src)
	new /obj/item/pen/crayon/green(src)
	new /obj/item/pen/crayon/blue(src)
	new /obj/item/pen/crayon/purple(src)
	update_icon()

/obj/item/storage/fancy/crayons/update_icon()
	cut_overlays() //resets list
	add_overlay(image('icons/obj/crayons.dmi',"crayonbox"))
	for(var/obj/item/pen/crayon/crayon in contents)
		add_overlay(image('icons/obj/crayons.dmi',crayon.colourName))

/obj/item/storage/fancy/crayons/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/pen/crayon))
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
/obj/item/storage/fancy/cigarettes
	name = "\improper Roach Eyes packet"
	desc = "A packet of six Roach Eyes cigarettes. The cheapest brand of smokes on the market favored by the type of people who see roaches of all sizes as often as they smoke."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "RoachEyesCigPacket"
	item_state = "RoachEyesCigPacket"
	w_class = ITEM_SIZE_TINY
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT
	storage_slots = 21 //6
	can_hold = list(/obj/item/clothing/mask/smokable/cigarette, /obj/item/flame/lighter)
	icon_type = "cigarette"
	reagent_flags = REFILLABLE | NO_REACT
	var/open = FALSE

/obj/item/storage/fancy/cigarettes/attack_self(mob/user)
	if(open)
		close_all()
	else
		..()
	update_icon()

/obj/item/storage/fancy/cigarettes/open(mob/user)
	. = ..()
	open = TRUE

/obj/item/storage/fancy/cigarettes/close_all()
	. = ..()
	if(contents.len)
		open = FALSE

/obj/item/storage/fancy/cigarettes/show_to(mob/user)
	. = ..()
	update_icon()

/obj/item/storage/fancy/cigarettes/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one

/obj/item/storage/fancy/cigarettes/update_icon()
//	icon_state = "[initial(icon_state)][contents.len]"
//	return
// 26.02.25 CFW - Crude fix to enable holding 21 cigarette
	if(contents.len > 6)
		icon_state = "[initial(icon_state)][6]"
	else	
		icon_state = "[initial(icon_state)][contents.len]"
	return


/obj/item/storage/fancy/cigarettes/remove_from_storage(obj/item/W as obj, atom/new_location)
	// Don't try to transfer reagents to lighters
	if(istype(W, /obj/item/clothing/mask/smokable/cigarette))
		var/obj/item/clothing/mask/smokable/cigarette/C = W
		reagents.trans_to_obj(C, (reagents.total_volume/contents.len))
	..()

/obj/item/storage/fancy/cigarettes/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
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

/obj/item/storage/fancy/cigarettes/ishimura
	name = "\improper Ishimura Special packet"
	desc = "A packet of six Ishimura Special cigarettes. A favored and common smoke among researchers and scientists, often considered the more refined choice for the social smoker."
	icon_state = "IshimuraSpecialCigPack"
	item_state = "IshimuraSpecialCigPack"

/obj/item/storage/fancy/cigarettes/ishimura/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/ishimura(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one


/obj/item/storage/fancy/cigarettes/tannhauser
	name = "\improper Tannhauser Gate packet"
	desc = "A packet of six Tannhauser Gate cigarettes. An often overlooked brand of smokes that rarely sells well with anyone who isn't quite old or quite cheap. Tastes like burning rusted metal but survives due to being the number one brand for spacers."
	icon_state = "TannhauserGateCigPacket"
	item_state = "TannhauserGateCigPacket"

/obj/item/storage/fancy/cigarettes/tannhauser/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/tannhauser(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one


/obj/item/storage/fancy/cigarettes/brouzouf
	name = "\improper Brouzouf Message packet"
	desc = "A packet of six Brouzouf Message cigarettes. You gain Brouzouf. Your legs are OK."
	icon_state = "BrouzoufMessageCigPacket"
	item_state = "BrouzoufMessageCigPacket"

/obj/item/storage/fancy/cigarettes/brouzouf/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/brouzouf(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one


/obj/item/storage/fancy/cigarettes/frozen
	name = "\improper Frozen Nova packet"
	desc = "A packet of six Frozen Nova cigarettes. A popular brand for frontier mercenaries and soldiers, often traded commonly by pirates for its deep throat scratching taste."
	icon_state = "FrozenNovaCigPack"
	item_state = "FrozenNovaCigPack"

/obj/item/storage/fancy/cigarettes/frozen/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/frozen(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one


/obj/item/storage/fancy/cigarettes/shodan
	name = "\improper Shodans packet"
	desc = "A packet of six Shodans cigarettes. Smokes often used by those with cybernetic implants in body and brain as its said it relaxes the synapse connections, though it is commonly said that is just marketing speak."
	icon_state = "ShodansCigPacket"
	item_state = "ShodansCigPacket"

/obj/item/storage/fancy/cigarettes/shodan/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/shodan(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one


/obj/item/storage/fancy/cigarettes/toha
	name = "\improper TOHA Heavy Industries packet"
	desc = "A packet of six TOHA Heavy Industries cigarettes. The pack of choice for the engineer, the mechanic, and the technician. A special import as requested by many in the Artificer's Guild with a price to match."
	icon_state = "TOHAHeavyIndustriesCigPacket"
	item_state = "TOHAHeavyIndustriesCigPacket"

/obj/item/storage/fancy/cigarettes/toha/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/toha(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one


/obj/item/storage/fancy/cigarettes/fortress
	name = "\improper Fortress Classic packet"
	desc = "A packet of six Fortress Classic cigarettes. A standard classic pack that many smokers start with, often in the teen years, reasonably priced and well liked."
	icon_state = "cigpacket"
	item_state = "cigpacket"

/obj/item/storage/fancy/cigarettes/fortress/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/fortress(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one


/obj/item/storage/fancy/cigarettes/fortressred
	name = "\improper Fortress RED lights packet"
	desc = "A packet of six Fortress RED light cigarettes. A standard classic pack for the smoker that wants to kick his habit at his own pace. Has a cherry taste."
	icon_state = "Dpacket"
	item_state = "Dpacket"

/obj/item/storage/fancy/cigarettes/fortressred/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/fortressred(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one


/obj/item/storage/fancy/cigarettes/fortressblue
	name = "\improper Fortress BLU menthol packet"
	desc = "A packet of six Fortress BLU menthol cigarettes. A standard classic pack that for the smoker that prefers a cool minty taste."
	icon_state = "Bpacket"
	item_state = "Bpacket"

/obj/item/storage/fancy/cigarettes/fortressblue/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/fortressblue(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one

/obj/item/storage/fancy/cigarettes/khi
	name = "\improper Hippie's Delight packet"
	desc = "A packet of six Hippie's Delight cigarettes. A brand of cigarettes favorited by those whom live in Astrovans on public and private beaches everywhere. CAUTION: Contents may contain chemicals unsuitable for some people. Ride the wave, surf's up bro!"
	icon_state = "KhiCigPacket"
	item_state = "KhiCigPacket"

/obj/item/storage/fancy/cigarettes/khi/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/khi(src)
	create_reagents(20 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one

/obj/item/storage/fancy/cigarettes/comred
	name = "\improper ComRed packet"
	desc = "A packet of six ComRed cigarettes. Smokes for the when the workers are free."
	icon_state = "ComRedCigPack"
	item_state = "ComRedCigPack"

/obj/item/storage/fancy/cigarettes/comred/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/comred(src)
	create_reagents(15 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one

/obj/item/storage/fancy/cigarettes/lonestar
	name = "\improper LoneStar packet"
	desc = "A packet of six LoneStar cigarettes. Locally grown, rolled, and smoked only by the cheapest of colonists."
	icon_state = "LoneStarCigPack"
	item_state = "LoneStarCigPack"

/obj/item/storage/fancy/cigarettes/lonestar/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/lonestar(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one

/obj/item/storage/fancy/cigarettes/faith
	name = "\improper TempleOS packet"
	desc = "A packet of six TempleOS cigarettes. A proper brand for those of faith and those who want to see Sol-fed agents glowing in the dark."
	icon_state = "FaithsCigPacket"
	item_state = "FaithsCigPacket"

/obj/item/storage/fancy/cigarettes/faith/populate_contents()
	new /obj/item/clothing/mask/smokable/cigarette/faith(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/blue(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/red(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/yellow(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/green(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/orange(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/blue(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/red(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/yellow(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/green(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/orange(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/blue(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/red(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/yellow(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/green(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/orange(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/blue(src)
	new /obj/item/clothing/mask/smokable/cigarette/faith/red(src)
	create_reagents(10 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one

/obj/item/storage/fancy/cigar
	name = "cigar case"
	desc = "A case for holding your cigars when you are not smoking them, made of steel and designed to hold only classy cigars. Fancy!"
	icon_state = "cigarcase"
	item_state = "cigarcase"
	icon = 'icons/obj/cigarettes.dmi'
	w_class = ITEM_SIZE_TINY
	throwforce = WEAPON_FORCE_HARMLESS
	slot_flags = SLOT_BELT
	storage_slots = 6
	can_hold = list(/obj/item/clothing/mask/smokable/cigarette/cigar)
	icon_type = "cigar"
	reagent_flags = REFILLABLE | NO_REACT
	var/open = FALSE

/obj/item/storage/fancy/cigar/can_interact(mob/user, require_adjacent_turf = TRUE, show_message = TRUE)
	if((!ishuman(user) && (loc != user)) || user.stat || user.restrained())
		return 1
	if(istype(loc, /obj/item/storage))
		return 2
	return 0

/obj/item/storage/fancy/cigar/verb/quick_open_close(mob/user)
	set name = "Close cigar case"
	set category = "Object"
	set src in view(1)
	if(!is_worn())
		if(can_interact(user) == 1)	//can't use right click verbs inside bags so only need to check for ablity
			return

		open_close(user)
	else
		to_chat(user, SPAN_NOTICE("You can\'t open \the [src] while it\'s equipped!"))

/obj/item/storage/fancy/cigar/AltClick(mob/user)
	if(!is_worn())
		var/able = can_interact(user)

		if(able == 1)
			return

		if(able == 2)
			to_chat(user, SPAN_NOTICE("You cannot open \the [src] while it\'s in a container."))
			return

		open_close(user)
	else
		to_chat(user, SPAN_NOTICE("You can\'t open \the [src] while it\'s equipped!"))

/obj/item/storage/fancy/cigar/proc/open_close(mob/living/carbon/human/H, user)
	close_all()
	if(!is_worn())
		if(!open)
			to_chat(user, SPAN_NOTICE("You open \the [src]."))
			w_class = ITEM_SIZE_SMALL
			open = TRUE
		else
			to_chat(user, SPAN_NOTICE("You close \the [src]."))
			w_class = ITEM_SIZE_TINY
			open = FALSE
		playsound(loc, 'sound/machines/click.ogg', 100, 1)
		update_icon()
	else
		to_chat(user, SPAN_NOTICE("You can\'t open \the [src] while it\'s equipped!"))

obj/item/storage/fancy/cigar/attackby(obj/item/W, mob/user)
	if(!open)
		to_chat(user, SPAN_NOTICE("You try to access \the [src] but it\'s closed!"))
		return
	. = ..()

/obj/item/storage/fancy/cigar/open(mob/user)
	if(!open)
		to_chat(user, SPAN_NOTICE("\The [src] is closed."))
		return

	. = ..()

/obj/item/storage/fancy/cigar/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/clothing/mask/smokable/cigarette/cigar(src)
	create_reagents(15 * storage_slots)
	update_icon()

/obj/item/storage/fancy/cigar/attack_self(mob/user)
	if(open)
		close_all()
	else
		..()
	update_icon()

/obj/item/storage/fancy/cigar/open(mob/user)
	. = ..()
	open = TRUE

/obj/item/storage/fancy/cigar/close_all()
	. = ..()
	if(contents.len)
		open = FALSE

/obj/item/storage/fancy/cigar/show_to(mob/user)
	. = ..()
	update_icon()

/obj/item/storage/fancy/cigar/update_icon()
	if(open)
		icon_state = "[initial(icon_state)][contents.len]"
	else
		icon_state = "cigarcase"
	return

/obj/item/storage/fancy/cigar/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!ismob(M))
		return

	if(M == user && user.targeted_organ == BP_MOUTH)
		// Find ourselves a cig. Note that we could be full of lighters.
		var/obj/item/clothing/mask/smokable/cigarette/cigar/cig = locate() in src

		if(!cig)
			to_chat(user, SPAN_NOTICE("Looks like the packet is out of cigars."))
			return

		user.equip_to_slot_if_possible(cig, slot_wear_mask)
	else
		..()

/obj/item/storage/fancy/cigar/can_be_inserted(obj/item/W, stop_messages = 0)
	if(!open)
		to_chat(usr, SPAN_WARNING("Open [src] first!"))
		return FALSE
	return ..()

/obj/item/storage/fancy/cigar/remove_from_storage(obj/item/W as obj, atom/new_location)
		// Don't try to transfer reagents to lighters
	if(istype(W, /obj/item/clothing/mask/smokable/cigarette/cigar))
		var/obj/item/clothing/mask/smokable/cigarette/cigar/C = W
		reagents.trans_to_obj(C, (reagents.total_volume/contents.len))
	..()

/*
 * Vial Box
 */

/obj/item/storage/fancy/vials
	icon = 'icons/obj/vialbox.dmi'
	icon_state = "vialbox6"
	icon_type = "vial"
	name = "vial storage box"
	storage_slots = 6
	can_hold = list(/obj/item/reagent_containers/glass/beaker/vial)


/obj/item/storage/fancy/vials/populate_contents()
	for(var/i in 1 to storage_slots)
		new /obj/item/reagent_containers/glass/beaker/vial(src)

/obj/item/storage/lockbox/vials
	name = "secure vial storage box"
	desc = "A locked box for keeping things away from children."
	icon = 'icons/obj/vialbox.dmi'
	icon_state = "vialbox0"
	item_state = "syringe_kit"
	max_w_class = ITEM_SIZE_SMALL
	can_hold = list(/obj/item/reagent_containers/glass/beaker/vial)
	max_storage_space = 12 //The sum of the w_classes of all the items in this storage item.
	storage_slots = 6
	req_access = list(access_virology)

/obj/item/storage/lockbox/vials/Initialize()
	. = ..()
	update_icon()

/obj/item/storage/lockbox/vials/update_icon(var/itemremoved = 0)
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

/obj/item/storage/lockbox/vials/attackby(obj/item/W as obj, mob/user as mob)
	..()
	update_icon()

/*
 * Box of Chocolates/Heart Box
 */

/obj/item/storage/fancy/heartbox
	icon_state = "heartbox"
	name = "box of chocolates"
	icon_type = "chocolate"
	var/startswith = 6
	max_storage_space = 6
	max_w_class = ITEM_SIZE_SMALL
	can_hold = list(
		/obj/item/reagent_containers/snacks/chocolatepiece,
		/obj/item/reagent_containers/snacks/chocolatepiece/white,
		/obj/item/reagent_containers/snacks/chocolatepiece/truffle
		)

/obj/item/storage/fancy/heartbox/New()
	..()
	new /obj/item/reagent_containers/snacks/chocolatepiece(src)
	new /obj/item/reagent_containers/snacks/chocolatepiece(src)
	new /obj/item/reagent_containers/snacks/chocolatepiece(src)
	new /obj/item/reagent_containers/snacks/chocolatepiece/white(src)
	new /obj/item/reagent_containers/snacks/chocolatepiece/white(src)
	new /obj/item/reagent_containers/snacks/chocolatepiece/truffle(src)
	update_icon()

/obj/item/storage/fancy/heartbox/Initialize()
	. = ..()
	update_icon()

/obj/item/storage/fancy/heartbox/update_icon(var/itemremoved = 0)
	if (contents.len == 0)
		icon_state = "heartbox_empty"
