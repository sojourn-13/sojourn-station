/obj/item/gun/projectile/silvereye
	name = "\"Silver-Eye\" heavy pistol"
	desc = "A silver plated Basilisk heavy pistol, customized with specialized counterweights to assist with recoil handling. Gifted to the Foreman by Over-Boss Jeremiah Hogg in exchange for their wrangling of the prospector team. Uses .50 Kurtz rounds."
	icon = 'icons/obj/guns/projectile/silvereye.dmi'
	icon_state = "silvereye"
	item_state = "silvereye"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_50
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_SILVER = 6, MATERIAL_WOOD = 6, MATERIAL_STEEL = 6)
	price_tag = 1250
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL
	damage_multiplier = 1.2
	recoil_buildup = 5
	one_hand_penalty = 10
	penetration_multiplier = 1
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_CALIBRE_50)
	reload_sound 	= 'sound/weapons/guns/interact/reload_silver.ogg'
	fire_sound = 'sound/weapons/guns/fire/fire_silver.ogg'
	serial_type = "NM"

/obj/item/gun/projectile/silvereye/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring

/obj/item/gun/projectile/silvereye/Initialize()
	. = ..()
	update_icon()
