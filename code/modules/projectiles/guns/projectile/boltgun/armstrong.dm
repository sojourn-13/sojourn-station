/obj/item/gun/projectile/boltgun/lever
	name = "\"Armstrong\" repeating rifle"
	desc = "Weapon for hunting, or endless open plains. Perfect for horseback!"
	icon = 'icons/obj/guns/projectile/lever.dmi'
	icon_state = "lever"
	item_state = "lever"
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_MAGNUM
	max_shells = 11
	price_tag = 750
	recoil_buildup = 10
	damage_multiplier = 1.2
	penetration_multiplier  = 1.1
	extra_damage_mult_scoped = 0.2 //scoping this should be rewarded its not that good
	matter = list(MATERIAL_STEEL = 25, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 5)
	saw_off = FALSE
	serial_type = "H&S"

/obj/item/gun/projectile/boltgun/lever/custer
	name = "\"Custer\" repeating rifle"
	desc = "This sized-up version of the \"Armstrong\" sports a few improvements compared to its predesessor. \
			Made to content with modern bolt actions in hunting, this repeating rifle sports a rifle cartiage for that extra punch!"
	icon = 'icons/obj/guns/projectile/custer.dmi'
	icon_state = "custer"
	item_state = "custer"
	caliber = CAL_HRIFLE
	max_shells = 7
	price_tag = 1150
	recoil_buildup = 12
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 15, MATERIAL_WOOD = 10)