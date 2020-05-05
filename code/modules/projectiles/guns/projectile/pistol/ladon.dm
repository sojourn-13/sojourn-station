/obj/item/weapon/gun/projectile/ladon
	name = "\"Ladon\" magnum pistol"
	desc = "A Mk-68 \"Ladon\", the trimmed down decendant of the M6 service pistol family as a second-line pistol for law enforcement, non-combat personnel, and people with reasonably sized hands.  Uses .40 Auto-Mag. This one appears to have been in SolFed service at some point."
	icon = 'icons/obj/guns/projectile/ladon.dmi'
	icon_state = "dark_ladon"
	item_state = "dark_ladon"
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 5)
	price_tag = 1200
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	can_dual = 1
	load_method = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	damage_multiplier = 1.2
	recoil_buildup = 17
	one_hand_penalty = 20
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	auto_eject = 1

/obj/item/weapon/gun/projectile/ladon/update_icon()
	..()

	if(!ammo_magazine)
		icon_state = initial(icon_state)
	else if(!ammo_magazine.stored_ammo.len)
		icon_state = initial(icon_state) + "_empty"
	else
		icon_state = initial(icon_state) + "_full"

/obj/item/weapon/gun/projectile/ladon/hs
	name = "\"ladon\" magnum pistol"
	desc = "A popular commercial variant of Mk-68 \"Ladon\" produced by Holland & Sullivan. Often found in police and private use alike. Uses .40 Auto-Mag rounds."
	icon_state = "ladon"
	item_state = "ladon"
	damage_multiplier = 0.9
	recoil_buildup = 14
	one_hand_penalty = 15

/obj/item/weapon/gun/projectile/ladon/sa
	name = "\"ladon\" magnum pistol"
	desc = "A cheap copy of Mk-68 \"Ladon\". Uses .40 Auto-Mag rounds. This one has a Scarborough Arms rollmark on the frame and no other markings."
	icon_state = "ladon_alt"
	item_state = "ladon_alt"
	damage_multiplier = 1.1
	recoil_buildup = 14
	one_hand_penalty = 15