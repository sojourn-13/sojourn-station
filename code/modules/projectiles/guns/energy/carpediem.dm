/obj/item/gun/energy/carpediem
	name = "\"Carpediem\" lasgun"
	icon = 'icons/obj/guns/energy/carpediem.dmi'
	icon_state = "carpediem"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	desc = "One of the creation of Divisors and Monomial Numericals from the new testament following the need to weaponize the followers against excelsior and Psionic creatures menace without having the need to make use of the Prime's armory. \
	The holy Carpediem Musket is a laser charge rifle both to be used as ceremonial rifle held by vectors in line formation as much as it is useful in combat."
	fire_sound = 'sound/weapons/lasmusket_fire.ogg'
	slot_flags = SLOT_BELT|SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_WOOD = 10, MATERIAL_GLASS = 3, MATERIAL_SILVER = 2, MATERIAL_GOLD = 1)
	projectile_type = /obj/item/projectile/beam/musket
	fire_delay = 25 //Musket so you know
	charge_cost = 50 //Slow fire rate and damage is meh
	recoil_buildup = 10 //Slowdown!
	one_hand_penalty = 13
	price_tag = 900
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		WEAPON_CHARGE
	)
	twohanded = TRUE // NO YOU DON'T
	serial_type = "Absolute"
