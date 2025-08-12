/obj/mecha/combat/greyson
	desc = "One of Greyson's deadliest machines, converted into an exosuit by Soteria."
	name = "Type"
	icon = 'icons/mob/64x64.dmi'
	icon_state = "greyson_mech"
	initial_icon = "greyson_mech"
	step_in = 3
	normal_step_energy_drain = 3
	step_energy_drain = 3
	dir_in = 1 //Facing North.
	health = 1500
	deflect_chance = 25
	damage_absorption = list("brute"=50,"melee"=50,"fire"=0.7,"bullet"=50,"energy"=50,"bomb"=0.7)
	max_temperature = 60000
	infra_luminosity = 3
	armor_level = MECHA_ARMOR_SUPERHEAVY
	price_tag = 60000
	force = 40
	wreckage = null
	max_equip = 5
	internal_damage_threshold = 30
	pixel_x = -16 // Make the mech centered
	pixel_y = -16

/obj/mecha/combat/greyson/Initialize()
	. = ..()
	name += " [rand(0, 9)][rand(0, 9)][rand(0, 9)][rand(0, 9)]" // Random numbers for the name
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon/loaded(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/pulse(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive(src)
	ME.attach(src)

/obj/mecha/combat/dreadnought/hephaestus_do_not_use_only_for_events/add_cell()
	cell = new /obj/item/cell/large/moebius/omega(src)
