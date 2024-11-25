/obj/item/gun/projectile/ladon
	name = "\"Ladon\" magnum pistol"
	desc = "A Mk-68 \"Ladon\", the trimmed down decendant of the M6 service pistol family as a second-line pistol for law enforcement produced by Seinemetall Defense GmbH, non-combat personnel, and people with reasonably sized hands.  Uses 10mm Auto-Mag. This one appears to have been in SolFed service at some point."
	icon = 'icons/obj/guns/projectile/ladon.dmi'
	icon_state = "dark_ladon"
	item_state = "dark_ladon"
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 5)
	price_tag = 600
	fire_sound = 'sound/weapons/guns/fire/pistol_fire.ogg'
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL
	damage_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(1.3)
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	auto_eject = 1
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	serial_type = "SD GmbH"
	gun_parts = list(/obj/item/part/gun/frame/ladon = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/magnum = 1)

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig

/obj/item/gun/projectile/ladon/update_icon()
	..()

	if(!ammo_magazine)
		icon_state = initial(icon_state)
	else if(!ammo_magazine.stored_ammo.len)
		icon_state = initial(icon_state) + "_empty"
	else
		icon_state = initial(icon_state) + "_full"

/obj/item/gun/projectile/ladon/hs
	name = "\"Porton\" magnum pistol"
	desc = "A popular commercial variant of Mk-68 \"Ladon\" produced by \"H&S\". Often found in self defence and private guards. Uses 10mm Auto-Mag rounds."
	icon_state = "ladon"
	item_state = "ladon"
	damage_multiplier = 1
	init_recoil = HANDGUN_RECOIL(1.2)
	serial_type = "H&S"
	gun_parts = list(/obj/item/part/gun/frame/ladon = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/magnum = 1)


/obj/item/gun/projectile/ladon/sa
	name = "\"Sigia\" magnum pistol"
	desc = "A significant reinforcement of Mk-68 \"Ladon\". Uses 10mm Auto-Mag rounds. This one has a Scarborough Arms rollmark on the frame and no other markings."
	icon_state = "sigia"
	item_state = "sigia"
	damage_multiplier = 1.1
	init_recoil = HANDGUN_RECOIL(1.1)
	serial_type = "SA"
	gun_parts = list(/obj/item/part/gun/frame/ladon = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/magnum = 1)


/obj/item/part/gun/frame/ladon
	name = "Ladon frame"
	desc = "A Ladon pistol frame. Useful if you want to bring out your inner mall-cop."
	icon_state = "frame_1911"
	result = /obj/item/gun/projectile/ladon
	gripvars = list(/obj/item/part/gun/grip/black, /obj/item/part/gun/grip/rubber, /obj/item/part/gun/grip/serb)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list( /obj/item/part/gun/barrel/magnum)
	resultvars = list(/obj/item/gun/projectile/ladon, /obj/item/gun/projectile/ladon/hs, /obj/item/gun/projectile/ladon/sa)
