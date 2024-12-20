/obj/item/projectile/plasma
	name = "plasma bolt"
	icon_state = "plasma_bolt"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	damage_types = list(BURN = 28)
	armor_divisor = 1.1
	check_armour = ARMOR_ENERGY
	fire_stacks = 1 //Blasma

	affective_damage_range = 3
	affective_ap_range = 5

	recoil = 8
	has_drop_off = TRUE

	muzzle_type = /obj/effect/projectile/plasma/muzzle
	impact_type = /obj/effect/projectile/plasma/impact

/obj/item/projectile/plasma/shell
	damage_types = list(BURN = 40)
	recoil = 12

/obj/item/projectile/plasma/light
	name = "light plasma bolt"
	damage_types = list(BURN = 33)
	armor_divisor = 0.65
	recoil = 7

/obj/item/projectile/plasma/heavy
	name = "heavy plasma bolt"

	affective_damage_range = 2
	affective_ap_range = 3
	recoil = 10
	fire_stacks = 1

	damage_types = list(BURN = 30)
	armor_divisor = 2.3

/obj/item/projectile/plasma/heavy/shell
	damage_types = list(BURN = 42)
	recoil = 24

/obj/item/projectile/plasma/heavy/super_heavy
	name = "superheavy plasma bolt"
	damage_types = list(BURN = 50)
	affective_damage_range = 1
	affective_ap_range = 2
	recoil = 30
	fire_stacks = 1

/obj/item/projectile/plasma/impact
	name = "plasma impact bolt"
	damage_types = list(HALLOSS = 0)
	stun = 1
	weaken = 5
	knockback = 2
	recoil = 60

/obj/item/projectile/plasma/stun
	name = "stun plasma bolt"
	taser_effect = 1
	damage_types = list(HALLOSS = 30)
	impact_type = /obj/effect/projectile/stun/impact
	recoil = 7
	fire_stacks = 0

//laser tag stuff
/obj/item/projectile/plasma/lastertag/blue
	name = "lasertag beam"
	icon_state = "lasertag"
	pass_flags = PASSTABLE
	damage_types = list(BURN = 0)
	no_attack_log = 1
	check_armour = ARMOR_ENERGY
	recoil = 1
	fire_stacks = 0
	ignition_source = FALSE

/obj/item/projectile/plasma/lastertag/blue/on_hit(atom/target)
	if (!testing)
		if(ishuman(target))
			var/mob/living/carbon/human/M = target
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/greentag)))
				M.Weaken(5)
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/redtag)))
				M.Weaken(5)
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/yellowtag)))
				M.Weaken(5)
	return TRUE

/obj/item/projectile/plasma/lastertag/red
	name = "lasertag beam"
	icon_state = "lasertag"
	damage_types = list(BURN = 0)
	no_attack_log = 1
	check_armour = ARMOR_ENERGY
	recoil = 1
	fire_stacks = 0
	ignition_source = FALSE

/obj/item/projectile/plasma/lastertag/red/on_hit(atom/target)
	if (!testing)
		if(ishuman(target))
			var/mob/living/carbon/human/M = target
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/greentag)))
				M.Weaken(5)
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/bluetag)))
				M.Weaken(5)
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/yellowtag)))
				M.Weaken(5)
	return TRUE

/obj/item/projectile/plasma/lastertag/green
	name = "lasertag beam"
	icon_state = "lasertag"
	damage_types = list(BURN = 0)
	no_attack_log = 1
	check_armour = ARMOR_ENERGY
	recoil = 1
	fire_stacks = 0
	ignition_source = FALSE

/obj/item/projectile/plasma/lastertag/green/on_hit(atom/target)
	if (!testing)
		if(ishuman(target))
			var/mob/living/carbon/human/M = target
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/redtag)))
				M.Weaken(5)
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/bluetag)))
				M.Weaken(5)
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/yellowtag)))
				M.Weaken(5)
	return TRUE

/obj/item/projectile/plasma/lastertag/yellow
	name = "lasertag beam"
	icon_state = "lasertag"
	damage_types = list(BURN = 0)
	no_attack_log = 1
	check_armour = ARMOR_ENERGY
	recoil = 1
	fire_stacks = 0
	ignition_source = FALSE

/obj/item/projectile/plasma/lastertag/yellow/on_hit(atom/target)
	if (!testing)
		if(ishuman(target))
			var/mob/living/carbon/human/M = target
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/redtag)))
				M.Weaken(5)
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/bluetag)))
				M.Weaken(5)
			if(prob(60) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/greentag)))
				M.Weaken(5)
	return TRUE

/obj/item/projectile/plasma/lastertag/omni//A laser tag bolt that stuns EVERYONE
	name = "lasertag beam"
	icon_state = "lasertag"
	damage_types = list(BURN = 0)
	check_armour = ARMOR_ENERGY
	recoil = 1
	fire_stacks = 0
	ignition_source = FALSE

	muzzle_type = /obj/effect/projectile/laser_omni/muzzle
	tracer_type = /obj/effect/projectile/laser_omni/tracer
	impact_type = /obj/effect/projectile/laser_omni/impact

/obj/item/projectile/plasma/lastertag/omni/on_hit(atom/target)
	if (!testing)
		if(ishuman(target))
			var/mob/living/carbon/human/M = target
			if(prob(65) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/redtag)))
				M.Weaken(4)
			if(prob(65) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/bluetag)))
				M.Weaken(4)
			if(prob(65) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/greentag)))
				M.Weaken(4)
			if(prob(65) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/yellowtag)))
				M.Weaken(4)
	return TRUE

//Unused atm
/obj/item/projectile/plasma/gauss
	name = "gauss"
	icon_state = "gauss"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/ric4.ogg'
	damage_types = list(BRUTE = 54)
	armor_divisor = 4
	check_armour = ARMOR_BULLET
	affective_damage_range = 16
	affective_ap_range = 16
	hitscan = TRUE
	recoil = 50
	fire_stacks = 0

/obj/item/projectile/plasma/check_penetrate(var/atom/A)
	if(istype(A, /obj/item/shield))
		var/obj/item/shield/S = A
		var/loss = min(round(armor_divisor * 2 / S.durability), 1)
		block_damage(loss, A)
		A.visible_message(SPAN_WARNING("\The [src] is weakened by the \the [A]!"))
		playsound(A.loc, 'sound/weapons/shield/shielddissipate.ogg', 50, 1)
		return TRUE
	else if(istype(A, /obj/structure/barricade) || istype(A, /obj/structure/table) || istype(A, /obj/structure/low_wall))
		return FALSE

	return TRUE
