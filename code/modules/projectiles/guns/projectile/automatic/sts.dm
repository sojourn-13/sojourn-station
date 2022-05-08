/obj/item/gun/projectile/automatic/sts
	name = "\"STS\" carbine"
	desc = "The rugged STS-25, the right arm of the unfree world. Uses Carbine rounds. This one is unmarked."
	icon = 'icons/obj/guns/projectile/sts25.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_STANMAG
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	price_tag = 1650
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 1.2
	recoil_buildup = 1.75
	one_hand_penalty = 13 //automatic rifle level
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)
	serial_type = "SA"


	init_firemodes = list(
		FULL_AUTO_400,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		)


/obj/item/gun/projectile/automatic/sts/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/sts/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/sts/lrifle
	name = "\"STS\" carbine"
	desc = "The rugged STS-25, the right left arm of the unfree world. Uses Carbine rounds. This one is unmarked."
	icon = 'icons/obj/guns/projectile/sts25.dmi'
	icon_state = "sts"
	item_state = "sts"
	price_tag = 1250
	gun_tags = list(GUN_PROJECTILE,GUN_SILENCABLE, GUN_MAGWELL)
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 12)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/sts/lrifle/sawn

/obj/item/gun/projectile/automatic/sts/lrifle/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/sts/lrifle/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/sts/lrifle/sawn
	name = "\"STS\" carbine"
	desc = "The rugged STS-25, the right left arm of the unfree world. Uses Carbine rounds. This one has had its stock lopped off, rendering it rather impractical to use.."
	icon = 'icons/obj/guns/projectile/sawnoff/sts25.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 6)
	price_tag = 600
	recoil_buildup = 4
	one_hand_penalty = 20
	saw_off = FALSE

/obj/item/gun/projectile/automatic/sts/rifle
	name = "\"STS\" battle rifle"
	desc = "A rugged STS-30.  Uses 7.5mm rifle rounds. We'll keep our land a free land, stop the enemy coming in."
	icon = 'icons/obj/guns/projectile/sts30.dmi'
	icon_state = "sts"
	item_state = "sts"
	price_tag = 1500
	w_class = ITEM_SIZE_HUGE
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	damage_multiplier = 1
	penetration_multiplier = 1.2
	recoil_buildup = 2
	one_hand_penalty = 20
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/sts/rifle/sawn


	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_400
		)

/obj/item/gun/projectile/automatic/sts/rifle/sawn
	name = "sawn down \"STS\" battle rifle"
	desc = "A rugged STS-30.  Uses 7.5mm rifle rounds. This one has been shortened as much as possible while still able to function."
	icon = 'icons/obj/guns/projectile/sawnoff/sts30.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	penetration_multiplier = 1.0
	recoil_buildup = 3
	one_hand_penalty = 20 //automatic rifle level
	saw_off = FALSE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_400
		)

/obj/item/gun/projectile/automatic/sts/rifle/blackshield
	name = "\"STS PARA\" Blackshield rifle"
	desc = "A lightweight modified variant of the STS-30 that takes 7.5mm rounds, shedding wartime wood for modern plastic polymer. \
	The lightweight polymer, skeletal stock, and shortened barrel make this weapon much lighter than the standard STS with modified recievers and gas block for better recoil control. \
	Two stamps are pressed into the side of the receiver: A 'M&C' logo and a blackshield logo."
	icon = 'icons/obj/guns/projectile/sts35.dmi'
	icon_state = "stspara"
	item_state = "stspara"
	w_class = ITEM_SIZE_HUGE
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	damage_multiplier = 1.2 //Well oiled
	recoil_buildup = 1.75
	one_hand_penalty = 18
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/sts/rifle/sawn/blackshield
	serial_type = "NM"

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND,
		FULL_AUTO_400
		)

/obj/item/gun/projectile/automatic/sts/rifle/sawn/blackshield
	name = "sawn down Blackshield \"STS PARA\" rifle"
	desc = "A rugged STS-35 with two round burst.  Uses 7.5mm rifle rounds. This one has been shortened as much as possible while still able to function still more effective then a normal STS-30 varent."
	icon = 'icons/obj/guns/projectile/sawnoff/sts30.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	damage_multiplier = 1.0 //Rifle was fine
	recoil_buildup = 2.5
	one_hand_penalty = 22 //automatic rifle level
	saw_off = FALSE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	serial_type = "NM"

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND,
		FULL_AUTO_400
		)

/obj/item/gun/projectile/automatic/sts/hrifle
	name = "\"STS\" heavy rifle"
	desc = "A rugged STS-40. Uses .408 heavy rifle rounds. If we have to go alone, we'll go alone with pride."
	icon = 'icons/obj/guns/projectile/sts40.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_HUGE
	caliber = CAL_HRIFLE
	mag_well = MAG_WELL_HRIFLE|MAG_WELL_DRUM
	price_tag = 1750
	penetration_multiplier = 1.1
	damage_multiplier = 1.1
	recoil_buildup = 12
	one_hand_penalty = 25
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	cocked_sound = 'sound/weapons/guns/interact/batrifle_cock.ogg'
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/sts/hrifle/sawn
	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)

/obj/item/gun/projectile/automatic/sts/hrifle/sawn
	name = "sawn down \"STS\" heavy rifle"
	desc = "A rugged STS-40. Uses .408 heavy rifle rounds. This one has been shortened as much as possible while still able to function."
	icon = 'icons/obj/guns/projectile/sts40.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_BULKY
	penetration_multiplier = 0.8
	damage_multiplier = 1
	recoil_buildup = 20
	one_hand_penalty = 30
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 6)
	saw_off = FALSE
