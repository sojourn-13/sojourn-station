obj/item/gun/projectile/shotgun/Kodiak
	name = "\"Kodiak\"Slugthrower"
	desc = "An over-under shotgun, based on the venerable Grizzly.  Reclaimed metals keeps costs affordable, and Church gunsmiths have been able to smooth out a bit of the recoil. Shame about the capacity, though."
	icon = 'icons/obj/guns/projectile/kodiak.dmi'
	icon_state = "kodiak"
	item_state = "kodiak"
	max_shells = 2
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	flags = CONDUCT
	slot_flags = SLOT_BACK
	caliber = CAL_SHOTGUN
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	load_method = SINGLE_CASING
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	handle_casings = HOLD_CASINGS
	fire_sound = 'sound/weapons/guns/fire/shotgunp_fire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_BIOMATTER=10, MATERIAL_WOOD = 10)
	price_tag = 400
	damage_multiplier = 1.1
	recoil_buildup = 7
	one_hand_penalty = 20 //One-handed only
	saw_off = false
