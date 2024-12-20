/obj/item/gun/projectile/automatic/buckler
	name = "\"Buckler\" SMG"
	desc = "A haphazard amalgamation of the practical experience of blackshield and the gunsmithing expertise of the marshals came to create this compact SMG. \
	With the average trooper in mind, the 'Buckler' was designed for flexibility and low maintenance, \
	with an extendable stock it can easily be stored and kept out of the hands of certain prospectors. \
	The focus on ease-of-use and durability resulted in a slightly lackluster performance and muzzle velocity, \
	causing issues in long-range engagements."
	icon = 'icons/obj/guns/projectile/buckler.dmi'
	icon_state = "buckler"
	item_state = "buckler"
	w_class = ITEM_SIZE_NORMAL
	caliber = CAL_PISTOL
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 3)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_SMG|MAG_WELL_PISTOL|MAG_WELL_DRUM
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 12, MATERIAL_GLASS = 5)
	price_tag = 600
	damage_multiplier = 0.9
	penetration_multiplier = 1.1
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SILENCABLE, GUN_SCOPE, GUN_CALIBRE_9MM)
	init_recoil = SMG_RECOIL(1)
	folding_stock = TRUE

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND_NOLOSS,
		FULL_AUTO_600_NOLOSS
		)
	serial_type = "NM"
	gun_parts = null

	wield_delay = 0.5 SECOND
	wield_delay_factor = 0.1 // 10 vig

/obj/item/gun/projectile/automatic/buckler/update_icon()
	..()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(!folded)
		iconstring += "_stock"

	if (ammo_magazine)
		iconstring += "[ammo_magazine? "_mag[ammo_magazine.max_ammo]": ""]"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if(wielded)
		itemstring += "_doble"

	if (silenced)
		iconstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/buckler/Initialize()
	. = ..()
	update_icon()
