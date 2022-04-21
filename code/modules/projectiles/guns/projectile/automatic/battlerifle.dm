/obj/item/gun/projectile/automatic/omnirifle
	name = "\"Hustler\" heavy rifle"
	desc = "A heavy, inexpensive battle rifle of dubious quality.\
		 An inexpensive budget rifle, it is a stripped down copy of the M12 Omnirifle, it fires a variety of utility and specialized munitions. \
		 Chambered in .408, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example... frankly sucks and is limited to semiautomatic."
	icon = 'icons/obj/guns/projectile/Hustler.dmi'
	icon_state = "hustler"
	item_state = "hustler"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_HRIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_HRIFLE
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5)
	price_tag = 1250
	penetration_multiplier = 1.0
	damage_multiplier = 1.0
	recoil_buildup = 10
	one_hand_penalty = 10
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rifle_boltforward.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)

	init_firemodes = list(
	SEMI_AUTO_NODELAY
	)
	serial_type = "Sol Fed"

/obj/item/gun/projectile/automatic/omnirifle/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(ammo_magazine)
		add_overlay("_mag[ammo_magazine.max_ammo]")
	else
		cut_overlays()
		return

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/omnirifle/Initialize()
	. = ..()
	update_icon()


/obj/item/gun/projectile/automatic/omnirifle/standard
	name = "\"Omnirifle\""
	desc = "A standard issue battle rifle issued to SolFed Marines, produced across the galaxy by state arsenals. \
		 A weapon built for versatility and rugged reliability, it fires a variety of utility and specialized munitions. \
		 Chambered in .408, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 Certain munitions are physically demanding for even the strongest users without the aid of power armor or gun platforms. \
		 This example has defaced serial numbers and added electro-penciled rack numbers."
	icon = 'icons/obj/guns/projectile/Omnirifle.dmi'
	icon_state = "omnirifle"
	item_state = "omnirifle"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5)
	mag_well = MAG_WELL_HRIFLE
	price_tag = 1500
	zoom_factor = 0.3
	recoil_buildup = 2.5
	one_hand_penalty = 10
	penetration_multiplier = 1
	damage_multiplier = 1
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_400
		)

/obj/item/gun/projectile/automatic/omnirifle/scoped
	name = "\"Longarm\" marksman rifle"
	desc = "A heavy front line designated marksman rifle manufactured by H&S, also known as the M13A2 Special Purpose Rifle in its generic military form. \
		 Either a copy or 'liberated' example, it fires a variety of utility and specialized munitions. \
		 Chambered in .408, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example is fitted with an advanced combat sight and limited to semiautomatic and two-round burst."
	icon = 'icons/obj/guns/projectile/DMR.dmi'
	icon_state = "DMR"
	item_state = "DMR"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 10)
	price_tag = 1750
	damage_multiplier = 1.2
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	zoom_factor = 1
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	recoil_buildup = 3.25
	penetration_multiplier = 1.2
	brace_penalty = 10 //So we have a reason to entrench rather then charge every combat
	one_hand_penalty = 15
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		BURST_2_ROUND
		)
	serial_type = "H&S"

/obj/item/gun/projectile/automatic/omnirifle/fancy
	name = "\"Osprey\" precision rifle"
	desc = "Classic, elegant sporting rifle based on proven military technology. \
		 A police model of the venerable M13A1 Special Purpose Rifle manufactured on Earth by Seinemetall Defense GmbH for both sportsmen and counter-terror agents, it fires a variety of utility and specialized munitions. \
		 Chambered in .408, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example is fitted with an high-zoom optic, elegant wood furnishing, and is limited to semiautomatic."
	icon = 'icons/obj/guns/projectile/Osprey.dmi'
	icon_state = "osprey"
	item_state = "osprey"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 15, MATERIAL_GLASS = 10)
	price_tag = 2000
	recoil_buildup = 3.25
	penetration_multiplier = 1.2
	damage_multiplier = 1.2
	zoom_factor = 1.2
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	serial_type = "SD GmbH"

/obj/item/gun/projectile/automatic/omnirifle/omnicarbine
	name = "\"Boar\" heavy carbine"
	desc = "A heavy second-line carbine manufactured by H&S, as well as number of state arsenals. Designed for close range encounters and support fire. \
		 A rifle fashioned for cover fire and cramped environments, taking influence from the MK-12 Omnicarbine, chambered in .408 caliber. \
		 Its gaping bore packs a punch, however the recoil is incredibly violent and terrifying. \
		 Despite the blinding muzzle flash and agonizing recoil, its small size arguably makes up for the disadvantages."
	icon = 'icons/obj/guns/projectile/Boar.dmi'
	icon_state = "boar"
	item_state = "boar"
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10)
	mag_well = MAG_WELL_HRIFLE
	price_tag = 1250
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	damage_multiplier = 1
	recoil_buildup = 6
	penetration_multiplier = 0.7
	one_hand_penalty = 25
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_600
		)
	serial_type = "H&S"

/obj/item/gun/projectile/automatic/omnirifle/omnicarbine/rds
	name = "\"Warthog\" advanced carbine"
	desc = "A heavy second-line carbine manufactured by H&S, as well as number of state arsenals. Designed for close range encounters and support fire. \
		 A rifle fashioned for cover fire and cramped environments. Chambered in 10x50mm Omni. \
		 Its gaping bore packs a punch, however the recoil is incredibly violent and terrifying. \
		 This one is fitted with a muzzle brake, fore grip, holographic sight, and limited to 3-round bursts, it's almost manageable. Almost."
	icon = 'icons/obj/guns/projectile/Warthog.dmi'
	icon_state = "warthog"
	item_state = "warthog"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5)
	mag_well = MAG_WELL_HRIFLE
	price_tag = 1500
	penetration_multiplier = 1.2
	damage_multiplier = 1.1
	recoil_buildup = 3.25
	one_hand_penalty = 23
	zoom_factor = 0.3
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)