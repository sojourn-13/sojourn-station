/obj/item/gun/energy/sunrise
	name = "\"Sunrise\" laser SMG"
	desc = "The \"Sunrise\" laser SMG is a Nadezhda Marshal's special in terms of its creation.\
	This once dated SMG design has been completely stripped down and shoved full of hardware from a Firestorm and Discolaser.\
	However parts themselves appear to have been modified to allow for the beams to keep much of their power through high-focused lenses!\
	Etched into the guns receiver on the left side is a script \"M\" letter."
	icon = 'icons/obj/guns/energy/sunrise.dmi'
	icon_state = "sunrise"
	item_state = "sunrise"
	fire_sound = 'sound/weapons/guns/fire/sunrise_fire.ogg'
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK
	item_charge_meter = TRUE
	can_dual = FALSE
	twohanded = TRUE
	projectile_type = /obj/item/projectile/beam/midlaser
	projectile_color = "#C48A18"
	cell_type = /obj/item/cell/medium
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 10, MATERIAL_SILVER = 4, MATERIAL_GLASS = 10, MATERIAL_URANIUM = 2)
	init_recoil = CARBINE_RECOIL(0.1)
	damage_multiplier = 0.75
	penetration_multiplier = 1
	max_upgrades = 0 //we're good enough as is.
	price_tag = 1500
	charge_cost = 20
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		BURST_8_ROUND,
		FULL_AUTO_600
		)
	serial_type = "NM"

/obj/item/gun/energy/sunrise/update_icon()
	..()
	cut_overlays()
	var/iconstring = initial(icon_state)
	var/itemstring = ""

	if(charge_meter)
		var/ratio = 0

		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(cell && cell.charge >= charge_cost)
			ratio = cell.charge / cell.maxcharge
			ratio = min(max(round(ratio, 0.25) * 100, 25), 100)

		if(modifystate)
			iconstring = "[modifystate][ratio]"
		else
			iconstring = "[initial(icon_state)][ratio]"

	if (cell)
		iconstring += "_mag"
		itemstring += "_mag"

	if(istype(cell, /obj/item/cell/medium/moebius/nuclear))
		add_overlay(image(icon, "nuke_cell"))

	else if(istype(cell, /obj/item/cell/medium/moebius))
		add_overlay(image(icon, "moeb_cell"))

	else if(istype(cell, /obj/item/cell/medium/excelsior))
		add_overlay(image(icon, "excel_cell"))

	else if(istype(cell, /obj/item/cell/medium))
		add_overlay(image(icon, "guild_cell"))
