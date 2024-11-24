/obj/item/gun/projectile/automatic/nail_gun
	name = "Greyson Positronic \"Nail\" rifle"
	desc = "An old and lost gun design of a rifle by Greyson Positronic, its high rate of fire, stopping power and more make it the perfect tool for war. \
	Its caliber is 6.5mm and, shockingly, it can be fitted with a silencer, has room for a scope and the ablity to have a Master Unmaker integrated into it."
	icon = 'icons/obj/guns/projectile/nail_gun.dmi'
	icon_state = "nail_gun"
	item_state = "nail_gun"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 12, TECH_MATERIAL = 10)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	auto_eject = TRUE
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_PLASTIC = 25, MATERIAL_PLATINUM = 20)
	price_tag = 2000
	fire_sound_silenced = 'sound/weapons/guns/fire/m41_shoot.ogg'
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	damage_multiplier = 1.2
	penetration_multiplier = 1.5
	init_recoil = CARBINE_RECOIL(0.2)

	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_SCOPE, GUN_MAGWELL)
	allow_greyson_mods = TRUE

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		FULL_AUTO_300
		)
	serial_type = "GP"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // SMG level
	gun_parts = list(/obj/item/part/gun = 2, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/gun/projectile/automatic/nail_gun/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)
