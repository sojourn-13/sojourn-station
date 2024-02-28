/obj/item/gun/energy/carpediem
	name = "\"Carpediem\" laser musket"
	icon = 'icons/obj/guns/energy/carpediem.dmi'
	icon_state = "carpediem"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	desc = "Created by the Numericals and distributed by the Testament in hopes of combatting Excelsior and psionic creatures. \
	The Carpediem Musket is a laser musket rifle designed for ceremonial usage, though it also packs an impressive punch- even if its rate of fire leaves a lot to be desired."
	fire_sound = 'sound/weapons/energy/lasmusket_fire.ogg'
	slot_flags = SLOT_BACK
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_WOOD = 10, MATERIAL_GLASS = 2, MATERIAL_SILVER = 1, MATERIAL_GOLD = 1, MATERIAL_BIOMATTER = 10)
	projectile_type = /obj/item/projectile/beam/musket
	fire_delay = 35
	charge_cost = 150 // 4 shots on a 600M
	init_recoil = CARBINE_RECOIL(1)
	price_tag = 1000 //got to keep in mind material costs
	gun_tags = list(GUN_LASER, GUN_ENERGY, GUN_SCOPE)
	init_firemodes = list(
		list(mode_name="Musket", burst =1, icon="kill", penetrating = 1)
	)
	twohanded = TRUE // NO YOU DON'T
	serial_type = "Absolute"
