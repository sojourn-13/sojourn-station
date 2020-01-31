/obj/item/weapon/gun/projectile/automatic/omnirifle
	name = "BM BR 10x50mm \"Hustler\""
	desc = "A heavy, inexpensive battle rifle of dubious quality.\
		 An inexpensive budget rifle, this rifle is a stripped down copy of the M12 Omnirifle, it fires a variety of utility and specialized munitions. \
		 Chambered in 10x50mm Omni, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example... frankly sucks and is limited to semiautomatic."
	icon = 'icons/obj/guns/projectile/omnirifle.dmi'
	icon_state = "cheap-omnirifle"
	item_state = "cheap-omnirifle"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = "10x50mm"
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_OMNI
	magazine_type = /obj/item/ammo_magazine/c10mm
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5)
	price_tag = 2000
	recoil_buildup = 0.5
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rifle_boltforward.ogg'

	firemodes = list(
	SEMI_AUTO_NODELAY
	)

/obj/item/weapon/gun/projectile/automatic/omnirifle/update_icon()
	..()

	if(!ammo_magazine)
		icon_state = initial(icon_state)
	else if(!ammo_magazine.stored_ammo.len)
		icon_state = initial(icon_state) + "-empty"
	else
		icon_state = initial(icon_state) + "-full"


/obj/item/weapon/gun/projectile/automatic/omnirifle/standard
	name = "BM BR 10x50mm \"Omnirifle\""
	desc = "An original rifle created by the Blackshield Militia with aid of the Artificer's Guild and Soteria Institute. \
		 A weapon built for versatility and rugged reliability, it fires a variety of utility and specialized munitions. \
		 Chambered in 10x50mm Omni, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 Certain loadings are physically demanding for even the strongest users without the aid of powered armor."
	icon_state = "omnirifle"
	item_state = "omnirifle"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5)
	price_tag = 2500
	zoom_factor = 0.2
	recoil_buildup = 0.3
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_5_ROUND,
		FULL_AUTO_400
		)

/obj/item/weapon/gun/projectile/automatic/omnirifle/scoped
	name = "BM BR 10x50mm \"Longarm\""
	desc = "Heavy frontline designated marksman rifle of the Blackshield Militia designed from an existing Sol Federation rifle. \
		 Either a copy or 'liberated' model of the venerable M13A2 Special Purpose Rifle, it fires a variety of utility and specialized munitions. \
		 Chambered in 10x50mm Omni, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example is fitted with an advanced combat sight and limited to semiautomatic."
	icon_state = "scoped-omnirifle"
	item_state = "scoped-omnirifle"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 10)
	price_tag = 3000
	damage_multiplier = 1.2
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	zoom_factor = 0.8
	recoil_buildup = 0.7


/obj/item/weapon/gun/projectile/automatic/omnirifle/fancy
	name = "BM BR 10x50mm \"Osprey\""
	desc = "Classic, elegant sporting rifle based on proven military technology. \
		 A civilian, sportman's model of the venerable M13A1 Special Purpose Rifle, it fires a variety of utility and specialized munitions. \
		 Chambered in 10x50mm Omni, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example is fitted with an high-zoom optic, elegant wood furniture, and is limited to semiautomatic."
	icon_state = "fancy-omnirifle"
	item_state = "fancy-omnirifle"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 15, MATERIAL_GLASS = 10)
	price_tag = 3500
	recoil_buildup = 0.6
	damage_multiplier = 1.2
	zoom_factor = 0.9
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'

/obj/item/weapon/gun/projectile/automatic/omnirifle/omnicarbine
	name = "BM CAR 10x50mm \"Boar\""
	desc = "Heavy second-line carbine made by the Boris of the Nadezhda Marshals. \
		 A rifle fashioned by a brute of a man and made for similar brutes, taking influence from the MK-12 Omnicarbine, chambered in 10x50mm Omni. \
		 Its gaping bore packs a punch, however the recoil is incredibly violent and terrifying. \
		 Despite the blinding muzzle flash and agonizing recoil, its small arguably makes up for the disadvantages."
	icon_state = "omnicarbine"
	item_state = "omnicarbine"
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10)
	price_tag = 2500
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	damage_multiplier = 0.8
	recoil_buildup = 0.5

	firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_400
		)

/obj/item/weapon/gun/projectile/automatic/omnirifle/omnicarbine/rds
	name = "BM CAR 10x50mm \"Boar\""
	desc = "Heavy second-line carbine made by the Boris of the Nadezhda Marshals. \
		 A rifle fashioned by a brute of a man and made for similar brutes, taking influence from MK-12 MOD 1 Omnicarbine, chambered in 10x50mm Omni. \
		 Its gaping bore packs a punch, however the recoil is incredibly violent and terrifying. \
		 Fitted with a muzzle brake, holographic sight, and limited to 3-round bursts, it's almost managable. Almost.."
	icon_state = "rds-omnicarbine"
	item_state = "rds-omnicarbine"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5)
	price_tag = 3000
	damage_multiplier = 0.8
	recoil_buildup = 0.3

	firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)