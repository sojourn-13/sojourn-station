/obj/item/weapon/gun/projectile/automatic/wirbelwind
	name = "\"Wirbelwind\" SMG"
	desc = "A compact and lightweight law enforcement PDW produced by Seinemetall. Uses .35 Auto."
	icon = 'icons/obj/guns/projectile/wirbelwind.dmi'
	icon_state = "wirbelwind"
	item_state = "wirbelwind"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	load_method = MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_H_PISTOL
	auto_eject = 1
	can_dual = 1
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_PLASTIC = 4)
	price_tag = 1500 //good smg with normal recoil and silencer possibility
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	damage_multiplier = 0.9
	recoil_buildup = 2.5
	one_hand_penalty = 20
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_CALIBRE_35)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND,
		FULL_AUTO_600
		)

/obj/item/weapon/gun/projectile/automatic/wirbelwind/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/wirbelwind/Initialize()
	. = ..()
	update_icon()