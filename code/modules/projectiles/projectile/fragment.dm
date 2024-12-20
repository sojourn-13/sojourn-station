/obj/item/projectile/bullet/pellet/fragment
	damage_types = list(BRUTE = 7)
	range_step = 2

	base_spread = 0 //causes it to be treated as a shrapnel explosion instead of cone
	spread_step = 20

	silenced = TRUE //embedding messages are still produced so it's kind of weird when enabled.
	no_attack_log = 1
	muzzle_type = null

/obj/item/projectile/bullet/pellet/fragment/strong
	damage_types = list(BRUTE = 13)

/obj/item/projectile/bullet/pellet/fragment/weak
	damage_types = list(BRUTE = 3)

/obj/item/projectile/bullet/pellet/fragment/invisible
	name = "explosion"
	icon_state = "invisible"
	embed = 0
	damage_types = list(BRUTE = 16)
	check_armour = ARMOR_BOMB

/obj/item/projectile/bullet/pellet/fragment/rubber
	damage_types = list(BRUTE = 1, HALLOSS = 25)// 70 x 25 = 1750 pain, if all hit, rather then 32 x 150
	//ricochet_mod = 3 // :3c
	can_ricochet = TRUE
	embed = FALSE
	sharp = FALSE
	ignition_source = FALSE

/obj/item/projectile/bullet/pellet/fragment/ember
	name = "phosphorous ember"
	icon = 'icons/obj/projectiles_64x64.dmi'
	icon_state = "phosphorus_ember"
	damage_types = list(BURN = 5)
	check_armour = ARMOR_ENERGY
	embed = 0
	pellets = 1
	range_step = 5
	can_ricochet = FALSE

/obj/item/projectile/bullet/pellet/fragment/ember/on_hit(atom/target)
	if (!testing)
		var/datum/effect/effect/system/smoke_spread/white_phosphorous/S = new /datum/effect/effect/system/smoke_spread/white_phosphorous
		S.set_up(1, 0, get_turf(src))
		S.start()
		return TRUE
