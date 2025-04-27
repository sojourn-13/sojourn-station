/obj/item/gun/projectile/judiciary
	name = "\"Judiciary\" pistol"
	desc = "A common Nadezhda Marshal issue pistol chambered in .35. This pistol appears to be the workhorse of Marshals, a near staple found in pictures on nearly any recruiting ad. \
			By the looks of the mag-loading mechanism this firearm is strangely able to take standard, high-cap and drum magazines! Truely a marvel of engineering; even... if it feels unsteady when holding the drum."
	icon = 'icons/obj/guns/projectile/judiciary.dmi'
	icon_state = "judiciary"
	item_state = "judiciary"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 550
	fire_sound = 'sound/weapons/guns/fire/9mm_marshal_pistol.ogg' //Use this for any other one that gets added, USP firing sound / Sound taken from JSRS SOUND MOD https://www.moddb.com/mods/stalker-anomaly/addons/solarint-gunshot-overhaul
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_H_PISTOL|MAG_WELL_PISTOL|MAG_WELL_DRUM
	damage_multiplier = 1
	penetration_multiplier = 1.2
	zoom_factors = list(0.2)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_SILENCABLE, GUN_MAGWELL)
	init_recoil = HANDGUN_RECOIL(0.8)
	auto_eject = TRUE
	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)
	serial_type = "NM"

	wield_delay = 0.2 SECOND
	wield_delay_factor = 0.2 // 20 vig
	gun_parts = list(/obj/item/part/gun/frame/judiciary = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/part/gun/frame/judiciary
	name = "Judiciary frame"
	desc = "A Judiciary pistol frame. A reliable companion in the field."
	icon_state = "frame_judiciary"
	result = /obj/item/gun/projectile/judiciary
	resultvars = list(/obj/item/gun/projectile/judiciary)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol)

/obj/item/gun/projectile/judiciary/update_icon()
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
