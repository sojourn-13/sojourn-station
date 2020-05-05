//There are important things regarding this file:
//Rubbers are non sharp, embed capable objects, with non existing armor penetration. Their agony damage is generally lower then actual one.
//The caliber amount was lowered for a reason, don't add more bloat. If you need different values, use gun vars.
//HV exist as antag option for better ammo.
//* Step delays - default value is 1. Lower value makes bullet go faster, higher value makes bullet go slower.



//Low-caliber pistols and SMGs
//*********************************//
///.35 Auto///
/obj/item/projectile/bullet/pistol
	damage = 20
	armor_penetration = 5
	step_delay = 0.75
	can_ricochet = TRUE

/obj/item/projectile/bullet/pistol/rubber
	name = "rubber bullet"
	damage = 3
	agony = 22
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/pistol/hv
	damage = 22
	armor_penetration = 10
	step_delay = 0.5
	can_ricochet = TRUE

/obj/item/projectile/bullet/pistol/practice
	name = "practice bullet"
	damage = 2
	agony = 3
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 0.75
	can_ricochet = FALSE

/obj/item/projectile/bullet/pistol/lethal
	name = "hollow-point bullet"
	damage = 20
	agony = 20
	armor_penetration = 10
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.55


//Revolvers and high-caliber pistols
//*********************************//
/// .40 Magnum ///

/obj/item/projectile/bullet/magnum
	damage = 28
	armor_penetration = 15
	can_ricochet = TRUE
	step_delay = 0.75

/obj/item/projectile/bullet/magnum/practice
	name = "practice bullet"
	damage = 2
	agony = 3
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.75

/obj/item/projectile/bullet/magnum/hv
	damage = 28
	armor_penetration = 25
	penetrating = 1
	step_delay = 0.5

/obj/item/projectile/bullet/magnum/rubber
	name = "rubber bullet"
	damage = 8
	agony = 30
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 0.9

/obj/item/projectile/bullet/magnum/lethal
	name = "hollow-point bullet"
	damage = 26
	agony = 32
	armor_penetration = 8
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5

/// .50 Kurtz ///
obj/item/projectile/bullet/kurtz
	damage = 36
	armor_penetration = 10
	can_ricochet = TRUE
	step_delay = 0.75

/obj/item/projectile/bullet/kurtz/rubber
	name = "rubber bullet"
	damage = 8
	agony = 32
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.9

/obj/item/projectile/bullet/kurtz/practice
	name = "practice bullet"
	damage = 2
	agony = 3
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.75

/obj/item/projectile/bullet/kurtz/lethal
	name = "hollow-point bullet"
	damage = 32
	agony = 32
	armor_penetration = 5
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.8

/obj/item/projectile/bullet/kurtz/hv
	name = "AP bullet"
	damage = 25
	armor_penetration = 20
	penetrating = 2
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5


//Carbines and rifles
//*********************************//

/// .257 Carbine///

/obj/item/projectile/bullet/lrifle
	damage = 20
	armor_penetration = 20
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3

/obj/item/projectile/bullet/lrifle/practice
	name = "practice bullet"
	damage = 2
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.5

/obj/item/projectile/bullet/lrifle/hv
	damage = 18
	armor_penetration = 24
	penetrating = 2
	hitscan = TRUE

/obj/item/projectile/bullet/lrifle/rubber
	name = "rubber bullet"
	damage = 3
	agony = 20
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.9

/obj/item/projectile/bullet/lrifle/lethal
	name = "hollow-point bullet"
	damage = 18
	agony = 20
	armor_penetration = 10
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.6

/obj/item/projectile/bullet/lrifle/nomuzzle
	muzzle_type = null

///7.5 Rifle///

/obj/item/projectile/bullet/rifle
	damage = 28
	armor_penetration = 24
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.5

/obj/item/projectile/bullet/rifle/hv
	damage = 25
	armor_penetration = 30
	penetrating = 2
	can_ricochet = TRUE
	step_delay = 0.3

/obj/item/projectile/bullet/rifle/practice
	name = "practice bullet"
	damage = 2
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/rifle/rubber
	name = "rubber bullet"
	damage = 4
	agony = 26
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.9

/obj/item/projectile/bullet/rifle/lethal
	name = "hollow-point bullet"
	damage = 23
	agony = 28
	armor_penetration = 10
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.8

/// .408 OMNI ///

/obj/item/projectile/bullet/hrifle
	damage = 28
	armor_penetration = 30
	penetrating = 2
	can_ricochet = TRUE
	step_delay = 0.3

/obj/item/projectile/bullet/hrifle/rubber
	name = "rubber bullet"
	damage = 8
	agony = 32
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.9

/obj/item/projectile/bullet/hrifle/practice
	name = "practice bullet"
	damage = 2
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.5

/obj/item/projectile/bullet/hrifle/hv
	name = "sabot penetrator"
	damage = 24
	armor_penetration = 40
	penetrating = 3
	hitscan = TRUE

/obj/item/projectile/bullet/hrifle/lethal
	name = "hollow-point bullet"
	damage = 32
	agony = 32
	armor_penetration = 10
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5

///Snowflake caseless///

/obj/item/projectile/bullet/c10x24
	damage = 16
	armor_penetration = 25
	penetrating = 2
	can_ricochet = TRUE
	sharp = TRUE
	step_delay = 0.3

//Sniper rifles
/obj/item/projectile/bullet/antim
	damage = 150
	armor_penetration = 90
	stun = 5
	weaken = 10
	penetrating = 5
	hitscan = TRUE //so the PTR isn't useless as a sniper weapon

//Shotguns
//*********************************//

/obj/item/projectile/bullet/shotgun
	name = "slug"
	icon_state = "slug"
	damage = 54
	armor_penetration = 10
	knockback = 1
	step_delay = 0.9

/obj/item/projectile/bullet/shotgun/beanbag		//because beanbags are not bullets
	name = "beanbag"
	icon_state = "buckshot"
	check_armour = ARMOR_MELEE
	damage = 12
	agony = 60
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 1.65

/obj/item/projectile/bullet/shotgun/practice
	name = "practice slug"
	damage = 4
	agony = 5
	armor_penetration = 0
	embed = FALSE
	knockback = 0

/obj/item/projectile/bullet/shotgun/incendiary
	damage = 15
	agony = 5
	armor_penetration = 0
	embed = FALSE
	knockback = 0
	var/fire_stacks = 4

/obj/item/projectile/bullet/shotgun/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

//Should do about 80 damage at 1 tile distance (adjacent), and 50 damage at 3 tiles distance.
//Overall less damage than slugs in exchange for more damage at very close range and more embedding
/obj/item/projectile/bullet/pellet/shotgun
	name = "shrapnel"
	icon_state = "birdshot-1"
	damage = 12
	pellets = 8
	range_step = 1
	spread_step = 10
	knockback = 1
	step_delay = 0.9

/obj/item/projectile/bullet/pellet/shotgun/Initialize()
	. = ..()
	icon_state = "birdshot-[rand(1,4)]"

//Miscellaneous
/obj/item/projectile/bullet/blank
	invisibility = 101
	damage = 1
	embed = FALSE

/obj/item/projectile/bullet/cap
	name = "cap"
	damage_type = HALLOSS
	nodamage = TRUE
	damage = 0
	embed = FALSE
	sharp = FALSE