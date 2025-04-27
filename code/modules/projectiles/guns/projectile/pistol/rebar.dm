/obj/item/gun/projectile/rebar
	name = "\"Rebar\" heavy pistol"
	desc = "A GP heavy pistol that could punch a whole into several layers of plasteel. Uses .50 Kurz rounds. Also has the ablity to have a Master Unmaker integrated into it."
	icon = 'icons/obj/guns/projectile/rebar.dmi'
	icon_state = "type_90"
	item_state = "type_90"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_50
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 28, MATERIAL_PLASTIC = 6, MATERIAL_PLATINUM = 18)
	price_tag = 2250
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL
	damage_multiplier = 1.6
	init_recoil = HANDGUN_RECOIL(1)
	penetration_multiplier = 1
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_CALIBRE_50, GUN_SILENCABLE)
	allow_greyson_mods = TRUE

	fire_sound = 'sound/weapons/guns/fire/deckard_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	serial_type = "GP"

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig

/obj/item/gun/projectile/rebar/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (ammo_magazine)
		iconstring += "_mag"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring
