/obj/item/gun/projectile/shotgun
	//  New shotgun dm, could be expanded
	var/recentpumpmsg = 0 //  Variable to prevent chat message spam

	caliber = CAL_SHOTGUN
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT
	load_method = SINGLE_CASING|SPEEDLOADER

	bulletinsert_sound 	= 'sound/weapons/guns/interact/shotgun_insert.ogg'
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	cocked_sound = 'sound/weapons/guns/interact/shotgun_pump.ogg'

	ammo_type = /obj/item/ammo_casing/shotgun

	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)

	wield_delay = 2 SECOND
	wield_delay_factor = 0.5// 50 vig

	perk_plusone_eligible = TRUE //sideload edit.
	alt_plus_one_loading = TRUE //also sideload
