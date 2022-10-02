/obj/item/gun/projectile/trouble_shooter
	name = "GP \"Trouble Shooter\" rifle pistol"
	desc = "With many issues raising from eather robotics or human the GP answer was a gun to shoot though several layers of steel or kevlar alike. \
	It's materteral cost lead to it being mainly used in house rather then mass production."
	icon = 'icons/obj/guns/projectile/type_21.dmi'
	icon_state = "type_21" //Sprite by Valo#3611
	item_state = "type_21"
	matter = list(MATERIAL_PLASTEEL = 45, MATERIAL_PLASTIC = 55, MATERIAL_PLATINUM = 30)
	w_class = ITEM_SIZE_NORMAL
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = CAL_RIFLE
	price_tag = 3400
	damage_multiplier = 1.4
	penetration_multiplier = 3
	init_recoil = HMG_RECOIL(0.5)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)
	serial_type = "GP"
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SILENCABLE)

/obj/item/gun/projectile/trouble_shooter/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_empty"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)