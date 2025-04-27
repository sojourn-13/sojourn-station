/obj/item/gun/projectile/olivaw
	name = "\"Olivaw\" burst pistol"
	desc = "The second most popular model of civilian pistols produced by H&S. This one seems to have a two-round burst-fire mode. Uses .35."
	icon = 'icons/obj/guns/projectile/olivawcivil.dmi'
	icon_state = "olivawcivil"
	item_state = "pistol"
	fire_sound = 'sound/weapons/guns/fire/9mm_pistol.ogg'
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3)
	can_dual = TRUE
	load_method = SINGLE_CASING|MAGAZINE
	mag_well = MAG_WELL_PISTOL|MAG_WELL_H_PISTOL
	matter = list(MATERIAL_PLASTEEL = 8, MATERIAL_WOOD = 6)
	price_tag = 450
	damage_multiplier = 1.1
	penetration_multiplier = 1.1
	init_recoil = HANDGUN_RECOIL(1)
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_MAGWELL, GUN_SILENCABLE)
	gun_parts = list(/obj/item/part/gun/frame/olivaw = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/pistol = 1, /obj/item/part/gun/barrel/pistol = 1)

	init_firemodes = list(
		list(mode_name="semiauto", mode_desc="Shoot as fast as you can pull the trigger",       burst=1, fire_delay=1.2, move_delay=null, 				icon="semi"),
		list(mode_name="2-round bursts", mode_desc="Shoots two rounds back to back", burst=2, fire_delay=0.2, move_delay=4,    	icon="burst"),
		)
	serial_type = "H&S"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.3 // 30 vig

/obj/item/gun/projectile/olivaw/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (!ammo_magazine || !length(ammo_magazine.stored_ammo))
		iconstring += "_empty"

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)

/obj/item/part/gun/frame/olivaw
	name = "Olivaw frame"
	desc = "An Olivaw pistol frame. Why shoot one bullet when you can shoot two?"
	icon_state = "frame_olivaw"
	result = /obj/item/gun/projectile/olivaw
	resultvars = list(/obj/item/gun/projectile/olivaw)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/pistol
	barrelvars = list(/obj/item/part/gun/barrel/pistol)
