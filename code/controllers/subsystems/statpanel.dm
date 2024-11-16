SUBSYSTEM_DEF(statpanels)
	name = "Stat Panels"
	wait = 4
	init_order = INIT_ORDER_STATPANELS
	init_stage = INITSTAGE_EARLY // doesn't do anything currently
	priority = FIRE_PRIORITY_STATPANEL
	runlevels = RUNLEVELS_DEFAULT | RUNLEVEL_LOBBY
	flags = SS_NO_INIT
	var/list/currentrun = list()
	var/list/global_data
	var/list/mc_data

	///how many subsystem fires between most tab updates
	var/default_wait = 10
	///how many subsystem fires between updates of the status tab
	var/status_wait = 6
	///how many subsystem fires between updates of the MC tab
	var/mc_wait = 5
	///how many full runs this subsystem has completed. used for variable rate refreshes.
	var/num_fires = 0

/datum/controller/subsystem/statpanels/fire(resumed = FALSE)
	if(!resumed)
		num_fires++
		global_data = list(
			"Storyteller: [master_storyteller ? master_storyteller : "being democratically elected"]",
			"Real Server Time: [time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")]",
			"Colony Time: [stationtime2text()]",
			"Colony Date: [stationdate2text()]",
			"Round Duration: [roundduration2text()]",
			"Round End Timer: [rounddurationcountdown2text()]"
		)
		var/eta_status = evacuation_controller.get_status_panel_eta()
		if(eta_status)
			global_data += "Evacuation: [eta_status]"
		src.currentrun = clients.Copy()
		mc_data = null

	var/list/currentrun = src.currentrun
	while(LAZYLEN(currentrun))
		var/client/target = currentrun[LAZYLEN(currentrun)]
		currentrun.len--
		if(!target.stat_panel.is_ready())
			continue

		// Update really fast during lobby for maximum responsiveness
		if(target.stat_tab == "Status" && (num_fires % status_wait == 0 || Master.current_runlevel == RUNLEVEL_LOBBY))
			set_status_tab(target)

		if(!target.holder)
			target.stat_panel.send_message("remove_admin_tabs")
		else
			target.stat_panel.send_message("update_split_admin_tabs", target.get_preference_value(/datum/client_preference/staff/split_admin_tabs) == GLOB.PREF_YES)
			
			if(!("MC" in target.panel_tabs) || !("Tickets" in target.panel_tabs))
				// target << output("[url_encode(target.holder.href_token)]", "statbrowser:add_admin_tabs")
				// very super secret secure admin token to prevent href exploits
				target.stat_panel.send_message("add_admin_tabs", "meowuwu")

			if(target.stat_tab == "MC" && ((num_fires % mc_wait == 0) || (target.get_preference_value(/datum/client_preference/staff/fast_mc_refresh) == GLOB.PREF_YES)))
				set_MC_tab(target)

		if(target.mob)
			var/mob/target_mob = target.mob
			
			// we don't have spells
			// if((target.stat_tab in target.spell_tabs) || !length(target.spell_tabs) && (length(target_mob.mob_spell_list) || length(target_mob.mind?.spell_list)))
			// 	if(num_fires % default_wait == 0)
			// 		set_spells_tab(target, target_mob)

			if(target.stat_tab == "Perks" && LAZYLEN(target_mob?.stats?.perks))
				if(num_fires % default_wait == 0)
					set_perks_tab(target, target_mob)

		if(MC_TICK_CHECK)
			return

/datum/controller/subsystem/statpanels/proc/set_status_tab(client/target)
	if(!global_data)//statbrowser hasnt fired yet and we were called from immediate_send_stat_data()
		return

	target.stat_panel.send_message("update_stat", list(
		global_data = global_data,
		other_str = target.mob?.get_status_tab_items(),
	))

/datum/controller/subsystem/statpanels/proc/set_MC_tab(client/target)
	var/turf/eye_turf = get_turf(target.eye)
	var/coord_entry = COORD(eye_turf)
	if(!mc_data)
		generate_mc_data()
	target.stat_panel.send_message("update_mc", list(mc_data = mc_data, coord_entry = coord_entry))

/datum/controller/subsystem/statpanels/proc/set_perks_tab(client/target, mob/target_mob)
	var/list/perk_data = list()
	for(var/datum/perk/P as anything in target_mob?.stats?.perks)
		perk_data += list(list("name" = P.name, "desc" = P.desc, "cooldown" = P.cooldown_time, "ref" = "[REF(P)]", "passive" = P.passivePerk))
	target.stat_panel.send_message("update_perks", list("world_time" = world.time, "perk_data" = perk_data))

/datum/controller/subsystem/statpanels/proc/generate_mc_data()
	mc_data = list(
		list("CPU:", world.cpu),
		list("Instances:", "[num2text(world.contents.len, 10)]"),
		list("World Time:", "[world.time]"),
		list("Globals:", GLOB.stat_entry(), "\ref[GLOB]"),
		list("Config:", "Edit", "\ref[config]"),
		list("Byond:", "(FPS:[world.fps]) (TickCount:[world.time/world.tick_lag]) (TickDrift:[round(Master.tickdrift,1)]([round((Master.tickdrift/(world.time/world.tick_lag))*100,0.1)]%)) (Internal Tick Usage: [round(MAPTICK_LAST_INTERNAL_TICK_USAGE,0.1)]%)"),
		list("Master Controller:", Master.stat_entry(), "\ref[Master]"),
		list("Failsafe Controller:", Failsafe.stat_entry(), "\ref[Failsafe]"),
		list("Camera Net", "Cameras: [LAZYLEN(cameranet.cameras)] | Chunks: [LAZYLEN(cameranet.chunks)]", "\ref[cameranet]"),
		list("", "")
	)
	for(var/datum/controller/subsystem/sub_system as anything in Master.subsystems)
		mc_data[++mc_data.len] = list("\[[sub_system.state_letter()]][sub_system.name]", sub_system.stat_entry(), "\ref[sub_system]")

///immediately update the active statpanel tab of the target client
/datum/controller/subsystem/statpanels/proc/immediate_send_stat_data(client/target)
	if(!target.stat_panel.is_ready())
		return FALSE

	if(target.stat_tab == "Status")
		set_status_tab(target)
		return TRUE

	var/mob/target_mob = target.mob
	// if((target.stat_tab in target.spell_tabs) || !length(target.spell_tabs) && (length(target_mob.mob_spell_list) || length(target_mob.mind?.spell_list)))
	// 	set_spells_tab(target, target_mob)
	// 	return TRUE

	if(!target.holder)
		return FALSE

	if(target.stat_tab == "MC")
		set_MC_tab(target)
		return TRUE

	if(target.stat_tab == "Perks" && target_mob)
		set_perks_tab(target, target_mob)
		return TRUE


/// Stat panel window declaration
/client/var/datum/tgui_window/stat_panel
