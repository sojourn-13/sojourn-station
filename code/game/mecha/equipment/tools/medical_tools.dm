/*
 * Contains
 * /obj/item/mecha_parts/mecha_equipment/tool/sleeper
 * /obj/item/mecha_parts/mecha_equipment/tool/syringe_gun
 */

/obj/item/mecha_parts/mecha_equipment/tool/sleeper
	name = "mounted sleeper"
	desc = "A sleeper. Mountable to an exosuit. (Can be attached to: Medical Exosuits)"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_0"
	origin_tech = list(TECH_DATA = 2, TECH_BIO = 3)
	matter = list(MATERIAL_STEEL = 20, MATERIAL_GLASS = 10)
	energy_drain = 20
	range = MECHA_MELEE
	equip_cooldown = 20
	var/mob/living/carbon/occupant = null
	var/inject_amount = 10
	required_type = /obj/mecha/medical
	salvageable = 0
	price_tag = 200
	harmful = 0 // So you don't push people around on help intent when you want to scoop them

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/Destroy()
	for(var/atom/movable/AM in src)
		AM.forceMove(get_turf(src))
	occupant = null
	return ..()

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/Process()
	if(!chassis)
		return

	if(!chassis.has_charge(energy_drain))
		return

	var/mob/living/carbon/M = occupant
	if(!M)
		return

	if(M.health > 0)
		M.adjustOxyLoss(-1)
		M.updatehealth()
	M.AdjustStunned(-4)
	M.AdjustWeakened(-4)
	M.AdjustStunned(-4)
	M.Paralyse(2)
	M.Weaken(2)
	M.Stun(2)
	// This entire list is terrible and there should be a better way to do this for a sleeper.
	if(M.reagents.get_reagent_amount("carthatoline") < 1) // Thanks to livermed, a must.
		M.reagents.add_reagent("carthatoline", 5)
	if(M.reagents.get_reagent_amount("bicaridine") < 1)
		M.reagents.add_reagent("bicaridine", 5)
	if(M.reagents.get_reagent_amount("dermaline") < 1)
		M.reagents.add_reagent("dermaline", 5)
	if(M.reagents.get_reagent_amount("dexalinp") < 1)
		M.reagents.add_reagent("dexalinp", 5)
	if(M.reagents.get_reagent_amount("quickclot") < 1)
		M.reagents.add_reagent("quickclot", 5) // Since we can't seal external wounds with gauze, stabilize so they don't bleed in their way to safety.
	chassis.use_power(energy_drain)
	update_equip_info()

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/Exit(atom/movable/O)
	return 0

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/action(mob/living/carbon/target)
	if(!action_checks(target))
		return
	if(!istype(target))
		return
	if(target.buckled)
		occupant_message("[target] will not fit into the sleeper because they are buckled to [target.buckled].")
		return
	if(occupant)
		occupant_message("The sleeper is already occupied")
		return
	for(var/mob/living/carbon/slime/M in range(1,target))
		if(M.Victim == target)
			occupant_message("[target] will not fit into the sleeper because they have a slime latched onto their head.")
			return
	occupant_message("You start putting [target] into [src].")
	chassis.visible_message("[chassis] starts putting [target] into the [src].")
	if(do_after_cooldown(target))
		if(occupant)
			occupant_message(SPAN_WARNING("The sleeper is already occupied!"))
			return
		target.forceMove(src)
		occupant = target
		target.reset_view(src)
		set_ready_state(0)
		occupant_message(SPAN_NOTICE("[target] successfully loaded into [src]. Life support functions engaged."))
		chassis.visible_message("[chassis] loads [target] into [src].")
		log_message("[target] loaded. Life support functions engaged.")

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/proc/go_out()
	if(!occupant)
		return
	occupant.forceMove(get_turf(src))
	occupant_message("[occupant] ejected. Life support functions disabled.")
	log_message("[occupant] ejected. Life support functions disabled.")
	occupant.reset_view()
	occupant = null
	set_ready_state(1)

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/detach()
	if(occupant)
		occupant_message("Unable to detach [src] - equipment occupied.")
		return
	return ..()

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/get_equip_info()
	var/output = ..()
	if(output)
		var/temp = ""
		if(occupant)
			temp = "<br />\[Occupant: [occupant] (Health: [occupant.health]%)\]<br /><a href='?src=\ref[src];view_stats=1'>View stats</a>|<a href='?src=\ref[src];eject=1'>Eject</a>"
		return "[output] [temp]"
	return

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/Topic(href,href_list)
	. = ..()
	var/datum/topic_input/m_filter = new /datum/topic_input(href,href_list)
	if(m_filter.get("eject"))
		go_out()
	if(m_filter.get("view_stats"))
		chassis.occupant << browse(get_occupant_stats(), "window=msleeper")
		onclose(chassis.occupant, "msleeper")

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/proc/get_occupant_stats()
	if(!occupant)
		return
	return {"<html>
				<head>
				<title>[occupant] statistics</title>
				<script language='javascript' type='text/javascript'>
				[js_byjax]
				</script>
				<style>
				h3 {margin-bottom:2px;font-size:14px;}
				#lossinfo, #reagents, #injectwith {padding-left:15px;}
				</style>
				</head>
				<body>
				<h3>Health statistics</h3>
				<div id="lossinfo">
				[get_occupant_dam()]
				</div>
				<h3>Reagents in bloodstream</h3>
				<div id="reagents">
				[get_occupant_reagents()]
				</div>
				</body>
				</html>"}

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/proc/get_occupant_dam()
	var/t1
	switch(occupant.stat)
		if(0)
			t1 = "Conscious"
		if(1)
			t1 = "Unconscious"
		if(2)
			t1 = "*dead*"
		else
			t1 = "Unknown"
	return {"<span color="[occupant.health > 50 ? "notice" : "danger"]"><b>Health:</b> [occupant.health]% ([t1])</span><br />
		<span color="[occupant.bodytemperature > 50 ? "notice" : "danger"]"><b>Core Temperature:</b> [occupant.bodytemperature-T0C]&deg;C ([occupant.bodytemperature*1.8-459.67]&deg;F)</span><br />
		<span color="[occupant.getBruteLoss() < 60 ? "notice" : "danger"]"><b>Brute Damage:</b> [occupant.getBruteLoss()]%</span><br />
		<span color="[occupant.getOxyLoss() < 60 ? "notice" : "danger"]"><b>Respiratory Damage:</b> [occupant.getOxyLoss()]%</span><br />
		<span color="[occupant.getToxLoss() < 60 ? "notice" : "danger"]"><b>Toxin Content:</b> [occupant.getToxLoss()]%</span><br />
		<span color="[occupant.getFireLoss() < 60 ? "notice" : "danger"]"><b>Burn Severity:</b> [occupant.getFireLoss()]%</span><br />
	"}

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/proc/get_occupant_reagents()
	if(occupant.reagents)
		for(var/datum/reagent/R in occupant.reagents.reagent_list)
			if(R.volume > 0)
				. += "[R]: [round(R.volume,0.01)]<br />"
	return . || "None"

/obj/item/mecha_parts/mecha_equipment/tool/sleeper/update_equip_info()
	if(..())
		send_byjax(chassis.occupant, "msleeper.browser", "lossinfo", get_occupant_dam())
		send_byjax(chassis.occupant, "msleeper.browser", "reagents", get_occupant_reagents())
		return 1

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun
	name = "syringe gun"
	desc = "Exosuit-mounted chem synthesizer with syringe gun. Reagents inside are held in stasis, so no reactions will occur. (Can be attached to: Medical Exosuits)"
	icon = 'icons/obj/guns/launcher/syringegun.dmi'
	icon_state = "syringegun"
	var/list/syringes
	var/list/known_reagents
	var/list/processed_reagents
	var/max_syringes = 30
	var/max_volume = 300 //max reagent volume
	var/synth_speed = 1.25 //[num] reagent units per cycle
	energy_drain = 50
	var/mode = 0 //0 - fire syringe, 1 - analyze reagents.
	range = MECHA_MELEE|MECHA_RANGED
	equip_cooldown = 10
	origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 4, TECH_MAGNET = 4, TECH_DATA = 3)
	matter = list(MATERIAL_STEEL = 15, MATERIAL_GLASS = 20)
	required_type = /obj/mecha/medical

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/New()
	. = ..()
	reagent_flags |= NO_REACT
	syringes = new
	known_reagents = list("inaprovaline"="Inaprovaline","anti_toxin"="Dylovene","bicaridine"="Bicaridine","tramadol"="Tramadol","kelotane"="Kelotane")
	processed_reagents = new
	create_reagents(max_volume)

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/Destroy()
	QDEL_LIST(syringes)
	return ..()

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/critfail()
	..()
	reagent_flags &= ~NO_REACT

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/get_equip_info()
	var/output = ..()
	if(output)
		return "[output] \[<a href=\"?src=\ref[src];toggle_mode=1\">[mode? "Analyze" : "Launch"]</a>\]<br />\[Syringes: [syringes.len]/[max_syringes] | Reagents: [reagents.total_volume]/[reagents.maximum_volume]\]<br /><a href='?src=\ref[src];show_reagents=1'>Reagents list</a>"

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/action(atom/movable/target)
	if(!action_checks(target))
		return
	if(istype(target,/obj/item/reagent_containers/syringe))
		return load_syringe(target)
	if(istype(target,/obj/item/storage))//Loads syringes from boxes
		for(var/obj/item/reagent_containers/syringe/S in target.contents)
			load_syringe(S)
		return
	if(mode)
		return analyze_reagents(target)
	if(!syringes.len)
		occupant_message(SPAN_WARNING("No syringes loaded."))
		return
	if(reagents.total_volume<=0)
		occupant_message(SPAN_WARNING("No available reagents to load syringe with."))
		return
	start_cooldown()
	var/turf/trg = get_turf(target)
	var/obj/item/reagent_containers/syringe/S = syringes[1]
	S.forceMove(get_turf(chassis))
	reagents.trans_to_obj(S, min(S.volume, reagents.total_volume))
	syringes -= S
	S.icon = 'icons/obj/chemical.dmi'
	S.icon_state = "syringeproj"
	playsound(chassis, 'sound/items/syringeproj.ogg', 50, 1)
	log_message("Launched [S] from [src], targeting [target].")

	spawn(-1)
		src = null //if src is deleted, still process the syringe
		var/hit = FALSE
		for(var/i=0, i<6, i++)
			if(!S)
				break
			if(step_towards(S,trg))
				var/list/mobs = new
				for(var/mob/living/carbon/M in S.loc)
					mobs += M
				var/mob/living/carbon/M = safepick(mobs)
				if(M)
					S.icon_state = initial(S.icon_state)
					S.icon = initial(S.icon)
					S.reagents.trans_to_mob(M, S.reagents.total_volume, CHEM_BLOOD)
					M.take_organ_damage(2)
					S.visible_message("<span class=\"attack\"> [M] was hit by \the [S]!</span>")
					hit = TRUE
					break
				else if(S.loc == trg)
					S.icon_state = initial(S.icon_state)
					S.icon = initial(S.icon)
					S.update_icon()
					break
			else
				S.icon_state = initial(S.icon_state)
				S.icon = initial(S.icon)
				S.update_icon()
				break
			sleep(1)
		S.break_syringe(force = TRUE)
		if(!hit)
			S.visible_message("\The [S] breaks!")
		S.reagents.clear_reagents()

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/Topic(href,href_list)
	. = ..()
	var/datum/topic_input/m_filter = new(href,href_list)
	if(m_filter.get("toggle_mode"))
		mode = !mode
		update_equip_info()
		return

	if(m_filter.get("select_reagents"))
		processed_reagents.len = 0
		var/m = 0
		var/message
		for(var/i=1 to known_reagents.len)
			if(m>=synth_speed)
				break
			var/reagent = m_filter.get("reagent_[i]")
			if(reagent && (reagent in known_reagents))
				message = "[m ? ", " : null][known_reagents[reagent]]"
				processed_reagents += reagent
				m++
		if(processed_reagents.len)
			message += " added to production"
			occupant_message(message)
			occupant_message("Reagent processing started.")
			log_message("Reagent processing started.")
		return

	if(m_filter.get("show_reagents"))
		chassis.occupant << browse(get_reagents_page(),"window=msyringegun")
		return

	if(m_filter.get("purge_reagent"))
		var/reagent = m_filter.get("purge_reagent")
		if(reagent)
			reagents.del_reagent(reagent)
		return

	if(m_filter.get("purge_all"))
		reagents.clear_reagents()
		return

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/proc/get_reagents_page()
	var/output = {"<html>
						<head>
						<title>Reagent Synthesizer</title>
						<script language='javascript' type='text/javascript'>
						[js_byjax]
						</script>
						<style>
						h3 {margin-bottom:2px;font-size:14px;}
						#reagents, #reagents_form {}
						form {width: 90%; margin:10px auto; border:1px dotted #999; padding:6px;}
						#submit {margin-top:5px;}
						</style>
						</head>
						<body>
						<h3>Current reagents:</h3>
						<div id="reagents">
						[get_current_reagents()]
						</div>
						<h3>Reagents production:</h3>
						<div id="reagents_form">
						[get_reagents_form()]
						</div>
						</body>
						</html>
						"}
	return output

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/proc/get_reagents_form()
	var/r_list = get_reagents_list()
	var/inputs
	if(r_list)
		inputs += "<input type=\"hidden\" name=\"src\" value=\"\ref[src]\">"
		inputs += "<input type=\"hidden\" name=\"select_reagents\" value=\"1\">"
		inputs += "<input id=\"submit\" type=\"submit\" value=\"Apply settings\">"
	var/output = {"<form action="byond://" method="get">
						[r_list || "No known reagents"]
						[inputs]
						</form>
						[r_list? "<span style=\"font-size:80%;\">Only the first [synth_speed] selected reagent\s will be added to production</span>" : null]
						"}
	return output

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/proc/get_reagents_list()
	var/output
	for(var/i=1 to known_reagents.len)
		var/reagent_id = known_reagents[i]
		output += {"<input type="checkbox" value="[reagent_id]" name="reagent_[i]" [(reagent_id in processed_reagents)? "checked=\"1\"" : null]> [known_reagents[reagent_id]]<br />"}
	return output

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/proc/get_current_reagents()
	var/output
	for(var/datum/reagent/R in reagents.reagent_list)
		if(R.volume > 0)
			output += "[R]: [round(R.volume,0.001)] - <a href=\"?src=\ref[src];purge_reagent=[R.id]\">Purge Reagent</a><br />"
	if(output)
		output += "Total: [round(reagents.total_volume,0.001)]/[reagents.maximum_volume] - <a href=\"?src=\ref[src];purge_all=1\">Purge All</a>"
	return output || "None"

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/proc/load_syringe(obj/item/reagent_containers/syringe/S)
	if(syringes.len<max_syringes)
		if(get_dist(src,S) >= 2)
			occupant_message("The syringe is too far away.")
			return 0
		for(var/obj/structure/D in S.loc)//Basic level check for structures in the way (Like grilles and windows)
			if(!(D.CanPass(S,loc)))
				occupant_message("Unable to load syringe.")
				return 0
		for(var/obj/machinery/door/D in S.loc)//Checks for doors
			if(!(D.CanPass(S,loc)))
				occupant_message("Unable to load syringe.")
				return 0
		S.reagents.trans_to_obj(src, S.reagents.total_volume)
		S.forceMove(src)
		syringes += S
		occupant_message("Syringe loaded.")
		update_equip_info()
		return 1
	occupant_message("The [src] syringe chamber is full.")
	return 0

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/proc/analyze_reagents(atom/A)
	if(get_dist(src,A) >= 4)
		occupant_message("The object is too far away.")
		return 0
	if(!A.reagents || istype(A,/mob))
		occupant_message(SPAN_DANGER("No reagent info gained from [A]."))
		return 0
	occupant_message("Analyzing reagents...")
	for(var/datum/reagent/R in A.reagents.reagent_list)
		if(R.reagent_state == 2 && add_known_reagent(R.id,R.name))
			occupant_message("Reagent analyzed, identified as [R.name] and added to database.")
			send_byjax(chassis.occupant, "msyringegun.browser", "reagents_form", get_reagents_form())
	occupant_message("Analyzis complete.")
	return 1

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/proc/add_known_reagent(r_id, r_name)
	start_cooldown()
	if(!(r_id in known_reagents))
		known_reagents += r_id
		known_reagents[r_id] = r_name
		return 1
	return 0

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/Process()
	if(!chassis)
		return
	if(!processed_reagents.len || reagents.total_volume >= reagents.maximum_volume || !chassis.has_charge(energy_drain))
		return
	var/amount = synth_speed / processed_reagents.len
	for(var/reagent in processed_reagents)
		reagents.add_reagent(reagent, amount)
		chassis.use_power(energy_drain)
	return 1


/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/update_equip_info()
	if(..())
		send_byjax(chassis.occupant,"msyringegun.browser","reagents",get_current_reagents())
		send_byjax(chassis.occupant,"msyringegun.browser","reagents_form",get_reagents_form())
		return 1

/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun/on_reagent_change()
	..()
	update_equip_info()
