/obj/item/projectile/beam/ameridian
	name = "ameridian"
	icon_state = "xray"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	damage_types = list(BURN  = 30) // 10 more damage than the Cog
	irradiate = 25
	armor_penetration = 15 // 5 less AP than the Cog
	check_armour = ARMOR_ENERGY
	hitscan = TRUE
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine
	muzzle_type = /obj/effect/projectile/ameridian/muzzle
	tracer_type = /obj/effect/projectile/ameridian/tracer
	impact_type = /obj/effect/projectile/ameridian/impact
	kill_count = 15 // How long until they disapear
