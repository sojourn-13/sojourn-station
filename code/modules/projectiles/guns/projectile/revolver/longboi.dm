/obj/item/gun/projectile/revolver/longboi
	name = "\"Long\" revolver"
	desc = "A novelty revolver made by the Lonestar with a stupidly long barrel favored by those with less sense than style, its extended barrel gives it incredible recoil control but loses stopping power and penetration. Uses .50 Kurtz."
	icon = 'icons/obj/guns/projectile/Long_Revolver.dmi'
	icon_state = "longRevolver"
	caliber = CAL_50
	slot_flags = SLOT_BACK|SLOT_BELT	//Can't fit a holster due to length
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 5
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6)
	price_tag = 1250 //It's a novelty item.
	damage_multiplier = 0.9
	penetration_multiplier = 1.1
	recoil_buildup = 1
	one_hand_penalty = 10
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_CALIBRE_50)
	twohanded = TRUE
	serial_type = "LSS"