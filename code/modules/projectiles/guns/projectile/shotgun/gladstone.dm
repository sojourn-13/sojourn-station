/obj/item/gun/projectile/shotgun/pump/gladstone
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
	price_tag = 850
	recoil_buildup = 12
	one_hand_penalty = 14
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/shotgun/pump/gladstone/sawn
	serial_type = "H&S"

/obj/item/gun/projectile/shotgun/pump/gladstone/sawn
	name = "\"Gladstone\" stakeout shotgun"
	desc = "A venerable shotgun that's been destroyed by some sort of heartless monster. Can hold up to 4+1 20mm shells in its tube magazine."
	icon = 'icons/obj/guns/projectile/sawnoff/gladstone.dmi'
	icon_state = "obrez"
	item_state = "obrez"
	max_shells = 4
	w_class = ITEM_SIZE_BULKY
	damage_multiplier = 0.8
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 6)
	price_tag = 450
	recoil_buildup = 22
	one_hand_penalty = 27 //full sized shotgun level
	saw_off = FALSE

/obj/item/gun/projectile/shotgun/pump/gladstone/queen
	name = "\"Fallen Empress\" hunting shotgun"
	desc = "An anomalous weapon created by an unknown person (or group?), their work marked by a blue cross, these weapons are known to vanish and reappear when left alone. \
	This particular shotgun was originally a gladstone, remodeled and reforged by Jea Smails, first matriarch of the hunting lodge. It was destroyed by a careless hunt master, only \
	to reappear in the lodge, now marked with a blue cross. Perhaps attempts to destroy it now made it eternal? Whatever the case, it packs a hell of a punch. \
	Can hold up to 14+1 20mm shells in its tube magazine."
	icon = 'icons/obj/guns/projectile/shotgun_queen.dmi'
	icon_state = "queen"
	item_state = "queen"
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 14 //half a box in this massive gun
	caliber = CAL_SHOTGUN
	w_class = ITEM_SIZE_HUGE
	damage_multiplier = 1.1
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 26)
	price_tag = 20000 //Its amazing!
	recoil_buildup = 12
	one_hand_penalty = 30 //lets not really reward 1 handing
	saw_off = FALSE
	serial_type = "BlueCross"