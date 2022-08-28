/datum/turf_initializer/mining/Initialize(var/turf/simulated/T)
	if(T.density)
		return
	// Quick and dirty check to avoid placing things inside windows
	if(locate(/obj/structure/low_wall || /obj/structure/grille, T))
		return

	if(prob(10)) //Lose rocks and ore should be nice to pick up
		new /obj/item/stack/ore(T)
	if(prob(2)) //Lets now make everyware ever have rubble, also anti-lag
		new /obj/effect/decal/cleanable/rubble(T)
	if(prob(0.3)) //higher the number the more mobs the more laggy this becomes
		new /obj/structure/ameridian_crystal(T)
	if(prob(0.1)) //higher the number the more mobs the more laggy this becomes
		new /obj/random/mob/golem/high_chance(T)
	if(prob(0.01)) //higher the number the more mobs the more laggy this becomes
		new /obj/structure/ameridian_crystal/spire(T)
