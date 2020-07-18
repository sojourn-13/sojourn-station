/datum/perk/laststand //Sablekyne perk, allows them to ignore pain for roughly a minute.
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

/datum/perk/suddenbrilliance //Mar'qua perk that increases there mental stats across the board.
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

/datum/perk/tenacity //Human perk that functions as an at will tricord.
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

/datum/perk/gutsandglory //Human perk that functions as an at will organ/internal bleeding heal.
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

/datum/perk/enhancedsenses //Kriosan perk that gives them a boost to toughness and vigilance.
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
	user.reagents.add_reagent("kriotol", 5)
	return ..()

/datum/perk/recklessfrenzy //Akula perk that dumps all stats in favor of upping melee through the roof.
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
	user.reagents.add_reagent("robustitol", 5)
	return ..()

/datum/perk/adrenalineburst //Naramad perk that gives them the zoomies.
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
	user.reagents.add_reagent("naratonin", 5)
	return ..()

/datum/perk/purgetoxins //Cindarite perk that purges the blood of toxins and removes addiction.
	name = "Purge Toxins"
	desc = "You force your body to begin the process of removing toxins from your blood. All toxins and addictions are slowly purged but the effect leaves you exhausted."
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

/datum/perk/backup //Cindarite perk that purges the blood of toxins and removes addiction.
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

/* //This has balance and code issues, commenting it out for now for later revision.
/datum/perk/nightvision //A universal perk for races that can see in the dark.
	name = "Night Vision"
	desc = "Due to the biology of your race you're capable of seeing in the dark. You need to stand still to focus and pick apart the light."
	active = FALSE
	passivePerk = FALSE

/datum/perk/nightvision/toggle()
	var/mob/living/carbon/human/user = usr
	if(is_active() && deactivate(holder))
		to_chat(usr, "You deactivate [src]")
		to_chat(usr, SPAN_NOTICE("You come to a stand still and begin letting your eyes adjust to the lighting, focusing on the darker areas and ignoring the light."))
		usr.see_invisible = SEE_INVISIBLE_NOLIGHTING
	else if(activate(holder))
		to_chat(usr, "You activate [src]")
		to_chat(usr, SPAN_NOTICE("You come to a stand still and begin letting your eyes adjust to the lighting, focusing on the darker areas and ignoring the light."))
		usr.see_invisible = SEE_INVISIBLE_NOLIGHTING
		log_and_message_admins("used their [src] perk.")
	return ..()
*/

/datum/perk/spiderfriend //a perk that makes you friendly with spiders and immune to web slowdown
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

/datum/perk/webmaker //chtmant perk that lets you make webs... somehow
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
	log_and_message_admins("used their [src] perk.")
	new /obj/effect/spider/stickyweb(usr.loc)
	return ..()