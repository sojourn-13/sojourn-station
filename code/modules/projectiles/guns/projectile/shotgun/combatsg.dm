/obj/item/weapon/gun/projectile/shotgun/pump/combat
	name = "\"Regulator\" combat shotgun"
	desc = "Designed for close quarters combat, the Regulator is widely regarded as a weapon of choice for protecting borders. \
			One of the only decent ballistic weapons made by the Old Testament. Can hold up to 6+1 20mm shells in its tube magazine."
	icon = 'icons/obj/guns/projectile/cshotgun.dmi'
	icon_state = "cshotgun"
	item_state = "cshotgun"
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	max_shells = 6 //less ammo and regular recoil, decided not to give 1.2 because Gladstone would be anyhow better in this case
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_PLASTIC = 12)
	price_tag = 1300
	damage_multiplier = 1.1
	penetration_multiplier = 1
	recoil_buildup = 16
	one_hand_penalty = 15 //full sized shotgun level
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/shotgun/pump/combat/sawn


/obj/item/weapon/gun/projectile/shotgun/pump/combat/sawn
	name = "\"Regulator\" stakeout shotgun"
	desc = "Designed for close encounters, the Regulator is widely regarded as a weapon of choice for protecting against boarders. \
	Without its stock, it's much more compact, but much harder to use. Can hold up to 6+1 20mm shells in its tube magazine."
	icon = 'icons/obj/guns/projectile/sawnoff/cshotgun.dmi'
	icon_state = "short"
	item_state = "short"
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 1000
	recoil_buildup = 50
	one_hand_penalty = 100 //Just in case
	damage_multiplier = 0.9
	fire_delay = 12
	saw_off = FALSE

/obj/item/weapon/gun/projectile/shotgun/pump/combat_short/attack_self(mob/living/user as mob)
	if(wielded)
		pump(user)
	else if(world.time >= recentpumpmsg + 30)
		to_chat(user, SPAN_WARNING("You need to wield this gun to pump it!"))
		recentpumpmsg = world.time