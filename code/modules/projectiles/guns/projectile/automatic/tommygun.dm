/obj/item/gun/projectile/automatic/thompson
	name = "\"Chicago Typewriter\" SMG"
	desc = "The \"Chicago Typewriter\", better known as the Thompson SMG, was a workhorse back in the olden-days on Sol. Used by mobsters and law enforcement alike.\
		 While the gun was once religated to only stage work past the 20th century this relic has somehow made the rounds again through cheap, various licensed disks."
	icon = 'icons/obj/guns/projectile/thompson.dmi'
	icon_state = "thompson"
	item_state = "thompson"
	w_class = ITEM_SIZE_BULKY
	extra_bulk = -2
	twohanded = TRUE
	force = WEAPON_FORCE_NORMAL
	caliber = CAL_MAGNUM
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_PISTOL
	matter = list(MATERIAL_PLASTEEL = 20, MATERIAL_STEEL = 14, MATERIAL_WOOD = 12)
	price_tag = 1500
	penetration_multiplier = 0.8
	recoil_buildup = 2
	fire_sound = 'sound/weapons/guns/fire/grease_fire.ogg'
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SILENCABLE, GUN_SCOPE)
	init_firemodes = list(
		FULL_AUTO_400_NOLOSS,
		BURST_3_ROUND_NOLOSS,
		BURST_5_ROUND_NOLOSS
		)
	serial_type = "Sol Fed"

/obj/item/gun/projectile/automatic/thompson/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		if(ammo_magazine.max_ammo==30)
			iconstring += "_longmag"
		else
			iconstring += "_mag"

	if(wielded)
		itemstring += "_doble"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/thompson/Initialize()
	. = ..()
	update_icon()