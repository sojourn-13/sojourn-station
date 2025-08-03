////////////////////////////////////////////////////////////////////////////////
/// HYPOSPRAY //Sprites by INFRARED_BARON#8170
////////////////////////////////////////////////////////////////////////////////

/obj/item/reagent_containers/hypospray
	name = "hypospray"
	desc = "The Soteria medical hypospray is a sterile, air-needle autoinjector for rapid administration of drugs to patients."
	icon = 'icons/obj/syringe.dmi'
	item_state = "hypospray"
	icon_state = "hypospray"
	amount_per_transfer_from_this = 5
	unacidable = 1
	volume = 40
	possible_transfer_amounts = null
	reagent_flags = OPENCONTAINER
	slot_flags = SLOT_BELT
	preloaded_reagents = list("tricordrazine" = 40)
	var/injtime = 0 //A simple delay in injecting


/obj/item/reagent_containers/hypospray/New()
	..()
	update_icon()

/obj/item/reagent_containers/hypospray/update_icon()
	if(reagents?.total_volume > 0)
		icon_state = "hypospray"
	else
		icon_state = "hypospray_empty"

/obj/item/reagent_containers/hypospray/attack(mob/living/M as mob, mob/user as mob)
	if(!reagents.total_volume)
		to_chat(user, SPAN_WARNING("[src] is empty."))
		return
	if (!istype(M))
		return
	injtime = 0 //This -could- be abused but only in such narrow circumstances and with such meager payoff that it's fine. it's fine.
	// Handling errors and injection duration
	var/mob/living/carbon/human/H = M
	if(istype(H))
		var/obj/item/clothing/suit/space/SS = H.get_equipped_item(slot_wear_suit)
		var/obj/item/rig/RIG = H.get_equipped_item(slot_back)
		if(H.a_intent == I_HURT)
			user.visible_message(SPAN_WARNING("[user] trys to inject [M] with [src]! But [M] is actively resisting"), SPAN_WARNING("You inject begin injecting [M] with [src] but they seem to be resisting."))
			injtime += 10 //Not as good as having a real suit on
		if((istype(RIG) && RIG.suit_is_deployed()) || istype(SS))
			injtime += 30
			var/obj/item/organ/external/affected = H.get_organ(BP_CHEST)
			if(BP_IS_ROBOTIC(affected))
				to_chat(user, SPAN_WARNING("Injection port on [M]'s suit is refusing your [src]."))
				// I think rig is advanced enough for this, and people will learn what causes this error
				if(RIG)
					playsound(src.loc, 'sound/machines/buzz-two.ogg', 50, 1 -3)
					RIG.visible_message("\icon[RIG]\The [RIG] states \"Attention: User of this suit appears to be synthetic origin\".")
				return
		// check without message
		else if(!H.can_inject(user, FALSE))
			// lets check if user is easily fooled
			var/obj/item/organ/external/affected = H.get_organ(user.targeted_organ)
			if(BP_IS_LIFELIKE(affected) && user && user.stats.getStat(STAT_BIO) < STAT_LEVEL_BASIC)
				if(M.reagents)
					var/trans = reagents.remove_any(amount_per_transfer_from_this)
					user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
					to_chat(user, SPAN_NOTICE("[trans] units injected. [reagents.total_volume] units remaining in \the [src]."))
				return
			else
				// if he is not lets show him what actually happened
				H.can_inject(user, TRUE)
				return
	else if(!M.can_inject(user, TRUE))
		return
	// handling injection duration on others
	if(M != user)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		user.do_attack_animation(M)
		if(injtime)
			user.visible_message(SPAN_WARNING("[user] begins injecting [M]!"), SPAN_WARNING("You begins injecting [M]!"))
			if(do_mob(user, M, injtime))
				user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
			else
				return
	// handling actual injection
	// on this stage we are sure that everything is alright
	var/contained = reagents.log_list()
	var/trans = reagents.trans_to_mob(M, amount_per_transfer_from_this, CHEM_BLOOD)
	admin_inject_log(user, M, src, contained, trans)
	to_chat(user, SPAN_NOTICE("[trans] units injected. [reagents.total_volume] units remaining in \the [src]."))
	return

/obj/item/reagent_containers/hypospray/verb/empty()
	set name = "Empty Hypospray"
	set category = "Object"
	set src in usr

	if (alert(usr, "Are you sure you want to empty that?", "Empty Bottle:", "Yes", "No") != "Yes")
		return
	if(isturf(usr.loc))
		to_chat(usr, SPAN_NOTICE("You empty \the [src] onto the floor."))
		reagents.splash(usr.loc, reagents.total_volume)

/obj/item/reagent_containers/hypospray/autoinjector
	name = "autoinjector (inaprovaline)"
	desc = "A rapid and safe way to administer small amounts of drugs by untrained or trained personnel. Anyone with a syringe and some chemicals can refill or even replace the loaded reagents, provided \
	they know how to properly use a syringe."
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	icon_state = "syrette_inopravoline"
	item_state = "syrette_inopravoline"
	amount_per_transfer_from_this = 5
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1)
	reagent_flags = INJECTABLE | DRAINABLE | AMOUNT_VISIBLE | REFILLABLE
	volume = 5
	preloaded_reagents = list("inaprovaline" = 5)
	var/can_be_refilled = TRUE //For cargos
	var/baseline_sprite = "syrette_inopravoline" //Mostly used for chemmasters so we dont need to init(sprite name), to allow mid-round changing of icons.
	injtime = 2 //Instant was a bit to powerful well refilling

/obj/item/reagent_containers/hypospray/autoinjector/sugar
	name = "autoinjector (Emergency Glucose)"
	desc = "A Soteria proprietary injector. Meant for even the most dull-minded individuals, these are marked with a stylized symbol of a Cortical Borer. For emergencies, rogue borers, and-or diabetic shock."
	preloaded_reagents = list("sugar" = 5)
	can_be_refilled = FALSE
	injtime = 5

/obj/item/reagent_containers/hypospray/autoinjector/examine(mob/user)
	..()
	if(can_be_refilled)
		to_chat(user, "<span class='info'>This one is refillable.</span>")

/obj/item/reagent_containers/hypospray/autoinjector/on_reagent_change()
	..()
	if(reagents?.total_volume <= 0 && !can_be_refilled) //Prevents autoinjectors from being refilled when it cant be refilled
		reagent_flags &= ~INJECTABLE
		reagent_flags &= ~REFILLABLE

/obj/item/reagent_containers/hypospray/autoinjector/update_icon()
	cut_overlays()
	if(reagents?.total_volume > 0)
		icon_state = "[baseline_sprite]"
	else
		icon_state = "[baseline_sprite]_spent"
	price_tag = 0

/obj/item/reagent_containers/hypospray/autoinjector/chemmaters
	icon_state = "syrette"
	item_state = "syrette"
	baseline_sprite = "syrette"
	preloaded_reagents = list()

/obj/item/reagent_containers/hypospray/autoinjector/antitoxin
	name = "autoinjector (anti-toxin)"
	icon_state = "syrette_antitox"
	item_state = "syrette_antitox"
	baseline_sprite = "syrette_antitox"
	preloaded_reagents = list("anti_toxin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine
	name = "autoinjector (tricordrazine)"
	icon_state = "syrette_tricord"
	item_state = "syrette_tricord"
	baseline_sprite = "syrette_tricord"
	preloaded_reagents = list("tricordrazine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/kelotane
	name = "autoinjector (kelotane)"
	icon_state = "syrette_yellow"
	item_state = "syrette_yellow"
	baseline_sprite = "syrette_yellow"
	preloaded_reagents = list("kelotane" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/bicaridine
	name = "autoinjector (bicaridine)"
	icon_state = "syrette_red"
	item_state = "syrette_red"
	baseline_sprite = "syrette_red"
	preloaded_reagents = list("bicaridine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/antirad
	name = "autoinjector (anti-rad)"
	icon_state = "syrette_green"
	item_state = "syrette_green"
	baseline_sprite = "syrette_green"
	preloaded_reagents = list("hyronalin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/dexalin
	name = "autoinjector (dexalin)"
	icon_state = "syrette_cyan"
	item_state = "syrette_cyan"
	baseline_sprite = "syrette_cyan"
	preloaded_reagents = list("dexalin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/tramadol
	name = "autoinjector (tramadol)"
	icon_state = "syrette_magenta"
	item_state = "syrette_magenta"
	baseline_sprite = "syrette_magenta"
	preloaded_reagents = list("tramadol" = 5)

// Intermediate
/obj/item/reagent_containers/hypospray/autoinjector/polystem
	name = "autoinjector (polystem)"
	icon_state = "syrette_magenta"
	item_state = "syrette_magenta"
	baseline_sprite = "syrette_magenta"
	preloaded_reagents = list("polystem" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/meralyne
	name = "autoinjector (meralyne)"
	icon_state = "syrette_magenta"
	item_state = "syrette_magenta"
	baseline_sprite = "syrette_magenta"
	preloaded_reagents = list("meralyne" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/dermaline
	name = "autoinjector (dermaline)"
	icon_state = "syrette_orange"
	item_state = "syrette_orange"
	baseline_sprite = "syrette_orange"
	preloaded_reagents = list("dermaline" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/dexalinplus
	name = "autoinjector (dexalin plus)"
	preloaded_reagents = list("dexalinp" = 5)
	icon_state = "syrette_blue"
	item_state = "syrette_blue"
	baseline_sprite = "syrette_blue"

/obj/item/reagent_containers/hypospray/autoinjector/oxycodone
	name = "autoinjector (oxycodone)"
	preloaded_reagents = list("oxycodone" = 5)
	icon_state = "syrette_blue"
	item_state = "syrette_blue"
	baseline_sprite = "syrette_blue"

/obj/item/reagent_containers/hypospray/autoinjector/ryetalyn
	name = "autoinjector (ryetalyn)"
	preloaded_reagents = list("ryetalyn" = 5)
	icon_state = "syrette_orange"
	item_state = "syrette_orange"
	baseline_sprite = "syrette_orange"

/obj/item/reagent_containers/hypospray/autoinjector/quickclot
	name = "autoinjector (quickclot)"
	preloaded_reagents = list("quickclot" = 5)
	icon_state = "syrette_quickclot"
	item_state = "syrette_quickclot"
	baseline_sprite = "syrette_quickclot"

/obj/item/reagent_containers/hypospray/autoinjector/sanguinum
	name = "autoinjector (sanguinum)"
	preloaded_reagents = list("sanguinum" = 5)
	icon_state = "syrette_red"
	item_state = "syrette_red"
	baseline_sprite = "syrette_red"

/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin
	name = "autoinjector (spaceacillin)"
	icon_state = "syrette_spacealine"
	item_state = "syrette_spacealine"
	baseline_sprite = "syrette_spacealine"
	preloaded_reagents = list("spaceacillin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/hyperzine
	name = "autoinjector (hyperzine)"
	icon_state = "syrette_hyperzine"
	item_state = "syrette_hyperzine"
	baseline_sprite = "syrette_hyperzine"
	preloaded_reagents = list("hyperzine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/drugs
	name = "autoinjector (drugs)"
	icon_state = "syrette_fun1"
	item_state = "syrette_fun1"
	baseline_sprite = "syrette_fun1"
	preloaded_reagents = list("space_drugs" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/quickhealbrute
	name = "autoinjector (brute-aid)"
	icon_state = "syrette_red"
	item_state = "syrette_red"
	baseline_sprite = "syrette_red"
	preloaded_reagents = list("bicaridine" = 1, "meralyne" = 1, "seligitillin" = 1, "tricordrazine" = 1, "polystem" = 1)
	price_tag = 100
	can_be_refilled = FALSE

/obj/item/reagent_containers/hypospray/autoinjector/quickhealburn
	name = "autoinjector (burn-aid)"
	icon_state = "syrette_yellow"
	item_state = "syrette_yellow"
	baseline_sprite = "syrette_yellow"
	preloaded_reagents = list("kelotane" = 1.25, "dermaline" = 1.25, "tricordrazine" = 1.25, "polystem" = 1.25)
	price_tag = 100
	can_be_refilled = FALSE

/obj/item/reagent_containers/hypospray/autoinjector/large //bigger storage, not refillable. great for medical to sell, I suppose?
	name = "advanced autoinjector" //placeholder
	desc = "A larger, more robust autoinjector whos design prevents refilling, but allows for much more storage. A proprietary Soteria design."
	icon_state = "supeyrette" //fancy animated sprite courtesy of Guidesu.
	item_state = "supeyrette"
	amount_per_transfer_from_this = 10
	reagent_flags = INJECTABLE | DRAINABLE | AMOUNT_VISIBLE
	volume = 10
	preloaded_reagents = list("inaprovaline" = 10)
	can_be_refilled = FALSE //No refill!!!
	baseline_sprite = "supeyrette"
	injtime = 5 //150% longer inject time for 100% more storage.A worthy trade off for this tool


/obj/item/reagent_containers/hypospray/autoinjector/large/chemmaters
	icon_state = "supeyrette" //still missing the icons from doll.
	item_state = "supeyrette"
	baseline_sprite = "syrette"
	preloaded_reagents = list()

/obj/item/reagent_containers/hypospray/autoinjector/large/meralyn
	name = "meralyn advanced autoinjector"
	preloaded_reagents = list("meralyn" = 10)

/obj/item/reagent_containers/hypospray/autoinjector/large/vermicetol
	name = "vermicetol advanced autoinjector"
	preloaded_reagents = list("vermicetol" = 10)

/obj/item/reagent_containers/hypospray/autoinjector/large/varceptol
	name = "varceptol advanced autoinjector"
	preloaded_reagents = list("varceptol" = 10)

/obj/item/reagent_containers/hypospray/autoinjector/large/blood
	name = "adv-bleed repair advanced autoinjector"
	preloaded_reagents = list("nanoblood" = 2, "sanguinum" = 5, "quickclot" = 3)

/obj/item/reagent_containers/hypospray/autoinjector/large/antirad
	name = "adv-antirad advanced autoinjector"
	preloaded_reagents = list("arithrazine" = 5, "peridaxon" = 3, "anti_toxin" = 2)

/obj/item/reagent_containers/hypospray/autoinjector/large/peridaxon
	name = "alky-peri advanced autoinjector"
	preloaded_reagents = list("peridaxon" = 5, "alkysine" = 5)
