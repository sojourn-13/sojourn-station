/obj/item/gun/energy/peacekeeper
	name = "\"Peacekeeper\" energy shotgun"
	desc = "The \"Peacekeeper\" enegry shotgun is a Marshal made weapon, specializing in blasting high-powered electrodes from its cell's charge.\
	Despite appearing to be made in a hurry the gun is incredibly versatile."
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
	init_recoil = CARBINE_RECOIL(1.2)	//More recoil than abdicator, but it fires faster so..
	damage_multiplier = 1
	penetration_multiplier = 1

	proj_step_multiplier = 0.7	//Akin to abdicator, bit slower, but only because I fear if higher taser will be STRONG. Should be 30%.

	price_tag = 900
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		list(mode_name="heavy stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_sound= 'sound/weapons/energy/Taser.ogg', charge_cost = 100, icon="stun"),
		list(mode_name="heavy lethal", projectile_type=/obj/item/projectile/beam/heavylaser, fire_sound='sound/weapons/guns/fire/sunrise_fire.ogg', charge_cost = 100, icon="kill"),
	)
	serial_type = "NM"

/obj/item/gun/energy/peacekeeper/update_icon()
	// Determine base icon state based on firemode
	var/base_state = "peacekeeper"  // default
	if(firemodes && firemodes.len && sel_mode <= firemodes.len)
		var/datum/firemode/current_mode = firemodes[sel_mode]
		if(current_mode && current_mode.name == "heavy stunshot")
			base_state = "peacekeeper"
		else if(current_mode && current_mode.name == "heavy lethal")
			base_state = "lpeacekeeper"

	// Set the modifystate so parent update_icon uses our base state
	modifystate = base_state

	// Call parent to handle battery charge levels
	..()

	// If charge_meter is disabled, just use the base state
	if(!charge_meter)
		icon_state = base_state

	// Handle no cell case
	if(!cell)
		icon_state += "_slide"
