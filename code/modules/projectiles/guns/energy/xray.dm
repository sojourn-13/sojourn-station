/obj/item/gun/energy/xray
	name = "\"X-RAY\" laser rifle"
	desc = "A brandless modern laser rifle capable of delivering powered blasts even across solid surfaces accompanied by signature high pitched screech. Due to this it has been banned from commercial use but still finds itself in hands of many mercenary groups."
	icon = 'icons/obj/guns/energy/xray.dmi'
	icon_state = "xray"
	item_state = "xray"
	fire_sound = 'sound/weapons/energy/laser3.ogg'
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3, TECH_MAGNET = 2, TECH_ILLEGAL = 2)
	price_tag = 2000
	projectile_type = /obj/item/projectile/beam/xray
	charge_cost = 100
	init_recoil = CARBINE_RECOIL(0.1)
	twohanded = TRUE
	gun_tags = list(GUN_LASER, GUN_ENERGY) //No more scope so people can't cheese with it
	serial_type = "INDEX"
	serial_shown = FALSE
