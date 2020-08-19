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