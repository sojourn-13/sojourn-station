 //For loadouts so we dont give them a 1.1 damage mod pistol to people
/obj/item/gun/projectile/clarissa
	name = "\"Clarissa\" pistol"
	desc = "A pocket pistol made on demand, it uses older designs of fully plastic pistols used by spies to take down a target while undercover as civilians,\
	but now is commonly for self-defence. Due to its full plastic internals, it has low stopping power and is impossible to maintain. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/clarissa_black.dmi'
	icon_state = "clarissa"
	item_state = "clarissa"
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = TRUE
	silenced = 0
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTIC = 6)
	price_tag = 80
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_DRUM
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_CALIBRE_35, GUN_MAGWELL)
	damage_multiplier = 0.7
	init_recoil = HANDGUN_RECOIL(0.2)
	serial_type = "SA"
	gun_parts = list(/obj/item/stack/material/plastic = 4)

	wield_delay = 0 SECOND
/*	gun_parts = list(/obj/item/part/gun/frame/clarissa = 1, /obj/item/part/gun/grip/black = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/part/gun/frame/clarissa
	name = "Clarissa frame"
	desc = "A Clarissa pistol frame. Concealable yet anemic yet fast."
	icon_state = "frame_clarissa"
	result = /obj/item/gun/projectile/clarissa
	resultvars = list(/obj/item/gun/projectile/clarissa)
	gripvars = list(/obj/item/part/gun/grip/black)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol)
*/
/obj/item/gun/projectile/clarissa/preloaded

/obj/item/gun/projectile/clarissa/preloaded/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)

/obj/item/gun/projectile/clarissa/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/makarov
	name = "\"Makarov\" pistol"
	desc = "Old-designed pistol used by space communists. Small and easily concealable. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/makarov.dmi'
	icon_state = "makarov"
	w_class = ITEM_SIZE_SMALL
	caliber = CAL_PISTOL
	can_dual = TRUE
	silenced = 0
	matter = list(MATERIAL_PLASTEEL = 8, MATERIAL_PLASTIC = 6)
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL | MAG_WELL_H_PISTOL | MAG_WELL_DRUM
	gun_tags = list(GUN_PROJECTILE, GUN_SILENCABLE, GUN_CALIBRE_35, GUN_MAGWELL)
	damage_multiplier = 1.1
	init_recoil = HANDGUN_RECOIL(0.4)
	price_tag = 500
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2, TECH_ILLEGAL = 3)
	init_firemodes = list(
		SEMI_AUTO_NODELAY
		)
	serial_type = "Sol Fed"
	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig
	gun_parts = list(/obj/item/part/gun/frame/makarov = 1, /obj/item/part/gun/grip/serb = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

/obj/item/part/gun/frame/makarov
	name = "Makarov frame"
	desc = "A Makarov pistol frame. Technology may have stagnated, but effectiveness hasn't."
	icon_state = "frame_makarov"
	result = /obj/item/gun/projectile/makarov
	resultvars = list(/obj/item/gun/projectile/makarov)
	gripvars = list(/obj/item/part/gun/grip/serb)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol)

/obj/item/gun/projectile/makarov/preloaded

/obj/item/gun/projectile/makarov/preloaded/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)

/obj/item/gun/projectile/makarov/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/gun/projectile/makarov/moebius
	name = "SI HG .35 \"Malpractice\"" // SI stands for Soteria Institution
	desc = "A small, easily concealable, but somewhat underpowered gun produced by SI as based off the \"Little Comet\" but ended up being a copy of the \"Clarissa\" with white paint. Uses .35 rounds."
	icon = 'icons/obj/guns/projectile/clarissa_white.dmi'
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	price_tag = 200
	serial_type = "SI"
	icon_state = "clarissa"
	item_state = "clarissa"
	gun_parts = list(/obj/item/stack/material/plastic = 4)

/obj/item/gun/projectile/makarov/moebius/auto_eject
	initialized_upgrades = list(/obj/item/gun_upgrade/magwell/auto_eject/no_removal
								)

/obj/item/gun/projectile/makarov/moebius/preloaded_cbo
	initialized_upgrades = list(/obj/item/gun_upgrade/muzzle/silencer
								)

/obj/item/gun/projectile/makarov/moebius/preloaded_cbo/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/drum/soporific_cbo(src)

/obj/item/gun/projectile/makarov/moebius/preloaded

/obj/item/gun/projectile/makarov/moebius/preloaded/New()
	. = ..()
	ammo_magazine = new /obj/item/ammo_magazine/highcap_pistol_35/rubber(src)

/obj/item/gun/projectile/makarov/moebius/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (ammo_magazine)
		iconstring += "_mag"

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_slide"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)
