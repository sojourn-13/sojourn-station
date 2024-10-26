/datum/individual_objective/stripping_prospector
	name = "Stripping Operation"
	req_department = list(DEPARTMENT_PROSPECTOR)
	rarity = 4
	var/price_target = 2000
	var/area/target

/datum/individual_objective/stripping_prospector/assign()
	..()
	var/list/valied_areas = list()
	for(var/area/A in ship_areas)
		var/current_price = 0
		if(A in valied_areas)
			continue
		if (istype(A, /area/nadezhda))
			continue
		if (A.is_dungeon_lootable)
			continue
		for(var/obj/item/I in A.contents)
			current_price += I.get_item_cost()
		if(current_price < price_target)
			continue
		valied_areas += A
	target = pick(valied_areas)
	desc = "Ensure that [target] does not have cumulative price of items inside it that is higher than [price_target][CREDITS]. Either pay someone or strip it clean of everything valuable yourself."
	RegisterSignal(mind_holder, COMSIG_MOB_LIFE, PROC_REF(task_completed))

/datum/individual_objective/stripping_prospector/task_completed()
	units_completed = 0
	for(var/obj/item/I in target.contents)
		units_completed += I.get_item_cost()
	if(units_completed < price_target)
		completed()

/datum/individual_objective/stripping_prospector/completed()
	if(completed) return
	UnregisterSignal(mind_holder, COMSIG_MOB_LIFE)
	..()

/datum/individual_objective/oddity_prospector
	name = "Pro STALKER"
	req_department = list(DEPARTMENT_PROSPECTOR)
	units_requested = 8

/datum/individual_objective/oddity_prospector/assign()
	..()
	desc = "Acquire at least [units_requested] oddities at the same time to be on you."
	RegisterSignal(mind_holder, COMSING_HUMAN_EQUITP, PROC_REF(task_completed))

/datum/individual_objective/oddity_prospector/task_completed(obj/item/W)
	units_completed = 0
	for(var/obj/item/I in mind_holder.GetAllContents())
		if(I.GetComponent(/datum/component/inspiration))
			..(1)

/datum/individual_objective/oddity_prospector/completed()
	if(completed) return
	UnregisterSignal(mind_holder, COMSING_HUMAN_EQUITP)
	..()

/datum/individual_objective/only_thing_they_fear
	name = "The only thing they fear is you"
	req_department = list(DEPARTMENT_PROSPECTOR)
	units_requested = 40

/datum/individual_objective/only_thing_they_fear/assign()
	..()
	desc = "Slay or observe the slaying of 40 hostiles (Roaches, Spiders, ect)."
	RegisterSignal(mind_holder, COMSIG_MOB_DEATH, PROC_REF(task_completed))

/datum/individual_objective/only_thing_they_fear/task_completed(mob/mob_death)
	..(1)

/datum/individual_objective/only_thing_they_fear/completed()
	if(completed) return
	UnregisterSignal(owner, COMSIG_MOB_DEATH)
	..()

/datum/individual_objective/collection_prospector
	name = "Specialty Collection"
	req_department = list(DEPARTMENT_PROSPECTOR)
	var/obj/item/target

/datum/individual_objective/collection_prospector/proc/pick_candidates()
	var/obj/randomcatcher/CATCH = new /obj/randomcatcher
	return CATCH.get_item(/obj/random/dungeon_gun_ballistic)

/datum/individual_objective/collection_prospector/assign()
	..()
	target = pick_candidates()
	desc = "Get your hands on a [target.name]. You've an eye for quality and want only the best."
	RegisterSignal(mind_holder, COMSING_HUMAN_EQUITP, PROC_REF(task_completed))

/datum/individual_objective/collection_prospector/task_completed(obj/item/W)
	if(W.type == target.type)
		completed()
	else
		for(var/obj/item/I in mind_holder.GetAllContents())
			if(I.type == target.type)
				completed()

/datum/individual_objective/collection_prospector/completed()
	if(completed) return
	UnregisterSignal(mind_holder, COMSING_HUMAN_EQUITP)
	..()
