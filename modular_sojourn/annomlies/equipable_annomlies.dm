/obj/item/stalker_hand_annomlie
	name = "Coder Annomlie"
	desc = "Something not meant to be seen by the eyes of players, \
	sad."
	icon = 'modular_sojourn/annomlies/stalker_annomlies.dmi'
	w_class = ITEM_SIZE_NORMAL
	icon_state = "wow_this_is_trash"
	item_state = "wow_this_is_trash"
	var/annomlie_givith = FALSE
	var/to_remove_givith = FALSE
	slot_flags = SLOT_BELT

/obj/item/stalker_hand_annomlie/dropped(var/mob/M)
	..()
	update_annomlie(M)

/obj/item/stalker_hand_annomlie/equipped(var/mob/M)
	.=..()
	update_annomlie(M)

/obj/item/stalker_hand_annomlie/proc/update_annomlie(mob/living/carbon/human/user)
	return

/obj/item/stalker_hand_annomlie/pillar
	name = "The pillar"
	desc = "A smooth pilar made of black stone, It is well polished and seems very strong."
	var/blood_difference = 60
	var/punch_increase = 25 //IDK

/obj/item/stalker_hand_annomlie/pillar/update_annomlie(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !annomlie_givith)
			H.punch_damage_increase += punch_increase
			annomlie_givith = TRUE
			to_remove_givith = TRUE
			if(H.species && H.species.flags & NO_BLOOD) //We want the var for safety but we can do without the actual blood.
				return
			H.vessel.maximum_volume  -= blood_difference
			H.drip_blood(blood_difference)
		if(to_remove_givith && !(H.belt == src))
			H.punch_damage_increase -= punch_increase
			annomlie_givith = FALSE
			to_remove_givith = FALSE

			if(H.species && H.species.flags & NO_BLOOD) //We want the var for safety but we can do without the actual blood.
				return

			H.vessel = new/datum/reagents(H.species.blood_volume)
			H.vessel.my_atom = src
			H.vessel.add_reagent("blood",blood_difference)
			H.vessel.maximum_volume  += blood_difference

/obj/item/stalker_hand_annomlie/camo_shard
	name = "The shard"
	desc = "A smooth shard of black stone, its edges have been beveled down to smooth rounds."
	icon_state = "shard"
	item_state = "shard"
	var/camo_set_to = 30
	var/health_to_take = 40 //IDK
	var/camo_we_have = 255

/obj/item/stalker_hand_annomlie/camo_shard/update_annomlie(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !annomlie_givith)
			camo_we_have = H.alpha
			H.alpha = camo_set_to
			annomlie_givith = TRUE
			to_remove_givith = TRUE
			H.maxHealth -= health_to_take
			H.health -= health_to_take

		if(to_remove_givith && !(H.belt == src))
			H.alpha = camo_we_have
			camo_we_have = 255
			annomlie_givith = FALSE
			to_remove_givith = FALSE
			H.maxHealth += health_to_take
			H.health += health_to_take

/obj/item/stalker_hand_annomlie/star
	name = "The star"
	desc = "A black stone star, it is well polished and smoothed, its center is small enough to hold in the palm of a hand."
	icon_state = "star"
	item_state = "star"
	var/darksight_givith = 2
	var/flash_help_givith = 2
	var/hunger_strike = 0.1

/obj/item/stalker_hand_annomlie/star/update_annomlie(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !annomlie_givith)
			annomlie_givith = TRUE
			to_remove_givith = TRUE
			H.flash_mod += flash_help_givith
			H.additional_darksight += darksight_givith
			H.movement_hunger_factors += hunger_strike
		if(to_remove_givith && !(H.belt == src))
			annomlie_givith = FALSE
			to_remove_givith = FALSE
			H.flash_mod -= flash_help_givith
			H.additional_darksight -= darksight_givith
			H.movement_hunger_factors -= hunger_strike

/obj/item/stalker_hand_annomlie/hand
	name = "The hand"
	desc = "A black stone hand, it is polished and appears to be marked as an avian hand, with feathers carved into it."
	icon_state = "feather"
	item_state = "feather"
	var/added_slowdown = 0.1
	var/faction_allied = ""
	var/faction_turner = "vox_tribe"

/obj/item/stalker_hand_annomlie/hand/update_annomlie(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !annomlie_givith)
			annomlie_givith = TRUE
			to_remove_givith = TRUE
			faction_allied = H.faction
			H.faction = faction_turner
			H.added_movedelay += added_slowdown
		if(to_remove_givith && !(H.belt == src))
			annomlie_givith = FALSE
			to_remove_givith = FALSE
			H.added_movedelay -= added_slowdown
			H.faction = faction_allied
			faction_allied = null

/obj/item/stalker_hand_annomlie/dice
	name = "The dice"
	desc = "A smooth die, made of black stone, It is well polished and has no markings on its faces."
	icon_state = "d201"
	item_state = "d201"
	var/rng_to_win = 50
	var/timer_to_mins = 5
	var/bread_won = 40
	var/grain_loss = -80

/obj/item/stalker_hand_annomlie/dice/update_annomlie(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !annomlie_givith)
			annomlie_givith = TRUE
			to_remove_givith = TRUE
			addtimer(CALLBACK(src, PROC_REF(rngus), H), timer_to_mins MINUTES)
		if(to_remove_givith && !(H.belt == src))
			annomlie_givith = FALSE
			to_remove_givith = FALSE

/obj/item/stalker_hand_annomlie/dice/proc/rngus(mob/living/carbon/human/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.belt == src && !H.isSynthetic())
			if(prob(rng_to_win))
				H.adjustNutrition(bread_won)
			else
				H.adjustNutrition(grain_loss)
