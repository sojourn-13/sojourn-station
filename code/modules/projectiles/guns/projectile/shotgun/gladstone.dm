/obj/item/weapon/gun/projectile/shotgun/pump/gladstone
	name = "\"Gladstone\" combat shotgun"
	desc = "A venerable shotgun with incredibly dubious patent claims by H&S Arms, it serves as a common shotgun alongside a number of virtually ideantical weapons across the galaxy. \
	Can hold up to 7+1 20mm shells in its tube magazine."
	icon = 'icons/obj/guns/projectile/gladstone.dmi'
	icon_state = "gladstone"
	item_state = "gladstone"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 7
	caliber = CAL_SHOTGUN
	damage_multiplier = 1
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	price_tag = 750
	recoil_buildup = 14
	one_hand_penalty = 15 //full sized shotgun level
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/shotgun/pump/gladstone/sawn


/obj/item/weapon/gun/projectile/shotgun/pump/gladstone/sawn
	name = "\"Gladstone\" stakeout shotgun"
	desc = "A venerable shotgun that's been destroyed by some sort of heartless monster. Can hold up to 4+1 20mm shells in its tube magazine."
	icon = 'icons/obj/guns/projectile/sawnoff/gladstone.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	max_shells = 4
	w_class = ITEM_SIZE_BULKY
	damage_multiplier = 0.8
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	price_tag = 400
	recoil_buildup = 100
	one_hand_penalty = 100 //full sized shotgun level
	saw_off = FALSE