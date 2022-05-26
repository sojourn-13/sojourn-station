//This is fancy! We want to have THIS be used to draw and deal everything
/obj/item/cardholder
	w_class = ITEM_SIZE_SMALL
	name = "randomizer card box"
	desc = "A small box that self shuffles every time a card is added or drawn, making it always random. This only fits and works with CardCarpCo Cards. Alt Click to draw a card."
	icon = 'modular_sojourn/cardgame_2/cardgame_sprites.dmi'
	icon_state = "card_holder"
	var/obj/item/card_carp/card_target = null //What card were going to get
	var/endless = FALSE //Are we going to give endless cards?
	var/card_eater = FALSE

/obj/item/cardholder/AltClick(mob/user)
	draw_card()
	return

/obj/item/cardholder/proc/draw_card(mob/user)
	var/turf/T = get_turf(src)
	if(endless)
		new card_target(T)
		return
	if(!contents)
		to_chat(user, SPAN_NOTICE("The [src] has no cards."))
		return
	else
		card_target = pick(contents)
		card_target.loc = T
		card_target = /obj/item/card_carp //so we have vars

/obj/item/cardholder/attackby(obj/item/C, mob/user as mob)
	..()
	if(istype(C, /obj/item/card_carp))
		var/obj/item/card_carp/card = C
		if(card_eater) //Putting squirls back in their box
			user.visible_message(SPAN_NOTICE("[user] puts \the [card] into \the [src]."), SPAN_NOTICE("You put \the [card] into \the [src]."))
			qdel(card)
			return
		if(card.cant_box && endless) //Putting squirls back in their box
			user.visible_message(SPAN_NOTICE("[user] puts \the [card] into \the [src]."), SPAN_NOTICE("You put \the [card] into \the [src]."))
			qdel(card)
			return
		if(card.cant_box || endless)
			to_chat(user, SPAN_NOTICE("The [src] rejects \the [card]."))
			return
		else
			user.remove_from_mob(card)
			src.contents += card
			user.visible_message(SPAN_NOTICE("[user] puts \the [card] into \the [src]."), SPAN_NOTICE("You put \the [card] into \the [src]."))
		return


/obj/item/cardholder/squirl
	name = "squirrel card box"
	desc = "A box of cards that only have squirrel CarpCarpCo Cards. The standard side deck for most players."
	card_target =  /obj/item/card_carp/squirl
	icon_state = "folly_deck"
	endless = TRUE

/obj/item/cardholder/rabbit
	name = "rabbit card box"
	desc = "A box of cards that only have rabbit CarpCarpCo Cards. The second most commonly used side deck for most players, rabbits are H1/P0 with kinship and frail."
	card_target =  /obj/item/card_carp/rabbit
	icon_state = "folly_deck"
	endless = TRUE

/obj/item/cardholder/ratbox
	name = "rat card box"
	desc = "A box of cards that only have rat CarpCarpCo Cards. An unusual choice for a side deck, replacing squirrels by giving H1/P1 rats that cannot give blood."
	card_target =  /obj/item/card_carp/rat
	icon_state = "folly_deck"
	endless = TRUE

/obj/item/cardholder/beebox
	name = "beebox card box"
	desc = "A box of cards that only have bee CarpCarpCo Cards. An unusual choice for a side deck, replacing squirrels by giving H1/P0 bee cards that cannot give bones."
	card_target =  /obj/item/card_carp/beebox
	icon_state = "folly_deck"
	endless = TRUE

/obj/item/cardholder/shell
	name = "shell card box"
	desc = "A box of cards that only have shell CarpCarpCo Cards. Wait these are not even supported? Lame..."
	card_target =  /obj/item/card_carp/shell
	icon_state = "folly_deck"
	endless = TRUE

/obj/item/cardholder/endless
	name = "celestial card box"
	desc = "A box of cards that has a seemingly endless amount of CarpCarpCo Cards."
	card_target =  /obj/random/card_carp/pelt_and_normal_cards
	icon_state = "folly_deck"
	endless = TRUE
	card_eater = TRUE
