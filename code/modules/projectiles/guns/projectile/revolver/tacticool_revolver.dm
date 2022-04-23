/obj/item/gun/projectile/revolver/tacticool_revolver
	name = "\"Tacticool\" heavy revolver"
	desc = "When people complained that the mataba was impractical due to its wrist snapping recoil Scarborough Arms decided what it really needed was a tactical scope for sniping. Uses .50 kurtz."
	icon = 'icons/obj/guns/projectile/tacticool_revolver.dmi'
	icon_state = "tacticool_revolver"
	item_state = "tacticool_revolver"
	caliber = CAL_50
	max_shells = 5
	fire_delay = 4
	drawChargeMeter = FALSE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	price_tag = 1500 //more op and rare than miller, hits harder, but have fun with hittin anything
	damage_multiplier = 1.2
	penetration_multiplier = 1.25
	zoom_factor = 1.3
	recoil_buildup = 4 //Less recoil due to the weight of the scope.
	one_hand_penalty = 15
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_50)
	serial_type = "SA"