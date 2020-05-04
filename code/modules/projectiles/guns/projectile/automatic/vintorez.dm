/obj/item/weapon/gun/projectile/automatic/vintorez
	name = "Excelsior \"Vintorez\" silenced carbine"
	desc = "A powerful armor-piercing rifle. Utilises a defunct design, but remains a popular armament. Uses 6.5 Carbine. This is a poorly made, autolathe printed version."
	icon = 'icons/obj/guns/projectile/vintorez.dmi'
	icon_state = "vintorez"
	item_state = "vintorez"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE //needs a new caliber type?
	origin_tech = list(TECH_COMBAT = 6, TECH_ILLEGAL = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_ROCKIN //need a new magwell type?
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 5)
	price_tag = 4000
	zoom_factor = 0.8 // double as IH_heavy
	penetration_multiplier = 1.5
	damage_multiplier = 1.2
	recoil_buildup = 8
	silencer_type = /obj/item/weapon/silencer
	one_hand_penalty = 15 //automatic rifle level

	firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_400
		)

//This comes with a preinstalled silencer
/obj/item/weapon/gun/projectile/automatic/vintorez/Initialize()
	.=..()
	apply_silencer(new /obj/item/weapon/silencer/integrated(src), null)

/obj/item/weapon/gun/projectile/automatic/vintorez/update_icon()
	var/iconstring = initial(icon_state)
	var/itemstring = initial(item_state)

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	item_state = itemstring

/obj/item/weapon/gun/projectile/automatic/vintorez/wood
	name = "\"Vintorez\" silenced carbine"
	desc = "A powerful armor-piercing rifle. Utilises a defunct design, but remains a popular armament. Uses 6.5 Carbine."
	icon = 'icons/obj/guns/projectile/vintorez_wood.dmi'
	icon_state = "vintorez"
	item_state = "vintorez"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE //needs a new caliber type?
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_ROCKIN //need a new magwell type?
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 5)
	price_tag = 4000
	zoom_factor = 0.8 // double as IH_heavy
	penetration_multiplier = 1.5
	damage_multiplier = 1.2
	recoil_buildup = 8
	silencer_type = /obj/item/weapon/silencer
	one_hand_penalty = 15 //automatic rifle level

	firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_400
		)

//This comes with a preinstalled silencer
/obj/item/weapon/gun/projectile/automatic/vintorez/wood/Initialize()
	.=..()
	apply_silencer(new /obj/item/weapon/silencer/integrated(src), null)

/obj/item/weapon/gun/projectile/automatic/vintorez/wood/update_icon()
	var/iconstring = initial(icon_state)
	var/itemstring = initial(item_state)

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	item_state = itemstring
