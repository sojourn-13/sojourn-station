/obj/structure/largecrate //TODO: Refactor this into a crate subtype.
	name = "large crate"
	desc = "A hefty wooden crate."
	icon = 'icons/obj/crate.dmi'
	icon_state = "densecrate"
	matter = list(MATERIAL_WOOD = 10)
	density = 1

/obj/structure/largecrate/attack_hand(mob/user as mob)
	to_chat(user, SPAN_NOTICE("You need a crowbar to pry this open!"))
	return

/obj/structure/largecrate/attackby(obj/item/I, mob/user)
	if(QUALITY_PRYING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_PRYING, FAILCHANCE_EASY, required_stat = STAT_ROB))
			drop_materials(drop_location())
			var/turf/T = get_turf(src)
			for(var/atom/movable/AM in contents)
				if(AM.simulated) AM.forceMove(T)
			user.visible_message(SPAN_NOTICE("[user] pries \the [src] open."), \
								 SPAN_NOTICE("You pry open \the [src]."), \
								 SPAN_NOTICE("You hear splitting wood."))
			qdel(src)
	else
		return attack_hand(user)

/obj/structure/largecrate/mule
	name = "MULE crate"

/obj/structure/largecrate/hoverpod
	name = "\improper Hoverpod assembly crate"
	desc = "It comes in a box for the fabricator's sake. Where does the wood come from? ... And why is it lighter?"
	icon_state = "mulecrate"

/obj/structure/largecrate/hoverpod/attackby(obj/item/I, mob/user)
	if(QUALITY_PRYING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
			var/obj/item/mecha_parts/mecha_equipment/ME
			var/obj/mecha/working/hoverpod/H = new (loc)

			ME = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp
			ME.attach(H)
			ME = new /obj/item/mecha_parts/mecha_equipment/tool/passenger
			ME.attach(H)
		..()

/obj/structure/largecrate/animal
	icon_state = "mulecrate"
	var/held_count = 1
	var/held_type

/obj/structure/largecrate/animal/New()
	..()
	for(var/i = 1;i<=held_count;i++)
		new held_type(src)

/obj/structure/largecrate/animal/corgi
	name = "corgi carrier"
	held_type = /mob/living/simple_animal/corgi

/obj/structure/largecrate/animal/cow
	name = "cow crate"
	held_type = /mob/living/simple_animal/cow

/obj/structure/largecrate/animal/pig
	name = "pig crate"
	held_type = /mob/living/simple_animal/pig

/obj/structure/largecrate/animal/bear
	name = "bear crate"
	held_type = /mob/living/simple_animal/hostile/bear/brown

/obj/structure/largecrate/animal/p_bear
	name = "polar bear crate"
	held_type = /mob/living/simple_animal/hostile/bear/polar

/obj/structure/largecrate/animal/goat
	name = "goat crate"
	held_type = /mob/living/simple_animal/hostile/retaliate/goat

/obj/structure/largecrate/animal/cat
	name = "cat carrier"
	held_type = /mob/living/simple_animal/cat

/obj/structure/largecrate/animal/cat/bones
	held_type = /mob/living/simple_animal/cat/fluff/bones

/obj/structure/largecrate/animal/chick
	name = "chicken crate"
	held_count = 5
	held_type = /mob/living/simple_animal/chick

/obj/structure/largecrate/animal/giant_spider
	name = "Giant Spider crate"
	held_type = /mob/living/carbon/superior_animal/giant_spider

/obj/structure/largecrate/animal/nurse_spider
	name = "Nurse Spider crate"
	held_type = /mob/living/carbon/superior_animal/giant_spider/nurse

/obj/structure/largecrate/animal/hunter_spider
	name = "Hunter Spider crate"
	held_type = /mob/living/carbon/superior_animal/giant_spider/hunter

/obj/structure/largecrate/animal/welder_roach
	name = "Benzin Roach crate"
	held_type = /mob/living/carbon/superior_animal/roach/nitro

/obj/structure/largecrate/animal/piano
	held_type = /obj/structure/synthesized_instrument/synthesizer/piano
