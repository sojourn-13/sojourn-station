
/*
/datum/individual_objective/beyond
	name = "A Particular Spot"
	req_department = list(DEPARTMENT_COMMAND)
	units_requested = 5 MINUTES
	based_time = TRUE
	var/obj/effect/overmap/ship/linked
	var/x
	var/y
	var/timer


/datum/individual_objective/beyond/can_assign(mob/living/L)
	if(!..())
		return FALSE
	return locate(/obj/effect/overmap/ship/eris)

/datum/individual_objective/beyond/assign()
	..()
	x = rand(2, GLOB.GLOB.maps_data.overmap_size-1)
	y = rand(2, GLOB.GLOB.maps_data.overmap_size-1)
	linked = locate(/obj/effect/overmap/ship/eris)
	desc = "There is a mark made on your old star chart. You do not remember why you did it but your curiosity wont let you sleep.  \
			Move [linked] to coordinates [x], [y] for [unit2time(units_requested)]."
	timer = world.time
	RegisterSignal(linked, COMSIG_SHIP_STILL, PROC_REF(task_completed))

/datum/individual_objective/beyond/task_completed(nx, ny, is_still)
	if(!is_still || x != nx || y != ny)
		timer = world.time
		units_completed = 0
	else
		units_completed += abs(world.time - timer)
		timer = world.time
	if(check_for_completion())
		completed()

/datum/individual_objective/beyond/completed()
	if(completed) return
	UnregisterSignal(linked, COMSIG_SHIP_STILL)
	..()
*/

/datum/individual_objective/bluecross
	name = "Mental Piece"
	req_department = list(DEPARTMENT_COMMAND)
	var/obj/item/target

/datum/individual_objective/bluecross/proc/pick_bluecross_candidates()
	var/obj/randomcatcher/CATCH = new /obj/randomcatcher
	return CATCH.get_item(/obj/random/oddity_guns)

/datum/individual_objective/bluecross/assign()
	..()
	target = pick_bluecross_candidates()
	desc = "Sometimes having a trinket is just nice. Acquire a [target.name] if possable..."
	RegisterSignal(mind_holder, COMSING_HUMAN_EQUITP, PROC_REF(task_completed))
