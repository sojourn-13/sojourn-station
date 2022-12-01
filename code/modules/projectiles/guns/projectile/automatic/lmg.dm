/obj/item/gun/projectile/automatic/lmg
	name = "SA \"SAW\""
	desc = "A exstreamly rare HMG produced on a commision. Uses 7.62mm Rifle rounds."
	icon = 'icons/obj/guns/projectile/l6.dmi'
	var/icon_base
	icon_base = "l6"
	icon_state = "l6_closed"
	item_state = "l6_closed"
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_PAINFUL
	slot_flags = 0
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 1)
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_LINKED_BOX
	caliber = CAL_RIFLE
	tac_reloads = FALSE
	matter = list(MATERIAL_PLASTEEL = 40, MATERIAL_PLASTIC = 15, MATERIAL_WOOD = 5)
	price_tag = 2000
	unload_sound 	= 'sound/weapons/guns/interact/lmg_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/lmg_magin.ogg'
	cocked_sound 	= 'sound/weapons/guns/interact/lmg_cock.ogg'
	fire_sound = 'sound/weapons/guns/fire/lmg_fire.ogg'
	init_recoil = HMG_RECOIL(1)
	slowdown_hold = 1
	init_firemodes = list(
		FULL_AUTO_300,
		BURST_5_ROUND,
		BURST_8_ROUND
		)
	serial_type = "SA"

	var/cover_open = 0

	wield_delay = 2 SECOND
	wield_delay_factor = 0.6 // 60 vig for instant wield

/obj/item/gun/projectile/automatic/lmg/special_check(mob/user)
	if(cover_open)
		to_chat(user, SPAN_WARNING("[src]'s cover is open! Close it before firing!"))
		return 0
	return ..()

/obj/item/gun/projectile/automatic/lmg/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	to_chat(user, SPAN_NOTICE("You [cover_open ? "open" : "close"] [src]'s cover."))
	update_icon()

/obj/item/gun/projectile/automatic/lmg/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
		playsound(src.loc, 'sound/weapons/guns/interact/lmg_close.ogg', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/gun/projectile/automatic/lmg/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(src.loc, 'sound/weapons/guns/interact/lmg_open.ogg', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/gun/projectile/automatic/lmg/equipped(var/mob/user, var/slot)
	.=..()
	update_icon()

/obj/item/gun/projectile/automatic/lmg/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		to_chat(user, SPAN_WARNING("You need to open the cover to load [src]."))
		return
	..()

/obj/item/gun/projectile/automatic/lmg/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		to_chat(user, SPAN_WARNING("You need to open the cover to unload [src]."))
		return
	..()

/obj/item/gun/projectile/automatic/lmg/update_icon()
	icon_state = "[icon_base][cover_open ? "_open" : "_closed"]"
	if(ammo_magazine)
		add_overlay("_mag[ammo_magazine.max_ammo]")
	else
		cut_overlays()
		return
	..()

//**** Saved in case we want the code in the future****//
//obj/item/gun/projectile/automatic/lmg/equipped(var/mob/user, var/slot)
//	.=..()
//	update_icon()

//obj/item/gun/projectile/automatic/lmg/update_icon()
//	icon_state = "[icon_base][cover_open ? "open" : "closed"][ammo_magazine ? round(ammo_magazine.stored_ammo.len, 25) : "-empty"]"
//	set_item_state("-[cover_open ? "open" : null][ammo_magazine ?"mag":"nomag"]", hands = TRUE)
//	set_item_state("-[ammo_magazine ?"mag":"nomag"]", back = TRUE)
//	update_wear_icon()



/obj/item/gun/projectile/automatic/lmg/pk
	name = "Pulemyot Kalashnikova"
	desc = "\"Kalashnikov's Machinegun\", a well-made copy of what many consider to be the best traditional machinegun ever designed."
	icon = 'icons/obj/guns/projectile/pk.dmi'
	icon_base = "pk"
	icon_state = "pk_closed"
	item_state = "pk_closed"
	damage_multiplier = 0.9
	init_firemodes = list(
		FULL_AUTO_300,
		BURST_5_ROUND,
		BURST_8_ROUND
		)

//Typical LMG/SAW, use this for the high end of "normal."
/obj/item/gun/projectile/automatic/lmg/saw
	name = "\"Pegasus\" light machinegun"
	desc = "A common LMG chambered in 6.5mm Carbine, accepting either boxes or standard magazines, though this calls into question some reliability issues. \
	This particular example bears a winged horse in laurels and a \"Pegasus\" nameplate, all other markings have been filed off."
	icon = 'icons/obj/guns/projectile/lmg.dmi'
	icon_base = "saw"
	icon_state = "saw_closed"
	item_state = "saw_closed"
	mag_well = MAG_WELL_LINKED_BOX|MAG_WELL_STANMAG
	caliber = CAL_LRIFLE
	penetration_multiplier = 0.85
	damage_multiplier = 1.0
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_PLASTIC = 10)
	price_tag = 1500
	fire_sound = 'sound/weapons/guns/fire/sfrifle_fire.ogg'
	init_recoil = LMG_RECOIL(0.7)

	init_firemodes = list(
		FULL_AUTO_600,
		BURST_5_ROUND,
		)

//This should be in its own file...
/obj/item/gun/projectile/automatic/lmg/tk
	name = "\"Takeshi\" suppression machinegun"
	desc = "The \"Takeshi LMG\" is Seinemetall Defense GmbH's answer to any scenario that requires suppression or meat grinding, a fine oiled machine of war and death."
	icon = 'icons/obj/guns/projectile/tk.dmi'
	icon_base = "tk"
	icon_state = "tk"
	item_state = "tk"
	mag_well = MAG_WELL_LINKED_BOX|MAG_WELL_STANMAG
	caliber = CAL_LRIFLE
	damage_multiplier = 1.2
	penetration_multiplier = 1.2
	init_recoil = LMG_RECOIL(0.8)
	serial_type = "SD GmbH"

/obj/item/gun/projectile/automatic/lmg/tk/update_icon()
//	..() We are rather different then other guns and lmgs.
//	icon_state = "[icon_base][cover_open ? "_open" : "_closed"]" - this is for ref of what it did before.
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (cover_open)
		iconstring += "open"
		itemstring += "-open"
	else
		iconstring += "closed"
		itemstring += "-closed"

	if (ammo_magazine)
		var/percent = (ammo_magazine.stored_ammo.len / ammo_magazine.max_ammo) * 100
		var/number = round(percent, 25)
		iconstring += "[number]"
		itemstring += "-mag"
	else
		iconstring += "-empty"
		itemstring += "-nomag"

	icon_state = iconstring
	set_item_state(itemstring)


/obj/item/gun/projectile/automatic/lmg/tk/Initialize()
	. = ..()
	update_icon()

// I AM HEAVY WEAPONS GUY, AND THIS...IS MY WEAPON. - Seb
/obj/item/gun/projectile/automatic/lmg/heroic
	name = " \"Heroic\" General Purpose Machinegun"
	desc = "The \"Heroic\" General Purpose Machinegun was created by Nadezhda Marshals in response to Blackshield's lack of suppressing fire armaments. \
			Inspired by Seinemetall's Takeshi LMG, this GPMG features decent recoil control for its bore, and the bizarre capability of being silenced. \
			Chambered in 7.62x39mm and meant for emplaced defense, its high rate of fire can mow down wave after wave of armored hostiles with sheer brutality."
	icon = 'icons/obj/guns/projectile/heroic.dmi'
	icon_base = "heroic" // Sprites by Albert7076
	icon_state = "heroic"
	item_state = "heroic"
	fire_sound = 'sound/weapons/guns/fire/heroic_fire.ogg'
	fire_sound_silenced = 'sound/weapons/guns/fire/silenced_mg.ogg' // Yay snowflake silenced sound!
	caliber = CAL_RIFLE
	damage_multiplier = 1.2 // With full auto penalties in mind (20%) this becomes a normal x1 damage modifier.
	penetration_multiplier = 1.0
	init_recoil = HMG_RECOIL(0.6) // Better slap a bipod on this one! Impossible to fire steady if not braced.
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE) // Believe it or not, an LMG that CAN be silenced.
	serial_type = "NM"

	init_firemodes = list(
		FULL_AUTO_300, // Meant to be a supressive fire GPMG
		BURST_5_ROUND,
		BURST_8_ROUND
		)

// Even more special than the Takeshi so we have to do this all over again instead of being a Takeshi child
/obj/item/gun/projectile/automatic/lmg/heroic/update_icon()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (cover_open)
		iconstring += "open"
		itemstring += "-open"
	else
		iconstring += "closed"
		itemstring += "-closed"

	if (ammo_magazine)
		var/percent = (ammo_magazine.stored_ammo.len / ammo_magazine.max_ammo) * 100
		var/number = round(percent, 25)
		iconstring += "[number]"
		itemstring += "-mag"
	else
		iconstring += "-empty"
		itemstring += "-nomag"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)


/obj/item/gun/projectile/automatic/lmg/heroic/Initialize()
	. = ..()
	update_icon()

