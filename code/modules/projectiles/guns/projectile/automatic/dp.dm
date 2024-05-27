/obj/item/gun/projectile/automatic/dp
	name = "\"Pulemyot Degtyaryova\" light machinegun"
	desc = "A cruedly made yet reliable top-loading machine gun manufactured by the local Nadezhda Marshals. It appears to have specifically been made to use spare pan-magazines from Maxims."
	icon = 'icons/obj/guns/projectile/dp.dmi'
	icon_state = "dp"
	item_state = "dp"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = 0
	max_shells = 1
	damage_multiplier = 1.0
	penetration_multiplier = 0.9
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PAN
	tac_reloads = FALSE
	matter = list(MATERIAL_PLASTEEL = 50, MATERIAL_PLASTIC = 15, MATERIAL_WOOD = 10, MATERIAL_STEEL = 20)
	price_tag = 1600
	unload_sound 	= 'sound/weapons/guns/interact/lmg_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/lmg_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/lmg_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/dp_fire.ogg'
	twohanded = TRUE
	init_recoil = LMG_RECOIL(1.1)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	slowdown_hold = 0.5
	init_firemodes = list(
		FULL_AUTO_300,
		list(mode_name="short bursts", mode_desc = "Short, rapid 5 round bursts", burst=5,    burst_delay=2, move_delay=6,  icon="burst"),
		list(mode_name="long bursts", mode_desc = "Long, rapid 8 round bursts",  burst=8, burst_delay=4, move_delay=8,  icon="burst"),
		list(mode_name="suppressing fire", mode_desc = "Suppressing, 16 round bursts",  burst=16, burst_delay=4, move_delay=11,  icon="burst")
		)
	serial_type = "NM"

	wield_delay = 1 SECOND
	wield_delay_factor = 0.5 // 50 vig for instant wield
	gun_parts = list(/obj/item/part/gun/frame/dp27 = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/machinegun = 1, /obj/item/part/gun/barrel/lrifle = 1)

obj/item/gun/projectile/automatic/dp/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
		set_item_state("-full")
	else
		icon_state = initial(icon_state)
		set_item_state()
	return

/obj/item/part/gun/frame/dp27
	name = "DP27 frame"
	desc = "A DP27 frame. A gravity-operated machinegun fed by pan-mags."
	icon_state = "frame_dp27"
	result = /obj/item/gun/projectile/automatic/dp
	resultvars = list(/obj/item/gun/projectile/automatic/dp)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/machinegun
	barrelvars = list(/obj/item/part/gun/barrel/lrifle)
