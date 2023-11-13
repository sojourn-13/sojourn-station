/*
	A vast number of space vox spawn around the colony. Will heavily stress the shields
	They eventually go away
*/
/datum/storyevent/vox_migration
	id = "vox_migration"
	name = "bird migration"

	event_type =/datum/event/vox_migration
	event_pools = list(EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR)
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_DESTRUCTIVE, TAG_SCARY, TAG_EXTERNAL)

//////////////////////////////////////////////////////////

/datum/event/vox_migration
	announceWhen	= 50
	endWhen 		= 60
	var/list/viable_turfs = list()
	var/list/spawned_vox = list()
	var/deep_forests = FALSE

/datum/event/vox_migration/setup()
	//We'll pick space tiles which have windows nearby
	//This means that carp will only be spawned in places where someone could see them
	var/area/forest = locate(/area/nadezhda/outside/forest) in world
	if(prob(30))
		//Deep Jungel
		forest = locate(/area/nadezhda/outside/meadow) in world
		deep_forests = TRUE
	for (var/turf/T in forest)
		if (!(T.z in GLOB.maps_data.station_levels) && !deep_forests)
			continue

		if (locate(/obj/effect/shield) in T)
			continue

		//The number of windows near each tile is recorded
		var/numgrass
		for (var/turf/simulated/floor/asteroid/grass/W in view(4, T))
			numgrass++

		//And the square of it is entered into the list as a weight
		if (numgrass)
			viable_turfs[T] = numgrass*numgrass

	//We will then use pickweight and this will be more likely to choose tiles with many windows, for maximum exposure

	announceWhen = rand(40, 60)
	endWhen = rand(600,1200)

/datum/event/vox_migration/announce()
	var/announcement = ""
	if(!deep_forests)
		if(severity == EVENT_LEVEL_MAJOR)
			announcement = "Massive migration of avian biological entities has been detected past the colony perimeter, please stand-by."
		else
			announcement = "Avian biological [spawned_vox.len == 1 ? "entity has" : "entities have"] been detected near coloy walls, please stand-by."
	else
		if(severity == EVENT_LEVEL_MAJOR)
			announcement = "Massive migration of avian biological entities has been detected in the deep forest."
		else
			announcement = "Avian biological [spawned_vox.len == 1 ? "entity has" : "entities have"] been detected the deep forest."

	command_announcement.Announce(announcement, "Lifesign Alert")

/datum/event/vox_migration/start()
	if(severity == EVENT_LEVEL_MAJOR)
		spawn_vox(100)
	else if(severity == EVENT_LEVEL_MODERATE)
		spawn_vox(75)

/datum/event/vox_migration/proc/spawn_vox(var/number)
	var/list/spawn_locations = pickweight_mult(viable_turfs, number)

	for(var/turf/T in spawn_locations)
		if(prob(70)) //70% to spawn the vox or not, should still always have a few but not a hoard
			spawned_vox.Add(new /obj/random/mob/vox(T))

/datum/event/vox_migration/end()
	for(var/mob/living/carbon/superior_animal/vox/v in spawned_vox)
		if(!v.stat)
			var/turf/T = get_turf(v)
			if(istype(T, /turf/space)) //If they end up outside the map then we remove them on end
				spawned_vox.Remove(v)
				qdel(v)
			if(istype(T, /turf/unsimulated/wall/jungle))
				spawned_vox.Remove(v)
				qdel(v)