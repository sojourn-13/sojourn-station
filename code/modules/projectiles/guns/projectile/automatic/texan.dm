//SMG that basically is meant to deal damage even against armored mobs, counts as a normal gun for spawn pool
/obj/item/gun/projectile/automatic/texan
	name = "\"Texan\" SMG"
	desc = "The Texan is a reliable assault weapon, mass-produced by SD GmbH for raiding parities in tight hallways, with a moderate effectiveness against soft body armor. Uses 9mm rounds."
	icon = 'icons/obj/guns/projectile/texan.dmi'
	icon_state = "texan"
	item_state = "texan"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_SMG
	matter = list(MATERIAL_PLASTEEL = 16, MATERIAL_WOOD = 4)
	price_tag = 800
	damage_multiplier = 0.9
	penetration_multiplier = 2
	init_recoil = SMG_RECOIL(0.5)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM, GUN_MAGWELL)
	serial_type = "SD GmbH"

	init_firemodes = list(
		FULL_AUTO_600_NOLOSS,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND_NOLOSS
		)
	wield_delay = 0.5 SECOND
	wield_delay_factor = 0.1 // 10 vig
	gun_parts = list(/obj/item/part/gun/frame/grease = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/gun/projectile/automatic/texan/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "[initial(icon_state)]-full"
		set_item_state("-full")
	else
		icon_state = initial(icon_state)
		set_item_state()
	return
