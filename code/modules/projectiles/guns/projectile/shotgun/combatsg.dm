/obj/item/weapon/gun/projectile/shotgun/pump/combat
	name = "\"Regulator\" combat shotgun"
	desc = "Designed for close quarters combat, the Regulator is widely regarded as a weapon of choice for protecting borders. \
			One of the only decent ballistic weapons made by the Old Testament. Can hold up to 7 shells in tube magazine."
	icon = 'icons/obj/guns/projectile/cshotgun.dmi'
	icon_state = "cshotgun"
	item_state = "cshotgun"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 6 //less ammo and regular recoil, decided not to give 1.2 because Gladstone would be anyhow better in this case
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 12)
	price_tag = 2600
	damage_multiplier = 1.2
	penetration_multiplier = 1
	recoil_buildup = 16
	one_hand_penalty = 15 //full sized shotgun level

