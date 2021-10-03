/obj/item/gun/projectile/revolver/little_comet
	name = "\"Little Comet\" revolver"
	desc = "A special revolver developed to be as flashy and over priced as the businessmen that carry them. A special gravity based modification in the cylinder allows for it to over penetrate \
	even solid steel walls despite its low caliber, the weapons value derived from said gravitonic modification being old tech from greyson that can no longer be reproduced. Uses .35 special rounds."
	icon = 'icons/obj/guns/projectile/little_comet.dmi'
	icon_state = "little_comet"
	item_state = "little_comet"
	drawChargeMeter = FALSE
	max_shells = 6
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 10, TECH_MATERIAL = 2)
	ammo_type = /obj/item/ammo_casing/pistol_35
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 5000
	damage_multiplier = 1.1 //because pistol round
	penetration_multiplier = 20
	pierce_multiplier =  5
	recoil_buildup = 13
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_SILENCABLE)

/obj/item/gun/projectile/revolver/little_comet/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)