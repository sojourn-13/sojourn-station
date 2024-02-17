/obj/item/gun/projectile/trouble_shooter
	name = "GP \"Trouble Shooter\" rifle"
	desc = "With many issues being raised from rogue robots and people alike, the Greyson Positronic answer was a gun to shoot though several layers of armor \
	Its material cost lead to it being mainly used in-house rather than in mass production. With the ablity to have a Master Unmaker integrated into it."
	icon = 'icons/obj/guns/projectile/type_21.dmi'
	icon_state = "type_21" //Sprite by Valo#3611
	item_state = "type_21"
	matter = list(MATERIAL_PLASTEEL = 45, MATERIAL_PLASTIC = 55, MATERIAL_PLATINUM = 30)
	w_class = ITEM_SIZE_NORMAL
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = CAL_RIFLE
	fire_sound = 'sound/weapons/guns/fire/batrifle_fire.ogg'
	price_tag = 3400
	damage_multiplier = 1.5
	penetration_multiplier = 1
	pierce_multiplier = 2
	init_recoil = HMG_RECOIL(0.5)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)
	serial_type = "GP"
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SILENCABLE)
	allow_greyson_mods = TRUE

	wield_delay = 1.5 SECOND
	wield_delay_factor = 0.4 // 40 vig to insta wield , heavy class rifle

/obj/item/gun/projectile/trouble_shooter/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_empty"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)
