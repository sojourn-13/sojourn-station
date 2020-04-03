/obj/item/weapon/gun/projectile/automatic/bulldog
	name = "\"Bulldog\" carbine"
	desc = "An economy-class carbine used as a common carry gun for security and police far and wide, though also popular with various adventurous sorts as a semi-disposable option in the bush. Compact and reliable. Uses 6.5 Carbine rounds."
	icon = 'icons/obj/guns/projectile/bulldog.dmi'
	icon_state = "bulldog"
	item_state = "bulldog"
	w_class = ITEM_SIZE_BULKY
	load_method = MAGAZINE
	mag_well = MAG_WELL_ROCKIN
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	price_tag = 2300
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	recoil_buildup = 13
	one_hand_penalty = 5 //bullpup rifle (this one is smaller and carbine, so it's 5)

	firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)

/obj/item/weapon/gun/projectile/automatic/bulldog/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/bulldog/Initialize()
	. = ..()
	update_icon()

/obj/item/weapon/gun/projectile/automatic/bulldog/rds
	desc = "A common carry gun for security and police far and wide Compact and reliable. Uses 6.5 Carbine rounds. This one comes with red dot sight."
	icon_state = "bulldog-rds"
	price_tag = 2350
	zoom_factor = 0.3