/obj/item/gun/projectile/automatic/vintorez
	name = "Excelsior \"Vintorez\" silenced carbine"
	desc = "\"We have no compassion and we ask no compassion from you. When our turn comes, we shall not make excuses for the terror.\"\
	A powerful armor-piercing rifle. Utilises a defunct design, but remains a popular armament. Uses 7.5mm Rifle rounds."
	icon = 'icons/obj/guns/projectile/vintorez.dmi'
	icon_state = "vintorez"
	item_state = "vintorez"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_RIFLE //needs a new caliber type?
	origin_tech = list(TECH_COMBAT = 6, TECH_ILLEGAL = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE //need a new magwell type?
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 5)
	price_tag = 2000
	zoom_factor = 0.8 // double as IH_heavy
	penetration_multiplier = 1.2
	damage_multiplier = 1.2
	extra_damage_mult_scoped = 0.3
	recoil_buildup = 5
	one_hand_penalty = 10 //automatic rifle level
	silenced = TRUE
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_400
		)
	serial_type = "EXC"

/obj/item/gun/projectile/automatic/vintorez/NM_colony
	name = "\"Val\" silenced carbine"
	desc = "A powerful armor-piercing rifle. Utilises a defunct design, but remains a popular armament. Uses 7.5mm Rifle rounds."
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2)
	price_tag = 800
	serial_type = "NM"

/obj/item/gun/projectile/automatic/vintorez/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/vintorez/Initialize()
	. = ..()
	update_icon()