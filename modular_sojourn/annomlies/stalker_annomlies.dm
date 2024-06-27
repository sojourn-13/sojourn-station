/obj/structure/annomlies_diet
	name = "Coder Annomlie"
	desc = "Something not meant to be seen by the eyes of players, \
	sad."
	icon = 'modular_sojourn/annomlies/stalker_annomlies.dmi'
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
	addtimer(CALLBACK(src, PROC_REF(flashy_check)), flashy_coin_timer)
	addtimer(CALLBACK(src, PROC_REF(loop_timer)), flashy_coin_reppeater_timer)

/obj/structure/annomlies_diet/flashy_coin/Crossed(mob/M)
	if(isliving(M))
		flick("flash_hole_trigger", src)
		addtimer(CALLBACK(src, PROC_REF(check_for_angels)), 16.2)
	.=..()

/obj/structure/annomlies_diet/flashy_coin/proc/flashy_check(mob/M)
	flick("flash_hole_trigger", src)
	addtimer(CALLBACK(src, PROC_REF(check_for_angels)), 16.2)

/obj/structure/annomlies_diet/flashy_coin/proc/check_for_angels(mob/M)
	for(M in living_mobs_in_view(3, src))
		flashy_stun(M)

/obj/structure/annomlies_diet/flashy_coin/proc/loop_timer()
	addtimer(CALLBACK(src, PROC_REF(flashy_check)), flashy_coin_timer)
	addtimer(CALLBACK(src, PROC_REF(loop_timer)), flashy_coin_reppeater_timer)

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
	alpha = 75
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
	addtimer(CALLBACK(src, PROC_REF(nonchemical_reaction)), infino_timer)
	addtimer(CALLBACK(src, PROC_REF(loop_timer)), infino_reppeater_timer)

/obj/structure/annomlies_diet/haze/Crossed(mob/M)
	if(isliving(M))
		var/turf/T = get_turf(src)
		heatwave(T, heavy_range, weak_range, heat_damage, fire_stacks, penetration)
		visible_message(SPAN_WARNING("\red [src] sparks to life blasting a heat wave and flaming ambers!"))
	.=..()

/obj/structure/annomlies_diet/haze/proc/nonchemical_reaction()
	var/turf/T = get_turf(src)
	heatwave(T, heavy_range, weak_range, heat_damage, fire_stacks, penetration)
	visible_message(SPAN_WARNING("\red [src] sparks to life blasting a heat wave and flaming ambers!"))

/obj/structure/annomlies_diet/haze/proc/loop_timer()
	addtimer(CALLBACK(src, PROC_REF(nonchemical_reaction)), infino_timer)
	addtimer(CALLBACK(src, PROC_REF(loop_timer)), infino_reppeater_timer)

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
	addtimer(CALLBACK(src, PROC_REF(spread)), spread_speed_slow)

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
		addtimer(CALLBACK(src, PROC_REF(spread)), rand(spread_speed_slow,spread_speed_high)) //This constantly gets recalled by self. Thus to give people time to combat the shards they will get some time


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
	desc = "A floating ball of arcing electricity, it quickly drifts through the air like a cloud, with its faint blue glow and distinct smell of ionized air."
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
	addtimer(CALLBACK(src, PROC_REF(wings)), movement_activity)
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


	addtimer(CALLBACK(src, PROC_REF(wings)), movement_activity)

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
	addtimer(CALLBACK(src, PROC_REF(perma_frost)), freeze_ray_cooldowns)
	..()

/obj/structure/annomlies_diet/hell/proc/perma_frost(mob/M)
	//Yes we stack each time, get cryo'ed
	for(M in living_mobs_in_view(3, src))
		orb(M, temp_for_far_area_subtractor)
	for(M in living_mobs_in_view(2, src))
		orb(M, temp_for_medium_area_subtractor)
	for(M in living_mobs_in_view(1, src))
		orb(M, temp_for_close_area_subtractor)

	addtimer(CALLBACK(src, PROC_REF(perma_frost)), freeze_ray_cooldowns)

/obj/structure/annomlies_diet/hell/proc/orb(mob/living/carbon/M, temp_to_use)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.bodytemperature -= temp_to_use

/obj/structure/annomlies_diet/hell/Bumped(atom/user)
	addtimer(CALLBACK(src, PROC_REF(frozen_soild), user, temp_for_bump_subtractor), 1)

/obj/structure/annomlies_diet/hell/Bump(atom/user)
	addtimer(CALLBACK(src, PROC_REF(frozen_soild), user, temp_for_bump_subtractor), 1)

/obj/structure/annomlies_diet/hell/proc/frozen_soild(atom/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		H.bodytemperature -= 275 //This is in Kittens not Cats or Felines


/obj/structure/annomlies_diet/thumper
	name = "Thumper"
	desc = "A glistening cloud of gold vapors. Small arcs of electricity dance around inside it as it slams itself forcefully into the ground, over and over."
	icon_state = "crusher_cloud"
	item_state = "crusher_cloud"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	layer = FLY_LAYER
	var/apple_timer = 60
	var/apple_timer_growing = 90
	var/clunk = 1
	var/bruse = 5
	var/star_strike = 2
	var/striek_nerves_odds = 100

/*
/mob/living/proc/trip(tripped_on, stun_duration)
	return FALSE
*/
/obj/structure/annomlies_diet/thumper/New()
	..()
	set_awake()
	addtimer(CALLBACK(src, PROC_REF(check_for_newtons)), apple_timer)
	addtimer(CALLBACK(src, PROC_REF(growing_season)), apple_timer_growing)

/obj/structure/annomlies_diet/thumper/Crossed(mob/M)
	.=..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		to_chat(H, SPAN_NOTICE("\The [src] knocks you down when try to walk under it!"))
		H.trip(src, clunk)
		H.adjustBruteLoss(bruse)
		H.confused += star_strike
		H.updatehealth()

/obj/structure/annomlies_diet/thumper/proc/gravitational_theory(mob/M)
	visible_message(SPAN_WARNING("\red [src] SLAMS down shaking the ground!"))
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.trip(src, clunk)
		H.adjustBruteLoss(bruse)
		H.confused += star_strike
		H.updatehealth()
		if(prob(striek_nerves_odds))
			var/obj/item/organ/external/organ = H.get_organ(pick(BP_LEGS))
			if(!organ || organ.is_nerve_struck() || organ.nerve_struck == -1)
				return
			else
				organ.nerve_strike_add(1)

/obj/structure/annomlies_diet/thumper/proc/check_for_newtons(mob/M)
	for(M in living_mobs_in_view(3, src))
		gravitational_theory(M)

/obj/structure/annomlies_diet/thumper/proc/warnings_for_newtons()
	visible_message(SPAN_WARNING("\red [src] SLAMS down shaking the ground!"))

/obj/structure/annomlies_diet/thumper/proc/harsh_winds(mob/M)
	flick("crusher_cloud_crush", src)
	addtimer(CALLBACK(src, PROC_REF(check_for_newtons)), 17.6)
	addtimer(CALLBACK(src, PROC_REF(warnings_for_newtons)), 17.6)

/obj/structure/annomlies_diet/thumper/proc/growing_season()
	addtimer(CALLBACK(src, PROC_REF(harsh_winds)), apple_timer)
	addtimer(CALLBACK(src, PROC_REF(growing_season)), apple_timer_growing)


/obj/structure/annomlies_diet/echo
	name = "Echo"
	desc = "Shimmering blue cubes, you feel you aren't meant to see them like this."
	icon_state = "echo"
	density = FALSE
	anchored = TRUE

	pixel_x = 0
	pixel_y = 0

	var/can_use = TRUE
	var/saved_name
	var/saved_description
	var/saved_item
	var/saved_type
	var/saved_icon
	var/saved_icon_state
	var/saved_layer
	var/saved_original_plane
	var/saved_dir
	var/saved_message
	var/saved_appearance
	var/saved_item_state
	var/saved_w_class
	var/spider_appearance
	var/saved_gender

	var/dummy_active = FALSE
	var/scan_mobs = TRUE


/obj/structure/annomlies_diet/echo/proc/activate()
	toggle()

/obj/structure/annomlies_diet/echo/proc/attack(mob/living/M, mob/living/user)
	if(!scan_mobs)
		return

/obj/structure/annomlies_diet/echo/Crossed(atom/M)
	if(istype(M, /mob/observer) || istype(M, /obj/item/projectile))
		return

	afterattack(M, M)

/obj/structure/annomlies_diet/echo/proc/afterattack(atom/target, mob/user, proximity)
	if(istype(target, /obj/item/storage))
		return
	if(dummy_active || !scan_mobs)
		disrupt()
	reset_data()
	playsound(get_turf(src), 'sound/weapons/flash.ogg', 100, 1, -6)
	saved_name = target.name
	saved_item = target
	saved_type = target.type
	saved_icon = target.icon
	saved_icon_state = target.icon_state
	saved_description = target.desc
	saved_dir = target.dir
	saved_appearance = target.appearance
	saved_gender = target.gender
	spider_appearance = src.appearance
	saved_layer = target.layer
	saved_original_plane = target.original_plane
	if(isobj(target))
		var/obj/O = target
		saved_item_state = O.item_state
		saved_w_class = O.w_class
	if(ismob(target))
		saved_message = target.examine(user)
	toggle()
	return

/obj/structure/annomlies_diet/echo/proc/toggle()
	if(!can_use || !saved_item)
		return
	if(dummy_active)
		dummy_active = FALSE
		appearance = spider_appearance
		name = initial(name)
		desc = initial(desc)
		icon = initial(icon)
		icon_state = initial(icon_state)
		layer = initial(layer)
		plane = calculate_plane(z, original_plane)
		item_state = initial(item_state)
		set_dir(initial(dir))
		update_icon()
	else
		if(!saved_item)
			return
		else
			activate_holo(saved_name, saved_icon, saved_icon_state, saved_description, saved_dir, saved_appearance, saved_item_state)

/obj/structure/annomlies_diet/echo/proc/activate_holo(new_name, new_icon, new_iconstate, new_description, new_dir, new_appearance, new_item_state)
	name = new_name
	desc = new_description
	icon = new_icon
	icon_state = new_iconstate
	item_state = new_item_state
	appearance = new_appearance
	set_dir(new_dir)
	plane = calculate_plane(z, saved_original_plane)
	layer = saved_layer
	dummy_active = TRUE

/obj/structure/annomlies_diet/echo/proc/reset_data()
	saved_name = initial(saved_name)
	saved_item = initial(saved_item)
	saved_type = initial(saved_type)
	saved_icon = initial(saved_icon)
	saved_icon_state = initial(saved_icon_state)
	saved_description = initial(saved_description)
	saved_dir = initial(saved_dir)
	saved_message = initial(saved_message)
	saved_appearance = initial(appearance)
	saved_item_state = initial(item_state)
	saved_w_class = initial(saved_w_class)
	saved_gender = initial(saved_gender)
	saved_layer = initial(saved_layer)
	saved_original_plane = initial(saved_original_plane)

/obj/structure/annomlies_diet/echo/examine(mob/user, var/distance = -1)
	if(dummy_active && saved_item && saved_message)
		to_chat(user, saved_message)
	else if(dummy_active && saved_item)
		var/message
		var/size
		if(istype(saved_item, /obj/item))
			switch(saved_w_class)
				if(ITEM_SIZE_TINY)
					size = "tiny"
				if(ITEM_SIZE_SMALL)
					size = "small"
				if(ITEM_SIZE_NORMAL)
					size = "normal-sized"
				if(ITEM_SIZE_BULKY)
					size = "bulky"
				if(ITEM_SIZE_HUGE)
					size = "huge"
				if(ITEM_SIZE_GARGANTUAN)
					size = "gargantuan"
				if(ITEM_SIZE_COLOSSAL)
					size = "colossal"
				if(ITEM_SIZE_TITANIC)
					size = "titanic"
			message += "\nIt is a [size] item."

			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				if(H.stats.getPerk(PERK_MARKET_PROF))
					message += SPAN_NOTICE("\nThis item cost: [get_item_cost(saved_item)][CREDITS]")

		var/full_name = "\a [src]."
		if(blood_DNA)
			if(saved_gender == PLURAL)
				full_name = "some "
			else
				full_name = "a "
			if(blood_color != "#030303")
				full_name += "<span class='danger'>blood-stained</span> [name]!"
			else
				full_name += "oil-stained [name]."

		if(isobserver(user))
			to_chat(user, "\icon[src] This is [full_name] [message]")
		else
			user.visible_message("<font size=1>[user.name] looks at [src].</font>", "\icon[src] This is [full_name] [message]")

		to_chat(user, show_stat_verbs()) //rewrite to show_stat_verbs(user)?

		if(desc)
			to_chat(user, desc)

		LEGACY_SEND_SIGNAL(src, COMSIG_EXAMINE, user, distance)
	else
		. = ..()

/obj/structure/annomlies_diet/echo/proc/disrupt()
	if(dummy_active)
		toggle()
		can_use = 0
		spawn(1 SECONDS)
			can_use = 1

/obj/structure/annomlies_diet/echo/attackby()
	..()
	disrupt()

/obj/structure/annomlies_diet/echo/ex_act()
	..()
	disrupt()


/obj/structure/annomlies_diet/whirli
	name = "Whirli"
	desc = "An intense vortex of air, dust and debris spirals around this area. Even just standing around it gives the intense feeling of a powerful vacuum force pulling you in."
	icon_state = "whirli"
	item_state = "whirli"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	layer = FLY_LAYER
	var/witch = 50
	var/kansists = 2
	var/redboots = 100
	var/black_and_white = 1
	alpha = 75

/obj/structure/annomlies_diet/whirli/Crossed(mob/M)
	if(M.allow_spin && src.allow_spin)
		M.SpinAnimation(10,5)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.adjustBruteLoss(witch)
		addtimer(CALLBACK(H, TYPE_PROC_REF(/atom, SpinAnimation), 3, 3), 1)
		H.stunned = black_and_white
		H.confused += kansists
		H.updatehealth()
		if(prob(redboots))
			var/obj/item/organ/external/organ = H.get_organ(pick(BP_R_LEG, BP_L_LEG, BP_R_ARM, BP_L_ARM))
			if(!organ)
				H.visible_message("<font size=1>\red[H.name] is spun around by [src].</font><\red>", "\red[src] spins you around at high speeds!")
				return
			organ.droplimb(TRUE, DISMEMBER_METHOD_EDGE)
			H.visible_message("<font size=1>\red[H.name] is spun around by [src], a sickening sound coming from a limb being ripped off by vacuum force!.</font><\red>", "\red[src] spins you around, violently ripping one of your limbs off!")
		else
			H.visible_message("<font size=1>\red[H.name] is spun around by [src].</font><\red>", "\red[src] spins you around at high speeds!")
	.=..()


/obj/structure/annomlies_diet/razer
	name = "Razer"
	desc = "Field of floating red lasers, there is a distinct smell of iron in the area around them."
	icon_state = "razer"
	item_state = "razer"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	layer = FLY_LAYER
	var/starting_culter = TRUE
	var/is_growing = TRUE
	var/spread_range = 1
	var/spread_speed_slow = 100		// Minium amount of time it takes for a grown crystal to spread
	var/spread_speed_high = 280		// Maxium amount of time it takes for a grown crystal to spread

	var/blade_runner = 100
	var/blade_sharpness_aka_damage_per_running_on_it = 5
	var/fuel = 15

	light_power = 2
	light_range = 3
	light_color = "#AA4A44"
	pixel_x = 0
	pixel_y = 0

/obj/structure/annomlies_diet/razer/New()
	..()
	set_awake()
	addtimer(CALLBACK(src, PROC_REF(spread)), spread_speed_slow)

/obj/structure/annomlies_diet/razer/non_spreader
	is_growing = FALSE
	starting_culter = FALSE

/obj/structure/annomlies_diet/razer/spreaded
	starting_culter = FALSE

/obj/structure/annomlies_diet/razer/Crossed(mob/M)
	if(ishuman(M))
		var/mob/living/carbon/human/our_cutting = M
		if(MOVING_QUICKLY(M))
			if(prob(blade_runner))
				to_chat(our_cutting, SPAN_WARNING("The red beam of light cuts into you."))
				our_cutting.adjustBruteLoss(blade_sharpness_aka_damage_per_running_on_it)
				if(!(our_cutting.species && our_cutting.species.flags & NO_BLOOD)) //We want the var for safety but we can do without the actual blood.
					our_cutting.adjustBruteLoss(blade_sharpness_aka_damage_per_running_on_it) //FPB's get hit 2x
					return
				our_cutting.drip_blood(fuel)
	.=..()

/obj/structure/annomlies_diet/razer/proc/spread()
	if(!src) //Just in case
		return
	if(!is_growing)
		return
	var/list/turf_list = list()
	var/spidersilk
	for(var/turf/T in orange(spread_range, get_turf(src)))
		if(!can_twirl_to(T))
			continue
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	if(turf_list.len)
		var/turf/T = pick(turf_list)

		spidersilk = /obj/structure/annomlies_diet/razer // We spread are basic type

		if(is_growing)
			spidersilk = /obj/structure/annomlies_diet/razer/spreaded
			if(prob(60) && !starting_culter)
				spidersilk = /obj/structure/annomlies_diet/razer/non_spreader

		if(spidersilk && is_growing)
			new spidersilk(T) // We spread
			if(prob(50) && !starting_culter)
				is_growing = FALSE

	if(spidersilk && is_growing) //Anti-lag breaking the chain
		addtimer(CALLBACK(src, PROC_REF(spread)), rand(spread_speed_slow,spread_speed_high)) //This constantly gets recalled by self. Thus to give people time to combat the shards they will get some time

// Check the given turf to see if there is any special things that would prevent the spread
/obj/structure/annomlies_diet/razer/proc/can_twirl_to(var/turf/T)
	if(T)
		if(istype(T, /turf/space)) // We can't spread in SPACE!
			return FALSE
		if(istype(T, /turf/simulated/open)) // Crystals can't float. Yet.
			return FALSE
		//Lets not stack this
		if(locate(/obj/structure/annomlies_diet/razer) in T)
			return FALSE
		if(locate(/obj/structure/annomlies_diet/spidersilk) in T) // No stacking.
			return FALSE
	return TRUE


/obj/structure/annomlies_diet/glacier
	name = "Glacier"
	desc = "Floating disk of ice, it spins slowly while never ending droplets of water form a sprite of ice underneath it. You feel as if its looking at you."
	icon_state = "icepeak"
	item_state = "icepeak"
	density = FALSE
	anchored = TRUE
	throwpass = 1
	layer = FLY_LAYER
	var/grab_timer = 90
	var/grab_timer_repeater = 120
	var/breathtakeing = 20
	var/fresh_ice = 2
	var/down_hill = 2
	var/lanth_of_ice = 3
	pixel_x = 0
	pixel_y = 0

/*
/mob/living/proc/trip(tripped_on, stun_duration)
	return FALSE
*/
/obj/structure/annomlies_diet/glacier/New()
	..()
	set_awake()
	addtimer(CALLBACK(src, PROC_REF(dramatics)), grab_timer)
	addtimer(CALLBACK(src, PROC_REF(scateing_season)), grab_timer_repeater)

/obj/structure/annomlies_diet/glacier/Crossed(mob/M)
	.=..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.slip("\the [src.name]", fresh_ice)
		H.adjustOxyLoss(breathtakeing)
		H.updatehealth()

/obj/structure/annomlies_diet/glacier/proc/ice_scateing_gone_wrong(mob/M)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		H.throw_at(src, lanth_of_ice, down_hill, src)

/obj/structure/annomlies_diet/glacier/proc/scaters_in_the_ring(mob/M)
	for(M in living_mobs_in_view(3, src))
		ice_scateing_gone_wrong(M)

/obj/structure/annomlies_diet/glacier/proc/dramatics(mob/M)
//	flick("sunshine", src)
	addtimer(CALLBACK(src, PROC_REF(scaters_in_the_ring)), 1)

/obj/structure/annomlies_diet/glacier/proc/scateing_season()
	addtimer(CALLBACK(src, PROC_REF(dramatics)), grab_timer)
	addtimer(CALLBACK(src, PROC_REF(scateing_season)), grab_timer_repeater)
