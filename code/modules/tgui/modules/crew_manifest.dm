/datum/tgui_module/manifest
	name = "Manifest"
	tgui_id = "CrewManifest"

/datum/tgui_module/manifest/ui_data(mob/user)
	var/list/data = ..()

	var/list/dept_data = list(
		list("key" = "heads", "flag" = COMMAND),
		list("key" = "sec", "flag" = SECURITY),
		list("key" = "bls", "flag" = BLACKSHIELD),
		list("key" = "med", "flag" = MEDICAL),
		list("key" = "sci", "flag" = SCIENCE),
		list("key" = "chr", "flag" = CHURCH),
		list("key" = "sup", "flag" = LSS),
		list("key" = "eng", "flag" = ENGINEERING),
		list("key" = "pro", "flag" = PROSPECTORS),
		list("key" = "civ", "flag" = CIVILIAN),
		list("key" = "bot", "flag" = MISC),
		list("key" = "ldg", "flag" = LODGE)
	)

	var/list/manifest = list()
	for(var/datum/computer_file/report/crew_record/CR in GLOB.all_crew_records)
		var/list/crew_data = list()

		var/name = CR.get_name()
		crew_data["name"] = name
		
		var/rank = CR.get_job()
		crew_data["rank"] = rank

		var/datum/job/job = SSjob.occupations_by_name[rank]

		var/list/departments = list()
		if(istype(job))
			for(var/list/department in dept_data)
				if(job.department_flag & department["flag"])
					departments += department["key"]
		crew_data["departments"] = departments

		for(var/datum/mind/M in SSticker.minds)
			if(M.name == name)
				var/status = M.manifest_status(CR)
				if(status)
					crew_data["status"] = status
				break

		manifest += list(crew_data)

	for(var/mob/living/silicon/ai/ai in SSmobs.mob_list)
		manifest += list(list("name" = ai.name, "rank" = "Artificial Intelligence", "departments" = list("bot")))

	for(var/mob/living/silicon/robot/robot in SSmobs.mob_list)
		// No combat/syndicate cyborgs, no drones.
		if(robot.module && robot.module.hide_on_manifest)
			continue

		manifest += list(list("name" = robot.name, "rank" = "[robot.modtype] [robot.braintype]", "departments" = list("bot")))
	
	data["manifest"] = manifest

	return data

/datum/tgui_module/manifest/ui_state(mob/user)
	return GLOB.always_state
