/obj/item/gun/projectile/automatic/omnirifle
	name = "\"Omnirifle\""
	desc = "A standard issue battle rifle issued to SolFed Marines, produced across the galaxy by state arsenals. \
		 A weapon built for versatility and rugged reliability, it fires a variety of utility and specialized munitions. \
		 Chambered in 8.6x70mm, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 Certain munitions are physically demanding for even the strongest users without the aid of power armor or gun platforms. \
		 This example has defaced serial numbers and added electro-penciled rack numbers."
	icon = 'icons/obj/guns/projectile/Omnirifle.dmi'
	icon_state = "omnirifle"
	item_state = "omnirifle"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_HRIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_HRIFLE|MAG_WELL_DRUM
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5, MATERIAL_DIAMOND = 3)
	price_tag = 1500
	penetration_multiplier = 1.1
	damage_multiplier = 1.2
	zoom_factors = list(0.4)
	init_recoil = RIFLE_RECOIL(1.0)
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rifle_boltforward.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/guns/interact/sfrifle_cock.ogg'

	init_firemodes = list(
	FULL_AUTO_300,
	SEMI_AUTO_NODELAY
	)
	serial_type = "Sol Fed"
	wield_delay = 1.6 SECOND
	wield_delay_factor = 0.5 // 50 vig to insta wield , heavy class battle rifle

	gun_parts = list(/obj/item/part/gun/frame/omni = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/hrifle = 1)

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

/obj/item/gun/projectile/automatic/omnirifle/scoped
	name = "\"Longarm\" marksman rifle"
	desc = "A heavy front line designated marksman rifle manufactured by H&S, also known as the M13A2 Special Purpose Rifle in its generic military form. \
		 Either a copy or 'liberated' example, it fires a variety of utility and specialized munitions. \
		 Chambered in 8.6x70mm, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example is fitted with an advanced combat sight and limited to semiautomatic and burst modes. \
		 Due to market competition on the Omnirifle platform, H&S allowed for an extra fee special limited edition custom prints."
	icon = 'icons/obj/guns/projectile/DMR.dmi'
	icon_state = "DMR"
	item_state = "DMR"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 10, MATERIAL_DIAMOND = 3)
	mag_well = MAG_WELL_HRIFLE
	gun_parts = null
	price_tag = 2000
	damage_multiplier = 1.2
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/guns/interact/sfrifle_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	zoom_factors = list(1)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	init_recoil = RIFLE_RECOIL(0.7)
	penetration_multiplier = 1.35
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND,
		BURST_3_ROUND
		)
	serial_type = "H&S"
	gun_parts = null //To prevent meme decon of uniques

/obj/item/gun/projectile/automatic/omnirifle/scoped/fancy
	name = "\"Osprey\" precision rifle"
	desc = "Classic, elegant sporting rifle based on proven military technology. \
		 A police model of the venerable M13A1 Special Purpose Rifle manufactured on Earth by Seinemetall Defense GmbH for both sportsmen and counter-terror agents, it fires a variety of utility and specialized munitions. \
		 Chambered in 8.6x70mm, its gaping bore allows virtually any imaginable payload, however the recoil and magazine suffer for it. \
		 This example is fitted with an high-zoom optic, elegant wood furnishing, and is limited to semiautomatic."
	icon = 'icons/obj/guns/projectile/Osprey.dmi'
	icon_state = "osprey"
	item_state = "osprey"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 15, MATERIAL_GLASS = 10, MATERIAL_DIAMOND = 3)
	mag_well = MAG_WELL_HRIFLE
	price_tag = 2000
	init_recoil = RIFLE_RECOIL(0.7)
	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	serial_type = "SD GmbH"


/obj/item/gun/projectile/automatic/omnirifle/rds
	name = "\"Warthog\" advanced rifle"
	desc = "A heavy second-line rifle manufactured by H&S, as well as number of state arsenals. Designed for close range encounters and support fire. \
		 A rifle fashioned for cover fire and cramped environments. Chambered in 8.6x70mm. \
		 Its gaping bore packs a punch, however the recoil is incredibly violent and terrifying. \
		 This one is fitted with a muzzle brake, fore grip, holographic sight, and limited to 3-round bursts, it's almost manageable. Almost."
	icon = 'icons/obj/guns/projectile/Warthog.dmi'
	icon_state = "warthog"
	item_state = "warthog"
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 10, MATERIAL_GLASS = 5, MATERIAL_DIAMOND = 3)
	mag_well = MAG_WELL_HRIFLE|MAG_WELL_DRUM
	price_tag = 1750
	penetration_multiplier = 1.2
	damage_multiplier = 1.1
	init_recoil = RIFLE_RECOIL(0.8)
	zoom_factors = list(0.4)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)
	serial_type = "H&S"

	gun_parts = list(/obj/item/part/gun/frame/omni = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/hrifle = 1)

/obj/item/part/gun/frame/omni
	name = "Omnirifle frame"
	desc = "An Omnirifle frame. The ex-war criminal's delight. Includes advanced mechanisms not often seen in more 'common' arms."
	icon_state = "frame_omni"
	matter = list(MATERIAL_PLASTEEL = 8, MATERIAL_DIAMOND = 3)
	result = /obj/item/gun/projectile/automatic/omnirifle
	gripvars = list(/obj/item/part/gun/grip/black, /obj/item/part/gun/grip/rubber)
	resultvars = list(/obj/item/gun/projectile/automatic/omnirifle, /obj/item/gun/projectile/automatic/omnirifle/rds)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/hrifle)

/obj/item/gun/projectile/automatic/omnirifle/hustler
	name = "\"Hustler\" breacher shotgun"
	desc = "The breacher special, this brick of a gun is cobbled together by Marshal Gunsmiths with far too much time and far too few matching omni-rifle mechanisms and frames.\
	Not entirely a novel design, hackjobs such as this were common in the worst theatres during The Harrowing; Where logistic complications and the reality of war necessitated\
	pushing the  famously durable and versatile omni-frame to its absolute limits. While many of those designs would turn out to be ineffective, impractical or deadly for the user \
	this one has worked out surprisingly well. The added weight and barrel length add stability and accuracy often lacking from other firearms chambered in the famously wiley 20mm \
	allowing for a steady stream of heavy-caliber slugs to be thrown downrange albeit at the cost of weight and flexibility."
	icon = 'icons/obj/guns/projectile/Hustler.dmi'
	icon_state = "hustler"
	item_state = "hustler"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_SHOTGUN
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_PLASTIC = 15, MATERIAL_DIAMOND = 10)
	gun_parts = null
	price_tag = 2000
	penetration_multiplier = 1.1
	damage_multiplier = 1.3 //better than the saigini but no full auto
	zoom_factors = list(0.4)
	fire_delay = 12
	init_recoil = RIFLE_RECOIL(1.0) //less recoil than others, because we're so slow to fire/move
	fire_sound = 'sound/weapons/guns/fire/sbaw.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/batrifle_cock.ogg'
	max_upgrades = 3//Starts good but less modifiable
	blacklist_upgrades = list(
							/obj/item/tool_upgrade/augment/expansion = TRUE,
							  )
	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)

	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL, GUN_SIGHT)
