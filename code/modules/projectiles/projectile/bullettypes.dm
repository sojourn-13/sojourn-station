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

/obj/item/projectile/bullet/pistol_35/rubber/soporific/cbo
	name = "soporific condensed plastic bullet"
	damage_types = list(BRUTE = 0)
	agony = 25

/obj/item/projectile/bullet/pistol_35/rubber/soporific/cbo/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			L.reagents.add_reagent("stoxin", 5)


/obj/item/projectile/bullet/pistol_35/hv
	damage_types = list(BRUTE = 10)
	armor_penetration = 20
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
	damage_types = list(BRUTE = 22)
	agony = 18
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

/obj/item/projectile/bullet/pistol_35/biomatter
	name = "biomatter bullet"
	damage_types = list(TOX = 18)
	agony = 20
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.65
	check_armour = ARMOR_BIO

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
	damage_types = list(BRUTE = 20)
	armor_penetration = 33
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

/obj/item/projectile/bullet/magnum_40/rubber/pepperball
	name = "pepperball"
	damage_types = list(brute = 0)
	agony = 0
	step_delay = 0.6 //a little slower than rubber rounds - these are just pepperspray balls
	var/spray = "condensedcapsaicin"

/obj/item/projectile/bullet/magnum_40/rubber/pepperball/New()
	..()
	create_reagents(5)
	reagents.add_reagent(spray, 5)

/obj/item/projectile/bullet/magnum_40/rubber/pepperball/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			reagents.trans_to_mob(L, 5, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/magnum_40/rubber/soporific
	name = "soporific coated rubber bullet"

/obj/item/projectile/bullet/magnum_40/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			L.reagents.add_reagent("stoxin", 3)

/obj/item/projectile/bullet/magnum_40/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 29)
	agony = 32
	armor_penetration = 0
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

/obj/item/projectile/bullet/magnum_40/biomatter
	name = "biomatter bullet"
	damage_types = list(TOX = 26)
	agony = 32
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.65
	check_armour = ARMOR_BIO

/// .50 Kurtz ///
/obj/item/projectile/bullet/kurtz_50
	damage_types = list(BRUTE = 35)
	armor_penetration = 15
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
	damage_types = list(BRUTE = 40)
	agony = 40
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	step_delay = 0.8

/obj/item/projectile/bullet/kurtz_50/hv
	name = "AV bullet"
	damage_types = list(BRUTE = 30)
	armor_penetration = 35
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
	damage_types = list(BRUTE = 20)
	armor_penetration = 30
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
	damage_types = list(BRUTE = 26)
	agony = 22
	armor_penetration = 0
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
	damage_types = list(BRUTE = 25)
	armor_penetration = 20
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.5
	affective_damage_range = 5
	affective_ap_range = 5

/obj/item/projectile/bullet/rifle_75/hv
	damage_types = list(BRUTE = 20)
	armor_penetration = 35
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
	damage_types = list(BRUTE = 30)
	agony = 28
	armor_penetration = 0
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
	damage_types = list(BRUTE = 24)
	armor_penetration = 48
	penetrating = 3
	hitscan = TRUE
	affective_damage_range = 9 //Sniping cal
	affective_ap_range = 9
	nocap_structures = TRUE //anit-wall/door

/obj/item/projectile/bullet/heavy_rifle_408/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 40)
	agony = 32
	armor_penetration = 0 //Half of normal
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

///Snowflake  ///

/obj/item/projectile/bullet/c10x24
	damage_types = list(BRUTE = 18)
	armor_penetration = 18
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
	agony = 100
	penetrating = 2
	affective_damage_range = 9
	affective_ap_range = 9
	penetrating = -5

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

//Gauss rifle
/obj/item/projectile/bullet/gauss
	name = "gauss"
	icon_state = "gauss"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/ric4.ogg'
	damage_types = list(BRUTE = 54)
	armor_penetration = 40
	check_armour = ARMOR_BULLET
	embed = FALSE
	can_ricochet = FALSE
	sharp = FALSE
	affective_damage_range = 12
	affective_ap_range = 12
	hitscan = TRUE

//Should do about 68 damage at 1 tile distance (adjacent), and 40 damage at 3 tiles distance.
//Overall less damage than slugs in exchange for more damage at very close range and more embedding
/obj/item/projectile/bullet/pellet/shotgun
	name = "shrapnel"
	icon_state = "birdshot-1"
	damage_types = list(BRUTE = 18)
	agony = 5
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
	damage_types = list(BURN = 15) //slightly less than buck, but FAR more painful
	armor_penetration = 15 //heated shot melt armor.
	embed = FALSE
	can_ricochet = FALSE
	sharp = FALSE
	muzzle_type = /obj/effect/projectile/plasma/muzzle/red
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
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()
	return TRUE

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
	damage_types = list(BRUTE = 45)
	armor_penetration = 15
	knockback = 0 //Bug doups hits
	step_delay = 0.9
	affective_damage_range = 7
	affective_ap_range = 7


/obj/item/projectile/bullet/crossbow_bolt/lethal
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 47)
	agony = 29
	armor_penetration = 5
	step_delay = 0.9

/obj/item/projectile/bullet/crossbow_bolt/hv
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 45)
	armor_penetration = 55
	penetrating = 3
	hitscan = TRUE
	affective_damage_range = 9
	affective_ap_range = 9
	nocap_structures = TRUE //Can do well againt walls and doors

//reusable
/obj/item/projectile/bullet/reusable
	var/obj/item/create_type

/obj/item/projectile/bullet/reusable/on_impact(atom/A)
	..()
	if(create_type)
		new create_type(get_turf(src))

/obj/item/projectile/bullet/reusable/rod_bolt
	name = "metal rod"
	icon_state = "bolt"
	damage_types = list(BRUTE = 10) //This is multiplied by tension when fired, so it's actually 50 damage.
	armor_penetration = 15
	step_delay = 0.9
	embed = FALSE
	penetrating = 1
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = /obj/item/stack/rods

/obj/item/projectile/bullet/reusable/rod_bolt/superheated
	name = "superheated metal rod"
	damage_types = list(BRUTE = 10, BURN = 2.5) //This is multiplied by tension when fired, so it's actually 62.5 damage.
	armor_penetration = 20
	step_delay = 0.6
	embed = TRUE
	penetrating = 0
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = null


/obj/item/projectile/bullet/reusable/rod_bolt/rcd
	name = "flashforged rod"
	icon_state = "bolt"
	damage_types = list(BRUTE = 9) //This is multiplied by tension when fired, so it's actually 45 damage. Slightly worse, but it's faster and has higher AP.
	armor_penetration = 30
	step_delay = 0.6
	embed = FALSE
	penetrating = 1
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = /obj/item/arrow/rcd

/obj/item/projectile/bullet/reusable/rod_bolt/rcd/superhot
	name = "flashforged superheated rod"
	icon_state = "bolt"
	damage_types = list(BRUTE = 9, BURN = 2.5) //This is multiplied by tension when fired, so it's actually 57.5 damage. Slightly worse, but it's faster and has higher AP.
	armor_penetration = 30
	supereffective_factions = list("neutral") //TESTING ONLY, REMOVE LATER
	step_delay = 0.2
	embed = TRUE
	penetrating = 0
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = null

/obj/item/projectile/bullet/reusable/arrow
	name = "arrow"
	icon_state = "arrow"
	damage_types = list(BRUTE = 4) //Multiplied by 10 when fired.
	supereffective_factions = list("wurm", "roach", "spider", "neutral", "hostile", "friendly") //good against common colony mobs
	embed = FALSE //don't want to embed and drop an arrow, that would be weird
	armor_penetration = 3 //..
	check_armour = ARMOR_MELEE
	step_delay = 0.9
	affective_damage_range = 6
	affective_ap_range = 6
	create_type = /obj/item/ammo_casing/arrow

/obj/item/projectile/bullet/reusable/arrow/broadhead //Similar base damage, higher embed rate, lower AP. Arrow-hollowpoints type 1.
	name = "broadhead arrow"
	icon_state = "arrow-broad"
	embed = TRUE //we are going to try really hard to embed
	embed_mult = 3
	armor_penetration = 2
	step_delay = 0.9
	create_type = null
	shrapnel_type = /obj/item/ammo_casing/arrow/broadhead //the ENTIRE arrow!

/obj/item/projectile/bullet/reusable/arrow/serrated
	name = "serrated arrow"
	icon_state = "arrow"
	agony = 60 //same as baroque, but much, much, much worse AP, less damage
	damage_types = list(BRUTE = 6.5) //Very good base damage, negligible (5) AP, but no embedding. Think of it as arrow-hollowpoints type 2.
	embed = FALSE
	armor_penetration = 0.5
	step_delay = 0.9
	create_type = /obj/item/ammo_casing/arrow/serrated

/obj/item/projectile/bullet/reusable/arrow/hunting
	name = "hunting arrow"
	icon_state = "arrow-bone"
	damage_types = list(BRUTE = 2) //Multiplied by 10 when fired.
	supereffective_factions = list("stalker", "roach", "spider", "tengo", "tengolo_berserker", "xenomorph", "wurm", "vox_tribe", "robot", "greyson", "ameridian", "neutral", "psi_monster", "hostile", "friendly") //this SHOULD be all of them.
	supereffective_mult = 5 //we do 10 damage base, up to 50 against SE mobs, then with 55 AP on should do ~100. Slow to fire, unwieldly, slow projectiles (but reusable), so I'll say this is fair?
	armor_penetration = 5 //high ap to take advantage of overpen on mobs
	step_delay = 0.8
	affective_damage_range = 14
	affective_ap_range = 14
	create_type = /obj/item/ammo_casing/arrow/hunting

/obj/item/projectile/bullet/reusable/arrow/hunting/heavy
	name = "fragmenting hunting arrow"
	icon_state = "arrow-bone"
	damage_types = list(BRUTE = 3) //Multiplied by 10 when fired.
	embed = TRUE
	supereffective_mult = 18 //we do 20 damage base, up to 360 against SE mobs, then with 55 (+5 hunting bow) AP on should do ~410. Baroque is around ~430 vs mobs, so roughly baroque-tier vs mobs, with the same wieldliness and different ammo costs (bone/leather/metal/plastic vs metal/cardboard).
	affective_damage_range = 14
	affective_ap_range = 14
	create_type = null //NOT reusable.

/obj/item/projectile/bullet/reusable/arrow/reagent
	name = "chemical arrow"
	icon_state = "arrow-reagent"
	damage_types = list(BRUTE = 0.5) //Low damage, but chem-warfarable.
	embed = FALSE
	reagent_flags = INJECTABLE | DRAINABLE | AMOUNT_VISIBLE | REFILLABLE
	armor_penetration = 0.5
	step_delay = 1
	create_type = /obj/item/ammo_casing/arrow
	var/volume = 15// We only splash the target with reagents, so we hold a little more than syrette arrows. Good for acids, incindiaries, etc.

/obj/item/projectile/bullet/reusable/arrow/reagent/Initialize()
	..()
	create_reagents(volume)

/obj/item/projectile/bullet/reusable/arrow/reagent/on_impact(atom/target)
	visible_message(SPAN_DANGER("The vial attached to [name] bursts, spraying [target] with its contents!"))
	reagents.splash(target, reagents.total_volume)
	return ..()

/obj/item/projectile/bullet/reusable/arrow/reagent/hypo
	name = "injector arrow"
	volume = 5 //hypo arrows only hold 5u of reagents.

/obj/item/projectile/bullet/reusable/arrow/reagent/hypo/on_impact(atom/target)
	visible_message(SPAN_DANGER("The hypo attached to [name] hits [target], injecting [target] with its contents!"))
	if(isliving(target))
		var/mob/living/injectee = target
		reagents.trans_to_mob(injectee, 5, CHEM_BLOOD)
	else
		reagents.trans_to(target, 5)
	return TRUE


/obj/item/projectile/bullet/reusable/arrow/practice
	name = "training arrow"
	icon_state = "arrow-practice"
	damage_types = list(HALLOSS = 0.1)
	embed = FALSE
	nodamage = TRUE
	armor_penetration = 0
	step_delay = 1.1
	create_type = /obj/item/ammo_casing/arrow/practice

/obj/item/projectile/bullet/reusable/arrow/practice/payload
	name = "ultralight training arrow"
	step_delay = 0.9
	create_type = /obj/item/ammo_casing/arrow/empty_payload


//spolsives here

/obj/item/projectile/bullet/reusable/arrow/explosive
	name = "explosive arrow"
	desc = "Holy shit, there's a bomb taped to this arrow!"
	icon_state = "arrow-grenade"
	damage_types = list(HALLOSS = 1)
	embed = FALSE //impact fuze
	armor_penetration = 0
	step_delay = 1.1 //slower
	affective_damage_range = 6
	affective_ap_range = 6
	kill_count = 7 //heavy arrow, worse aerodynamics
	create_type = null

/obj/item/projectile/bullet/reusable/arrow/explosive/on_impact(atom/target)
	explosion(target, 0, 1, 3)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/frag
	name = "frag grenade arrow"
	desc = "Holy shit, there's a military-grade frag grenade taped to this arrow!"
	var/frag_type = /obj/item/projectile/bullet/pellet/fragment/strong
	var/frag_damage = 3
	var/frag_count = 75

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/on_impact(atom/target)
	fragment_explosion(target, 4, frag_type, frag_count, frag_damage, 2, 100)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/sting
	name = "stinger grenade arrow"
	desc = "Holy shit, there's a police-grade stinger grenade taped to this arrow!"
	frag_type = /obj/item/projectile/bullet/pellet/fragment/rubber
	frag_damage = 1

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/on_impact(atom/target)
	fragment_explosion(target, 4, frag_type, frag_count, frag_damage, 2, 100)
	return TRUE


/obj/item/projectile/bullet/reusable/arrow/explosive/emp
	name = "electromagnetic pulse grenade arrow"
	desc = "Holy shit, there's a EMP grenade taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/emp/on_impact(atom/target)
	empulse(target, 1, 2) //fairly weak
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/flashbang
	name = "flashbang arrow"
	desc = "Holy shit, there's a flashbang taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/flashbang/on_impact(atom/target)
	for(var/mob/living/carbon/M in hear(2, get_turf(target)))
		flashbang_bang(get_turf(target), M)

	for(var/mob/living/carbon/human/thermal_user in orange(4, target))
		if(!thermal_user.glasses)
			return
		var/obj/item/clothing/glasses/potential_thermals = thermal_user.glasses
		if(potential_thermals.overlays == global_hud.thermal)
			flashbang_without_the_bang(get_turf(target), thermal_user)

	for(var/obj/effect/blob/B in hear(2,get_turf(target)))	//Blob damage here
		var/damage = round(30/(get_dist(2,get_turf(target))+1))
		B.health -= damage
		B.update_icon()

	new /obj/effect/sparks(get_turf(target))
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/heatwave
	name = "heatwave arrow"
	desc = "Holy shit, there's a heatwave grenade taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/heatwave/on_impact(atom/target)
	heatwave(target, 1, 2, 25, TRUE, 0)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke
	name = "smoke grenade arrow"
	desc = "Holy shit, there's a smoke grenade taped to this arrow!"
	var/datum/effect/effect/system/smoke_spread/bad/smoke

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/Initialize()
	..()
	src.smoke = new
	src.smoke.attach(src)

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/on_impact(atom/target)
	src.smoke.set_up(10, 0, usr.loc)
	src.smoke.start()
	return ..()

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/Destroy()
	..()
	QDEL_NULL(smoke)
