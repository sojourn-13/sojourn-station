/// Basically a marker perk. If the user has this perk, another will be given in certain conditions.
/datum/perk/inspiration
	name = "Exotic Inspiration"
	desc = "The best ideas come from a mind not entirely sober, any alcohol will give you that much needed boost... somehow."
	//icon_state = "inspiration" // https://game-icons.net/1x1/delapouite/booze.html

/datum/perk/active_inspiration
	name = "Exotic Inspiration (Active)"
	//icon_state = "inspiration_active" // https://game-icons.net/1x1/lorc/enlightenment.html

/datum/perk/active_inspiration/assign(mob/living/carbon/human/H)
	..()
	holder.stats.addTempStat(STAT_COG, 5, INFINITY, "Exotic Inspiration")
	holder.stats.addTempStat(STAT_MEC, 10, INFINITY, "Exotic Inspiration")

/datum/perk/active_inspiration/remove()
	holder.stats.removeTempStat(STAT_COG, "Exotic Inspiration")
	holder.stats.removeTempStat(STAT_MEC, "Exotic Inspiration")
	..()

/datum/perk/timeismoney
	name = "Hyperzine Implant"
	desc = "A standard issue implant designed for chief executive officers that contains a small on demand injection of hyperzine. The implant itself is hidden from prying scanners and comes in both \
	metal and organic material designs to aid in remaining hidden. While useful, the chemical storage takes time to recharge after use."
	active = FALSE
	passivePerk = FALSE

/datum/perk/timeismoney/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your chemical implant is still recharging, you'll need to wait longer."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] begins twitching and breathing much quicker!", "You feel your heart rate increasing rapidly as everything seems to speed up!", "You hear someone breathing rapidly...")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("hyperzine", 5)
	return ..()

/datum/perk/selfmedicated
	name = "Medical Expertise"
	desc = "You've been trained in the art of Soteria medicine, applying chemicals in the most efficient ways to lessen addiction chance and prevent as much nerve shock."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/selfmedicated/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 0.5
	holder.metabolism_effects.nsa_threshold += 10

/datum/perk/selfmedicated/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_threshold -= 10
	..()

/datum/perk/solborn
	name = "Sol Born"
	desc = "Clean living in the Sol system has prevented you from building up a tolerance to most chemicals, your body can't handle the more hardcore drugs that most can and you find yourself getting \
	addicted slightly easier."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/solborn/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 1.2
	holder.metabolism_effects.nsa_threshold -= 15

/datum/perk/solborn/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_threshold += 15
	..()

/datum/perk/klutz
	name = "Klutz"
	desc = "You find a lot of tasks a little beyond your ability to perform, but being accident prone has at least made you used to getting hurt."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/klutz/assign(mob/living/carbon/human/H)
	..()
	holder.mutations.Add(CLUMSY)

/datum/perk/klutz/remove()
	holder.mutations.Remove(CLUMSY)
	..()

/datum/perk/addict
	name = "Chem Addict"
	desc = "You've been an addict all your life, for whatever piss poor reason you've told yourself. Your body is able to handle a variety of drugs, more than the average person, but you get \
	easily addicted to most of them."
	//icon_state = "selfmedicated" // https://game-icons.net/1x1/lorc/overdose.html

/datum/perk/addict/assign(mob/living/carbon/human/H)
	..()
	holder.metabolism_effects.addiction_chance_multiplier = 2
	holder.metabolism_effects.nsa_threshold += 20

/datum/perk/addict/remove()
	holder.metabolism_effects.addiction_chance_multiplier = 1
	holder.metabolism_effects.nsa_threshold -= 20
	..()
/*
/datum/perk/merchant
	name = "Greedy at Heart"
	desc = "Money is what matters for you, and it's so powerful it lets you improve your skills the more you have on your person."
	//icon_state = "merchant" // https://game-icons.net/1x1/lorc/cash.html and https://game-icons.net/1x1/delapouite/graduate-cap.html slapped on https://game-icons.net/1x1/lorc/trade.html

/datum/perk/merchant/assign(mob/living/carbon/human/H)
	..()
	//holder.sanity.valid_inspirations += /obj/item/weapon/spacecash/bundle

/datum/perk/merchant/remove()
	//holder.sanity.valid_inspirations -= /obj/item/weapon/spacecash/bundle
	..()
*/
/datum/perk/sanityboost
	name = "True Faith"
	desc = "When near an obelisk, you feel your mind at ease. You're body is strengthed by its presence, resisting all forms of damage."
	gain_text = "You feel the protection of the nearby obelisk."
	lose_text = "You no longer feel the protection of an obelisk."
	//icon_state = "sanityboost" // https://game-icons.net/1x1/lorc/templar-eye.html

/datum/perk/sanityboost/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk /= 1.2
	holder.burn_mod_perk /= 1.2
	holder.oxy_mod_perk /= 1.2
	holder.toxin_mod_perk /= 1.2

/datum/perk/sanityboost/remove()
	holder.brute_mod_perk *= 1.2
	holder.burn_mod_perk *= 1.2
	holder.oxy_mod_perk *= 1.2
	holder.toxin_mod_perk *= 1.2
	..()

/datum/perk/sure_step
	name = "Sure step"
	desc = "Years spent in hazardous areas have made you sure on your footing, you are more likely to avoid traps and don't trip while running on underplating."
	//icon_state = "mantrap"

/datum/perk/ear_of_quicksilver
	name = "Ear of Quicksilver"
	desc = "Training (and an ear implant) given to you as a ranger makes it hard for secrets to escape your ears. Beware, loud noises are especially dangerous to you as a side effect."
	//icon_state = "ear" // https://game-icons.net

/datum/perk/unfinished_delivery
	name = "Lazarus Protocol"
	desc = "Your cruciform is more than just a symbol of faith. Should you ever perish it will attempt an emergency revival that may restore your body after a short time in which you'll be unconcious."
	//icon_state = "regrowth" // https://game-icons.net/1x1/delapouite/stump-regrowth.html

/datum/perk/lungs_of_iron
	name = "Lungs of Iron"
	desc = "For whatever reason, be it natural evolution or simply spending too much time in space or low oxygen worlds your lungs are adapted to surviving with less oxygen."
	//icon_state = "lungs" // https://game-icons.net/1x1/lorc/one-eyed.html

/datum/perk/blood_of_lead
	name = "Lead Blood"
	desc = "Maybe you grew up on a world with a toxic atmosphere, maybe solar radiation was common, or maybe its just genetics but you're adapted well to dealing with toxins."
	//icon_state = "liver" // https://game-icons.net

/datum/perk/space_asshole
	name = "Rough Life"
	desc = "Your past life has been one of turmoil and extremes and as a result has toughened you up severely. Enviromental damage from falling or explosives have less of an effect on your toughened body."
	//icon_state = "bomb" // https://game-icons.net

/datum/perk/space_asshole/assign(mob/living/carbon/human/H)
	..()
	holder.mob_bomb_defense += 25
	holder.falls_mod -= 0.4

/datum/perk/space_asshole/remove()
	holder.mob_bomb_defense -= 25
	holder.falls_mod += 0.4
	..()

/datum/perk/parkour
	name = "Raiders Leap"
	desc = "You can climb some objects faster than normal thanks to a life of raiding ships, settlements, and anywhere plunder was."
	//icon_state = "parkour" //https://game-icons.net/1x1/delapouite/jump-across.html

/datum/perk/parkour/assign(mob/living/carbon/human/H)
	..()
	holder.mod_climb_delay -= 0.5

/datum/perk/parkour/remove()
	holder.mod_climb_delay += 0.5
	..()

/datum/perk/chaingun_smoker
	name = "Unclean Living"
	desc = "The bad conditions of your birth have led you to thrive in toxic enviroments, so much so that your body is dependent on having an unclean atmosphere. You feel tougher and less sick when smoking."
	//icon_state = "cigarette" // https://game-icons.net

/datum/perk/nightcrawler
	name = "Nightcrawler"
	desc = "You are faster in the darkness due to being used to it."
	//icon_state = "night" // https://game-icons.net/1x1/lorc/night-sky.html

/datum/perk/fast_fingers
	name = "Fast fingers"
	desc = "Pockets, ears, hands... just not the clothes! My legerdemain is legendary!"
	//icon_state = "robber_hand" // https://game-icons.net/1x1/darkzaitzev/robber-hand.html

/datum/perk/quiet_as_mouse
	name = "Quiet as a mouse"
	desc = "Being deadly, easy. Silent? Even easier now."
	//icon_state = "footsteps" // https://game-icons.net

/datum/perk/quiet_as_mouse/assign(mob/living/carbon/human/H)
	..()
	holder.noise_coeff -= 0.5

/datum/perk/quiet_as_mouse/remove()
	holder.noise_coeff += 0.5
	..()

/datum/perk/junkborn
	name = "Expert Scavenger"
	desc = "They say theirs diamonds in the rough and you can prove it. Removing a trash pile has a chance of revealing a valuable item nobody else would find."
	//icon_state = "treasure" // https://game-icons.net

/datum/perk/ass_of_concrete
	name = "Expert Defensive Training"
	desc = "Your position requires you to be unstoppable. Slowing down to a walking pace lets you center your gravity and few things can knock you down."
	//icon_state = "muscular" // https://game-icons.net

/datum/perk/ass_of_concrete/assign(mob/living/carbon/human/H)
	..()
	holder.mob_bump_flag = HEAVY

/datum/perk/ass_of_concrete/remove()
	holder.mob_bump_flag = ~HEAVY
	..()

/datum/perk/sommelier
	name = "Sommelier"
	desc = "You know how to handle even strongest alcohol in the universe."
	//icon_state = "inspiration"

/datum/perk/rezsickness
	name = "Revival Sickness"
	desc = "You've recently died and have been brought back to life, the experience has left you weakened and thus unable to be fighting fit for awhile."
	gain_text = "Your body aches from the pain of returning from death, you better find a chair or bed to rest in so you can heal properly."
	lose_text = "You finally feel like you recovered from the ravages of your body."
	var/initial_time

/datum/perk/rezsickness/assign(mob/living/carbon/human/H)
	..()
	initial_time = world.time
	cooldown_time = world.time + 30 MINUTES
	holder.brute_mod_perk += 0.15
	holder.burn_mod_perk += 0.15
	holder.oxy_mod_perk += 0.15
	holder.toxin_mod_perk += 0.15
	holder.stats.changeStat(STAT_ROB, -15)
	holder.stats.changeStat(STAT_TGH, -15)
	holder.stats.changeStat(STAT_VIG, -15)

/datum/perk/rezsickness/remove()
	holder.brute_mod_perk -= 0.15
	holder.burn_mod_perk -= 0.15
	holder.oxy_mod_perk -= 0.15
	holder.toxin_mod_perk -= 0.15
	holder.stats.changeStat(STAT_ROB, 15)
	holder.stats.changeStat(STAT_TGH, 15)
	holder.stats.changeStat(STAT_VIG, 15)
	..()

/datum/perk/rezsickness/severe
	name = "Severe Revival Sickness"
	desc = "You've recently died and have been brought back to life, the experience has left severely weakened to the point where you struggle to do even basic tasks."

/datum/perk/rezsickness/severe/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.10
	holder.burn_mod_perk += 0.10
	holder.oxy_mod_perk += 0.10
	holder.toxin_mod_perk += 0.10
	holder.stats.changeStat(STAT_COG, -15)
	holder.stats.changeStat(STAT_MEC, -15)
	holder.stats.changeStat(STAT_BIO, -15)

/datum/perk/rezsickness/severe/remove()
	holder.brute_mod_perk -= 0.10
	holder.burn_mod_perk -= 0.10
	holder.oxy_mod_perk -= 0.10
	holder.toxin_mod_perk -= 0.10
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)
	holder.stats.changeStat(STAT_BIO, 15)
	..()

/datum/perk/rezsickness/severe/fatal
	name = "Fatal Revival Sickness"
	desc = "You've recently died and have been brought back to life, the experience has left you utterly physically and mentally wrecked, you better find a bed to recover in..."

/datum/perk/rezsickness/severe/fatal/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk += 0.25
	holder.burn_mod_perk += 0.25
	holder.oxy_mod_perk += 0.25
	holder.toxin_mod_perk += 0.25
	holder.stats.changeStat(STAT_ROB, -15)
	holder.stats.changeStat(STAT_TGH, -15)
	holder.stats.changeStat(STAT_VIG, -15)
	holder.stats.changeStat(STAT_COG, -15)
	holder.stats.changeStat(STAT_MEC, -15)
	holder.stats.changeStat(STAT_BIO, -15)

/datum/perk/rezsickness/severe/fatal/remove()
	holder.brute_mod_perk -= 0.25
	holder.burn_mod_perk -= 0.25
	holder.oxy_mod_perk -= 0.25
	holder.toxin_mod_perk -= 0.25
	holder.stats.changeStat(STAT_ROB, 15)
	holder.stats.changeStat(STAT_TGH, 15)
	holder.stats.changeStat(STAT_VIG, 15)
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)
	holder.stats.changeStat(STAT_BIO, 15)
	..()

/datum/perk/rezsickness/on_process()
	if(cooldown_time <= world.time)
		holder.stats.removePerk(type)
		to_chat(holder, SPAN_NOTICE("[lose_text]"))
		return
	if(holder.buckled)
		cooldown_time -= 2 SECONDS

/datum/perk/handyman
	name = "Handyman"
	desc = "Training by the Artificer's Guild has granted you the knowledge of how to take apart machines in the best way possible, finding materials and supplies most people would miss. This training is taken further the more mechanically skilled or cognitively capable you are."

/datum/perk/stalker
	name = "Anomaly Hunter"
	desc = "Special training from senior prospectors and your own experience has allowed you to instinctively know the effects of greater oddities. By examing an oddity that has become an anomaly you can tell what its greater boon or curse may be."