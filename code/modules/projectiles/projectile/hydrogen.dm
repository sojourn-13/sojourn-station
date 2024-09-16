/obj/item/projectile/hydrogen
	name = "plasma bolt"
	icon_state = "plasma_bolt"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	damage_types = list(BURN = 70)
	armor_divisor = 2.25
	check_armour = ARMOR_ENERGY
	muzzle_type = /obj/effect/projectile/plasma/muzzle
	impact_type = /obj/effect/projectile/plasma/impact
	kill_count = 15 // How long until they disapear
	recoil = 20

/obj/item/projectile/hydrogen/on_impact(atom/target)
	if (!testing)
		explosion(loc, 0, 0, 2) // Smallest possible explosion
		set_light(0)
		return TRUE

/obj/item/projectile/hydrogen/pistol
	kill_count = 10
	recoil = 10

/obj/item/projectile/hydrogen/pistol/welder
	kill_count = 5
	recoil = 5

/obj/item/projectile/hydrogen/cannon
	kill_count = 12
	recoil = 30

/obj/item/projectile/hydrogen/cannon/on_impact(atom/target)
	if (!testing)
		explosion(loc, 0, 1, 2, 4) // Same values as the missile.
		set_light(0)
		return TRUE

// Overcharged Shots
/obj/item/projectile/hydrogen/max
	damage_types = list(BURN = 90)
	armor_divisor = 2.75
	recoil = 40

/obj/item/projectile/hydrogen/pistol/max
	damage_types = list(BURN = 80)
	armor_divisor = 2.5
	recoil = 20

/obj/item/projectile/hydrogen/cannon/max
	damage_types = list(BURN = 100)
	armor_divisor = 3
	recoil = 60
