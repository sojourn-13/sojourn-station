/*
	A vast number of ameridian spawn around the colony. Will heavily stress the shields
	They eventually go away
*/
/datum/storyevent/ameridian_migration
	id = "ameridian_migration"
	name = "ameridian growth"

	event_type =/datum/event/ameridian_migration
	event_pools = list(EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR)
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_DESTRUCTIVE, TAG_SCARY, TAG_EXTERNAL)

//////////////////////////////////////////////////////////

/datum/event/ameridian_migration
	announceWhen	= 50
	endWhen 		= 60
	var/list/viable_turfs = list()
	var/list/spawned_ameridian = list()
	var/deep_forests = FALSE

/datum/event/ameridian_migration/setup()
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

/datum/event/ameridian_migration/announce()
	var/announcement = ""
	if(!deep_forests)
		if(severity == EVENT_LEVEL_MAJOR)
			announcement = "Massive growth of Ameridian has been detected past the colony perimeter, please stand-by."
		else
			announcement = "Ameridian [spawned_ameridian.len == 1 ? "growth has" : "growths have"] been detected the deep forest."
	else
		if(severity == EVENT_LEVEL_MAJOR)
			announcement = "Massive growth of Ameridian has been detected in the deep forest."
		else
			announcement = "Ameridian [spawned_ameridian.len == 1 ? "growth has" : "growths have"] been detected the deep forest."

	command_announcement.Announce(announcement, "Lifesign Alert")

/datum/event/ameridian_migration/start()
	if(severity == EVENT_LEVEL_MAJOR)
		spawn_ameridian(70)
	else if(severity == EVENT_LEVEL_MODERATE)
		spawn_ameridian(35)

/datum/event/ameridian_migration/proc/spawn_ameridian(var/number)
	var/list/spawn_locations = pickweight_mult(viable_turfs, number)

	for(var/turf/T in spawn_locations)
		if(prob(70))
			spawned_ameridian.Add(new /obj/random/structures/ameridian_crystal(T))

/datum/event/ameridian_migration/end()
	for(var/obj/structure/ameridian_crystal/a in spawned_ameridian)
		if(!a.stat)
			var/turf/T = get_turf(a)
			if(istype(T, /turf/space)) //If they end up outside the map then we remove them on end
				spawned_ameridian.Remove(a)
				qdel(a)
			if(istype(T, /turf/unsimulated/wall/jungle))
				spawned_ameridian.Remove(a)
				qdel(a)