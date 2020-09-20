/obj/item/weapon/gun/projectile/mk58
	name = "\"Thorn\" pistol"
	desc = "The OT Thorn is a cheap, ubiquitous sidearm, that was one of the Old Testaments few ballistic creations, though it bears a clear resemblance to the Mk-58 Mod 0. Uses .35 Auto."
	icon = 'icons/obj/guns/projectile/mk58.dmi'
	icon_state = "mk58"
	item_state = "mk58"
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6)
	price_tag = 700
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	can_dual = 1
	load_method = MAGAZINE
	mag_well = MAG_WELL_H_PISTOL|MAG_WELL_PISTOL
	damage_multiplier = 1.1
	penetration_multiplier = 0.9
	recoil_buildup = 3
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_SILENCABLE)
	one_hand_penalty = 10

/obj/item/weapon/gun/projectile/mk58/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_empty"
	else
		iconstring = initial(icon_state) + "_full"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/mk58/wood
	name = "\"Rose\" magnum pistol"
	desc = "The OT Rose is a cheap, yet ubiquitous sidearm, that was one of the Old Testaments few ballistic creations. Uses .40 Auto-Mag. This one has a finely polished wood furnish."
	icon = 'icons/obj/guns/projectile/mk58_wood.dmi'
	icon_state = "mk58"
	item_state = "mk58"
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 900
	mag_well = MAG_WELL_PISTOL
	caliber = CAL_MAGNUM
	damage_multiplier = 0.9
	recoil_buildup = 6
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE)

/obj/item/weapon/gun/projectile/mk58/wood/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_empty"
	else
		iconstring = initial(icon_state) + "_full"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)
