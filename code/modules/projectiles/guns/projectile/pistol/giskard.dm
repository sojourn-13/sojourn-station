/obj/item/weapon/gun/projectile/giskard
	name = "HS HG .32 \"Giskard\""
	desc = "That's the \"Heckler and Sons\" most popular pistol. Can even fit into a pocket! Uses .32 rounds."
	icon = 'icons/obj/guns/projectile/giskard.dmi'
	icon_state = "giskard"
	item_state = "pistol"
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	silencer_type = /obj/item/weapon/silencer
	caliber = ".32"
	ammo_mag = "mag_cl32"
	w_class = ITEM_SIZE_SMALL
	can_dual = 1
	fire_delay = 0.6
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 3)
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 4)
	price_tag = 600
	damage_multiplier = 1
	penetration_multiplier = 0.9
	recoil_buildup = 2
	one_hand_penalty = 15

/obj/item/weapon/gun/projectile/giskard/update_icon()
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

/obj/item/weapon/gun/projectile/giskard/Initialize()
	. = ..()
	update_icon()
