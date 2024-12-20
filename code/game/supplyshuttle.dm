//Config stuff
#define SUPPLY_DOCKZ 2          //Z-level of the Dock.
#define SUPPLY_STATIONZ 1       //Z-level of the Station.

//Supply packs are in /code/defines/obj/supplypacks.dm
//Computers are in /code/game/machinery/computer/supply.dm

var/list/mechtoys = list(
	/obj/item/toy/figure/mecha/ripley,
	/obj/item/toy/figure/mecha/fireripley,
	/obj/item/toy/figure/mecha/deathripley,
	/obj/item/toy/figure/mecha/gygax,
	/obj/item/toy/figure/mecha/durand,
	/obj/item/toy/figure/mecha/honk,
	/obj/item/toy/figure/mecha/marauder,
	/obj/item/toy/figure/mecha/seraph,
	/obj/item/toy/figure/mecha/mauler,
	/obj/item/toy/figure/mecha/odysseus,
	/obj/item/toy/figure/mecha/phazon
)

/obj/item/paper/manifest
	name = "supply manifest"
	var/is_copy = 1

/obj/structure/plasticflaps //HOW DO YOU CALL THOSE THINGS ANYWAY
	name = "\improper plastic flaps"
	desc = "Completely impassable - or are they?"
	icon = 'icons/obj/stationobjs.dmi' //Change this.
	icon_state = "plasticflaps"
	density = 0
	anchored = 1
	layer = ABOVE_MOB_LAYER
	matter = list(MATERIAL_PLASTIC = 4)
	explosion_resistance = 5
	var/list/mobs_can_pass = list(
		/mob/living/carbon/slime,
		/mob/living/simple_animal/mouse,
		/mob/living/silicon/robot/drone
		)
	maxHealth = 30 //Weak plastic strips easy to break
	health = 30

/obj/structure/plasticflaps/proc/damage(damage)
	health -= damage
	if(health <= 0)
		qdel(src)

/obj/structure/plasticflaps/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
	if(damage)
		damage(damage)
		attack_animation(user)
		visible_message(SPAN_DANGER("[user] [attack_message] the [src]!"))
		return 1

/obj/structure/plasticflaps/attackby(obj/item/I, mob/user)
	if((QUALITY_BOLT_TURNING in I.tool_qualities) && (!istype(src, /obj/structure/plasticflaps/mining)))
		to_chat(user, SPAN_NOTICE("You start disassembling the [src]..."))
		if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_BOLT_TURNING, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You dissasembled the [src]!"))
			drop_materials(drop_location(), user)
			qdel(src)

/obj/structure/plasticflaps/CanPass(atom/A, turf/T)
	if(istype(A) && A.checkpass(PASSGLASS))
		return prob(60)

	var/obj/structure/bed/B = A
	if (istype(A, /obj/structure/bed) && B.buckled_mob)//if it's a bed/chair and someone is buckled, it will not pass
		return 0

	if(istype(A, /obj/vehicle))	//no vehicles
		return 0

	var/mob/living/M = A
	if(istype(M))
		if(M.lying)
			return ..()
		for(var/mob_type in mobs_can_pass)
			if(istype(A, mob_type))
				return ..()
		return issmall(M)

	return ..()

/obj/structure/plasticflaps/ex_act(severity)
	switch(severity)
		if (1)
			qdel(src)
		if (2)
			if (prob(50))
				qdel(src)
		if (3)
			if (prob(5))
				qdel(src)

/obj/structure/plasticflaps/mining //A specific type for mining that doesn't allow airflow because of them damn crates
	name = "airtight plastic flaps"
	desc = "Heavy duty, airtight, plastic flaps."

/obj/structure/plasticflaps/mining/New() //set the turf below the flaps to block air
	update_turf_underneath(1)
	..()

/obj/structure/plasticflaps/mining/Destroy() //lazy hack to set the turf to allow air to pass if it's a simulated floor
	update_turf_underneath(0)
	. = ..()

/obj/structure/plasticflaps/mining/proc/update_turf_underneath(var/should_pass)
	var/turf/T = get_turf(loc)
	if(T)
		if(should_pass)
			T.blocks_air = 1
		else
			if(istype(T, /turf/simulated/floor))
				T.blocks_air = 0
