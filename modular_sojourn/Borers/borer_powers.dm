/mob/living/simple_animal/borer/proc/release_host()
	set category = "Abilities"
	set name = "Release Host"
	set desc = "Slither out of your host."

	if(stat)
		return

	if(!host)
		to_chat(src, "You are not inside a host body.")
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return

	if(!host || !src) return

	to_chat(src, SPAN_NOTICE("You begin disconnecting from [host]'s synapses and prodding at their internal ear canal."))

	if(!host.stat)
		to_chat(host, SPAN_WARNING("An odd, uncomfortable pressure begins to build inside your skull, behind your ear..."))

	spawn(100)
		if(!host || stat) return

		to_chat(src, SPAN_DANGER("You wiggle out of [host]'s ear and plop to the ground."))
		if(host.mind && !host.stat)
			if(controlling)
				to_chat(host, SPAN_DANGER("As though waking from a dream, you shake off the insidious mind control of the brain worm. Your thoughts are your own again."))
			to_chat(host, SPAN_DANGER("Something slimy wiggles out of your ear and plops to the ground!"))

		detatch()
		leave_host()

/mob/living/simple_animal/borer/proc/infest()
	set category = "Abilities"
	set name = "Infest"
	set desc = "Infest a suitable humanoid host."

	if(stat)
		return

	if(host)
		to_chat(src, SPAN_WARNING("You are already within a host."))
		return

	var/list/choices = list()
	for(var/mob/living/carbon/C in view(1,src))
		if(src.Adjacent(C))
			choices += C

	if(!choices.len)
		to_chat(src, SPAN_WARNING("There are no viable hosts nearby."))
		return

	var/mob/living/carbon/M = input(src,"Who do you wish to infest?") in null|choices

	if(!M || !Adjacent(M)) return

	if(M.has_brain_worms())
		to_chat(src, SPAN_WARNING("You cannot infest someone who is already infested!"))
		return

	if(ishuman(M))
		var/mob/living/carbon/human/H = M

		var/obj/item/organ/external/E = H.organs_by_name[BP_HEAD]
		if(!E || E.is_stump())
			to_chat(src, SPAN_WARNING("\The [H] does not have a head!"))

		if(!H.species.has_process[BP_BRAIN])
			to_chat(src, SPAN_WARNING("\The [H] does not seem to have an ear canal to breach."))
			return

		if(H.check_head_coverage() && H.head && !(H.head.canremove))
			to_chat(src, SPAN_WARNING("You cannot get through that host's protective gear."))
			return

	to_chat(M, "Something slimy begins probing at the opening of your ear canal...")
	to_chat(src, SPAN_DANGER("You slither up [M] and begin probing at their ear canal..."))

	var/infestation_delay = 2.5 SECONDS

	// It's harder for a borer to infest NTs
	if(is_neotheology_disciple(M))
		to_chat(src, SPAN_DANGER("A nanofiber mesh implant inside [M]'s head tries to cut you off on your way in. You can work around it, but it will take time."))
		infestation_delay *= 3

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.check_head_coverage())
			to_chat(src, SPAN_DANGER("That host's wearing protective gear. You can work around it, but it will take time."))
			infestation_delay *= 3

	// Borer gets host abilities before actually getting inside the host
	// Workaround for a BYOND bug: http://www.byond.com/forum/post/1833666 << We fix this in a better way
	if(!do_mob(src, M, infestation_delay))
		to_chat(src, SPAN_DANGER("As [M] moves away, you are dislodged and fall to the ground."))
		return

	to_chat(src, SPAN_NOTICE("You wiggle into [M]'s ear."))
	if(!M.stat)
		to_chat(M, SPAN_DANGER("Something disgusting and slimy wiggles into your ear!"))

	if(invisibility)
		src.invisibility = 0
		src.alpha = 255

	if(sight & SEE_MOBS)
		sight &= ~SEE_MOBS
		to_chat(src, SPAN_NOTICE("You cannot see living being through walls for now."))

	host = M
	host.status_flags |= PASSEMOTES

	update_abilities()
	spawn(1) /// Wait for abilities to update THEN move them in due to the afore-mentioned bug.
		forceMove(host)
	//Update their contractor status.
	/*if(host.mind && src.mind)
		var/list/L = get_player_antags(src.mind, ROLE_BORER)
		var/datum/antagonist/borer/borer
		if(L.len)
			borer = L[1]*/

		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			// If they're in normally, implant removal can get them out.
			var/obj/item/organ/external/head = H.get_organ(BP_HEAD)
			head.implants += src //Removed the brain eating/replacing proc reference.

/*
/mob/living/simple_animal/borer/verb/devour_brain()
	set category = "Abilities"
	set name = "Devour Brain"
	set desc = "Take permanent control of a dead host."

	if(!host)
		to_chat(src, "You are not inside a host body.")
		return

	if(host.stat != 2)
		to_chat(src, "Your host is still alive.")
		return

	if(stat)
		to_chat(src, "You cannot do that in your current state.")

	if(docile)
		to_chat(src, "\blue You are feeling far too docile to do that.")
		return


	to_chat(src, "<span class = 'danger'>It only takes a few moments to render the dead host brain down into a nutrient-rich slurry...</span>")
	replace_brain()


// BRAIN WORM ZOMBIES AAAAH.
/mob/living/simple_animal/borer/proc/replace_brain()

	var/mob/living/carbon/human/H = host

	if(!istype(host))
		to_chat(src, "This host does not have a suitable brain.")
		return

	to_chat(src, SPAN_DANGER("You settle into the empty brainpan and begin to expand, fusing inextricably with the dead flesh of [H]."))

	H.add_language(LANGUAGE_CORTICAL)

	// Remove the usual "host control" abilities
	remove_verb(H, abilities_in_control)

	add_verb(H, /mob/living/carbon/human/proc/commune)

	add_verb(H, /mob/living/carbon/human/proc/psychic_whisper)
	add_verb(H, /mob/living/carbon/human/proc/tackle)
	add_verb(H, /mob/living/carbon/proc/spawn_larvae)
	add_verb(H, /mob/living/carbon/proc/talk_host)

	if(H.client)
		H.daemonize()

	if(src.mind)
		src.mind.transfer_to(host)

	H.ChangeToHusk()

	var/obj/item/organ/internal/borer/B = new(H)
	H.internal_organs_by_efficiency[BP_BRAIN] = B
	H.internal_organs |= B

	var/obj/item/organ/external/affecting = H.get_organ(BP_HEAD)
	affecting.implants -= src

	var/s2h_id = src.computer_id
	var/s2h_ip= src.lastKnownIP
	src.computer_id = null
	src.lastKnownIP = null

	if(!H.computer_id)
		H.computer_id = s2h_id

	if(!H.lastKnownIP)
		H.lastKnownIP = s2h_ip*/

/mob/living/simple_animal/borer/proc/secrete_chemicals()
	set category = "Abilities"
	set name = "Secrete Chemicals"
	set desc = "Push some chemicals into your host's bloodstream."

	if(stat)
		return

	if(!host)
		to_chat(src, SPAN_WARNING("You are not inside a host body."))
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return

	if(chemicals < 50)
		to_chat(src, SPAN_WARNING("You don't have enough chemicals!"))
		return

	var/list/chem_names = list()
	for(var/id in produced_reagents)
		var/datum/reagent/D = GLOB.chemical_reagents_list[id]
		chem_names[D.name] = id

	var/chem_name = input("Select a chemical to secrete.", "Chemicals") as null|anything in chem_names
	var/chem = chem_names[chem_name]

	if(!chem || chemicals < 50 || !host || controlling || !src || stat) //Sanity check.
		return

	host.reagents.add_reagent(chem, 10)
	to_chat(src, SPAN_NOTICE("You secrete some chemicals from your reservoirs. There are [host.reagents.get_reagent_amount(chem)] units of [chem_name] in host's bloodstream now."))
	chemicals -= 50

/mob/living/simple_animal/borer/proc/paralyze_victim()
	set category = "Abilities"
	set name = "Paralyze Victim"
	set desc = "Freeze the limbs of a potential host with supernatural fear."

	if(src.stat)
		return

	if(world.time - used_dominate < 150)
		to_chat(src, SPAN_WARNING("You cannot use that ability again so soon."))
		return

	if(is_ventcrawling)
		to_chat(src, SPAN_WARNING("You cannot use that ability while in vent."))
		return

	if(chemicals < 10)
		to_chat(src, SPAN_WARNING("You don't have enough chemicals!"))
		return

	var/list/choices = list()
	for(var/mob/living/carbon/C in view(1, get_turf(src)))
		if(C == host || C.stat == DEAD)
			continue

		choices += C

	if(!choices)
		to_chat(src, SPAN_WARNING("No available creatures found in your radius."))
		return

	var/mob/living/carbon/M = input(src,"Who do you wish to dominate?") in null|choices

	if(!M || !(M in view(3, get_turf(src)))) return

	if(M.has_brain_worms())
		to_chat(src, "You cannot paralyze someone who is already infested!")
		return

	to_chat(src, SPAN_WARNING("You focus your psychic lance on [M] and freeze their limbs with a wave of terrible dread."))
	to_chat(M, SPAN_DANGER("You feel a creeping, horrible sense of dread come over you, freezing your limbs and setting your heart racing."))
	var/duration = 10 + (borer_level*2)

	M.Weaken(duration)
	M.SetStunned(duration)
	M.SetParalysis(duration)
	chemicals -= 10

	used_dominate = world.time

/mob/living/simple_animal/borer/proc/assume_control()
	set category = "Abilities"
	set name = "Assume Control"
	set desc = "Fully connect to the brain of your host."

	if(stat)
		return

	if(!host)
		to_chat(src, SPAN_WARNING("You are not inside a host body."))
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return

	to_chat(src, SPAN_NOTICE("You begin delicately adjusting your connection to the host brain..."))

	spawn(100+(host.brainloss*5))

		if(!host || !src || controlling)
			return
		else

			to_chat(src, SPAN_DANGER("You plunge your probosci deep into the cortex of the host brain, interfacing directly with their nervous system."))
			to_chat(host, SPAN_DANGER("You feel a strange shifting sensation behind your eyes as another consciousness displaces yours."))
			host.add_language(LANGUAGE_CORTICAL)

			// host -> brain
			var/h2b_id = host.computer_id
			var/h2b_ip= host.lastKnownIP
			host.computer_id = null
			host.lastKnownIP = null

			qdel(host_brain)
			host_brain = new(src)

			host_brain.ckey = host.ckey

			host_brain.name = host.name

			if(!host_brain.computer_id)
				host_brain.computer_id = h2b_id

			if(!host_brain.lastKnownIP)
				host_brain.lastKnownIP = h2b_ip

			// self -> host
			var/s2h_id = src.computer_id
			var/s2h_ip= src.lastKnownIP
			src.computer_id = null
			src.lastKnownIP = null

			host.ckey = src.ckey

			if(!host.computer_id)
				host.computer_id = s2h_id

			if(!host.lastKnownIP)
				host.lastKnownIP = s2h_ip

			controlling = TRUE

			remove_verb(host, list(
			/mob/living/simple_animal/verb/toggle_AI,
			/mob/living/simple_animal/hostile/verb/break_around,
			/mob/living/carbon/superior_animal/verb/toggle_AI,
			/mob/living/carbon/superior_animal/verb/break_around,
			))

			update_abilities()

/mob/living/simple_animal/borer/proc/jumpstart()
	set category = "Abilities"
	set name = "Revive Host"
	set desc = "Send a jolt of electricity through your host, reviving them."

	if(host.stat != DEAD)
		to_chat(src, "Your host is already alive.")
		return

	if(chemicals < 500)
		to_chat(src, SPAN_WARNING("You don't have enough chemicals!"))
		return

	if(host.getBrainLoss() >= 100)
		to_chat(src, SPAN_WARNING("Host is brain dead!"))
		return
	visible_message(SPAN_WARNING("With a hideous, rattling moan, [host] shudders back to life!"))

	var/all_damage = host.getBruteLoss() + host.getFireLoss() + host.getCloneLoss() + host.getOxyLoss() + host.getToxLoss()
	while(all_damage > 90)
		host.adjustBruteLoss(-10)
		host.adjustFireLoss(-10)
		host.adjustCloneLoss(-10)
		host.adjustOxyLoss(-10)
		all_damage = host.getBruteLoss() + host.getFireLoss() + host.getCloneLoss() + host.getOxyLoss() + host.getToxLoss()

	host.stat = UNCONSCIOUS
	host.updatehealth()
	host.make_jittery(100)
	host.SetStunned(10)
	host.SetWeakened(10)
	host.SetParalysis(10)
	host.restore_blood()
	host.fixblood()
	host.update_lying_buckled_and_verb_status()
	chemicals -= 500

/mob/living/simple_animal/borer/proc/read_mind()
	set category = "Abilities"
	set name = "Read Mind"
	set desc = "Extract information, languages and skills out of host's brain. May cause confusion and brain damage."

	if(stat)
		return

	if(!host)
		to_chat(src, SPAN_WARNING("You are not inside a host body."))
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return

	var/list/copied_stats = list()
	if(!host.stats)
		for(var/stat_name in ALL_STATS)
			var/host_stat = host.stats.getStat(stat_name, pure=TRUE)
			var/borer_stat = stats.getStat(stat_name, pure=TRUE)
			if(host_stat > borer_stat)
				stats.setStat(stat_name, host_stat)
				copied_stats += stat_name

	var/list/copied_languages = list()
	for(var/datum/language/L in host.languages)
		if(!(L.flags & HIVEMIND) && !can_speak(L))
			add_language(L.name)
			copied_languages += L.name

	if(host.mind)
		host.mind.show_memory(src)

	var/copied_amount = length(copied_stats) + length(copied_languages)
	if(copied_amount)
		borer_add_exp((copied_amount*5))
		if(length(copied_stats))
			to_chat(src, SPAN_NOTICE("You extracted some knowledge on [english_list(copied_stats)]."))

		if(length(copied_languages))
			to_chat(src, SPAN_NOTICE("You learned [english_list(copied_languages)]."))

		to_chat(host, SPAN_DANGER("Your head spins, your memories thrown in disarray!"))
		host.adjustBrainLoss(copied_amount * 4)
		host?.sanity.onPsyDamage(copied_amount * 4)

		host.make_dizzy(copied_amount * 4)
		host.confused = max(host.confused, copied_amount * 4)


/mob/living/simple_animal/borer/proc/write_mind()
	set category = "Abilities"
	set name = "Write Mind"
	set desc = "Write known skills and languages to host's brain. May cause confusion and brain damage."

	if(stat)
		return

	if(!host)
		to_chat(src, SPAN_WARNING("You are not inside a host body."))
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return

	var/list/copied_stats = list()
	for(var/stat_name in ALL_STATS)
		var/host_stat = host.stats.getStat(stat_name, pure=TRUE)
		var/borer_stat = stats.getStat(stat_name, pure=TRUE)
		if(borer_stat > host_stat)
			host.stats.setStat(stat_name, borer_stat)
			copied_stats += stat_name

	var/list/copied_languages = list()
	for(var/datum/language/L in languages)
		if(!(L.flags & HIVEMIND) && !host.can_speak(L))
			host.add_language(L.name)
			copied_languages += L.name


	var/copied_amount = length(copied_stats) + length(copied_languages)
	if(copied_amount)
		if(length(copied_stats))
			to_chat(src, SPAN_NOTICE("You put some knowledge on [english_list(copied_stats)] into your host's mind."))

		if(length(copied_languages))
			to_chat(src, SPAN_NOTICE("You teach your host [english_list(copied_languages)]."))

		to_chat(host, SPAN_DANGER("Your head spins as new information fills your mind!"))
		host.adjustBrainLoss(copied_amount * 2)
		host?.sanity.onPsyDamage(copied_amount * 2)

		host.make_dizzy(copied_amount * 2)
		host.confused = max(host.confused, copied_amount * 2)

/mob/living/simple_animal/borer/proc/say_host()
	set category = "Abilities"
	set name = "Say as Host"
	set desc = "Say something as host."

	if(stat)
		return

	if(!host)
		to_chat(src, "\red <B>You cannot do this without a host.</B>")
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return

	if(!host || !src) return

	var/message = input("", "say (text)") as text
	host.say(message)

/mob/living/simple_animal/borer/proc/whisper_host()
	set category = "Abilities"
	set name = "Whisper as Host"
	set desc = "Whisper something as host."

	if(stat)
		return

	if(!host)
		to_chat(src, "You are not inside a host body.")
		return

	if(docile)
		to_chat(src, SPAN_DANGER("You are feeling far too docile to do that."))
		return

	if(!host || !src) return

	var/message = input("", "whisper (text)") as text
	host.whisper(message)

/mob/living/simple_animal/borer/proc/invisible()
	set category = "Abilities"
	set name = "Invisibility"
	set desc = "Become invisible for living being."

	if(src.stat)
		return

	if(world.time - used_dominate < 150)
		to_chat(src, "\red <B>You cannot use that ability again so soon.</B>")
		return

	if(host)
		to_chat(src, "\red <B>You cannot do this inside a host.</B>")
		return

	if(invisibility)
		src.invisibility = 0
		src.alpha = 255
		used_dominate = world.time
		to_chat(src, SPAN_NOTICE("You become visible again."))
		return
	else
		src.invisibility = 26
		src.alpha = 100
		to_chat(src, SPAN_NOTICE("You become invisible for living being."))
		return

/mob/living/simple_animal/borer/proc/biograde()
	set category = "Abilities"
	set name = "Biograde Vision"
	set desc = "Make you see living being throug walls."

	if(src.stat)
		return

	if(host)
		to_chat(src, "\red <B>You cannot do this inside a host.</B>")
		return

	if(sight & SEE_MOBS)
		sight &= ~SEE_MOBS
		to_chat(src, SPAN_NOTICE("You cannot see living being throug walls for now."))
		return
	else
		sight |= SEE_MOBS
		to_chat(src, SPAN_NOTICE("You can now sen living being throug walls."))
		return

/mob/living/simple_animal/borer/proc/reproduce()
	set category = "Abilities"
	set name = "Reproduce"
	set desc = "Spawn several young."

	if(src.stat)
		return

	if(!host)
		to_chat(src, "\red <B>You cannot do this without a host.</B>")
		return

	if(chemicals >= 100)
		to_chat(host, "\red <B>Your host twitches and quivers as you rapidly excrete a larva from your sluglike body.</B>")
		visible_message("\red <B>[host.name] heaves violently, expelling a rush of vomit and a wriggling, sluglike creature!</B>")
		chemicals -= 100
		has_reproduced = 1
		borer_add_exp(10)

		new /obj/effect/decal/cleanable/vomit(get_turf(host))
		playsound(loc, 'sound/effects/splat.ogg', 50, 1)
		new /mob/living/simple_animal/borer(get_turf(host))

	else
		to_chat(src, SPAN_NOTICE("You do not have enough chemicals stored to reproduce."))
		return

/mob/living/simple_animal/borer/proc/commune()
	set category = "Abilities"
	set name = "Commune with humans"
	set desc = "Send a telepathic message to an unlucky recipient."

	var/list/targets = list()
	var/target = null
	var/text = null

	for(var/mob/living/carbon/H in oview())
		if(H == host || H.stat == DEAD)
			continue

		targets += H //Fill list, prompt user with list
	target = input("Select a creature!", "Speak to creature", null, null) as null|anything in targets

	if(!target) return

	text = input("What would you like to say?", "Speak to human", null, null)

	text = capitalize(sanitize(text))

	if(!text) return

	var/mob/M = targets[target]

	if(isghost(M) || M.stat == DEAD)
		to_chat(src, "Not even you can speak to the dead.")
		return

	log_say("[key_name(src)] communed to [key_name(M)]: [text]")

	to_chat(M, "\blue Like lead slabs crashing into the ocean, alien thoughts drop into your mind: [text]")
	if(ishuman(M))
		var/mob/living/carbon/human/H = M

		to_chat(H, SPAN_WARNING("Your nose begins to bleed..."))
		H.drip_blood(1)

/mob/living/simple_animal/borer/proc/sample_blood()
	set category = "Abilities"
	set name = "Sample blood"
	set desc = "Discover what ails them."

	if(!ishuman(host))
		to_chat(src, SPAN_WARNING("This creature is too simplistic to care for."))
		return

	var/dat
	var/delete
	var/temphtml

	if (delete && temphtml) //Window in buffer but its just simple message, so nothing
		delete = delete
	else if (!delete && temphtml) //Window in buffer - its a menu, dont add clear message
		dat = text("[]<BR><BR><A href='?src=\ref[];clear=1'>Main Menu</A>", temphtml, src)
	else
		if (host) //are we inside?
			dat = format_host_data(get_host_data())
		else
			dat = SPAN_WARNING("This is a bug.")

	dat += text("<BR><A href='?src=\ref[];mach_close=scanconsole'>Close</A>", src)
	src << browse(dat, "window=scanconsole;size=430x600")
	return

/mob/living/simple_animal/borer/proc/get_host_data()
	if (!ishuman(host))
		return
	var/mob/living/carbon/human/H = host
	var/list/host_data = list(
		"stationtime" = stationtime2text(),
		"stat" = H.stat,
		"health" = round(H.health/H.maxHealth)*100,
		"bruteloss" = H.getBruteLoss(),
		"fireloss" = H.getFireLoss(),
		"oxyloss" = H.getOxyLoss(),
		"toxloss" = H.getToxLoss(),
		"rads" = H.radiation,
		"cloneloss" = H.getCloneLoss(),
		"brainloss" = H.getBrainLoss(),
		"paralysis" = H.paralysis,
		"bodytemp" = H.bodytemperature,
		"inaprovaline_amount" = H.reagents.get_reagent_amount("inaprovaline"),
		"dexalin_amount" = H.reagents.get_reagent_amount("dexalin"),
		"stoxin_amount" = H.reagents.get_reagent_amount("stoxin"),
		"bicaridine_amount" = H.reagents.get_reagent_amount("bicaridine"),
		"dermaline_amount" = H.reagents.get_reagent_amount("dermaline"),
		"blood_amount" = round((H.vessel.get_reagent_amount("blood") / H.species.blood_volume)*100),
		"disabilities" = H.sdisabilities,
		"external_organs" = H.organs.Copy(),
		"internal_organs" = H.internal_organs.Copy(),
		"species_organs" = H.species.has_process, //Just pass a reference for this, it shouldn't ever be modified outside of the datum.
		"NSA" = max(0, H.metabolism_effects.get_nsa()),
		"NSA_threshold" = H.metabolism_effects.nsa_threshold
		)
	return host_data


/mob/living/simple_animal/borer/proc/format_host_data(var/list/occ)
	var/dat = "<font color='blue'><b>Sampling taken at [occ["stationtime"]]</b></font><br>"
	dat += "<font color='blue'><b>Creature's vitality:</b></font><br>"

	var/aux
	switch (occ["stat"])
		if(0)
			aux = "Conscious"
		if(1)
			aux = "Unconscious"
		else
			aux = "Dead"
	dat += text("[]\tHealth %: [] ([])</font><br>", ("<font color='[occ["health"] > 50 ? "blue" : "red"]>"), occ["health"], aux)
	dat += text("[]\t-Brute Damage %: []</font><br>", ("<font color='[occ["bruteloss"] < 60  ? "blue" : "red"]'>"), occ["bruteloss"])
	dat += text("[]\t-Respiratory Damage %: []</font><br>", ("<font color='[occ["oxyloss"] < 60  ? "blue" : "red"]'>"), occ["oxyloss"])
	dat += text("[]\t-Toxin Content %: []</font><br>", ("<font color='[occ["toxloss"] < 60  ? "blue" : "red"]'>"), occ["toxloss"])
	dat += text("[]\t-Burn Severity %: []</font><br><br>", ("<font color='[occ["fireloss"] < 60  ? "blue" : "red"]'>"), occ["fireloss"])

	dat += text("[]\tRadiation Level %: []</font><br>", ("<font color='[occ["rads"] < 10  ? "blue" : "red"]'>"), occ["rads"])
	dat += text("[]\tGenetic Tissue Damage %: []</font><br>", ("<font color='[occ["cloneloss"] < 1  ? "blue" : "red"]'>"), occ["cloneloss"])
	dat += text("[]\tApprox. Brain Damage %: []</font><br>", ("<font color='[occ["brainloss"] < 1  ? "blue" : "red"]'>"), occ["brainloss"])
	dat += text("[]\tNeural System Accumulation: []/[]<br>", ("<font color='[occ["NSA"] < occ["NSA_threshold"]  ? "blue" : "red"]'>"), occ["NSA"], occ["NSA_threshold"])
	dat += text("Paralysis Summary %: [] ([] seconds left!)<br>", occ["paralysis"], round(occ["paralysis"] / 4))
	dat += text("Body Temperature: [occ["bodytemp"]-T0C]&deg;C ([occ["bodytemp"]*1.8-459.67]&deg;F)<br><HR>")

	dat += text("[]\tBlood Level %: [] ([] units)</FONT><BR>", ("<font color='[occ["blood_amount"] > 80  ? "blue" : "red"]'>"), occ["blood_amount"], occ["blood_amount"])

	dat += text("Inaprovaline: [] units<BR>", occ["inaprovaline_amount"])
	dat += text("Soporific: [] units<BR>", occ["stoxin_amount"])
	dat += text("[]\tDermaline: [] units</FONT><BR>", ("<font color='[occ["dermaline_amount"] < 30  ? "black" : "red"]'>"), occ["dermaline_amount"])
	dat += text("[]\tBicaridine: [] units</font><BR>", ("<font color='[occ["bicaridine_amount"] < 30  ? "black" : "red"]'>"), occ["bicaridine_amount"])
	dat += text("[]\tDexalin: [] units</font><BR>", ("<font color='[occ["dexalin_amount"] < 30  ? "black" : "red"]'>"), occ["dexalin_amount"])

	dat += "<HR><table border='1'>"
	dat += "<tr>"
	dat += "<th>Organ</th>"
	dat += "<th>Burn Damage</th>"
	dat += "<th>Brute Damage</th>"
	dat += "<th>Other Wounds</th>"
	dat += "</tr>"

	for(var/obj/item/organ/external/e in occ["external_organs"])
		var/list/other_wounds = list()

		dat += "<tr>"

		for(var/datum/wound/W in e.wounds) if(W.internal)
			other_wounds += "Internal bleeding"
			break
		if(e.status & ORGAN_SPLINTED)
			other_wounds += "Splinted"
		if(e.status & ORGAN_BLEEDING)
			other_wounds += "Bleeding"
		if(BP_IS_ASSISTED(e))
			other_wounds += "Assisted"
		if(BP_IS_ROBOTIC(e))
			other_wounds += "Prosthetic"
		if(e.open)
			other_wounds += "Open"

		if(e.rejecting)
			other_wounds += "being rejected"
		var/known_implants = list() //You know nothing, jon sno
		if (e.implants.len)
			var/unknown_body = FALSE
			for(var/I in e.implants)
				if(is_type_in_list(I,known_implants))
					var/obj/item/implant/device = I
					other_wounds -= "[device.get_scanner_name()] implanted"
				else
					unknown_body = TRUE
			if(unknown_body)
				other_wounds += "Inorganic substance detected."

		if(!e.is_stump())
			dat += "<td>[e.name]</td><td>[e.burn_dam]</td><td>[e.brute_dam]</td><td>[other_wounds.len ? jointext(other_wounds, ":") : "None"]</td>"
		else
			dat += "<td>[e.name]</td><td>-</td><td>-</td><td>Not Found</td>"
		dat += "</tr>"

	for(var/obj/item/organ/internal/I in occ["internal_organs"])
		if(I.scanner_hidden)
			continue

		var/list/other_wounds = list()
		if(BP_IS_ASSISTED(I))
			other_wounds += "Assisted"
		if(BP_IS_ROBOTIC(I))
			other_wounds += "Prosthetic"

		var/obj/item/organ/internal/bone/B = I
		if(istype(B))
			if(B.parent.status & ORGAN_BROKEN)
				other_wounds += "[B.broken_description]"

		dat += "<tr>"
		dat += "<td>[I.name]</td><td>N/A</td><td>[I.damage]</td><td>[other_wounds.len ? jointext(other_wounds, ":") : "None"]</td><td></td>"
		dat += "</tr>"
	dat += "</table>"

	var/list/species_organs = occ["species_organs"]
	for(var/organ_name in species_organs)
		if(!locate(species_organs[organ_name]) in occ["internal_organs"])
			dat += text("<font color='red'>No [organ_name] detected.</font><BR>")

	if(occ["sdisabilities"] & BLIND)
		dat += text("<font color='red'>Cataracts detected.</font><BR>")
	if(occ["sdisabilities"] & NEARSIGHTED)
		dat += text("<font color='red'>Retinal misalignment detected.</font><BR>")
	return dat
