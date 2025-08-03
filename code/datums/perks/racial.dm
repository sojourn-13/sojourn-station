//Perks for racial options, make sure to keep this organized.
//Perks can be both active and passive.


/////////////////////////////////////Sablekyne perks
/datum/perk/laststand
	name = "Last Stand"
	desc = "As a sablekyne your body is a tank, through will and biology you can ignore pain entirely for a short amount of time."
	icon_state = "laststand"
	active = FALSE
	passivePerk = FALSE

/datum/perk/laststand/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your nerves are shot, you'll need to recover before you can withstand greater pain again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("<b><font color='red'>[user] begins growling as their muscles tighten!</font><b>", "<b><font color='red'>You feel a comfortable warmth as your body steels itself against all pain.</font><b>", "<b><font color='red'>You hear something growling!</font><b>")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("sabledone", 10)
	return ..()

/datum/perk/bone
	name = "Bone Plated"
	desc = "All sablekyne are covered in bone-like plating across various parts of the body, this layer of natural armor along the shins, thighs, fore-arms, and shoulders allow you to absorb impacts better than anyone, adding a further tolerance to pain."
	icon_state = "shield"

/datum/perk/brawn
	name = "Brawny Build"
	desc = "All sablekyne are stocky and built wide, your brawny build and low center of gravity gives you exceptional balance. Few beasts can knock you down and not even the strongest men can push you over."
	icon_state = "muscular" // https://game-icons.net

/datum/perk/brawn/assign(mob/living/L)
	..()
	holder.mob_bump_flag = HEAVY

/datum/perk/brawn/remove()
	holder.mob_bump_flag = ~HEAVY
	..()

///////////////////////////////////////Mar'qua perks
/datum/perk/suddenbrilliance
	name = "Sudden Brilliance"
	desc = "Your intelligence is above the 'lesser races' and even the humblest of Mar'qua can prove it easily in moments of focus. Use this to center your thoughts and increase all your mental abilities."
	icon_state = "suddenbrilliance"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/suddenbrilliance/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You are mentally exhausted, you'll need more rest before you can attempt greater thought."))
		return FALSE
	cooldown_time = world.time + 25 MINUTES
	user.visible_message("[user] suddenly looks lost in thought, their focus elsewhere for a moment.", "You clear your mind and feel your thoughts focusing into a single stream of brilliance.", "You hear the calming silence, as if someone nearby is thinking deeply.")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("marquatol", 10)
	return ..()

/datum/perk/inspired
	name = "Inspired Intellect"
	desc = "Even the most humble Mar'qua is capable of study and extrapolation, your natural intellect allows you to become gain inspiration more easily."
	icon_state = "inspiredintellect"
	copy_protected = TRUE

/datum/perk/alien_nerves
	name = "Adapted Nervous System"
	desc = "A mar'qua's nervous system has long since adapted to the use of stimulants, chemicals, and different toxins. Unlike lesser races, you can handle a wide variety of chemicals before showing any side effects and you'll never become addicted."
	icon_state = "adaptednervoussystem"
	copy_protected = TRUE

/datum/perk/alien_nerves/assign(mob/living/L)
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.addiction_chance_multiplier = -1
		H.metabolism_effects.nsa_bonus += 300
		H.metabolism_effects.calculate_nsa()

/datum/perk/alien_nerves/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.addiction_chance_multiplier = 1
		H.metabolism_effects.nsa_bonus -= 300
		H.metabolism_effects.calculate_nsa()
	..()

//////////////////////////////////////Human perks
/datum/perk/iwillsurvive
	name = "Will to Survive"
	desc = "Your determination to survive and push on takes precedent before your other instincs making you ignore some of your pain and letting your body recover faster."
	icon_state = "willtosurvive"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/iwillsurvive/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("The human body can only take so much, you'll need more time before you've recovered enough to use this again."))
		return FALSE
	cooldown_time = world.time + 10 MINUTES
	user.visible_message("[user] grits their teeth and begins breathing slowly.", "You grit your teeth and remind yourself you ain't got time to bleed!")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("adrenol", 5)
	return ..()

/datum/perk/battlecry
	name = "Inspiring Battlecry"
	desc = "Life has taught you that beyond sheer force of will, what made your kind conquer the stars was also a sense of camaraderie and cooperation among your battle brothers and sisters. Your heroic warcry can inspire yourself and others to better performance in combat."
	icon_state = "inspiringbattlecry"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE //It would be extremely funny but I don't think we want the entire colony to be able to buff themselves infinitely

/datum/perk/battlecry/activate()
	var/mob/living/carbon/human/user = usr
	var/list/people_around = list()
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You cannot muster the willpower to have a heroic moment just yet."))
		return FALSE
	cooldown_time = world.time + 30 MINUTES
	log_and_message_admins("used their [src] perk.")
	for(var/mob/living/carbon/human/H in view(user))
		if(H != user && !isdeaf(H))
			people_around.Add(H)
	if(people_around.len > 0)
		for(var/mob/living/carbon/human/participant in people_around)
			to_chat(participant, SPAN_NOTICE("You feel inspired by a heroic shout!"))
			give_boost(participant)
	give_boost(usr)
	usr.emote("urah")
	return ..()

/datum/perk/battlecry/proc/give_boost(mob/living/carbon/human/participant)
	var/effect_time = 2 MINUTES
	var/amount = 10
	var/list/stats_to_boost = list(STAT_ROB = 10, STAT_TGH = 10, STAT_VIG = 10)
	for(var/stat in stats_to_boost)
		participant.stats.changeStat(stat, amount)
		addtimer(CALLBACK(src, PROC_REF(take_boost), participant, stat, amount), effect_time)

/datum/perk/battlecry/proc/take_boost(mob/living/carbon/human/participant, stat, amount)
	participant.stats.changeStat(stat, -amount)

/datum/perk/tenacity
	name = "Tenacity"
	desc = "Humans were always resilient, not letting anything or anyone to get in way of their goals. Due to this your body is way more adapted to anything thrown it's way letting you push onward for just a little bit longer than others."
	icon_state = "tenacity"
	copy_protected = TRUE

/datum/perk/linguist_for_humans
	name = "Diverse Culture"
	desc = "Sol Fed conquering the stars led to almost every human having diverse knowledge of different languages."
	icon_state = "diverseculture"
	active = FALSE
	passivePerk = FALSE
	var/anti_cheat = FALSE
	copy_protected = TRUE

/datum/perk/linguist_for_humans/activate()
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
	options["Akula"] = LANGUAGE_AKULA
	options["Narad Pidgin"] = LANGUAGE_MERP
	var/choice = input(M,"Which language do you know?","Linguist Choice") as null|anything in options
	if(src && choice)
		M.add_language(choice)
		M.stats.removePerk(PERK_DIVERSE_CULTURE)
	anti_cheat = FALSE
	return TRUE

/datum/perk/linguist_for_humans/remove()
	..()

//////////////////////////////////////Kriosan perks
/datum/perk/enhancedsenses
	name = "Enhance Senses"
	desc = "You're a predator at heart and have the senses to match, for a short time your body toughens and your aim improves drastically as your senses enhance."
	icon_state = "enhancesenses"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/enhancedsenses/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You haven't quite recovered yet, your senses need more time before you may use this again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("<b><font color='red'>[user] sneers lightly as their pupils dilate and tension builds in their body!</font><b>", "<b><font color='red'>You feel your senses focusing, sound becomes crystal clear and your reflexes as fluid as water.</font><b>")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("kriotol", 5)
	return ..()

/datum/perk/exceptional_aim
	name = "Instinctual Skill"
	desc = "All kriosans understand the dynamics of shooting, to such a degree that guns are more extensions to one's hand than weapon. You take no penalty when firing any range weapon one handed."
	icon_state = "instinctualskill"
	copy_protected = TRUE

////////////////////////////////////////Akula perks
/datum/perk/recklessfrenzy
	name = "Reckless Frenzy"
	desc = "Your body is powerful and strong when you succumb to instinct, but doing so leaves you without much higher reasoning for a short time. The rush of chemicals is also highly addictive \
	and often times will leave your body weaker for a short time."
	icon_state = "recklessfrenzy"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/recklessfrenzy/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body has been taxed to its limits, you need more time to recover before using this ability again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("<b><font color='red'>[user] lets out deep guttural growl as their eyes glaze over!</font><b>", "<b><font size='3px'><font color='red'>You abandon all reason as your sink into a blood thirsty frenzy!</font><b>", "<b><font color='red'>You hear a terrifying roar!</font><b>")
	playsound(usr.loc, 'sound/voice/akularoar.ogg', 50, 1)
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("robustitol", 5)
	return ..()

/datum/perk/iron_flesh
	name = "Iron Flesh"
	desc = "Akula scales are not only tough and resistant to damage but exceptionally skilled at naturally forcing out embedded objects that somehow punch through. You'll never get a bullet nor object stuck inside when hit."
	icon_state = "ironflesh"
	copy_protected = TRUE

////////////////////////////////////////Naramad perks
/datum/perk/adrenalineburst
	name = "Adrenaline Burst"
	desc = "Naramads are built for extreme speed, be it for charging forward and retreating back."
	icon_state = "adrenalineburst"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/adrenalineburst/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your legs ache, you'll need more time to recover before using this again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] begins breathing much quicker as they let out a merp!", "You feel your heart rate increasing rapidly as everything seems to speed up and you let out an excited merp!", "You hear a loud merp...")
	playsound(usr.loc, 'sound/voice/merp.ogg', 50, 1)
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("naratonin", 5)
	return ..()

/datum/perk/stay_hydrated
	name = "Hydration Reliance"
	desc = "Naramad have adapted biology heavily reliant on the intake of fluids, in particular clean clear water. Drinking purified water, even tap water, heals your body slowly, as if you drank tricordizine!"
	icon_state = "hydrationreliance"
	copy_protected = TRUE

/datum/perk/born_warrior
	name = "Born Warrior"
	desc = "No matter their background all naramadi are capable bringing any object to bear as a weapon, be it bladed or blunt. Unlike other races your grip is iron and you'll never lose your weapon through embedding it in an enemy."
	icon_state = "bornwarrior"
	copy_protected = TRUE

/////////////////////////////////////////Cindarite perks
/datum/perk/purgetoxins
	name = "Purge Toxins"
	desc = "You force your body to begin the process of removing toxins from your blood. All toxins, addictions, and stimulants are slowly purged while any toxin damage to your liver or body is healed but the effect leaves you exhausted."
	icon_state = "purgetoxins"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/purgetoxins/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body aches with the pain of its recent purge, you'll need more rest before using this effect again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] shivers slightly as they begin to slow down.", "You start to feel quite chilly and tired as your body begins purging toxins within your blood.")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("cindpetamol", 5)
	return ..()

/datum/perk/purgeinfections
	name = "Uncanny Resiliance"
	desc = "Your body is adept not only at curing toxins and regulating its blood flow but also fighting off infections and disease in any form. All infections within you are slowly cured and diseases progression slowed if not outright cured, similar to as if you were injected with spaceacillin. Severe infections or late stage diseases may still need additional medical aid and this cannot restore necrotic tissue."
	icon_state = "uncannyresiliance"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/purgeinfections/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your chemical sacks have not refilled yet, you'll need more rest before using this effect again."))
		return FALSE
	cooldown_time = world.time + 30 MINUTES
	user.visible_message("[user] shivers slightly before taking a deep breath.", "You shiver slightly and take a deep breath before willing your bodies chemical sacks to open and begin purging infections.")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("cindicillin", 5)
	return ..()

/datum/perk/second_skin
	name = "Second Skin"
	desc = "Cindarites, be they bunker born or spacers, are used to wearing bulky enviromental suits. This life time of being acclimated to heavy clothing has become a second skin for many, allowing you to remove clothing instantly and never suffer slowdown from heavy armor."
	icon_state = "secondskin"
	copy_protected = TRUE

///////////////////////////////////////////Opifex perks
/datum/perk/opifex_backup
	name = "Smuggled Tools"
	desc = "You retrieve your custom made quality tools hidden on your person somewhere, along with the opifex-made black webbing vest that holds them. As every opifex is told, never go anywhere without your kit. This kit is also yours alone and a specialized suite of tools, unless you're upgrading to new tools you should not ever sell or give these away."
	icon_state = "smuggledtools"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/opifex_backup/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You've already retrieved your set of back up tools. You didn't lose them, did you?"))
		return FALSE
	cooldown_time = world.time + 12 HOURS
	to_chat(usr, SPAN_NOTICE("You discreetly and stealthily slip your back up tools out from their hiding place, the webbing unfolds as it quietly flops to the floor."))
	log_and_message_admins("used their [src] perk.")
	new /obj/item/storage/belt/utility/opifex/full(usr.loc)
	spawn(20) holder.stats.removePerk(src.type) // Delete the perk
	return ..()

/datum/perk/opifex_backup_medical
	name = "Smuggled Medicine"
	desc = "You retrieve your custom kitted medical webbing hidden on your person somewhere, along with the opifex-made black webbing vest that holds them. As every opifex is told, never go anywhere without your kit. This tool belt is yours alone and you should not allow any non-opifex to use it."
	icon_state = "smuggledmedicine"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/opifex_backup_medical/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You've already retrieved your set of backup medicine. You didn't lose them, did you?"))
		return FALSE
	cooldown_time = world.time + 12 HOURS
	to_chat(usr, SPAN_NOTICE("You discreetly and stealthily slip your back up webbing and surgery kit out from their hiding place, the webbing unfolds as it quietly flops to the floor."))
	log_and_message_admins("used their [src] perk.")
	new /obj/item/storage/belt/medical/opifex/full(usr.loc)
	new /obj/item/storage/firstaid/surgery(usr.loc)
	spawn(20) holder.stats.removePerk(src.type) // Delete the perk
	return ..()


/datum/perk/opifex_backup_combat
	name = "Smuggled Armaments"
	desc = "You retrieve your custom kitted combat belt hidden on your person somewhere, along with the opifex-made black webbing vest that holds them. As every opifex is told, never go anywhere without your kit. This tool belt is yours alone and you should not allow any non-opifex to use it, nor the weapons within."
	icon_state = "smuggledarmaments"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/opifex_backup_combat/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You've already retrieved your set of backup weapons. You didn't lose them, did you?"))
		return FALSE
	cooldown_time = world.time + 12 HOURS
	to_chat(usr, SPAN_NOTICE("You discreetly and stealthily slip your back up belt out from their hiding place, the webbing unfolds as it quietly flops to the floor."))
	log_and_message_admins("used their [src] perk.")
	new /obj/item/storage/belt/security/tactical/opifex/full(usr.loc)
	spawn(20) holder.stats.removePerk(src.type) // Delete the perk
	return ..()

/datum/perk/opifex_turret
	name = "Smuggled Circuit"
	desc = "Opifex are scavengers at heart and rely heavily on machines and AI as a result, as such, each opifex keeps a specially designed circuit on their person to build a make shift defense platform when needed to secure their safety. Sadly, you only managed to smuggle the circuit on your person."
	icon_state = "smuggledcircuit"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/opifex_turret/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You've already retrieved your scrap circuit. You didn't lose it, did you?"))
		return FALSE
	cooldown_time = world.time + 12 HOURS
	to_chat(usr, SPAN_NOTICE("You discreetly and stealthily slip your smuggled circuit out from their hiding place, the plastic and metal device clattering on the floor."))
	log_and_message_admins("used their [src] perk.")
	new /obj/item/circuitboard/artificer_turret/opifex(usr.loc)
	spawn(20) holder.stats.removePerk(src.type) // Delete the perk
	return ..()

/datum/perk/opifex_patchkit
	name = "Smuggled Patch Kit"
	desc = "Every opifex carries their own personal IFAK stashed somewhere. Being practical is the best option, after all, and the colony is a dangerous place."
	icon_state = "smuggledpatchkit"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/opifex_patchkit/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You've already retrieved your patch kit. You didn't lose it, did you?"))
		return FALSE
	cooldown_time = world.time + 12 HOURS
	to_chat(usr, SPAN_NOTICE("You discreetly and stealthily slip your smuggled patch kit out from their hiding place, the cloth pouch clattering on the floor."))
	log_and_message_admins("used their [src] perk.")
	new /obj/item/storage/firstaid/ifak(usr.loc)
	spawn(20) holder.stats.removePerk(src.type) // Delete the perk
	return ..()

////////////////////////////////////////////Cht'mant perks
/datum/perk/spiderfriend
	name = "Kin to the Spiders"
	desc = "Through a combination of pheromones, appearance, and an innate understanding of spider behavior all spiders are friendly to you, they won't attack you even if you attack them. This change \
	in your biology and pheromones however make you an enemy to roaches. As a side effect of dealing with spiders so often, you can't be slowed or stuck by webbing."
	icon_state = "muscular" // https://game-icons.net
	copy_protected = TRUE

/datum/perk/spiderfriend/assign(mob/living/L)
	..()
	holder.faction = "spiders"

/datum/perk/spiderfriend/remove()
	holder.faction = "neutral"
	..()

/datum/perk/webmaker
	name = "Spin Webs"
	desc = "You can spin webs, spreading them around a location as a form of snaring barricade."
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/webmaker/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You need a bit more time to build up your web reserves!"))
		return FALSE
	cooldown_time = world.time + 5 SECONDS
	user.visible_message("[user] begins secreting and spreading web material around them.", "You begin secreting and spreading your webbing around.", "You hear an uncomfortable chittering noise.")
	//log_and_message_admins("used their [src] perk.") //commented out due to spam in the logs.
	new /obj/effect/spider/stickyweb/chtmant(usr.loc)
	return ..()

/datum/perk/ichor
	name = "Produce Ichor"
	desc = "As a member of the Ru caste your ability to produce chemicals is well known, though it takes an hour to recover and much of your nutritional in-take you can produce clumped ichors that function as medical kits."
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/ichor/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body hasn't finished recovering, you will need to wait a bit longer."))
		return FALSE
	if(usr.nutrition <= 350)
		to_chat(usr, SPAN_NOTICE("You do not have enough nutrition to produce more ichor, find things to eat!"))
		return FALSE
	cooldown_time = world.time + 1 HOURS
	usr.nutrition -= 350
	user.visible_message("<b><font color='red'>[user] vomits different colored slime onto the floor!</font><b>", "<b><font color='red'>You vomit out your healing ichors onto the floor!</font><b>", "<b><font color='red'>You hear a retching noise!</font><b>")
	log_and_message_admins("used their [src] perk.")
	playsound(usr.loc, 'sound/effects/blobattack.ogg', 50, 1)
	new /obj/item/stack/medical/bruise_pack/advanced/mending_ichor(usr.loc)
	new /obj/item/stack/medical/ointment/advanced/regenerative_ichor(usr.loc)
	new /obj/item/stack/ichor/purging_ichor(usr.loc)
	return ..()

/datum/perk/chitinarmor
	name = "Chitin Armor"
	desc = "Unlike other caste in the cht'mant hive you are built for combat, while not as naturally tough as other species you can tank a few more blows than your softer insectile brethren."
	icon_state = "paper"
	copy_protected = TRUE

/datum/perk/chitinarmor/assign(mob/living/L)
	..()
	holder.brute_mod_perk *= 0.80 // I need to know what type of stuff people were smoking before my change here
	holder.mob_bomb_defense += 5
	holder.falls_mod -= 0.2

/datum/perk/chitinarmor/remove()
	holder.brute_mod_perk /= 0.80
	holder.mob_bomb_defense -= 5
	holder.falls_mod += 0.2
	..()

/datum/perk/scuttlebug
	name = "Scuttlebug"
	desc = "While your definitive purpose is not as clearly defined as other castes within the cht'mant hive your constant movement and labors have made you quite used to the hustle and bustle, letting you run faster than most races."
	icon_state = "scuttlebug"
	copy_protected = TRUE

/datum/perk/repair_goo
	name = "Produce Repair Goo"
	desc = "Fixing things is apart of your caste as it is scuttling around keeping yourself busy. As such you can vomit out glue-like goo that functions exceptionally well for tool and general repairs."
	icon_state = "repairgoo"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/repair_goo/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body hasn't finished recovering, you will need to wait a bit longer."))
		return FALSE
	if(usr.nutrition <= 350)
		to_chat(usr, SPAN_NOTICE("You do not have enough nutrition to produce more goo, find things to eat!"))
		return FALSE
	cooldown_time = world.time + 1 HOURS
	usr.nutrition -= 350
	user.visible_message("<b><font color='red'>[user] vomits a sticky gray tar onto the floor!</font><b>", "<b><font color='red'>You vomit out your repair goo onto the floor!</font><b>", "<b><font color='red'>You hear a retching noise!</font><b>")
	log_and_message_admins("used their [src] perk.")
	playsound(usr.loc, 'sound/effects/blobattack.ogg', 50, 1)
	new /obj/item/tool/tape_roll/repair_goo(usr.loc)
	return ..()

///////////////////////////// Folken Perks

/datum/perk/oddity_reroll
	name = "Modify Oddity"
	desc = "You reach into your understanding of this natural world to alter the latent effects of an oddity, enhancing the properties it has."
	icon_state = "modifyoddity"
	active = FALSE
	passivePerk = FALSE
	copy_protected = TRUE

/datum/perk/oddity_reroll/activate()
	var/mob/living/carbon/human/user = usr
	var/obj/item/oddity/O = user.get_active_hand()
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("The natural forces around you cannot be manipulated just yet."))
		return FALSE
	if(!istype(O, /obj/item/oddity))
		to_chat(usr, SPAN_NOTICE("This isn't the correct kind of oddity!"))
		return FALSE
	cooldown_time = world.time + 45 MINUTES
	user.visible_message("<b><font color='green'>[user] concentrates on the anomaly in their hand, something about it changing in a subtle way.</font><b>", "<b><font color='green'>You focus on the energies around the object, swaying them to your will and enhancing it!</font><b>")
	log_and_message_admins("used their [src] perk.")
	if(O.oddity_stats)
		if(O.random_stats)
			for(var/stat in O.oddity_stats)
				O.oddity_stats[stat] = (rand(1, O.oddity_stats[stat]) + 3)

/datum/perk/folken_healing
	name = "Folken Photo-Healing"
	desc = "As a Folken, you can use the light to heal wounds, standing in areas of bright light will increase your natural regeneration."
	icon_state = "folkenphotohealing"
	passivePerk = TRUE
	copy_protected = TRUE

/datum/perk/folken_healing/young
	name = "Folken Photo-Healing"
	desc = "As a Folken, you can use the light to heal wounds, standing in areas of bright light will increase your natural regeneration. Due to your comparitively young age, you heal much faster than older folken."
	var/replaced = FALSE // Did it replace the normal folken healing?
	copy_protected = TRUE

/datum/perk/folken_healing/young/assign(mob/living/L)
	..()
	if(holder.stats.getPerk(PERK_FOLKEN_HEALING)) // Does the user has the folken healing perk?
		holder.stats.removePerk(PERK_FOLKEN_HEALING) // Remove the old healing.
		replaced = TRUE

/datum/perk/folken_healing/young/remove()
	if(replaced) // Did the perk replaced the normal healing perk?
		holder.stats.addPerk(PERK_FOLKEN_HEALING) // Give back the replaced perk
	..()

////////////////////////////// Mycus Perks

/datum/perk/dark_heal
	name = "Mycus Regeneration"
	desc = "As a mycus, you heal as long as you are in the darkness, increasing your natural regeneration."
	icon_state = "mycusregeneration"
	passivePerk = TRUE
	copy_protected = TRUE

/datum/perk/mushroom_follower
	name = "Spawn Shroomling"
	desc = "Shroomlings are animal-intelligence mycus capable of following simple orders like 'Shroomling 'Name' Follow.' and 'Shroomling 'Name' Stop.' who will stay by you when ordered. While capable of fighting, they are quite weak, the \
	major benefit of having one is they may turn any food you feed into them into useful healing chemicals contained in bottles of resin."
	icon_state = "spawnshroomling"
	active = FALSE
	passivePerk = FALSE
	var/used = FALSE // Not deleting after use since the description is useful.
	var/follower_type = /mob/living/carbon/superior/fungi/shroom
	copy_protected = TRUE

/datum/perk/mushroom_follower/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(used)
		to_chat(user, SPAN_NOTICE("You've already created your companion, you didn't lose them did you?"))
		return FALSE
	used = TRUE
	to_chat(usr, SPAN_NOTICE("You grow a follower!"))
	var/mob/living/carbon/superior/fungi/mushroom = new follower_type(user.loc)
	mushroom.friends += user
	mushroom.following = user
	mushroom.last_followed = user
	..()

/datum/perk/slime_follower
	name = "Spawn Slime-Mold"
	desc = "Slime-mold shroomlings are animal-intelligence mycus capable of following simple orders like 'Slime-Mold 'Name' Follow.' and 'Slimd-Mold 'Name' Stop.' who will stay by you when ordered. Slime-molds are made for combat, being \
	incredibly sturdy and physically strong, able to regenerate even the worst wounds. Unfortunately they suffer from poor eyesight, requiring threats to get close before they notice them."
	icon_state = "spawnslimemold"
	active = FALSE
	passivePerk = FALSE
	var/used = FALSE // Not deleting after use since the description is useful.
	var/follower_type = /mob/living/carbon/superior/fungi/slime
	copy_protected = TRUE

/datum/perk/slime_follower/activate()
	var/mob/living/carbon/human/user = usr

	if(!istype(user))
		return ..()
	if(used)
		to_chat(user, SPAN_NOTICE("You've already created your companion, you didn't lose them did you?"))
		return FALSE
	used = TRUE
	to_chat(usr, SPAN_NOTICE("You grow a follower!"))
	var/mob/living/carbon/superior/fungi/mushroom = new follower_type(user.loc)
	mushroom.friends += user
	mushroom.following = user
	mushroom.last_followed = user
	..()

// Food related perks
/datum/perk/carnivore
	name = "Carnivore"
	desc = "For whatever reason, be it genetics or racial inclination, you are an obligate carnivore. You get very little nutrition from standard nutriment, but gain alot from meat and protein \
	based products."
	icon_state = "carnivore"
	passivePerk = TRUE
	copy_protected = TRUE

/datum/perk/herbivore
	name = "Herbivore"
	desc = "For whatever reason, be it genetics or racial inclination, you are an obligate herbivore. You get very little nutrition from standard protein, but gain alot from grown foods and glucose \
	based products."
	icon_state = "herbivore"
	passivePerk = TRUE
	copy_protected = TRUE
///////////////////////////////////// Slime perks
/datum/perk/racial/limb_regen
	name = "Hypermytosis"
	desc = "By expending an extraordinary amount of energy you can kick your natural regeneration into high-gear, regenerating limbs and improving healing. \
	This process must be done slowly and carefuly to avoid the risk of DNA damage and thus slows you down and limits consciousness."
	icon_state = "hypermytosis"
	var/cooldown = 5 MINUTES
	passivePerk = FALSE
	var/nutrition_cost = 300
	//This is the ONLY racial perk I am going to allow to be copied.

/datum/perk/racial/limb_regen/activate()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You've already regenerated recently, wait some time before trying again."))
		return FALSE

	if(holder.nutrition > nutrition_cost)
		cooldown_time = world.time + cooldown
		holder.nutrition -= nutrition_cost
		to_chat(usr, SPAN_NOTICE("You turn your attention inward, focusing on mending your form."))
		var/mob/living/carbon/human/H = holder
		for(var/name in BP_ALL_LIMBS)
			if(!H.has_appendage(name))
				H.restore_organ(name)

	else
		to_chat(usr, SPAN_NOTICE("You lack the energy for such an expenditure."))


/datum/perk/racial/slime_stat_boost
	name = "Adaptive Anatomy"
	desc = "As a being of living flux you can burn spare calories to momentarily temper either your physical or mental attributes."
	var/cooldown = 10 MINUTES
	passivePerk = FALSE
	var/nutrition_cost = 200
	var/amount_to_boost = 45 // How much the stats are boosted
	var/duration = 1 MINUTES // How long the stats are boosted for
	var/blorp = 0 //I'm so sorry.
	copy_protected = TRUE

/datum/perk/racial/slime_stat_boost/activate()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You're still recovering from your last amplification!"))
		return FALSE
	if(holder.nutrition > nutrition_cost)
		cooldown_time = world.time + cooldown
		holder.nutrition -= nutrition_cost
		to_chat(usr, SPAN_NOTICE("You expend some energy to improve your attributes!"))
		if(blorp == 1)
			holder.stats.addTempStat(STAT_BIO, amount_to_boost, duration, "Slime Biology")
			holder.stats.addTempStat(STAT_MEC, amount_to_boost, duration, "Slime Biology")
			holder.stats.addTempStat(STAT_COG, amount_to_boost, duration, "Slime Biology")
		else
			holder.stats.addTempStat(STAT_VIG, amount_to_boost, duration, "Slime Biology")
			holder.stats.addTempStat(STAT_ROB, amount_to_boost, duration, "Slime Biology")
			holder.stats.addTempStat(STAT_TGH, amount_to_boost, duration, "Slime Biology")
	else
		to_chat(usr, SPAN_NOTICE("You lack the energy for such an expenditure."))

/datum/perk/racial/slime_stat_boost/mental
	name = "Malleable Mind"
	desc = "Expend some of your spare calories to greatly improve your intellect."
	icon_state = "malleablemind"
	blorp = 1

/datum/perk/racial/slime_stat_boost/physical
	name = "Adaptive Anatomy"
	desc = "Expend some of your spare calories to greatly improve your physical prowess."
	icon_state = "adaptiveanatomy"

/datum/perk/racial/speed_boost //Go fast but lose vig and burn through nutri
	name = "Caloric Redline"
	desc = "by burning through mass at an excessive rate an Aulvae can push their body to move with surprising swiftness, albeit losing some of the fine control over their movements."
	icon_state = "caloricredline"
	var/cooldown = 10 MINUTES
	passivePerk = FALSE
	var/nutrition_cost = 200
	copy_protected = TRUE

/datum/perk/racial/speed_boost/activate()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You're still recovering from the last attempt."))
		return FALSE
	if(holder.nutrition < nutrition_cost)
		to_chat(usr, SPAN_NOTICE("You lack the energy for such an expenditure."))
		return FALSE

	cooldown_time = world.time + cooldown

	holder.nutrition -= nutrition_cost
	holder.reagents.add_reagent("slime_speed", 5)

/datum/perk/racial/slime_metabolism
	name = "Gelatinous Biology"
	desc = "Your peculiar anatomy afford you a variety of benefits compared to most organics. What causes toxin damage will heal it instead of causing it, and vice-versa.\
	Additionally you are somewhat resistant to NSA overload, and can slowly regenerate health so long as you have nutrition."
	icon_state = "gelatinousbiology"
	passivePerk = TRUE
	var/regen_rate = 0.3
	copy_protected = TRUE

/datum/perk/racial/slime_metabolism/on_process()
	. = ..()
	if(regen_rate  && holder.nutrition > 300 && holder.stat != DEAD) //We lose regen when we are below half max nutrition. Or when we're dead.
		holder.heal_overall_damage(regen_rate, regen_rate)

/datum/perk/racial/slime_metabolism/assign(mob/living/L)
	..()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.nsa_bonus += 100
		H.metabolism_effects.calculate_nsa()

/datum/perk/racial/slime_metabolism/remove()
	if(ishuman(holder))
		var/mob/living/carbon/human/H = holder
		H.metabolism_effects.nsa_bonus -= 100
		H.metabolism_effects.calculate_nsa()
	..()
