/* This is a master file for all perks / traits that are given via background selection.area

This includes perks from:
- Career background selection
- Early-life background selection
- And other selections.

This is NOT for racial-specific perks, but rather specifically for general background perks for organizations sake.*/

/datum/perk/sure_step
	name = "Sure step"
	desc = "Years spent in hazardous areas have made you sure on your footing, you are more likely to avoid traps and less likely to trip while running on under-plating."
	//icon_state = "mantrap"

/datum/perk/lungs_of_iron
	name = "Lungs of Iron"
	desc = "For whatever reason, be it natural evolution or simply spending too much time in space or low oxygen worlds your lungs are adapted to surviving with less oxygen."
	//icon_state = "lungs" // https://game-icons.net/1x1/lorc/one-eyed.html

/datum/perk/space_asshole
	name = "Rough Life"
	desc = "Your past life has been one of turmoil and extremes and as a result has toughened you up severely. Environmental damage from falling or explosives have less of an effect on your toughened body."
	//icon_state = "bomb" // https://game-icons.net

/datum/perk/space_asshole/assign(mob/living/carbon/human/H)
	..()
	holder.mob_bomb_defense += 25
	holder.falls_mod -= 0.4
	holder.sanity.view_damage_threshold += 20

/datum/perk/space_asshole/remove()
	holder.mob_bomb_defense -= 25
	holder.falls_mod += 0.4
	holder.sanity.view_damage_threshold -= 20
	..()

/datum/perk/linguist
	name = "Linguist"
	desc = "Having dedicated time to learn foreign tongues, you find yourself knowing an extra language. Be it from your upbringing or schooling, you're fluent in one more language than the average person!"
	active = FALSE
	passivePerk = FALSE
	var/anti_cheat = FALSE

/datum/perk/linguist/activate()
	..()
	if(anti_cheat)
		to_chat(holder, "Recalling more languages is not as easy for someone unskilled as you.")
		return FALSE
	anti_cheat = TRUE
	var/mob/M = usr
	var/list/options = list()
	options["Eurolang"] = LANGUAGE_EURO
	options["Jive"] = LANGUAGE_JIVE
	options["Jana"] = LANGUAGE_JANA
	options["Illyrian"] = LANGUAGE_ILLYRIAN
	options["Interslavic"] = LANGUAGE_CYRILLIC
	options["Lingua Romana"] = LANGUAGE_ROMANA
	options["Yassari"] = LANGUAGE_YASSARI
	options["Latin"] = LANGUAGE_LATIN
	var/choice = input(M,"Which language do you know?","Linguist Choice") as null|anything in options
	if(src && choice)
		M.add_language(choice)
		M.stats.removePerk(PERK_LINGUIST)
	anti_cheat = FALSE
	return TRUE

/datum/perk/linguist/remove()
	..()

/datum/perk/parkour
	name = "Raiders Leap"
	desc = "Life as a Void Wolf has given you amazing agility. You can climb railings, walls, and ladders much faster than others. In addition you can dodge, combat roll, and stand up from prone much \
	faster. Finally, your rough and tumble movement makes falling from high heights deal a lot less damage compared to others and you will always land on your feet."
	//icon_state = "parkour" //https://game-icons.net/1x1/delapouite/jump-across.html

/datum/perk/parkour/assign(mob/living/carbon/human/H)
	..()
	holder.mod_climb_delay -= 0.95
	holder.falls_mod -= 0.8

/datum/perk/parkour/remove()
	holder.mod_climb_delay += 0.95
	holder.falls_mod += 0.8
	..()

/datum/perk/chaingun_smoker
	name = "Unclean Living"
	desc = "The bad conditions of your upbringing have led you to thrive in toxic environments, so much so that your body is dependent on having an unclean atmosphere. You feel tougher and slowly heal toxin damage when smoking."
	//icon_state = "cigarette" // https://game-icons.net

/datum/perk/blood_of_lead
	name = "Lead Blood"
	desc = "Maybe you grew up on a world with a toxic atmosphere, maybe solar radiation was common, or maybe its just genetics but you're adapted well to dealing with toxins."
	//icon_state = "liver" // https://game-icons.net

/datum/perk/greenthumb
	name = "Green Thumb"
	desc = "After growing plants for years (or at least being around those who do) you have become a botanical expert. You can get all information about plants, from stats \
	        to harvest reagents, by examining them."
	//icon_state = "greenthumb" // https://game-icons.net/1x1/delapouite/farmer.html

	var/virtual_scanner = new /obj/item/device/scanner/plant/perk

/datum/perk/greenthumb/assign(mob/living/carbon/human/H)
	..()
	var/obj/item/device/scanner/V = virtual_scanner
	V.is_virtual = TRUE

/datum/perk/nihilist
	name = "Nihilist"
	desc = 	"You simply ran out of fucks to give at some point in your life. \
			This increases chance of positive breakdowns by 10% and negative breakdowns by 20%. Seeing someone die has a random effect on you: \
			sometimes you won’t take any sanity loss and you can even gain back sanity, or get a boost to your cognition."
	icon_state = "eye" //https://game-icons.net/1x1/lorc/tear-tracks.html

/datum/perk/nihilist/assign(mob/living/carbon/human/H)
	if(..())
		holder.sanity.positive_prob += 10
		holder.sanity.negative_prob += 20

/datum/perk/nihilist/remove()
	if(holder)
		holder.sanity.positive_prob -= 10
		holder.sanity.negative_prob -= 20
		holder.stats.removeTempStat(STAT_COG, "Fate Nihilist")
	..()

/datum/perk/idealist
	name = "Idealist"
	//icon_state = "moralist" //https://game-icons.net/
	desc = "A day may come when the courage of men fails, when we forsake our friends and break all bonds of fellowship. \
			But it is not this day. This day you fight! \
			Your Insight gain is faster when you are around sane people and they will recover sanity when around you. \
			When you are around people that are low on health or sanity, you will take sanity damage."

/datum/perk/noble
	name = "Wealthy Upbringing"
	//icon_state = "family" //https://game-icons.net
	desc = "You came from a wealthy family of high stature, able to achieve a high education and spent most of your life capable of relaxing. \
			Start with an heirloom weapon, higher chance to be on contractor contracts and removed sanity cap. Stay clear of filth and danger."

/datum/perk/noble/assign(mob/living/carbon/human/H)
	if(!..())
		return
	holder.sanity.environment_cap_coeff -= 1
	if(!holder.name)
		holder.stats.removePerk(src.type)
		return
	var/turf/T = get_turf(holder)
	var/obj/item/W
	if(is_neotheology_disciple(holder) && prob(50))
		W = pickweight(list(
				/obj/item/tool/sword/nt/longsword = 0.5,
				/obj/item/tool/sword/nt/shortsword = 0.5,
				/obj/item/tool/sword/nt/scourge = 0.1,
				/obj/item/tool/knife/dagger/nt = 0.5,
				/obj/item/gun/projectile/mk58 = 0.4,
				/obj/item/gun/projectile/mk58/wood = 0.1))
	else
		W = pickweight(list(
				/obj/item/tool/hammer/mace = 0.2,
				/obj/item/tool/knife/ritual = 0.5,
				/obj/item/material/butterfly/switchblade = 0.5,
				/obj/item/tool/sword/saber = 0.2,
				/obj/item/tool/sword/katana = 0.2,
				/obj/item/tool/knife/dagger = 0.5,
				/obj/item/gun/projectile/colt = 0.2,
				/obj/item/gun/projectile/revolver/detective = 0.1,
				/obj/item/tool/knife/dagger/ceremonial = 0.4,
				/obj/item/gun/projectile/revolver/rev10 = 0.4))
	holder.sanity.valid_inspirations += W
	W = new W(T)
	W.desc += " It has been inscribed with the \"[holder.name]\" family name."
	W.name = "[W] of [holder.name]"
	var/oddities = rand(2,4)
	var/list/stats = ALL_STATS
	var/list/final_oddity = list()
	for(var/i = 0 to oddities)
		var/stat = pick(stats)
		stats.Remove(stat)
		final_oddity += stat
		final_oddity[stat] = rand(1,7)
	W.AddComponent(/datum/component/inspiration, final_oddity, get_oddity_perk())
	W.AddComponent(/datum/component/atom_sanity, 1, "") //sanity gain by area
	W.sanity_damage -= 1 //damage by view
	W.price_tag += rand(1000, 2500)
	spawn(1)
		holder.equip_to_storage_or_drop(W)

/datum/perk/noble/remove()
	if(holder)
		holder.sanity.environment_cap_coeff += 1
	..()

/datum/perk/addict
	name = "Chem Addict"
	desc = "You've been an addict all your life, for whatever piss poor reason you've told yourself. Your body is able to handle a variety of drugs, more than the average person, but you get \
	easily addicted to all of them."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/addict/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 2
	holder.metabolism_effects.nsa_bonus += 20
	holder.metabolism_effects.calculate_nsa()

/datum/perk/addict/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_bonus -= 20
	holder.metabolism_effects.calculate_nsa()
	..()
