SUBSYSTEM_DEF(xenoarch)
	name = "Xenoarch"
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_XENOARCH

	var/const/xenoarch_spawn_chance = 0.5
	var/const/digsite_size_lower = 4
	var/const/digsite_size_upper = 12
	var/artifact_spawnnum_lower = 1
	var/artifact_spawnnum_upper = 2

	var/list/artifact_spawning_turfs = list()
	var/list/digsite_spawning_turfs = list()
	var/list/map_data_list = list()

/datum/controller/subsystem/xenoarch/Initialize(start_timeofday)
	set background = 1
	//fill list of map data so we can use it to determine digsite types
	for(var/obj/map_data/MD in world)
		if (MD.digsites)
			map_data_list += MD
	//create digsites
	for(var/turf/simulated/mineral/M in block(locate(1,1,1), locate(world.maxx, world.maxy, world.maxz)))
		if(isnull(M.geologic_data))
			M.geologic_data = new/datum/geosample(M)

		if(!prob(xenoarch_spawn_chance))
			continue

		if(!(is_allowed_digsites(M.z)))
			continue

		digsite_spawning_turfs.Add(M)
		var/digsite = get_digsite_type(M.z, map_data_list)
		var/target_digsite_size = rand(digsite_size_lower, digsite_size_upper)
		var/list/processed_turfs = list()
		var/list/turfs_to_process = list(M)
		while(turfs_to_process.len)
			var/turf/simulated/mineral/archeo_turf = pop(turfs_to_process)

			if(target_digsite_size > 1)
				var/list/viable_adjacent_turfs = orange(1, archeo_turf)
				for(var/turf/simulated/mineral/T in orange(1, archeo_turf))
					if(T.finds)
						continue
					if(T in processed_turfs)
						continue
					viable_adjacent_turfs.Add(T)

				for(var/turf/simulated/mineral/T in viable_adjacent_turfs)
					if(prob(target_digsite_size/viable_adjacent_turfs.len))
						turfs_to_process.Add(T)
						target_digsite_size -= 1
						if(target_digsite_size <= 0)
							break

			processed_turfs.Add(archeo_turf)
			if(isnull(archeo_turf.finds))
				archeo_turf.finds = list()
				if(prob(50))
					archeo_turf.finds.Add(new /datum/find(digsite, rand(5,95)))
				else if(prob(75))
					archeo_turf.finds.Add(new /datum/find(digsite, rand(5,45)))
					archeo_turf.finds.Add(new /datum/find(digsite, rand(55,95)))
				else
					archeo_turf.finds.Add(new /datum/find(digsite, rand(5,30)))
					archeo_turf.finds.Add(new /datum/find(digsite, rand(35,75)))
					archeo_turf.finds.Add(new /datum/find(digsite, rand(75,95)))

				//sometimes a find will be close enough to the surface to show
				var/datum/find/F = archeo_turf.finds[1]
				if(F.excavation_required <= F.view_range)
					archeo_turf.archaeo_overlay = "overlay_archaeo[rand(1,3)]"
					archeo_turf.add_overlay(archeo_turf.archaeo_overlay)
					archeo_turf.update_icon()	//occulist edit. Hopefully fixes xeno arch not showing up ever in minerals view (It did not) -Rynn

			//have a chance for an artifact to spawn here, but not in animal or plant digsites
			if(isnull(M.artifact_find) && digsite != 1 && digsite != 2)
				artifact_spawning_turfs.Add(archeo_turf)
				artifact_spawnnum_upper += 1

	//create artifact machinery
	artifact_spawnnum_lower = artifact_spawnnum_upper / 2
	var/num_artifacts_spawn = rand(artifact_spawnnum_lower * 0.1, artifact_spawnnum_upper * 0.1) // 0.1 makes it 10% potentially might have to be lowered more.
	//log_and_message_admins("Xenoarch artifact spawn count is [num_artifacts_spawn].") //Used to test how many spawned at round start.
	while(artifact_spawning_turfs.len > num_artifacts_spawn)
		pick_n_take(artifact_spawning_turfs)

	var/list/artifacts_spawnturf_temp = artifact_spawning_turfs.Copy()
	while(artifacts_spawnturf_temp.len > 0)
		var/turf/simulated/mineral/artifact_turf = pop(artifacts_spawnturf_temp)
		artifact_turf.artifact_find = new()

	//log_and_message_admins("Xenoarch subsystem as finished creating digsites and anomalies!") Used to test for when it actually finished due to background setting.

	return ..()
