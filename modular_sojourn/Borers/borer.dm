#define BORER_EXP_LEVEL_1 20
#define BORER_EXP_LEVEL_2 40
#define BORER_EXP_LEVEL_3 80
#define BORER_EXP_LEVEL_4 100
#define BORER_EXP_LEVEL_5 160 //This is fucking insano bonkers

//TODO: Refactor literally all of this code
//This sucks so badly.
/mob/living/simple/borer
	name = "cortical borer"
	real_name = "cortical borer"
	desc = "A small, quivering creature, rumoured to be part of Ancient Amethyn."
	speak_emote = list("chirrups")
	response_help  = "pokes"
	response_disarm = "prods"
	response_harm   = "stomps on"
	icon_state = "brainslug"

	health = 30
	maxHealth = 30

	speed = 4
	see_in_dark = 8
	see_invisible = SEE_INVISIBLE_NOLIGHTING
	a_intent = I_HURT
	stop_automated_movement = 1
	status_flags = CANPUSH
	attacktext = "nipped"
	friendly = "prods"
	wander = 0
	hunger_enabled = FALSE
	pass_flags = PASSTABLE
	universal_understand = 1
	//holder_type = /obj/item/holder/borer //Theres no inhand sprites for holding borers, it turns you into a pink square
	var/borer_level = 0                           // Level of borer.
	var/borer_exp = 0                             // Borer experience.
	var/last_request
	var/used_dominate
	var/max_chemicals = 75			// Max chemicals produce without a host. Buffed to 75 (is multiplied on level up)
	var/max_chemicals_inhost = 150          // Max chemicals produce within a host, buffed to 150.
	var/chemicals = 100                      // Chemicals used for reproduction and spitting neurotoxin.
	var/mob/living/carbon/human/host        // Human host for the brain worm.
	var/truename                            // Name used for brainworm-speak.
	var/mob/living/captive_brain/host_brain // Used for swapping control of the body back and forth.
	var/obj/item/organ/internal/vital/brain/hostbrain //Handles the Host's... actual brain. Why the fuck is this causing runtimes otherwise?
	var/controlling = FALSE					// Used in human death check.
	var/docile = 0                          // Sugar can stop borers from acting.
	var/list/copied_stats = list()
	var/has_reproduced
	var/roundstart
	var/selectedname = FALSE
	var/emergency_leave = FALSE // I fucking hate you Erismed
	var/datum/perk/savedperk //Held for the express purpose of either adminbus or for debugging. Just holds the perk datum while we transfer it. Converted back to a path in the relevant proc

	// Abilities borer can use when outside the host
	var/list/abilities_standalone = list(
		/mob/living/proc/ventcrawl,
		/mob/living/proc/hide,
		/mob/living/simple/borer/proc/paralyze_victim,
		/mob/living/carbon/human/proc/commune,
		/mob/living/simple/borer/proc/infest,
		/mob/living/simple/borer/proc/truenamed
		)

	// Abilities borer can use when inside the host, but not in control
	var/list/abilities_in_host = list(
		/mob/living/simple/borer/proc/secrete_chemicals,
		/mob/living/simple/borer/proc/assume_control,
		/mob/living/simple/borer/proc/read_mind,
		/mob/living/simple/borer/proc/write_mind,
		/mob/living/simple/borer/proc/release_host,
		/mob/living/carbon/human/proc/commune,
		/mob/living/simple/borer/proc/reproduce,
		/mob/living/simple/borer/proc/sample_blood
	)

	// Abilities borer can use when controlling the host
	// (keep in mind that those have to be abilities of /mob/living/carbon, not /mob/living/simple/borer)
	var/list/abilities_in_control = list(
		/mob/living/carbon/proc/release_control,
		/mob/living/carbon/proc/talk_host,
		/mob/living/carbon/human/proc/psychic_whisper,
		/mob/living/carbon/proc/spawn_larvae
	)

	// Reagents the borer can secrete into host's blood
	var/list/produced_reagents = list(
		"alkysine",
		"bicaridine", "kelotane", "dexalin", "anti_toxin",
		"hyperzine", "tramadol", "space_drugs"
		)

/mob/living/simple/borer/roundstart
	roundstart = 1

/mob/living/simple/borer/Login()
	..()
	/*if(!roundstart && mind && !mind.antagonist.len)
		var/datum/antagonist/A = create_antag_instance(ROLE_BORER_REPRODUCED)
		A.create_antagonist(mind,update = FALSE)
	*/

/mob/living/simple/borer/New()
	..()

	add_language(LANGUAGE_CORTICAL)
	update_abilities()

	truename = "[pick("Primary","Secondary","Tertiary","Quaternary")] [rand(1000,9999)]"

	if(!roundstart) request_player()

/mob/living/simple/borer/proc/ghost_enter(mob/user)
	if(stat || key)
		return FALSE
	var/confirmation = alert("Would you like to occupy \the [src]?", "", "Yes", "No")
	if(confirmation == "No" || QDELETED(src))
		return TRUE
	if(key)
		to_chat(user, SPAN_WARNING("Someone is already occupying this body."))
		return TRUE
	key = user.key
	return TRUE

/mob/living/simple/borer/attack_ghost(mob/user)
	. = ..()
	if(!.)
		. = ghost_enter(user)


/mob/living/simple/borer/proc/update_abilities(force_host=FALSE)
	// Remove all abilities
	remove_verb(src, abilities_standalone)
	remove_verb(src, abilities_in_host)
	if(host)
		remove_verb(host, abilities_in_control)

	// Re-grant some of the abilities, depending on the situation
	if(!host)
		add_verb(src, abilities_standalone)
	else if(!controlling)
		if(ishuman(host))
			add_verb(src, abilities_in_host)
			Stat()
			return
	else
		add_verb(host, abilities_in_control)
	Stat()

// If borer is controlling a host directly, send messages to host instead of borer
/mob/living/simple/borer/proc/get_borer_control()
	return (host && controlling) ? host : src

/mob/living/simple/borer/Life()
	..()

	if((chemicals < max_chemicals) && !invisibility)
		chemicals++

	if(invisibility)
		if(chemicals <= 2)
			invisible()
			chemicals = 0
		else
			chemicals -= 15 //Very quick drain. Short bursts of stealth.

	if(host && !stat && !(host.stat == 2))
		// Regenerate if within a host
		if(health < maxHealth)
			adjustBruteLoss(-1)

		if(host.reagents.has_reagent("sugar"))
			if(!docile)
				to_chat(get_borer_control(), SPAN_DANGER("You feel the soporific flow of sugar in your host's blood, lulling you into docility."))
				docile = TRUE
		else
			if(docile)
				to_chat(get_borer_control(), SPAN_DANGER("You shake off your lethargy as the sugar leaves your host's blood."))
				docile = FALSE

		if(chemicals < max_chemicals_inhost)
			chemicals += (level*2) + 1 //Handles Regen of Chems. Be careful not to set the multiplier above 2x. TODO: Make this an adjustable admin-var

		if(controlling)
			if(docile)
				to_chat(host, SPAN_DANGER("You are feeling far too docile to continue controlling your host..."))
				host.release_control()
				return

			if(prob(1))
				hostbrain.take_damage(1,BRUTE, 2, FALSE, FALSE, FALSE)

			if(prob(host.brainloss/20))
				host.say("*[pick(list("blink","blink_r","choke","aflap","drool","twitch","twitch_s","gasp"))]")

	//	for(var/mob/living/L in view(7)) //Sucks to put this here, but otherwise mobs will ignore them
		//	L.try_activate_ai() //how about we don't lag the server ty

//STATUS PANEL AND STATUS PANEL UPDATES

/mob/living/simple/borer/get_status_tab_items()
	. = ..()
	. += ""
	if(host)
		. += "Host Health and Management"
		. += "•	Host Health: [host.stat == DEAD ? "Deceased" : round((host.health / host.maxHealth) * 100)]%"
		if(ishuman(host))
			var/list/internal_wound_comps = list() //ensure to not shit the bed here
			internal_wound_comps = hostbrain.GetComponents(/datum/component/internal_wound) //Grab all internal wound component
			. += " - Host Brain Status - "
			. += "•   Host Brain Damage: [((hostbrain.damage/hostbrain.max_damage)*100) >= 50 ? ">50% NEURAL DECAY DETECTED. SEEK IMMEDIATE ASSISTANCE - [((hostbrain.damage/hostbrain.max_damage)*100)]" : ((hostbrain.damage/hostbrain.max_damage)*100)]%" //It'd be really funny if organs had a maxhp of 99999999999999 and only set their health instead of max hp how fun fun fun
			if(internal_wound_comps)
				. += "•   Internal Monitoring: [internal_wound_comps.len >= 2 ? "SEVERE NEUROLOGICAL WOUNDING DETECTED. TREATMENT RECOMMENDED - [internal_wound_comps.len] WOUNDS PRESENT." : "Minor Neurological Abnormalities Detected - [internal_wound_comps.len]"]" //Erismed really did not want to play nice.
			else
				. += "•   Internal Monitoring: No Wounds Detected" //Erismed really did not want to play nice.
			. += ""
	. += "Borer Statistics"
	. += "•	Evolution Level: [borer_level], EXP: [borer_exp]"
	. += "•	Chemicals: [host ? "[chemicals] / [max_chemicals_inhost]" : "[chemicals] / [max_chemicals]"]"
	if(copied_stats.len >= 1)
		. += "•	Current Learned Stats: [english_list(copied_stats)]"
	if(savedperk)
		. += "•	Currently Learned Perk: [savedperk.name]"
		. += "•   Perk Description: [savedperk.desc]"
		. += "•   WARNING: OVERWRITING HOST NEURONS MAY CAUSE SEVERE DAMAGE."


//BASE PROCS
/mob/living/simple/borer/proc/detatch()

	if(!host || !controlling) return

	if(ishuman(host))
		var/mob/living/carbon/human/H = host
		var/obj/item/organ/external/head = H.get_organ(BP_HEAD)
		head.implants -= src

	controlling = FALSE

	host.remove_language(LANGUAGE_CORTICAL)
	update_abilities()

	if(host_brain)

		// these are here so bans and multikey warnings are not triggered on the wrong people when ckey is changed.
		// computer_id and IP are not updated magically on their own in offline mobs -walter0o

		// host -> self
		var/h2s_id = host.computer_id
		var/h2s_ip= host.lastKnownIP
		host.computer_id = null
		host.lastKnownIP = null

		src.ckey = host.ckey

		if(!src.computer_id)
			src.computer_id = h2s_id

		if(!host_brain.lastKnownIP)
			src.lastKnownIP = h2s_ip

		// brain -> host
		var/b2h_id = host_brain.computer_id
		var/b2h_ip= host_brain.lastKnownIP
		host_brain.computer_id = null
		host_brain.lastKnownIP = null

		host.ckey = host_brain.ckey

		if(!host.computer_id)
			host.computer_id = b2h_id

		if(!host.lastKnownIP)
			host.lastKnownIP = b2h_ip

	qdel(host_brain)

/mob/living/simple/borer/resist()
	..()
	if(emergency_leave) //hopefully this will let borers avoid the softlock
		var/turf/T = get_turf(src.loc?.loc)
		forceMove(T)
		visible_message(SPAN_WARNING("With a slithering pop, [src] wiggles out of the dismembered head!"))
		update_abilities()
		emergency_leave = FALSE



/mob/living/simple/borer/proc/leave_host()
	if(!host) return

	if(host.mind)
		clear_antagonist_type(host.mind, ROLE_BORER)

	src.loc = get_turf(host)

	reset_view(null)
	machine = null

	host.reset_view(null)
	host.machine = null
	hostbrain = null
	var/mob/living/carbon/human/H = host
	var/obj/item/organ/external/head = H.get_organ(BP_HEAD)
	head.implants -= src
	head.internal_organs -= src
	H.status_flags &= ~PASSEMOTES
	host = null
	update_abilities()

//Procs for grabbing players.
/mob/living/simple/borer/proc/request_player()
	var/datum/ghosttrap/G = get_ghost_trap("cortical borer")
	G.request_player(src, "A cortical borer needs a player.", ANIMAL)

/mob/living/simple/borer/proc/borer_add_exp(var/num)
	borer_exp += num
	update_borer_level()

/mob/living/simple/borer/proc/update_borer_level()
	if((borer_exp >= BORER_EXP_LEVEL_1) && (borer_level < 1))
		var/level = 1
		var/added_reagents = list("inaprovaline", "tricordrazine", "synaptizine", "imidazoline", "hyronalin", "citalopram", "glucose") //Eclipse Edit: Added Citalopram and Nutriment //Eclipse Edit: Replaced Nutriment with Glucose, which is injectable
		var/abilities_IH = list(/mob/living/simple/borer/proc/say_host, /mob/living/simple/borer/proc/whisper_host, /mob/living/simple/borer/proc/commune)
		var/abilities_SL = list(/mob/living/simple/borer/proc/commune)

		level_up(level, added_reagents, abilities_IH, abilities_SL)

	if((borer_exp >= BORER_EXP_LEVEL_2) && (borer_level < 2))
		var/level = 2
		var/added_reagents = list("spaceacillin", "quickclot", "detox", "purger", "arithrazine", "ethylredoxrazine") //Eclipse Edit: Added ethylredoxrazine
		var/abilities_SL = list(/mob/living/simple/borer/proc/biograde)
		var/abilities_IC = list(/mob/living/carbon/human/proc/commune)

		level_up(level, added_reagents, null, abilities_SL, abilities_IC)

	if((borer_exp >= BORER_EXP_LEVEL_3) && (borer_level < 3))
		var/level = 3
		var/added_reagents = list("meralyne", "dermaline", "dexalinp", "oxycodone", "ryetalyn", "adrenaline", "paroxetine") //Eclipse Edit: Added Adrenaline and Paroxetine
		var/abilities_SL = list(/mob/living/simple/borer/proc/invisible)
		var/abilities_IH = list(/mob/living/simple/borer/proc/read_perk, /mob/living/simple/borer/proc/write_perk)
		level_up(level, added_reagents, abilities_IH, abilities_SL)

	if((borer_exp >= BORER_EXP_LEVEL_4) && (borer_level < 4))
		var/level = 4
		var/added_reagents = list("peridaxon", "rezadone", "ossisine", "kyphotorin", "aminazine", "zombiepowder", "leporazine") //Eclipse Edit: Added Zombie Powder, and Leporazine
		health = 100
		maxHealth = 100
		speed = 1

		level_up(level, added_reagents)

	if((borer_exp >= BORER_EXP_LEVEL_5) && (borer_level < 5))
		var/level = 5
		var/added_reagents = list("violence", "steady", "bouncer", "prosurgeon", "cherry drops", "greaser")
		var/abilities_IH = list(/mob/living/simple/borer/proc/jumpstart)

		level_up(level, added_reagents, abilities_IH)

/mob/living/simple/borer/proc/level_up(level, added_reagents = list(), abilities_IH= list(), abilities_SL= list(), abilities_IC= list())
	borer_level = level

	produced_reagents += added_reagents
	abilities_in_host += abilities_IH
	abilities_standalone += abilities_SL
	abilities_in_control += abilities_IC

	update_abilities()

	to_chat(get_borer_control(), SPAN_NOTICE("Congratulations! You've reached Evolution Level [level], new synthesis reagents and new abilities are now available."))
	max_chemicals += (borer_level * 10)
	max_chemicals_inhost = max_chemicals * 5

/mob/living/simple/borer/cannot_use_vents()
	return

/mob/living/simple/borer/death()
	.=..()
	if(invisibility)
		alpha = 255
		invisibility = 0

/mob/living/simple/borer/update_sight()
	if(stat == DEAD || eyeobj)
		update_dead_sight()
	else
		if (is_ventcrawling)
			sight |= SEE_TURFS|SEE_OBJS|BLIND
		else
			//sight = initial(sight)
			see_in_dark = initial(see_in_dark)
