/*
Beams, they are rather harder to get armor against and dont have bullet drop off.
Thus they are objectively always going to be outclassed by bullets in their idea use.
Beams also can pass thought glass and are hitscan, thus making them great against most problems.
In pvp they also have more lasting damages, such as infections, and pain form burns.
*/
/obj/item/projectile/beam
	name = "laser"
	icon_state = "laser"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage_types = list(BURN = 20)
	check_armour = ARMOR_ENERGY
	var/frequency = 1
	hitscan = 1
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine

	muzzle_type = /obj/effect/projectile/laser/muzzle
	tracer_type = /obj/effect/projectile/laser/tracer
	impact_type = /obj/effect/projectile/laser/impact

	heat = 100

/obj/item/projectile/beam/weak
	damage_types = list(BURN = 16)

/obj/item/projectile/beam/weak/pistol_35
	damage_types = list(BURN = 12)

/obj/item/projectile/beam/weak/light_rifle_257
	damage_types = list(BURN = 13)

/obj/item/projectile/beam/weak/rifle_75
	damage_types = list(BURN = 22)

/obj/item/projectile/beam/weak/heavy_rifle_408
	damage_types = list(BURN = 16)

/obj/item/projectile/beam/weak/magnum_40
	damage_types = list(BURN = 20)

/obj/item/projectile/beam/weak/kurtz_50
	damage_types = list(BURN = 40)

/obj/item/projectile/beam/weak/smg
	damage_types = list(BURN = 10)

/obj/item/projectile/beam/weak/lethal
	damage_types = list(BURN = 20)
	armor_penetration = 0 //cant have negitive armor sadly

/obj/item/projectile/beam/weak/ap
	damage_types = list(BURN = 15)
	armor_penetration = 20

/obj/item/projectile/beam/shotgun
	damage_types = list(BURN = 35) //Normal slugs deal 45
	armor_penetration = 10

/obj/item/projectile/beam/shotgun/strong
	damage_types = list(BURN = 54) // Default slug (/obj/item/projectile/bullet/shotgun) deal 54 damage
	armor_penetration = 10
	eyeblur = 4

/obj/item/projectile/beam/practice
	name = "laser"
	icon_state = "laser"
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage_types = list(BURN = 0)
	check_armour = ARMOR_ENERGY
	eyeblur = 2

/obj/item/projectile/beam/midlaser
	damage_types = list(BURN = 20)
	armor_penetration = 10

/obj/item/projectile/beam/heavylaser
	name = "heavy laser"
	icon_state = "heavylaser"
	damage_types = list(BURN = 35)
	armor_penetration = 25
	eyeblur = 4
	muzzle_type = /obj/effect/projectile/laser_heavy/muzzle
	tracer_type = /obj/effect/projectile/laser_heavy/tracer
	impact_type = /obj/effect/projectile/laser_heavy/impact

/obj/item/projectile/beam/xray
	name = "xray beam"
	icon_state = "xray"
	damage_types = list(BURN = 25)
	armor_penetration = 40
	eyeblur = 4
	muzzle_type = /obj/effect/projectile/xray/muzzle
	tracer_type = /obj/effect/projectile/xray/tracer
	impact_type = /obj/effect/projectile/xray/impact

/obj/item/projectile/beam/pulse
	name = "pulse"
	icon_state = "u_laser"
	damage_types = list(BURN = 40)
	armor_penetration = 25
	eyeblur = 4
	muzzle_type = /obj/effect/projectile/laser_pulse/muzzle
	tracer_type = /obj/effect/projectile/laser_pulse/tracer
	impact_type = /obj/effect/projectile/laser_pulse/impact

/obj/item/projectile/beam/pulse/on_hit(atom/target)
	if(isturf(target))
		target.ex_act(2)
	..()

/obj/item/projectile/beam/emitter
	name = "emitter beam"
	icon_state = "emitter"
	damage_types = list(BURN = 0) // The actual damage is computed in /code/modules/power/singularity/emitter.dm

	muzzle_type = /obj/effect/projectile/emitter/muzzle
	tracer_type = /obj/effect/projectile/emitter/tracer
	impact_type = /obj/effect/projectile/emitter/impact

/obj/item/projectile/beam/sniper
	name = "sniper beam"
	icon_state = "xray"
	damage_types = list(BURN = 50)
	armor_penetration = 40
	//stun = 3
	//weaken = 3
	//stutter = 3
	eyeblur = 4
	muzzle_type = /obj/effect/projectile/xray/muzzle
	tracer_type = /obj/effect/projectile/xray/tracer
	impact_type = /obj/effect/projectile/xray/impact

/obj/item/projectile/beam/stun
	name = "stun beam"
	icon_state = "stun"
	nodamage = 1
	taser_effect = 1
	agony = 30
	damage_types = list(BURN = 1)

	muzzle_type = /obj/effect/projectile/stun/muzzle
	tracer_type = /obj/effect/projectile/stun/tracer
	impact_type = /obj/effect/projectile/stun/impact

//book "lasers"
/obj/item/projectile/beam/sniper/judgement
	name = "lighting"
	icon_state = "stun"
	agony = 5
	damage_types = list(BURN = 10)
	armor_penetration = 0


	muzzle_type = /obj/effect/projectile/stun/muzzle
	tracer_type = /obj/effect/projectile/stun/tracer
	impact_type = /obj/effect/projectile/stun/impact

/obj/item/projectile/beam/sniper/sin_within
	name = "sin"
	icon_state = "xray"
	damage_types = list(TOX = 10)
	armor_penetration = 0

	muzzle_type = /obj/effect/projectile/xray/muzzle
	tracer_type = /obj/effect/projectile/xray/tracer
	impact_type = /obj/effect/projectile/xray/impact

/obj/item/projectile/beam/sniper/healing
	name = "grace"
	icon_state = "xray"
	damage_types = list(TOX = 0)//Shouldnt do anything but just in case its toxin
	armor_penetration = 0
	stun = 0
	weaken = 0

	muzzle_type = /obj/effect/projectile/laser_blue/muzzle
	tracer_type = /obj/effect/projectile/laser_blue/tracer
	impact_type = /obj/effect/projectile/laser_blue/impact

/obj/item/projectile/beam/sniper/healing/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isliving(target))
		var/mob/living/L = target
		L.adjustOxyLoss(-10)
		L.adjustToxLoss(-5)
		L.adjustBruteLoss(-5)
		L.adjustFireLoss(-5)

/obj/item/projectile/beam/tesla
	name = "lightning"
	damage_types = list(BURN = 30)
	armor_penetration = 10
	hitscan = TRUE

	muzzle_type = /obj/effect/projectile/tesla/muzzle
	tracer_type = /obj/effect/projectile/tesla/tracer
	impact_type = /obj/effect/projectile/tesla/impact

/obj/item/projectile/beam/tesla/shotgun
	kill_count = 5 // short range

/obj/item/projectile/beam/tesla/shotgun/strong
	damage_types = list(BURN = 45) // Default slug (/obj/item/projectile/bullet/shotgun) deal 54 damage
