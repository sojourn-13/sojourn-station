/obj/mecha/working/ripley
	desc = "Autonomous Power Loader Unit. The workhorse of the exosuit world."
	name = "APLU \"Ripley\""
	icon_state = "ripley"
	initial_icon = "ripley"
	step_in = 2
	normal_step_energy_drain = 6
	step_energy_drain = 6
	max_temperature = 20000
	price_tag = 5000
	health = 500
	wreckage = /obj/effect/decal/mecha_wreckage/ripley
	cargo_capacity = 25
	max_equip = 6

/obj/mecha/working/ripley/firefighter
	desc = "Standard APLU chassis that has been refitted with additional thermal protection."
	name = "APLU \"Firefighter\""
	icon_state = "firefighter"
	initial_icon = "firefighter"
	normal_step_energy_drain = 8
	step_energy_drain = 8
	max_temperature = 65000
	price_tag = 6500
	health = 550
	lights_power = 8
	damage_absorption = list("brute"=8,"melee"=8,"fire"=0.5,"bullet"=8,"energy"=8,"bomb"=0.5)
	armor_level = MECHA_ARMOR_SCOUT
	wreckage = /obj/effect/decal/mecha_wreckage/ripley/firefighter

/obj/mecha/working/ripley/deathripley
	desc = "Combat mechs on a budget!"
	name = "Death Ripley"
	icon_state = "deathripley"
	initial_icon = "deathripley"
	step_in = 1
	normal_step_energy_drain = 1
	step_energy_drain = 1
	opacity = 0
	lights_power = 60
	health = 750
	damage_absorption = list("brute"=9,"melee"=9,"fire"=0.5,"bullet"=9,"energy"=9,"bomb"=0.5)
	armor_level = MECHA_ARMOR_SCOUT
	wreckage = /obj/effect/decal/mecha_wreckage/ripley/deathripley
	price_tag = 7000

/obj/mecha/working/ripley/deathripley/New()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp/safety_clamp
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/flak/loaded
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/hmg/loaded
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster
	ME.attach(src)

/obj/mecha/working/ripley/mining
	desc = "An old, dusty mining ripley."
	name = "APLU \"Miner\""

/obj/mecha/working/ripley/mining/New()
	. = ..()
	//Attach drill
	if(prob(25)) //Possible diamond drill... Feeling lucky?
		var/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill/D = new /obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill
		D.attach(src)
	else
		var/obj/item/mecha_parts/mecha_equipment/tool/drill/D = new /obj/item/mecha_parts/mecha_equipment/tool/drill
		D.attach(src)

	//Attach hydrolic clamp
	var/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp/HC = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp
	HC.attach(src)
	for(var/obj/item/mecha_parts/mecha_tracking/B in contents)//Deletes the beacon so it can't be found easily
		qdel(B)


