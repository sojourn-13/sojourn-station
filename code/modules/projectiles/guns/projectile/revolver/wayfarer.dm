//Sprite by Rebel
/obj/item/gun/projectile/revolver/wayfarer
	name = "\"Wayfarer\" caseless revolver"
	desc = "A sleek and well-made revolver that has been hand-produced with care, menacing with reinforcements of plasteel which reinforces the barrel assembly, which has been forged from a mix of high-carbon steel, banded with low-carbon iron around the cylinder; and possesses a polished mahogany handle for a grip. \
	The Barrel is refined to use high-power 10x24 caseless munitions while being easy to clean. \
	While seemingly produced by Excelsior; hinted by the stamp placed upon its grip, it lacks most of the normal markings - and is instead tagged with a simple quote - \
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
	serial_type = "INDEX"
	serial_shown = FALSE
