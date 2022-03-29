/obj/item/gun/projectile/automatic/blackguard
	name = "\"Blackguard\" heavy marksman rifle"
	desc = "A heavily modded and  \"improved\" omnirifle platform design made by the Marshals but used by Blackshield, chambered in .408, \
	With an extended barrel, standard bayonet, and a reflex scope this rifle has less customization than other weapons, but lends itself to a good all \
	round design and function. Unlike other omni rifles, this one can take standard mags or drum mags of .408 ammo."
	icon = 'icons/obj/guns/projectile/blackguard.dmi'
	icon_state = "sts_blackguard"
	item_state = "sts_blackguard"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_HRIFLE
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	mag_well = MAG_WELL_HRIFLE|MAG_WELL_DRUM
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_PLASTIC = 5, MATERIAL_STEEL = 25, MATERIAL_GLASS = 5)
	zoom_factor = 0.5 //5 more tiles
	price_tag = 2500
	penetration_multiplier = 1.2
	damage_multiplier = 1.35 //Really hard to upgrade
	recoil_buildup = 10
	one_hand_penalty = 15

	max_upgrades = 4 // Trigger, and guards or a laser sight, one less upgrade slot

	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/rifle_boltforward.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_BAYONET)

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND
		)

/obj/item/gun/projectile/automatic/blackguard/update_icon()
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

/obj/item/gun/projectile/automatic/blackguard/Initialize()
	. = ..()
	update_icon()
