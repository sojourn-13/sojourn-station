/obj/item/gun/projectile/automatic/shepherd
	name = "\"Shepherd\" machine rifle"
	desc = "This ancient firearm was a specialized automatic rifle developed for use by sol in the older days, primarily marketed for law enforcement sales. \
		This rifle seems to have been converted by the church to suit their purposes, with improvements making the rifle more durable, controllable, and rechambering the rifle into the eight point six round, the standard cartridge of the solarian armed forces, very effective against heavily armored soldiers."
	icon = 'icons/obj/guns/projectile/shepherd.dmi'
	icon_state = "shepherd"
	item_state = "shepherd"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_HRIFLE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well =  MAG_WELL_HRIFLE
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_WOOD = 10, MATERIAL_SILVER = 10, MATERIAL_GOLD = 5)
	price_tag = 1000
	fire_sound = 'sound/weapons/guns/fire/Shepherd.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/shep_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/shep_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/shep_cock.ogg'
	penetration_multiplier = 1.4
	damage_multiplier = 1.4
	init_recoil = RIFLE_RECOIL(0.8)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)

	gun_parts = null

	init_firemodes = list(
		FULL_AUTO_200,
		)
	serial_type = "Absolute"
	wield_delay = 1.6 SECOND
	wield_delay_factor = 0.5 // 50 vig to insta wield , heavy class battle rifle

/obj/item/gun/projectile/automatic/shepherd/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""
	var/magstring = ""

	if(ammo_magazine)
		add_overlay("_mag[ammo_magazine.max_ammo]")
	else
		cut_overlays()
		return

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"
	if(ammo_magazine)
		itemstring += "_mag"
		magstring = "_mag"

	icon_state = iconstring
	set_item_state(itemstring, mag_sprite = magstring )

/obj/item/gun/projectile/automatic/shepherd/Initialize()
	. = ..()
	update_icon()
