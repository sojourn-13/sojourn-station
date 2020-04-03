/obj/item/weapon/gun/projectile/shotgun/pump/gladstone
	name = "\"Gladstone\" combat shotgun"
	desc = "A venerable shotgun with incredibly dubious patent claims by H&S Arms, it serves as a common shotgun alongside a number of virtually ideantical weapons across the galaxy. Has a 7-shell tube magazine."
	icon = 'icons/obj/guns/projectile/gladstone.dmi'
	icon_state = "gladstone"
	item_state = "gladstone"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 7
	damage_multiplier = 1.1
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	price_tag = 1500
	recoil_buildup = 14
	one_hand_penalty = 15 //full sized shotgun level
