/area/crawler
	name = "Dungeon"
	icon_state = "start"
	has_gravity = 1
	requires_power = 0
	var/room_controllers = list()
	dynamic_lighting = FALSE
	var/has_late_game_spawned_for_folks = FALSE


/area/crawler/Entered(A)
	..()
	if(has_late_game_spawned_for_folks)
		return
	if(!ishuman(A))
		return
	has_late_game_spawned_for_folks = TRUE
	for(var/obj/random/mob/roomba/spawners in src)
		spawners.late_handling()
