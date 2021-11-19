/obj/item/gun/projectile/automatic/survivalrifle
	name = "\"Bond\" survival rifle"
	desc = "A \"Bond\" marksman carbine manufactured by Hunters Inc. Compact, high velocity and high penetration despite its low fire rate. Uses the obscure 10x24 rounds."
	icon = 'icons/obj/guns/projectile/survivalrifle.dmi'
	icon_state = "survivalrifle"
	item_state = "survivalrifle"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	ammo_type =  /obj/item/ammo_casing/c10x24
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 5)
	price_tag = 1250
	caliber = "10x24"
	penetration_multiplier = 1.3
	damage_multiplier = 1.1
	extra_damage_mult_scoped = 0.5
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/m41_reload.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/m41_cocked.ogg'
	zoom_factor = 0.6
	recoil_buildup = 12
	one_hand_penalty = 20 //automatic rifle level

	gun_tags = list(GUN_PROJECTILE, GUN_SIGHT, GUN_MAGWELL)

	init_firemodes = list(
		SEMI_AUTO_NODELAY)

/obj/item/gun/projectile/automatic/survivalrifle/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
		set_item_state("-full")
	else
		icon_state = initial(icon_state)
		set_item_state()
	return

/obj/item/gun/projectile/automatic/survivalrifle/Initialize()
	. = ..()
	update_icon()
