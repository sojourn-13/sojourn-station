/obj/machinery/eternal_ascension_resonances
	name = "EGO: E.A.R. T-01-92beta S-23"// EGO as in the ego, T as in Tech, S for Sanity
	desc = "A grand work of SI's psionic advancements. Marble pillars that only can hold psionic catalysts, converting the power of many into one."
	description_info = "Design and prototyped by a non psionic CRO, many personal touches are engraved in runes, fractal patterns and small engraving of a name starting with a stylized T."
	icon = 'icons/obj/psionic/occmachinery.dmi'
	icon_state = "ear"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = IDLE_POWER_USE
	idle_power_usage = 0
	active_power_usage = 0
	circuit = null
	var/active = FALSE
	var/wave_time = 60 SECONDS

	//Four bits
	var/slot_one
	var/slot_two
	var/slot_three
	var/slot_four
	var/anti_cheat = FALSE

/obj/machinery/eternal_ascension_resonances/examine(mob/user)
	..()
	var/message = "Pillers Reading:\n"
	if(slot_one)
		message += "Piller One: [slot_one]\n"
	else
		message += "Piller One: Has no voice.\n"

	if(slot_two)
		message += "Piller Two: [slot_two]\n"
	else
		message += "Piller Two: Has no voice.\n"

	if(slot_three)
		message += "Piller Three: [slot_three]\n"
	else
		message += "Piller Three: Has no voice.\n"

	if(slot_four)
		message += "Piller Four: [slot_four]\n"
	else
		message += "Piller Four: Has no voice.\n"

	to_chat(user, "<span class='info'>[message]</span>")


/obj/machinery/eternal_ascension_resonances/attack_hand(mob/living/user as mob)
	if((slot_one||slot_two||slot_three||slot_four) && !active)
		var/choice = input(user, "Activate [src]?") as null|anything in list("Sure", "No")

		switch(choice)
			if("Sure")
				if(!active)
					active = TRUE
					to_chat(user, "As you press down a marbel plate the Pillers plasma bulbs start to dance inside the glass casings.")
					icon_state = "ear_active"
					addtimer(CALLBACK(src, .proc/repice_index), wave_time)
			else
				to_chat(user, "[src] is left alone.")

	if(active)
		to_chat(user, "Something's already syncing...")
		return

	to_chat(user, "The Pillers are silent, unable to resonate.")

/obj/machinery/eternal_ascension_resonances/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/device/psionic_catalyst))
		if(add_cube(I, user))
			I.forceMove(contents)
		return
	..()

/obj/machinery/eternal_ascension_resonances/proc/repice_index(obj/item/cg)
	var/index_leaser = "[slot_one][slot_two][slot_three][slot_four]"
	if(!index_leaser)
		return

	for(var/path in typesof(/datum/eternal_ascension_resonances) - /datum/eternal_ascension_resonances)
		var/datum/eternal_ascension_resonances/victory = path
		var/prereq = initial(victory.rune_resonance)
		if(index_leaser == prereq) //In theory you can infact combo this
			new victory.output(get_turf(src))

	active = FALSE
	icon_state = "ear"

	//We all sang are little hearts out!
	slot_one = null
	slot_two = null
	slot_three = null
	slot_four = null

/obj/machinery/eternal_ascension_resonances/proc/add_cube(obj/item/device/psionic_catalyst/PC, mob/user)
	if(anti_cheat)
		to_chat(user, "Your already thinking of the Piller to add a catalyst!")
		return

	if(!PC.resonances)
		to_chat(user, "The catalyst is silent, according to the [src]")
		return

	anti_cheat = TRUE

	var/choice = input(user, "What slot do you add the [PC] in?") as null|anything in list("Piller One","Piller Two","Piller Three","Piller Four")

	switch(choice)

		if("Piller One")
			if(!slot_one)
				to_chat(user, "You add [PC] into the First Piller.")
			else
				to_chat(user, "You carefully take out the override the resonance in [PC], First Piller.")
			slot_one = PC.resonances
			PC.resonances = null
			anti_cheat = FALSE
			return
		if("Piller Two")
			if(!slot_two)
				to_chat(user, "You add [PC]'resonance into the Second Piller.")
			else
				to_chat(user, "You carefully take out the override the resonance in [PC], Second Piller.")

			slot_two = PC.resonances
			PC.resonances = null
			anti_cheat = FALSE
			return
		if("Piller Tree")
			if(!slot_two)
				to_chat(user, "You add [PC]'resonance into the Third Piller.")
			else
				to_chat(user, "You carefully take out the override the resonance in [PC], Third Piller.")

			slot_three = PC.resonances
			PC.resonances = null
			anti_cheat = FALSE
			return
		if("Piller Four")
			if(!slot_two)
				to_chat(user, "You add [PC]'resonance into the Forth Piller.")
			else
				to_chat(user, "You carefully take out the override the resonance in [PC], Forth Piller.")

			slot_four = PC.resonances
			PC.resonances = null
			anti_cheat = FALSE

		else
			to_chat(user, "You add [PC]'resonance into the none of the Pillers.")
			anti_cheat = FALSE
			return

/datum/eternal_ascension_resonances
	//Rune Resonace: the code that we got to match to get the end resault.
	var/rune_resonance = "AnythingNullNullNull" //Mostly for debug
	//Output, the psionic item (typically catalyst/powers) we get for matching the code
	var/output = /obj/item/device/psionic_catalyst/dull
	var/out_put_name = ""

/datum/eternal_ascension_resonances/psychoactive_manipulation
	rune_resonance = "SeekingGreater"
	output = /obj/item/device/psionic_catalyst/psychoactive_manipulation
	out_put_name = "Psychoactive Manipulation"

/datum/eternal_ascension_resonances/detect_thoughts
	rune_resonance = "ClimateRegicideSuppression"
	output = /obj/item/device/psionic_catalyst/detect_thoughts
	out_put_name = "Locate Mind-Essence"

/datum/eternal_ascension_resonances/nightmare_mind
	rune_resonance = "QuickSeeking"
	output = /obj/item/device/psionic_catalyst/nightmare_mind
	out_put_name = "Nightmarish Thoughts"

/datum/eternal_ascension_resonances/bring_darkness
	rune_resonance = "AgeNight"
	output = /obj/item/device/psionic_catalyst/bring_darkness
	out_put_name = "Bring Darkness"

/datum/eternal_ascension_resonances/rust
	rune_resonance = "QuickQuick"
	output = /obj/item/device/psionic_catalyst/rust
	out_put_name = "Rust"

/datum/eternal_ascension_resonances/decay
	rune_resonance = "QuickRust"
	output = /obj/item/device/psionic_catalyst/decay
	out_put_name = "Decay"

/datum/eternal_ascension_resonances/dream_seeker
	rune_resonance = "SeekingNight"
	output = /obj/item/device/psionic_catalyst/dream_seeker
	out_put_name = "Dream Seeker"

/datum/eternal_ascension_resonances/kings_decorum
	rune_resonance = "AgeRustCarbon"
	output = /obj/item/device/psionic_catalyst/kings_decorum
	out_put_name = "Kings Decorum"

/datum/eternal_ascension_resonances/heretical_ascension
	rune_resonance = "CarbonRustAgeQuick"
	output = /obj/item/device/psionic_catalyst/heretical_ascension
	out_put_name = "Heretical Ascension"

/datum/eternal_ascension_resonances/psionic_ascension
	rune_resonance = "SteelRustAgeQuick"
	output = /obj/item/device/psionic_catalyst/psionic_ascension
	out_put_name = "Psionic Sscension"

/datum/eternal_ascension_resonances/cerebral_hemorrhage
	rune_resonance = "CarbonRegicideNight"
	output = /obj/item/device/psionic_catalyst/cerebral_hemorrhage
	out_put_name = "Cerebral Hemorrhage"

/datum/eternal_ascension_resonances/enslavement
	rune_resonance = "RegicideAgeCarbon"
	output = /obj/item/device/psionic_catalyst/enslavement
	out_put_name = "Enslavement"

/datum/eternal_ascension_resonances/cryo_kinetic_blaster
	rune_resonance = "SuppressionAgeClimate"
	output = /obj/item/device/psionic_catalyst/cryo_kinetic_blaster
	out_put_name = "Cryo Kinetic Blaster"

/datum/eternal_ascension_resonances/pyro_kinetic_blaster
	rune_resonance = "SuppressionClimateHealing"
	output = /obj/item/device/psionic_catalyst/pyro_kinetic_blaster
	out_put_name = "Pryo Kinetic Blaster"

/datum/eternal_ascension_resonances/electro_kinetic_blaster
	rune_resonance = "WarmColdClimateHealing"
	output = /obj/item/device/psionic_catalyst/electro_kinetic_blaster
	out_put_name = "Electro Kinetic Blaster"

/datum/eternal_ascension_resonances/kinetic_barrier
	rune_resonance = "ProtectionWarm"
	output = /obj/item/device/psionic_catalyst/kinetic_barrier
	out_put_name = "Kinetic Barrier"

/datum/eternal_ascension_resonances/chosen_control
	rune_resonance = "HealingSuppressionClimateCarbon"
	output = /obj/item/device/psionic_catalyst/chosen_control
	out_put_name = "Chosen Control"

/datum/eternal_ascension_resonances/Light_psi_armor
	rune_resonance = "ProtectionSuppression"
	output = /obj/item/device/psionic_catalyst/Light_psi_armor
	out_put_name = "Void robe"

/datum/eternal_ascension_resonances/Hpsi_armor
	rune_resonance = "SuppressionProtectionProtectionProtection"
	output = /obj/item/device/psionic_catalyst/Hpsi_armor
	out_put_name = "Durable shell"

/datum/eternal_ascension_resonances/layered_psi_shield
	rune_resonance = "ProtectionProtection"
	output = /obj/item/device/psionic_catalyst/layered_psi_shield
	out_put_name = "Layered Shield"

/datum/eternal_ascension_resonances/trash_pile_exploid
	rune_resonance = "WarmClimate"
	output = /obj/item/device/psionic_catalyst/trash_pile_exploid
	out_put_name = "Discombobulate"

/datum/eternal_ascension_resonances/trash_pile_compress
	rune_resonance = "QuickSuppression"
	output = /obj/item/device/psionic_catalyst/trash_pile_compress
	out_put_name = "Reorganize"

/datum/eternal_ascension_resonances/summan_trash_pile
	rune_resonance = "QuickSinking"
	output = /obj/item/device/psionic_catalyst/summan_trash_pile
	out_put_name = "Scrap Togather"

/datum/eternal_ascension_resonances/needle_n_thread
	rune_resonance = "HealingNull"
	output = /obj/item/device/psionic_catalyst/needle_n_thread
	out_put_name = "Psionic Suture"

/datum/eternal_ascension_resonances/purefie
	rune_resonance = "QuickNullDark"
	output = /obj/item/device/psionic_catalyst/purefie
	out_put_name = "Psionic Purefie"

/datum/eternal_ascension_resonances/temp_regulate
	rune_resonance = "ColdWarm"
	output = /obj/item/device/psionic_catalyst/temp_regulate
	out_put_name = "Psionic Temperature Regulate"

/obj/structure/sign/ear
	name = "EGO: E.A.R Music Sheet"
	desc = "Contains helpful device on E.A.R recpies. Unless you're reading this placeholder text, at least."
	icon = 'icons/obj/genetics/genetic_poster.dmi'
	icon_state = "ear_poster"

/obj/structure/sign/ear/Initialize()
	..()
	var/list/blurb = list()
	for(var/path in typesof(/datum/eternal_ascension_resonances) - /datum/eternal_ascension_resonances)
		var/datum/eternal_ascension_resonances/victory = path
		var/prereq = initial(victory.rune_resonance)
		var/then_name = initial(victory.out_put_name)

		prereq += " To Resonances: [then_name]"
		blurb += prereq

	if(blurb)
		blurb = pick(blurb)

		desc = "Score Sheet of the Shift: [blurb]"
	else
		desc = "A helpful poster containing a resonance recipie already found in the SI Psionics Lab: Todays shift has no selected Score Sheet."
