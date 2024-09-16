/obj/item/gun/energy/peacekeeper
	name = "\"Peacekeeper\" energy shotgun"
	desc = "The \"Peacekeeper\" enegry shotgun is a Marshal made weapon, specializing in blasting high-powered electrodes from its cell's charge.\
	Despite appearing to be made in a hurry the gun is incredibly versitile."
	icon = 'icons/obj/guns/energy/peacekeeper.dmi'
	icon_state = "peacekeeper"
	item_state = "peacekeeper"
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK
	item_charge_meter = TRUE
	can_dual = FALSE
	twohanded = TRUE
	cell_type = /obj/item/cell/medium
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 2)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_STEEL = 8, MATERIAL_WOOD = 10, MATERIAL_SILVER = 4)
	fire_delay = 15
	init_recoil = CARBINE_RECOIL(1)
	damage_multiplier = 1
	penetration_multiplier = 0.7
	price_tag = 900
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		list(mode_name="stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_sound= 'sound/weapons/energy/Taser.ogg', charge_cost = 200, icon="stun"),
		list(mode_name="buckshot", projectile_type=/obj/item/projectile/bullet/pellet/shotgun/energy, fire_sound='sound/weapons/guns/fire/sunrise_fire.ogg', charge_cost = 100, icon="kill"),
	)
	serial_type = "NM"

/obj/item/gun/energy/peacekeeper/update_icon()
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

		if(item_charge_meter)
			itemstring += "-[item_modifystate][ratio]"

	if (!cell)
		iconstring += "-slide"

	if(wielded)
		itemstring += "_doble"

/obj/item/gun/energy/peacekeeper/proc/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stunshot")
		add_overlay("peacekeeper")
	else
		add_overlay("lpeacekeeper")
