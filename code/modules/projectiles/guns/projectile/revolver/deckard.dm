/obj/item/weapon/gun/projectile/revolver/deckard
	name = "\"Deckard\" magnum"
	desc = "A rare, custom-built revolver formerly used on Earth by early Turing Police, less than 100 examples exist in this side of the galaxy. Use when there is no time for the Voight-Kampff test. Uses .40 Magnum rounds."
	icon = 'icons/obj/guns/projectile/deckard.dmi'
	icon_state = "deckard"
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 6
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 3100 //one of most robust revolvers here
	damage_multiplier = 1.35
	penetration_multiplier = 1.65
	recoil_buildup = 30
	one_hand_penalty = 25
	fire_sound = 'sound/weapons/guns/fire/deckard_fire.ogg'