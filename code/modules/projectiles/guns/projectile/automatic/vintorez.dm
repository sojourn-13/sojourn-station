/obj/item/weapon/gun/projectile/automatic/vintorez
	name = "Excelsior .20 \"Vintorez\""
	desc = "A powerful armor-piercing rifle. Utilises a defunct design, but remains a popular armament."
	icon = 'icons/obj/guns/projectile/vintorez.dmi'
	icon_state = "vintorez"
	item_state = "vintorez"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = "a762" //needs a new caliber type?
	origin_tech = list(TECH_COMBAT = 6, TECH_ILLEGAL = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_AK //need a new magwell type?
	magazine_type = /obj/item/ammo_magazine/c762_long //needs a new magazine type?
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 5)
	price_tag = 4000
	zoom_factor = 0.8 // double as IH_heavy
	penetration_multiplier = 1.2
	damage_multiplier = 1.2
	recoil_buildup = 8
	one_hand_penalty = 10
	silencer_type = /obj/item/weapon/silencer

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
