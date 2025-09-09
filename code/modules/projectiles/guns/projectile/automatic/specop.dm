/obj/item/gun/projectile/automatic/specop
	name = "\"Spec-Op\" caseless Carbine"
	desc = "The aptly named \"Spec Op\" is a 10x24 hard hitting, compact carbine perfect for operators preferring stealth. While limited in range, operators remark the weapon as nearly silent, leaving behind no signs of a fight besides targets riddled with lead."
	icon_state = "specop"
	item_state = "specop"
	icon = 'icons/obj/guns/projectile/specop.dmi'
	fire_sound = 'sound/weapons/guns/fire/m41_shoot.ogg'
	silenced = TRUE
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK|SLOT_BELT|SLOT_HOLSTER
	caliber = "10x24"
	ammo_type =  /obj/item/ammo_casing/c10x24
	load_method = SINGLE_CASING|MAGAZINE
	mag_well =  MAG_WELL_RIFLE
	matter = list(MATERIAL_PLASTEEL = 14, MATERIAL_STEEL = 6, MATERIAL_PLASTIC = 8)
	price_tag = 1150
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	damage_multiplier = 1.0
	penetration_multiplier = 1.15
	zoom_factors = list(0.2)
	init_recoil = LMG_RECOIL(0.6)
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_600
		)
	serial_type = "NM"
	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.3 // Heavy smg , 30 vig to insta wield
	gun_parts = list(/obj/item/part/gun/frame/specop = 1, /obj/item/part/gun/grip/rubber = 1, /obj/item/part/gun/mechanism/smg = 1, /obj/item/part/gun/barrel/clrifle = 1)

/obj/item/gun/projectile/automatic/specop/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"
		itemstring += "_full"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/specop/Initialize()
	. = ..()
	update_icon()

/obj/item/part/gun/frame/specop
	name = "Specop SMG frame"
	desc = "A Spec-Op SMG frame. For the most talented urban assassin."
	icon_state = "frame_specop"
	matter = list(MATERIAL_PLASTEEL = 8)
	result = /obj/item/gun/projectile/automatic/specop
	resultvars = list(/obj/item/gun/projectile/automatic/specop)
	gripvars = list(/obj/item/part/gun/grip/rubber)
	mechanismvar = /obj/item/part/gun/mechanism/smg
	barrelvars = list(/obj/item/part/gun/barrel/clrifle)
