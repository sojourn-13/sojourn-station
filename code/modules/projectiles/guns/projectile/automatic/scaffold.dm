/obj/item/gun/projectile/automatic/scaffold
	name = "Greyson Positronic \"Scaffold\" caseless rifle"
	desc = "A old and lost gun design of a caseless rifle by Greyson Positronic, its high rate of fire, stopping power and more make it the perfect tool of war. \
	Its caliber is 10mm and, shockingly, it can be fitted with a silencer, has room for a scope and the ablity for a Master Unmaker to be integrated into it."
	icon = 'icons/obj/guns/projectile/scaffold.dmi'
	icon_state = "scaffold"
	item_state = "scaffold"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_PAINFUL
	caliber = "10x24"
	origin_tech = list(TECH_COMBAT = 12, TECH_MATERIAL = 10)
	slot_flags = SLOT_BELT|SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PULSE
	auto_eject = TRUE
	matter = list(MATERIAL_PLASTEEL = 35, MATERIAL_PLASTIC = 35, MATERIAL_PLATINUM = 20)
	price_tag = 2000
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	damage_multiplier = 1.5 //simular to 257
	penetration_multiplier = 2
	init_recoil = LMG_RECOIL(0.6)
	serial_type = "GP"

	wield_delay = 1.4 SECOND
	wield_delay_factor = 0.4 // 40 vig for insta wield
	gun_parts = list(/obj/item/part/gun = 2, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/clrifle = 1)

	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE ,GUN_SCOPE, GUN_MAGWELL)
	allow_greyson_mods = TRUE

	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)

/obj/item/gun/projectile/automatic/scaffold/update_icon()
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
