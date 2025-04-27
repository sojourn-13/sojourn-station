/obj/item/projectile/beam/ameridian
	name = "ameridian"
	icon_state = "xray"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	damage_types = list(BURN  = 40) // 20 more damage than the Cog
	irradiate = 15
	armor_divisor = 1.15 //less AP than the Cog
	check_armour = ARMOR_ENERGY
	hitscan = TRUE
	invisibility = 101	//beam projectiles are invisible as they are rendered by the effect engine
	muzzle_type = /obj/effect/projectile/ameridian/muzzle
	tracer_type = /obj/effect/projectile/ameridian/tracer
	impact_type = /obj/effect/projectile/ameridian/impact
	kill_count = 15 // How long until they disapear
	affective_damage_range = 2
	affective_ap_range = 2

/obj/item/projectile/ameridian_shard
	name = "ameridian shard"
	damage_types = list(BRUTE = 30) //Were a bit better then .40 to stay competitive
	irradiate = 10
	armor_divisor = 1.15
	check_armour = ARMOR_BULLET
	embed = TRUE
	shrapnel_type = /obj/item/material/shard/ameridian
	affective_damage_range = 2
	affective_ap_range = 2

/obj/item/projectile/ameridian_shard/golem/attack_mob(mob/living/target_mob, distance, miss_modifier=0)
	if(target_mob.faction == "ameridian")
		return FALSE
	else
		return ..()
