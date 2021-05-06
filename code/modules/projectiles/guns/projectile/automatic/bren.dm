/obj/item/weapon/gun/projectile/automatic/bren
	name = "\"Kalashnabren\" light machinegun"
	desc = "A mutilated Kalash model that has been jury rigged to load its magazines from the top. Why, you may ask? Only god knows. No serial numbers nor publishing logos can even be found on the rifle.\
		The trigger mechanism is attached by a cord externally to create large bursts of fire. Despite this thing looking like it might explode at any second, it can really shoot fast!"
	icon = 'icons/obj/guns/projectile/bren.dmi'
	icon_state = "bren"
	item_state = "bren"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_LRIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1, TECH_ILLEGAL = 4)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_STANMAG
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 3, MATERIAL_WOOD = 12)
	price_tag = 1100
	damage_multiplier = 0.9
	fire_sound = 'sound/weapons/guns/fire/ltrifle_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	recoil_buildup = 8
	one_hand_penalty = 10 //automatic rifle level
	twohanded = TRUE
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_600,
		list(mode_name="short bursts", burst=5,    burst_delay=1.2, move_delay=6,  icon="burst"),
		list(mode_name="long bursts",  burst=8, burst_delay=1.2, move_delay=8,  icon="burst"),
		list(mode_name="suppressing fire",  burst=16, burst_delay=1.2, move_delay=11,  icon="burst")
		)

/obj/item/weapon/gun/projectile/automatic/bren/update_icon()
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

/obj/item/weapon/gun/projectile/automatic/bren/Initialize()
	. = ..()
	update_icon()