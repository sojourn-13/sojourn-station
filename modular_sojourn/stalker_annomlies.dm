/obj/structure/annomlies_diet
	name = "Coder Annomlie"
	desc = "Something not meant to be seen by the eyes of players, \
	sad."
	icon = 'modular_sojourn/stalker_annomlies.dmi'
	var/active = FALSE
	pixel_x = 8
	pixel_y = 8

/obj/structure/annomlies_diet/Destroy()
	STOP_PROCESSING(SSobj, src)
	return ..()

/obj/structure/annomlies_diet/proc/set_awake()
	if (active)
		return

	START_PROCESSING(SSobj, src)
	active = TRUE

/obj/structure/annomlies_diet/flashy_coin
	name = "Flash"
	desc = "An anomalous black hole in the ground, no light can shine down it, \
	yet a small orb of light bounces up out of it every now and again."
	icon_state = "flash_hole"
	item_state = "flash_hole"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	layer = FLY_LAYER
	var/flashy_coin_timer = 90
	var/flashy_coin_reppeater_timer = 240

/obj/structure/annomlies_diet/flashy_coin/New()
	..()
	set_awake()
	addtimer(CALLBACK(src, .proc/flashy_check), flashy_coin_timer)
	addtimer(CALLBACK(src, .proc/loop_timer), flashy_coin_reppeater_timer)

/obj/structure/annomlies_diet/flashy_coin/Crossed(mob/M)
	if(isliving(M))
		flick("flash_hole_trigger", src)
		addtimer(CALLBACK(src, .proc/check_for_angels), 16.2)
	.=..()

/obj/structure/annomlies_diet/flashy_coin/proc/flashy_check(mob/M)
	flick("flash_hole_trigger", src)
	addtimer(CALLBACK(src, .proc/check_for_angels), 16.2)

/obj/structure/annomlies_diet/flashy_coin/proc/check_for_angels(mob/M)
	for(M in living_mobs_in_view(3, src))
		flashy_stun(M)

/obj/structure/annomlies_diet/flashy_coin/proc/loop_timer()
	addtimer(CALLBACK(src, .proc/flashy_check), flashy_coin_timer)
	addtimer(CALLBACK(src, .proc/loop_timer), flashy_coin_reppeater_timer)

/obj/structure/annomlies_diet/flashy_coin/proc/flashy_stun(mob/living/carbon/M) //Flashbang_bang but bang-less.
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/eye_safety = 0
		eye_safety = H.eyecheck()
		if(eye_safety >= FLASH_PROTECTION_MAJOR)
			return
		H.flash(3, TRUE , TRUE , TRUE, 15)
		H.stats.addTempStat(STAT_VIG, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		H.stats.addTempStat(STAT_COG, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		H.stats.addTempStat(STAT_BIO, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		H.stats.addTempStat(STAT_MEC, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
	else
		M.flash(5, TRUE, TRUE , TRUE)
		M.stats.addTempStat(STAT_VIG, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		M.stats.addTempStat(STAT_COG, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		M.stats.addTempStat(STAT_BIO, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
		M.stats.addTempStat(STAT_MEC, -STAT_LEVEL_ADEPT, 60 SECONDS, "flashy_stun")
	M.update_icons()

/obj/structure/annomlies_diet/haze
	name = "Haze"
	desc = "A spot of hazy air, as if heatwaves rising from a hot asphalt road. Just getting close to it gives off a profound sense of warmth."
	icon_state = "haze"
	item_state = "haze"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	alpha = 45
	layer = FLY_LAYER
	var/infino_timer = 60
	var/infino_reppeater_timer = 120

	var/heavy_range = 3
	var/weak_range = 4
	var/flash_range = 0
	var/heat_damage = 40
	var/fire_stacks = TRUE
	var/penetration = 1


/obj/structure/annomlies_diet/haze/New()
	..()
	set_awake()
	addtimer(CALLBACK(src, .proc/nonchemical_reaction), infino_timer)
	addtimer(CALLBACK(src, .proc/loop_timer), infino_reppeater_timer)

/obj/structure/annomlies_diet/haze/Crossed(mob/M)
	if(isliving(M))
		var/turf/T = get_turf(src)
		heatwave(T, heavy_range, weak_range, heat_damage, fire_stacks, penetration)
	.=..()

/obj/structure/annomlies_diet/haze/proc/nonchemical_reaction()
	var/turf/T = get_turf(src)
	heatwave(T, heavy_range, weak_range, heat_damage, fire_stacks, penetration)

/obj/structure/annomlies_diet/haze/proc/loop_timer()
	addtimer(CALLBACK(src, .proc/nonchemical_reaction), infino_timer)
	addtimer(CALLBACK(src, .proc/loop_timer), infino_reppeater_timer)

/obj/structure/annomlies_diet/spidersilk
	name = "Fairy silk"
	desc = "A pretty collection of floating lights, dangling from random points in the air, they glow softly, and are very pretty. Sadly they also get in the way."
	icon_state = "fairy_light"
	item_state = "fairy_light"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	layer = FLY_LAYER
	var/starting_culter = TRUE
	var/is_growing = TRUE
	var/spread_range = 1
	var/spread_speed_slow = 100		// Minium amount of time it takes for a grown crystal to spread
	var/spread_speed_high = 280		// Maxium amount of time it takes for a grown crystal to spread
	light_power = 1
	light_range = 2
	light_color = "#F5B31E"

	pixel_x = 0
	pixel_y = 0

/obj/structure/annomlies_diet/spidersilk/New()
	..()
	set_awake()
	addtimer(CALLBACK(src, .proc/spread), spread_speed_slow)

/obj/structure/annomlies_diet/spidersilk/non_spreader
	is_growing = FALSE
	starting_culter = FALSE

/obj/structure/annomlies_diet/spidersilk/spreaded
	starting_culter = FALSE

/obj/structure/annomlies_diet/spidersilk/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0))
		return 1
	if(isliving(mover))
		if(prob(80))
			to_chat(mover, SPAN_WARNING("You get stuck in \the [src] for a moment."))
			return 0
	else if(istype(mover, /obj/item/projectile))
		return prob(60)
	return 1

/obj/structure/annomlies_diet/spidersilk/proc/spread()
	if(!src) //Just in case
		return
	if(!is_growing)
		return
	var/list/turf_list = list()
	var/spidersilk
	for(var/turf/T in orange(spread_range, get_turf(src)))
		if(!can_pixy_dance_to(T))
			continue
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	if(turf_list.len)
		var/turf/T = pick(turf_list)

		spidersilk = /obj/structure/annomlies_diet/spidersilk // We spread are basic type

		if(is_growing)
			spidersilk = /obj/structure/annomlies_diet/spidersilk/spreaded
			if(prob(60) && !starting_culter)
				spidersilk = /obj/structure/annomlies_diet/spidersilk/non_spreader

		if(spidersilk && is_growing)
			new spidersilk(T) // We spread
			if(prob(50) && !starting_culter)
				is_growing = FALSE

	if(spidersilk && is_growing) //Anti-lag breaking the chain
		if(prob(50))
			light_color = "#391285"
		if(prob(40))
			light_color = "#FFE4E1"
		addtimer(CALLBACK(src, .proc/spread), rand(spread_speed_slow,spread_speed_high)) //This constantly gets recalled by self. Thus to give people time to combat the shards they will get some time


// Check the given turf to see if there is any special things that would prevent the spread
/obj/structure/annomlies_diet/spidersilk/proc/can_pixy_dance_to(var/turf/T)
	if(T)
		if(istype(T, /turf/space)) // We can't spread in SPACE!
			return FALSE
		if(istype(T, /turf/simulated/open)) // Crystals can't float. Yet.
			return FALSE
		if(locate(/obj/structure/annomlies_diet/spidersilk) in T) // No stacking.
			return FALSE
	return TRUE

/obj/structure/annomlies_diet/ball_lightning
	name = "ball lightning"
	desc = "Floating ball of arcing electricity, it drifts through the air like a cloud, with its faint blue glow and distinct smell of ionized air."
	icon_state = "ball_lightning"
	item_state = "ball_lightning"
	density = TRUE
	anchored = FALSE
	throwpass = FALSE
	layer = FLY_LAYER
	var/movement_range = 3
	var/movement_speed_as_in_when_it_moves_not_how_active_it_moves = 2
	var/movement_activity = 180
	allow_spin = FALSE
	light_power = 2
	light_range = 3
	light_color = "#7DF9FF"
	var/lighting_in_a_bottle
	var/datum/effect/effect/system/spark_spread/spark_system

/obj/structure/annomlies_diet/ball_lightning/New()
	lighting_in_a_bottle = new /obj/item/cell/large/greyson(src)
	addtimer(CALLBACK(src, .proc/wings), movement_activity)
	spark_system = new()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)
	set_awake()
	..()

/obj/structure/annomlies_diet/ball_lightning/Destroy()
	if(lighting_in_a_bottle)
		qdel(lighting_in_a_bottle)
		lighting_in_a_bottle = null
	QDEL_NULL(spark_system)
	..()

/obj/structure/annomlies_diet/ball_lightning/proc/wings()
	if(!src) //Just in case
		return
	var/list/turf_list = list()
	for(var/turf/T in orange(movement_range, get_turf(src)))
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	if(turf_list.len)
		var/turf/T = pick(turf_list)
		///atom/movable/proc/throw_at(atom/target, range, speed, thrower)
		throw_at(T, movement_range, movement_speed_as_in_when_it_moves_not_how_active_it_moves, src)


	addtimer(CALLBACK(src, .proc/wings), movement_activity)

/obj/structure/annomlies_diet/ball_lightning/Bumped(atom/user)
	if (electrocute_mob(user, lighting_in_a_bottle, src)) //electrocute_mob() handles removing charge from the cell, no need to do that here.
		spark_system.start()

/obj/structure/annomlies_diet/ball_lightning/Bump(atom/user)
	if (electrocute_mob(user, lighting_in_a_bottle, src)) //electrocute_mob() handles removing charge from the cell, no need to do that here.
		spark_system.start()

/obj/structure/annomlies_diet/hell
	name = "Radiant"
	desc = "A floating orb of warm yellow light, yet the area around it seems to be covered in a thin layer of frost."
	icon_state = "radient"
	item_state = "radient"
	light_power = 3
	light_range = 6
	light_color = "#FEA91A"
	density = TRUE
	var/temp_for_bump_subtractor = 270
	//We add all 3 together
	var/temp_for_far_area_subtractor = 20
	var/temp_for_medium_area_subtractor = 20
	var/temp_for_close_area_subtractor = 20
	//
	var/freeze_ray_cooldowns = 120

//user bodytemperature = 310.055 rounding ish in shift so were basing it on this

/obj/structure/annomlies_diet/hell/New()
	addtimer(CALLBACK(src, .proc/perma_frost), freeze_ray_cooldowns)
	..()

/obj/structure/annomlies_diet/hell/proc/perma_frost(mob/M)
	//Yes we stack each time, get cryo'ed
	for(M in living_mobs_in_view(3, src))
		orb(M, temp_for_far_area_subtractor)
	for(M in living_mobs_in_view(2, src))
		orb(M, temp_for_medium_area_subtractor)
	for(M in living_mobs_in_view(1, src))
		orb(M, temp_for_close_area_subtractor)

	addtimer(CALLBACK(src, .proc/perma_frost), freeze_ray_cooldowns)

/obj/structure/annomlies_diet/hell/proc/orb(mob/living/carbon/M, temp_to_use)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.bodytemperature -= temp_to_use

/obj/structure/annomlies_diet/hell/Bumped(atom/user)
	addtimer(CALLBACK(src, .proc/frozen_soild, user, temp_for_bump_subtractor), 1)

/obj/structure/annomlies_diet/hell/Bump(atom/user)
	addtimer(CALLBACK(src, .proc/frozen_soild, user, temp_for_bump_subtractor), 1)

/obj/structure/annomlies_diet/hell/proc/frozen_soild(atom/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		H.bodytemperature -= 275 //This is in Kittens not Cats or Felines
