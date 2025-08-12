/datum/perk/oddity
	gain_text = "You feel different. Exposure to oddities has changed you. Now you can't go back."
	copy_protected = TRUE //ALL Oddity perks blacklisted by default. Unblacklist individual ones.

/datum/perk/oddity/survivor
	name = "Survivor"
	desc = "After seeing the death of many acquaintances and friends, witnessing death doesn't shock you as much as before. \
			Halves sanity loss from seeing people die."
	icon_state = "survivor" // https://game-icons.net/1x1/lorc/one-eyed.html

/datum/perk/oddity/survivor/assign(mob/living/L)
	if(..() && ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.sanity.death_view_multiplier *= 0.5

/datum/perk/oddity/survivor/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.sanity.death_view_multiplier *= 2
	..()

/datum/perk/oddity/inspiring
	name = "Inspiring Presence"
	desc = "You know just what to say to people and are able to inspire the best - or even worst - in others. \
			People around you regain their sanity quicker."
	icon_state = "inspiringpresence"

/datum/perk/oddity/inspiring/assign(mob/living/L)
	if(..())
		holder.sanity_damage -= 2

/datum/perk/oddity/inspiring/remove()
	if(holder)
		holder.sanity_damage += 2
	..()

/datum/perk/oddity/terrible_fate
	name = "Terrible Fate"
	desc = "You realize the painful truth of death. You don't want to die and despise death - dying is a unmistakable horror to you. \
			Anyone who is around you at the moment of your death must roll a Vigilance sanity check. If they fail, their sanity will instantly be dropped to 0."
	icon_state = "murder" // https://game-icons.net/1x1/delapouite/chalk-outline-murder.html

/datum/perk/oddity/toxic_revenger
	name = "Fungal Host"
	desc = "A small hostile fungal spores were on the oddity, hijacking your lungs and forcing them to emit toxins harmful to everyone around you every half hour. It will be a long time before your body can fight this off..."
	gain_text = "You feel a terrible aching pain in your lungs - an anomalous fungus on the oddity has infused your body!"
	icon_state = "Hazmat" // https://game-icons.net
	var/cooldown = 30 MINUTES
	var/initial_time

/datum/perk/oddity/toxic_revenger/assign(mob/living/L)
	..()
	initial_time = world.time
	if(isliving(holder))
		var/mob/living/H = holder
		H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/pours, "POURS", skill_gained = 1, learner = H)

/datum/perk/oddity/toxic_revenger/on_process()
	if(!..())
		return
	if(!ishuman(holder))
		return
	var/mob/living/carbon/human/holder_man = holder
	if(holder_man.species.flags & NO_BREATHE || holder_man.internal)
		return
	if(world.time < initial_time + cooldown)
		return
	initial_time = world.time
	for(var/mob/living/carbon/human/H in viewers(5, holder_man))
		if(H.stat == DEAD || H.internal || H.stats.getPerk(PERK_TOXIC_REVENGER) || H.species.flags & NO_BREATHE)
			continue
		if(H.head?.item_flags & BLOCK_GAS_SMOKE_EFFECT || H.wear_mask?.item_flags & BLOCK_GAS_SMOKE_EFFECT || BP_IS_ROBOTIC(H.get_organ(BP_CHEST)))
			continue

		H.reagents?.add_reagent("toxin", 5)
		H.emote("cough")
		to_chat(H, SPAN_WARNING("[holder] emits a strange smell."))

/datum/perk/oddity/gunslinger
	name = "Gunslinger"
	desc = "The latent effects of an oddity have granted you an insight into firing bullets faster than anyone else; a shame it doesn't make you immune to recoil."
	gain_text = "Your trigger finger feels more relaxed than ever..."
	icon_state = "dual_shot" // https://game-icons.net/1x1/delapouite/bullet-impacts.html
	copy_protected = FALSE

/datum/perk/oddity/balls_of_plasteel
	name = "True Grit"
	desc = "Pain comes and goes, you feel as though can withstand far worse than ever before."
	gain_text = "Pain is merely weakness leaving the body."
	icon_state = "golem" // https://game-icons.net
	copy_protected = FALSE

/datum/perk/oddity/fast_walker
	name = "Springheel"
	desc = "You're sure of your movements now, slow and steady may win the race but you can prove them wrong."
	gain_text = "You feel your pace quickening, your thoughts barely catching up with your stride..."
	icon_state = "fast" // https://game-icons.net/1x1/delapouite/fast-forward-button.html
	//Unblacklist if you feel like it. For obvious reasons, Borers would LOVE to copy this to every host.

/datum/perk/oddity/fast_walker/assign(mob/living/L)
	..()
	if(holder.stats.getPerk(PERK_FAST_WALKER)) // Prevents stacking the same perk over and over for Emperor spider levels of speed. - Seb
		return FALSE

/datum/perk/oddity/harden
	name = "Natural Armor"
	desc = "Your skin has become harder, more durable, able to accept blunt force and endure."
	gain_text = "After all you've endured, you can't help but feel tougher than normal, your skin feels like iron."
	icon_state = "riotshield"
	copy_protected = FALSE

/datum/perk/oddity/harden/assign(mob/living/L)
	..()
	holder.brute_mod_perk *= 0.75 // One third of subdermal armor
	holder.mob_bomb_defense += 5
	holder.falls_mod -= 0.2

/datum/perk/oddity/harden/remove()
	holder.brute_mod_perk /= 0.75
	holder.mob_bomb_defense -= 5
	holder.falls_mod += 0.2
	..()

/datum/perk/oddity/thin_skin
	name = "Thin Skin"
	desc = "The anomaly has weakened your skin, making you less resistant to blunt trauma."
	gain_text = "You feel yourself growing softer...Did everything always hurt this much?"
	icon_state = "paper"

/datum/perk/oddity/thin_skin/assign(mob/living/L)
	..()
	holder.brute_mod_perk *= 1.25
	holder.mob_bomb_defense -= 5
	holder.falls_mod += 0.2
	if(isliving(holder))
		var/mob/living/H = holder
		H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/pours, "POURS", skill_gained = 1, learner = H)


/datum/perk/oddity/thin_skin/remove()
	holder.brute_mod_perk /= 1.25 // One third of subdermal armor
	holder.mob_bomb_defense += 5
	holder.falls_mod -= 0.2
	..()

/datum/perk/oddity/better_toxins
	name = "Toxic Resistance"
	desc = "You've been exposed to something toxic, yet your body fought it off and is now strengthened against poisoning as a result."
	gain_text = "What doesn't kill you, helps you survive it better."
	icon_state = "alch"
	copy_protected = FALSE

/datum/perk/oddity/better_toxins/assign(mob/living/L)
	..()
	holder.toxin_mod_perk -= 0.1 //Might be to high...

/datum/perk/oddity/better_toxins/remove()
	holder.toxin_mod_perk += 0.1
	..()

/datum/perk/oddity/shell_shock
	name = "Shell Shock"
	desc = "Why are you not getting better at fighting? Why do mere roaches keep tumbling you down? Your body is weakened by self doubt and despair..."
	gain_text = "Things just get harder and harder..."
	icon_state = "shock"

/datum/perk/oddity/shell_shock/assign(mob/living/L)
	..()
	holder.stats.changeStat(STAT_ROB, -5)
	holder.stats.changeStat(STAT_TGH, -5)
	holder.stats.changeStat(STAT_VIG, -5)
	if(isliving(holder))
		var/mob/living/H = holder
		H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/poors, "POORS", skill_gained = 1, learner = H)


/datum/perk/oddity/shell_shock/remove()
	holder.stats.changeStat(STAT_ROB, 5)
	holder.stats.changeStat(STAT_TGH, 5)
	holder.stats.changeStat(STAT_VIG, 5)
	..()

/datum/perk/oddity/failing_mind
	name = "Failing Mind"
	desc = "The mind fogs, blanking out, always distracted. Did that anomaly make you dumber, or where you always like this?"
	gain_text = "The world is not as clear as it once was."
	icon_state = "brainrot"

/datum/perk/oddity/failing_mind/assign(mob/living/L)
	..()
	holder.stats.changeStat(STAT_COG, -5)
	holder.stats.changeStat(STAT_MEC, -5)
	holder.stats.changeStat(STAT_BIO, -5)
	if(isliving(holder))
		var/mob/living/H = holder
		H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/poors, "POORS", skill_gained = 1, learner = H)


/datum/perk/oddity/failing_mind/remove()
	holder.stats.changeStat(STAT_COG, 5)
	holder.stats.changeStat(STAT_MEC, 5)
	holder.stats.changeStat(STAT_BIO, 5)
	..()

/datum/perk/oddity/snackivore
	name = "Snackivore"
	desc = "The secret of the lounge lizards! Your body adapts to eating the worse kind of food in existence, allowing you to draw an exceptional amount of nutrition from snack foods. More so \
	it passively heals you like tricord, with pure toxins healing you the most. Rejoice trash mammals!"
	passivePerk = TRUE

/datum/perk/oddity/sharp_mind
	name = "Sharpened Mind"
	desc = "Narrowing in and extrapolating the inner workings of the world has never felt so much easier."
	gain_text = "The mind can over come any puzzle thrown at it!"
	icon_state = "brain"

/datum/perk/oddity/sharp_mind/assign(mob/living/L)
	..()
	holder.stats.changeStat(STAT_COG, 5)
	holder.stats.changeStat(STAT_MEC, 5)
	holder.stats.changeStat(STAT_BIO, 5)

/datum/perk/oddity/sharp_mind/remove()
	holder.stats.changeStat(STAT_COG, -5)
	holder.stats.changeStat(STAT_MEC, -5)
	holder.stats.changeStat(STAT_BIO, -5)
	..()

/datum/perk/oddity/strangth
	name = "Inner Strength"
	desc = "You're more keenly aware of your own abilities for combat. You feel more confident on your punches thrown, a bit tougher against those thrown at you, and you're starting to get the hang of shooting that one bulky gun..."
	gain_text = "The blood pumps, the muscles harden, and your trigger finger feels easier than ever..."
	icon_state = "muscular"
	copy_protected = FALSE

/datum/perk/oddity/strangth/assign(mob/living/L)
	..()
	holder.stats.changeStat(STAT_ROB, 5)
	holder.stats.changeStat(STAT_TGH, 5)
	holder.stats.changeStat(STAT_VIG, 5)

/datum/perk/oddity/strangth/remove()
	holder.stats.changeStat(STAT_ROB, -5)
	holder.stats.changeStat(STAT_TGH, -5)
	holder.stats.changeStat(STAT_VIG, -5)
	..()

/datum/perk/oddity/iron_will
	name = "Will of Iron"
	desc = "The body is able to succumb to many negative affects but the mind can simply ignore them. Getting addicted to things is much harder and you can stomach more chemicals."
	icon_state = "ironpill" // https://game-icons.net/1x1/lorc/underdose.html
	copy_protected = FALSE

/datum/perk/oddity/iron_will/assign(mob/living/L)
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.addiction_chance_multiplier = 0.2
		H.metabolism_effects.nsa_bonus += 20
		H.metabolism_effects.calculate_nsa()

/datum/perk/oddity/iron_will/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.addiction_chance_multiplier = 1
		H.metabolism_effects.nsa_bonus -= 20
		H.metabolism_effects.calculate_nsa()
	..()

/datum/perk/oddity/mind_of_matter
	name = "Will to Power"
	desc = "The mind protects the body by imposing limits to prevent severe harm to the self. With enough focus, you can push yourself past that limit."
	icon_state = "ironpill" // https://game-icons.net/1x1/lorc/underdose.html
	copy_protected = FALSE

/datum/perk/oddity/mind_of_matter/assign(mob/living/L)
	..()
	holder.maxHealth += 20
	holder.health += 20

/datum/perk/oddity/mind_of_matter/remove()
	holder.maxHealth -= 20
	holder.health -= 20
	..()

/datum/perk/oddity/side_loading
	name = "Side Loading"
	desc = "Guns that can be side-loaded will tell you when examined. \
	When onehanding most some guns, you will automatically reload them if in your offhand you hold additional shells."
	gain_text = "Reloading with a simple mind is almost second nature..."
	lose_text = "The reloading from the side is more complicated..."
	icon_state = "plus_one" // https://game-icons.net/1x1/lorc/gears.html
	copy_protected = FALSE

/datum/perk/oddity/side_loading/assign(mob/living/L)
	..()
	holder.stats.changeStat(STAT_COG, -5)
	holder.stats.changeStat(STAT_VIG, 5)

/datum/perk/oddity/side_loading/remove()
	holder.stats.changeStat(STAT_COG, 5)
	holder.stats.changeStat(STAT_VIG, -5)
	..()

//IDK how to explain this in the desc on how it all works
/datum/perk/oddity/overbreath
	name = "Overbreath"
	desc = "When closer to death every step is more poised. \
	When first gainned ablative armor is given, \
	when getting Res Sickness, additional ablative armor is given. \
	When blocking you gain additional ablative armor based on how much health is missing."
	gain_text = "Mounting damage just means you should evade more."
	lose_text = "Wounds once more make taking steps harder."
	icon_state = "overbreath"

/datum/perk/oddity/overbreath/assign(mob/living/L)
	..()
	holder.mob_ablative_armor += 15

/datum/perk/oddity/overbreath/remove()
	if(holder.mob_ablative_armor >= 15)
		holder.mob_ablative_armor -= 15
	else
		holder.mob_ablative_armor = 0
	..()

//Both of these do different stuff
/datum/perk/oddity/resilience
	name = "Resilience"
	desc = "Do to being a higher grade, your body has become more armored."
	gain_text = "Small cuts and burns seem impossible to get."
	lose_text = "Paper cuts are harmful once more."
	icon_state = "resiliance"

/datum/perk/oddity/tank_resilience
	name = "Tank Resilience"
	desc = "The slower you are the easier it is to block and brace yourself for incoming damage."
	gain_text = "Slow and steady wins the race."
	lose_text = "Speed is king."
	icon_state = "tank_resiliance"


///////////////////////////////////////
//////// JOB ODDITYS PERKS ////////////
///////////////////////////////////////

/datum/perk/nt_oddity
	gain_text = "The Absolute chose you to expand its will."
	copy_protected = TRUE //For obvious reasons.

/datum/perk/nt_oddity/holy_light
	name = "Holy Light"
	desc = "You have been blessed by the grace of the Absolute. You now provide a weak healing aura, healing both brute and burn damage to any cruciform bearers nearby as well as yourself."
	icon_state = "third_eye"  //https://game-icons.net/1x1/lorc/third-eye.html
	var/healing_power = 0.1
	var/cooldown = 1 SECONDS // Just to make sure that perk don't go berserk.
	var/initial_time

/datum/perk/nt_oddity/holy_light/assign(mob/living/L)
	..()
	initial_time = world.time

/datum/perk/nt_oddity/holy_light/on_process()
	if(!..())
		return
	if(!holder.get_core_implant(/obj/item/implant/core_implant/cruciform))
		return
	if(world.time < initial_time + cooldown)
		return
	initial_time = world.time
	for(var/mob/living/L in viewers(holder, 7))
		if(ishuman(L))
			var/mob/living/carbon/human/H = L
			if(H.stat == DEAD || !(H.get_core_implant(/obj/item/implant/core_implant/cruciform)))
				continue
			H.adjustBruteLoss(-healing_power)
			H.adjustFireLoss(-healing_power)

/datum/perk/bluespace
	name = "Bluespace Alignement"
	desc = "The Tuning Device is taxing on the mind but rewarding... Along with some other side affects..."
	gain_text = "Having stared too much into the abyss that is Bluespace itself, you can't help but feel its gaze staring back at you."
	lose_text = "The death heat of the universe strays further away... for now."
	icon_state = "vortex"
	var/initial_time
	copy_protected = TRUE //Hm yes how about I crash bluespace again

/datum/perk/bluespace/assign(mob/living/L)
	..()
	initial_time = world.time
	cooldown_time = world.time + rand(20, 60) MINUTES
	holder.stats.changeStat(STAT_COG, 5) //We keep this 5 per use
	if(holder?.stats)
		if(!holder.stats.getPerk(PERK_SI_SCI) && prob(60))
			GLOB.bluespace_entropy += rand(80, 150) //You done fucked it up.
		if(holder.stats.getPerk(PERK_SI_SCI) && prob(50))
			GLOB.bluespace_entropy -= rand(20, 30) //High odds to do even better!
	GLOB.bluespace_entropy -= rand(30, 50)

/datum/perk/bluespace/remove(mob/living/carbon/human/H)
	if(!H.stats?.getPerk(PERK_SI_SCI) && prob(30))
		GLOB.bluespace_entropy += rand(80, 150)
	if(H.stats?.getPerk(PERK_SI_SCI) && prob(50))
		GLOB.bluespace_entropy -= rand(20, 30)
	GLOB.bluespace_entropy += rand(30, 50)
	..()

/datum/perk/bluespace/on_process()
	if(!..())
		return
	if(cooldown_time <= world.time)
		holder.stats.removePerk(type)
		to_chat(holder, SPAN_NOTICE("[lose_text]"))
		return
	if(holder.buckled)
		cooldown_time -= 5 SECONDS //Resting grately speeds this up

/datum/perk/guild/blackbox_insight
	name = "Blackbox Tinkering"
	desc = "It's sleek contours, the expert craftsmanship... The best of hand-made mechanical genius."
	gain_text = "What wondrous possibilities..."
	icon_state = "tinker"
	copy_protected = TRUE

/datum/perk/guild/blackbox_insight/assign(mob/living/L)
	..()
	holder.stats.changeStat(STAT_COG, 15)
	holder.stats.changeStat(STAT_MEC, 15)

/datum/perk/guild/blackbox_insight/remove()
	holder.stats.changeStat(STAT_COG, -10) //we keep 5 of each
	holder.stats.changeStat(STAT_MEC, -10)
	..()


//////////////
//Drug Perks//
//////////////

//Basically for drugs to apply a perk for a set amount of time..

/datum/perk/drug/ultrasurgeon
	name = "Ultrasurgeon Knowledge"
	desc = "After your fix of ultrasurgeon you can feel your mind ease just as your muscles relax."
	copy_protected = TRUE

/datum/perk/njoy
	name = "Njoy (Active)"
	desc = "Your mind can focus on what is real, just like when you get rid of a painful earring."
	icon_state = "cheerful"  //https://game-icons.net/1x1/lorc/cheerful.html
	copy_protected = TRUE
	gain_text = "Your mind feels much clearer now."
	lose_text = "You feel the shadows once more."

/datum/perk/njoy/assign(mob/living/L)
	if(..() && ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.sanity.insight_gain_multiplier *= 0.5

/datum/perk/njoy/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.sanity.insight_gain_multiplier *= 2
	..()

