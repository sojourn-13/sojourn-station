//It's a good day to die

/obj/item/gun/projectile/automatic/pulse_rifle
	name = "Pulse Rifle"
	desc = "A pulse-action air-cooled, caseless, automatic assault rifle made by an unknown manufacturer. This weapon is very rare, but deadly efficient. \
		It's used by elite mercenaries, assassins, or bald marines. Makes you feel like a space marine when you hold it."
	icon = 'icons/obj/guns/projectile/dallas.dmi'
	icon_state = "dallas"
	item_state = "dallas"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = "10x24"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PULSE
	auto_eject = 1
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 15)
	price_tag = 2200 //99 rounds of pure pain and destruction served in auto-fire, so it basically an upgraded LMG
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/m41_reload.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/m41_cocked.ogg'
	damage_multiplier = 1
	init_recoil = LMG_RECOIL(0.7)
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)
	gun_parts = list(/obj/item/part/gun/frame/dallas = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/machinegun = 1, /obj/item/part/gun/barrel/clrifle = 1)

	init_firemodes = list(
		FULL_AUTO_600,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)
	serial_type = "INDEX"
	serial_shown = FALSE

	wield_delay = 1.4 SECOND
	wield_delay_factor = 0.4 // 40 vig for insta wield

/obj/item/gun/projectile/automatic/dallas/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
	else
		icon_state = initial(icon_state)
	return

/obj/item/part/gun/frame/dallas
	name = "Pulse rifle frame"
	desc = "A pulse rifle frame. For true marines."
	icon_state = "frame_dallas"
	result = /obj/item/gun/projectile/automatic/pulse_rifle
	resultvars = list(/obj/item/gun/projectile/automatic/pulse_rifle)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/machinegun
	barrelvars = list(/obj/item/part/gun/barrel/clrifle)
