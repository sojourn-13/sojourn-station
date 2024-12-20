/obj/item/gun/projectile/automatic/slaught_o_matic
	name = "\"Slaught-o-Matic\""
	desc = "This disposable, mostly plastic handgun is mass-produced by H&S for civilian use. It often is used by street urchins, thugs or terrorists on a budget. \
	For what it's worth, it's not a totally awful handgun - but you only get one magazine's worth before the gun locks up and becomes useless."
	icon = 'icons/obj/guns/projectile/slaught_o_matic.dmi'
	icon_state = "slaught"
	item_state = "slaught"
	w_class = ITEM_SIZE_SMALL
	can_dual = TRUE
	caliber = CAL_PISTOL
	max_shells = 1
	origin_tech = list(TECH_COMBAT = 1, TECH_MATERIAL = 1)
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	ammo_type = "/obj/item/ammo_casing/pistol"
	load_method = MAGAZINE
	mag_well = MAG_WELL_SMG
	auto_eject = FALSE
	magazine_type = /obj/item/ammo_magazine/smg_35
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 9)
	price_tag = 10
	serial_type = "H&S"

	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_9MM)

	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	var/list/possible_colors = list("purple", "magenta", "blue", "cyan", "aqua", "green", "yellow", "orange", "red" )
	var/choosen_color = ""

	damage_multiplier = 0.8
	penetration_multiplier = 0.8
	init_recoil = HANDGUN_RECOIL(1.6)
	gun_parts = list(/obj/item/stack/material/plastic = 4)

	init_firemodes = list(
		FULL_AUTO_600
		)

	wield_delay = 0

/obj/item/gun/projectile/automatic/slaught_o_matic/Initialize()
	. = ..()
	ammo_magazine = new magazine_type(src)

	choosen_color = pick(possible_colors)
	update_icon()

/obj/item/gun/projectile/automatic/slaught_o_matic/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = "_" + choosen_color

	icon_state = iconstring + itemstring
	set_item_state(itemstring)

/obj/item/gun/projectile/automatic/slaught_o_matic/load_ammo(obj/item/A, mob/user)
	to_chat(user, SPAN_WARNING("You try to reload the handgun, but the magazine that's already loaded won't come out!"))

/obj/item/gun/projectile/automatic/slaught_o_matic/unload_ammo(mob/user, var/allow_dump=1)
	to_chat(user, SPAN_WARNING("You try to take out the handgun's magazine, but it won't budge!"))
