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
	var/list/cached_images = list()

	///how many subsystem fires between most tab updates
	var/default_wait = 10
	///how many subsystem fires between updates of the status tab
	var/status_wait = 6
	///how many subsystem fires between updates of the MC tab
	var/mc_wait = 5
	/// how many subsystem fires between updates of the turf examine tab
	var/turf_wait = 2
	///how many full runs this subsystem has completed. used for variable rate refreshes.
	var/num_fires = 0

/datum/controller/subsystem/statpanels/fire(resumed = FALSE)
	if(!resumed)
		num_fires++
		global_data = list(
			"Storyteller: [master_storyteller ? master_storyteller : "being democratically elected"]",
			"Server Time: [time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")]",
			"Round Time: [roundduration2text()]",
			"Ship Time: [stationtime2text()]",
		)
		var/eta_status = evacuation_controller.get_status_panel_eta()
		if(eta_status)
			global_data += eta_status
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

			if(target_mob?.listed_turf && num_fires % turf_wait == 0)
				if(!target_mob.TurfAdjacent(target_mob.listed_turf) || isnull(target_mob.listed_turf))
					target.stat_panel.send_message("remove_listedturf")
					target_mob.listed_turf = null
				else if(target.stat_tab == target_mob?.listed_turf.name || !(target_mob?.listed_turf.name in target.panel_tabs))
					set_turf_examine_tab(target, target_mob)
		if(MC_TICK_CHECK)
			return

/datum/controller/subsystem/statpanels/proc/set_status_tab(client/target)
	if(!global_data)//statbrowser hasnt fired yet and we were called from immediate_send_stat_data()
		return

	target.stat_panel.send_message("update_stat", list(
		global_data = global_data,
		ping_str = "Ping: [round(target.lastping, 1)]ms (Average: [round(target.avgping, 1)]ms)",
		other_str = target.mob?.get_status_tab_items(),
	))

/datum/controller/subsystem/statpanels/proc/set_MC_tab(client/target)
	var/turf/eye_turf = get_turf(target.eye)
	var/coord_entry = COORD(eye_turf)
	if(!mc_data)
		generate_mc_data()
	target.stat_panel.send_message("update_mc", list(mc_data = mc_data, coord_entry = coord_entry))

/datum/controller/subsystem/statpanels/proc/set_turf_examine_tab(client/target, mob/target_mob)
	var/list/overrides = list()
	var/list/turfitems = list()
	for(var/image/target_image as anything in target.images)
		if(!target_image.loc || target_image.loc.loc != target_mob.listed_turf || !target_image.override)
			continue
		overrides += target_image.loc

	turfitems[++turfitems.len] = list("[target_mob.listed_turf]", REF(target_mob.listed_turf), icon2html(target_mob.listed_turf, target, sourceonly=TRUE))

	for(var/atom/movable/turf_content as anything in target_mob.listed_turf)
		if(turf_content.mouse_opacity == MOUSE_OPACITY_TRANSPARENT)
			continue
		if(turf_content.invisibility > target_mob.see_invisible)
			continue
		if(turf_content in overrides)
			continue
		// if(turf_content.IsObscured())
		// 	continue

		if(length(turfitems) < 10) // only create images for the first 10 items on the turf, for performance reasons
			var/turf_content_ref = REF(turf_content)
			if(!(turf_content_ref in cached_images))
				cached_images += turf_content_ref
				turf_content.RegisterSignal(turf_content, COMSIG_PARENT_QDELETING, /atom/.proc/remove_from_cache) // we reset cache if anything in it gets deleted

				if(ismob(turf_content) || length(turf_content.overlays) > 2)
					turfitems[++turfitems.len] = list("[turf_content.name]", turf_content_ref, costly_icon2html(turf_content, target, sourceonly=TRUE))
				else
					turfitems[++turfitems.len] = list("[turf_content.name]", turf_content_ref, icon2html(turf_content, target, sourceonly=TRUE))
			else
				turfitems[++turfitems.len] = list("[turf_content.name]", turf_content_ref)
		else
			turfitems[++turfitems.len] = list("[turf_content.name]", REF(turf_content))

	target.stat_panel.send_message("update_listedturf", turfitems)

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
		list("","")
	)
	for(var/datum/controller/subsystem/sub_system as anything in Master.subsystems)
		mc_data[++mc_data.len] = list("\[[sub_system.state_letter()]][sub_system.name]", sub_system.stat_entry(), "\ref[sub_system]")
	mc_data[++mc_data.len] = list("Camera Net", "Cameras: [LAZYLEN(cameranet.cameras)] | Chunks: [LAZYLEN(cameranet.chunks)]", "\ref[cameranet]")

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

	if(target_mob?.listed_turf)
		if(!target_mob.TurfAdjacent(target_mob.listed_turf) || isnull(target_mob.listed_turf))
			target.stat_panel.send_message("remove_listedturf")
			target_mob.listed_turf = null

		else if(target.stat_tab == target_mob?.listed_turf.name || !(target_mob?.listed_turf.name in target.panel_tabs))
			set_turf_examine_tab(target, target_mob)
			return TRUE

	if(!target.holder)
		return FALSE

	if(target.stat_tab == "MC")
		set_MC_tab(target)
		return TRUE

	// if(target.stat_tab == "Tickets")
	// 	set_tickets_tab(target)
	// 	return TRUE

	// if(!length(GLOB.sdql2_queries) && ("SDQL2" in target.panel_tabs))
	// 	target << output("", "statbrowser:remove_sdql2")

	// else if(length(GLOB.sdql2_queries) && target.stat_tab == "SDQL2")
	// 	set_SDQL2_tab(target)

/atom/proc/remove_from_cache()
	SIGNAL_HANDLER
	SSstatpanels.cached_images -= REF(src)

/// Stat panel window declaration
/client/var/datum/tgui_window/stat_panel
