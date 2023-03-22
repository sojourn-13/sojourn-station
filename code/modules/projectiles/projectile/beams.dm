/*
Beams, they are rather harder to get armor against and dont have bullet drop off.
Thus they are objectively always going to be outclassed by bullets in their ideal use.
Beams also can pass through glass and are hitscan, thus making them great against most problems.
In pvp they also have more lasting damages, such as infections, pain form burns, and nerve damage.
*/
/obj/item/projectile/beam
	name = "Laser"
	icon_state = "laser"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage_types = list(BURN = 20)
	armor_penetration = 20 //Some AP
	check_armour = ARMOR_ENERGY
	var/frequency = 1
	hitscan = 1
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine

	recoil = 1

	muzzle_type = /obj/effect/projectile/laser/muzzle
	tracer_type = /obj/effect/projectile/laser/tracer
	impact_type = /obj/effect/projectile/laser/impact

	heat = 100

/obj/item/projectile/beam/check_penetrate(var/atom/A) // For shields to actually block projectiles
	if(istype(A, /obj/item/shield))
		var/obj/item/shield/S = A
		var/loss = round(S.durability / armor_penetration / 8)
		block_damage(loss, A)
		A.visible_message(SPAN_WARNING("\The [src] is weakened by the \the [A]!"))
		playsound(A.loc, 'sound/weapons/shield/shielddissipate.ogg', 50, 1)
		return 1
	return 0

/obj/item/projectile/beam/musket
	name = "Musket laser"
	armor_penetration = 30 //Good AP, its for slow firing weapon
	eyeblur = 1

/obj/item/projectile/beam/drone
	damage_types = list(BURN = 15)
	armor_penetration = 10 //Some AP
	recoil = 2

/obj/item/projectile/beam/pulse/drone
	damage_types = list(BURN = 10)
	armor_penetration = 5 //No AP we deal 30 damage in 3 shots

/obj/item/projectile/beam/weak
	damage_types = list(BURN = 16)
	armor_penetration = 15 //Some AP
	recoil = 2

/obj/item/projectile/beam/weak/pistol_35
	damage_types = list(BURN = 12)
	recoil = 1

/obj/item/projectile/beam/weak/light_rifle_257
	damage_types = list(BURN = 13)

/obj/item/projectile/beam/weak/rifle_75
	damage_types = list(BURN = 22)
	recoil = 4

/obj/item/projectile/beam/weak/heavy_rifle_408
	damage_types = list(BURN = 16)
	recoil = 3

/obj/item/projectile/beam/weak/magnum_40
	damage_types = list(BURN = 20)
	recoil = 3

/obj/item/projectile/beam/weak/kurtz_50
	damage_types = list(BURN = 40)
	recoil = 5

/obj/item/projectile/beam/weak/smg
	damage_types = list(BURN = 10)

/obj/item/projectile/beam/weak/smg/firestorm
	damage_types = list(BURN = 10)
	fire_stacks = 2 //So it doesn't become dumb fast

/obj/item/projectile/beam/weak/lethal
	damage_types = list(BURN = 20)
	armor_penetration = 0 //cant have negitive armor sadly

/obj/item/projectile/beam/weak/ap
	damage_types = list(BURN = 15)
	armor_penetration = 25

/obj/item/projectile/beam/weak/ap/reaver
	damage_types = list(BURN = 16.5)

/obj/item/projectile/beam/shotgun
	damage_types = list(BURN = 35) //Normal slugs deal 45
	armor_penetration = 10
	recoil = 2

/obj/item/projectile/beam/shotgun/strong
	damage_types = list(BURN = 54) // Default slug (/obj/item/projectile/bullet/shotgun) deal 54 damage
	armor_penetration = 10
	eyeblur = 4
	recoil = 4

/obj/item/projectile/beam/practice
	name = "laser"
	icon_state = "laser"
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage_types = list(BURN = 0)
	check_armour = ARMOR_ENERGY
	eyeblur = 2

/obj/item/projectile/beam/midlaser // Middle ground between better than stock but worse than heavy.
	damage_types = list(BURN = 25)
	armor_penetration = 25

/obj/item/projectile/beam/heavylaser
	name = "heavy laser"
	icon_state = "heavylaser"
	damage_types = list(BURN = 35)
	armor_penetration = 25
	eyeblur = 4
	muzzle_type = /obj/effect/projectile/laser_heavy/muzzle
	tracer_type = /obj/effect/projectile/laser_heavy/tracer
	impact_type = /obj/effect/projectile/laser_heavy/impact
	recoil = 4

/obj/item/projectile/beam/xray
	name = "x-ray beam"
	icon_state = "xray"
	damage_types = list(BURN = 25)
	armor_penetration = 40
	eyeblur = 4
	recoil = 1
	penetrating = 1 //Pierces walls
	muzzle_type = /obj/effect/projectile/xray/muzzle
	tracer_type = /obj/effect/projectile/xray/tracer
	impact_type = /obj/effect/projectile/xray/impact

/obj/item/projectile/beam/pulse
	name = "pulse"
	icon_state = "u_laser"
	damage_types = list(BURN = 40)
	armor_penetration = 25
	eyeblur = 4
	recoil = 3
	muzzle_type = /obj/effect/projectile/laser_pulse/muzzle
	tracer_type = /obj/effect/projectile/laser_pulse/tracer
	impact_type = /obj/effect/projectile/laser_pulse/impact

/obj/item/projectile/beam/pulse/on_hit(atom/target)
	if(isturf(target))
		target.ex_act(2)
	..()

/obj/item/projectile/beam/pulse/heavy
	name = "heavy pulse"
	damage_types = list(BURN = 50)
	armor_penetration = 35
	recoil = 5

/obj/item/projectile/beam/emitter
	name = "emitter beam"
	icon_state = "emitter"
	damage_types = list(BURN = 0) // The actual damage is computed in /code/modules/power/singularity/emitter.dm

	muzzle_type = /obj/effect/projectile/emitter/muzzle
	tracer_type = /obj/effect/projectile/emitter/tracer
	impact_type = /obj/effect/projectile/emitter/impact

/obj/item/projectile/beam/radiation
	name = "nuclear beam"
	icon_state = "emitter"
	damage_types = list(BURN = 40)
	armor_penetration = 30 //Experimental and extremely rare but also self recharging so take it as you will
	recoil = 7

	muzzle_type = /obj/effect/projectile/emitter/muzzle
	tracer_type = /obj/effect/projectile/emitter/tracer
	impact_type = /obj/effect/projectile/emitter/impact

/obj/item/projectile/beam/radiation/on_impact(atom/target)
	var/mob/living/M = target
	var/mob/living/carbon/human/H = M
	if(ishuman(target))
		if(istype(target, /mob/living/carbon/))
			H.apply_effect(30,IRRADIATE)//woop woop ass blast USA woop woop
	else
		return 1

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
	recoil = 4

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
	recoil = 2

/obj/item/projectile/beam/hardstun
	name = "concentrated stun beam"
	icon_state = "stun"
	nodamage = 1
	taser_effect = 1
	agony = 65 // Middle ground between an instant electrode stun and stunbeam
	damage_types = list(BURN = 0) // Just in case, this is supposed to be 100% nonlethal
	muzzle_type = /obj/effect/projectile/stun/muzzle
	tracer_type = /obj/effect/projectile/stun/tracer
	impact_type = /obj/effect/projectile/stun/impact
	eyeblur = 2 // Meant to disable people, combat advantage, agony fluff
	recoil = 3 // Low rate of fire shouldn't be a problem but let's not spam it.

//book "lasers"
/obj/item/projectile/beam/sniper/judgement
	name = "lighting"
	icon_state = "stun"
	agony = 5
	damage_types = list(BURN = 10)
	armor_penetration = 0
	eyeblur = 0

	muzzle_type = /obj/effect/projectile/stun/muzzle
	tracer_type = /obj/effect/projectile/stun/tracer
	impact_type = /obj/effect/projectile/stun/impact
	recoil = 0

/obj/item/projectile/beam/sniper/sin_within
	name = "sin"
	icon_state = "xray"
	damage_types = list(TOX = 10)
	armor_penetration = 0
	eyeblur = 0
	muzzle_type = /obj/effect/projectile/xray/muzzle
	tracer_type = /obj/effect/projectile/xray/tracer
	impact_type = /obj/effect/projectile/xray/impact
	recoil = 0

/obj/item/projectile/beam/sniper/healing
	name = "grace"
	icon_state = "xray"
	damage_types = list(TOX = 0)//Shouldnt do anything but just in case its toxin
	armor_penetration = 0
	stun = 0
	weaken = 0
	eyeblur = 0
	muzzle_type = /obj/effect/projectile/laser_blue/muzzle
	tracer_type = /obj/effect/projectile/laser_blue/tracer
	impact_type = /obj/effect/projectile/laser_blue/impact
	recoil = 0

/obj/item/projectile/beam/sniper/healing/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if (!testing)
		if(isliving(target))
			var/mob/living/L = target
			L.adjustOxyLoss(-5)
			L.adjustBruteLoss(-3)
			L.adjustFireLoss(-3)

/obj/item/projectile/beam/sniper/healing/harmony
	name = "harmony"

/obj/item/projectile/beam/sniper/healing/harmony/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if (!testing)
		if(isliving(target))
			var/mob/living/L = target
			L.adjustOxyLoss(-4)
			L.adjustBruteLoss(-2)
			L.adjustFireLoss(-2)

/obj/item/projectile/beam/tesla
	name = "lightning"
	damage_types = list(BURN = 30)
	armor_penetration = 10
	hitscan = TRUE

	muzzle_type = /obj/effect/projectile/tesla/muzzle
	tracer_type = /obj/effect/projectile/tesla/tracer
	impact_type = /obj/effect/projectile/tesla/impact
	recoil = 2

/obj/item/projectile/beam/tesla/shotgun
	kill_count = 5 // short range

/obj/item/projectile/beam/tesla/shotgun/strong
	damage_types = list(BURN = 45) // Default slug (/obj/item/projectile/bullet/shotgun) deal 54 damage
	recoil = 5

/obj/item/projectile/beam/infrared
	name = "infrared radiation"
	icon_state = "invisible"
	damage_types = list(BURN = 15)
	armor_penetration = 15 //less ap
	eyeblur = 0
	muzzle_type = null
	tracer_type = null
	impact_type = null
	heat = 500
	recoil = 4

/obj/item/projectile/beam/infrared/on_hit(atom/target)
	if(isliving(target))
		if (!testing)
			var/mob/living/L = target
			L.bodytemperature += (heat/250) * TEMPERATURE_DAMAGE_COEFFICIENT //1/5th the strength of hell ramen per tick, since you can unload with a smg
	..()
