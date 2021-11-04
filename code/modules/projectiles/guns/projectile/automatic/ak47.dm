/obj/item/gun/projectile/automatic/ak47
	name = "Excelsior \"Kalashnikov\" carbine"
	desc = "\"We stand for organized terror - this should be frankly admitted. Terror is an absolute necessity during times of revolution.\"\
		 A copy of the Kalashnikov pattern, shortened into a mid-length carbine and chambered in 7.5. This is an abysmal, printed copy."
	icon = 'icons/obj/guns/projectile/ak.dmi'
	icon_state = "AK"
	item_state = "AK"
	item_suffix = ""
	w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_RIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 10)
	price_tag = 1500
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	damage_multiplier = 1 //the uncheap
	recoil_buildup = 1.25
	one_hand_penalty = 10 //automatic rifle level
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)

	init_firemodes = list(
		FULL_AUTO_400,
		SEMI_AUTO_NODELAY
		)

/obj/item/gun/projectile/automatic/ak47/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/ak47/Initialize()
	. = ..()
	update_icon()

/obj/item/gun/projectile/automatic/ak47/saiga
	name = "Excelsior \"Saiga 12\" carbine"
	desc = "\"Let the ruling classes tremble at a Communistic revolution. The proletarians have nothing to lose but their chains. They have a world to win..\"\
		 A bulked up and modified version of the kalashnikov made to fire 20mm shotgun slugs, similar to the sol federation SBAW design. Uses 20mm in SBAW magazines."
	icon = 'icons/obj/guns/projectile/saiga12.dmi'
	icon_state = "saiga"
	item_state = "saiga"
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	mag_well = MAG_WELL_DRUM
	recoil_buildup = 25
	one_hand_penalty = 30

/obj/item/gun/projectile/automatic/ak47/akl
	name = "\"Legkiy-Kalashnikov\" laser carbine"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
	A modernized experimental version of an old Kalashnikov design, desginated to take .223 laser ammuniton. The future is now, comrade. This modified type is commonly found in use by void wolves and similar ilk."
	icon = 'icons/obj/guns/projectile/akl.dmi'
	icon_state = "AKL"
	item_state = "AKL"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_PLASTIC = 10, MATERIAL_SILVER = 10, MATERIAL_GOLD = 5)
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_MAGNET = 3, TECH_POWER = 5)
	price_tag = 1000
	recoil_buildup = 0.75
	one_hand_penalty = 10
	damage_multiplier = 1.2 //We hold less ammo but deal about the same damage
	saw_off = FALSE
	caliber = CAL_SCI
	mag_well = MAG_WELL_LSRIFLE
	fire_sound = 'sound/weapons/Laser.ogg'
	init_firemodes = list(
		FULL_AUTO_400,
		BURST_5_ROUND,
		SEMI_AUTO_NODELAY
		)

/obj/item/gun/projectile/automatic/ak47/sa
	name = "\"Kalashnikov\" carbine"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
		 A copy of the AKM pattern, shortened into a mid-length carbine and chambered in 7.5. The left arm of the unfree world."
	icon = 'icons/obj/guns/projectile/ak_wood.dmi'
	icon_state = "AK"
	item_state = "AK"
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10)
	price_tag = 1000
	damage_multiplier = 0.9 //7.5 cal
	recoil_buildup = 2
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	saw_off = TRUE
	sawn = /obj/item/gun/projectile/automatic/ak47/sawn

/obj/item/gun/projectile/automatic/ak47/sawn
	name = "sawn-off \"Kalashnikov\" carbine"
	desc = "Weapon of the oppressed, oppressors, and extremists of all flavours. \
	A copy of the AKM pattern chambered in 7.5 and crudely sawed down to a shadow of its former self. Rifle was fine. Was."
	icon = 'icons/obj/guns/projectile/sawnoff/ak.dmi'
	icon_state = "AK"
	item_state = "AK"
	w_class = ITEM_SIZE_NORMAL
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5)
	price_tag = 650
	recoil_buildup = 4
	one_hand_penalty = 20
	damage_multiplier = 0.8
	saw_off = FALSE
