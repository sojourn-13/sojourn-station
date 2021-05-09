SUBSYSTEM_DEF(inactivity)
	name = "Inactivity"
	wait = 5 MINUTES
	priority = SS_PRIORITY_INACTIVITY
	var/tmp/list/client_list
	var/number_kicked = 0

/datum/controller/subsystem/inactivity/fire(resumed = FALSE)
	if (!resumed)
		client_list = clients.Copy()

	while(client_list.len)
		var/client/C = client_list[client_list.len]
		client_list.len--
		if(!C.holder && C.is_afk(config.kick_inactive MINUTES) && !isobserver(C.mob))
			log_access("AFK: [key_name(C)]")
			to_chat(C, SPAN_WARNING("You have been inactive for more than [config.kick_inactive] minute\s and have been disconnected."))
			del(C) // Don't qdel, cannot override finalize_qdel behaviour for clients.
			number_kicked++
		else if (C.mob && C.mob.mind && C.mob.stat != DEAD)
			C.mob.mind.last_activity = world.time - C.inactivity

		//Us injecting our code into this subsystem just to be cancer.
		if(!C.is_afk(5 MINUTES))
			if(C.mob)
				var/mob/living/carbon/human/SMan = C.mob
				var/commandep = COMMAND
				if(istype(SMan, /mob/living/carbon/human))
					if(SMan.job)
						if(SMan.mind.assigned_job.department == "Security")
							C.prefs.securityplaytime += 5
						if(SMan.mind.assigned_job.department == "Medical")
							C.prefs.medicalplaytime += 5
						if(SMan.mind.assigned_job.department == "Engineering")
							C.prefs.engineeringplaytime += 5
						if(SMan.mind.assigned_job.department == "Science")
							C.prefs.scienceplaytime += 5
						if(SMan.mind.assigned_job.department == "Lonestar")
							C.prefs.lonestarplaytime += 5
						if(SMan.mind.assigned_job.department == "Church")
							C.prefs.churchplaytime += 5
						if(SMan.mind.assigned_job.department == "Prospectors")
							C.prefs.prospectorsplaytime += 5
						if(SMan.mind.assigned_job.department == "Independent")
							C.prefs.independentplaytime += 5
						if(SMan.mind.assigned_job.department_flag & commandep)
							C.prefs.commandplaytime += 5
						C.prefs.save_preferences(0)

		if (MC_TICK_CHECK)
			return

/datum/controller/subsystem/inactivity/stat_entry()
	..("Kicked: [number_kicked]")
