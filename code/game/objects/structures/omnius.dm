/obj/structure/ominous
	name = "ominous generator"
	icon_state = "ominous"
	desc = "It looks like an ancient and strange generator."
	icon = 'icons/obj/machines/excelsior/objects.dmi'
	var/cooldown = FALSE
	var/entropy_value = 3

/obj/structure/ominous/attack_hand(mob/living/user as mob)
	var/last_use

	if(world.time < last_use + 46 SECONDS)
		return
	last_use = world.time
	emp_in(src.loc, 1, 1, 0)

/obj/structure/ominous/proc/emp_in(turf/epicenter, heavy_range, light_range, log=0)
	for(var/mob/M in range(heavy_range, epicenter))
		playsound(loc, 'sound/effects/EMPulse.ogg')

	for(var/atom/T in range(light_range, epicenter))
		var/distance = get_dist(epicenter, T)
		if(distance <= heavy_range)
			T.emp_act(1)
	return TRUE

/obj/structure/ominous/emitter/proc/shoot()
	if(shooting == FALSE)
		shooting = TRUE
		while(cooldown < 80)
			cooldown++
			sleep(rand(1,2))
			var/obj/item/projectile/beam/emitter/A = new /obj/item/projectile/beam/emitter( src.loc )
			A.damage_types = list(BURN = round(2000/DAMAGE_POWER_TRANSFER))
			A.launch( get_step(src.loc, pick(SOUTH, NORTH, WEST, EAST, SOUTHEAST, SOUTHWEST, NORTHEAST, NORTHWEST)) )
		cooldown = FALSE
	shooting = FALSE

/obj/structure/ominous/emitter
	var/shooting = FALSE

/obj/structure/ominous/emitter/attack_hand(mob/living/user as mob)
	shoot()

/obj/structure/ominous/teleporter

/obj/structure/ominous/teleporter/proc/teleport()
	for(var/mob/living/carbon/human/H in range(7, src))
		go_to_bluespace(get_turf(src), entropy_value, FALSE, H, locate(x + rand(-14, 14), y + rand(-14, 14), z))

/obj/structure/ominous/teleporter/attack_hand(mob/living/user as mob)
	var/last_use

	if(world.time < last_use + 66 SECONDS)
		return
	last_use = world.time
	teleport()

///////////////*Large Invislights*///////////////////

/*Base Invislight*/

/obj/structure/invislight
	name = "invisible light"
	desc = "You should not be able to see this. Contact the nearest bluespace tech."
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislight/New()
	set_light(7, 5, "#999999")
	. = ..()

/*Colored Invislights (RGB+Y)*/

/obj/structure/invislight/blue
	name = "invisible light"
	desc = "You should not be able to see this. Contact the nearest bluespace tech."
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislight/blue/New()
	set_light(7, 5, "#4a48ac")
	. = ..()

/obj/structure/invislight/red
	name = "invisible light"
	desc = "You should not be able to see this. Contact the nearest bluespace tech."
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislight/red/New()
	set_light(7, 5, "#ac4848")
	. = ..()

/obj/structure/invislight/green
	name = "invisible light"
	desc = "You should not be able to see this. Contact the nearest bluespace tech."
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislight/green/New()
	set_light(7, 5, "#5cac48")
	. = ..()

/obj/structure/invislight/yellow
	name = "invisible light"
	desc = "You should not be able to see this. Contact the nearest bluespace tech."
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislight/yellow/New()
	set_light(7, 5, "#aca248")
	. = ..()

///////////////*Small Invislights*///////////////////

/*Base Invislight*/

/obj/structure/invislightsmall
	name = "small invisible light"
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislightsmall/New()
	set_light(1, 1, "#999999")
	. = ..()

/*Colored Invislights (RGB+Y)*/

/obj/structure/invislightsmall/blue
	name = "small invisible light"
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislightsmall/blue/New()
	set_light(1, 1, "#4a48ac")
	. = ..()

/obj/structure/invislightsmall/red
	name = "small invisible light"
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislightsmall/red/New()
	set_light(1, 1, "#ac4848")
	. = ..()

/obj/structure/invislightsmall/green
	name = "small invisible light"
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislightsmall/green/New()
	set_light(1, 1, "#5cac48")
	. = ..()

/obj/structure/invislightsmall/yellow
	name = "small invisible light"
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislightsmall/yellow/New()
	set_light(1, 1, "#aca248")
	. = ..()
