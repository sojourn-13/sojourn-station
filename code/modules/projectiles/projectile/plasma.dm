/obj/item/projectile/plasma
	name = "plasma bolt"
	icon_state = "plasma_bolt"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	damage_types = list(BURN = 28)
	armor_penetration = 15
	check_armour = ARMOR_ENERGY

	muzzle_type = /obj/effect/projectile/plasma/muzzle
	impact_type = /obj/effect/projectile/plasma/impact

/obj/item/projectile/plasma/light
	name = "light plasma bolt"
	damage_types = list(BURN = 28)
	armor_penetration = 0

/obj/item/projectile/plasma/heavy
	name = "heavy plasma bolt"
	damage_types = list(BURN = 30)
	armor_penetration = 30

/obj/item/projectile/plasma/impact
	name = "plasma impact bolt"
	damage_types = list(HALLOS = 0)
	stun = 1
	weaken = 5
	knockback = 2

/obj/item/projectile/plasma/stun
	name = "stun plasma bolt"
	taser_effect = 1
	agony = 30
	damage_types = list(HALLOS = 0)
	impact_type = /obj/effect/projectile/stun/impact

//laser tag stuff
/obj/item/projectile/plasma/lastertag/blue
	name = "lasertag beam"
	icon_state = "lasertag"
	pass_flags = PASSTABLE
	damage_types = list(BURN = 0)
	no_attack_log = 1
	check_armour = ARMOR_ENERGY

/obj/item/projectile/plasma/lastertag/blue/on_hit(atom/target)
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		if(prob(20) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/greentag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/redtag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/yellowtag)))
			M.Weaken(8)
	return 1

/obj/item/projectile/plasma/lastertag/red
	name = "lasertag beam"
	icon_state = "lasertag"
	damage_types = list(BURN = 0)
	no_attack_log = 1
	check_armour = ARMOR_ENERGY

/obj/item/projectile/plasma/lastertag/red/on_hit(atom/target)
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		if(prob(20) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/greentag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/bluetag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/yellowtag)))
			M.Weaken(8)
	return 1

/obj/item/projectile/plasma/lastertag/green
	name = "lasertag beam"
	icon_state = "lasertag"
	damage_types = list(BURN = 0)
	no_attack_log = 1
	check_armour = ARMOR_ENERGY

/obj/item/projectile/plasma/lastertag/green/on_hit(atom/target)
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		if(prob(20) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/bluetag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/redtag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/yellowtag)))
			M.Weaken(8)
	return 1

/obj/item/projectile/plasma/lastertag/yellow
	name = "lasertag beam"
	icon_state = "lasertag"
	damage_types = list(BURN = 0)
	no_attack_log = 1
	check_armour = ARMOR_ENERGY

/obj/item/projectile/plasma/lastertag/yellow/on_hit(atom/target)
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		if(prob(20) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/greentag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/redtag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/bluetag)))
			M.Weaken(8)
	return 1

/obj/item/projectile/plasma/lastertag/omni//A laser tag bolt that stuns EVERYONE
	name = "lasertag beam"
	icon_state = "lasertag"
	damage_types = list(BURN = 0)
	check_armour = ARMOR_ENERGY

	muzzle_type = /obj/effect/projectile/laser_omni/muzzle
	tracer_type = /obj/effect/projectile/laser_omni/tracer
	impact_type = /obj/effect/projectile/laser_omni/impact

/obj/item/projectile/plasma/lastertag/omni/on_hit(atom/target)
	if(ishuman(target))
		var/mob/living/carbon/human/M = target
		if(prob(25) && (istype(M.wear_suit, /obj/item/clothing/suit/fluff/greentag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/bluetag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/redtag))||(istype(M.wear_suit, /obj/item/clothing/suit/fluff/yellowtag)))
			M.Weaken(5)
	return 1