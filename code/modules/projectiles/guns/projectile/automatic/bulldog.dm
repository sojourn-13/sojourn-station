/obj/item/weapon/gun/projectile/automatic/bulldog
	name = "\"Bulldog\" carbine"
	desc = "An economy-class carbine manufactured by Seinemetall Defense GmbH and used as a common carry gun for security and police far and wide, though also popular with various adventurous sorts as a semi-disposable option in the bush. Compact and reliable. Uses .257 Carbine rounds."
	icon = 'icons/obj/guns/projectile/bulldog.dmi'
	icon_state = "bulldog"
	item_state = "bulldog"
	w_class = ITEM_SIZE_BULKY
	load_method = MAGAZINE
	mag_well = MAG_WELL_STANMAG
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	price_tag = 1650
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	recoil_buildup = 7
	one_hand_penalty = 5 //bullpup rifle (this one is smaller and carbine, so it's 5)
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)

/obj/item/weapon/gun/projectile/automatic/bulldog/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/bulldog/Initialize()
	. = ..()
	update_icon()


/obj/item/weapon/gun/projectile/automatic/bulldog/rds
	name = "\"Bulldog\" carbine"
	desc = "A common carry gun manufactured by Seinemetall Defense GmbH for security and police far and wide. Compact and reliable. Uses .257 Carbine rounds. This one comes with red dot sight."
	icon = 'icons/obj/guns/projectile/bulldog_rds.dmi'
	icon_state = "bulldog_rds"
	item_state = "bulldog_rds"
	price_tag = 1225
	zoom_factor = 0.3