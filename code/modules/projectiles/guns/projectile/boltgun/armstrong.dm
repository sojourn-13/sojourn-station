/obj/item/gun/projectile/boltgun/lever
	name = "\"Armstrong\" repeating rifle"
	desc = "Weapon for hunting, or endless open plains. Perfect for horseback!"
	icon = 'icons/obj/guns/projectile/lever.dmi'
	icon_state = "lever"
	item_state = "lever"
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_MAGNUM
	max_shells = 11
	price_tag = 600
	init_recoil = HMG_RECOIL(0.4)
	damage_multiplier = 1.2
	penetration_multiplier  = 1.1
	zoom_factor = 0.4
	extra_damage_mult_scoped = 0.2 //scoping this should be rewarded its not that good
	matter = list(MATERIAL_STEEL = 25, MATERIAL_WOOD = 10, MATERIAL_PLASTEEL = 5)
	saw_off = FALSE
	serial_type = "H&S"

/obj/item/gun/projectile/boltgun/lever/shotgun
	name = "\"Mares Leg\" repeating shotgun"
	desc = "An Armstrong rifle sporting a sawn down barrel and rechambered into 20mm take shotgun shells. It appears someone has mangled this gun and replaced its serial numbers."
	icon = 'icons/obj/guns/projectile/mares.dmi'
	icon_state = "mare"
	item_state = "mare"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_SHOTGUN
	max_shells = 6
	price_tag = 650
	init_recoil = HMG_RECOIL(1.0)
	damage_multiplier = 0.8
	penetration_multiplier = 1.0
	zoom_factor = 0
	extra_damage_mult_scoped = 0.2
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 6, MATERIAL_PLASTEEL = 7)
	serial_type = "INDEX"

/obj/item/gun/projectile/boltgun/lever/custer
	name = "\"Custer\" repeating rifle"
	desc = "This sized-up version of the \"Armstrong\" sports a few improvements compared to its predesessor. \
			Made to content with modern bolt actions in hunting, this repeating rifle sports a rifle cartiage for that extra punch!"
	icon = 'icons/obj/guns/projectile/custer.dmi'
	icon_state = "custer"
	item_state = "custer"
	caliber = CAL_HRIFLE
	max_shells = 7
	price_tag = 1200
	init_recoil = HMG_RECOIL(0.6)
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_STEEL = 15, MATERIAL_WOOD = 10)