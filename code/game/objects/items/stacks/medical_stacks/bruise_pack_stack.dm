/obj/item/stack/medical/bruise_pack
	name = "roll of gauze"
	singular_name = "gauze length"
	desc = "Some sterile gauze to wrap around bloody stumps."
	icon_state = "brutepack" //sprites by @LiLJard @Ajajumbo123
	origin_tech = list(TECH_BIO = 1)
	heal_brute = 10
	fancy_icon = TRUE
	var/list/injected_reagents = list() // Reagents added via syringe injection
	var/max_injectable_volume = 5 // Maximum volume that can be injected

/obj/item/stack/medical/bruise_pack/attackby(obj/item/I, mob/user, params)
	// Allow syringe injection for basic gauze, Blackshield, and non-sterile bandages
	if(istype(I, /obj/item/reagent_containers/syringe))
		var/obj/item/reagent_containers/syringe/S = I
		if(S.reagents && S.reagents.total_volume > 0)
			// Calculate how much we can inject
			var/current_injected_volume = 0
			for(var/reagent in injected_reagents)
				current_injected_volume += injected_reagents[reagent]

			var/available_space = max_injectable_volume - current_injected_volume
			if(available_space <= 0)
				to_chat(user, SPAN_WARNING("\The [src] cannot absorb any more reagents."))
				return

			var/transfer_amount = min(S.reagents.total_volume, available_space)

			to_chat(user, SPAN_NOTICE("You inject [transfer_amount] units from \the [S] into \the [src]."))

			// Transfer reagents from syringe to gauze
			for(var/datum/reagent/R in S.reagents.reagent_list)
				var/amount_to_transfer = (R.volume / S.reagents.total_volume) * transfer_amount
				if(injected_reagents[R.type])
					injected_reagents[R.type] += amount_to_transfer
				else
					injected_reagents[R.type] = amount_to_transfer

			S.reagents.remove_any(transfer_amount)
			S.update_icon()
			return

	return ..()

/obj/item/stack/medical/bruise_pack/attack(mob/living/carbon/M, mob/living/user)
	if(..())
		return 1

	if(amount < 1)
		return

	//log_debug("bruise_pack 0, I have started")

	var/holy_healer = FALSE
	var/holy_healing = FALSE

	if(ishuman(user) && care_about_faith)
		holy_healer = check_faith_of_healer(user)


	//log_debug("bruise_pack 0.5, holy_healer = [holy_healer], holy_healing = [holy_healing]")

	if(ishuman(M))
		var/mob/living/carbon/human/H = M

		///log_debug("bruise_pack 1, holy_healer = [holy_healer], holy_healing = [holy_healing]")


		if(care_about_faith)
			holy_healing = check_faith_of_healing(M)

		var/obj/item/organ/external/affecting = H.get_organ(user.targeted_organ)

		if(!affecting)
			to_chat(user, SPAN_WARNING("What [user.targeted_organ]?"))
			return TRUE

		//log_debug("bruise_pack 2, holy_healer = [holy_healer], holy_healing = [holy_healing]")
		if(affecting.open == 0)
			if(affecting.is_bandaged())
				to_chat(user, SPAN_WARNING("The wounds on [M]'s [affecting.name] have already been bandaged."))
				return 1
			user.visible_message(
				SPAN_NOTICE("\The [user] starts treating [M]'s [affecting.name]."),
				SPAN_NOTICE("You start treating [M]'s [affecting.name].")
			)
			var/used = 0
			var/healed_by_faith
			if(care_about_faith && (holy_healer || holy_healing))
				if(holy_healer)
					healed_by_faith += heal_brute
					if(check_for_healer_plus(user))
						healed_by_faith += bounce_faith_healer_amount //5 extra if your a tessilate or preists
				if(holy_healing)
					healed_by_faith += heal_brute
			for (var/datum/wound/W in affecting.wounds)
				if(W.internal)
					continue
				if(W.bandaged)
					continue
				if(used == amount)
					break
				if(!do_mob(user, M, W.damage/5))
					to_chat(user, SPAN_NOTICE("You must stand still to bandage wounds."))
					break
				if(W.internal)
					continue
				if(W.bandaged)
					continue
				if(used == amount)
					break
				if (W.current_stage <= W.max_bleeding_stage)
					user.visible_message(
						SPAN_NOTICE("\The [user] bandages \a [W.desc] on [M]'s [affecting.name]."),
						SPAN_NOTICE("You bandage \a [W.desc] on [M]'s [affecting.name].")
					)
					//H.add_side_effect("Itch")
				else if (W.damage_type == BRUISE)
					user.visible_message(
						SPAN_NOTICE("\The [user] places a bruise patch over \a [W.desc] on [M]'s [affecting.name]."),
						SPAN_NOTICE("You place a bruise patch over \a [W.desc] on [M]'s [affecting.name].")
					)
				else
					user.visible_message(
						SPAN_NOTICE("\The [user] places a bandaid over \a [W.desc] on [M]'s [affecting.name]."),
						SPAN_NOTICE("You place a bandaid over \a [W.desc] on [M]'s [affecting.name].")
					)
				W.heal_damage(heal_brute + healed_by_faith)
				W.bandage()
				// user's stat check that causing pain if they are amateurs
				try_to_pain(M, user)

				// Apply reagents to the user on every application
				if(preloaded_reagents && preloaded_reagents.len)
					for(var/reagent in preloaded_reagents)
						if(user.reagents)
							user.reagents.add_reagent(reagent, preloaded_reagents[reagent])

				// Apply injected reagents to the user (static amount per use)
				if(injected_reagents && injected_reagents.len)
					for(var/reagent in injected_reagents)
						if(user.reagents && injected_reagents[reagent] > 0)
							var/amount_to_apply = injected_reagents[reagent] / max_amount // Static amount per use based on initial injection
							user.reagents.add_reagent(reagent, amount_to_apply)

				if(!try_to_save_use(user))
					used++
				affecting.update_damages()
				if(used == amount)
					if(affecting.is_bandaged())
						to_chat(user, SPAN_WARNING("\The [src] is used up."))
					else
						to_chat(user, SPAN_WARNING("\The [src] is used up, but there are more wounds to treat on \the [affecting.name]."))
				use(used)
				update_icon()
		else
			if(can_operate(H, user))        //Checks if mob is lying down on table for surgery
				if(do_surgery(H,user,src))
					return
			else
				to_chat(user, SPAN_NOTICE("The [affecting.name] is cut open, you'll need more than a bandage!"))

//Used for implants
/obj/item/stack/medical/bruise_pack/non_consumable
	consumable = FALSE
	splittable = FALSE

/obj/item/stack/medical/bruise_pack/blacshield
	name = "Blackshield trauma gauze"
	singular_name = "Blackshield trauma gauze"
	desc = "Used to treat and stem critical bleeding and severe trauma. Unlike regular gauze this one has a Blackshield logo on it, its formula designed for quick treatment of burns in the field using specialised clotting enzyme and a regenerative salve."
	stacktype_alt = /obj/item/stack/medical/bruise_pack
	icon_state = "bs_brutepack"
	preloaded_reagents = list("quickclot" = 2, "bicaridine" = 2)

/obj/item/stack/medical/bruise_pack/blacshield/attackby(obj/item/I, mob/user, params)
	// Allow syringe injection for Blackshield gauze
	if(istype(I, /obj/item/reagent_containers/syringe))
		var/obj/item/reagent_containers/syringe/S = I
		if(S.reagents && S.reagents.total_volume > 0)
			// Calculate how much we can inject
			var/current_injected_volume = 0
			for(var/reagent in injected_reagents)
				current_injected_volume += injected_reagents[reagent]

			var/available_space = max_injectable_volume - current_injected_volume
			if(available_space <= 0)
				to_chat(user, SPAN_WARNING("\The [src] cannot absorb any more reagents."))
				return

			var/transfer_amount = min(S.reagents.total_volume, available_space)

			to_chat(user, SPAN_NOTICE("You inject [transfer_amount] units from \the [S] into \the [src]."))

			// Transfer reagents from syringe to gauze
			for(var/datum/reagent/R in S.reagents.reagent_list)
				var/amount_to_transfer = (R.volume / S.reagents.total_volume) * transfer_amount
				if(injected_reagents[R.type])
					injected_reagents[R.type] += amount_to_transfer
				else
					injected_reagents[R.type] = amount_to_transfer

			S.reagents.remove_any(transfer_amount)
			S.update_icon()
			return

	return ..()


/obj/item/stack/medical/bruise_pack/update_icon()
	if(fancy_icon)
		icon_state = "[initial(icon_state)][amount]"
	..()

/obj/item/stack/medical/bruise_pack/advanced
	name = "advanced trauma kit"
	singular_name = "advanced trauma kit"
	desc = "An advanced trauma kit for severe injuries."
	icon_state = "traumakit"
	heal_brute = 15
	origin_tech = list(TECH_BIO = 2)
	automatic_charge_overlays = TRUE
	consumable = FALSE	// Will the stack disappear entirely once the amount is used up?
	splittable = FALSE	// Is the stack capable of being splitted?
	w_class = ITEM_SIZE_SMALL
	perk_required = TRUE
	needed_perk = PERK_MEDICAL_EXPERT
	needed_perk_alt = PERK_SURGICAL_MASTER
	bio_requirement = 25
	stacktype_alt = /obj/item/stack/medical/bruise_pack/advanced
	disinfectant  = TRUE
	fancy_icon = FALSE

/obj/item/stack/medical/bruise_pack/advanced/large
	name = "large advanced trauma kit"
	singular_name = "large advanced trauma kit"
	icon = 'icons/obj/stack/medical_big.dmi'
	amount = 10
	max_amount = 10
	charge_sections = 10
	stacktype_alt = /obj/item/stack/medical/bruise_pack/advanced

/obj/item/stack/medical/bruise_pack/advanced/tatonka_tongue
	name = "tatonka blood tongue"
	singular_name = "tatonka blood tongue"
	desc = "A treated tatonka tongue that has anti-septic saliva, capable of promoting healing and properly treating brute damage."
	icon_state = "brahmin_tongue"
	automatic_charge_overlays = FALSE
	consumable = TRUE
	matter = list(MATERIAL_BIOMATTER = 2.5)
	natural_remedy = TRUE
	perk_required = TRUE
//	needed_perk = PERK_BUTCHER
	bio_requirement = 10 // So simple a tribal can do it, still has a small check to use.
	stacktype_alt = null

/obj/item/stack/medical/bruise_pack/advanced/mending_ichor
	name = "mending ichor"
	singular_name = "mending ichor"
	desc = "An ichor that can be used to mend physical trauma."
	icon_state = "mending_ichor"
	automatic_charge_overlays = FALSE
	consumable = TRUE // Will the stack disappear entirely once the amount is used up?
	matter = list(MATERIAL_BIOMATTER = 2.5)
	natural_remedy = TRUE
	fancy_icon = FALSE
	perk_required = FALSE
	needed_perk = null
	bio_requirement = 0
	stacktype_alt = null

/obj/item/stack/medical/bruise_pack/handmade
	name = "non-sterile bandages"
	singular_name = "non-sterile bandage"
	desc = "Parts of cloth that can be wrapped around bloody stumps."
	icon_state = "makeshiftbandaid" //Ezoken#5894 made the sprites
	fancy_icon = TRUE
	matter = list(MATERIAL_BIOMATTER = 1)

/obj/item/stack/medical/bruise_pack/handmade/attackby(obj/item/I, mob/user, params)
	// Allow syringe injection for handmade gauze
	if(istype(I, /obj/item/reagent_containers/syringe))
		var/obj/item/reagent_containers/syringe/S = I
		if(S.reagents && S.reagents.total_volume > 0)
			// Calculate how much we can inject
			var/current_injected_volume = 0
			for(var/reagent in injected_reagents)
				current_injected_volume += injected_reagents[reagent]

			var/available_space = max_injectable_volume - current_injected_volume
			if(available_space <= 0)
				to_chat(user, SPAN_WARNING("\The [src] cannot absorb any more reagents."))
				return

			var/transfer_amount = min(S.reagents.total_volume, available_space)

			to_chat(user, SPAN_NOTICE("You inject [transfer_amount] units from \the [S] into \the [src]."))

			// Transfer reagents from syringe to gauze
			for(var/datum/reagent/R in S.reagents.reagent_list)
				var/amount_to_transfer = (R.volume / S.reagents.total_volume) * transfer_amount
				if(injected_reagents[R.type])
					injected_reagents[R.type] += amount_to_transfer
				else
					injected_reagents[R.type] = amount_to_transfer

			S.reagents.remove_any(transfer_amount)
			S.update_icon()
			return

	return ..()

/obj/item/stack/medical/bruise_pack/soteria
	name = "Soteria advanced gauze"
	singular_name = "Soteria advanced gauze"
	desc = "Premium sterile gauze manufactured by the Soteria Institute. Each strip is pre-treated with a specialized medical cocktail including quick-clotting agents, advanced healing compounds, detoxification chemicals, and broad-spectrum antibiotics. The gauze features Soteria's signature blue threading and comes with more applications than standard field dressings. Hand-crafted with care by skilled Soteria Medical personnel with care and concern."
	icon_state = "sr_brutepack"
	preloaded_reagents = list("quickclot" = 1, "meralyne" = 2, "dylovene" = 2, "spaceacillin" = 1, "sterilizine" = 1)
	fancy_icon = TRUE
	disinfectant  = TRUE
	amount = 8
	max_amount = 8
	heal_brute = 25 // Everything handmade and faction-wise will always be superior. See: Hand-Forged manipulators
	price_tag = 250

/obj/item/stack/medical/bruise_pack/advanced/nt
	name = "Absolutism Bruisepack"
	singular_name = "Absolutism Bruisepack"
	desc = "An advanced bruisepack for severe injuries. Created by the will of God and made far easier to use than normal advanced kits."
	icon_state = "nt_traumakit"
	preloaded_reagents = list("holywater" = 1, "holytricord" = 2, "holyquickclot" = 1, "holydylo" = 1)
	heal_brute = 10
	automatic_charge_overlays = FALSE
	matter = list(MATERIAL_BIOMATTER = 2)
	origin_tech = list(TECH_BIO = 4)
	fancy_icon = TRUE
	w_class = ITEM_SIZE_SMALL
	perk_required = TRUE
	needed_perk = PERK_MEDICAL_EXPERT
	bio_requirement = 15
	stacktype_alt = null
	care_about_faith = TRUE

/obj/item/stack/medical/bruise_pack/advanced/nt/update_icon()
	if(fancy_icon)
		icon_state = "[initial(icon_state)][amount]"
	..()

/obj/item/stack/medical/bruise_pack/psionic
	name = "Mindspindle"
	singular_name = "Mindstring"
	desc = "A sharp needle made with a sharp mind and thread from a stream of thought able to stop bleeding, it takes next to no skill to use."
	icon_state = "suture"
	heal_brute = -1
	bio_requirement = -15
	needed_perk = PERK_PSION
	stacktype_alt = null
	amount = 1
	max_amount = 3
	color = "#5B0E4F" //spooooky!!!!!
	consumable = FALSE //So we dont mess with dropping it
	var/mob/living/carbon/holder // The one that prevent the tool from fading

/obj/item/stack/medical/bruise_pack/psionic/New(loc, mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/stack/medical/bruise_pack/psionic/Process()
	..()
	if(loc != holder) // We're no longer in the psionic's hand.
		visible_message("The [src.name] fades into nothingness.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return


/obj/item/stack/medical/bruise_pack/psionic/update_icon()
	if(fancy_icon)
		icon_state = "[initial(icon_state)][amount]"
	..()
	color = "#5B0E4F"

//MAX is 29 healing, MIN is -1
/obj/item/stack/medical/bruise_pack/psionic/grabbed_medical_skill(mob/living/carbon/user)
	if(ishuman(user))
		var/psionic_things = 0
		if(user.stats.getPerk(PERK_PSI_HARMONY))
			psionic_things += 5
		if(user.stats.getPerk(PERK_PSI_PEACE))
			psionic_things += 5
		if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
			psionic_things += 5
		if(user.stats.getPerk(PERK_PSI_PSYCHOLOGIST))
			psionic_things *= 2
		return psionic_things
	else
		return FALSE
