ADMIN_VERB_ADD(/client/proc/Debug2, R_DEBUG, FALSE)
/client/proc/Debug2()
	set category = "Debug"
	set name = "Debug-Game"
	if(!check_rights(R_DEBUG))	return

	if(Debug2)
		Debug2 = 0
		message_admins("[key_name(src)] toggled debugging off.")
		log_admin("[key_name(src)] toggled debugging off.")
	else
		Debug2 = 1
		message_admins("[key_name(src)] toggled debugging on.")
		log_admin("[key_name(src)] toggled debugging on.")



// callproc moved to code/modules/admin/callproc


/client/proc/Cell()
	set category = "Debug"
	set name = "Cell"
	if(!mob)
		return
	var/turf/T = mob.loc

	if (!istype(T, /turf))
		return

	var/datum/gas_mixture/env = T.return_air()

	var/t = "\blue Coordinates: [T.x],[T.y],[T.z]\n"
	t += "\red Temperature: [env.temperature]\n"
	t += "\red Pressure: [env.return_pressure()]kPa\n"
	for(var/g in env.gas)
		t += "\blue [g]: [env.gas[g]] / [env.gas[g] * R_IDEAL_GAS_EQUATION * env.temperature / env.volume]kPa\n"

	usr.show_message(t, 1)


/client/proc/cmd_admin_robotize(var/mob/living/M)
	set category = "Admin.Events"
	set name = "Make Robot"

	if(ishuman(M))
		log_admin("[key_name(src)] has robotized [M.key].")
		M.Robotize()

	else
		alert("Invalid mob")

/client/proc/cmd_admin_animalize(var/mob/M in SSmobs.mob_list)
	set category = "Admin.Events"
	set name = "Make Simple Animal"

	if(!M)
		alert("That mob doesn't seem to exist, close the panel and try again.")
		return

	if(isnewplayer(M))
		alert("The mob must not be a new_player.")
		return

	log_admin("[key_name(src)] has animalized [M.key].")
	spawn(10)
		M.Animalize()


/client/proc/makepAI(var/turf/T)
	set category = "Admin.Events"
	set name = "Make pAI"
	set desc = "Specify a location to spawn a pAI device, then specify a key to play that pAI"

	var/list/available = list()
	for(var/mob/C in SSmobs.mob_list)
		if(C.key)
			available.Add(C)
	var/mob/choice = input("Choose a player to play the pAI", "Spawn pAI") in available
	if(!choice)
		return 0
	if(!isghost(choice))
		var/confirm = input("[choice.key] isn't ghosting right now. Are you sure you want to yank them out of them out of their body and place them in this pAI?", "Spawn pAI Confirmation", "No") in list("Yes", "No")
		if(confirm != "Yes")
			return 0
	var/obj/item/device/paicard/card = new(T)
	var/mob/living/silicon/pai/pai = new(card)
	pai.name = sanitizeSafe(input(choice, "Enter your pAI name:", "pAI Name", "Personal AI") as text)
	pai.real_name = pai.name
	pai.key = choice.key
	card.setPersonality(pai)
	for(var/datum/paiCandidate/candidate in SSpai.pai_candidates)
		if(candidate.key == choice.key)
			SSpai.pai_candidates.Remove(candidate)


/client/proc/cmd_admin_slimeize(var/mob/living/M)
	set category = "Admin.Events"
	set name = "Make slime"

	if(ishuman(M))
		log_admin("[key_name(src)] has slimeized [M.key].")
		spawn(10)
			M.slimeize()

		log_admin("[key_name(usr)] made [key_name(M)] into a slime.")
		message_admins("\blue [key_name_admin(usr)] made [key_name(M)] into a slime.", 1)
	else
		alert("Invalid mob")

/*
/client/proc/cmd_admin_monkeyize(var/mob/M in SSmobs.mob_list)
	set category = "Admin.Events"
	set name = "Make Monkey"

	if(!ticker)
		alert("Wait until the game starts")
		return
	if(ishuman(M))
		var/mob/living/carbon/human/target = M
		log_admin("[key_name(src)] is attempting to monkeyize [M.key].")
		spawn(10)
			target.monkeyize()
	else
		alert("Invalid mob")

/client/proc/cmd_admin_changelinginize(var/mob/M in SSmobs.mob_list)
	set category = "Admin.Events"
	set name = "Make Changeling"

	if(!ticker)
		alert("Wait until the game starts")
		return
	if(ishuman(M))
		log_admin("[key_name(src)] has made [M.key] a changeling.")
		spawn(10)
			M.absorbed_dna[M.real_name] = M.dna.Clone()
			M.make_changeling()
			if(M.mind)
				M.mind.special_role = "Changeling"
	else
		alert("Invalid mob")
*/
/*
/client/proc/cmd_admin_abominize(var/mob/M in SSmobs.mob_list)
	set category = null
	set name = "Make Abomination"

	to_chat(usr, "Ruby Mode disabled. Command aborted.")
	return
	if(!ticker)
		alert("Wait until the game starts.")
		return
	if(ishuman(M))
		log_admin("[key_name(src)] has made [M.key] an abomination.")

	//	spawn(10)
	//		M.make_abomination()

*/
/*
/client/proc/make_cultist(var/mob/M in SSmobs.mob_list) // -- TLE, modified by Urist
	set category = "Admin.Events"
	set name = "Make Cultist"
	set desc = "Makes target a cultist"
	if(!cultwords["travel"])
		runerandom()
	if(M)
		if(M.mind in ticker.mode.cult)
			return
		else
			if(alert("Spawn that person a tome?",,"Yes","No")=="Yes")
				to_chat(M, "\red You catch a glimpse of the Realm of Nar-Sie, The Geometer of Blood. You now see how flimsy the world is, you see that it should be open to the knowledge of Nar-Sie. A tome, a message from your new master, appears on the ground.")
				new /obj/item/book/tome(M.loc)
			else
				to_chat(M, "\red You catch a glimpse of the Realm of Nar-Sie, The Geometer of Blood. You now see how flimsy the world is, you see that it should be open to the knowledge of Nar-Sie.")
			var/glimpse=pick("1","2","3","4","5","6","7","8")
			switch(glimpse)
				if("1")
					to_chat(M, "\red You remembered one thing from the glimpse... [cultwords["travel"]] is travel...")
				if("2")
					to_chat(M, "\red You remembered one thing from the glimpse... [cultwords["blood"]] is blood...")
				if("3")
					to_chat(M, "\red You remembered one thing from the glimpse... [cultwords["join"]] is join...")
				if("4")
					to_chat(M, "\red You remembered one thing from the glimpse... [cultwords["hell"]] is Hell...")
				if("5")
					to_chat(M, "\red You remembered one thing from the glimpse... [cultwords["destroy"]] is destroy...")
				if("6")
					to_chat(M, "\red You remembered one thing from the glimpse... [cultwords["technology"]] is technology...")
				if("7")
					to_chat(M, "\red You remembered one thing from the glimpse... [cultwords["self"]] is self...")
				if("8")
					to_chat(M, "\red You remembered one thing from the glimpse... [cultwords["see"]] is see...")

			if(M.mind)
				M.mind.special_role = "Cultist"
				ticker.mode.cult += M.mind
			to_chat(src, "Made [M] a cultist.")
*/


//TODO: merge the vievars version into this or something maybe mayhaps
ADMIN_VERB_ADD(/client/proc/cmd_debug_del_all, R_ADMIN|R_DEBUG, FALSE)
/client/proc/cmd_debug_del_all()
	set category = "Debug"
	set name = "Del-All"

	// to prevent REALLY stupid deletions
	var/blocked = list(/obj, /mob, /mob/living, /mob/living/carbon, /mob/living/carbon/human, /mob/observer, /mob/living/silicon, /mob/living/silicon/robot, /mob/living/silicon/ai)
	var/hsbitem = input(usr, "Choose an object to delete.", "Delete:") as null|anything in typesof(/obj) + typesof(/mob) - blocked
	if(hsbitem)
		for(var/atom/O in world)
			if(istype(O, hsbitem))
				qdel(O)
		log_admin("[key_name(src)] has deleted all instances of [hsbitem].")
		message_admins("[key_name_admin(src)] has deleted all instances of [hsbitem].", 0)

ADMIN_VERB_ADD(/client/proc/cmd_display_del_log, R_ADMIN|R_DEBUG, FALSE)
/client/proc/cmd_display_del_log()
	set category = "Debug"
	set name = "Display del() Log"
	set desc = "Display del's log of everything that's passed through it."

	var/list/dellog = list("<html><B>List of things that have gone through qdel this round</B><BR><BR><ol>")
	sortTim(SSgarbage.items, cmp=/proc/cmp_qdel_item_time, associative = TRUE)
	for(var/path in SSgarbage.items)
		var/datum/qdel_item/I = SSgarbage.items[path]
		dellog += "<li><u>[path]</u><ul>"
		if (I.failures)
			dellog += "<li>Failures: [I.failures]</li>"
		dellog += "<li>qdel() Count: [I.qdels]</li>"
		dellog += "<li>Destroy() Cost: [I.destroy_time]ms</li>"
		if (I.hard_deletes)
			dellog += "<li>Total Hard Deletes [I.hard_deletes]</li>"
			dellog += "<li>Time Spent Hard Deleting: [I.hard_delete_time]ms</li>"
		if (I.slept_destroy)
			dellog += "<li>Sleeps: [I.slept_destroy]</li>"
		if (I.no_respect_force)
			dellog += "<li>Ignored force: [I.no_respect_force]</li>"
		if (I.no_hint)
			dellog += "<li>No hint: [I.no_hint]</li>"
		dellog += "</ul></li>"

	dellog += "</ol></html>"

	usr << browse(dellog.Join(), "window=dellog")

ADMIN_VERB_ADD(/client/proc/cmd_debug_make_powernets, R_DEBUG, FALSE)
/client/proc/cmd_debug_make_powernets()
	set category = "Debug"
	set name = "Make Powernets"
	SSmachines.makepowernets()
	log_admin("[key_name(src)] has remade the powernet. makepowernets() called.")
	message_admins("[key_name_admin(src)] has remade the powernets. makepowernets() called.", 0)


ADMIN_VERB_ADD(/client/proc/cmd_debug_tog_aliens, R_DEBUG, FALSE)
/client/proc/cmd_debug_tog_aliens()
	set category = "Server"
	set name = "Toggle Aliens"

	config.aliens_allowed = !config.aliens_allowed
	log_admin("[key_name(src)] has turned aliens [config.aliens_allowed ? "on" : "off"].")
	message_admins("[key_name_admin(src)] has turned aliens [config.aliens_allowed ? "on" : "off"].", 0)


// Render stats list for round-end statistics.
/proc/render_stats(list/stats, user, sort = GLOBAL_PROC_REF(cmp_generic_stat_item_time))
	sortTim(stats, sort, TRUE)

	var/list/lines = list()
	for (var/entry in stats)
		var/list/data = stats[entry]
		lines += "[entry] => [num2text(data[STAT_ENTRY_TIME], 10)]ms ([data[STAT_ENTRY_COUNT]]) (avg:[num2text(data[STAT_ENTRY_TIME]/(data[STAT_ENTRY_COUNT] || 1), 99)])"

	if (user)
		user << browse("<html><ol><li>[lines.Join("</li><li>")]</li></ol></html>", "window=[url_encode("stats:\ref[stats]")]")
	else
		. = lines.Join("\n")

/client/proc/cmd_admin_grantfullaccess(var/mob/M in SSmobs.mob_list)
	set category = "Admin"
	set name = "Grant Full Access"

	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/card/id/id = H.GetIdCard()
		if(id)
			id.icon_state = "gold"
			id.access = get_all_accesses()
		else
			var/obj/item/card/id/new_id = new/obj/item/card/id(M);
			new_id.icon_state = "gold"
			new_id.access = get_all_accesses()
			new_id.registered_name = H.real_name
			new_id.assignment = "Captain"
			new_id.name = "[new_id.registered_name]'s ID Card ([new_id.assignment])"
			H.equip_to_slot_or_del(new_id, slot_wear_id)
			H.update_inv_wear_id()
	else
		alert("Invalid mob")

	log_admin("[key_name(src)] has granted [M.key] full access.")
	message_admins("\blue [key_name_admin(usr)] has granted [M.key] full access.", 1)

/client/proc/cmd_assume_direct_control(var/mob/M in SSmobs.mob_list)
	set category = "Admin"
	set name = "Assume direct control"
	set desc = "Direct intervention"

	if(!check_rights(R_DEBUG|R_ADMIN))	return
	if(M.ckey)
		if(alert("This mob is being controlled by [M.ckey]. Are you sure you wish to assume control of it? [M.ckey] will be made a ghost.",,"Yes","No") != "Yes")
			return
		else
			var/mob/observer/ghost/ghost = new/mob/observer/ghost(M,1)
			ghost.ckey = M.ckey
	message_admins("\blue [key_name_admin(usr)] assumed direct control of [M].", 1)
	log_admin("[key_name(usr)] assumed direct control of [M].")
	var/mob/adminmob = src.mob
	M.ckey = src.ckey
	if(isghost(adminmob))
		qdel(adminmob)







/client/proc/cmd_admin_areatest()
	set category = "Debug.Mapping"
	set name = "Test areas"

	var/list/areas_all = list()
	var/list/areas_with_APC = list()
	var/list/areas_with_air_alarm = list()
	var/list/areas_with_RC = list()
	var/list/areas_with_light = list()
	var/list/areas_with_LS = list()
	var/list/areas_with_intercom = list()
	var/list/areas_with_camera = list()

	for(var/area/A in world)
		if(!(A.type in areas_all))
			areas_all.Add(A.type)

	for(var/obj/machinery/power/apc/APC in world)
		var/area/A = get_area(APC)
		if(!(A.type in areas_with_APC))
			areas_with_APC.Add(A.type)

	for(var/obj/machinery/alarm/alarm in world)
		var/area/A = get_area(alarm)
		if(!(A.type in areas_with_air_alarm))
			areas_with_air_alarm.Add(A.type)

	for(var/obj/machinery/requests_console/RC in world)
		var/area/A = get_area(RC)
		if(!(A.type in areas_with_RC))
			areas_with_RC.Add(A.type)

	for(var/obj/machinery/light/L in world)
		var/area/A = get_area(L)
		if(!(A.type in areas_with_light))
			areas_with_light.Add(A.type)

	for(var/obj/machinery/light_switch/LS in world)
		var/area/A = get_area(LS)
		if(!(A.type in areas_with_LS))
			areas_with_LS.Add(A.type)

	for(var/obj/item/device/radio/intercom/I in world)
		var/area/A = get_area(I)
		if(!(A.type in areas_with_intercom))
			areas_with_intercom.Add(A.type)

	for(var/obj/machinery/camera/C in world)
		var/area/A = get_area(C)
		if(!(A.type in areas_with_camera))
			areas_with_camera.Add(A.type)

	var/list/areas_without_APC = areas_all - areas_with_APC
	var/list/areas_without_air_alarm = areas_all - areas_with_air_alarm
	var/list/areas_without_RC = areas_all - areas_with_RC
	var/list/areas_without_light = areas_all - areas_with_light
	var/list/areas_without_LS = areas_all - areas_with_LS
	var/list/areas_without_intercom = areas_all - areas_with_intercom
	var/list/areas_without_camera = areas_all - areas_with_camera

	to_chat(world, "<b>AREAS WITHOUT AN APC:</b>")
	for(var/areatype in areas_without_APC)
		to_chat(world, "* [areatype]")

	to_chat(world, "<b>AREAS WITHOUT AN AIR ALARM:</b>")
	for(var/areatype in areas_without_air_alarm)
		to_chat(world, "* [areatype]")

	to_chat(world, "<b>AREAS WITHOUT A REQUEST CONSOLE:</b>")
	for(var/areatype in areas_without_RC)
		to_chat(world, "* [areatype]")

	to_chat(world, "<b>AREAS WITHOUT ANY LIGHTS:</b>")
	for(var/areatype in areas_without_light)
		to_chat(world, "* [areatype]")

	to_chat(world, "<b>AREAS WITHOUT A LIGHT SWITCH:</b>")
	for(var/areatype in areas_without_LS)
		to_chat(world, "* [areatype]")

	to_chat(world, "<b>AREAS WITHOUT ANY INTERCOMS:</b>")
	for(var/areatype in areas_without_intercom)
		to_chat(world, "* [areatype]")

	to_chat(world, "<b>AREAS WITHOUT ANY CAMERAS:</b>")
	for(var/areatype in areas_without_camera)
		to_chat(world, "* [areatype]")


ADMIN_VERB_ADD(/client/proc/cmd_admin_dress, R_FUN, FALSE)
/client/proc/cmd_admin_dress()
	set category = "Admin.Events"
	set name = "Select equipment"

	var/mob/living/carbon/human/M = input("Select mob.", "Select equipment.") as null|anything in GLOB.human_mob_list
	if(!M) return

	var/list/dresspacks = outfits()
	var/decl/hierarchy/outfit/dresscode = input("Select dress for [M]", "Robust quick dress shop") as null|anything in dresspacks
	if (isnull(dresscode))
		return

	dresscode.equip(M)


//Preserving the old one for now, so the dress lists in it can be converted into real outfits
ADMIN_VERB_ADD(/client/proc/cmd_admin_dress_old, R_FUN, FALSE)
/client/proc/cmd_admin_dress_old()
	set category = "Admin.Events"
	set name = "Select equipment OLD"

	var/mob/living/carbon/human/M = input("Select mob.", "Select equipment.") as null|anything in GLOB.human_mob_list
	if(!M) return

	//log_admin("[key_name(src)] has alienized [M.key].")
	var/list/dresspacks = list(
		"strip",
		"job",
		"standard space gear",
		"tournament standard grey",
		"tournament standard green",
		"tournament gangster",
		"tournament chef",
		"tournament janitor",
		"pirate",
		"space pirate",
		"soviet admiral",
		"tunnel clown",
		"masked killer",
		"special ops officer",
		"the don"
		)
	var/dresscode = input("Select dress for [M]", "Robust quick dress shop") as null|anything in dresspacks
	if (isnull(dresscode))
		return

	for (var/obj/item/I in M.get_equipped_items(TRUE))
		if (M.unEquip(I))
			qdel(I)
	switch(dresscode)
		if ("strip")
			//do nothing
		if ("job")
			var/selected_job = input("Select job", "Robust quick dress shop") as null|anything in GLOB.joblist
			if (isnull(selected_job))
				return

			var/datum/job/job = SSjob.GetJob(selected_job)
			if(!job)
				return

			job.equip(M)
			job.apply_fingerprints(M)

		if ("standard space gear")
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/color/black(M), slot_shoes)

			M.equip_to_slot_or_del(new /obj/item/clothing/under/color(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/suit/space(M), slot_wear_suit)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/space(M), slot_head)
			var /obj/item/tank/jetpack/J = new /obj/item/tank/jetpack/oxygen(M)
			M.equip_to_slot_or_del(J, slot_back)
			J.toggle()
			M.equip_to_slot_or_del(new /obj/item/clothing/mask/breath(M), slot_wear_mask)
			J.Topic(null, list("stat" = 1))
		if ("tournament standard red","tournament standard green") //we think stunning weapon is too overpowered to use it on tournaments. --rastaf0
			if (dresscode=="tournament standard red")
				M.equip_to_slot_or_del(new /obj/item/clothing/under/color/red(M), slot_w_uniform)
			else
				M.equip_to_slot_or_del(new /obj/item/clothing/under/color/green(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/color/black(M), slot_shoes)

			M.equip_to_slot_or_del(new /obj/item/clothing/suit/armor/vest(M), slot_wear_suit)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/thunderdome(M), slot_head)

			M.equip_to_slot_or_del(new /obj/item/gun/energy/plasma/destroyer(M), slot_r_hand)
			M.equip_to_slot_or_del(new /obj/item/tool/knife(M), slot_l_hand)
			M.equip_to_slot_or_del(new /obj/item/grenade/smokebomb(M), slot_r_store)


		if ("tournament gangster") //gangster are supposed to fight each other. --rastaf0
			M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/inspector(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/color/black(M), slot_shoes)

			M.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/rank/insp_trench(M), slot_wear_suit)

			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/powered/thermal/plain/monocle(M), slot_glasses)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/rank/inspector(M), slot_head)

			M.equip_to_slot_or_del(new /obj/item/gun/projectile/revolver(M), slot_r_hand)
			M.equip_to_slot_or_del(new /obj/item/ammo_magazine/speed_loader_magnum_40(M), slot_l_store)

		if ("tournament chef") //Steven Seagal FTW
			M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/chef(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/suit/rank/chef(M), slot_wear_suit)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/color/black(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/rank/chef(M), slot_head)

			M.equip_to_slot_or_del(new /obj/item/material/kitchen/rollingpin(M), slot_r_hand)
			M.equip_to_slot_or_del(new /obj/item/tool/knife(M), slot_l_hand)
			M.equip_to_slot_or_del(new /obj/item/tool/knife(M), slot_r_store)
			M.equip_to_slot_or_del(new /obj/item/tool/knife(M), slot_s_store)

		if ("tournament janitor")
			M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/janitor(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/color/black(M), slot_shoes)
			var/obj/item/storage/backpack/backpack = new(M)
			for(var/obj/item/I in backpack)
				qdel(I)
			M.equip_to_slot_or_del(backpack, slot_back)

			M.equip_to_slot_or_del(new /obj/item/mop(M), slot_r_hand)
			var/obj/item/reagent_containers/glass/bucket/bucket = new(M)
			bucket.reagents.add_reagent("water", 70)
			M.equip_to_slot_or_del(bucket, slot_l_hand)

			M.equip_to_slot_or_del(new /obj/item/grenade/chem_grenade/cleaner(M), slot_r_store)
			M.equip_to_slot_or_del(new /obj/item/grenade/chem_grenade/cleaner(M), slot_l_store)
			M.equip_to_slot_or_del(new /obj/item/stack/tile/floor(M), slot_in_backpack)
			M.equip_to_slot_or_del(new /obj/item/stack/tile/floor(M), slot_in_backpack)
			M.equip_to_slot_or_del(new /obj/item/stack/tile/floor(M), slot_in_backpack)
			M.equip_to_slot_or_del(new /obj/item/stack/tile/floor(M), slot_in_backpack)
			M.equip_to_slot_or_del(new /obj/item/stack/tile/floor(M), slot_in_backpack)
			M.equip_to_slot_or_del(new /obj/item/stack/tile/floor(M), slot_in_backpack)
			M.equip_to_slot_or_del(new /obj/item/stack/tile/floor(M), slot_in_backpack)

		if ("pirate")
			M.equip_to_slot_or_del(new /obj/item/clothing/under/costume/history/pirate(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/color/brown(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/bandana(M), slot_head)
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/eyepatch(M), slot_glasses)
			M.equip_to_slot_or_del(new /obj/item/melee/energy/sword/pirate(M), slot_r_hand)

		if ("space pirate")
			M.equip_to_slot_or_del(new /obj/item/clothing/under/costume/history/pirate(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/color/brown(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/eyepatch(M), slot_glasses)
			M.equip_to_slot_or_del(new /obj/item/melee/energy/sword/pirate(M), slot_r_hand)

		if ("soviet soldier")
			M.equip_to_slot_or_del(new /obj/item/clothing/under/costume/history/soviet(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/color/black(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/ushanka(M), slot_head)

		if("tunnel clown")//Tunnel clowns rule!
			M.equip_to_slot_or_del(new /obj/item/clothing/under/costume/job/clown(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/costume/job/clown(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/clothing/mask/costume/job/clown(M), slot_wear_mask)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/rank/chaplain(M), slot_head)
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset(M), slot_l_ear)
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/powered/thermal/plain/monocle(M), slot_glasses)
			M.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/chaplain(M), slot_wear_suit)
			M.equip_to_slot_or_del(new /obj/item/bikehorn(M), slot_r_store)

			var/obj/item/card/id/W = new(M)
			W.name = "[M.real_name]'s ID Card"
			W.access = get_all_station_access()
			W.assignment = "Tunnel Clown!"
			W.registered_name = M.real_name
			M.equip_to_slot_or_del(W, slot_wear_id)

			var/obj/item/tool/fireaxe/fire_axe = new(M)
			M.equip_to_slot_or_del(fire_axe, slot_r_hand)

		if("masked killer")
			M.equip_to_slot_or_del(new /obj/item/clothing/under/overalls(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/color(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/latex(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/clothing/mask/surgical(M), slot_wear_mask)
			M.equip_to_slot_or_del(new /obj/item/clothing/head/welding(M), slot_head)
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset(M), slot_l_ear)
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/powered/thermal/plain/monocle(M), slot_glasses)
			M.equip_to_slot_or_del(new /obj/item/clothing/suit/rank/botanist(M), slot_wear_suit)
			M.equip_to_slot_or_del(new /obj/item/tool/knife(M), slot_l_store)
			M.equip_to_slot_or_del(new /obj/item/tool/scalpel(M), slot_r_store)

			var/obj/item/tool/fireaxe/fire_axe = new(M)
			M.equip_to_slot_or_del(fire_axe, slot_r_hand)

			for(var/obj/item/carried_item in M.contents)
				if(!istype(carried_item, /obj/item/implant))//If it's not an implant.
					carried_item.add_blood(M)//Oh yes, there will be blood...

		if("assassin")
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/color/black(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset(M), slot_l_ear)
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(M), slot_glasses)
			M.equip_to_slot_or_del(new /obj/item/clothing/accessory/waistcoat(M), slot_accessory_buffer)
			M.equip_to_slot_or_del(new /obj/item/melee/energy/sword(M), slot_l_store)

			var/obj/item/storage/secure/briefcase/sec_briefcase = new(M)
			for(var/obj/item/briefcase_item in sec_briefcase)
				qdel(briefcase_item)
			for(var/i=3, i>0, i--)
				sec_briefcase.contents += new /obj/item/spacecash/bundle/c1000
			sec_briefcase.contents += new /obj/item/gun/energy/crossbow
			sec_briefcase.contents += new /obj/item/gun/projectile/revolver/hornet
			sec_briefcase.contents += new /obj/item/ammo_magazine/speed_loader_magnum_40
			sec_briefcase.contents += new /obj/item/plastique
			M.equip_to_slot_or_del(sec_briefcase, slot_l_hand)

			var/obj/item/modular_computer/pda/pda = new(M)

			M.equip_to_slot_or_del(pda, slot_belt)

			var/obj/item/card/id/syndicate/W = new(M)
			W.name = "[M.real_name]'s ID Card"
			W.access = get_all_station_access()
			W.assignment = "Reaper"
			W.registered_name = M.real_name
			M.equip_to_slot_or_del(W, slot_wear_id)

		/*if("death commando")//Was looking to add this for a while.
			deathsquad.equip(M)

		if("syndicate commando")
			commandos.equip(M)*/

		if("nanotrasen representative")
			//M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/reinforced(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/color(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/hop(M), slot_l_ear)

			var/obj/item/modular_computer/pda/pda = new(M)

			M.equip_to_slot_or_del(pda, slot_r_store)
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(M), slot_l_store)
			M.equip_to_slot_or_del(new /obj/item/clipboard(M), slot_belt)

			var/obj/item/card/id/W = new(M)
			W.name = "[M.real_name]'s ID Card"
			W.icon_state = "centcom"
			W.item_state = "id_inv"
			W.access = get_all_station_access()
			W.access += list("VIP Guest","Custodian","Thunderdome Overseer","Intel Officer","Medical Officer","Death Commando","Research Officer")
			W.assignment = "NanoTrasen Navy Representative"
			W.registered_name = M.real_name
			M.equip_to_slot_or_del(W, slot_wear_id)

		if("nanotrasen officer")
			//M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom_officer(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/reinforced(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/color(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/captain(M), slot_l_ear)

			var/obj/item/modular_computer/pda/pda = new(M)

			M.equip_to_slot_or_del(pda, slot_r_store)
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(M), slot_l_store)
			M.equip_to_slot_or_del(new /obj/item/gun/energy(M), slot_belt)

			var/obj/item/card/id/centcom/W = new(M)
			W.name = "[M.real_name]'s ID Card"
			W.access = get_all_station_access()
			W.access += get_all_centcom_access()
			W.assignment = "NanoTrasen Navy Officer"
			W.registered_name = M.real_name
			M.equip_to_slot_or_del(W, slot_wear_id)


		if("nanotrasen captain")
			//M.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom_captain(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/reinforced(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/color(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/captain(M), slot_l_ear)

			var/obj/item/modular_computer/pda/pda = new(M)

			M.equip_to_slot_or_del(pda, slot_r_store)
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/sunglasses(M), slot_l_store)
			M.equip_to_slot_or_del(new /obj/item/gun/energy(M), slot_belt)

			var/obj/item/card/id/centcom/W = new(M)
			W.name = "[M.real_name]'s ID Card"
			W.access = get_all_station_access()
			W.access += get_all_centcom_access()
			W.assignment = "NanoTrasen Navy Captain"
			W.registered_name = M.real_name
			M.equip_to_slot_or_del(W, slot_wear_id)

		if("special ops officer")
			M.equip_to_slot_or_del(new /obj/item/clothing/under/syndicate(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/rank/insp_trench(M), slot_wear_suit)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/combat(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/captain(M), slot_l_ear)
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/powered/thermal/plain/eyepatch(M), slot_glasses)
			M.equip_to_slot_or_del(new /obj/item/clothing/mask/smokable/cigarette/cigar/havana(M), slot_wear_mask)
			M.equip_to_slot_or_del(new /obj/item/flame/lighter/zippo(M), slot_r_store)
			M.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(M), slot_back)

			var/obj/item/card/id/W = new(M)
			W.name = "[M.real_name]'s ID Card"
			W.icon_state = "centcom"
			W.access = get_all_station_access()
			W.access += get_all_centcom_access()
			W.assignment = "Special Operations Officer"
			W.registered_name = M.real_name
			M.equip_to_slot_or_del(W, slot_wear_id)

		if("soviet admiral")

			M.equip_to_slot_or_del(new /obj/item/clothing/head/costume/history/piratecap(M), slot_head)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(M), slot_shoes)

			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/combat(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/captain(M), slot_l_ear)
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/powered/thermal/plain/eyepatch(M), slot_glasses)
			M.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(M), slot_back)
			M.equip_to_slot_or_del(new /obj/item/gun/projectile/revolver/hornet(M), slot_belt)
			M.equip_to_slot_or_del(new /obj/item/clothing/under/costume/history/soviet(M), slot_w_uniform)
			var/obj/item/card/id/W = new(M)
			W.name = "[M.real_name]'s ID Card"
			W.icon_state = "centcom"
			W.access = get_all_station_access()
			W.access += get_all_centcom_access()
			W.assignment = "Admiral"
			W.registered_name = M.real_name
			M.equip_to_slot_or_del(W, slot_wear_id)


		if("the don")
			M.equip_to_slot_or_del(new /obj/item/clothing/glasses/powered/thermal/plain/eyepatch(M), slot_glasses)
			M.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(M), slot_shoes)
			M.equip_to_slot_or_del(new /obj/item/device/radio/headset/heads/captain(M), slot_l_ear)
			M.equip_to_slot_or_del(new /obj/item/clothing/gloves/thick/combat(M), slot_gloves)
			M.equip_to_slot_or_del(new /obj/item/clothing/under/suit_jacket/smoky(M), slot_w_uniform)
			M.equip_to_slot_or_del(new /obj/item/storage/backpack/satchel(M), slot_back)
			M.equip_to_slot_or_del(new /obj/item/storage/belt/utility/full/bst(M), slot_belt)

			var/obj/item/storage/secure/briefcase/sec_briefcase = new(M)
			for(var/obj/item/briefcase_item in sec_briefcase)
				qdel(briefcase_item)
			for(var/i=3, i>0, i--)
				sec_briefcase.contents += new /obj/item/spacecash/bundle/c1000
			sec_briefcase.contents += new /obj/item/gun/energy/crossbow
			sec_briefcase.contents += new /obj/item/gun/projectile/revolver/hornet
			sec_briefcase.contents += new /obj/item/ammo_magazine/speed_loader_kurtz_50
			sec_briefcase.contents += new /obj/item/ammo_magazine/speed_loader_kurtz_50
			M.equip_to_slot_or_del(sec_briefcase, slot_l_hand)

			var/obj/item/card/id/W = new(M)
			W.name = "[M.real_name]'s ID Card"
			W.icon_state = "centcom"
			W.access = get_all_station_access()
			W.access += get_all_centcom_access()
			W.assignment = "The Don"
			W.registered_name = M.real_name
			M.equip_to_slot_or_del(W, slot_wear_id)

	M.regenerate_icons()

	log_admin("[key_name(usr)] changed the equipment of [key_name(M)] to [dresscode].")
	message_admins("\blue [key_name_admin(usr)] changed the equipment of [key_name_admin(M)] to [dresscode]..", 1)


ADMIN_VERB_ADD(/client/proc/check_positions, R_DEBUG, FALSE)
/client/proc/check_positions()
	set category = "Debug"
	set name = "Check positions"

	var/mob/user = mob
	if(user != usr || !holder || !holder.marked_datum())
		return

	var/turf/user_pos = get_turf(user)
	var/turf/other_pos = get_turf(holder.marked_datum())

	to_chat(user, "Check relations of positions:")
	to_chat(user, "User position ([user_pos.x],[user_pos.y],[user_pos.z])")
	to_chat(user, "Other position ([other_pos.x],[other_pos.y],[other_pos.z])")
	to_chat(user, "get_dist = [get_dist(user_pos, other_pos)]")
	to_chat(user, "get_dir  = [get_dir(user_pos, other_pos)]")
	to_chat(user, "Adjacent = [user_pos.Adjacent(other_pos)]")
	to_chat(user, "Check ended.")


/client/proc/startSinglo()

	set category = "Debug"
	set name = "Start Singularity"
	set desc = "Sets up the singularity and all machines to get power flowing through the station"

	if(alert("Are you sure? This will start up the engine. Should only be used during debug!",,"Yes","No") != "Yes")
		return

	for(var/obj/machinery/power/emitter/E in world)
		if(E.anchored)
			E.active = 1

	for(var/obj/machinery/field_generator/F in world)
		if(F.anchored)
			F.Varedit_start = 1
	spawn(30)
		for(var/obj/machinery/the_singularitygen/G in world)
			if(G.anchored)
				var/obj/singularity/S = new /obj/singularity(get_turf(G), 50)
				spawn(0)
					qdel(G)
				S.energy = 1750
				S.current_size = 7
				S.icon = 'icons/effects/224x224.dmi'
				S.icon_state = "singularity_s7"
				S.pixel_x = -96
				S.pixel_y = -96
				S.grav_pull = 0
				//S.consume_range = 3
				S.dissipate = 0
				//S.dissipate_delay = 10
				//S.dissipate_track = 0
				//S.dissipate_strength = 10

	for(var/obj/machinery/power/rad_collector/Rad in world)
		if(Rad.anchored)
			if(!Rad.P)
				var/obj/item/tank/plasma/Plasma = new/obj/item/tank/plasma(Rad)
				Plasma.air_contents.gas["plasma"] = 70
				Rad.drainratio = 0
				Rad.P = Plasma
				Plasma.loc = Rad

			if(!Rad.active)
				Rad.toggle_power()

	for(var/obj/machinery/power/smes/SMES in world)
		if(SMES.anchored)
			SMES.input_attempt = 1


ADMIN_VERB_ADD(/client/proc/cmd_debug_mob_lists, R_DEBUG, FALSE)
/client/proc/cmd_debug_mob_lists()
	set category = "Debug"
	set name = "Debug Mob Lists"
	set desc = "For when you just gotta know"

	switch(input("Which list?") in list("Players","Admins","Mobs","Living Mobs","Dead Mobs", "Clients"))
		if("Players")
			to_chat(usr, jointext(GLOB.player_list,","))
		if("Admins")
			to_chat(usr, jointext(admins,","))
		if("Mobs")
			to_chat(usr, jointext(SSmobs.mob_list,","))
		if("Living Mobs")
			to_chat(usr, jointext(GLOB.living_mob_list,","))
		if("Dead Mobs")
			to_chat(usr, jointext(GLOB.dead_mob_list,","))
		if("Clients")
			to_chat(usr, jointext(clients,","))

// DNA2 - Admin Hax
/client/proc/cmd_admin_toggle_block(var/mob/M,var/block)
	if(iscarbon(M))
		M.dna.SetSEState(block,!M.dna.GetSEState(block))
		domutcheck(M,null,MUTCHK_FORCED)
		M.update_mutations()
		var/state="[M.dna.GetSEState(block)?"on":"off"]"
		var/blockname=assigned_blocks[block]
		message_admins("[key_name_admin(src)] has toggled [M.key]'s [blockname] block [state]!")
		log_admin("[key_name(src)] has toggled [M.key]'s [blockname] block [state]!")
	else
		alert("Invalid mob")

ADMIN_VERB_ADD(/client/proc/view_runtimes, R_DEBUG, FALSE)
/client/proc/view_runtimes()
	set category = "Debug"
	set name = "View Runtimes"
	set desc = "Open the Runtime Viewer"
	error_cache.showTo(usr)


ADMIN_VERB_ADD(/client/proc/spawn_disciple, R_DEBUG, FALSE)
/client/proc/spawn_disciple()
	set category = "Debug"
	set name = "Spawn Disciple"
	set desc = "Spawns a human with a cruciform, for ritual testing"
	if (!mob)
		return

	var/mob/living/carbon/human/H = new (get_turf(mob))
	var/obj/item/implant/core_implant/cruciform/C = new /obj/item/implant/core_implant/cruciform(H)

	C.install(H)
	C.activate()


ADMIN_VERB_ADD(/client/proc/delete_npcs, R_DEBUG, FALSE)
/client/proc/delete_npcs()
	set category = "Debug"
	set name = "Delete NPC mobs"
	set desc = "Deletes every mob that isn't a player"

	if(alert("Are you sure you want to delete all nonplayer mobs?",,"Yes", "No") == "No")
		return

	var/total = 0
	for (var/mob/living/L in world)
		if ((L in GLOB.player_list))
			continue
		qdel(L)
		total++
	to_chat(world, "Deleted [total] mobs")

ADMIN_VERB_ADD(/client/proc/cmd_regenerate_asset_cache, R_DEBUG, FALSE)
/client/proc/cmd_regenerate_asset_cache()
	set category = "Debug"
	set name = "Regenerate Asset Cache"
	set desc = "Clears the asset cache and regenerates it immediately."
	if(!config?.cache_assets)
		to_chat(usr, "<span class='warning'>Asset caching is disabled in the config!</span>")
		return
	var/regenerated = 0
	for(var/datum/asset/A as() in subtypesof(/datum/asset))
		if(!initial(A.cross_round_cachable))
			continue
		if(A == initial(A._abstract))
			continue
		var/datum/asset/asset_datum = GLOB.asset_datums[A]
		asset_datum.regenerate()
		regenerated++
	to_chat(usr, "<span class='notice'>Regenerated [regenerated] asset\s.</span>")

ADMIN_VERB_ADD(/client/proc/cmd_clear_smart_asset_cache, R_DEBUG, FALSE)
/client/proc/cmd_clear_smart_asset_cache()
	set category = "Debug"
	set name = "Clear Smart Asset Cache"
	set desc = "Clears the smart asset cache."
	if(!config.smart_cache_assets)
		to_chat(usr, "<span class='warning'>Smart asset caching is disabled in the config!</span>")
		return
	var/cleared = 0
	for(var/datum/asset/spritesheet_batched/A as() in subtypesof(/datum/asset/spritesheet_batched))
		if(A == initial(A._abstract))
			continue
		fdel("[ASSET_CROSS_ROUND_SMART_CACHE_DIRECTORY]/spritesheet_cache.[initial(A.name)].json")
		cleared++
	to_chat(usr, "<span class='notice'>Cleared [cleared] asset\s.</span>")
