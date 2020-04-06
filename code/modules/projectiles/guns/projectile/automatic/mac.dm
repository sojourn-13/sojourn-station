/obj/item/weapon/gun/projectile/automatic/mac
	name = "\"MAC\" SMG"
	desc = "A conceptual replica of an old and incredibly simple SMG. However, ergonomics were never good on the original, and recoil is rather significant. Uses .35 Auto."
	icon = 'icons/obj/guns/projectile/mac.dmi'
	icon_state = "mac"
	item_state = "mac"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = 1
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	load_method = MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_PLASTIC = 4)
	price_tag = 2000
	damage_multiplier = 0.9
	recoil_buildup = 5
	one_hand_penalty = 20
	silencer_type = /obj/item/weapon/silencer
	one_hand_penalty = 5 //smg level

	firemodes = list(
		FULL_AUTO_600,
		SEMI_AUTO_NODELAY
		)

/obj/item/weapon/gun/projectile/automatic/mac/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/mac/Initialize()
	. = ..()
	update_icon()