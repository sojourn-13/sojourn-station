/obj/item/weapon/gun/projectile/automatic/omnirifle
	name = "BM BR 10x50mm \"Hustler\""
	desc = "A heavy, inexpensive battle rifle of dubious quality.\
		 An inexpensive budget rifle, it is a stripped down copy of the M12 Omnirifle, it fires a variety of utility and specialized munitions. \
		 Chambered in 10x50mm Omni, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example... frankly sucks and is limited to semiautomatic."
	icon = 'icons/obj/guns/projectile/Hustler.dmi'
	icon_state = "hustler"
	item_state = "hustler"
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
	recoil_buildup = 25
	one_hand_penalty = 15
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rifle_boltforward.ogg'

	firemodes = list(
	SEMI_AUTO_NODELAY
	)

/obj/item/weapon/gun/projectile/automatic/omnirifle/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"
		itemstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/omnirifle/Initialize()
	. = ..()
	update_icon()


/obj/item/weapon/gun/projectile/automatic/omnirifle/standard
	name = "BM BR 10x50mm \"Omnirifle\""
	desc = "An original rifle created by the Blackshield Militia with aid of the Artificer's Guild and Soteria Institute. \
		 A weapon built for versatility and rugged reliability, it fires a variety of utility and specialized munitions. \
		 Chambered in 10x50mm Omni, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 Certain munitions are physically demanding for even the strongest users without the aid of power armor or gun platforms."
	icon = 'icons/obj/guns/projectile/Omnirifle.dmi'
	icon_state = "omnirifle"
	item_state = "omnirifle"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5)
	price_tag = 2500
	zoom_factor = 0.3
	recoil_buildup = 20
	one_hand_penalty = 10
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		FULL_AUTO_400
		)

/obj/item/weapon/gun/projectile/automatic/omnirifle/scoped
	name = "BM BR 10x50mm \"Longarm\""
	desc = "The heavy frontline designated marksman rifle of the Blackshield Militia designed from an existing Sol Federation rifle. \
		 Either a copy or 'liberated' model of the venerable M13A2 Special Purpose Rifle, it fires a variety of utility and specialized munitions. \
		 Chambered in 10x50mm Omni, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example is fitted with an advanced combat sight and limited to semiautomatic."
	icon = 'icons/obj/guns/projectile/DMR.dmi'
	icon_state = "DMR"
	item_state = "DMR"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 10)
	price_tag = 3000
	damage_multiplier = 1.2
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	zoom_factor = 1
	recoil_buildup = 20
	one_hand_penalty = 20


/obj/item/weapon/gun/projectile/automatic/omnirifle/fancy
	name = "BM BR 10x50mm \"Osprey\""
	desc = "Classic, elegant sporting rifle based on proven military technology. \
		 A civilian, sportman's model of the venerable M13A1 Special Purpose Rifle, it fires a variety of utility and specialized munitions. \
		 Chambered in 10x50mm Omni, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example is fitted with an high-zoom optic, elegant wood furnishing, and is limited to semiautomatic."
	icon = 'icons/obj/guns/projectile/Osprey.dmi'
	icon_state = "osprey"
	item_state = "osprey"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 15, MATERIAL_GLASS = 10)
	price_tag = 3500
	recoil_buildup = 20
	damage_multiplier = 1.2
	zoom_factor = 0.9
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'

/obj/item/weapon/gun/projectile/automatic/omnirifle/omnicarbine
	name = "BM CAR 10x50mm \"Boar\""
	desc = "The heavy second-line carbine made by Boris Kilmeade of the Nadezhda Marshals. \
		 A rifle fashioned by a brute of a man and made for similar brutes, taking influence from the MK-12 Omnicarbine, chambered in 10x50mm Omni. \
		 Its gaping bore packs a punch, however the recoil is incredibly violent and terrifying. \
		 Despite the blinding muzzle flash and agonizing recoil, its small size arguably makes up for the disadvantages."
	icon = 'icons/obj/guns/projectile/Boar.dmi'
	icon_state = "boar"
	item_state = "boar"
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10)
	price_tag = 2500
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	damage_multiplier = 0.8
	recoil_buildup = 30
	one_hand_penalty = 30
	firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_600
		)

/obj/item/weapon/gun/projectile/automatic/omnirifle/omnicarbine/rds
	name = "BM CAR 10x50mm \"Warthog\""
	desc = "The heavy second-line carbine made by Boris Kilmeade of the Nadezhda Marshals. \
		 A rifle fashioned by a brute of a man and made for similar brutes, taking influence from MK-12 MOD 1 Omnicarbine, chambered in 10x50mm Omni. \
		 Its gaping bore packs a punch, however the recoil is incredibly violent and terrifying. \
		 This one is fitted with a muzzle brake, holographic sight, and limited to 3-round bursts, it's almost managable. Almost."
	icon = 'icons/obj/guns/projectile/Warthog.dmi'
	icon_state = "warthog"
	item_state = "warthog"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5)
	price_tag = 3000
	damage_multiplier = 0.8
	recoil_buildup = 25
	one_hand_penalty = 25
	firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)