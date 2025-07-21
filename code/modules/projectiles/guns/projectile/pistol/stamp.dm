/obj/item/gun/projectile/stamp
	name = "\"Stamp\" caseless pistol"
	desc = "A rolled and pressed together pistol, looks like it takes 10x24 caseless rounds."
	icon = 'icons/obj/guns/projectile/stamp.dmi' //Sprite by Odell
	icon_state = "stamp"
	item_state = "stamp"
	origin_tech = list(TECH_COMBAT = 2)
	matter = list(MATERIAL_STEEL = 0.2, MATERIAL_PLASTIC = 0.1)
	price_tag = 150
	damage_multiplier = 1.2 //Caseless ammo isnt that good
	init_recoil = HANDGUN_RECOIL(0.3)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	serial_type = "Stamp Workshop"

	wield_delay = 0.2 SECOND
	wield_delay_factor = 0.1 // 10 vig
	gun_parts = null

	caliber = "10x24"
	can_dual = TRUE
	silenced = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_STAMP

	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)

/obj/item/gun/projectile/stamp/examine(mob/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.glasses, /obj/item/clothing/glasses/stamped_lens))
			to_chat(user, SPAN_NOTICE("According to [H.glasses]'s info on, this is a STAMP CORP pistol, designed for self-offence. \
			This one is a leaked beta copy by PUNCH Rebles in Sector 8-Production."))
			to_chat(user, SPAN_NOTICE("Legal Code 3659: Illegal production of STAMP CORP IP."))

/obj/item/gun/projectile/stamp/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (ammo_magazine)
		iconstring += "_mag"

	icon_state = iconstring

/obj/item/gun/projectile/stamper
	name = "\"Stamper\" caseless auto-pistol"
	desc = "A boxy smg that was looks to be made by pressing cut metal plates together, takes 10x24 caseless rounds."
	icon = 'icons/obj/guns/projectile/stamper.dmi' //Sprite by Odell
	icon_state = "stamper"
	item_state = "stamper"
	origin_tech = list(TECH_COMBAT = 2)
	matter = list(MATERIAL_STEEL = 0.8, MATERIAL_PLASTIC = 0.2)
	price_tag = 150
	damage_multiplier = 1.2 //Caseless ammo isnt that good
	init_recoil = HANDGUN_RECOIL(0.3)
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	serial_type = "Stamp Workshop"

	wield_delay = 0.2 SECOND
	wield_delay_factor = 0.1 // 10 vig
	gun_parts = null

	caliber = "10x24"
	can_dual = TRUE
	silenced = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_STAMP

	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		FULL_AUTO_600_NOLOSS,
		BURST_8_ROUND_NOLOSS,
		BURST_5_ROUND_NOLOSS,
		BURST_3_ROUND_NOLOSS
		)

/obj/item/gun/projectile/stamper/examine(mob/user)
	..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.glasses, /obj/item/clothing/glasses/stamped_lens))
			to_chat(user, SPAN_NOTICE("According to [H.glasses]'s info on, this is a STAMP CORP pistol, designed for self-offence. \
			This one is a leaked beta copy by PUNCH Rebles in Sector 3-Secure-Production."))
			to_chat(user, SPAN_NOTICE("Legal Code 3660: Illegal production and modification of STAMP CORP IP."))

/obj/item/gun/projectile/stamper/update_icon()
	..()

	var/iconstring = initial(icon_state)

	if (ammo_magazine)
		iconstring += "_mag"

	icon_state = iconstring
