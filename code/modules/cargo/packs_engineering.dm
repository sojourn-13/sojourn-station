//----------------------------------------------
//-----------------ENGINEERING------------------
//----------------------------------------------

/datum/supply_pack/internals
	name = "Internals Crate"
	contains = list(/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/tank/air,
					/obj/item/tank/air,
					/obj/item/tank/air)
	cost = 180
	containertype = /obj/structure/closet/crate/internals
	crate_name = "internals crate"
	group = "Engineering"

/datum/supply_pack/geiger_counter
	name = "Geiger Counter Crate"
	contains = list(/obj/item/device/geiger,
					/obj/item/device/geiger,
					/obj/item/device/geiger)
	cost = 350
	containertype = /obj/structure/closet/crate/internals
	crate_name = "geiger counter crate"
	group = "Engineering"

/datum/supply_pack/sleeping_agent
	name = "Canister: \[N2O\]"
	contains = list(/obj/machinery/portable_atmospherics/canister/sleeping_agent)
	cost = 180
	containertype = /obj/structure/largecrate
	crate_name = "N2O crate"
	group = "Engineering"

/datum/supply_pack/oxygen
	name = "Canister: \[O2\]"
	contains = list(/obj/machinery/portable_atmospherics/canister/oxygen)
	cost = 120
	containertype = /obj/structure/largecrate
	crate_name = "O2 crate"
	group = "Engineering"

/datum/supply_pack/nitrogen
	name = "Canister: \[N2\]"
	contains = list(/obj/machinery/portable_atmospherics/canister/nitrogen)
	cost = 120
	containertype = /obj/structure/largecrate
	crate_name = "N2 crate"
	group = "Engineering"

/datum/supply_pack/air
	name = "Canister \[Air\]"
	contains = list(/obj/machinery/portable_atmospherics/canister/air)
	cost = 120
	containertype = /obj/structure/largecrate
	crate_name = "air crate"
	group = "Engineering"

/datum/supply_pack/evacuation
	name = "Emergency Equipment Crate"
	contains = list(/obj/item/storage/toolbox/emergency,
					/obj/item/storage/toolbox/emergency,
					/obj/item/clothing/suit/storage/hazardvest,
					/obj/item/clothing/suit/storage/hazardvest,
					/obj/item/tank/emergency_oxygen,
					/obj/item/tank/emergency_oxygen,
					/obj/item/tank/emergency_oxygen,
					/obj/item/tank/emergency_oxygen,
					/obj/item/tank/emergency_oxygen,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas,
					/obj/item/clothing/mask/gas)
	cost = 80
	containertype = /obj/structure/closet/crate/internals
	crate_name = "emergency equipment crate"
	group = "Engineering"

/datum/supply_pack/inflatable
	name = "Inflatable Barriers Crate"
	contains = list(/obj/item/storage/briefcase/inflatable,
					/obj/item/storage/briefcase/inflatable,
					/obj/item/storage/briefcase/inflatable,
					/obj/item/storage/briefcase/inflatable,
					/obj/item/storage/briefcase/inflatable)
	cost = 120
	containertype = /obj/structure/closet/crate/secure
	crate_name = "inflatable barriers crate"
	group = "Engineering"

/datum/supply_pack/lightbulbs
	name = "Replacement Lights Crate"
	contains = list(/obj/item/storage/box/lights/mixed,
					/obj/item/storage/box/lights/mixed,
					/obj/item/storage/box/lights/mixed,
					/obj/item/storage/box/lights/mixed)
	cost = 120
	containertype = /obj/structure/closet/crate
	crate_name = "replacement lights crate"
	group = "Engineering"

/datum/supply_pack/metal120
	name = "Metal Sheets Crate (120)"
	contains = list(/obj/item/stack/material/steel)
	amount = 120
	cost = 400
	containertype = /obj/structure/closet/crate/secure
	crate_name = "metal sheets crate"
	group = "Engineering"

/datum/supply_pack/metal480
	name = "Bulk Metal Sheets Crate"
	contains = list(/obj/item/stack/material/steel/full,
	/obj/item/stack/material/steel/full,
	/obj/item/stack/material/steel/full,
	/obj/item/stack/material/steel/full)
	cost = 1160
	containertype = /obj/structure/largecrate
	crate_name = "Bulk metal crate"
	group = "Engineering"

/datum/supply_pack/plastic120
	name = "Plastic Sheets Crate (120)"
	contains = list(/obj/item/stack/material/plastic)
	amount = 120
	cost = 400
	containertype = /obj/structure/closet/crate/secure
	crate_name = "plastic sheets crate"
	group = "Engineering"

/datum/supply_pack/plastic480
	name = "Bulk Plastic Sheets Crate"
	contains = list(/obj/item/stack/material/plastic/full,
	/obj/item/stack/material/plastic/full,
	/obj/item/stack/material/plastic/full,
	/obj/item/stack/material/plastic/full)
	cost = 1160
	containertype = /obj/structure/largecrate
	crate_name = "Bulk plastic crate"
	group = "Engineering"

/datum/supply_pack/glass120
	name = "Glass Sheets Crate (120)"
	contains = list(/obj/item/stack/material/glass)
	amount = 120
	cost = 600
	containertype = /obj/structure/closet/crate/secure
	crate_name = "glass sheet crate"
	group = "Engineering"
	
/datum/supply_pack/glass480
	name = "Bulk Glass Sheets Crate"
	contains = list(/obj/item/stack/material/glass/full,
	/obj/item/stack/material/glass/full,
	/obj/item/stack/material/glass/full,
	/obj/item/stack/material/glass/full)
	cost = 1740
	containertype = /obj/structure/largecrate
	crate_name = "Bulk glass crate"
	group = "Engineering"

/datum/supply_pack/borosilicate_glass120
	name = "Borosilicate Glass Sheets Crate (120)"
	contains = list(/obj/item/stack/material/glass/plasmaglass)
	amount = 120
	cost = 1400
	containertype = /obj/structure/closet/crate/secure
	crate_name = "borosilicate glass sheet crate"
	group = "Engineering"

/datum/supply_pack/wood50
	name = "Wooden Planks Crate (120)"
	contains = list(/obj/item/stack/material/wood)
	amount = 120
	cost = 600
	containertype = /obj/structure/closet/crate
	crate_name = "wooden planks crate"
	group = "Engineering"

/datum/supply_pack/plasteel60
	name = "Plasteel Sheets Crate (60)"
	contains = list(/obj/item/stack/material/plasteel)
	amount = 60
	cost = 1300
	containertype = /obj/structure/closet/crate/secure
	crate_name = "plasteel sheets crate"
	group = "Engineering"

/datum/supply_pack/electrical
	name = "Electrical Maintenance Crate"
	contains = list (/obj/item/storage/toolbox/electrical,
					/obj/item/storage/toolbox/electrical,
					/obj/item/clothing/gloves/insulated,
					/obj/item/clothing/gloves/insulated,
					/obj/item/cell/large,
					/obj/item/cell/large,
					/obj/item/cell/large/high,
					/obj/item/cell/large/high)
	cost = 960
	containertype = /obj/structure/closet/crate
	crate_name = "electrical maintenance crate"
	group = "Engineering"

/datum/supply_pack/mechanical
	name = "Mechanical Maintenance Crate"
	contains = list(/obj/item/storage/belt/utility/full,
					/obj/item/storage/belt/utility/full,
					/obj/item/storage/belt/utility/full,
					/obj/item/clothing/suit/storage/hazardvest,
					/obj/item/clothing/suit/storage/hazardvest,
					/obj/item/clothing/suit/storage/hazardvest,
					/obj/item/clothing/head/welding,
					/obj/item/clothing/head/welding,
					/obj/item/clothing/head/hardhat)
	cost = 800
	containertype = /obj/structure/closet/crate
	crate_name = "mechanical maintenance crate"
	group = "Engineering"

/datum/supply_pack/toolmods_reinforcement
	contains = list(/obj/item/tool_upgrade/reinforcement/heatsink,
					/obj/item/tool_upgrade/reinforcement/heatsink,
					/obj/item/tool_upgrade/reinforcement/plating,
					/obj/item/tool_upgrade/reinforcement/plating,
					/obj/item/tool_upgrade/reinforcement/guard,
					/obj/item/tool_upgrade/reinforcement/guard,
					/obj/item/tool_upgrade/reinforcement/rubbermesh,
					/obj/item/tool_upgrade/reinforcement/rubbermesh)
	name = "Tool-Mod Reinforcement Crate"
	cost = 1000
	containertype = /obj/structure/closet/crate
	crate_name = "tool upgrade crate"
	group = "Engineering"

/datum/supply_pack/toolmods_productivity
	contains = list(/obj/item/tool_upgrade/productivity/ergonomic_grip,
					/obj/item/tool_upgrade/productivity/ergonomic_grip,
					/obj/item/tool_upgrade/productivity/ratchet,
					/obj/item/tool_upgrade/productivity/ratchet,
					/obj/item/tool_upgrade/productivity/red_paint,
					/obj/item/tool_upgrade/productivity/oxyjet,
					/obj/item/tool_upgrade/productivity/whetstone,
					/obj/item/tool_upgrade/productivity/whetstone,
					/obj/item/tool_upgrade/productivity/motor)
	name = "Tool-Mod Productivity Crate"
	cost = 1000
	containertype = /obj/structure/closet/crate
	crate_name = "tool upgrade crate"
	group = "Engineering"

/datum/supply_pack/toolmods_refinement
	contains = list(/obj/item/tool_upgrade/refinement/laserguide,
					/obj/item/tool_upgrade/refinement/laserguide,
					/obj/item/tool_upgrade/refinement/stabilized_grip,
					/obj/item/tool_upgrade/refinement/stabilized_grip,
					/obj/item/tool_upgrade/refinement/magbit,
					/obj/item/tool_upgrade/refinement/magbit,
					/obj/item/tool_upgrade/refinement/ported_barrel,
					/obj/item/tool_upgrade/refinement/ported_barrel)
	name = "Tool-Mod Refinement Crate"
	cost = 1000
	containertype = /obj/structure/closet/crate
	crate_name = "tool upgrade crate"
	group = "Engineering"

/datum/supply_pack/toolmods_utility
	contains = list(/obj/item/tool_upgrade/augment/cell_mount,
					/obj/item/tool_upgrade/augment/cell_mount,
					/obj/item/tool_upgrade/augment/fuel_tank,
					/obj/item/tool_upgrade/augment/fuel_tank,
					/obj/item/tool_upgrade/augment/expansion,
					/obj/item/tool_upgrade/augment/expansion,
					/obj/item/tool_upgrade/augment/dampener,
					/obj/item/tool_upgrade/augment/dampener)
	name = "Tool-Mod Utility Crate"
	cost = 1000
	containertype = /obj/structure/closet/crate
	crate_name = "tool upgrade crate"
	group = "Engineering"

/datum/supply_pack/toolmods
	contains = list(/obj/random/tool_upgrade,
					/obj/random/tool_upgrade,
					/obj/random/tool_upgrade,
					/obj/random/tool_upgrade,
					/obj/random/tool_upgrade/rare,
					/obj/random/tool_upgrade/rare,
					/obj/random/tool_upgrade/rare,
					/obj/random/tool_upgrade/rare)
	name = "Tool-Mod Random Assortment Crate"
	cost = 1200
	containertype = /obj/structure/closet/crate
	crate_name = "tool upgrade crate"
	group = "Engineering"

/datum/supply_pack/omnitool
	contains = list(/obj/item/tool/omnitool,
					/obj/item/tool/omnitool)
	name = "Omnitool Crate"
	cost = 2000
	containertype = /obj/structure/closet/crate
	crate_name = "omnitool crate"
	group = "Engineering"

/datum/supply_pack/industrial_rcd
	contains = list(/obj/item/rcd/industrial,
					/obj/item/rcd/industrial)
	name = "Industrial RCD Crate"
	cost = 4000
	containertype = /obj/structure/closet/crate
	crate_name = "industrial RCD crate"
	group = "Engineering"

/datum/supply_pack/fueltank
	name = "Fuel Tank Crate"
	contains = list(/obj/structure/reagent_dispensers/fueltank)
	cost = 800
	containertype = /obj/structure/largecrate
	crate_name = "fuel tank crate"
	group = "Engineering"

/datum/supply_pack/fuelcrate2
	name = "Fuel Crate (1000)" //1000 fuel
	contains = list(/obj/item/weldpack,
			/obj/item/weldpack,
			/obj/item/weldpack/canister,
			/obj/item/weldpack/canister,
			/obj/item/weldpack/canister,)
	cost = 2000
	access = FALSE
	containertype = /obj/structure/closet/crate
	crate_name = "fuel crate"
	group = "Engineering"

/datum/supply_pack/solar
	name = "Solar Pack Crate"
	contains  = list(/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly,
					/obj/item/solar_assembly, // 21 Solar Assemblies. 1 Extra for the controller
					/obj/item/circuitboard/solar_control,
					/obj/item/tracker_electronics,
					/obj/item/paper/solar)
	cost = 1300
	containertype = /obj/structure/closet/crate
	crate_name = "solar pack crate"
	group = "Engineering"

/datum/supply_pack/engine
	name = "Emitters Crate"
	contains = list(/obj/machinery/power/emitter,
					/obj/machinery/power/emitter)
	cost = 1200
	containertype = /obj/structure/closet/crate/secure
	crate_name = "emitter crate"
	group = "Engineering"

/datum/supply_pack/engine/field_gen
	name = "Field Generator Crate"
	contains = list(/obj/machinery/field_generator,
					/obj/machinery/field_generator)
	containertype = /obj/structure/closet/crate/secure
	crate_name = "field generator crate"

/datum/supply_pack/engine/sing_gen
	name = "Singularity Generator Crate"
	contains = list(/obj/machinery/the_singularitygen)
	containertype = /obj/structure/closet/crate/secure
	crate_name = "singularity generator crate"

/datum/supply_pack/engine/collector
	name = "Radiation Collectors crate"
	contains = list(/obj/machinery/power/rad_collector,
					/obj/machinery/power/rad_collector,
					/obj/machinery/power/rad_collector)
	containertype = /obj/structure/closet/crate/secure
	crate_name = "radiation collectors crate"

/datum/supply_pack/engine/PA
	name = "Particle Accelerator Crate"
	cost = 3200
	contains = list(/obj/structure/particle_accelerator/fuel_chamber,
					/obj/machinery/particle_accelerator/control_box,
					/obj/structure/particle_accelerator/particle_emitter/center,
					/obj/structure/particle_accelerator/particle_emitter/left,
					/obj/structure/particle_accelerator/particle_emitter/right,
					/obj/structure/particle_accelerator/power_box,
					/obj/structure/particle_accelerator/end_cap)
	containertype = /obj/structure/closet/crate/secure
	crate_name = "particle accelerator crate"

/datum/supply_pack/engine/am_control
	name = "Antimatter Control Unit"
	cost = 1000
	contains = list(/obj/machinery/power/am_control_unit)
	containertype = /obj/structure/closet/crate/secure
	crate_name = "antimatter control unit crate"

/datum/supply_pack/engine/am_shielding
	name = "Antimatter Shielding"
	cost = 2250
	contains = list(/obj/item/am_shielding_container,
					/obj/item/am_shielding_container,
					/obj/item/am_shielding_container,
					/obj/item/am_shielding_container,
					/obj/item/am_shielding_container,
					/obj/item/am_shielding_container,
					/obj/item/am_shielding_container,
					/obj/item/am_shielding_container,
					/obj/item/am_shielding_container)
	containertype = /obj/structure/closet/crate/secure
	crate_name = "antimatter shielding crate"

/datum/supply_pack/engine/am_fuel
	name = "Antimatter Fuel Jar"
	cost = 1250
	contains = list(/obj/item/am_containment,
					/obj/item/am_containment,
					/obj/item/am_containment)
	containertype = /obj/structure/closet/crate/secure
	crate_name = "antimatter fuel jar crate"

/datum/supply_pack/mecha_ripley
	name = "Exosuit Assembly Crate (\"Ripley\" APLU)"
	contains = list(
		/obj/item/mecha_parts/mecha_equipment/tool/drill,
		/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp,
		/obj/item/circuitboard/mecha/main,
		/obj/item/circuitboard/mecha/peripherals,
		/obj/item/mecha_parts/chassis/ripley,
		/obj/item/mecha_parts/part/ripley_torso,
		/obj/item/mecha_parts/part/ripley_left_arm,
		/obj/item/mecha_parts/part/ripley_right_arm,
		/obj/item/mecha_parts/part/ripley_left_leg,
		/obj/item/mecha_parts/part/ripley_right_leg)
	cost = 2400
	containertype = /obj/structure/closet/crate/secure/scisecurecrate
	crate_name = "Exosuit Assembly Crate (\"Ripley\" APLU)"
	group = "Engineering"

/datum/supply_pack/mecha_odysseus
	name = "Exosuit Assembly Crate (\"Odysseus\")"
	contains = list(
		/obj/item/mecha_parts/mecha_equipment/tool/syringe_gun,
		/obj/item/mecha_parts/mecha_equipment/tool/sleeper,
		/obj/item/circuitboard/mecha/main,
		/obj/item/circuitboard/mecha/peripherals,
		/obj/item/mecha_parts/chassis/odysseus,
		/obj/item/mecha_parts/part/odysseus_head,
		/obj/item/mecha_parts/part/odysseus_torso,
		/obj/item/mecha_parts/part/odysseus_left_arm,
		/obj/item/mecha_parts/part/odysseus_right_arm,
		/obj/item/mecha_parts/part/odysseus_left_leg,
		/obj/item/mecha_parts/part/odysseus_right_leg)
	cost = 2400
	containertype = /obj/structure/closet/crate/secure/scisecurecrate
	crate_name = "Exosuit Assembly Crate (\"Odysseus\")"
	group = "Engineering"

/datum/supply_pack/robotics
	name = "Robotics Assembly Crate"
	contains = list(/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/device/assembly/prox_sensor,
					/obj/item/storage/toolbox/electrical,
					/obj/item/device/flash,
					/obj/item/device/flash,
					/obj/item/device/flash,
					/obj/item/device/flash,
					/obj/item/cell/large/high,
					/obj/item/cell/large/high)
	cost = 800
	containertype = /obj/structure/closet/crate/secure/scisecurecrate
	crate_name = "robotics assembly crate"
	access = access_robotics
	group = "Engineering"
/*
//Contains six, you'll probably want to build several of these
/datum/supply_pack/shield_diffuser
	contains = list(/obj/item/circuitboard/shield_diffuser,
	/obj/item/circuitboard/shield_diffuser,
	/obj/item/circuitboard/shield_diffuser,
	/obj/item/circuitboard/shield_diffuser,
	/obj/item/circuitboard/shield_diffuser,
	/obj/item/circuitboard/shield_diffuser,
	/obj/item/circuitboard/shield_diffuser)
	name = "Shield Diffuser Circuitry Crate"
	cost = 2400
	containertype = /obj/structure/closet/crate/secure
	crate_name = "shield diffuser circuitry crate"
	group = "Engineering"
	access = access_ce
*/
/datum/supply_pack/hatton_tube
	contains = list(/obj/item/hatton_magazine,
	/obj/item/hatton_magazine,
	/obj/item/hatton_magazine)
	name = "Hatton Gas Tubes Crate"
	crate_name = "hatton gas tubes crate"
	cost = 4000
	containertype = /obj/structure/closet/crate/secure
	group = "Engineering"
	access = access_ce

/*
/datum/supply_pack/shield_gen
	contains = list(/obj/item/circuitboard/shield_generator)
	name = "Hull Shield Generator Circuitry Crate"
	cost = 4000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "hull shield generator circuitry crate"
	group = "Engineering"
*/

/datum/supply_pack/smbig
	name = "Supermatter Core Crate (CAUTION)"
	contains = list(/obj/machinery/power/supermatter)
	cost = 100000
	containertype = /obj/structure/closet/crate/secure/woodseccrate
	crate_name = "supermatter core crate (CAUTION)"
	group = "Engineering"
	access = access_ce

/datum/supply_pack/teg
	contains = list(/obj/machinery/power/generator)
	name = "Mark I Thermoelectric Generator Crate"
	cost = 750
	containertype = /obj/structure/closet/crate/secure/large
	crate_name = "Mark I thermoelectric generator crate"
	group = "Engineering"

/datum/supply_pack/circulator
	contains = list(/obj/machinery/atmospherics/binary/circulator)
	name = "Binary Atmospheric Circulator Crate"
	cost = 600 //You need two this
	containertype = /obj/structure/closet/crate/secure/large
	crate_name = "binary atmospheric circulator crate"
	group = "Engineering"

/datum/supply_pack/air_dispenser
	contains = list(/obj/machinery/pipedispenser/orderable)
	name = "Pipe Dispenser Crate"
	cost = 720
	containertype = /obj/structure/closet/crate/secure/large
	crate_name = "pipe dispenser crate"
	group = "Engineering"

/datum/supply_pack/disposals_dispenser
	contains = list(/obj/machinery/pipedispenser/disposal/orderable)
	name = "Disposal Pipe Dispenser Crate"
	cost = 720
	containertype = /obj/structure/closet/crate/secure/large
	crate_name = "disposal pipe dispenser Crate"
	group = "Engineering"
