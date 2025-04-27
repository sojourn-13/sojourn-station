/obj/item/gun/projectile/revolver/detective
	name = "\"Havelock\" revolver"
	desc = "A cheap H&S J-frame revolver, simple, reliable, uses .35."
	icon = 'icons/obj/guns/projectile/detective.dmi'
	fire_sound = 'sound/weapons/guns/fire/9mm_revolver.ogg'
	icon_state = "detective"
	drawChargeMeter = FALSE
	w_class = ITEM_SIZE_SMALL
	max_shells = 6
	caliber = CAL_PISTOL
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	fire_sound = 'sound/weapons/Gunshot_light.ogg'
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_STEEL = 8, MATERIAL_WOOD = 6)
	price_tag = 250 //cheap civ peashooter revolver, something similar to olivav
	damage_multiplier = 1.15 //because pistol round
	penetration_multiplier = 1.2
	init_recoil = HANDGUN_RECOIL(0.5) //Rule of Cool
	gun_tags = list(GUN_PROJECTILE, GUN_CALIBRE_35, GUN_INTERNAL_MAG, GUN_REVOLVER, GUN_SILENCABLE)
	serial_type = "H&S"

	wield_delay = 0 SECOND //god it's bad
	gun_parts = list(/obj/item/part/gun/frame/havelock = 1, /obj/item/part/gun/grip/wood = 1, /obj/item/part/gun/mechanism/revolver = 1, /obj/item/part/gun/barrel/pistol/steel = 1)

/obj/item/part/gun/frame/havelock
	name = "Havelock frame"
	desc = "A Havelock revolver frame. Personal defense in a small package."
	icon_state = "frame_havelock"
	result = /obj/item/gun/projectile/revolver/detective
	resultvars = list(/obj/item/gun/projectile/revolver/detective)
	gripvars = list(/obj/item/part/gun/grip/wood)
	mechanismvar = /obj/item/part/gun/mechanism/revolver
	barrelvars = list(/obj/item/part/gun/barrel/pistol/steel, /obj/item/part/gun/barrel/pistol)
	nra = FALSE //Hacklack is a cheap revolver thus can take both steel barrels and normal pistol ones, but *not* higher calibers

/obj/item/gun/projectile/revolver/detective/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (silenced)
		iconstring += "_s"
		itemstring += "_s"

	icon_state = iconstring
	set_item_state(itemstring)
