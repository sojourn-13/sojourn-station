//Sprite by Rebel
/obj/item/gun/projectile/revolver/wayfarer
	name = "\"Wayfarer\" caseless revolver"
	desc = "A exstreamly well hand made revolver of a mix of steel, iron and plasteel with a polished wooden stock. \
	The barrel inside it refined to be ideal for 10x24 caseless and easy to clean. \
	Well produced by Excelsior it dosnt have the normal markings other then the quote - \
	\"The hopeless don't revolt, because revolution is an act of hope.\""
	icon = 'icons/obj/guns/projectile/wayfarer.dmi'
	icon_state = "wayfarer"
	item_state = "wayfarer"
	drawChargeMeter = FALSE
	caliber = "10x24"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 8
	ammo_type = /obj/item/ammo_magazine/c10x24
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 5, MATERIAL_IRON = 5, MATERIAL_WOOD = 3)
	can_dual = TRUE
	price_tag = 1750
	damage_multiplier = 1.6
	penetration_multiplier = 2
	recoil_buildup = 2
	one_hand_penalty = 0 //Like a glove
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	max_upgrades = 7 //Holds more slots do to being exl gun and not that good cal wise/easy to get