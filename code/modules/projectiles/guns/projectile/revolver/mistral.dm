/obj/item/gun/projectile/revolver/mistral
	name = "\"Mistral\" magnum revolver"
	desc = "A high-end European revolver produced by Seinemetall Defense GmbH on Earth using hand-fitted parts. Carried by the most respected of gunslingers and counter-terror specialists. Uses 10mm Magnum rounds."
	icon = 'icons/obj/guns/projectile/mistral.dmi'
	icon_state = "mistral"
	item_state = "mistral"
	drawChargeMeter = FALSE
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 6
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 850
	damage_multiplier = 1.3
	penetration_multiplier = 1.5
	init_recoil = RIFLE_RECOIL(0.6)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	serial_type = "SD GmbH"
	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.4 // 40 vig
	gun_parts = list(/obj/item/part/gun/frame/minstral = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/magnum = 1)

/obj/item/part/gun/frame/minstral
	name = "Minstral frame"
	desc = "A Minstral revolver frame. The gambler's choice."
	icon_state = "frame_revolver"
	result = /obj/item/gun/projectile/revolver/mistral
	resultvars = list(/obj/item/gun/projectile/revolver/mistral)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/magnum)
