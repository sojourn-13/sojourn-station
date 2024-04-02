/obj/item/gun/projectile/shotgun
	//  New shotgun dm, could be expanded
	var/recentpumpmsg = 0 //  Variable to prevent chat message spam
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)

	wield_delay = 2 SECOND
	wield_delay_factor = 0.5// 50 vig

	perk_plusone_eligible = TRUE //sideload edit.
	alt_plus_one_loading = TRUE //also sideload