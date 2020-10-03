//Perks for racial options, make sure to keep this organized.
//Perks can be both active and passive.


/////////////////////////////////////Sablekyne perks
/datum/perk/laststand
	name = "Last Stand"
	desc = "As a sablekyne your body is a tank, through will and biology you can ignore pain entirely for a short amount of time."
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
	user.reagents.add_reagent("sabledone", 5)
	return ..()

/datum/perk/bone
	name = "Bone Plated"
	desc = "All sablekyne are covered in bone-like plating across various parts of the body, this layer of natural armor along the shins, thighs, fore-arms, and shoulders allow you to absorb impacts better than anyone, adding a further tolerance to pain."
	//icon_state = "" // - No icon, suggestion - Riot Shield?

///////////////////////////////////////Mar'qua perks
/datum/perk/suddenbrilliance
	name = "Sudden Brilliance"
	desc = "Your intelligence is above the 'lesser races' and even the humblest of Mar'qua can prove it easily in moments of focus. Use this to center your thoughts and increase all your mental abilities."
	active = FALSE
	passivePerk = FALSE

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
	//icon_state = "" // - No icon, suggestion - Riot Shield?

//////////////////////////////////////Human perks
/datum/perk/tenacity
	name = "Tenacity"
	desc = "You pull what made your ancestors conquer the stars from your will, recovering from a small amount of injuries and potentially stabilizing yourself to live a bit longer."
	active = FALSE
	passivePerk = FALSE

/datum/perk/tenacity/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("The human body can only take so much, you'll need more time before you've recovered enough to use this again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("[user] grits their teeth and begins breathing slowly.", "You grit your teeth and remind yourself you don't have time to bleed!")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("adrenol", 5)
	return ..()

/datum/perk/gutsandglory
	name = "Guts and Glory"
	desc = "You pull what made your ancestors conquer the stars from your will, letting your body recover somewhat from any internal damage at the cost of becoming exhausted while it works."
	active = FALSE
	passivePerk = FALSE

/datum/perk/gutsandglory/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("The human body can only take so much, you'll need more time before you've recovered enough to use this again."))
		return FALSE
	cooldown_time = world.time + 30 MINUTES
	user.visible_message("[user] closes their eyes and takes a deep breath, slowing down as they focus on recovering!", "You feel exhausted as you slow down to let your body recover, focusing on controlling your breathing while your body slowly mends some of your internal damage.")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("hustim", 5)
	return ..()

//////////////////////////////////////Kriosan perks
/datum/perk/enhancedsenses
	name = "Enhance Senses"
	desc = "You're a predator at heart and have the senses to match, for a short time your body toughens and your aim improves drastically as your senses enhance."
	active = FALSE
	passivePerk = FALSE

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
	user.reagents.add_reagent("kriotol", 10)
	return ..()

////////////////////////////////////////Akula perks
/datum/perk/recklessfrenzy
	name = "Reckless Frenzy"
	desc = "Your body is powerful and strong when you succumb to instinct, but doing so leaves you without much higher reasoning for a short time. The rush of chemicals is also highly adddictive \
	and often times will leave your body weaker for a short time."
	active = FALSE
	passivePerk = FALSE

/datum/perk/recklessfrenzy/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your body has been taxed to its limits, you need more time to recover before using this ability again."))
		return FALSE
	cooldown_time = world.time + 15 MINUTES
	user.visible_message("<b><font color='red'>[user] lets out deep gutteral growl as their eyes glaze over!</font><b>", "<b><font size='3px'><font color='red'>You abandon all reason as your sink into a blood thirsty frenzy!</font><b>", "<b><font color='red'>You hear a terrifying roar!</font><b>")
	playsound(usr.loc, 'sound/voice/akularoar.ogg', 50, 1)
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("robustitol", 10)
	return ..()

////////////////////////////////////////Naramad perks
/datum/perk/adrenalineburst
	name = "Adrenaline Burst"
	desc = "Naramads are built for extreme speed, be it for charging forward and retreating back."
	active = FALSE
	passivePerk = FALSE

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
	user.reagents.add_reagent("naratonin", 10)
	return ..()

/////////////////////////////////////////Cindarite perks
/datum/perk/purgetoxins
	name = "Purge Toxins"
	desc = "You force your body to begin the process of removing toxins from your blood. All toxins and addictions are slowly purged while any toxin damage to your liver or body is healed but the effect leaves you exhausted."
	active = FALSE
	passivePerk = FALSE

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
	active = FALSE
	passivePerk = FALSE

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

///////////////////////////////////////////Opifex perks
/datum/perk/backup
	name = "Back Up"
	desc = "You retrieve your custom made back up tools hidden on your person somewhere, along with the tied coils that form a make shift belt."
	active = FALSE
	passivePerk = FALSE

/datum/perk/backup/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You've already retrieved your set of back up tools. You didn't lose them, did you?"))
		return FALSE
	cooldown_time = world.time + 8 HOURS
	to_chat(usr, SPAN_NOTICE("You discretely and stealthily slip your back up tools out from their hiding place, the belt unfolds as it quietly flops to the floor."))
	log_and_message_admins("used their [src] perk.")
	new /obj/item/weapon/storage/belt/utility/handmade/full(usr.loc)
	return ..()

////////////////////////////////////////////Cht'mant perks
/datum/perk/spiderfriend
	name = "Kin to the Spiders"
	desc = "Through a combination of pheramones, appearence, and an innate understanding of spider behaviour all spiders are friendly to you, they won't attack you even if you attack them. This change \
	in your biology and pheramones however make you an enemy to roaches. As a side effect of dealing with spiders so often, you can't be slowed or stuck by webbing."
	//icon_state = "muscular" // https://game-icons.net

/datum/perk/spiderfriend/assign(mob/living/carbon/human/H)
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

/datum/perk/webmaker/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("You need a bit more time to build up your web reserves!"))
		return FALSE
	cooldown_time = world.time + 5 SECONDS
	user.visible_message("[user] begins secreting and spreading web material around them.", "You begin secreting and spreading your webbing around.", "You hear an uncomfortable chitter noise.")
	//log_and_message_admins("used their [src] perk.") //commented out due to spam in the logs.
	new /obj/effect/spider/stickyweb(usr.loc)
	return ..()