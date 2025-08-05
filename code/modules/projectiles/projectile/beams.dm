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
	armor_divisor = 1.2 //Some AP
	wounding_mult = 1.2 //and some wounding mult
	check_armor = ARMOR_ENERGY
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
		var/loss = round(S.durability / armor_divisor * 8)
		block_damage(loss, A)
		A.visible_message(SPAN_WARNING("\The [src] is weakened by the \the [A]!"))
		playsound(A.loc, 'sound/weapons/shield/shielddissipate.ogg', 50, 1)
		return FALSE
	return TRUE

/obj/item/projectile/beam/voidwolf/attack_mob(mob/living/target_mob, distance, miss_modifier=0) // No friendly firing
	if(target_mob.faction == "pirate")
		return FALSE
	else
		return ..()

/obj/item/projectile/beam/musket
	name = "Musket laser"
	armor_divisor = 2.5 //Good AP, its for slow firing weapon
	eyeblur = 1
	damage_types = list(BURN = 25) //According to Rain Chule recommendation

/obj/item/projectile/beam/drone
	damage_types = list(BURN = 15)
	armor_divisor = 1.1 //Some AP
	recoil = 2

/obj/item/projectile/beam/pulse/drone
	damage_types = list(BURN = 10)
	armor_divisor = 1 //No AP we deal 30 damage in 3 shots

/obj/item/projectile/beam/weak
	damage_types = list(BURN = 16)
	armor_divisor = 1.15 //Some AP
	recoil = 2

// Laser bullets are your premium and expensive upgrade to your traditional bullets.
// The basic design philosophy here is that they possess the AP of HV and the damge of FMJ all while having half the recoil.
// Keep in mind that laser bullets do not imbed and leave no shrapnel behind, which is stupidly lethal as of date.


// 223 is a middle ground between 408 and 75. Damage of 408, AP of 75
/obj/item/projectile/beam/laser_223
	damage_types = list(BURN = 20)
	armor_divisor = 1.5
	recoil = 5
	wounding_mult = WOUNDING_SERIOUS
	proj_color = "#009ac9"
/*
/obj/item/projectile/beam/laser_223/ap
	damage_types = list(BURN = 16)
	armor_divisor = 3
	recoil = 7
	wounding_mult = WOUNDING_NORMAL
	penetrating = 1

/obj/item/projectile/beam/laser_223/lethal
	damage_types = list(BURN = 27)
	armor_divisor = 1
	recoil = 5
	wounding_mult = WOUNDING_WIDE
*/

/obj/item/projectile/beam/weak/pistol_35
	damage_types = list(BURN = 15)
	armor_divisor = 1.5
	recoil = 2.5
	proj_color = "#009ac9"

/obj/item/projectile/beam/weak/light_rifle_257
	damage_types = list(BURN = 14)
	armor_divisor = 2
	recoil = 3.5
	proj_color = "#009ac9"

/obj/item/projectile/beam/weak/rifle_75
	damage_types = list(BURN = 15.5)
	armor_divisor = 2
	recoil = 5
	proj_color = "#009ac9"

/obj/item/projectile/beam/weak/heavy_rifle_408
	damage_types = list(BURN = 20)
	armor_divisor = 3
	recoil = 10
	proj_color = "#009ac9"

/obj/item/projectile/beam/weak/magnum_40
	damage_types = list(BURN = 19)
	armor_divisor = 2
	recoil = 4.5
	proj_color = "#009ac9"

/obj/item/projectile/beam/weak/kurz_50
	damage_types = list(BURN = 23.5)
	armor_divisor = 2
	recoil = 8
	proj_color = "#009ac9"

/obj/item/projectile/beam/weak/smg
	damage_types = list(BURN = 10)
	proj_color = "#009ac9"

/obj/item/projectile/beam/weak/smg/firestorm
	damage_types = list(BURN = 10)
	fire_stacks = 2 //So it doesn't become dumb fast
	proj_color = "#009ac9"

/obj/item/projectile/beam/weak/lethal
	damage_types = list(BURN = 20)
	armor_divisor = 1 //cant have negitive armor sadly
	proj_color = "#009ac9"

/obj/item/projectile/beam/weak/ap
	damage_types = list(BURN = 15)
	armor_divisor = 1.25

/obj/item/projectile/beam/weak/ap/reaver
	damage_types = list(BURN = 16.5)

/obj/item/projectile/beam/weak/ap/reaver/attack_mob(mob/living/target_mob, distance, miss_modifier=0) // No friendly firing
	if(target_mob.faction == "pirate")
		return FALSE
	else
		return ..()

/obj/item/projectile/beam/shotgun
	damage_types = list(BURN = 35) //Normal slugs deal 45
	armor_divisor = 1.1
	recoil = 2
	proj_color = "#009ac9"

/obj/item/projectile/beam/shotgun/strong
	damage_types = list(BURN = 54) // Default slug (/obj/item/projectile/bullet/shotgun) deal 54 damage
	armor_divisor = 1.1
	eyeblur = 4
	recoil = 4
	proj_color = "#009ac9"

/obj/item/projectile/beam/practice
	name = "laser"
	icon_state = "laser"
	pass_flags = PASSTABLE | PASSGLASS | PASSGRILLE
	damage_types = list(BURN = 0)
	check_armor = ARMOR_ENERGY
	eyeblur = 2

/obj/item/projectile/beam/midlaser // Middle ground between better than stock but worse than heavy.
	damage_types = list(BURN = 25)
	armor_divisor = 1.25

/obj/item/projectile/beam/heavylaser
	name = "heavy laser"
	icon_state = "heavylaser"
	damage_types = list(BURN = 35)
	armor_divisor = 1.5
	wounding_mult = 1.3
	eyeblur = 4
	muzzle_type = /obj/effect/projectile/laser_heavy/muzzle
	tracer_type = /obj/effect/projectile/laser_heavy/tracer
	impact_type = /obj/effect/projectile/laser_heavy/impact
	recoil = 4

/obj/item/projectile/beam/xray
	name = "x-ray beam"
	icon_state = "xray"
	damage_types = list(BURN = 25)
	armor_divisor = 2.25
	wounding_mult = 1
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
	armor_divisor = 2 //it's a pulse blast.
	wounding_mult = 1.5
	eyeblur = 4
	recoil = 3
	muzzle_type = /obj/effect/projectile/laser_pulse/muzzle
	tracer_type = /obj/effect/projectile/laser_pulse/tracer
	impact_type = /obj/effect/projectile/laser_pulse/impact

/obj/item/projectile/beam/pulse/on_hit(atom/target)
	if(!testing)
		if(isturf(target))
			target.ex_act(2)
	..()

/obj/item/projectile/beam/pulse/heavy
	name = "heavy pulse"
	damage_types = list(BURN = 50)
	armor_divisor = 2.25
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
	armor_divisor = 1.75 //Experimental and extremely rare but also self recharging so take it as you will
	recoil = 7

	muzzle_type = /obj/effect/projectile/emitter/muzzle
	tracer_type = /obj/effect/projectile/emitter/tracer
	impact_type = /obj/effect/projectile/emitter/impact

/obj/item/projectile/beam/radiation/on_impact(atom/target)
	if(!testing)
		var/mob/living/M = target
		var/mob/living/carbon/human/H = M
		if(ishuman(target))
			if(istype(target, /mob/living/carbon/))
				H.apply_effect(20,IRRADIATE)//woop woop ass blast USA woop woop
		else
			return 1

/obj/item/projectile/beam/IRKdissolver //Marking this for future use with IRK
	name = "dissolver ray"
	icon_state = "emitter"
	damage_types = list(BURN = 30) //Less burn but also less recoil
	armor_divisor = 4 //Experimental and extremely rare but also self recharging so take it as you will
	recoil = 5 //Less recoil but also less burn

	muzzle_type = /obj/effect/projectile/emitter/muzzle
	tracer_type = /obj/effect/projectile/emitter/tracer
	impact_type = /obj/effect/projectile/emitter/impact

/obj/item/projectile/beam/IRKdissolver/on_impact(atom/target)
	if(!testing)
		var/mob/living/M = target
		var/mob/living/carbon/human/H = M
		if(ishuman(target))
			if(istype(target, /mob/living/carbon/))
				H.apply_effect(35,IRRADIATE)//Irradiates more
		else
			return 1

/obj/item/projectile/beam/IRKdesolator //Marking this for future use with IRK
	name = "desolator ray"
	icon_state = "xray"
	damage_types = list(BURN = 20) //Worse Xray
	armor_divisor = 2
	eyeblur = 4
	recoil = 6
	penetrating = 1

	muzzle_type = /obj/effect/projectile/xray/muzzle
	tracer_type = /obj/effect/projectile/xray/tracer
	impact_type = /obj/effect/projectile/xray/impact

/obj/item/projectile/beam/IRKdesolator/on_impact(atom/target)
	if(!testing)
		var/mob/living/M = target
		var/mob/living/carbon/human/H = M
		if(ishuman(target))
			if(istype(target, /mob/living/carbon/))
				H.apply_effect(15,IRRADIATE)//Irradiates less but pierces walls
		else
			return 1

/obj/item/projectile/beam/sniper
	name = "sniper beam"
	icon_state = "xray"
	damage_types = list(BURN = 50)
	armor_divisor = 2
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
	armor_divisor = 1
	nodamage = 1
	taser_effect = 1
	damage_types = list(BURN = 1, HALLOSS = 30)

	muzzle_type = /obj/effect/projectile/stun/muzzle
	tracer_type = /obj/effect/projectile/stun/tracer
	impact_type = /obj/effect/projectile/stun/impact
	recoil = 2

/obj/item/projectile/beam/hardstun
	name = "concentrated stun beam"
	icon_state = "stun"
	nodamage = 1
	taser_effect = 1
	damage_types = list(BURN = 0, HALLOSS = 65) // Middle ground between an instant electrode stun and stunbeam
	muzzle_type = /obj/effect/projectile/stun/muzzle
	tracer_type = /obj/effect/projectile/stun/tracer
	impact_type = /obj/effect/projectile/stun/impact
	eyeblur = 2 // Meant to disable people, combat advantage, agony fluff
	recoil = 3 // Low rate of fire shouldn't be a problem but let's not spam it.

//book "lasers"
/obj/item/projectile/beam/sniper/judgement
	name = "lighting"
	icon_state = "stun"
	damage_types = list(BURN = 10, HALLOSS = 5)
	armor_divisor = 1
	eyeblur = 0

	muzzle_type = /obj/effect/projectile/stun/muzzle
	tracer_type = /obj/effect/projectile/stun/tracer
	impact_type = /obj/effect/projectile/stun/impact
	recoil = 0

/obj/item/projectile/beam/sniper/sin_within
	name = "sin"
	icon_state = "xray"
	damage_types = list(TOX = 10)
	armor_divisor = 1
	eyeblur = 0
	muzzle_type = /obj/effect/projectile/xray/muzzle
	tracer_type = /obj/effect/projectile/xray/tracer
	impact_type = /obj/effect/projectile/xray/impact
	recoil = 0

/obj/item/projectile/beam/sniper/healing
	name = "grace"
	icon_state = "xray"
	damage_types = list(TOX = 0)//Shouldnt do anything but just in case its toxin
	armor_divisor = 1
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
	armor_divisor = 1.1
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
	armor_divisor = 1.25 //less ap
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
