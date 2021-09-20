/* Gifts and wrapping paper
 * Contains:
 *		Gifts
 *		Wrapping Paper
 */

/*
 * Gifts
 */
/obj/item/a_gift
	name = "gift"
	desc = "PRESENTS!!!! eek!"
	icon = 'icons/obj/items.dmi'
	icon_state = "gift1"
	item_state = "gift1"

/obj/item/a_gift/New()
	..()
	pixel_x = rand(-10,10)
	pixel_y = rand(-10,10)
	if(w_class < ITEM_SIZE_BULKY)
		icon_state = "gift[w_class]"
	else
		icon_state = "gift[pick(1, 2, 3)]"

/obj/item/a_gift/ex_act()
	qdel(src)
	return

/obj/item/a_gift/attack_self(mob/M as mob)
	var/gift_type = pick(
		/obj/item/storage/wallet,
		/obj/item/storage/photo_album,
		/obj/item/storage/box/snappops,
		/obj/item/storage/fancy/crayons,
		/obj/item/storage/backpack/holding,
		/obj/item/storage/belt/champion,
		/obj/item/soap/deluxe,
		/obj/item/pen/invisible,
//		/obj/item/lipstick/jade,
		/obj/item/grenade/smokebomb,
		/obj/item/corncob,
		/obj/item/contraband/poster,
		/obj/item/book/manual/barman_recipes,
		/obj/item/book/manual/chef_recipes,
		/obj/item/bikehorn,
		/obj/item/beach_ball,
		/obj/item/beach_ball/holoball,
		/obj/item/toy/junk/balloon,
		/obj/item/toy/junk/blink,
		/obj/item/toy/weapon/crossbow,
		/obj/item/gun/projectile/revolver/capgun,
		/obj/item/toy/weapon/katana,
		/obj/item/toy/figure/mecha/deathripley,
		/obj/item/toy/figure/mecha/durand,
		/obj/item/toy/figure/mecha/fireripley,
		/obj/item/toy/figure/mecha/gygax,
		/obj/item/toy/figure/mecha/honk,
		/obj/item/toy/figure/mecha/marauder,
		/obj/item/toy/figure/mecha/mauler,
		/obj/item/toy/figure/mecha/odysseus,
		/obj/item/toy/figure/mecha/phazon,
		/obj/item/toy/figure/mecha/ripley,
		/obj/item/toy/figure/mecha/seraph,
		/obj/item/toy/junk/spinningtoy,
		/obj/item/toy/weapon/sword,
		/obj/item/reagent_containers/food/snacks/grown/ambrosiadeus,
		/obj/item/reagent_containers/food/snacks/grown/ambrosiavulgaris,
		/obj/item/device/paicard,
		/obj/item/device/violin,
		/obj/item/storage/belt/utility/full,
		/obj/item/clothing/accessory/tie/yellow)

	if(!ispath(gift_type,/obj/item))	return

	var/obj/item/I = new gift_type(M)
	M.remove_from_mob(src)
	M.put_in_hands(I)
	I.add_fingerprint(M)
	qdel(src)
	return

/obj/item/gift
	name = "gift"
	desc = "A wrapped item."
	icon = 'icons/obj/items.dmi'
	icon_state = "gift3"
	var/size = 3.0
	var/obj/item/gift = null
	item_state = "gift"
	w_class = ITEM_SIZE_BULKY

/obj/item/gift/attack_self(mob/user as mob)
	user.drop_item()
	if(src.gift && (src.gift in src.contents))
		user.put_in_active_hand(gift)
		src.gift.add_fingerprint(user)
	else
		to_chat(user, SPAN_WARNING("The gift was empty!"))
	qdel(src)

/obj/effect/spresent/relaymove(mob/user as mob)
	if (user.stat)
		return
	to_chat(user, SPAN_WARNING("You can't move."))

/obj/effect/spresent/attackby(obj/item/W as obj, mob/user as mob)
	..()

	if (!istype(W, /obj/item/tool/wirecutters))
		to_chat(user, SPAN_WARNING("I need wirecutters for that."))
		return

	to_chat(user, SPAN_NOTICE("You cut open the present."))

	for(var/mob/M in src) //Should only be one but whatever.
		M.forceMove(loc)
	qdel(src)

/*
 * Wrapping Paper
 */
/obj/item/c_tube
	name = "cardboard tube"
	desc = "A tube... of cardboard."
	icon = 'icons/obj/items.dmi'
	icon_state = "c_tube"
	throwforce = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_CARDBOARD = 1)
	throw_speed = 4
	throw_range = 5

/obj/item/wrapping_paper
	name = "wrapping paper"
	desc = "You can use this to wrap items in."
	icon = 'icons/obj/items.dmi'
	icon_state = "wrap_paper"
	matter = list(MATERIAL_BIOMATTER = 4, MATERIAL_CARDBOARD = 1)
	var/amount = 20.0

/obj/item/wrapping_paper/attackby(obj/item/W as obj, mob/user as mob)
	..()
	if (!( locate(/obj/structure/table, src.loc) ))
		to_chat(user, SPAN_WARNING("You MUST put the paper on a table!"))
	if (W.w_class < ITEM_SIZE_BULKY)
		if ((istype(user.l_hand, /obj/item/tool/wirecutters) || istype(user.r_hand, /obj/item/tool/wirecutters)))
			var/a_used = 2 ** (src.w_class - 1)
			if (src.amount < a_used)
				to_chat(user, SPAN_WARNING("You need more paper!"))
				return
			else
				if(istype(W, /obj/item/smallDelivery) || istype(W, /obj/item/gift)) //No gift wrapping gifts!
					return

				src.amount -= a_used
				user.drop_item()
				var/obj/item/gift/G = new /obj/item/gift( src.loc )
				G.size = W.w_class
				G.w_class = G.size + 1
				G.icon_state = text("gift[]", G.size)
				G.gift = W
				W.loc = G
				G.add_fingerprint(user)
				W.add_fingerprint(user)
				src.add_fingerprint(user)
			if (src.amount <= 0)
				new /obj/item/c_tube( src.loc )
				qdel(src)
				return
		else
			to_chat(user, SPAN_WARNING("You need scissors!"))
	else
		to_chat(user, SPAN_WARNING("The object is FAR too large!"))
	return


/obj/item/wrapping_paper/examine(mob/user)
	if(..(user, 1))
		to_chat(user, text("There is about [] square units of paper left!", src.amount))

/obj/item/wrapping_paper/attack(mob/target as mob, mob/user as mob)
	if (!ishuman(target))
		return
	var/mob/living/carbon/human/H = target

	if (istype(H.wear_suit, /obj/item/clothing/suit/straight_jacket) || H.stat)
		if (src.amount > 2)
			var/obj/effect/spresent/present = new /obj/effect/spresent (H.loc)
			src.amount -= 2

			if (H.client)
				H.client.perspective = EYE_PERSPECTIVE
				H.client.eye = present

			H.loc = present

			H.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been wrapped with [src.name]  by [user.name] ([user.ckey])</font>")
			user.attack_log += text("\[[time_stamp()]\] <font color='red'>Used the [src.name] to wrap [H.name] ([H.ckey])</font>")
			msg_admin_attack("[key_name(user)] used [src] to wrap [key_name(H)]")

		else
			to_chat(user, SPAN_WARNING("You need more paper."))
	else
		to_chat(user, "They are moving around too much. A straitjacket would help.")
