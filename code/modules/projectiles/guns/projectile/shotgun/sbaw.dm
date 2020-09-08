/obj/item/weapon/gun/projectile/automatic/sbaw
	name = "\"Mjolnir\" payload rifle"
	desc = "A 20mm Smooth Bore Assault Weapon(SBAW), the distant relative of the Omnirifle series taking the big-bore utility platform to its logical conclusion. \
	Taking the role of both assault shotgun and grenade launcher, it's a terrifying impliment often used by shock troops to crack light vehicles, mechs, power armor, and infantry in defilade."
	icon = 'icons/obj/guns/projectile/sbaw.dmi'
	icon_state = "sbaw"
	item_state = "sbaw"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_SHOTGUN
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_DRUM
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 1500
	penetration_multiplier = 1.2
	damage_multiplier = 1
	zoom_factor = 0.3
	fire_delay = 12
	recoil_buildup = 25
	one_hand_penalty = 50
	fire_sound = 'sound/weapons/guns/fire/heavy_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/batrifle_cock.ogg'

	init_firemodes = list(
	SEMI_AUTO_NODELAY
	)

/obj/item/weapon/gun/projectile/automatic/sbaw/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(ammo_magazine)
		add_overlay("_mag[ammo_magazine.max_ammo]")
	else
		cut_overlays()
		return

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/sbaw/Initialize()
	. = ..()
	update_icon()


/obj/item/weapon/gun/projectile/automatic/sbaw/admin
	name = "\"Gloryhammer\" payload rifle"
	desc = "An obscene tool of destruction forged by ancient gods of warfare, sowing horror when you weild this Thunder Striking Wizard Thrasher."
	icon = 'icons/obj/guns/projectile/sbaw.dmi'
	icon_state = "sbaw"
	penetration_multiplier = 1.5
	damage_multiplier = 1.5
	recoil_buildup = 5
	fire_delay = 0.5
	init_firemodes = list(
	SEMI_AUTO_NODELAY,
	FULL_AUTO_400,
	)