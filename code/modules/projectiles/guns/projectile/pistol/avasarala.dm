/obj/item/gun/projectile/avasarala
	name = "\"Avasarala\" heavy pistol"
	desc = "An old weapon design, hyped up by its visual 'cool' factor but hardly good in any practical scenario. It's ineffective design and bafflingly badly done specs make it style over function all the way. Uses .50 kurtz."
	icon = 'icons/obj/guns/projectile/avasarala.dmi'
	icon_state = "avasarala"
	item_state = "avasarala"
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_50
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 1200 //Still worth alot despite being shit.
	can_dual = TRUE
	damage_multiplier = 1
	penetration_multiplier = 0.9
	recoil_buildup = 8
	one_hand_penalty = 15
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_CALIBRE_50)

/obj/item/gun/projectile/avasarala/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/basilisk/Initialize()
	. = ..()
	update_icon()