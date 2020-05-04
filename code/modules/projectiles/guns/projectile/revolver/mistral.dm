/obj/item/weapon/gun/projectile/revolver/mistral
	name = "\"Mistral\" magnum revolver"
	desc = "A high-end European revolver produced by Seinemetall Defense GmbH on Earth using hand-fitted parts. Carried by the most respected of gunslingers and counter-terror specialists. Uses .40 Magnum rounds."
	icon = 'icons/obj/guns/projectile/mistral.dmi'
	icon_state = "mistral"
	item_state = "mistral"
	drawChargeMeter = FALSE
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	max_shells = 6
	ammo_type = /obj/item/ammo_casing/magnum/rubber
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 1700
	damage_multiplier = 1.4
	penetration_multiplier = 1.5
	recoil_buildup = 35
