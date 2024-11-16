/obj/item/gun/projectile/automatic/sts
	name = "\"STS\" carbine"
	desc = "The rugged STS-25, the right arm of the unfree world. Uses 6.5mm Carbine rounds."
	icon = 'icons/obj/guns/projectile/sts25.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	price_tag = 850
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 1.2
	init_recoil = RIFLE_RECOIL(1.1)
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL, GUN_SILENCABLE, GUN_KNIFE)	//Can add bayonet
	serial_type = "SA"
	gun_parts = list(/obj/item/part/gun/frame/sts = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/srifle = 1)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/sts/sawn/true


	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		FULL_AUTO_300,
		)


/obj/item/gun/projectile/automatic/sts/update_icon()
	..()
	cut_overlays()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (bayonet)
		add_overlay("bayonet")

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/sts/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/sts/carbine

/obj/item/gun/projectile/automatic/sts/sawn // Skeleton one for code reasons
	name = "short-barreled \"STS\" carbine"
	desc = "The rugged STS-25, the right left arm of the unfree world. Uses 6.5mm Carbine rounds. This one has had its stock lopped off and its barrel shortened, rendering it rather impractical to use."
	icon = 'icons/obj/guns/projectile/sawnoff/sts25.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	price_tag = 600
	init_recoil = RIFLE_RECOIL(1.2)
	saw_off = FALSE
	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.2 // 20 vig for insta wield
	gun_parts = list(/obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/stack/material/plasteel = 2)

/obj/item/gun/projectile/automatic/sts/sawn/true // The one we should get

/obj/item/gun/projectile/automatic/sts/rifle
	name = "\"STS\" battle rifle"
	desc = "A rugged STS-30.  Uses 7.62mm rifle rounds. We'll keep our land a free land, stop the enemy coming in."
	icon = 'icons/obj/guns/projectile/sts30.dmi'
	icon_state = "sts"
	item_state = "sts"
	price_tag = 1000
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	damage_multiplier = 1
	penetration_multiplier = 1.2
	init_recoil = RIFLE_RECOIL(1.3)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 12)
	fire_sound = 'sound/weapons/guns/fire/NM_PARA.ogg'
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/sts/rifle/sawn

	gun_parts = list(/obj/item/part/gun/frame/sts = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND,
		FULL_AUTO_300
		)

/obj/item/gun/projectile/automatic/sts/rifle/sawn
	name = "short-barreled \"STS\" battle rifle"
	desc = "A rugged STS-30.  Uses 7.62mm rifle rounds. This one has been shortened as much as possible while still being able to function properly."
	icon = 'icons/obj/guns/projectile/sawnoff/sts30.dmi'
	icon_state = "sts"
	item_state = "sts"
	price_tag = 800
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	penetration_multiplier = 1
	init_recoil = RIFLE_RECOIL(1.4)
	saw_off = FALSE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 12)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND,
		FULL_AUTO_300
		)
	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.2 // 20 vig for insta wield
	gun_parts = list(/obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/stack/material/plasteel = 2)

/obj/item/gun/projectile/automatic/sts/rifle/heavy
	name = "\"STS\" heavy rifle"
	desc = "A rugged STS-40. Uses 8.6x70mm heavy rifle rounds. If we have to go alone, we'll go alone with pride."
	icon = 'icons/obj/guns/projectile/sts40.dmi'
	icon_state = "sts"
	item_state = "sts"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	w_class = ITEM_SIZE_HUGE
	caliber = CAL_HRIFLE
	mag_well = MAG_WELL_HRIFLE|MAG_WELL_DRUM
	price_tag = 1500
	penetration_multiplier = 1.1
	damage_multiplier = 1.1
	init_recoil = RIFLE_RECOIL(1.7)
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	cocked_sound = 'sound/weapons/guns/interact/batrifle_cock.ogg'
	saw_off = TRUE
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL, GUN_SILENCABLE)	//No bayonet for you.
	sawn = /obj/item/gun/projectile/automatic/sts/rifle/heavy/sawn
	gun_parts = list(/obj/item/part/gun/frame/sts = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/hrifle = 1)
	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)

/obj/item/gun/projectile/automatic/sts/rifle/heavy/sawn
	name = "sawn down \"STS\" heavy rifle"
	desc = "A rugged STS-40. Uses 8.6x70mm heavy rifle rounds. This one has been shortened as much as possible while still being able to function properly."
	icon = 'icons/obj/guns/projectile/sawnoff/sts40.dmi'
	icon_state = "sts"
	item_state = "sts"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	price_tag = 1125
	w_class = ITEM_SIZE_BULKY
	penetration_multiplier = 0.8
	damage_multiplier = 1
	gun_parts = list(/obj/item/stack/material/plastic = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/stack/material/plasteel = 2)
	init_recoil = RIFLE_RECOIL(1.8)
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 4)
	saw_off = FALSE


/obj/item/gun/projectile/automatic/sts/rifle/blackshield
	name = "\"STS PARA\" Blackshield rifle"
	desc = "A lightweight modified variant of the STS-30 that takes 7.62mm rounds, shedding wartime wood for modern plastic polymer. \
	The lightweight polymer, skeletal stock and shortened barrel make this weapon much lighter than the standard STS with modified receivers and gas block for better recoil control. \
	Two stamps are pressed into the side of the receiver: A 'M&C' logo and a blackshield logo."
	icon = 'icons/obj/guns/projectile/sts35.dmi'
	icon_state = "stspara"
	item_state = "stspara"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	w_class = ITEM_SIZE_BULKY
	extra_bulk = -2 //Slightly smaller
	damage_multiplier = 1.3 //Well oiled
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	init_recoil = RIFLE_RECOIL(1.1)
	fire_sound = 'sound/weapons/guns/fire/NM_PARA.ogg' // This is the sound ripped from a video of me shooting an FM FSL. As real as it gets. - Seb
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/sts/rifle/blackshield/sawn
	serial_type = "NM"
	gun_parts = list(/obj/item/part/gun/frame/sts = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/lrifle = 1)

	max_upgrades = 2 // We got good baseline lets not get out of hand here
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND,
		FULL_AUTO_300
		)

	blacklist_upgrades = list(/obj/item/tool_upgrade/augment/expansion = TRUE,
							  /obj/item/gun_upgrade/mechanism/greyson_master_catalyst = TRUE,
							  /obj/item/tool_upgrade/productivity/ergonomic_grip = TRUE,
							  /obj/item/tool_upgrade/refinement/stabilized_grip = TRUE)

/obj/item/gun/projectile/automatic/sts/rifle/blackshield/sawn
	name = "short-barreled Blackshield \"STS PARA\" rifle"
	desc = "A lightweight modified variant of the STS-30 that takes 7.62mm rounds, shedding wartime wood for modern plastic polymer. This one has been shortened as much as possible while still being able to function properly."
	icon = 'icons/obj/guns/projectile/sawnoff/sts35.dmi'
	icon_state = "stspara"
	item_state = "stspara"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	extra_bulk = -2
	init_recoil = RIFLE_RECOIL(1.2)
	damage_multiplier = 1.2 //Well oiled
	saw_off = FALSE
	max_upgrades = 2 // We got good baseline lets not get out of hand here
	fire_sound = 'sound/weapons/guns/fire/NM_PARA.ogg'
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	serial_type = "NM"

	wield_delay = 0.8 SECOND
	wield_delay_factor = 0.2 // 20 vig for insta wield
	gun_parts = list(/obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/stack/material/plasteel = 2)


/obj/item/part/gun/frame/sts
	name = "STS rifle frame"
	desc = "An STS rifle frame. Cheap, effective, replaceable."
	icon_state = "frame_sts"
	matter = list(MATERIAL_PLASTEEL = 8)
	result = /obj/item/gun/projectile/automatic/sts/rifle
	gripvars = list(/obj/item/part/gun/grip/black, /obj/item/part/gun/grip/wood, /obj/item/part/gun/grip/rubber)
	resultvars = list(/obj/item/gun/projectile/automatic/sts, /obj/item/gun/projectile/automatic/sts/rifle, /obj/item/gun/projectile/automatic/sts/rifle/heavy)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/srifle, /obj/item/part/gun/barrel/lrifle, /obj/item/part/gun/barrel/hrifle)
