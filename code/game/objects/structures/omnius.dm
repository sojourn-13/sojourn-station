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

/obj/structure/invislightsmall
	name = "small invisible light"
	icon = null
	layer = HIDING_MOB_PLANE
	invisibility = 101
	anchored = TRUE

/obj/structure/invislightsmall/New()
	set_light(1, 1, "#999999")
	. = ..()

/*Area Lighting Objects*/
//Things that emit light, but aren't lamps.

/obj/structure/light_stick
	icon = 'icons/obj/objects.dmi'
	icon_state = "light_stick"
	name = "marking device"
	desc = "A powerful light mounted on a metal stick, used to mark trails, landing spots, points of interest and any other potential exploration-related ventures. It's secured to the ground via an anchor."
	anchored = TRUE

/obj/structure/light_stick/New()
	set_light(3,3, "#274170")

/obj/structure/light_stick/red
	icon_state = "light_stick_red"
	name = "marking device"
	desc = "A powerful light mounted on a metal stick, used to mark trails, landing spots, points of interest and any other potential exploration-related ventures. It's secured to the ground via an anchor."
	anchored = TRUE

/obj/structure/light_stick/red/New()
	set_light(3,3, "#962b2b")

//Weather that emits ambient light. Credit to CM for weather sprites.
/obj/structure/snowfall
	icon = 'icons/effects/weather_effects.dmi'
	icon_state = "light_snow"
	name = "snowfall"
	desc = "Flakes of carbon dioxide descending from the inky black skies."
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	density = FALSE

/obj/structure/snowfall/New()
	set_light(2,2, "#4d568a")

/obj/structure/snowstorm
	icon = 'icons/effects/weather_effects.dmi'
	icon_state = "snow_storm"
	name = "snowstorm"
	desc = "Violent thrashing of flakes, caused by the winds. It makes it difficult to see"
	anchored = TRUE
	layer = ABOVE_MOB_LAYER
	density = FALSE

/obj/structure/snowstorm/New()
	set_light(2,2, "#494e6e")
