//There are important things regarding this file:
//Rubbers are non sharp, embed capable objects, with non existing armor penetration. Their agony damage is generally lower then actual one.
//The caliber amount was lowered for a reason, don't add more bloat. If you need different values, use gun vars.
//HV exist as antag option for better ammo.
//* Step delays - default value is 1. Lower value makes bullet go faster, higher value makes bullet go slower.

//Low-caliber pistols and SMGs
//*********************************//
///.35 Auto///
/obj/item/projectile/bullet/pistol_35
	damage_types = list(BRUTE = 16)
	armor_penetration = 5
	step_delay = 0.65
	can_ricochet = TRUE

	affective_damage_range = 2
	affective_ap_range = 2

/obj/item/projectile/bullet/pistol_35/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 3)
	agony = 22
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/pistol_35/rubber/soporific
	name = "soporific coated rubber bullet"

/obj/item/projectile/bullet/pistol_35/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			L.reagents.add_reagent("stoxin", 2)

/obj/item/projectile/bullet/pistol_35/hv
	damage_types = list(BRUTE = 20)
	armor_penetration = 10
	step_delay = 0.5
	affective_damage_range = 4
	affective_ap_range = 4
	can_ricochet = TRUE

/obj/item/projectile/bullet/pistol_35/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 1)
	agony = 3
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 0.75
	can_ricochet = FALSE

/obj/item/projectile/bullet/pistol_35/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 18)
	agony = 20
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.65

/obj/item/projectile/bullet/pistol_35/scrap
	damage_types = list(BRUTE = 12)
	armor_penetration = 0

	affective_damage_range = 1
	affective_ap_range = 1

//Revolvers and high-caliber pistols
//*********************************//
/// .40 Magnum ///

/obj/item/projectile/bullet/magnum_40
	damage_types = list(BRUTE = 24)
	armor_penetration = 10
	can_ricochet = TRUE
	step_delay = 0.4

	affective_damage_range = 3
	affective_ap_range = 3

/obj/item/projectile/bullet/magnum_40/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 3
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.4

/obj/item/projectile/bullet/magnum_40/hv
	damage_types = list(BRUTE = 28)
	armor_penetration = 25
	penetrating = 1
	step_delay = 0.25
	nocap_structures = TRUE //Door breaching
	affective_damage_range = 4
	affective_ap_range = 4

/obj/item/projectile/bullet/magnum_40/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 5)
	agony = 30
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 0.5

/obj/item/projectile/bullet/magnum_40/rubber/soporific
	name = "soporific coated rubber bullet"

/obj/item/projectile/bullet/magnum_40/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			L.reagents.add_reagent("stoxin", 3)

/obj/item/projectile/bullet/magnum_40/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 26)
	agony = 32
	armor_penetration = 5
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5

/obj/item/projectile/bullet/magnum_40/scrap
	damage_types = list(BRUTE = 20)
	armor_penetration = 5
	affective_damage_range = 1
	affective_ap_range = 1

/// .50 Kurtz ///
/obj/item/projectile/bullet/kurtz_50
	damage_types = list(BRUTE = 30)
	armor_penetration = 20
	can_ricochet = TRUE
	embed = TRUE
	step_delay = 0.65
	affective_damage_range = 3
	affective_ap_range = 3

/obj/item/projectile/bullet/kurtz_50/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 8)
	agony = 35
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	can_ricochet = TRUE
	step_delay = 0.75

/obj/item/projectile/bullet/kurtz_50/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 3
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	step_delay = 0.75

/obj/item/projectile/bullet/kurtz_50/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 35)
	agony = 35
	armor_penetration = 5
	penetrating = 0
	can_ricochet = FALSE
	step_delay = 0.8

/obj/item/projectile/bullet/kurtz_50/hv
	name = "AV bullet"
	damage_types = list(BRUTE = 40)
	armor_penetration = 25
	penetrating = 2
	can_ricochet = FALSE
	step_delay = 0.45
	affective_damage_range = 4
	affective_ap_range = 4
	nocap_structures = TRUE //We can breach doors rather well


//Carbines and rifles
//*********************************//

/// .257 Carbine///

/obj/item/projectile/bullet/light_rifle_257
	damage_types = list(BRUTE = 22)
	armor_penetration = 15
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 7
	affective_ap_range = 7

/obj/item/projectile/bullet/light_rifle_257/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.5

/obj/item/projectile/bullet/light_rifle_257/hv
	damage_types = list(BRUTE = 26)
	armor_penetration = 24
	penetrating = 2
	hitscan = TRUE
	affective_damage_range = 8 //Can snipe
	affective_ap_range = 8
	nocap_structures = TRUE //RATARATARAT down a door

/obj/item/projectile/bullet/light_rifle_257/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 3)
	agony = 20
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.9

/obj/item/projectile/bullet/light_rifle_257/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 24)
	agony = 20
	armor_penetration = 5
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.6

/obj/item/projectile/bullet/light_rifle_257/scrap
	damage_types = list(BRUTE = 18)
	armor_penetration = 7
	affective_damage_range = 4
	affective_ap_range = 4

/obj/item/projectile/bullet/light_rifle_257/nomuzzle
	muzzle_type = null

///7.5 Rifle///

/obj/item/projectile/bullet/rifle_75
	damage_types = list(BRUTE = 26)
	armor_penetration = 20
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.5
	affective_damage_range = 5
	affective_ap_range = 5

/obj/item/projectile/bullet/rifle_75/hv
	damage_types = list(BRUTE = 25)
	armor_penetration = 30
	penetrating = 2
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 7
	affective_ap_range = 7
	nocap_structures = TRUE //Helps against walls and doors

/obj/item/projectile/bullet/rifle_75/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/rifle_75/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 4)
	agony = 26
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.9

/obj/item/projectile/bullet/rifle_75/rubber/soporific
	name = "soporific coated rubber bullet"

/obj/item/projectile/bullet/rifle_75/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			L.reagents.add_reagent("stoxin", 1)

/obj/item/projectile/bullet/rifle_75/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 25)
	agony = 28
	armor_penetration = 5
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.8

/obj/item/projectile/bullet/rifle_75/scrap
	damage_types = list(BRUTE = 22)
	armor_penetration = 10
	affective_damage_range = 2
	affective_ap_range = 2

/// .408 OMNI ///

/obj/item/projectile/bullet/heavy_rifle_408
	damage_types = list(BRUTE = 28)
	armor_penetration = 30
	penetrating = 2
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 8
	affective_ap_range = 8

/obj/item/projectile/bullet/heavy_rifle_408/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 10)
	agony = 32
	check_armour = ARMOR_MELEE
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.9

/obj/item/projectile/bullet/heavy_rifle_408/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.5

/obj/item/projectile/bullet/heavy_rifle_408/hv
	name = "sabot penetrator"
	damage_types = list(BRUTE = 32)
	armor_penetration = 40
	penetrating = 3
	hitscan = TRUE
	affective_damage_range = 9 //Sniping cal
	affective_ap_range = 9
	nocap_structures = TRUE //anit-wall/door

/obj/item/projectile/bullet/heavy_rifle_408/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 30)
	agony = 32
	armor_penetration = 15 //Half of normal
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5

/obj/item/projectile/bullet/heavy_rifle_408/scrap
	damage_types = list(BRUTE = 20)
	armor_penetration = 15 //half  of normal
	affective_damage_range = 3
	affective_ap_range = 3

///Snowflake caseless///

/obj/item/projectile/bullet/c10x24
	damage_types = list(BRUTE = 18)
	armor_penetration = 15
	penetrating = 2
	can_ricochet = TRUE
	sharp = TRUE
	step_delay = 0.3
	affective_damage_range = 9
	affective_ap_range = 9

//Sniper rifles
/obj/item/projectile/bullet/antim
	damage_types = list(BRUTE = 90)
	armor_penetration = 100
	nocap_structures = TRUE
	//stun = 5
	//weaken = 10
	penetrating = 5
	hitscan = TRUE //so the PTR isn't useless as a sniper weapon
	affective_damage_range = 10
	affective_ap_range = 10

/obj/item/projectile/bullet/antim/lethal
	damage_types = list(BRUTE = 60)
	embed = TRUE
	armor_penetration = 60
	agony = 70
	penetrating = 2
	affective_damage_range = 9
	affective_ap_range = 9

/obj/item/projectile/bullet/antim/scrap
	damage_types = list(BRUTE = 63)
	armor_penetration = 50
	affective_damage_range = 8
	affective_ap_range = 8

/obj/item/projectile/bullet/antim/ion
	damage_types = list(BRUTE = 40)
	armor_penetration = 40

/obj/item/projectile/bullet/antim/ion/on_impact(atom/target, blocked = FALSE)
	. = ..()
	empulse(target, 1, 3)

//smoothbore rifles
/obj/item/projectile/bullet/ball
	nocap_structures = TRUE
	damage_types = list(BRUTE = 60) //Grab me musket as the founding fathers intended
	armor_penetration = 250 //It's a little jenk, but this makes it super effective against mobs while only middle against players given its slow shot pattern. -Kaz
	agony = 60
	penetrating = 2
	hitscan = TRUE //It's a bullet, but its hitscan as its only used by snipers.
	affective_damage_range = 12
	affective_ap_range = 12 //Good rifling!

//Shotguns
//*********************************//

/obj/item/projectile/bullet/shotgun
	name = "slug"
	icon_state = "slug"
	damage_types = list(BRUTE = 54)
	armor_penetration = 25
	knockback = 0 //Bug doups hits
	step_delay = 0.9
	//Slugs are meant for long range shooting
	affective_damage_range = 5
	affective_ap_range = 8

/obj/item/projectile/bullet/shotgun/beanbag
	name = "beanbag"
	icon_state = "rubber"
	damage_types = list(BRUTE = 10)
	agony = 60
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 1.65
	affective_damage_range = 1
	affective_ap_range = 2

/obj/item/projectile/bullet/shotgun/beanbag/soporific
	name = "soporific coated beanbag"

/obj/item/projectile/bullet/shotgun/beanbag/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			L.reagents.add_reagent("stoxin", 5)

/obj/item/projectile/bullet/shotgun/practice
	name = "practice slug"
	damage_types = list(BRUTE = 4)
	agony = 5
	armor_penetration = 0
	embed = FALSE
	affective_damage_range = 1
	affective_ap_range = 1

/obj/item/projectile/bullet/shotgun/incendiary
	//This is the best ammo for pvp in a shotgun, beating the stunshell with its pain and cooks anyone in any armor!
	damage_types = list(BURN = 45) //We deal most of are damage with fire stacks
	var/fire_stacks = 4 //40 pain a fire proc through ALL armor!

/obj/item/projectile/bullet/shotgun/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/shotgun/scrap
	damage_types = list(BRUTE = 48)
	armor_penetration = 5
	affective_damage_range = 3
	affective_ap_range = 4

/obj/item/projectile/bullet/shotgun/beanbag/scrap
	damage_types = list(BRUTE = 9)
	agony = 55
	affective_damage_range = 1
	affective_ap_range = 1

/obj/item/projectile/bullet/pellet/shotgun/scrap
	damage_types = list(BRUTE = 9)
	affective_damage_range = 4
	affective_ap_range = 4

//Railgun
/obj/item/projectile/bullet/shotgun/railgun
	nocap_structures = TRUE
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10

/obj/item/projectile/bullet/shotgun/beanbag/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10

/obj/item/projectile/bullet/shotgun/incendiary/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10

/obj/item/projectile/bullet/kurtz_50/railgun
	nocap_structures = TRUE
	hitscan = TRUE
	can_ricochet = FALSE

/obj/item/projectile/bullet/kurtz_50/rubber/railgun
	hitscan = TRUE
	can_ricochet = FALSE

/obj/item/projectile/bullet/kurtz_50/incendiary
	damage_types = list(BRUTE = 10)
	agony = 5
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	knockback = 0
	var/fire_stacks = 4

/obj/item/projectile/bullet/kurtz_50/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

/obj/item/projectile/bullet/heavy_rifle_408/railgun
	can_ricochet = FALSE
	icon_state = "toxin"

/obj/item/projectile/bullet/lrifle/incendiary
	icon_state = "fireball"
	damage_types = list(BURN = 7)
	agony = 5
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	knockback = 0
	var/fire_stacks = 4

/obj/item/projectile/bullet/lrifle/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

//Should do about 68 damage at 1 tile distance (adjacent), and 40 damage at 3 tiles distance.
//Overall less damage than slugs in exchange for more damage at very close range and more embedding
/obj/item/projectile/bullet/pellet/shotgun
	name = "shrapnel"
	icon_state = "birdshot-1"
	damage_types = list(BRUTE = 18)
	pellets = 4
	range_step = 1
	spread_step = 10
	knockback = 0 //We do not knockback do to issues with bullet douping
	step_delay = 0.9
	affective_damage_range = 1
	affective_ap_range = 1

/obj/item/projectile/bullet/pellet/shotgun/Initialize()
	. = ..()
	icon_state = "birdshot-[rand(1,4)]"

//'Laser' buckshot. Effectively just burn buckshot used for the Abdication.
/obj/item/projectile/bullet/pellet/shotgun/energy
	name = "Unstable energy bolt"
	icon_state = "l_birdshot-1"
	damage_types = list(BURN = 13) //slightly less than buck, but FAR more painful
	armor_penetration = 10 //heated shot melt armor.
	embed = FALSE
	can_ricochet = FALSE
	sharp = FALSE
	muzzle_type = /obj/effect/projectile/plasma/muzzle
	color = "#9D2300"
	check_armour = ARMOR_ENERGY

//For the love of God don't make this common.
/obj/item/projectile/bullet/shotgun/payload
	name = "explosive bolt"
	icon_state = "bolter"
	damage_types = list(BRUTE = 30)
	agony = 5
	knockback = 1
	var/fire_stacks = 2
	armor_penetration = 10
	nocap_structures = TRUE
	check_armour = ARMOR_BOMB
	sharp = TRUE
	edge = TRUE
	step_delay = 0.9

/obj/item/projectile/bullet/shotgun/payload/on_impact(atom/target)
	explosion(target, 0, 0, 3)
	return TRUE
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()

//Miscellaneous
/obj/item/projectile/bullet/blank
	invisibility = 101
	damage_types = list(BRUTE = 1)
	embed = FALSE

/obj/item/projectile/bullet/cap
	name = "cap"
	damage_types = list(HALLOS = 0)
	nodamage = TRUE
	embed = FALSE
	sharp = FALSE

/obj/item/projectile/bullet/crossbow_bolt
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 54)
	armor_penetration = 10
	knockback = 0 //Bug doups hits
	step_delay = 0.9
	affective_damage_range = 7
	affective_ap_range = 7


/obj/item/projectile/bullet/crossbow_bolt/lethal
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 56)
	agony = 22
	armor_penetration = 5
	step_delay = 0.9

/obj/item/projectile/bullet/crossbow_bolt/hv
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 58)
	armor_penetration = 40
	penetrating = 3
	hitscan = TRUE
	affective_damage_range = 9
	affective_ap_range = 9
	nocap_structures = TRUE //Can do well againt walls and doors
