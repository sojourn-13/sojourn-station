/obj/item/stack/medical/bruise_pack
	name = "roll of gauze"
	singular_name = "gauze length"
	desc = "Some sterile gauze to wrap around bloody stumps."
	icon_state = "brutepack" //sprites by @LiLJard @Ajajumbo123
	origin_tech = list(TECH_BIO = 1)
	heal_brute = 10
	preloaded_reagents = list("silicon" = 4, "ethanol" = 8)
	fancy_icon = TRUE

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

/obj/item/stack/medical/bruise_pack/blacshield
	stacktype_alt = /obj/item/stack/medical/bruise_pack
	icon_state = "bs_brutepack"


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
	preloaded_reagents = list("silicon" = 4, "ethanol" = 10, "lithium" = 4)
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
	needed_perk = PERK_BUTCHER
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

/obj/item/stack/medical/bruise_pack/soteria
	name = "Soteria medical gauze"
	singular_name = "Soteria medical gauze"
	desc = "An advanced sterile gauze to wrap around bloody stumps. Unlike the regular gauze, these have more charges, and sterilize wounds as ointment would. Hand-made, with love, by Soteria Medical staff."
	icon_state = "sr_brutepack"
	preloaded_reagents = list("quickclot" = 5, "sterilizine" = 10)
	fancy_icon = TRUE
	disinfectant  = TRUE
	amount = 8
	max_amount = 8
	heal_brute = 25 // Everything handmade and faction-wise will always be superior. See: Hand-Forged manipulators
	price_tag = 25

/obj/item/stack/medical/bruise_pack/advanced/nt
	name = "Absolutism Bruisepack"
	singular_name = "Absolutism Bruisepack"
	desc = "An advanced bruisepack for severe injuries. Created by the will of God and made far easier to use than normal advanced kits."
	icon_state = "nt_traumakit"
	heal_brute = 10
	automatic_charge_overlays = FALSE
	matter = list(MATERIAL_BIOMATTER = 5)
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