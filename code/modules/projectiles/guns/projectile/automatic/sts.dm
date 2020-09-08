/obj/item/weapon/gun/projectile/automatic/sts
	name = "\"STS\" carbine"
	desc = "The rugged STS-25, the right left arm of the unfree world. Uses Carbine rounds. This one is unmarked."
	icon = 'icons/obj/guns/projectile/sts25.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_STANMAG
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	price_tag = 1650
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 1.1
	recoil_buildup = 8
	one_hand_penalty = 15 //automatic rifle level


	init_firemodes = list(
		FULL_AUTO_400,
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		)


/obj/item/weapon/gun/projectile/automatic/sts/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/sts/Initialize()
	. = ..()
	update_icon()

/obj/item/weapon/gun/projectile/automatic/sts/lrifle
	name = "\"STS\" carbine"
	desc = "The rugged STS-25, the right left arm of the unfree world. Uses Carbine rounds. This one is unmarked."
	icon = 'icons/obj/guns/projectile/sts25.dmi'
	icon_state = "sts"
	item_state = "sts"
	gun_tags = list(GUN_PROJECTILE,GUN_SILENCABLE)
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/automatic/sts/lrifle/sawn

/obj/item/weapon/gun/projectile/automatic/sts/lrifle/update_icon()
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

/obj/item/weapon/gun/projectile/automatic/sts/lrifle/Initialize()
	. = ..()
	update_icon()

/obj/item/weapon/gun/projectile/automatic/sts/lrifle/sawn
	name = "\"STS\" carbine"
	desc = "The rugged STS-25, the right left arm of the unfree world. Uses Carbine rounds. This one has had its stock lopped off, rendering it rather impractical to use.."
	icon = 'icons/obj/guns/projectile/sawnoff/sts25.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	price_tag = 600
	recoil_buildup = 15
	one_hand_penalty = 25
	saw_off = FALSE

/obj/item/weapon/gun/projectile/automatic/sts/rifle
	name = "\"STS\" battle rifle"
	desc = "A rugged STS-30.  Uses 7.5mm rifle rounds. We'll keep our land a free land, stop the enemy coming in."
	icon = 'icons/obj/guns/projectile/sts30.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_HUGE
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	damage_multiplier = 1
	recoil_buildup = 11
	one_hand_penalty = 20
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/automatic/sts/rifle/sawn


	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_400
		)

/obj/item/weapon/gun/projectile/automatic/sts/rifle/sawn
	name = "sawn down \"STS\" battle rifle"
	desc = "A rugged STS-30.  Uses 7.5mm rifle rounds. This one has been shortened as much as possible while still able to function."
	icon = 'icons/obj/guns/projectile/sawnoff/sts30.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_RIFLE
	mag_well = MAG_WELL_RIFLE
	damage_multiplier = 0.8
	recoil_buildup = 15
	one_hand_penalty = 25 //automatic rifle level
	saw_off = FALSE

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_400
		)

/obj/item/weapon/gun/projectile/automatic/sts/hrifle
	name = "\"STS\" heavy rifle"
	desc = "A rugged STS-40. Uses .408 heavy rifle rounds. If we have to go alone, we'll go alone with pride."
	icon = 'icons/obj/guns/projectile/sts40.dmi'
	icon_state = "sts"
	item_state = "sts"
	w_class = ITEM_SIZE_HUGE
	caliber = CAL_HRIFLE
	mag_well = MAG_WELL_HRIFLE
	penetration_multiplier = 1
	damage_multiplier = 1.3
	recoil_buildup = 15
	one_hand_penalty = 30
	fire_sound = 'sound/weapons/guns/fire/sniper_fire.ogg'
	cocked_sound = 'sound/weapons/guns/interact/batrifle_cock.ogg'
	saw_off = TRUE
	sawn = /obj/item/weapon/gun/projectile/automatic/sts/hrifle/sawn
	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)

/obj/item/weapon/gun/projectile/automatic/sts/hrifle/sawn
	name = "sawn down \"STS\" heavy rifle"
	desc = "A rugged STS-40. Uses .408 heavy rifle rounds. This one has been shortened as much as possible while still able to function."
	icon = 'icons/obj/guns/projectile/sts40.dmi'
	icon_state = "sts"
	item_state = "sts"
	penetration_multiplier = 0.8
	damage_multiplier = 1
	recoil_buildup = 20
	one_hand_penalty = 30
	saw_off = FALSE