/// Basically a marker perk. If the user has this perk, another will be given in certain conditions.
/datum/perk/inspiration
	name = "Exotic Inspiration"
	desc = "The best ideas come from a mind not entirely sober, any alcohol will give you that much needed boost... somehow."
	icon_state = "inspiration" // https://game-icons.net/1x1/delapouite/booze.html

/datum/perk/active_inspiration
	name = "Exotic Inspiration (Active)"
	desc = "The alcohol you imbibed is granting you that much needed boost in inspiration for your next project...somehow."
	gain_text = "You feel a sudden rush of alcohol-induced inspiration..."
	lose_text = "Your sudden flash of brilliance fades away..."
	icon_state = "inspiration_active" // https://game-icons.net/1x1/lorc/enlightenment.html

/datum/perk/active_inspiration/assign(mob/living/L)
	..()
	holder.stats.addTempStat(STAT_COG, 5, INFINITY, "Exotic Inspiration")
	holder.stats.addTempStat(STAT_MEC, 10, INFINITY, "Exotic Inspiration")

/datum/perk/active_inspiration/remove()
	holder.stats.removeTempStat(STAT_COG, "Exotic Inspiration")
	holder.stats.removeTempStat(STAT_MEC, "Exotic Inspiration")
	..()

/datum/perk/job/artist
	name = "Artist"
	desc = "You have a lot of expertise in making works of art. You gain more insight from all sources but can only increase \
			your stats by creating works of art."
	icon_state = "paintbrush"
	var/old_max_insight = INFINITY
	var/old_max_resting = INFINITY
	var/old_insight_rest_gain_multiplier = 1
	copy_protected = TRUE

/datum/perk/job/artist/assign(mob/living/L)
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		old_max_insight = H.sanity.max_insight
		old_max_resting = H.sanity.max_resting
		old_insight_rest_gain_multiplier = H.sanity.insight_rest_gain_multiplier
		H.sanity.max_insight = 100
		H.sanity.insight_gain_multiplier *= 2 //We need to gain more faster for are job
		H.sanity.max_resting = 1
		H.sanity.insight_rest_gain_multiplier = 0
		H.sanity.level_change_cap *= 5 // Artists use this stuff for their work, so we need them to be able get larger amounts

/datum/perk/job/artist/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.sanity.max_insight += old_max_insight - 100
		H.sanity.insight_gain_multiplier /= 2
		H.sanity.max_resting += old_max_resting - 1
		H.sanity.insight_rest_gain_multiplier += old_insight_rest_gain_multiplier
		H.sanity.level_change_cap *= 0.2
	..()

/datum/perk/timeismoney
	name = "Hyperzine Injections"
	desc = "A standard issue injector hidden away that is designed for Surface Operations Managers that contains a small on-demand injection of Hyperzine. The injector itself is unable to be seen by prying scanners and comes in both \
	metal and organic material designs to aid in remaining hidden. While useful, the chemical storage takes time to recharge after use."
	icon_state = "adrenalineburst_tim"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/timeismoney/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your chemical injector is still refilling, you'll need to wait longer."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] begins twitching and breathing much quicker!", "You feel your heart rate increasing rapidly as everything seems to speed up!", "You hear someone breathing rapidly...")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("hyperzine", 5)
	return ..()

/datum/perk/medicalexpertise
	name = "Medical Expertise"
	desc = "Your medical training and experience in the area of patient triage is unparalleled. 'Waste not, want not' is your motto, and you apply bandages and salves with utmost efficiency, sometimes using just the right amount of them."
	icon_state = "medicalexpertise"

/datum/perk/solborn
	name = "Sol Born"
	desc = "Clean living in the Sol system has prevented you from building up a tolerance to most chemicals, your body can't handle the more hardcore drugs that most can and you find yourself getting \
	addicted slightly easier."
	icon_state = "solborn" // https://game-icons.net/1x1/lorc/overdose.html
	copy_protected = TRUE //Origin Traits.

/datum/perk/solborn/assign(mob/living/L)
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.addiction_chance_multiplier = 1.2
		H.metabolism_effects.nsa_bonus -= 15
		H.metabolism_effects.calculate_nsa()

/datum/perk/solborn/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.addiction_chance_multiplier = 1
		H.metabolism_effects.nsa_bonus += 15
		H.metabolism_effects.calculate_nsa()
	..()

/datum/perk/klutz
	name = "Klutz"
	desc = "You find a lot of tasks a little beyond your ability to perform such is using any type of weaponry, but being accident prone has at least made you used to getting hurt."
	icon_state = "klutz"
	copy_protected = TRUE //Blacklisted for the same reason Rez sickness is.

/datum/perk/klutz/assign(mob/living/L)
	..()
	holder.mutations.Add(CLUMSY)

/datum/perk/klutz/remove()
	holder.mutations.Remove(CLUMSY)
	..()

/datum/perk/sanityboost
	name = "True Faith"
	desc = "When near an obelisk, you feel your mind at ease. Your body is strengthened by its presence, resisting all forms of damage."
	icon_state = "truefaith"
	gain_text = "You feel the protection of the nearby obelisk."
	lose_text = "You no longer feel the protection of an obelisk."
	copy_protected = TRUE

/datum/perk/active_sanityboost/assign(mob/living/L)
	if(..() && ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.sanity.sanity_passive_gain_multiplier *= 1.5

/datum/perk/active_sanityboost/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.sanity.sanity_passive_gain_multiplier /= 1.5
	..()

/datum/perk/unfinished_delivery
	name = "Lazarus Protocol"
	desc = "Your cruciform is more than just a symbol of faith. Should you ever perish, it will attempt an emergency revival that may restore your body after a short time, in which you'll be unconscious."
	icon_state = "regrowth" // https://game-icons.net/1x1/delapouite/stump-regrowth.html
	copy_protected = TRUE

/datum/perk/community_of_saints
	name = "Community of the Saints"
	desc = "Your cruciform connects you to all other believers, but such connection can be distracting as well as beneficial. You take 25% longer to complete all tool-based actions that aren't instantaneous."
	icon_state = "communityofthesaints"
	copy_protected = TRUE

/datum/perk/ear_of_quicksilver
	name = "Ear of Quicksilver"
	desc = "Training (and an ear implant) given to you as a Ranger makes it hard for secrets to escape your ears. Beware, loud noises are especially dangerous to you as a side effect."
	icon_state = "ear" // https://game-icons.net
	copy_protected = TRUE

/datum/perk/chemist
	name = "Periodic Table"
	desc = "You know what the atoms around you react to and in what way they do. You are used to making organic substitutes and using them. \
			You get quarter more NSA than a normal person. You can also see all reagents in beakers."
	icon_state = "periodictable"
	perk_shared_ability = PERK_SHARED_SEE_REAGENTS

/datum/perk/chemist/assign(mob/living/L)
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.nsa_mult += 0.25
		H.metabolism_effects.calculate_nsa()

/datum/perk/chemist/chemist/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.nsa_mult -= 0.25
		H.metabolism_effects.calculate_nsa()
	..()

/datum/perk/alchemist
	name = "Alchemy"
	desc = "Whether from fun study or natural talent in the field of brewing random things together you know how to gather basic chemical compounds. \
			Your NSA also has been slightly improved due to self experimentation. You can also see all reagents in beakers."
	perk_shared_ability = PERK_SHARED_SEE_REAGENTS

/datum/perk/alchemist/assign(mob/living/L)
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.nsa_mult += 0.05
		H.metabolism_effects.calculate_nsa()

/datum/perk/alchemist/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.nsa_mult -= 0.05
		H.metabolism_effects.calculate_nsa()
	..()

/datum/perk/scribe
	name = "Scribe"
	desc = "Your ability to turn experiences into words knows no bounds. Paper at this point is hardly able to hold the power of your writing."
	copy_protected = TRUE

/datum/perk/scribe/assign(mob/living/L)
	..()
	if(holder)
		holder.sdisabilities|=BLIND

/datum/perk/scribe/remove()
	if(holder)
		holder.sdisabilities&=BLIND
	..()

/datum/perk/cooldown/reveal //perk to give thermal vision. Meant to only last a few moments before ending and removing itself.
	name = "Peak-A-Boo"
	perk_lifetime = 3 SECONDS
	gain_text = "The scroll's smoke fills your eyes. Whats moving in the walls?"
	lose_text = "Your eyes sting but you don't see the pain anymore."
	copy_protected = TRUE

/datum/perk/cooldown/reveal/assign(mob/living/L)
	..()
	if(holder)
		//give thermal vision
		holder.sight |= SEE_MOBS

/datum/perk/bartender
	name = "Bar Menu"
	desc = "You know how to mix a drink, and flip a burger. You can identify the ingredients that went into food and how much was used."
	icon_state = "barmenu"
	perk_shared_ability = PERK_SHARED_SEE_COMMON_REAGENTS

/datum/perk/chem_contraband
	name = "Illegal Substance Training"
	desc = "For reasons either fair or foul, you know how to easily identify certain kinds of illegal chemical contraband."
	icon_state = "illegalsubstancetraining"
	perk_shared_ability = PERK_SHARED_SEE_ILLEGAL_REAGENTS

/datum/perk/nightcrawler
	name = "Nightcrawler"
	desc = "Having lived in a light-deprived enviroment for most of your life has honed your vision more than the average person.\nYour accelerated dark adaptation has also made you more photosensitive to sudden bright lights and flashes."
	var/init_sight
	var/init_flash
	var/obj/screen/lightOverlay = null
	icon_state = "night" // https://game-icons.net/1x1/lorc/night-sky.html

/datum/perk/nightcrawler/assign(mob/living/L)
	..()
	init_sight = holder.additional_darksight
	init_flash = holder.flash_mod
	holder.additional_darksight = 8
	holder.flash_mod += 2

/datum/perk/nightcrawler/remove()
	holder.additional_darksight = init_sight
	holder.flash_mod = init_flash
	..()

/datum/perk/fast_fingers
	name = "Fast fingers"
	desc = "Nothing is safe around your hands. You are a true kleptomaniac. Taking items off others makes no sound or prompts, provided its in their pockets, hands, or their ears. \
	It's also quicker and you can slip pills into drinks unnoticed."
	icon_state = "robber_hand" // https://game-icons.net/1x1/darkzaitzev/robber-hand.html

/datum/perk/quiet_as_mouse
	name = "Quiet as a mouse"
	desc = "Being deadly, easy. Silent? Even easier now. You generate less noise than others."
	icon_state = "footsteps" // https://game-icons.net

/datum/perk/quiet_as_mouse/assign(mob/living/L)
	..()
	holder.noise_coeff -= 0.75

/datum/perk/quiet_as_mouse/remove()
	holder.noise_coeff += 0.75
	..()

/datum/perk/junkborn
	name = "Expert Scavenger"
	desc = "One man's trash is another man's salary. Removing a trash pile has a chance of revealing a valuable item nobody else would find."
	icon_state = "treasure" // https://game-icons.net

/datum/perk/ass_of_concrete
	name = "Immovable Object"
	desc = "Your intense training has perfected your footing, and you're an expert at holding the line. Few things can knock you off balance or push you around."
	icon_state = "muscular" // https://game-icons.net

/datum/perk/ass_of_concrete/assign(mob/living/L)
	..()
	holder.mob_bump_flag = HEAVY

/datum/perk/ass_of_concrete/remove()
	holder.mob_bump_flag = ~HEAVY
	..()

/datum/perk/sommelier
	name = "Sommelier"
	desc = "You know how to handle even the strongest alcohol in the universe and doing so improves your toughness."
	icon_state = "inspiration"

/datum/perk/rezsickness
	name = "Revival Sickness"
	desc = "You've recently died and have been brought back to life, the experience leaving you weakened and thus unfit for fighting for a while. You better find a bed or chair to rest into until you've fully recuperated."
	icon_state = "revivalsickness"
	gain_text = "Your body aches from the pain of returning from death, you better find a chair or bed to rest in so you can heal properly."
	lose_text = "You finally feel like you recovered from the ravages of your body."
	var/initial_time
	copy_protected = TRUE //no griefing people, naughty borer/carrion

/datum/perk/rezsickness/assign(mob/living/L)
	..()

	initial_time = world.time
	cooldown_time = world.time + 30 MINUTES
	holder.brute_mod_perk *= 1.10
	holder.burn_mod_perk *= 1.10
	holder.oxy_mod_perk *= 1.10
	holder.toxin_mod_perk *= 1.10
	holder.stats.changeStat(STAT_ROB, -10)
	holder.stats.changeStat(STAT_TGH, -10)
	holder.stats.changeStat(STAT_VIG, -10)
	if(isliving(holder))
		var/mob/living/H = holder
		H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/pours, "POURS", skill_gained = 0.5, learner = H)
		if(ishuman(H))
			var/mob/living/carbon/human/M = H
			if(M.stats.getPerk(PERK_OVERBREATH))
				M.mob_ablative_armor += 5

/datum/perk/rezsickness/remove()
	holder.brute_mod_perk /= 1.10
	holder.burn_mod_perk /= 1.10
	holder.oxy_mod_perk /= 1.10
	holder.toxin_mod_perk /= 1.10
	holder.stats.changeStat(STAT_ROB, 10)
	holder.stats.changeStat(STAT_TGH, 10)
	holder.stats.changeStat(STAT_VIG, 10)
	..()

/datum/perk/rezsickness/severe
	name = "Severe Revival Sickness"
	desc = "You've recently died and have been brought back to life. Your body cannot handle this traumatic experience very well, to the point where you struggle to complete even basic tasks. You better rest in a bed until it subsides before going back to work."
	icon_state = "severerevivalsickness"

/datum/perk/rezsickness/severe/assign(mob/living/L)
	..()
	holder.brute_mod_perk *= 1.15
	holder.burn_mod_perk *= 1.15
	holder.oxy_mod_perk *= 1.15
	holder.toxin_mod_perk *= 1.15
	holder.stats.changeStat(STAT_COG, -15)
	holder.stats.changeStat(STAT_MEC, -15)
	holder.stats.changeStat(STAT_BIO, -15)
	if(ishuman(L))
		var/mob/living/carbon/human/M = L
		if(M.stats.getPerk(PERK_OVERBREATH))
			M.mob_ablative_armor += 5

/datum/perk/rezsickness/severe/remove()
	holder.brute_mod_perk /= 1.15
	holder.burn_mod_perk /= 1.15
	holder.oxy_mod_perk /= 1.15
	holder.toxin_mod_perk /= 1.15
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)
	holder.stats.changeStat(STAT_BIO, 15)
	..()

/datum/perk/rezsickness/severe/fatal
	name = "Fatal Revival Sickness"
	desc = "You've recently died and have been brought back to life. Your frail constitution can barely handle the process, leaving you utterly physically and mentally wrecked. You better stay in bed for now and rest, or you risk dying even easier than before."
	icon_state = "fatalrevivalsickness"

/datum/perk/rezsickness/severe/fatal/assign(mob/living/L)
	..()
	holder.brute_mod_perk *= 1.25
	holder.burn_mod_perk *= 1.25
	holder.oxy_mod_perk *= 1.25
	holder.toxin_mod_perk *= 1.25
	holder.stats.changeStat(STAT_ROB, -20)
	holder.stats.changeStat(STAT_TGH, -20)
	holder.stats.changeStat(STAT_VIG, -20)
	holder.stats.changeStat(STAT_COG, -20)
	holder.stats.changeStat(STAT_MEC, -20)
	holder.stats.changeStat(STAT_BIO, -20)
	if(ishuman(L))
		var/mob/living/carbon/human/M = L
		if(M.stats.getPerk(PERK_OVERBREATH))
			M.mob_ablative_armor += 10

/datum/perk/rezsickness/severe/fatal/remove()
	holder.brute_mod_perk /= 1.25
	holder.burn_mod_perk /= 1.25
	holder.oxy_mod_perk /= 1.25
	holder.toxin_mod_perk /= 1.25
	holder.stats.changeStat(STAT_ROB, 20)
	holder.stats.changeStat(STAT_TGH, 20)
	holder.stats.changeStat(STAT_VIG, 20)
	holder.stats.changeStat(STAT_COG, 20)
	holder.stats.changeStat(STAT_MEC, 20)
	holder.stats.changeStat(STAT_BIO, 20)
	..()

/datum/perk/rezsickness/on_process()
	if(!..())
		return
	if(cooldown_time <= world.time)
		holder.stats.removePerk(type)
		to_chat(holder, SPAN_NOTICE("[lose_text]"))
		return
	if(holder.buckled)
		cooldown_time -= 2 SECONDS

/datum/perk/racial/slime_rez_sickness
	name = "Aulvae Decohesion Syndrome"
	desc = "You've recently been returned to cohesion via the use of high-energy toxins which have left your form in a semi-stable state."
	gain_text = "Your core vibrates and crackles with barely contained energy as you're revived. You feel stronger than ever, but your form is unstable and fragile. Perhaps it'd be best to lie down and allow time for this to pass, lest you loose cohesion once again."
	lose_text = "The thunder bouncing around just beneath your dermis has passed and you feel stable once again."
	var/initial_time
	icon_state = "slime_rez"
	copy_protected = TRUE

/datum/perk/racial/slime_rez_sickness/assign(mob/living/L)
	..()
	initial_time = world.time
	cooldown_time = world.time + 30 MINUTES
	holder.brute_mod_perk *= 1.3
	holder.burn_mod_perk *= 1.3
	holder.stats.changeStat(STAT_ROB, 30)
	holder.stats.changeStat(STAT_TGH, -30)
	holder.stats.changeStat(STAT_VIG, -30)

/datum/perk/racial/slime_rez_sickness/remove()
	holder.brute_mod_perk /= 1.3
	holder.burn_mod_perk /= 1.3
	holder.stats.changeStat(STAT_ROB, -30)
	holder.stats.changeStat(STAT_TGH, 30)
	holder.stats.changeStat(STAT_VIG, 30)
	..()

/datum/perk/racial/slime_rez_sickness/on_process()
	if(!..())
		return
	if(cooldown_time <= world.time)
		holder.stats.removePerk(type)
		to_chat(holder, SPAN_NOTICE("[lose_text]"))
		return
	if(holder.buckled)
		cooldown_time -= 2 SECONDS

/datum/perk/handyman
	name = "Handyman"
	desc = "Training by the Artificer's Guild has granted you the knowledge of how to take apart machines in the most efficient way possible, finding materials and supplies most people would miss. This training is taken further the more mechanically skilled or cognitively capable you are."
	icon_state = "handyman"
	copy_protected = TRUE

/datum/perk/handyman/assign(mob/living/L)
	..()


/datum/perk/handyman/remove()
	..()

/datum/perk/stalker
	name = "Anomaly Hunter"
	desc = "Special training from senior Prospectors and your own experience has allowed you to instinctively know the effects of greater oddities. By examining an oddity that has become an anomaly, you can tell what its greater boon or curse may be."
	icon_state = "anomalyhunter"
	copy_protected = TRUE //This isn't like market professional. Too strong to be able to copy.

/datum/perk/market_prof
	name = "Market Professional"
	desc = "You've become an excellent appraiser of goods over the years. Just by looking at the item, you can know how much it would sell for in today's market rates."
	icon_state = "marketprofessional"
	//The only reason this isn't copy protected is it doesn't lock unique recipies and isn't gamebreaking.

//Medical perks - relates to surgery and all - If this ends up being too OP, copy protect all of them.

/datum/perk/surgical_master
	name = "Surgery Training"
	desc = "While you may not know the more advanced medical procedures, your mandatory training on surgery for implantation purposes allows you to perform basic surgical procedures with ease."
	icon_state = "surgerytraining"

/datum/perk/advanced_medical
	name = "Advanced Surgical Techniques"
	desc = "Your surgical training and experience have tempered your special techniques for treating patients, enabling you to make more effective and efficient use of your resources when reconstituting their bodies."
	icon_state = "advancedsurgicaltechniques"

/datum/perk/robotics_expert
	name = "Robotics Expert"
	desc = "Your formal training and experience in advanced mech construction and complex devices has made you more adept at working with them."
	icon_state = "roboticsexpert"

/datum/perk/robotics_expert/assign(mob/living/L)
	..()

/datum/perk/robotics_expert/remove()
	..()

/datum/perk/job/bolt_reflect
	name = "Bolt Action Rifle Training"
	desc = "Through intense and repetitive training with bolt-action and lever-action rifles, you will always chamber a new round instantly after firing."
	icon_state = "boltactionrifletraining"

/datum/perk/job/jingle_jangle
	name = "Key Smith"
	desc = "You have been granted a multitude of specially crafted electronic 'keys' for opening most airlocks around the colony, and the knowledge on how to use them has been solely been passed on to you. Don't get discouraged, you will eventually find the right one..."
	icon_state = "keysmith"
	copy_protected = TRUE //No.

/datum/perk/job/blackshield_conditioning
	name = "Blackshield Conditioning"
	desc = "Thanks to special and intensive training received in the course of your employment with Blackshield, with all the practice gained in space you feel you can jump from greater heights and know when to duck-and-cover."
	icon_state = "blackshieldconditioning"
	copy_protected = TRUE //Physical trait. Not mental.

/datum/perk/job/blackshield_conditioning/assign(mob/living/L)
	..()
	holder.mob_bomb_defense += 20
	holder.falls_mod -= 0.4

/datum/perk/job/blackshield_conditioning/remove()
	holder.mob_bomb_defense -= 20
	holder.falls_mod += 0.4
	..()

/datum/perk/job/prospector_conditioning
	name = "Rough and Tumble"
	desc = "You've been through it all. Spider bites, random cuts on rusted metal, animal claws, getting shot, and even set on fire. Hell, even a few used needles in desperate times. You feel as though your body fights off the inflictions of too much NSA and addictions much better than others."
	icon_state = "roughandtumble"
	perk_shared_ability = PERK_SHARED_SEE_ILLEGAL_REAGENTS
	copy_protected = TRUE

/datum/perk/job/prospector_conditioning/assign(mob/living/L)
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.addiction_chance_multiplier = 0.1
		H.metabolism_effects.nsa_bonus += 25
		H.metabolism_effects.calculate_nsa()

/datum/perk/job/prospector_conditioning/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.addiction_chance_multiplier = 1
		H.metabolism_effects.nsa_bonus -= 25
		H.metabolism_effects.calculate_nsa()
	..()

/datum/perk/job/butcher
	name = "Master Butcher"
	desc = "Your skill as a butcher is unmatched, be it through your training or accumulated field experience. You can harvest additional valuable parts from animals you cut up, nothing shall be wasted."
	icon_state = "masterbutcher"

/datum/perk/job/butcher/assign(mob/living/L)
	..()

/datum/perk/job/butcher/remove()
	..()

/datum/perk/job/master_herbalist
	name = "Naturalist"
	desc = "The secrets of natural remedies have been unlocked by the lodge after special training from folken tribes, given their alliance. This has granted you the ability to make better \
	use of grown plants to harvest more fruit and more properly manage the use of medical supplies like blood tongues or powder pouches. As an added bonus, when harvesting soil \
	or plant trays you always harvest an additional bonus! You are also a capable surgeon, able to perform surgical steps a lot more easily, to the point of rivaling real surgeons."
	icon_state = "naturalist"
	perk_shared_ability = PERK_SHARED_SEE_REAGENTS

/datum/perk/si_sci
	name = "SI Science Training"
	icon_state = "sitraining"
	desc = "You know how to use RnD core consoles and Exosuit Fabs."
	copy_protected = TRUE //No.

/datum/perk/neat
	name = "Humble Cleanser"
	desc = "You're used to see blood and filth in all its forms. Your motto: a clean colony is a happy colony. \
			This perk reduces the total sanity damage you can take from what is happening around you. \
			You can regain sanity by cleaning."
	icon_state = "neat" // https://game-icons.net/1x1/delapouite/broom.html
	copy_protected = TRUE //No.

/datum/perk/neat/assign(mob/living/L)
	if(..() && ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.sanity.view_damage_threshold += 20

/datum/perk/neat/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.sanity.view_damage_threshold -= 20
	..()

/datum/perk/channeling
	name = "Channeling"
	desc = "You know how to channel spiritual energy during rituals. You gain additional skill points \
			during group rituals, and have an increased regeneration of cruciform energy."
	icon_state = "channeling"
	copy_protected = TRUE

/datum/perk/codespeak
	name = "Codespeak"
	desc = "You know Marshal codes."
	icon_state = "codespeak" // https://game-icons.net/1x1/delapouite/police-officer-head.html
	copy_protected = TRUE //Borers already grant omni language translation.
	var/list/codespeak_procs = list(
		/mob/living/carbon/human/proc/codespeak_help,
		/mob/living/carbon/human/proc/codespeak_clear,
		/mob/living/carbon/human/proc/codespeak_regroup,
		/mob/living/carbon/human/proc/codespeak_moving,
		/mob/living/carbon/human/proc/codespeak_moving_away,
		/mob/living/carbon/human/proc/codespeak_spooders,
		/mob/living/carbon/human/proc/codespeak_romch,
		/mob/living/carbon/human/proc/codespeak_bigspooders,
		/mob/living/carbon/human/proc/codespeak_bigromch,
		/mob/living/carbon/human/proc/codespeak_serb,
		/mob/living/carbon/human/proc/codespeak_commie,
		/mob/living/carbon/human/proc/codespeak_carrion,
		/mob/living/carbon/human/proc/codespeak_mutant,
		/mob/living/carbon/human/proc/codespeak_dead,
		/mob/living/carbon/human/proc/codespeak_corpse,
		/mob/living/carbon/human/proc/codespeak_criminal,
		/mob/living/carbon/human/proc/codespeak_unknown,
		/mob/living/carbon/human/proc/codespeak_status,
		/mob/living/carbon/human/proc/codespeak_detaining,
		/mob/living/carbon/human/proc/codespeak_shutup,
		/mob/living/carbon/human/proc/codespeak_understood,
		/mob/living/carbon/human/proc/codespeak_yes,
		/mob/living/carbon/human/proc/codespeak_no,
		/mob/living/carbon/human/proc/codespeak_detain_local,
		/mob/living/carbon/human/proc/codespeak_understood_local,
		/mob/living/carbon/human/proc/codespeak_yes_local,
		/mob/living/carbon/human/proc/codespeak_no_local,
		/mob/living/carbon/human/proc/codespeak_warcrime_local,
		/mob/living/carbon/human/proc/codespeak_rules_of_engagmentn_local,
		/mob/living/carbon/human/proc/codespeak_run_local
		)

/datum/perk/codespeak/assign(mob/living/L)
	..()
	if(holder)
		add_verb(holder, codespeak_procs)

/datum/perk/codespeak/remove()
	if(holder)
		remove_verb(holder, codespeak_procs)
	..()

/datum/perk/gunsmith
	name = "Gunsmith Master"
	desc = "You are a professional gunsmith, your knowledge allows to not only repair firearms but expertly craft them. \
			This includes the machines required to do so, including the bullet fabricator."
	icon_state = "gunsmith"

//Chef's special perk

/datum/perk/foodappraise
	name = "Spice up Food"
	desc = "Your own special, secret touch in seasoning has anomalous properties that can enhance most food products."
	active = FALSE
	passivePerk = FALSE
	icon_state = "spice"
	copy_protected = TRUE //Chefs are already under-played. No reason to destroy the role further.

/datum/perk/foodappraise/activate()
	var/mob/living/carbon/human/user = usr
	var/obj/item/reagent_containers/snacks/F = user.get_active_hand()
	if(!istype(user))
		return ..()
	if(!istype(F, /obj/item/reagent_containers/snacks))
		to_chat(usr, SPAN_NOTICE("You can only season food items!"))
		return FALSE
	if(F.appraised == 1)
		to_chat(usr, SPAN_NOTICE("This food item has already been seasoned!"))
		return FALSE
	to_chat(usr, SPAN_NOTICE("You quickly sprinkle some of your anomalous seasoning onto the food item, revealing its hidden properties."))
	//log_and_message_admins("used their [src] perk.")
	F.chef_buff_type = rand(1,9) // We assign a random bufferino.
	F.appraised = 1
	switch(F.chef_buff_type)
		if(1)
			F.name = "mentally engaging [F.name]"
		if(2)
			F.name = "mechanic's [F.name]"
		if(3)
			F.name = "caretaker's [F.name]"
		if(4)
			F.name = "vigorous [F.name]"
		if(5)
			F.name = "hardy [F.name]"
		if(6)
			F.name = "focusing [F.name]"
		if(7)
			var/newprice = rand(100,500)
			F.name = "exquisite [F.name]"
			if(F.price_tag < newprice)
				F.price_tag = newprice
		if(8)
			F.name = "nourishing [F.name]"
			F.reagents.add_reagent("nutriment", 15)
		if(9)
			F.name = "hearty [F.name]"




//Ghost spawners

/datum/perk/true_name
	name = "Rename Self"
	desc = "Nobody knows you, thus your name is whatever you need or want to be."
	active = FALSE
	passivePerk = FALSE
	var/anti_cheat = FALSE
	icon_state = "true_name"
	copy_protected = TRUE

/datum/perk/true_name/activate()
	..()
	if(anti_cheat)
		to_chat(holder, "You can only keep up so many personalities.")
		return FALSE
	anti_cheat = TRUE
	var/mob/M = usr
	var/npc_name = input(M, "Choose your name: ", "Superstar Name", "VIP") as text
	if(src && npc_name)
		M.real_name = npc_name
		M.stats.removePerk(PERK_TRUE_NAME)
	anti_cheat = FALSE
	return TRUE

/datum/perk/true_name/remove()
	..()
