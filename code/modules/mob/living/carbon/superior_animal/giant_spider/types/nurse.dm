#define SPINNING_WEB 1
#define LAYING_EGGS 2
#define MOVING_TO_TARGET 3
#define SPINNING_COCOON 4

//nursemaids - these create webs and eggs
/mob/living/carbon/superior/spider/nurse
	name = "nurse spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has brilliant green eyes."
	icon_state = "nurse"
	icon_living = "nurse"
	maxHealth = 30 * SPIDER_HEALTH_MOD
	health = 30 * SPIDER_HEALTH_MOD
	melee_damage_lower = 5
	melee_damage_upper = 10
	poison_per_bite = 2
	var/atom/cocoon_target
	poison_type = "stoxin"
	meat_type = /obj/item/reagent_containers/snacks/meat/spider/nurse
	meat_amount = 3
	var/fed = 0
	emote_see = list("chitters.","rubs its legs.","trails webs through its hairs.","screeches.")
	var/web_activity = 30
	move_to_delay = 4 //slightly faster than guardians but slower than hunters
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 5, bio = 10, rad = 25, agony = 0)
	var/egg_inject_chance = 0 //AHAHAHAHAHAHAHAAHAHAH, no
	life_cycles_before_sleep = 3000 //We need more time to eat and web
	inherent_mutations = list(MUTATION_PROT_MILK, MUTATION_SPIDER_FRIEND, MUTATION_NERVOUSNESS, MUTATION_DEAF)
	research_value = 800

/mob/living/carbon/superior/spider/nurse/midwife
	name = "midwife spider"
	desc = "Furry and black, it makes you shudder to look at it. This one has brilliant green eyes and purple stripes on the back."
	icon_state = "midwife"
	icon_living = "midwife"
	maxHealth = 50 * SPIDER_HEALTH_MOD
	health = 50 * SPIDER_HEALTH_MOD
	melee_damage_lower = 10
	melee_damage_upper = 15
	poison_per_bite = 4
	egg_inject_chance = 5 //Yes
	meat_type = /obj/item/reagent_containers/snacks/meat/spider/midwife
	research_value = 1000

/mob/living/carbon/superior/spider/nurse/cave_spider
	name = "cave spider"
	desc = "Furry and white, it makes you shudder to look at it. This one has brilliant blue eyes and a pale cold body."
	icon_state = "nurse_E"
	icon_living = "nurse_E"
	maxHealth = 100 * SPIDER_HEALTH_MOD // Slow but tanky
	health = 100 * SPIDER_HEALTH_MOD
	melee_damage_lower = 10
	melee_damage_upper = 15
	poison_per_bite = 4
	poison_type = "frostoil"
	move_to_delay = 5 // Very slow
	meat_type = /obj/item/reagent_containers/snacks/meat/spider/cave_spider

/mob/living/carbon/superior/spider/nurse/carrier
	name = "carrier spider"
	desc = "Furry and tan, it makes you shudder to look at it. This one has brilliant green eyes, its body swollen with pulsating eggs."
	icon_state = "carrier"
	icon_living = "carrier"
	deathmessage = "splits open! Several wriggling spiders crawl from its gore!"
	egg_inject_chance = 2 //maybe...
	var/has_made_spiderlings = FALSE
	move_to_delay = 5 //Has babys on it!

/mob/living/carbon/superior/spider/nurse/carrier/death(var/gibbed,var/message = deathmessage)
	if (stat != DEAD)
		target_mob = null
		stance = initial(stance)
		stop_automated_movement = initial(stop_automated_movement)
		SSmove_manager.stop_looping(src)
		if(!has_made_spiderlings)
			new /obj/effect/spider/spiderling/near_grown(src.loc)
			new /obj/effect/spider/spiderling/near_grown(src.loc)
			new /obj/effect/spider/spiderling/near_grown(src.loc)
			has_made_spiderlings = TRUE

		density = 0
		layer = LYING_MOB_LAYER

	. = ..()

/mob/living/carbon/superior/spider/nurse/orb_weaver
	name = "orb weaver spider"
	desc = "Furry and green, it makes you shudder to look at it. This one has lots of energy and even more webs covering its body."
	icon_state = "webslinger"
	icon_living = "webslinger"
	emote_see = list("chitters.","rubs its legs.","trails webs through its hairs.","screeches.","bounces happily in place!")
	web_activity = 70
	armor = list(melee = 3, bullet = 1, energy = 0, bomb = 5, bio = 10, rad = 25, agony = 0)

/mob/living/carbon/superior/spider/nurse/recluse
	name = "recluse spider"
	desc = "Furry and brown, it makes you shudder to look at it. This one has brilliant green eyes and light brown skin."
	icon_state = "recluse"
	icon_living = "recluse"
	maxHealth = 15 * SPIDER_HEALTH_MOD
	health = 15 * SPIDER_HEALTH_MOD
	poison_per_bite = 1 //1u is all it takes to sleep you, your asleep also dosnt prevet it form attacking you more then once meaning this quit quickly stacks without someones help
	melee_damage_lower = 3
	melee_damage_upper = 5
	meat_type = /obj/item/reagent_containers/snacks/meat/spider/recluse
	meat_amount = 2
	egg_inject_chance = 15 //Defiently
	move_to_delay = 5 // Very slow do to being 1 hit unfun
	//Giving the recluse its own special meat that has zombie powder. Reducing the amount of meat made since this is some hard stuff and the recluse is easy to kill.
	poison_type = "zombiepowder"
	armor_divisor = 3

/mob/living/carbon/superior/spider/nurse/queen
	name = "empress spider"
	desc = "Furry and black, it makes you shudder to look at it. This one is a huge chittering brood queen with large fangs of dripping venom."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "spider_queen"
	icon_living = "spider_queen"
	maxHealth = 200 * SPIDER_HEALTH_MOD
	health = 200 * SPIDER_HEALTH_MOD
	melee_damage_lower = 20
	melee_damage_upper = 30
	poison_per_bite = 4
	poison_type = "menace"
	meat_type = /obj/item/reagent_containers/snacks/meat/spider/queen
	meat_amount = 3
	flash_resistances = 5 //For balance against are speedy fello
	egg_inject_chance = 10 //Likely
	//Giving the queen her own meat type which contains MENACE.
	mob_size = MOB_LARGE
	get_stat_modifier =  TRUE
	armor = list(melee = 3, bullet = 1, energy = 0, bomb = 5, bio = 10, rad = 25, agony = 0)
	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_SPIDER_FRIEND, MUTATION_RAND_UNSTABLE, MUTATION_RAND_UNSTABLE, MUTATION_RAND_UNSTABLE)
	armor_divisor = 2
	research_value = 2000

/mob/living/carbon/superior/spider/nurse/queen/New()
	..()
	pixel_x = -16
	pixel_y = null

/mob/living/carbon/superior/spider/nurse/UnarmedAttack()
	..()

	var/atom/targetted_mob = (target_mob?.resolve())

	if(ishuman(targetted_mob))
		var/mob/living/carbon/human/H = targetted_mob
		if(prob(egg_inject_chance))
			var/obj/item/organ/external/O = safepick(H.organs)
			if(O && !BP_IS_ROBOTIC(O))
				src.visible_message(SPAN_DANGER("[src] injects something into the [O] of [H]!"))
				var/obj/effect/spider/eggcluster/minor/S = new()
				S.loc = O
				O.implants += S

/mob/living/carbon/superior/spider/nurse/proc/GiveUp(var/C)
	spawn(100)
		if(busy == MOVING_TO_TARGET)
			if(cocoon_target == C && get_dist(src,cocoon_target) > 1)
				cocoon_target = null
				busy = 0
				stop_automated_movement = 0

/mob/living/carbon/superior/spider/nurse/handle_ai()
	..()
	if(stance == HOSTILE_STANCE_IDLE)
		//30% or 90% chance to stop wandering and do something
		if(!busy && prob(web_activity))
			//first, check for potential food nearby to cocoon
			var/list/cocoonTargets = new
			var/turf/our_turf = get_turf(src)
			if (our_turf) //If we're not in anything, continue
				for(var/mob/living/C in hearers(src, viewRange))
					if(C.stat != CONSCIOUS)
						cocoonTargets += C

				cocoon_target = safepick(nearestObjectsInList(cocoonTargets,src,1))
				if (cocoon_target)
					busy = MOVING_TO_TARGET
					set_glide_size(DELAY2GLIDESIZE(move_to_delay))
					if (stat != DEAD)
						SSmove_manager.move_to(src, cocoon_target, 1, move_to_delay)
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
					//third, lay an egg cluster there, takes 2 feds
					if((fed > 1) && !(locate(/obj/effect/spider/eggcluster) in get_turf(src)))
						busy = LAYING_EGGS
						src.visible_message(SPAN_NOTICE("\The [src] begins to lay a cluster of eggs."))
						stop_automated_movement = 1
						spawn(50)
							if(busy == LAYING_EGGS)
								if(!(locate(/obj/effect/spider/eggcluster) in get_turf(src)))
									new /obj/effect/spider/eggcluster(loc, src)
									fed -= 2
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
							if (stat != DEAD)
								SSmove_manager.move_to(src, cocoon_target, 1, move_to_delay)
							GiveUp(cocoon_target) //give up if we can't reach target

		else if(busy == MOVING_TO_TARGET && cocoon_target)
			if(get_dist(src, cocoon_target) <= 1)
				busy = SPINNING_COCOON
				src.visible_message(SPAN_NOTICE("\The [src] begins to secrete a sticky substance around \the [cocoon_target]."))
				stop_automated_movement = 1
				SSmove_manager.stop_looping(src)
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
								if((M.stat == CONSCIOUS) || is_carrion(M)) //We do eat are own
									continue
								large_cocoon = 1
								fed += 1 //we get half what we need to leg an egg

								if(istype(M, /mob/living/carbon/human))
									if(M.faction == "spiders")
										continue
									else
										src.visible_message(SPAN_WARNING("\The [src] sticks a proboscis into \the [cocoon_target] and sucks a viscous substance out."))
										M.drip_blood(200)
										M.adjustToxLoss(6)
										M.adjustOxyLoss(200)
										M.adjustBrainLoss(60)
										M.updatehealth()
										fed += 2 //we ate a person we are able to lay eggs and have 1 fed over

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



#undef SPINNING_WEB
#undef LAYING_EGGS
#undef MOVING_TO_TARGET
#undef SPINNING_COCOON
