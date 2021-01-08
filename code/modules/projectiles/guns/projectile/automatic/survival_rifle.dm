/obj/item/weapon/gun/projectile/automatic/survivalrifle
	name = "\"Bond\" survival rifle"
	desc = "A \"Bond\" marksman carbine manufactured by Hunters Inc. Compact, high velocity and high penetration despite its low fire rate. Uses the obscure 12x24 rounds."
	icon = 'icons/obj/guns/projectile/survivalrifle.dmi'
	icon_state = "survivalrifle"
	item_state = "survivalrifle"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_PULSE
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 5)
	price_tag = 1000
	penetration_multiplier = 1.3
	damage_multiplier = 1.1
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/m41_reload.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/m41_cocked.ogg'
	zoom_factor = 0.6
	recoil_buildup = 12
	one_hand_penalty = 20 //automatic rifle level

	init_firemodes = list(
		SEMI_AUTO_NODELAY)

/obj/item/weapon/gun/projectile/automatic/survivalrifle/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/survivalrifle/Initialize()
	. = ..()
	update_icon()
