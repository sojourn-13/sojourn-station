/obj/item/gun/projectile/revolver/deckard
	name = "\"Deckard\" heavy revolver"
	desc = "A rare, custom-built revolver formerly used within Sol by the early Turing Police, gifted by the Mar'qua Technocracy. Use when there is no time for the Voight-Kampff test. Uses 12mm."
	icon = 'icons/obj/guns/projectile/deckard.dmi'
	icon_state = "deckard"
	caliber = CAL_50
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 5 // Standardizing speedloaders //Absolutely not. Stop powercreeping up the mag-capacities of weapons that have anemic performance, just make the damage more menaningful - CDB
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 1300 //one of most robust revolvers here
	damage_multiplier = 1.2
	penetration_multiplier = 1.5
	init_recoil = HANDGUN_RECOIL(1.5)
	zoom_factors = list(0.4)
	fire_sound = 'sound/weapons/guns/fire/deckard_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_12MM)
	serial_type = "Sol Fed"

	wield_delay = 0.6 SECOND
	wield_delay_factor = 0.6 // 60 vig
	gun_parts = list(/obj/item/part/gun/frame/deckard = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/kurtz = 1)

/obj/item/part/gun/frame/deckard
	name = "Deckard frame"
	desc = "A Deckard revolver frame. The secret policeman's choice."
	icon_state = "frame_thatgun"
	result = /obj/item/gun/projectile/revolver/deckard
	resultvars = list(/obj/item/gun/projectile/revolver/deckard)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/kurtz)
