/obj/item/gun/projectile/automatic/eckler //eclaire.
	name = "\"Eckler\" assault SMG"
	desc = "\"The Eckler is a fine piece of police hardware, originally from the minds of Seinemetall this design fell into Marshal hands in the very same way many of their designs did, by flagrant theft of Federation resources. For all its performance, the Eckler boasts particularly high maintenance requirements and cost typically limiting the number available."
	icon = 'icons/obj/guns/projectile/eckler.dmi'
	icon_state = "eckler"
	item_state = "eckler"
	w_class = ITEM_SIZE_NORMAL
	twohanded = TRUE
	force = WEAPON_FORCE_NORMAL
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_DRUM
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 5, MATERIAL_STEEL = 4)
	price_tag = 800
	damage_multiplier = 1.2
	penetration_multiplier = 1.1
	fire_sound = 'sound/weapons/guns/fire/smg_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM)
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	auto_eject = 1
	init_recoil = SMG_RECOIL(1)
	init_firemodes = list(
		FULL_AUTO_600_NOLOSS,
		BURST_3_ROUND_NOLOSS,
		)
	serial_type = "NM"

	wield_delay = 0.2 SECOND
	wield_delay_factor = 0.20 // Heavy smg , 20 vig to insta wield
	gun_parts = null
