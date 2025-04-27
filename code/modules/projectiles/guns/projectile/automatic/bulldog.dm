/obj/item/gun/projectile/automatic/bulldog
	name = "\"Bulldog\" carbine"
	desc = "An economy-class carbine manufactured by Seinemetall Defense GmbH and used as a common carry gun for security and police far and wide, though also popular with various adventurous sorts as a semi-disposable option in the bush. Compact and reliable. Uses .257 Carbine rounds."
	icon = 'icons/obj/guns/projectile/bulldog.dmi'
	icon_state = "bulldog"
	item_state = "bulldog"
	w_class = ITEM_SIZE_BULKY
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_PLASTIC = 12)
	price_tag = 1100
	gun_parts = list(/obj/item/part/gun/frame/bulldog = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/autorifle = 1, /obj/item/part/gun/barrel/srifle = 1)
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	init_recoil = CARBINE_RECOIL(1)
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND
		)
	serial_type = "SD GmbH"

/obj/item/gun/projectile/automatic/bulldog/update_icon()
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

/obj/item/gun/projectile/automatic/bulldog/Initialize()
	. = ..()
	update_icon()

/obj/item/part/gun/frame/bulldog
	name = "K9-series frame"
	desc = "A K9-series frame. A predecessor to the Wind-series, it remains largely popular with low budget security firms. Can be assembled into a Bulldog or older Z7 Model."
	icon_state = "frame_bull"
	result = /obj/item/gun/projectile/automatic/bulldog
	resultvars = list(/obj/item/gun/projectile/automatic/bulldog, /obj/item/gun/projectile/automatic/pitbull)
	gripvars = list(/obj/item/part/gun/grip/black, /obj/item/part/gun/grip/serb)
	mechanismvar = /obj/item/part/gun/mechanism/autorifle
	barrelvars = list(/obj/item/part/gun/barrel/srifle)

/obj/item/gun/projectile/automatic/bulldog/rds
	name = "\"Bulldog Red\" carbine"
	desc = "A common carry gun manufactured by Seinemetall Defense GmbH for security and police far and wide. Compact and reliable. Uses .257 Carbine rounds. This one comes with a red dot sight."
	icon = 'icons/obj/guns/projectile/bulldog_rds.dmi'
	icon_state = "bulldog_rds"
	item_state = "bulldog_rds"
	price_tag = 1225
	zoom_factors = list(0.3)
