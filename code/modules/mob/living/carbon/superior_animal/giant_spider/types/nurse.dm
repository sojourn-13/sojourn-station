#define SPINNING_WEB 1
#define LAYING_EGGS 2
#define MOVING_TO_TARGET 3
#define SPINNING_COCOON 4

//nursemaids - these create webs and eggs
/mob/living/carbon/superior_animal/giant_spider/nurse
	name = "nurse spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has brilliant green eyes."
	icon_state = "nurse"
	icon_living = "nurse"
	maxHealth = 40
	health = 40
	melee_damage_lower = 5
	melee_damage_upper = 10
	poison_per_bite = 2
	var/atom/cocoon_target
	poison_type = "stoxin"
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/spider/nurse
	meat_amount = 3
	var/fed = 0
	emote_see = list("chitters.","rubs its legs.","trails webs through its hairs.","screeches.")

/mob/living/carbon/superior_animal/giant_spider/nurse/midwife
	name = "midwife spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has brilliant green eyes and purple stripes on the back."
	icon_state = "midwife"
	icon_living = "midwife"
	maxHealth = 60
	health = 60
	melee_damage_lower = 10
	melee_damage_upper = 15
	poison_type = "mutagen"

/mob/living/carbon/superior_animal/giant_spider/nurse/recluse
	name = "recluse spider"
	desc = "Furry and brown, it makes you shudder to look at it. This one has brilliant green eyes and light brown skin."
	icon_state = "recluse"
	icon_living = "recluse"
	maxHealth = 20
	health = 20
	poison_per_bite = 4
	melee_damage_lower = 3
	melee_damage_upper = 5
	poison_type = "zombiepowder"

/mob/living/carbon/superior_animal/giant_spider/nurse/queen
	name = "spider queen"
	desc = "Furry and black, it makes you shudder to look at it. This one is a huge chittering brood queen with large fangs of dripping venom."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "spider_queen"
	icon_living = "spider_queen"
	maxHealth = 400
	health = 400
	melee_damage_lower = 20
	melee_damage_upper = 30
	poison_per_bite = 4
	poison_type = "menace"
	mob_size = MOB_LARGE

/mob/living/carbon/superior_animal/giant_spider/nurse/queen/New()
	..()
	pixel_x = -16
	pixel_y = null

/mob/living/carbon/superior_animal/giant_spider/nurse/attemptAttackOnTarget()
	var/target = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(prob(poison_per_bite))
			var/obj/item/organ/external/O = safepick(H.organs)
			if(O && !BP_IS_ROBOTIC(O))
				var/eggs = new /obj/effect/spider/eggcluster(O, src)
				O.implants += eggs

/mob/living/carbon/superior_animal/giant_spider/nurse/proc/GiveUp(var/C)
	spawn(100)
		if(busy == MOVING_TO_TARGET)
			if(cocoon_target == C && get_dist(src,cocoon_target) > 1)
				cocoon_target = null
				busy = 0
				stop_automated_movement = 0

/mob/living/carbon/superior_animal/giant_spider/nurse/Life()
	..()
	if(!stat)
		if(stance == HOSTILE_STANCE_IDLE)
			//30% chance to stop wandering and do something
			if(!busy && prob(30))
				//first, check for potential food nearby to cocoon
				var/list/cocoonTargets = new
				for(var/mob/living/C in getObjectsInView())
					if(C.stat != CONSCIOUS)
						cocoonTargets += C

				cocoon_target = safepick(nearestObjectsInList(cocoonTargets,src,1))
				if (cocoon_target)
					busy = MOVING_TO_TARGET
					set_glide_size(DELAY2GLIDESIZE(move_to_delay))
					walk_to(src, cocoon_target, 1, move_to_delay)
					GiveUp(cocoon_target) //give up if we can't reach target
					return

				//second, spin a sticky spiderweb on this tile
				if(!(locate(/obj/effect/spider/stickyweb) in get_turf(src)))
					busy = SPINNING_WEB
					src.visible_message(SPAN_NOTICE("\The [src] begins to secrete a sticky substance."))
					stop_automated_movement = 1
					spawn(40)
						if(busy == SPINNING_WEB)
							if(!(locate(/obj/effect/spider/stickyweb) in get_turf(src)))
								new /obj/effect/spider/stickyweb(src.loc)
								update_openspace()
							busy = 0
							stop_automated_movement = 0
				else
					//third, lay an egg cluster there
					if((fed > 0) && !(locate(/obj/effect/spider/eggcluster) in get_turf(src)))
						busy = LAYING_EGGS
						src.visible_message(SPAN_NOTICE("\The [src] begins to lay a cluster of eggs."))
						stop_automated_movement = 1
						spawn(50)
							if(busy == LAYING_EGGS)
								if(!(locate(/obj/effect/spider/eggcluster) in get_turf(src)))
									new /obj/effect/spider/eggcluster(loc, src)
									fed--
									update_openspace()
								busy = 0
								stop_automated_movement = 0
					else
						//fourthly, cocoon any nearby items so those pesky pinkskins can't use them
						var/list/nearestObjects = nearestObjectsInList(getObjectsInView(),src,1)
						for(var/obj/O in nearestObjects)
							if(O.anchored)
								continue
							if(istype(O, /obj/item) || istype(O, /obj/structure) || istype(O, /obj/machinery))
								cocoonTargets += O

						cocoon_target = safepick(cocoonTargets)
						if (cocoon_target)
							busy = MOVING_TO_TARGET
							stop_automated_movement = 1
							set_glide_size(DELAY2GLIDESIZE(move_to_delay))
							walk_to(src, cocoon_target, 1, move_to_delay)
							GiveUp(cocoon_target) //give up if we can't reach target

			else if(busy == MOVING_TO_TARGET && cocoon_target)
				if(get_dist(src, cocoon_target) <= 1)
					busy = SPINNING_COCOON
					src.visible_message(SPAN_NOTICE("\The [src] begins to secrete a sticky substance around \the [cocoon_target]."))
					stop_automated_movement = 1
					walk(src,0)
					spawn(50)
						if(busy == SPINNING_COCOON)
							if(cocoon_target && istype(cocoon_target.loc, /turf) && get_dist(src,cocoon_target) <= 1)
								var/obj/effect/spider/cocoon/C = locate() in cocoon_target.loc
								var/large_cocoon
								var/turf/targetTurf = cocoon_target.loc

								for(var/obj/O in targetTurf)
									if (O.anchored)
										continue
									if (istype(O, /obj/item))
									else if (istype(O, /obj/structure) || istype(O, /obj/machinery))
										large_cocoon = 1
									else
										continue

									C = C || new(targetTurf)
									O.forceMove(C)

								for(var/mob/living/M in targetTurf)
									if((M.stat == CONSCIOUS) || istype(M, /mob/living/carbon/superior_animal/giant_spider) || is_carrion(M))
										continue
									large_cocoon = 1

									if (istype(M, /mob/living))
										src.visible_message(SPAN_WARNING("\The [src] sticks a proboscis into \the [cocoon_target] and sucks a viscous substance out."))
										fed++

									C = C || new(targetTurf)
									M.forceMove(C)
									break

								if (C)
									if(large_cocoon || C.is_large_cocoon)
										C.becomeLarge()
									C.update_openspace()

								cocoon_target = null

							busy = 0
							stop_automated_movement = 0

		else
			busy = 0
			stop_automated_movement = 0

#undef SPINNING_WEB
#undef LAYING_EGGS
#undef MOVING_TO_TARGET
#undef SPINNING_COCOON