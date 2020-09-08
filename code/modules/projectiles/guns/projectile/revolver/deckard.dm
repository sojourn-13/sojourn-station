/obj/item/weapon/gun/projectile/revolver/deckard
	name = "\"Deckard\" heavy revolver"
	desc = "A rare, custom-built revolver formerly used on Sol by early Turing Police. Use when there is no time for the Voight-Kampff test. Uses .50 Kurtz."
	icon = 'icons/obj/guns/projectile/deckard.dmi'
	icon_state = "deckard"
	caliber = CAL_50
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 5
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 1550 //one of most robust revolvers here
	damage_multiplier = 1.2
	penetration_multiplier = 1.5
	recoil_buildup = 30
	one_hand_penalty = 25
	zoom_factor = 0.4
	fire_sound = 'sound/weapons/guns/fire/deckard_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)