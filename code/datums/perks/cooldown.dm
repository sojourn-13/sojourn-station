/datum/perk/cooldown
	var/perk_lifetime = 5 MINUTES
	var/timestamp_start
	gain_text = "You feel tired. Your body needs some time to recover from all this training."
	lose_text = "You feel a bit more rested from the training."

/datum/perk/cooldown/assign(mob/living/carbon/human/H)
	if(..())
		timestamp_start = world.time

/datum/perk/cooldown/on_process()
	if(!..() || ((timestamp_start + perk_lifetime) < world.time))
		holder.stats.removePerk(type)

/datum/perk/cooldown/exertion
	name = "Overexertion"
	desc = "Your muscles hurt after an intense workout. \
			Your TGH stat is reduced for some time. \
			A protein shake might help with recovery."
	icon_state = "exertion" //https://game-icons.net/1x1/delapouite/weight-lifting-up.html

/datum/perk/cooldown/exertion/on_process()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		if(H.ingested.has_reagent("protein_shake"))
			perk_lifetime -= 3 SECONDS
		else if(H.ingested.has_reagent("protein_shake_commercial"))
			perk_lifetime -= 2 SECONDS
	..()

/datum/perk/cooldown/exertion/assign(mob/living/carbon/human/H)
	..()
	holder?.stats.changeStat(STAT_TGH, -5)

/datum/perk/cooldown/exertion/remove()
	if(holder)
		holder.stats.changeStat(STAT_TGH, 5)
	..()

/datum/perk/cooldown/reason
	name = "Dimmed reason"
	desc = "Your mind had soaked up a lot of knowledge. \
			Your COG stat is reduced for some time."
	icon_state = "reason" //https://game-icons.net/1x1/lorc/brainstorm.html

/datum/perk/cooldown/reason/assign(mob/living/carbon/human/H)
	..()
	holder?.stats.changeStat(STAT_COG, -5)

/datum/perk/cooldown/reason/remove()
	if(holder)
		holder.stats.changeStat(STAT_COG, 5)
	..()

/datum/perk/cooldown/artist_no
	name = "Burnout"
	desc = "Art as taken its toll and you are resting the soul. Tea would help."
	icon_state = "paintbrush_no"
	perk_lifetime = 10 MINUTES //6 arts an hour or if you drink enuff green tea it should be more
	gain_text = "You feel tired. Your mind needs some time to recover from all this exspression."
	lose_text = "You feel a bit more rested from the burnout."

/datum/perk/cooldown/artist_no/on_process()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		if(H.ingested.has_reagent("icegreentea"))
			perk_lifetime -= 2 SECONDS
		else if(H.ingested.has_reagent("greentea"))
			perk_lifetime -= 1.5 SECONDS
		else if(H.ingested.has_reagent("icetea"))
			perk_lifetime -= 1 SECONDS
		else if(H.ingested.has_reagent("tea"))
			perk_lifetime -= 0.5 SECONDS
	..()

/datum/perk/cooldown/armor_reduction
	name = "Armor Reduction"
	desc = "Something has pointed out the weaknesses in your stance and armor."
	icon_state = "shield_no"
	perk_lifetime = 30 SECONDS //recover this quickly its accually deblitating
	gain_text = "Everything that attacks you knows exactly where to hit."
	lose_text = "Everything attacking you no longer know exactly where to attack."

/datum/perk/cooldown/armor_up
	name = "Armor Addition"
	desc = "Something or someone has increased the protective rating on your baseline resistances to weapons and firearms making you able to take a beating much easier."
	icon_state = "shield_plus"
	perk_lifetime = 8 MINUTES //Gives enuff time for folks to make a last stand
	gain_text = "Everything that hits you seems to have issues inflicting damages."
	lose_text = "Damages are able to stack up more easily again, whatever was aiding you is no longer active."

/datum/perk/cooldown/armor_up/assign(mob/living/L)
	..()
	if(!holder)
		return

	var/image/I = image(icon ='icons/mob/battle_overlays.dmi', icon_state = "scan_person_alt")

	holder.add_overlay(I)

	addtimer(CALLBACK(holder, TYPE_PROC_REF(/atom, cut_overlay), I), 30)

	if(ishuman(holder))
		var/mob/living/carbon/human/H = L
		H.punch_damage_increase += 5
		H.mob_ablative_armor += 30
		//If we added 30 and still have negitive armor, just set it to 0
		if(H.mob_ablative_armor <= 0)
			H.mob_ablative_armor = 0

	if(isanimal(holder))
		var/mob/living/simple/A = L
		A.melee_damage_lower += 5
		A.melee_damage_upper += 5

		//Increase bullet/laser and melee armor only
		for(var/key in A.armor)
			if(key == "melee")
				A.armor[key] += 5
			if(key == "bullet")
				A.armor[key] += 3
			if(key == "energy")
				A.armor[key] += 3


	if(issuperioranimal(holder))
		var/mob/living/carbon/superior/S = L
		S.melee_damage_lower += 5
		S.melee_damage_upper += 5

		//Increase bullet and melee armor only
		for(var/key in S.armor)
			if(key == "melee")
				S.armor[key] += 5
			if(key == "bullet")
				S.armor[key] += 3
			if(key == "energy")
				S.armor[key] += 3

/datum/perk/cooldown/armor_up/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.punch_damage_increase -= 5
		H.mob_ablative_armor -= 30
		if(H.mob_ablative_armor <= 0)
			H.mob_ablative_armor = 0


	if(isanimal(holder))
		var/mob/living/simple/A = holder
		A.melee_damage_lower -= 5
		A.melee_damage_upper -= 5

		//Increase bullet/laser and melee armor only
		for(var/key in A.armor)
			if(key == "melee")
				A.armor[key] -= 5
			if(key == "bullet")
				A.armor[key] -= 3
			if(key == "energy")
				A.armor[key] -= 3


	if(issuperioranimal(holder))
		var/mob/living/carbon/superior/S = holder
		S.melee_damage_lower -= 5
		S.melee_damage_upper -= 5

		//Increase bullet and melee armor only
		for(var/key in S.armor)
			if(key == "melee")
				S.armor[key] -= 5
			if(key == "bullet")
				S.armor[key] -= 3
			if(key == "energy")
				S.armor[key] -= 3

	..()

/datum/perk/cooldown/judgment_haste
	name = "Judgment Haste"
	desc = "A Judgement is required. Let it be delivered with haste."
	icon_state = "adrenalineburst"
	perk_lifetime = 2 MINUTES
	gain_text = "A Judgement is required."
	lose_text = "Your haste of judgement fades."

/datum/perk/cooldown/judgment_haste/assign(mob/living/carbon/human/H)
	..()
	holder.fancy_glide += 6

/datum/perk/cooldown/judgment_haste/remove()
	holder.fancy_glide -= 6

	..()
