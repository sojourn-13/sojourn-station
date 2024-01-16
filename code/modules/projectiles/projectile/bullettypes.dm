//There are important things regarding this file:
//Rubbers are non sharp, embed capable objects, with non existing armor penetration. Their agony damage is generally lower then actual one.
//The caliber amount was lowered for a reason, don't add more bloat. If you need different values, use gun vars.
//HV exist as antag option for better ammo.
//* Step delays - default value is 1. Lower value makes bullet go faster, higher value makes bullet go slower.

//Low-caliber pistols and SMGs
//*********************************//
///9mm///
/obj/item/projectile/bullet/pistol_35
	damage_types = list(BRUTE = 15)
	armor_penetration = 5
	step_delay = 0.65
	can_ricochet = TRUE

	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 5

/obj/item/projectile/bullet/pistol_35/hv
	damage_types = list(BRUTE = 10)
	armor_penetration = 20
	step_delay = 0.5
	affective_damage_range = 5
	affective_ap_range = 5
	can_ricochet = TRUE
	recoil = 6

/obj/item/projectile/bullet/pistol_35/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 3
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 0.75
	can_ricochet = FALSE
	recoil = 4

/obj/item/projectile/bullet/pistol_35/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 8)
	agony = 6
	post_penetration_dammult = 3
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.65
	recoil = 5

/obj/item/projectile/bullet/pistol_35/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 10)
	agony = 22
	armor_penetration = 0
	embed = FALSE	//Prob should have a chance to embed, but makes close to no sense to do this for 9mm at least.
	sharp = FALSE
	can_ricochet = TRUE
	recoil = 4

/obj/item/projectile/bullet/pistol_35/rubber/soporific
	name = "soporific coated rubber bullet"
	damage_types = list(BRUTE = 0)
	agony = 25
	var/spray = "stoxin"
	can_ricochet = FALSE
	armor_penetration = 0

/obj/item/projectile/bullet/pistol_35/rubber/soporific/New()
	..()
	if (!testing)
		create_reagents(2)
		reagents.add_reagent(spray, 2)

/obj/item/projectile/bullet/pistol_35/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			reagents.trans_to_mob(L, 2, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/pistol_35/rubber/soporific/cbo
	name = "soporific condensed plastic bullet"
	agony = 30
	can_ricochet = FALSE
	armor_penetration = 0

/obj/item/projectile/bullet/pistol_35/rubber/soporific/cbo/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents)
			L.reagents.add_reagent("stoxin", 5)

/obj/item/projectile/bullet/pistol_35/rubber/pepperball
	name = "pepperball"
	damage_types = list(BRUTE = 2)	//Pepperballs disipate upon impact. They'll sting like shit, but won't do much in a low-velocity round.
	agony = 22
	step_delay = 0.6 //a little slower than rubber rounds - these are just pepperspray balls
	armor_penetration = 0
	var/spray = "condensedcapsaicin"
	embed = FALSE
	can_ricochet = FALSE

/obj/item/projectile/bullet/pistol_35/rubber/pepperball/New()
	..()
	if (!testing)
		create_reagents(3)
		reagents.add_reagent(spray, 3)

/obj/item/projectile/bullet/pistol_35/rubber/pepperball/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 3, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/pistol_35/scrap
	damage_types = list(BRUTE = 12)
	armor_penetration = 0

	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 3

/obj/item/projectile/bullet/pistol_35/biomatter
	name = "biomatter bullet"
	damage_types = list(BURN = 15)
	agony = 20
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.65
	check_armour = ARMOR_BIO
	recoil = 3

//Revolvers and high-caliber pistols
//*********************************//
/// 10mm Magnum ///

/obj/item/projectile/bullet/magnum_40
	icon_state = "bullet_magnum"
	damage_types = list(BRUTE = 19)
	armor_penetration = 10
	can_ricochet = TRUE
	step_delay = 0.4

	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 7

/obj/item/projectile/bullet/magnum_40/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 4
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.4
	recoil = 4

/obj/item/projectile/bullet/magnum_40/hv
	damage_types = list(BRUTE = 16)
	armor_penetration = 33
	penetrating = 1
	step_delay = 0.25
	nocap_structures = TRUE //Door breaching
	affective_damage_range = 5
	affective_ap_range = 5
	recoil = 9

/obj/item/projectile/bullet/magnum_40/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 9)
	agony = 11
	armor_penetration = 0
	post_penetration_dammult = 3
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5
	recoil = 7

/obj/item/projectile/bullet/magnum_40/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 14)	//Basically a lower-damage HP but with more agony damage to it. Technically LTL - but not really ideal for it. Crowd-suppression.
	agony = 30
	armor_penetration = 10
	embed = TRUE	//If you shoot someone with a rubber, it will take out an eye - or require surgery if it's high-velocity. Anything over 9mm should, realistically, fuck you up.
	sharp = FALSE
	can_ricochet = TRUE
	step_delay = 0.5
	recoil = 6

/obj/item/projectile/bullet/magnum_40/rubber/pepperball
	name = "pepperball"
	damage_types = list(BRUTE = 4)	//Pepperballs disipate upon impact. They'll sting like shit, but won't do much in a low-velocity round.
	agony = 30
	step_delay = 0.6 //a little slower than rubber rounds - these are just pepperspray balls
	armor_penetration = 0
	var/spray = "condensedcapsaicin"
	embed = FALSE
	can_ricochet = FALSE	//breaks upon impact; impossible.

/obj/item/projectile/bullet/magnum_40/rubber/pepperball/New()
	..()
	if (!testing)
		create_reagents(5)
		reagents.add_reagent(spray, 5)

/obj/item/projectile/bullet/magnum_40/rubber/pepperball/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 5, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/magnum_40/rubber/soporific
	name = "soporific coated rubber bullet"
	damage_types = list(BRUTE = 0)
	agony = 35
	armor_penetration = 0
	var/spray = "stoxin"
	can_ricochet = FALSE
	embed = FALSE

/obj/item/projectile/bullet/magnum_40/rubber/soporific/New()
	..()
	if (!testing)
		create_reagents(3)
		reagents.add_reagent(spray, 3)

/obj/item/projectile/bullet/magnum_40/rubber/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 3, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/magnum_40/scrap
	damage_types = list(BRUTE = 16)
	armor_penetration = 5
	affective_damage_range = 3
	affective_ap_range = 3
	recoil = 6

/obj/item/projectile/bullet/magnum_40/biomatter
	name = "biomatter bullet"
	damage_types = list(BURN = 20)
	agony = 32
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.65
	check_armour = ARMOR_BIO
	recoil = 6

/// 12mm Heavy Pistol ///
/obj/item/projectile/bullet/kurtz_50
	icon_state = "bullet_krutz"
	damage_types = list(BRUTE = 23.5)
	armor_penetration = 15
	can_ricochet = TRUE
	embed = TRUE
	step_delay = 0.65
	affective_damage_range = 5
	affective_ap_range = 5
	recoil = 14

/obj/item/projectile/bullet/kurtz_50/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 15)
	agony = 35
	check_armour = ARMOR_MELEE
	armor_penetration = 10
	can_ricochet = TRUE
	step_delay = 0.7
	recoil = 10

/obj/item/projectile/bullet/kurtz_50/rubber/pepperball
	name = "pepperball"
	damage_types = list(BRUTE = 6)	//Pepperballs disipate upon impact. They'll sting like shit, but won't do much in a low-velocity round.
	agony = 35
	step_delay = 0.75 //a little slower than rubber rounds - these are just pepperspray balls
	armor_penetration = 0
	var/spray = "condensedcapsaicin"
	embed = FALSE
	can_ricochet = FALSE	//breaks upon impact; impossible.

/obj/item/projectile/bullet/kurtz_50/rubber/pepperball/New()
	..()
	if (!testing)
		create_reagents(8)
		reagents.add_reagent(spray, 8)

/obj/item/projectile/bullet/kurtz_50/rubber/pepperball/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 8, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/kurtz_50/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 3
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	step_delay = 0.75
	recoil = 8

/obj/item/projectile/bullet/kurtz_50/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 10)
	agony = 12
	post_penetration_dammult = 3
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	step_delay = 0.8
	recoil = 14

/obj/item/projectile/bullet/kurtz_50/hv
	name = "AV bullet"
	damage_types = list(BRUTE = 20)
	armor_penetration = 35
	penetrating = 2
	can_ricochet = FALSE
	step_delay = 0.45
	affective_damage_range = 6
	affective_ap_range = 6
	nocap_structures = TRUE //We can breach doors rather well
	recoil = 16


//Carbines and rifles
//*********************************//

/// 6.5x39mm Carbine///

/obj/item/projectile/bullet/light_rifle_257
	icon_state = "bullet_carbine"
	damage_types = list(BRUTE = 14)
	armor_penetration = 15
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 7
	affective_ap_range = 7
	recoil = 5

/obj/item/projectile/bullet/light_rifle_257/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.5
	recoil = 4

/obj/item/projectile/bullet/light_rifle_257/hv
	damage_types = list(BRUTE = 13)
	armor_penetration = 30
	penetrating = 2
	hitscan = TRUE
	affective_damage_range = 8 //Can snipe
	affective_ap_range = 8
	nocap_structures = TRUE //RATARATARAT down a door
	recoil = 7

/obj/item/projectile/bullet/light_rifle_257/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 10)
	agony = 20
	check_armour = ARMOR_MELEE
	armor_penetration = 10
	embed = TRUE	//Imagine being shot with a high velocity .223/5.56 rubber bullet - that shit could easily kill you - or at least would act like a normal bullet.
	sharp = TRUE	//There is no-way this round is not acting like a regular high-velocity round at this point.
	can_ricochet = TRUE
	step_delay = 0.9
	recoil = 4

/obj/item/projectile/bullet/light_rifle_257/rubber/pepperball
	name = "pepperball"
	damage_types = list(BRUTE = 4)	//Pepperballs disipate upon impact. They'll sting like shit, but won't do much in a low-velocity round.
	agony = 20
	step_delay = 1.0 //a little slower than rubber rounds - these are just pepperspray balls
	armor_penetration = 0
	var/spray = "condensedcapsaicin"
	embed = FALSE
	can_ricochet = FALSE	//breaks upon impact; impossible.

/obj/item/projectile/bullet/light_rifle_257/rubber/pepperball/New()
	..()
	if (!testing)
		create_reagents(5)
		reagents.add_reagent(spray, 5)

/obj/item/projectile/bullet/light_rifle_257/rubber/pepperball/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 5, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/light_rifle_257/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 6)
	agony = 6
	post_penetration_dammult = 3
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.6
	recoil = 5

/obj/item/projectile/bullet/light_rifle_257/incend
	name = "incendiary bullet"
	damage_types = list(BURN = 10) //We deal most of are damage with fire stacks
	fire_stacks = 1
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.7
	recoil = 7

/obj/item/projectile/bullet/light_rifle_257/scrap
	damage_types = list(BRUTE = 12)
	armor_penetration = 7
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 6

/obj/item/projectile/bullet/light_rifle_257/nomuzzle
	muzzle_type = null

/// 7.62x39mm Rifle ///

/obj/item/projectile/bullet/rifle_75
	damage_types = list(BRUTE = 15.5)
	armor_penetration = 20
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 7
	affective_ap_range = 7
	recoil = 10

/obj/item/projectile/bullet/rifle_75/hv
	damage_types = list(BRUTE = 14)
	armor_penetration = 36
	penetrating = 2
	hitscan = TRUE
	affective_damage_range = 8
	affective_ap_range = 8
	nocap_structures = TRUE //Helps against walls and doors
	recoil = 14

/obj/item/projectile/bullet/rifle_75/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	recoil = 6

/obj/item/projectile/bullet/rifle_75/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 12)
	agony = 26
	check_armour = ARMOR_MELEE
	armor_penetration = 15
	embed = TRUE	//literally imagine a 7.62 rubber bullet hitting you - holy shit.
	sharp = TRUE	//there is literally no-fucking-way this would not act like a regular sharp round at this point.
	can_ricochet = TRUE
	step_delay = 0.9
	recoil = 6

/obj/item/projectile/bullet/rifle_75/rubber/soporific
    name = "soporific coated rubber bullet"
    damage_types = list(BRUTE = 4) // Minor damage from blunt trauma, it's meant to be LTL
    agony = 30
    var/spray = "stoxin"

/obj/item/projectile/bullet/rifle_75/rubber/soporific/New()
    ..()
    if (!testing)
        create_reagents(1)
        reagents.add_reagent(spray, 1)

/obj/item/projectile/bullet/rifle_75/rubber/soporific/on_hit(atom/target, def_zone = null)
    if(isliving(target))
        var/mob/living/L = target
        if(istype(L) && L.reagents && !testing)
            reagents.trans_to_mob(L, 1, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/rifle_75/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 7)
	agony = 9
	post_penetration_dammult = 3
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.8
	recoil = 10

/obj/item/projectile/bullet/rifle_75/incend
	name = "incendiary bullet"
	damage_types = list(BURN = 12) //We deal most of are damage with fire stacks
	fire_stacks = 2
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.8
	recoil = 9

/obj/item/projectile/bullet/rifle_75/scrap
	damage_types = list(BRUTE = 14)
	armor_penetration = 10
	affective_damage_range = 3
	affective_ap_range = 3
	recoil = 5

/// 8.6x70mm Heavy Rifle ///

/obj/item/projectile/bullet/heavy_rifle_408
	icon_state = "bullet_heavy"
	damage_types = list(BRUTE = 20)
	armor_penetration = 25
	penetrating = 2
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 8
	affective_ap_range = 8
	recoil = 16

/obj/item/projectile/bullet/heavy_rifle_408/rubber
	name = "rubber bullet"
	icon_state = "rubber"
	damage_types = list(BRUTE = 17)
	armor_penetration = 20
	agony = 32
	check_armour = ARMOR_MELEE
	embed = TRUE	//imagine an effectively smaller .50 Cal marksman round hitting you. holy shit.
	sharp = TRUE	//there is literally no-fucking-way this would not act like a regular sharp round at this point.
	can_ricochet = TRUE
	step_delay = 0.9
	recoil = 14

/obj/item/projectile/bullet/heavy_rifle_408/practice
	name = "practice bullet"
	damage_types = list(BRUTE = 2)
	agony = 2
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	can_ricochet = FALSE
	step_delay = 0.5
	recoil = 10

/obj/item/projectile/bullet/heavy_rifle_408/hv
	name = "sabot penetrator"
	damage_types = list(BRUTE = 16)
	armor_penetration = 46
	penetrating = 3
	hitscan = TRUE
	affective_damage_range = 9 //Sniping cal
	affective_ap_range = 9
	nocap_structures = TRUE //anit-wall/door
	recoil = 20

/obj/item/projectile/bullet/heavy_rifle_408/lethal
	name = "hollow-point bullet"
	damage_types = list(BRUTE = 12)
	agony = 14
	post_penetration_dammult = 3
	armor_penetration = 0 //none of none. Dont give HP any AP
	penetrating = 0
	can_ricochet = FALSE
	embed = TRUE
	sharp = TRUE
	step_delay = 0.5
	recoil = 16

/obj/item/projectile/bullet/heavy_rifle_408/incend
	name = "incendiary bullet"
	damage_types = list(BURN = 15) //We deal most of are damage with fire stacks
	fire_stacks = 3
	armor_penetration = 0
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.8
	recoil = 15

/obj/item/projectile/bullet/heavy_rifle_408/scrap
	damage_types = list(BRUTE = 15)
	armor_penetration = 15 //half  of normal
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 12

///Snowflake  ///

/obj/item/projectile/bullet/c10x24
	damage_types = list(BRUTE = 19)
	armor_penetration = 18
	penetrating = 2
	can_ricochet = TRUE
	sharp = TRUE
	step_delay = 0.3
	affective_damage_range = 9
	affective_ap_range = 9
	recoil = 9

/obj/item/projectile/bullet/auto_460
	damage_types = list(BRUTE = 30)
	armor_penetration = 25
	penetrating = 2
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 8
	affective_ap_range = 8
	recoil = 14

/obj/item/projectile/bullet/auto_460/scrap
	damage_types = list(BRUTE = 17.5)
	armor_penetration = 15
	penetrating = 1
	can_ricochet = TRUE
	step_delay = 0.3
	affective_damage_range = 5
	affective_ap_range = 5
	recoil = 12

//// 14.5×114mm Anti-Materiel Rifle Rounds ////
/obj/item/projectile/bullet/antim
	damage_types = list(BRUTE = 60)
	armor_penetration = 100
	nocap_structures = TRUE
	//stun = 5
	//weaken = 10
	penetrating = 5
	hitscan = TRUE //so the PTR isn't useless as a sniper weapon
	affective_damage_range = 10 //Unsure why this is so low, this is no where near the range of the AMR scope.
	affective_ap_range = 10
	recoil = 40

/obj/item/projectile/bullet/antim/lethal
	damage_types = list(BRUTE = 45)
	embed = TRUE
	armor_penetration = 60
	agony = 100
	penetrating = 2
	affective_damage_range = 9
	affective_ap_range = 9
	penetrating = -5
	recoil = 20

/obj/item/projectile/bullet/antim/incend
	damage_types = list(BURN = 45)
	embed = FALSE
	fire_stacks = 5	//BURN, BABY! BUUURN!!
	armor_penetration = 20
	penetrating = 2
	affective_damage_range = 10
	affective_ap_range = 10
	penetrating = -5
	recoil = 40

/obj/item/projectile/bullet/antim/scrap
	damage_types = list(BRUTE = 41.5)
	armor_penetration = 50
	affective_damage_range = 8
	affective_ap_range = 8
	recoil = 30

/obj/item/projectile/bullet/antim/ion
	damage_types = list(BRUTE = 25)
	armor_penetration = 40
	recoil = 15

/obj/item/projectile/bullet/antim/ion/on_impact(atom/target, blocked = FALSE)
	. = ..()
	if (!testing)
		empulse(target, 1, 3)

//smoothbore rifles
/obj/item/projectile/bullet/ball
	nocap_structures = TRUE
	damage_types = list(BRUTE = 40) //Grab me musket as the founding fathers intended
	armor_penetration = 50 //no longer a little jank, much like other older rifles it falters in terms of AP while still having enough to really smash through armor.
	supereffective_mult = 6 //we do 40 damage base, up to 240 with supereffective - plus AP bonus, plus agony bonus, about the same 350~ as before
	supereffective_types = list(/mob/living/carbon/human = FALSE, /mob/living = TRUE) //We are great at fighting living things(other than people, for balance reasons) but not so much robots.
	agony = 60
	penetrating = 2
	hitscan = TRUE //It's a bullet, but its hitscan as its only used by snipers.
	embed = FALSE //Blow a golf ball sized hole through the first man, he's dead on the spot - No embeds, tears through
	affective_damage_range = 12
	affective_ap_range = 12 //Good rifling! //wait, what? It's a smoothbore. Whatever ~_~
	recoil = 35

//Mech
/obj/item/projectile/bullet/mech_coilgun //Industrial Coilgun
	name = "coilgun round"
	icon_state = null
	damage_types = list(BRUTE = 26)
	armor_penetration = 20
	penetrating = 1

	can_ricochet = FALSE
	embed = FALSE //Goes right through
	affective_damage_range = 9
	affective_ap_range = 7

	recoil = 2

/obj/item/projectile/bullet/pellet/mech_flak //Flak Cannon
	name = "flak shrapnel"
	icon_state = "l_birdshot-4"
	damage_types = list(BRUTE = 11)
	armor_penetration = 22
	penetrating = 0

	pellets = 4			//number of pellets
	range_step = 4		//projectile will lose a fragment each time it travels this distance.
	base_spread = 15	//lower means the pellets spread more across body parts.
	spread_step = 5	//higher means the pellets spread more across body parts with distance

	can_ricochet = FALSE
	embed = TRUE
	sharp = FALSE

	affective_damage_range = 8
	affective_ap_range = 9 //Anti-Air
	recoil = 2

/obj/item/projectile/bullet/pellet/mech_flak/military //Scatter-Shot Autocannon
	range_step = 8		//projectile will lose a fragment each time it travels this distance.
	base_spread = 90	//lower means the pellets spread more across body parts.
	spread_step = 1	//higher means the pellets spread more across body parts with distance

	affective_damage_range = 11
	affective_ap_range = 11  //Anti-Air

/obj/item/projectile/bullet/mech_machinegun //Heavy Machinegun
	name = "large caliber bullet"
	icon_state = "bullet_heavy"
	damage_types = list(BRUTE = 13)
	armor_penetration = 15 //To keep it somewhat fair towards the handhelds considering it has higher ammo capacity
	penetrating = 1

	can_ricochet = TRUE

	affective_damage_range = 6
	affective_ap_range = 6 //Blarge rifle caliber
	recoil = 8

/obj/item/projectile/bullet/mech_autocannon //Autocannon
	name = "gigantic round"
	icon_state = "slug"
	damage_types = list(BRUTE = 56)
	armor_penetration = 50 //Tally ho
	penetrating = 3 //tank sized round

	can_ricochet = FALSE

	affective_damage_range = 8
	affective_ap_range = 8 //Heavy blarge caliber meaning bit less range
	recoil = 2

/obj/item/projectile/bullet/mech_burstcannon //Burst-Fire Autocannon
	name = "humongous round"
	icon_state = "bullet_kurtz"
	damage_types = list(BRUTE = 26)
	armor_penetration = 43 //This fires 2 in a row so keep that in mind
	penetrating = 3 //tank sized round

	can_ricochet = FALSE

	affective_damage_range = 10
	affective_ap_range = 10 //Heavy blarge caliber but not as much as regular
	recoil = 2

//Shotguns
//*********************************//

/obj/item/projectile/bullet/shotgun
	name = "slug"
	icon_state = "slug"
	damage_types = list(BRUTE = 37)
	armor_penetration = 25
	knockback = 0 //Bug doups hits
	step_delay = 0.9
	//Slugs are meant for long range shooting
	affective_damage_range = 7
	affective_ap_range = 7
	recoil = 18

/obj/item/projectile/bullet/shotgun/ceramic
	name = "ceramic slug"
	icon_state = "slug"
	damage_types = list(BRUTE = 30)
	armor_penetration = 10
	knockback = 1 //KER-BLAM!!!!
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 22

/obj/item/projectile/bullet/shotgun/beanbag
	name = "beanbag"
	icon_state = "rubber"
	damage_types = list(BRUTE = 15)
	agony = 60
	armor_penetration = 0
	embed = FALSE
	sharp = FALSE
	step_delay = 1.65
	affective_damage_range = 5
	affective_ap_range = 2
	recoil = 10

/obj/item/projectile/bullet/shotgun/beanbag/pepperball
	name = "pepperball slug"
	damage_types = list(BRUTE = 6)	//Pepperballs disipate upon impact. They'll sting like shit, but won't do much in a low-velocity round.
	agony = 50
	step_delay = 2 //Slower than a beanbag due to it being STRONG as fuck.
	armor_penetration = 0
	var/spray = "condensedcapsaicin"
	embed = FALSE
	can_ricochet = FALSE	//breaks upon impact; impossible.

/obj/item/projectile/bullet/shotgun/beanbag/pepperball/New()
	..()
	if (!testing)
		create_reagents(10)
		reagents.add_reagent(spray, 10)

/obj/item/projectile/bullet/shotgun/beanbag/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 10, CHEM_TOUCH, copy = FALSE)

/obj/item/projectile/bullet/shotgun/beanbag/soporific
	name = "soporific coated beanbag"
	damage_types = list(BRUTE = 10) // They still hurt!
	agony = 65
	var/spray = "stoxin"

/obj/item/projectile/bullet/shotgun/beanbag/soporific/New()
	..()
	if (!testing)
		create_reagents(5)
		reagents.add_reagent(spray, 5)

/obj/item/projectile/bullet/shotgun/beanbag/soporific/on_hit(atom/target, def_zone = null)
	if(isliving(target))
		var/mob/living/L = target
		if(istype(L) && L.reagents && !testing)
			reagents.trans_to_mob(L, 5, CHEM_TOUCH, copy = FALSE)


/obj/item/projectile/bullet/shotgun/practice
	name = "practice slug"
	damage_types = list(BRUTE = 4)
	agony = 5
	armor_penetration = 0
	embed = FALSE
	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 7

/obj/item/projectile/bullet/shotgun/incendiary
	//This is the best ammo for pvp in a shotgun, beating the stunshell with its pain and cooks anyone in any armor!
	damage_types = list(BURN = 22.5) //We deal most of are damage with fire stacks
	fire_stacks = 4 //40 pain a fire proc through ALL armor!
	recoil = 40

/obj/item/projectile/bullet/shotgun/scrap
	damage_types = list(BRUTE = 27)
	armor_penetration = 5
	affective_damage_range = 3
	affective_ap_range = 4
	recoil = 10

/obj/item/projectile/bullet/shotgun/beanbag/scrap
	damage_types = list(BRUTE = 13)
	agony = 55
	affective_damage_range = 1
	affective_ap_range = 1
	recoil = 8

/obj/item/projectile/bullet/pellet/shotgun/scrap
	damage_types = list(BRUTE = 7.5)
	affective_damage_range = 4
	affective_ap_range = 4
	recoil = 6

/obj/item/projectile/bullet/shotgun/biomatter //Unique niche round. High AP, Low damage, high agony. Good for mob crunching, or AP LTL uses
	name = "biomatter slug"
	damage_types = list(BURN = 10) // Thin little piece of biomass designed to defeat armor but not really large enough to cause super serious injuries.
	agony = 40 // BURNS SO BAD
	armor_penetration = 40 //high velocity
	penetrating = 0
	can_ricochet = FALSE
	embed = FALSE
	sharp = FALSE
	step_delay = 0.95 //slightly slower than a slug
	check_armour = ARMOR_BIO //duh.
	recoil = 8//much less damage than slug, much less recoil.


//Railgun
/obj/item/projectile/bullet/shotgun/railgun
	nocap_structures = TRUE
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 18

/obj/item/projectile/bullet/shotgun/beanbag/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 14

/obj/item/projectile/bullet/shotgun/incendiary/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	affective_damage_range = 10
	affective_ap_range = 10
	recoil = 20

/obj/item/projectile/bullet/kurtz_50/railgun
	nocap_structures = TRUE
	hitscan = TRUE
	can_ricochet = FALSE
	recoil = 13

/obj/item/projectile/bullet/kurtz_50/rubber/railgun
	hitscan = TRUE
	can_ricochet = FALSE
	recoil = 9

/obj/item/projectile/bullet/kurtz_50/incendiary
	damage_types = list(BRUTE = 5)
	agony = 5
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	knockback = 0
	fire_stacks = 4
	recoil = 19

/obj/item/projectile/bullet/heavy_rifle_408/railgun
	can_ricochet = FALSE
	icon_state = "toxin"
	recoil = 23

/obj/item/projectile/bullet/lrifle/incendiary
	icon_state = "fireball"
	damage_types = list(BURN = 3.5)
	agony = 5
	armor_penetration = 0
	embed = FALSE
	can_ricochet = FALSE
	knockback = 0
	recoil = 20
	fire_stacks = 4
/*
/obj/item/projectile/bullet/lrifle/incendiary/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(iscarbon(target) && !testing)
		var/mob/living/carbon/M = target
		M.adjust_fire_stacks(fire_stacks)
		M.IgniteMob()
*/
//Gauss rifle
/obj/item/projectile/bullet/gauss
	name = "gauss"
	icon_state = "gauss"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/ric4.ogg'
	damage_types = list(BRUTE = 34)
	armor_penetration = 40
	check_armour = ARMOR_BULLET
	embed = FALSE
	can_ricochet = FALSE
	sharp = FALSE
	affective_damage_range = 12
	affective_ap_range = 12
	hitscan = TRUE
	recoil = 38

//Should do about 68 damage at 1 tile distance (adjacent), and 40 damage at 3 tiles distance.
//Overall less damage than slugs in exchange for more damage at very close range and more embedding
/obj/item/projectile/bullet/pellet/shotgun
	name = "shrapnel"
	icon_state = "birdshot-1"
	damage_types = list(BRUTE = 11)
	agony = 5
	pellets = 4
	range_step = 1
	spread_step = 10
	post_penetration_dammult = 1.5 //shotgun supremacy is coming back baybee
	knockback = 0 //We do not knockback do to issues with bullet douping
	step_delay = 0.9
	affective_damage_range = 2
	affective_ap_range = 2
	recoil = 11

/obj/item/projectile/bullet/pellet/shotgun/Initialize()
	. = ..()
	icon_state = "birdshot-[rand(1,4)]"

/obj/item/projectile/bullet/pellet/shotgun/scattershot //VERY dangerous, the weapon has a low refire rate for a reason. DO NOT use this for non exo weapons without tweaking.
	name = "heavy shrapnel"
	damage_types = list(BRUTE = 8) //We hit slightly softer than buckshot
	agony = 0 //No.
	post_penetration_dammult = 2
	pellets = 6 // but more times
	range_step = 2 //and at longer range
	step_delay = 1.1 //we travel a bit slower
	recoil = 13

//'Laser' buckshot. Effectively just burn buckshot used for the Abdication.
/obj/item/projectile/bullet/pellet/shotgun/energy
	name = "Unstable energy bolt"
	icon_state = "l_birdshot-1"
	damage_types = list(BURN = 11.5) //slightly less than buck, but FAR more painful
	armor_penetration = 15 //heated shot melt armor.
	post_penetration_dammult = 1.5 //this is probably gonna need to be tuned back, but we'll see.
	embed = FALSE
	can_ricochet = FALSE
	sharp = FALSE
	muzzle_type = /obj/effect/projectile/plasma/muzzle/red
	check_armour = ARMOR_ENERGY
	recoil = 7

//For the love of God don't make this common.
/obj/item/projectile/bullet/shotgun/payload
	name = "explosive bolt"
	icon_state = "bolter"
	damage_types = list(BRUTE = 15)
	agony = 5
	knockback = 1
	fire_stacks = 1
	armor_penetration = 10
	nocap_structures = TRUE
	check_armour = ARMOR_BOMB
	sharp = TRUE
	edge = TRUE
	step_delay = 0.9
	recoil = 30

/obj/item/projectile/bullet/shotgun/payload/on_impact(atom/target)
	if (!testing)
		explosion(target, 0, 0, 2)
	return TRUE

//Miscellaneous
/obj/item/projectile/bullet/blank
	invisibility = 101
	damage_types = list(BRUTE = 1)
	embed = FALSE
	recoil = 2

/obj/item/projectile/bullet/cap
	name = "cap"
	damage_types = list(HALLOS = 0)
	nodamage = TRUE
	embed = FALSE
	sharp = FALSE
	recoil = 1
	kill_count = 0 //cap gun so projectile dies the second it fires. -Benl8561

/obj/item/projectile/bullet/crossbow_bolt
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 22.5)
	armor_penetration = 15
	knockback = 0 //Bug doups hits
	supereffective_types = list(/mob/living/carbon/human = FALSE, /mob/living = TRUE)
	supereffective_mult = 1.5
	step_delay = 0.9
	affective_damage_range = 7
	affective_ap_range = 7
	recoil = 2

/obj/item/projectile/bullet/crossbow_bolt/lethal
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 10)
	agony = 29
	armor_penetration = 0
	post_penetration_dammult = 3
	supereffective_types = list(/mob/living/carbon/human = FALSE, /mob/living = TRUE)
	supereffective_mult = 1.5
	step_delay = 0.9
	recoil = 1

/obj/item/projectile/bullet/crossbow_bolt/hv
	name = "bolt"
	icon_state = "bolt"
	damage_types = list(BRUTE = 23.5)
	armor_penetration = 55
	penetrating = 3
	hitscan = TRUE
	supereffective_types = list(/mob/living/carbon/human = FALSE, /mob/living = TRUE)
	supereffective_mult = 1.5
	affective_damage_range = 9
	affective_ap_range = 9
	nocap_structures = TRUE //Can do well againt walls and doors
	recoil = 5

//reusable
/obj/item/projectile/bullet/reusable
	var/obj/item/create_type
	muzzle_type = null

/obj/item/projectile/bullet/reusable/on_impact(atom/A)
	..()
	if(create_type && !testing)
		new create_type(get_turf(src))

/obj/item/projectile/bullet/reusable/rod_bolt
	name = "metal rod"
	icon_state = "bolt"
	damage_types = list(BRUTE = 5) //This is multiplied by tension when fired, so it's actually 25 damage.
	armor_penetration = 15
	step_delay = 0.9
	embed = FALSE
	penetrating = 1
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = /obj/item/stack/rods

/obj/item/projectile/bullet/reusable/rod_bolt/superheated
	name = "superheated metal rod"
	damage_types = list(BRUTE = 5, BURN = 2.5) //This is multiplied by tension when fired, so it's actually 37.5 damage.
	armor_penetration = 20
	step_delay = 0.6
	embed = TRUE
	penetrating = 0
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = null
	recoil = 10


/obj/item/projectile/bullet/reusable/rod_bolt/rcd
	name = "flashforged rod"
	icon_state = "bolt"
	damage_types = list(BRUTE = 5) //This is multiplied by tension when fired, so it's actually 25 damage. Slightly worse, but it's faster and has higher AP.
	armor_penetration = 30
	step_delay = 0.6
	embed = FALSE
	penetrating = 1
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = /obj/item/arrow/rcd
	recoil = 6 //Scrap verson

/obj/item/projectile/bullet/reusable/rod_bolt/rcd/superhot
	name = "flashforged superheated rod"
	icon_state = "bolt"
	damage_types = list(BRUTE = 5, BURN = 2.5) //This is multiplied by tension when fired, so it's actually 57.5 damage. Slightly worse, but it's faster and has higher AP.
	armor_penetration = 30
	step_delay = 0.2
	embed = TRUE
	penetrating = 0
	affective_damage_range = 7
	affective_ap_range = 7
	create_type = null


/obj/item/projectile/bullet/reusable/arrow
	name = "arrow"
	icon_state = "arrow"
	damage_types = list(BRUTE = 2) //Multiplied by 10 when fired.
	armor_penetration = 2
	effective_faction = list("wurm", "roach", "spider", "vox_tribe", "russian", "tengo") //good against common colony mobs
	damage_mult = 2 // Turns out arrows always sucked
	embed = FALSE //don't want to embed and drop an arrow, that would be weird
	check_armour = ARMOR_MELEE
	step_delay = 0.9
	affective_damage_range = 6
	affective_ap_range = 6
	create_type = /obj/item/ammo_casing/arrow
	recoil = 0 //arrow moment

/obj/item/projectile/bullet/reusable/arrow/serrated //Lower base damage, higher embed rate, higher AP. Arrow HV's, though not as good as the Lodge's.
	name = "serrated arrow"
	icon_state = "arrow"
	embed = TRUE
	damage_types = list(BRUTE = 1.5) // 15 damage at max pull
	damage_mult = 1.5 // Less bonus damage against effective faction
	embed_mult = 3 //we are going to try really hard to embed
	armor_penetration = 7 // Crossbow bolts are better, however this should not penetrate armor the same as a bullet (if not MORE).
	hitscan = TRUE // As every HV ammo
	affective_damage_range = 8
	affective_ap_range = 8
	create_type = null
	shrapnel_type = /obj/item/ammo_casing/arrow/serrated //the ENTIRE arrow!

/obj/item/projectile/bullet/reusable/arrow/broadhead
	name = "broadhead arrow"
	icon_state = "arrow-broad"
	post_penetration_dammult = 1.1
	damage_types = list(BRUTE = 4.5) //Very good base damage, negligible (5) AP, but no embedding. Think of it as arrow-hollowpoints.
	embed = FALSE
	armor_penetration = 0.5
	create_type = /obj/item/ammo_casing/arrow/broadhead

/obj/item/projectile/bullet/reusable/arrow/hunting
	name = "hunting arrow"
	icon_state = "arrow-bone"
	damage_types = list(BRUTE = 1) //Multiplied by 10 when fired.
	supereffective_types = list(/mob/living/carbon/human = FALSE, /mob/living = TRUE)
	supereffective_mult = 5 //we do 10 damage base, up to 50 against SE mobs, then with 50 AP on should do ~100. Slow to fire, unwieldly, slow projectiles (but reusable), so I'll say this is fair?
	armor_penetration = 10 //high ap to take advantage of overpen on mobs
	step_delay = 0.7 // 20% faster than normal arrows
	affective_damage_range = 8 //worse than the baroque, but better than regular arrows
	affective_ap_range = 8
	create_type = /obj/item/ammo_casing/arrow/hunting

/obj/item/projectile/bullet/reusable/arrow/hunting/heavy
	name = "fragmenting hunting arrow"
	icon_state = "arrow-bone"
	damage_types = list(BRUTE = 2) //Multiplied by 10 when fired.
	embed = TRUE
	hitscan = TRUE // Sniping round, fast
	supereffective_mult = 18 //we do 20 damage base, up to 360 against SE mobs, then with 55 (+5 hunting bow) AP on should do ~410. Baroque is around ~430 vs mobs, so roughly baroque-tier vs mobs, with the same wieldliness and different ammo costs (bone/leather/metal/plastic vs metal/cardboard).
	affective_damage_range = 10 // Worse than Baroque, better than its predecesor arrow
	affective_ap_range = 10
	create_type = null //NOT reusable.

/obj/item/projectile/bullet/reusable/arrow/reagent
	name = "chemical arrow"
	icon_state = "arrow-reagent"
	effective_faction = list()
	damage_types = list(BRUTE = 0.5) //Low damage, but chem-warfarable.
	embed = FALSE
	reagent_flags = INJECTABLE | DRAINABLE | AMOUNT_VISIBLE | REFILLABLE
	armor_penetration = 0.5
	step_delay = 1
	create_type = /obj/item/projectile/bullet/reusable/arrow/practice/payload
	var/volume = 15// We only splash the target with reagents, so we hold a little more than syrette arrows. Good for acids, incindiaries, etc.

/obj/item/projectile/bullet/reusable/arrow/reagent/Initialize()
	..()
	create_reagents(volume)

/obj/item/projectile/bullet/reusable/arrow/reagent/on_impact(atom/target)
	if (!testing)
		visible_message(SPAN_DANGER("The vial attached to [name] bursts, spraying [target] with its contents!"))
		reagents.splash(target, reagents.total_volume)
	return ..()

/obj/item/projectile/bullet/reusable/arrow/reagent/hypo
	name = "injector arrow"
	volume = 5 //hypo arrows only hold 5u of reagents.

/obj/item/projectile/bullet/reusable/arrow/reagent/hypo/on_impact(atom/target)
	if (!testing)
		visible_message(SPAN_DANGER("The hypo attached to [name] hits [target], injecting [target] with its contents!"))
		if(isliving(target))
			var/mob/living/injectee = target
			admin_inject_log(original_firer, target, src, reagents.log_list(), 5)
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
	create_type = /obj/item/ammo_casing/arrow/practice

/obj/item/projectile/bullet/reusable/arrow/practice/payload
	name = "empty payload arrow"
	step_delay = 1.1
	create_type = /obj/item/ammo_casing/arrow/empty_payload


//spolsives here

/obj/item/projectile/bullet/reusable/arrow/explosive
	name = "explosive arrow"
	desc = "Holy shit, there's a bomb taped to this arrow!"
	icon_state = "arrow-grenade"
	effective_faction = list()
	damage_types = list(HALLOSS = 1)
	embed = FALSE //impact fuze
	armor_penetration = 0
	step_delay = 1.1 //slower
	affective_damage_range = 6
	affective_ap_range = 6
	kill_count = 7 //heavy arrow, worse aerodynamics
	create_type = null

/obj/item/projectile/bullet/reusable/arrow/explosive/on_impact(atom/target)
	if (!testing)
		explosion(target, 0, 1, 3)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/frag
	name = "frag grenade arrow"
	desc = "Holy shit, there's a military-grade frag grenade taped to this arrow!"
	var/frag_type = /obj/item/projectile/bullet/pellet/fragment/strong
	var/frag_damage = 3
	var/frag_count = 75

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/on_impact(atom/target)
	if (!testing)
		fragment_explosion(target, 4, frag_type, frag_count, frag_damage, 2, 100)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/sting
	name = "stinger grenade arrow"
	desc = "Holy shit, there's a police-grade stinger grenade taped to this arrow!"
	frag_type = /obj/item/projectile/bullet/pellet/fragment/rubber
	frag_damage = 1
	frag_count = 50

/obj/item/projectile/bullet/reusable/arrow/explosive/frag/on_impact(atom/target)
	if (!testing)
		fragment_explosion(target, 4, frag_type, frag_count, frag_damage, 2, 100)
	return TRUE


/obj/item/projectile/bullet/reusable/arrow/explosive/emp
	name = "electromagnetic pulse grenade arrow"
	desc = "Holy shit, there's a EMP grenade taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/emp/on_impact(atom/target)
	if (!testing)
		empulse(target, 1, 2) //fairly weak
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/flashbang
	name = "flashbang arrow"
	desc = "Holy shit, there's a flashbang taped to this arrow!"

/obj/item/projectile/bullet/reusable/arrow/explosive/flashbang/on_impact(atom/target)
	if (!testing)
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
	if (!testing)
		heatwave(target, 1, 2, 25, TRUE, 0)
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke
	name = "smoke grenade arrow"
	desc = "Holy shit, there's a smoke grenade taped to this arrow!"
	var/datum/effect/effect/system/smoke_spread/bad/smoke

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/Initialize()
	..()
	if (!testing)
		src.smoke = new
		src.smoke.attach(src)

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/on_impact(atom/target)
	if (!testing)
		src.smoke.set_up(10, 0, usr.loc)
		src.smoke.start()
	return TRUE

/obj/item/projectile/bullet/reusable/arrow/explosive/smoke/Destroy()
	..()
	if (smoke)
		QDEL_NULL(smoke)
