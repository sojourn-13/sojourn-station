/obj/item/weapon/gun/projectile/automatic/blackguard
	name = "\"Blackguard\" heavy marksman rifle"
	desc = "A heavily modded and  \"improved\" omnirifle plateform design by Blackshield and Marshals, chambered in chambered in .408,  \
	With a knife attached to its exstended barrel that leads no room for added moddification, and a small lens on the top leads the gun to be an all around rifle\
	rather then for a specific task. The mag well has the capability unlike other omni or marksman rifles to take drums as well as magazines."
	icon = 'icons/obj/guns/projectile/blackguard.dmi'
	icon_state = "sts_blackguard"
	item_state = "sts_blackguard"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_HRIFLE
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE | MAG_WELL_DRUM
	mag_well = MAG_WELL_HRIFLE
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5, MATERIAL_STEEL = 25, MATERIAL_GLASS = 5)
	zoom_factor = 0.5 //5 more tiles
	price_tag = 2500
	penetration_multiplier = 1.2
	damage_multiplier = 1.35 //Really hard to upgrade
	recoil_buildup = 15
	one_hand_penalty = 20

	max_upgrades = 3 // Trigger, and guards or a laser sight

	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rifle_boltforward.ogg'
	gun_tags = list(GUN_MAGWELL, GUN_BAYONET)

	init_firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=8, move_delay=null, icon="semi")
		)

/obj/item/weapon/gun/projectile/automatic/blackguard/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(ammo_magazine)
		add_overlay("_mag[ammo_magazine.max_ammo]")
	else
		cut_overlays()
		return

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/weapon/gun/projectile/automatic/blackguard/Initialize()
	. = ..()
	update_icon()
