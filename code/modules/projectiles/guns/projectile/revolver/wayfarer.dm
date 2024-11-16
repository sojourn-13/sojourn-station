//Sprite by Rebel
/obj/item/gun/projectile/revolver/wayfarer
	name = "\"Wayfarer\" caseless revolver"
	desc = "A sleek and well-made revolver that has been manufactured by hand. Brandished with reinforcements of plasteel which reinforces the barrel assembly forged from a mix of high-carbon steel, then banded with low-carbon iron around the cylinder. \
	Possesses a polished mahogany handle as a grip. \
	The Barrel is designed to use high-power 10x24 caseless munitions while being easy to clean. \
	While seemingly produced by Excelsior; hinted at by the stamp placed upon its grip, it lacks most of the usual markings - and is instead tagged with a simple quote - \
	\"The hopeless don't revolt, because revolution is an act of hope.\""
	icon = 'icons/obj/guns/projectile/wayfarer.dmi'
	icon_state = "wayfarer"
	item_state = "wayfarer"
	excelsior = FALSE
	drawChargeMeter = FALSE
	caliber = "10x24"
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 8
	ammo_type = /obj/item/ammo_magazine/c10x24
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 5, MATERIAL_IRON = 5, MATERIAL_WOOD = 3)
	can_dual = TRUE
	price_tag = 1400
	damage_multiplier = 1.6
	penetration_multiplier = 1
	init_recoil = RIFLE_RECOIL(0.1)
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_REVOLVER)
	max_upgrades = 7 //Holds more slots do to being exl gun and not that good cal wise/easy to get
	serial_type = "INDEX"
	serial_shown = FALSE
	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.3 // 30 vig
	gun_parts = list(/obj/item/part/gun/frame/wayfarer = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/clrifle = 1)

/obj/item/part/gun/frame/wayfarer
	name = "Wayfarer frame"
	desc = "A Wayfarer revolver frame. A easily produced weapon, for when a worker wants to ice his boss."
	icon_state = "frame_inspector"
	result = /obj/item/gun/projectile/revolver/wayfarer
	resultvars = list(/obj/item/gun/projectile/revolver/wayfarer)
	gripvars = list(/obj/item/part/gun/grip/serb)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/clrifle)
