/obj/item/weapon/gun/projectile/firefly
	name = "\"Firefly\" pistol"
	desc = "A simple and reliable sidearm produced by Holland & Sullivan Arms for the officer on the street. Commonly issued as a sidearm by police forces and security companies. Uses .35 Auto in high-capacity magazines.."
	icon = 'icons/obj/guns/projectile/firefly.dmi'
	icon_state = "firefly"
	item_state = "firefly"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = 1
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	load_method = MAGAZINE
	mag_well = MAG_WELL_H_PISTOL
	auto_eject = 1
	matter = list(MATERIAL_PLASTEEL = 14, MATERIAL_PLASTIC = 4)
	price_tag = 750
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	damage_multiplier = 1
	recoil_buildup = 15
	one_hand_penalty = 10
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_SILENCABLE)

/obj/item/weapon/gun/projectile/firefly/update_icon()
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

/obj/item/weapon/gun/projectile/firefly/Initialize()
	. = ..()
	update_icon()
