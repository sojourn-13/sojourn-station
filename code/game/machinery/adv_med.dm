// Pretty much everything here is stolen from the dna scanner FYI


/obj/machinery/bodyscanner
	var/mob/living/carbon/occupant
	var/obj/machinery/body_scanconsole/connected
	var/locked
	name = "body scanner"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "scanner_off"
	density = 1
	anchored = 1

	use_power = IDLE_POWER_USE
	idle_power_usage = 60
	active_power_usage = 10000	//10 kW. It's a big all-body scanner.

/obj/machinery/bodyscanner/relaymove(mob/user as mob)
	if (user.stat)
		return
	src.go_out()
	return

/obj/machinery/bodyscanner/verb/eject()
	set src in oview(1)
	set category = "Object"
	set name = "Eject Body Scanner"

	if (usr.stat != 0)
		return
	src.go_out()
	add_fingerprint(usr)
	return

/obj/machinery/bodyscanner/verb/move_inside()
	set src in oview(1)
	set category = "Object"
	set name = "Enter Body Scanner"

	if(usr.stat)
		return
	if(src.occupant)
		to_chat(usr, SPAN_WARNING("The scanner is already occupied!"))
		return
	set_occupant(usr)
	src.add_fingerprint(usr)
	return

/obj/machinery/bodyscanner/proc/go_out()
	if (!occupant || locked)
		return
	for(var/obj/O in src)
		O.forceMove(loc)
	src.occupant.forceMove(loc)
	src.occupant.reset_view()
	src.occupant = null
	update_use_power(1)
	update_icon()

/obj/machinery/bodyscanner/AltClick(mob/user)
	if(Adjacent(user))
		eject()

/obj/machinery/bodyscanner/proc/set_occupant(var/mob/living/L)
	L.forceMove(src)
	src.occupant = L
	update_use_power(2)
	update_icon()
	playsound(src, 'sound/machines/medbayscanner1.ogg', 50)
	src.add_fingerprint(usr)


/obj/machinery/bodyscanner/affect_grab(var/mob/user, var/mob/target)
	if (src.occupant)
		to_chat(user, SPAN_NOTICE("The scanner is already occupied!"))
		return
	if(target.buckled)
		to_chat(user, SPAN_NOTICE("Unbuckle the subject before attempting to move them."))
		return
	set_occupant(target)
	src.add_fingerprint(user)
	return TRUE

/obj/machinery/bodyscanner/MouseDrop_T(var/mob/target, var/mob/user)
	if(!ismob(target))
		return
	if (src.occupant)
		to_chat(user, SPAN_WARNING("The scanner is already occupied!"))
		return
	if (target.buckled)
		to_chat(user, SPAN_NOTICE("Unbuckle the subject before attempting to move them."))
		return
	if(target == user)
		visible_message("\The [user] starts climbing into \the [src].")
	else
		visible_message("\The [user] starts putting [target] into \the [src].")

	if(!do_after(user, 30, src) || !Adjacent(target))
		return
	set_occupant(target)
	src.add_fingerprint(user)
	return

/obj/machinery/bodyscanner/ex_act(severity)
	switch(severity)
		if(1.0)
			for(var/atom/movable/A in src)
				A.forceMove(loc)
				A.ex_act(severity)
			qdel(src)
		if(2.0)
			if (prob(50))
				for(var/atom/movable/A in src)
					A.forceMove(loc)
					A.ex_act(severity)
				qdel(src)
		if(3.0)
			if (prob(25))
				for(var/atom/movable/A in src)
					A.forceMove(loc)
					A.ex_act(severity)
				qdel(src)

/obj/machinery/body_scanconsole/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			if (prob(50))
				qdel(src)
				return

/obj/machinery/body_scanconsole/power_change()
	..()
	update_icon()

/obj/machinery/body_scanconsole
	var/obj/machinery/bodyscanner/connected
	var/known_implants = list(
		/obj/item/implant/chem,
		/obj/item/implant/death_alarm,
		/obj/item/implant/tracking,
		/obj/item/implant/core_implant/cruciform,
		/obj/item/implant/excelsior
	)
	var/known_cybernetics = list(
		/obj/item/organ_module/active/simple/wolverine,
		/obj/item/organ_module/active/simple/armblade/energy_blade,
		/obj/item/organ_module/active/simple/armblade/bs_tomahawk,
		/obj/item/organ_module/active/simple/armblade/longsword,
		/obj/item/organ_module/active/simple/armblade/ritual
	)
	var/delete
	var/temphtml
	var/list/stored_scan_data // Store scan data between UI updates
	name = "body scanner console"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "scanner_terminal_off"
	density = 1
	anchored = 1


/obj/machinery/body_scanconsole/New()
	..()
	spawn(5)
		for(var/dir in cardinal)
			connected = locate(/obj/machinery/bodyscanner) in get_step(src, dir)
			if(connected)
				return

/obj/machinery/body_scanconsole/attack_hand(user as mob)
	if(..())
		return
	if(stat & (NOPOWER|BROKEN))
		return
	if(!connected || (connected.stat & (NOPOWER|BROKEN)))
		to_chat(user, SPAN_WARNING("This console is not connected to a functioning body scanner."))
		return
	if(!ishuman(connected.occupant))
		to_chat(user, SPAN_WARNING("This device can only scan compatible lifeforms."))
		return
	if(!usr.stats?.getPerk(PERK_MEDICAL_EXPERT) && !usr.stat_check(STAT_BIO, STAT_LEVEL_EXPERT) && !usr.stat_check(STAT_COG, 50)) //Are we missing the perk AND to low on bio? Needs bio 25 so cog 50 to bypass
		to_chat(usr, SPAN_WARNING("Your biological understanding isn't enough to use this."))
		return

	nano_ui_interact(user)

/obj/machinery/body_scanconsole/nano_ui_interact(var/mob/user, var/ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS, var/datum/nano_topic_state/state = GLOB.outside_state)
	var/data[0]

	data["power"] = !(stat & (NOPOWER|BROKEN))
	data["connected"] = connected && !(connected.stat & (NOPOWER|BROKEN))
	data["printEnabled"] = FALSE
	data["eraseEnabled"] = FALSE

	if(connected && connected.occupant)
		data["scanEnabled"] = TRUE
		if(ishuman(connected.occupant))
			data["isCompatible"] = TRUE
		else
			data["isCompatible"] = FALSE

		// Only show stored scan data if there's a patient present
		if(stored_scan_data)
			data["scan"] = stored_scan_data
			data["printEnabled"] = TRUE
			data["eraseEnabled"] = TRUE
	else
		data["scanEnabled"] = FALSE
		// Clear stored scan data when no patient is present
		stored_scan_data = null

	if(!data["scan"])
		data["html_scan_header"] = "<center>No scan loaded.</center>"
		data["html_scan_health"] = "&nbsp;"
		data["html_scan_body"] = "&nbsp;"
	else
		var/list/scan_data = data["scan"]
		data["html_scan_header"] = format_scan_header(scan_data)
		data["html_scan_health"] = format_scan_health(scan_data)
		data["html_scan_body"] = format_scan_body(scan_data)

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "body_scanner.tmpl", "Body Scanner", 700, 800, state = state)
		ui.set_initial_data(data)
		ui.open()
		ui.set_auto_update(1)

/obj/machinery/body_scanconsole/Topic(href, href_list)
	if(..())
		return 1

	add_fingerprint(usr)

	if(href_list["scan"])
		// Play button click sound
		playsound(src.loc, 'sound/machines/machine_switch.ogg', 50)

		if (!connected.occupant)
			to_chat(usr, SPAN_WARNING("The body scanner is empty."))
			return TOPIC_REFRESH
		if (!ishuman(connected.occupant))
			to_chat(usr, SPAN_WARNING("The body scanner cannot scan that lifeform."))
			return TOPIC_REFRESH

		usr.visible_message(
			SPAN_NOTICE("\The [usr] performs a scan using \the [src]."),
			SPAN_NOTICE("You run a full-body diagnostic using \the [src]."),
			"<i>You hear a series of beeps, followed by a deep humming sound.</i>"
		)

		// Wait 0.5 seconds before displaying scan results and playing completion sound
		spawn(5) // 5 deciseconds = 0.5 seconds
			var/list/scan_data = connected.get_occupant_data()
			stored_scan_data = scan_data // Store for later access
			SSnano.update_uis(src)
			// Play scan completion sound after delay
			playsound(src.loc, 'sound/machines/beep-scan.mp3', 50)

		return TOPIC_REFRESH

	if(href_list["print"])
		// Play button click sound
		playsound(src.loc, 'sound/machines/machine_switch.ogg', 50)
		if(!stored_scan_data)
			to_chat(usr, SPAN_WARNING("Error: No scan stored."))
			return TOPIC_REFRESH
		spawn(5) // 5 deciseconds = 0.5 seconds
			playsound(src.loc, 'sound/machines/printer.mp3', 50)
			var/obj/item/paper/R = new(src.loc)
			R.name = "[stored_scan_data["name"]] scan report"
			R.info = format_occupant_data(stored_scan_data, usr)
			R.update_icon()
		return TOPIC_REFRESH

	if(href_list["erase"])
		// Play button click sound
		playsound(src.loc, 'sound/machines/machine_switch.ogg', 50)

		stored_scan_data = null
		return TOPIC_REFRESH

	playsound(loc, 'sound/machines/button.ogg', 100, 1)
	return 1

/obj/machinery/body_scanconsole/proc/format_scan_header(var/list/occ)
	var/dat = list()
	dat += "<table class='block' width='95%'>"
	dat += "<tr><td><strong>Scan Results For:</strong></td><td>[occ["name"]]</td></tr>"
	dat += "<tr><td><strong>Scan performed at:</strong></td><td>[occ["stationtime"]]</td></tr>"
	dat += "</table>"
	return jointext(dat, null)

/obj/machinery/body_scanconsole/proc/format_scan_health(var/list/occ)
	var/dat = list()

	// Basic vital signs
	dat += "<table class='block' width='95%'>"
	dat += "<tr><th colspan='2'>Vital Signs</th></tr>"

	var/aux
	switch (occ["stat"])
		if(0)
			aux = "Conscious"
		if(1)
			aux = "Unconscious"
		else
			aux = "Dead"

	var/health_color = occ["health"] > 80 ? "good" : occ["health"] > 20 ? "average" : "bad"
	dat += "<tr><td>Critical Health:</td><td class='[health_color]'>[occ["health"]]% ([aux])</td></tr>"

	var/brute_color = occ["bruteloss"] < 30 ? "good" : occ["bruteloss"] < 60 ? "average" : "bad"
	dat += "<tr><td>Brute Damage:</td><td class='[brute_color]'>[occ["bruteloss"]]</td></tr>"

	var/burn_color = occ["fireloss"] < 30 ? "good" : occ["fireloss"] < 60 ? "average" : "bad"
	dat += "<tr><td>Burn Damage:</td><td class='[burn_color]'>[occ["fireloss"]]</td></tr>"

	var/oxy_color = occ["oxyloss"] < 30 ? "good" : occ["oxyloss"] < 60 ? "average" : "bad"
	dat += "<tr><td>Respiratory Damage:</td><td class='[oxy_color]'>[occ["oxyloss"]]</td></tr>"

	var/tox_color = occ["toxloss"] < 30 ? "good" : occ["toxloss"] < 60 ? "average" : "bad"
	dat += "<tr><td>Toxicity:</td><td class='[tox_color]'>[occ["toxloss"] ? occ["toxloss"] : "0"]</td></tr>"

	var/brain_color = occ["brainloss"] < 10 ? "good" : occ["brainloss"] < 50 ? "average" : "bad"
	dat += "<tr><td>Brain Damage:</td><td class='[brain_color]'>[occ["brainloss"]]%</td></tr>"

	var/blood_color = occ["blood_amount"] > 80 ? "good" : occ["blood_amount"] > 50 ? "average" : "bad"
	dat += "<tr><td>Blood Level:</td><td class='[blood_color]'>[occ["blood_amount"]]% ([occ["blood_type"]])</td></tr>"

	// Add pulse information
	var/pulse_color = "good"
	var/pulse_text = "[occ["pulse"]] bpm"
	if(occ["pulse_level"] == PULSE_THREADY || occ["pulse_level"] == PULSE_NONE)
		pulse_color = "bad"
	else if(occ["pulse_level"] == PULSE_SLOW || occ["pulse_level"] == PULSE_FAST)
		pulse_color = "average"
	dat += "<tr><td>Pulse:</td><td class='[pulse_color]'>[pulse_text]</td></tr>"

	// Add radiation if present
	if(occ["radiation"] > 0)
		var/rad_color = occ["radiation"] > 50 ? "bad" : occ["radiation"] > 10 ? "average" : "good"
		dat += "<tr><td>Radiation Level:</td><td class='[rad_color]'>[occ["radiation"]] rads</td></tr>"

	// Add clone damage if present
	if(occ["clone_loss"] > 0)
		var/clone_color = occ["clone_loss"] > 50 ? "bad" : occ["clone_loss"] > 20 ? "average" : "good"
		dat += "<tr><td>Cellular Damage:</td><td class='[clone_color]'>[occ["clone_loss"]]</td></tr>"

	dat += "<tr><td>Body Temperature:</td><td>[occ["bodytemp"]-T0C]°C</td></tr>"
	dat += "</table><br>"

	// Chemicals
	dat += "<table class='block' width='95%'>"
	dat += "<tr><th colspan='2'>Blood Chemistry</th></tr>"

	if(occ["blood_reagents"] && length(occ["blood_reagents"]))
		for(var/datum/reagent/R in occ["blood_reagents"])
			if(R.volume > 0.01) // Only show reagents with meaningful amounts
				dat += "<tr><td>[R.name]:</td><td>[round(R.volume, 0.1)] units</td></tr>"
	else
		dat += "<tr><td colspan='2'>No significant chemicals detected</td></tr>"

	dat += "</table><br>"

	// Stomach Contents
	dat += "<table class='block' width='95%'>"
	dat += "<tr><th colspan='2'>Stomach Contents</th></tr>"

	if(occ["stomach_reagents"] && length(occ["stomach_reagents"]))
		for(var/datum/reagent/R in occ["stomach_reagents"])
			if(R.volume > 0.01) // Only show reagents with meaningful amounts
				dat += "<tr><td colspan='2'>[R.name] detected</td></tr>"
	else
		dat += "<tr><td colspan='2'>No substances detected in stomach</td></tr>"

	dat += "</table>"

	return jointext(dat, null)

/obj/machinery/body_scanconsole/proc/format_scan_body(var/list/occ)
	var/dat = list()

	// Add systemic organ failure warning if present
	if(occ["systemic_organ_failure"])
		dat += "<div class='notice' style='color: red; font-weight: bold; border: 2px solid red; padding: 5px;'>⚠ CRITICAL: MAJOR SYSTEMIC ORGAN FAILURE DETECTED ⚠</div><br>"

	// Add facial disfigurement warning if present (less intrusive)
	if(occ["face_mangled"])
		dat += "<div class='notice' style='color: black; font-style: italic; font-size: 0.9em;'>Note: Facial disfigurement detected</div><br>"

	// Organ status table
	dat += "<table class='block' width='95%'>"
	dat += "<tr><th>Organ</th><th>Burn Damage</th><th>Brute Damage</th><th>Status</th></tr>"

	for(var/obj/item/organ/external/e in occ["external_organs"])
		var/list/other_wounds = list()

		for(var/obj/item/organ/internal/I in e.internal_organs)
			if(I.scanner_hidden)
				continue

			var/list/internal_wounds = list()
			if(BP_IS_ASSISTED(I))
				internal_wounds += "Assisted"
			if(BP_IS_ROBOTIC(I))
				internal_wounds += "Prosthetic"

			var/total_brute_and_misc_damage = 0
			var/total_burn_damage = 0

			if(I.status & ORGAN_DEAD)
				internal_wounds += "<span class='bad'>Dead</span>"
			else
				if(I.rejecting)
					internal_wounds += "being rejected"

				var/list/internal_wound_comps = I.GetComponents(/datum/component/internal_wound)

				for(var/datum/component/internal_wound/IW in internal_wound_comps)
					var/severity = IW.severity
					internal_wounds += "[IW.name] ([severity]/[IW.severity_max])"
					if(istype(IW, /datum/component/internal_wound/organic/burn) || istype(IW, /datum/component/internal_wound/robotic/emp_burn))
						total_burn_damage += severity
					else
						total_brute_and_misc_damage += severity

				if(istype(I, /obj/item/organ/internal/appendix))
					var/obj/item/organ/internal/appendix/A = I
					if(A.inflamed)
						internal_wounds += "appendicitis"

			var/internal_wounds_details
			if(LAZYLEN(internal_wounds))
				internal_wounds_details = jointext(internal_wounds, ", ")

			if(internal_wounds_details)
				dat += "<tr>"
				dat += "<td>[I.name]<br><i>([e.name])</i></td>"
				dat += "<td class='[total_burn_damage > 10 ? "bad" : "good"]'>[total_burn_damage]</td>"
				dat += "<td class='[total_brute_and_misc_damage > 10 ? "bad" : "good"]'>[total_brute_and_misc_damage]</td>"
				dat += "<td>[internal_wounds_details]</td>"
				dat += "</tr>"

		// External organ processing
		if(e.status & ORGAN_SPLINTED)
			other_wounds += "Splinted"
		if(e.status & ORGAN_BLEEDING)
			other_wounds += "<span class='bad'>Bleeding</span>"
		if(BP_IS_ASSISTED(e))
			other_wounds += "Assisted"
		if(BP_IS_ROBOTIC(e))
			other_wounds += "Prosthetic"
		if(e.open)
			other_wounds += "<span class='bad'>Open</span>"
		if(e.rejecting)
			other_wounds += "being rejected"

		// Process implants
		if(e.implants.len)
			var/unknown_body = FALSE
			for(var/I in e.implants)
				if(is_type_in_list(I,known_implants))
					var/obj/item/implant/device = I
					other_wounds += "[device.get_scanner_name()] implanted"
					continue
				if(is_type_in_list(I,known_cybernetics))
					var/obj/item/organ_module/active/simple/device = I
					other_wounds += "[device.get_scanner_name()] detected"
					continue
				if(istype(I, /obj/item/implant/generic))
					var/obj/item/implant/device = I
					other_wounds += "[device.get_scanner_name()] detected"
					continue
				if(istype(I, /obj/item/material/shard/shrapnel))
					other_wounds += "<span class='bad'>Embedded shrapnel</span>"
					continue
				if(istype(I, /mob/living/simple/borer))
					var/mob/living/simple/borer/Held = I
					other_wounds += "<span class='bad'>Neurophage: [Held.truename]</span>"
					continue
				if(istype(I, /obj/item/implant))
					var/obj/item/implant/device = I
					if(!device.scanner_hidden)
						unknown_body = TRUE
				if(istype(I, /obj/item/organ_module))
					var/obj/item/organ_module/OM = I
					if(OM.completely_hide_from_scanners)
						continue
				unknown_body = TRUE
			if(unknown_body)
				other_wounds += "<span class='average'>Unknown body present</span>"

		if (e.is_stump() || e.burn_dam || e.brute_dam || other_wounds.len)
			dat += "<tr>"
			if(!e.is_stump())
				dat += "<td>[e.name]</td>"
				dat += "<td class='[e.burn_dam > 10 ? "bad" : "good"]'>[e.burn_dam]</td>"
				dat += "<td class='[e.brute_dam > 10 ? "bad" : "good"]'>[e.brute_dam]</td>"
				dat += "<td>[other_wounds.len ? jointext(other_wounds, ", ") : "None"]</td>"
			else
				dat += "<td>[e.name]</td>"
				dat += "<td>-</td>"
				dat += "<td>-</td>"
				dat += "<td><span class='bad'>Not Found</span></td>"
			dat += "</tr>"

	dat += "</table><br>"

	// Missing organs
	var/list/species_organs = occ["species_organs"]
	var/missing_organs = list()
	for(var/organ_name in species_organs)
		if(!locate(species_organs[organ_name]) in occ["internal_organs"])
			missing_organs += organ_name

	if(length(missing_organs))
		dat += "<div class='bad'><strong>Missing Organs:</strong> [jointext(missing_organs, ", ")]</div><br>"

	// Other conditions
	if(occ["disabilities"] & BLIND)
		dat += "<div class='bad'>Cataracts detected.</div>"
	if(occ["disabilities"] & NEARSIGHTED)
		dat += "<div class='bad'>Retinal misalignment detected.</div>"

	if(occ["borer_present"])
		dat += "<div class='bad'>Anomalous neurophage detected.</div>"

	return jointext(dat, null)


/obj/machinery/bodyscanner/proc/get_occupant_data()
	if (!occupant || !ishuman(occupant))
		return
	var/mob/living/carbon/human/H = occupant
	var/list/occupant_data = list(
		"name" = H.get_visible_name(),
		"stationtime" = stationtime2text(),
		"stat" = H.stat,
		"health" = round(H.health / H.maxHealth * 100),
		"bruteloss" = H.getBruteLoss(),
		"fireloss" = H.getFireLoss(),
		"oxyloss" = H.getOxyLoss(),
		"toxloss" = H.chem_effects[CE_TOXIN] + H.chem_effects[CE_ALCOHOL_TOXIC],
		"rads" = H.radiation,
		"cloneloss" = H.getCloneLoss(),
		"brainloss" = H.getBrainLoss(),
		"paralysis" = H.paralysis,
		"bodytemp" = H.bodytemperature,
		"borer_present" = H.has_brain_worms(),
		"blood_reagents" = H.reagents.reagent_list.Copy(),
		"stomach_reagents" = H.ingested ? H.ingested.reagent_list.Copy() : list(),
		"blood_amount" = round((H.vessel.get_reagent_amount("blood") / H.species.blood_volume)*100),
		"blood_type" = H.dna.b_type,
		"pulse" = H.get_pulse(GETPULSE_TOOL),
		"pulse_level" = H.pulse(),
		"blood_pressure" = H.get_blood_pressure(),
		"blood_oxygenation" = H.get_blood_oxygenation(),
		"shock_stage" = H.shock_stage,
		"traumatic_shock" = H.traumatic_shock,
		"radiation" = H.radiation,
		"clone_loss" = H.getCloneLoss(),
		"disabilities" = H.sdisabilities,
		"external_organs" = H.organs.Copy(),
		"internal_organs" = H.internal_organs.Copy(),
		"species_organs" = H.species.has_process, //Just pass a reference for this, it shouldn't ever be modified outside of the datum.
		"NSA" = max(0, H.metabolism_effects.get_nsa()),
		"NSA_threshold" = H.metabolism_effects.nsa_threshold,
		"face_mangled" = FALSE,
		"systemic_organ_failure" = FALSE
		)

	// Check if face is mangled/disfigured
	var/obj/item/organ/external/head = H.get_organ(BP_HEAD)
	if(head && head.disfigured)
		occupant_data["face_mangled"] = TRUE

	// Check for systemic organ failure (3+ vital organs with wounds of severity 1+)
	var/vital_organs_with_wounds = 0
	for(var/obj/item/organ/internal/I in H.internal_organs)
		// Check if this is a vital organ (heart, lungs, brain, liver, etc.)
		if(istype(I, /obj/item/organ/internal/vital) || I.vital)
			// Check if it has wounds with severity >= 1
			var/list/wounds = I.GetComponents(/datum/component/internal_wound)
			for(var/datum/component/internal_wound/IW in wounds)
				if(IW.severity >= 1)
					vital_organs_with_wounds++
					break // Only count this organ once even if it has multiple wounds

	if(vital_organs_with_wounds >= 3)
		// 3 or more vital organs with wounds = systemic organ failure
		occupant_data["systemic_organ_failure"] = TRUE

	return occupant_data


/obj/machinery/body_scanconsole/proc/format_occupant_data(var/list/occ)
	var/dat = "<font color='blue'><b>Scan performed at [occ["stationtime"]]</b></font><br>"
	dat += "<font color='blue'><b>Occupant Statistics:</b></font><br>"
	dat += text("ID Name: <i>[]</i><br>", occ["name"])
	var/aux
	switch (occ["stat"])
		if(0)
			aux = "Conscious"
		if(1)
			aux = "Unconscious"
		else
			aux = "Dead"
	dat += text("[]\t-Critical Health %: [] ([])</font><br>", ("<font color='[occ["health"] > 80 ? "blue" : "red"]'>"), occ["health"], aux)
	dat += text("[]\t-Brute Damage: []</font><br>", ("<font color='[occ["bruteloss"] < 60  ? "blue" : "red"]'>"), occ["bruteloss"])
	dat += text("[]\t-Burn Severity: []</font><br>", ("<font color='[occ["fireloss"] < 60  ? "blue" : "red"]'>"), occ["fireloss"])
	dat += text("[]\t-Respiratory Damage %: []</font><br><br>", ("<font color='[occ["oxyloss"] < 60  ? "blue" : "red"]'>"), occ["oxyloss"])

	dat += text("[]\tToxicity: []</font><br>", ("<font color='[occ["toxloss"] < 60  ? "blue" : "red"]'>"), occ["toxloss"] ? occ["toxloss"] : "0")
	dat += text("[]\tRadiation Level %: []</font><br>", ("<font color='[occ["rads"] < 10  ? "blue" : "red"]'>"), occ["rads"])
	dat += text("[]\tApprox. Brain Damage %: []</font><br>", ("<font color='[occ["brainloss"] < 1  ? "blue" : "red"]'>"), occ["brainloss"])
	dat += text("[]\tNeural System Accumulation: []/[]</font><br>", ("<font color='[occ["NSA"] < occ["NSA_threshold"]  ? "blue" : "red"]'>"), occ["NSA"], occ["NSA_threshold"])
	dat += text("Paralysis Summary %: [] ([] seconds left!)<br>", occ["paralysis"], round(occ["paralysis"] / 4))
	dat += text("Body Temperature: [occ["bodytemp"]-T0C]&deg;C ([occ["bodytemp"]*1.8-459.67]&deg;F)<br><HR>")

	if(occ["borer_present"])
		if (usr.stat_check(STAT_BIO, 30))
			dat += "Second sapient neural signature detected. Likely cause: Anomalous neurophage.<br>"

	dat += text("[]\tBlood Level %: [] ([] units)</FONT><BR>", ("<font color='[occ["blood_amount"] > 80  ? "blue" : "red"]'>"), occ["blood_amount"], occ["blood_amount"])

	// Display all blood reagents
	if(occ["blood_reagents"] && length(occ["blood_reagents"]))
		for(var/datum/reagent/R in occ["blood_reagents"])
			if(R.volume > 0.01) // Only show reagents with meaningful amounts
				dat += text("[]: [] units<BR>", R.name, round(R.volume, 0.1))
	else
		dat += "No significant chemicals detected<BR>"

	dat += "<BR>"

	// Display stomach contents (without quantities)
	dat += "Stomach Contents:<BR>"
	if(occ["stomach_reagents"] && length(occ["stomach_reagents"]))
		for(var/datum/reagent/R in occ["stomach_reagents"])
			if(R.volume > 0.01) // Only show reagents with meaningful amounts
				dat += text("[] detected<BR>", R.name)
	else
		dat += "No substances detected in stomach<BR>"

	dat += "<HR><table border='1'>"
	dat += "<tr>"
	dat += "<th>Organ</th>"
	dat += "<th>Burn Damage</th>"
	dat += "<th>Brute Damage</th>"
	dat += "<th>Status</th>"
	dat += "</tr>"

	for(var/obj/item/organ/external/e in occ["external_organs"])
		var/list/other_wounds = list()
		var/significant = FALSE

		for(var/obj/item/organ/internal/I in e.internal_organs) // I put this before the actual external organ
			if(I.scanner_hidden) // so that I could set significant based on internal organ results.
				continue

			var/list/internal_wounds = list()
			if(BP_IS_ASSISTED(I))
				internal_wounds += "Assisted"
			if(BP_IS_ROBOTIC(I))
				internal_wounds += "Prosthetic"

			var/total_brute_and_misc_damage = 0
			var/total_burn_damage = 0

			if(I.status & ORGAN_DEAD)
				internal_wounds += "<font color='red'>Dead</font>"
			else
				if(I.rejecting)
					internal_wounds += "being rejected"

				var/list/internal_wound_comps = I.GetComponents(/datum/component/internal_wound)

				for(var/datum/component/internal_wound/IW in internal_wound_comps)
					var/severity = IW.severity
					internal_wounds += "[IW.name] ([severity]/[IW.severity_max])"
					if(istype(IW, /datum/component/internal_wound/organic/burn) || istype(IW, /datum/component/internal_wound/robotic/emp_burn))
						total_burn_damage += severity
					else
						total_brute_and_misc_damage += severity
				if(istype(I, /obj/item/organ/internal/appendix))
					var/obj/item/organ/internal/appendix/A = I
					if(A.inflamed)
						internal_wounds += "appendicitis"

			// Format internal wounds
			var/internal_wounds_details
			if(LAZYLEN(internal_wounds))
				internal_wounds_details = jointext(internal_wounds, ",<br>")

			if(internal_wounds_details)
				significant = TRUE
				dat += "<tr>"
				dat += "<td>[I.name],<br><i>[e.name]</i></td><td>[total_burn_damage]</td><td>[total_brute_and_misc_damage]</td><td>[internal_wounds_details ? internal_wounds_details : "None"]</td><td></td>"
				dat += "</tr>"

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
		if (e.implants.len)
			var/unknown_body = FALSE
			for(var/I in e.implants)
				if(is_type_in_list(I,known_implants))
					var/obj/item/implant/device = I
					other_wounds += "[device.get_scanner_name()] implanted"
					continue
				if(is_type_in_list(I,known_cybernetics))
					var/obj/item/organ_module/active/simple/device = I
					other_wounds += "[device.get_scanner_name()] detected"
					continue
				if(istype(I, /obj/item/implant/generic))
					var/obj/item/implant/device = I
					other_wounds += "[device.get_scanner_name()] detected"
					continue
				if(istype(I, /obj/item/material/shard/shrapnel))
					other_wounds += "Embedded shrapnel"
					continue
				if(istype(I, /mob/living/simple/borer))
					var/mob/living/simple/borer/Held = I
					other_wounds += "Neurophage: [Held.truename]"
					continue
				if(istype(I, /obj/item/implant))
					var/obj/item/implant/device = I
					if(!device.scanner_hidden)
						unknown_body = TRUE
				//Secondary fancy check for truely hidden organ modules
				if(istype(I, /obj/item/organ_module))
					var/obj/item/organ_module/OM = I
					if(OM.completely_hide_from_scanners)
						continue
				unknown_body = TRUE
			if(unknown_body)
				other_wounds += "Unknown body present"
		if (e.is_stump() || e.burn_dam || e.brute_dam || other_wounds.len)
			significant = TRUE
			dat += "<tr>"
		if(!e.is_stump() && significant)
			dat += "<td>[e.name]</td><td>[e.burn_dam]</td><td>[e.brute_dam]</td><td>[other_wounds.len ? jointext(other_wounds, ":") : "None"]</td>"
		else if (significant)
			dat += "<td>[e.name]</td><td>-</td><td>-</td><td>Not Found</td>"
		else
			continue
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

/obj/machinery/bodyscanner/update_icon()
	if(stat & (NOPOWER|BROKEN))
		icon_state = "scanner_off"
		set_light(0)
	else
		if(connected)
			connected.update_icon()
		if(occupant)
			var/occupant_condition = round((occupant.health / occupant.maxHealth) * 100)
			if(occupant_condition>=100 && !occupant.getBruteLoss() && !occupant.getFireLoss())
				icon_state = "scanner_green"
				set_light(l_range = 1.5, l_power = 2, l_color = COLOR_LIME)
			else if(occupant_condition>=0)
				icon_state = "scanner_yellow"
				set_light(l_range = 1.5, l_power = 2, l_color = COLOR_YELLOW)
			else if(occupant_condition>=-90)
				icon_state = "scanner_red"
				set_light(l_range = 1.5, l_power = 2, l_color = COLOR_RED)
			else
				icon_state = "scanner_death"
				set_light(l_range = 1.5, l_power = 2, l_color = COLOR_RED)
		else
			icon_state = "scanner_open"
			set_light(0)

/obj/machinery/body_scanconsole/update_icon()
	if(stat & (NOPOWER|BROKEN))
		icon_state = "scanner_terminal_off"
		set_light(0)
	else
		if(connected)
			if(connected.occupant)
				if(connected.occupant.health>=100)
					icon_state = "scanner_terminal_green"
					set_light(l_range = 1.5, l_power = 2, l_color = COLOR_LIME)
				else if(connected.occupant.health>=-90)
					icon_state = "scanner_terminal_red"
					set_light(l_range = 1.5, l_power = 2, l_color = COLOR_RED)
				else
					icon_state = "scanner_terminal_dead"
					set_light(l_range = 1.5, l_power = 2, l_color = COLOR_RED)
			else
				icon_state = "scanner_terminal_blue"
				set_light(l_range = 1.5, l_power = 2, l_color = COLOR_BLUE)
		else
			icon_state = "scanner_terminal_off"
			set_light(0)
