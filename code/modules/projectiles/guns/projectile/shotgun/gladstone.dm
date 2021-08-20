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
	name = "\"Queen\" hunting shotgun"
	desc = "A venerable shotgun with incredibly dubious patent claims by H&S Arms, it serves as a common shotgun alongside a number of virtually ideantical weapons across the galaxy. \
			 Can hold up to 14+1 20mm shells in its tube magazine. This one has been endlessly tinkered by Jea Smails giving it just the more power and looks it needed to stop crimes in 2 shots."
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

/obj/item/gun/projectile/shotgun/pump/gladstone/queen/king
	name = "\"King\" hunting shotgun"
	desc = "A venerable shotgun with incredibly dubious patent claims by H&S Arms, it serves as a common shotgun alongside a number of virtually ideantical weapons across the galaxy. \
			 Can hold up to 14+1 20mm shells in its tube magazine. This one, while similar to Jea's famous \"Queen\" shotgun, has a blue cross on it. It seems like the Matriach's work \
			 hasn't gone unnoticed... or unappreciated..."
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
