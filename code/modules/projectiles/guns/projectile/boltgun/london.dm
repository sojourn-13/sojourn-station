/obj/item/gun/projectile/boltgun/london
	name = "\"London"\" Survival Rifle"
	desc = "A single-shot combination rifle, initially based off shipside varmit guns. While almost certainly underpowowered for the local fauna,  it's decent with the scope, and  one of the cheapest longarms around. Chambered in .40 Magnum, with an underslung shotgun barrel.
	icon = 'icons/obj/guns/projectile/london.dmi'
	icon_state = "london"
	item_state = "london"
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_MAGNUM
	max_shells = 1
zoom_factor= 1.3
	price_tag = 300
	recoil_buildup = 10
	damage_multiplier = 0.9 // The Clarissa of boltguns
	penetration_multiplier  = 1.5
	extra_damage_mult_scoped = 0.8 // better if scoped.

	matter = list(MATERIAL_STEEL = 15, MATERIAL_WOOD = 20)

	saw_off = FALSE
       init_firemodes = list(

		SEMI_AUTO_NODELAY,
		list(mode_name="fire 20mm shell", mode_desc="Shoot the underbarrel shotgun shell",  burst=null, fire_delay=null, move_delay=null,  icon="grenade", use_launcher=1)
		)
	var/obj/item/gun/projectile/underslung_shotgun/shotgun