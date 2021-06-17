/obj/item/weapon/gun/projectile/revolver/mateba
	name = "\"Mateba\" heavy revolver"
	desc = "One of the less practical weapons produced by Scarborough Arms, it's an oversized variant of the popular \"Minotaur\" clones that's been scaled up to .50 kurtz, seemingly for the sole purpose of offending your wrist."
	icon = 'icons/obj/guns/projectile/mateba.dmi'
	icon_state = "mateba"
	caliber = CAL_50
	max_shells = 5
	fire_delay = 4
	drawChargeMeter = FALSE
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	price_tag = 1000 //more op and rare than miller, hits harder, but have fun with hittin anything
	damage_multiplier = 1.2
	penetration_multiplier = 1.25
	recoil_buildup = 8
	one_hand_penalty = 15
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)