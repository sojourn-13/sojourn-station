/obj/item/projectile/hydrogen
	name = "plasma bolt"
	icon_state = "plasma_bolt"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	damage_types = list(BURN = 100)
	armor_penetration = 30
	check_armour = ARMOR_ENERGY
	muzzle_type = /obj/effect/projectile/plasma/muzzle
	impact_type = /obj/effect/projectile/plasma/impact
	kill_count = 15 // How long until they disapear

/obj/item/projectile/hydrogen/on_impact(atom/target)
	explosion(loc, 0, 0, 2) // Smallest possible explosion
	set_light(0)
	return TRUE

/obj/item/projectile/hydrogen/pistol
	kill_count = 10

/obj/item/projectile/hydrogen/pistol/welder
	kill_count = 5

/obj/item/projectile/hydrogen/cannon
	kill_count = 12

/obj/item/projectile/hydrogen/cannon/on_impact(atom/target)
	explosion(loc, 0, 1, 2, 4) // Same values as the missile.
	set_light(0)
	return TRUE

// Overcharged Shots
/obj/item/projectile/hydrogen/max
	damage_types = list(BURN = 150)
	armor_penetration = 50


/obj/item/projectile/hydrogen/pistol/max
	damage_types = list(BURN = 150)
	armor_penetration = 50

/obj/item/projectile/hydrogen/cannon/max
	damage_types = list(BURN = 150)
	armor_penetration = 50
