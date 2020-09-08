/obj/item/weapon/gun/projectile/basilisk
	name = "\"Basilisk\" heavy pistol"
	desc = "A distant relative of the Lamia produced by Holland & Sullivan. Robust and straight, this is a gun for a leader, not just an officer. Uses .50 kurtz."
	icon = 'icons/obj/guns/projectile/basilisk.dmi'
	icon_state = "basilisk"
	item_state = "basilisk"
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_50
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 8)
	price_tag = 800
	can_dual = 1
	damage_multiplier = 1.1
	penetration_multiplier = 1.2
	recoil_buildup = 33
	one_hand_penalty = 30
	fire_sound = 'sound/weapons/guns/fire/deckard_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/hpistol_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/hpistol_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/hpistol_cock.ogg'
	auto_eject = 1


/obj/item/weapon/gun/projectile/basilisk/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/basilisk/Initialize()
	. = ..()
	update_icon()