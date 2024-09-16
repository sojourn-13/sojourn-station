/obj/item/gun/energy/lasersmg
	name = "Disco Vazer \"Lasblender\""
	desc = "This conversion of the \"Texan\" that enables it to shoot lasers. Unlike in other laser weapons, the process of creating a laser is based on a chain reaction of localized micro-explosions. \
	While this method is charge-effective, it worsens accuracy, and the chain-reaction makes the gun always fire in bursts. A viable choice for those who have lots of batteries and few bullets. \
	Sometimes jokingly called the \"Disco Vazer\"."
	icon = 'icons/obj/guns/energy/lasersmg-1.dmi'
	icon_state = "lasersmg"
	item_state = "lasersmg"
	w_class = ITEM_SIZE_NORMAL
	fire_sound = 'sound/weapons/energy/laser_pistol.ogg'
	suitable_cell = /obj/item/cell/medium
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/weak/smg
	charge_meter = FALSE
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 11, MATERIAL_STEEL = 13, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 1, MATERIAL_GLASS = 2)
	price_tag = 400
	damage_multiplier = 0.5 //makeshift laser
	init_recoil = HANDGUN_RECOIL(0.2)
	init_offset = 7 //makeshift laser
	projectile_type = /obj/item/projectile/beam
	suitable_cell = /obj/item/cell/medium
	charge_cost = 25 // 4 bursts with a 800m cell
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		BURST_8_ROUND,
		FULL_AUTO_300
		)
	serial_type = "INDEX"
	serial_shown = FALSE

/*
/obj/item/gun/energy/lasersmg/alt
	name = "Disco Vazer \"Lasblender\""
	desc = "This conversion of the \"MAC\" that enables it to shoot lasers. Unlike in other laser weapons, the process of creating a laser is based on a chain reaction of localized micro-explosions. \
	While this method is charge-effective, it worsens accuracy, and the chain-reaction makes the gun always fire in bursts. A viable choice for those who have lots of batteries and few bullets. \
	Sometimes jokingly called the \"Disco Vazer\"."
*/

/obj/item/gun/energy/lasersmg/process_projectile(var/obj/item/projectile/P, mob/living/user, atom/target, var/target_zone, var/params=null)
	projectile_color = pick(list("#FF0000", "#0000FF", "#00FF00", "#FFFF00", "#FF00FF", "#00FFFF", "#FFFFFF", "#000000"))
	..()
	return ..()

/obj/item/gun/energy/lasersmg/update_icon()
	..()

	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if (cell)
		iconstring += "_mag"
		itemstring += "_mag"


/obj/item/gun/energy/lasersmg/update_icon()
	cut_overlays()
	..()
	if(istype(cell, /obj/item/cell/medium/moebius/nuclear))
		add_overlay(image(icon, "nuke_cell"))

	else if(istype(cell, /obj/item/cell/medium/moebius))
		add_overlay(image(icon, "moeb_cell"))

	else if(istype(cell, /obj/item/cell/medium/excelsior))
		add_overlay(image(icon, "excel_cell"))

	else if(istype(cell, /obj/item/cell/medium))
		add_overlay(image(icon, "guild_cell"))

