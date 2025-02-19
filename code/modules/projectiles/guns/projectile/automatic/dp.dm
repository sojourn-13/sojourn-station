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
	damage_multiplier = 1.2			//Same as the AK, plus it's rarer than an AK. (Takeshi is also 1.2)
	penetration_multiplier = 1.1	//More than AK, which has 1.0. Rarer than AK.
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PAN
	tac_reloads = FALSE
	matter = list(MATERIAL_PLASTEEL = 35, MATERIAL_WOOD = 15, MATERIAL_STEEL = 20)
	price_tag = 1600
	unload_sound 	= 'sound/weapons/guns/interact/pan_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/lmg_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/lmg_cock.ogg'
	fire_sound 	= 'sound/weapons/guns/fire/dp_fire.ogg'
	twohanded = TRUE
	init_recoil = LMG_RECOIL(1.0)	//Takeshi has 0.8, Maxim is 0.5. So, 1.0 fits I guess. Heroic has HMG recoil anyway vs this gun with LMG.
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_INTERNAL_MAG)	//Can take a scope like modern bubbas. Why.. is it and the Maxim 'internal' mag?
	slowdown_hold = 0.5				//Half the slowdown of a normal LMG; it is meant to be used by automatic-riflemen.
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
	resultvars = list(/obj/item/gun/projectile/automatic/dp, /obj/item/gun/projectile/automatic/lmg/rpd)
	gripvars = list(/obj/item/part/gun/grip/wood, /obj/item/part/gun/grip/serb)
	mechanismvar = /obj/item/part/gun/mechanism/machinegun
	barrelvars = list(/obj/item/part/gun/barrel/lrifle)

// Lighter, slower firing, more controllable, less damaging.
/obj/item/gun/projectile/automatic/lmg/rpd
	name = "\"Ruchnoy Pulemyot Degtyaryova\" light machinegun"
	desc = "A crude upgrade to the Nadezhda Marshals manufactured DP machinegun. Sporting a lighter bakelite frame, a 100-round capacity, and a far more controllable fire-rate. This one seems to be shorter than the usual variants."

	icon = 'icons/obj/guns/projectile/rpd.dmi'
	icon_base = "rpd"
	icon_state = "rpd"
	item_state = "rpd"

	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2)
	damage_multiplier = 1.1
	penetration_multiplier = 1.1
	matter = list(MATERIAL_PLASTEEL = 35, MATERIAL_PLASTIC = 15, MATERIAL_STEEL = 20)
	init_recoil = LMG_RECOIL(0.9)
	init_firemodes = list(
		BURST_3_ROUND,
		FULL_AUTO_200
		)
	slowdown_hold = 0.5
	serial_type = "NM"

	wield_delay = 1 SECOND
	wield_delay_factor = 0.4 //40 vig for instant wield

	gun_parts = list(/obj/item/part/gun/frame/dp27 = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/machinegun = 1, /obj/item/part/gun/barrel/lrifle = 1)

	max_upgrades = 3
	blacklist_upgrades = list(
		/obj/item/tool_upgrade/augment/expansion = TRUE,
		/obj/item/gun_upgrade/muzzle/silencer = TRUE,
		/obj/item/gun_upgrade/scope/watchman = TRUE,
		/obj/item/gun_upgrade/scope/acog = TRUE,
		/obj/item/gun_upgrade/scope/killer = TRUE,
		/obj/item/gun_upgrade/magwell/auto_eject = TRUE
	)
