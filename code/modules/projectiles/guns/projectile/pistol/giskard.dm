/obj/item/gun/projectile/giskard
	name = "\"Giskard\" pistol"
	desc = "That's the most popular handgun produced by Holland & Sullivan. Can even fit into a pocket! Uses .35 Auto."
	icon = 'icons/obj/guns/projectile/giskard.dmi'
	icon_state = "giskard"
	item_state = "pistol"
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_CALIBRE_35, GUN_MAGWELL)
	caliber = CAL_PISTOL
	w_class = ITEM_SIZE_SMALL
	can_dual = TRUE
	fire_delay = 0.6
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 3)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 4)
	price_tag = 300
	damage_multiplier = 1
	penetration_multiplier = 0.8
	recoil_buildup = 3
	serial_type = "H&S"

/obj/item/gun/projectile/giskard/update_icon()
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

/obj/item/gun/projectile/giskard/Initialize()
	. = ..()
	update_icon()
