//Random tool upgrades
/obj/random/tool_upgrade
	name = "random tool upgrade"
	icon_state = "tech-orange"

/obj/random/tool_upgrade/item_to_spawn()
	return pickweight(list(
	/obj/item/tool_upgrade/reinforcement/stick = 1,
	/obj/item/tool_upgrade/reinforcement/heatsink = 1,
	/obj/item/tool_upgrade/reinforcement/plating = 1.5,
	/obj/item/tool_upgrade/reinforcement/guard = 0.75,
	/obj/item/tool_upgrade/productivity/ergonomic_grip = 1,
	/obj/item/tool_upgrade/productivity/ratchet = 1,
	/obj/item/tool_upgrade/productivity/red_paint = 0.75,
	/obj/item/tool_upgrade/productivity/whetstone = 0.5,
	/obj/item/tool_upgrade/productivity/diamond_blade = 0.25,
	/obj/item/tool_upgrade/productivity/oxyjet = 0.75,
	/obj/item/tool_upgrade/productivity/motor = 0.75,
	/obj/item/tool_upgrade/refinement/laserguide = 1,
	/obj/item/tool_upgrade/refinement/stabilized_grip = 1,
	/obj/item/tool_upgrade/refinement/magbit = 0.75,
	/obj/item/tool_upgrade/refinement/ported_barrel = 0.5,
	/obj/item/tool_upgrade/augment/cell_mount = 0.75,
	/obj/item/tool_upgrade/augment/fuel_tank = 1,
	/obj/item/tool_upgrade/augment/expansion = 0.25,
	/obj/item/tool_upgrade/augment/spikes = 1,
	//obj/item/tool_upgrade/augment/hammer_addon = 0.75,
	/obj/item/tool_upgrade/augment/dampener = 0.5,
	/obj/item/tool_upgrade/reinforcement/rubbermesh = 0.5,
	/obj/item/tool_upgrade/productivity/booster = 0.5))

/obj/random/tool_upgrade/low_chance
	name = "low chance random tool upgrade"
	icon_state = "tech-orange-low"
	spawn_nothing_percentage = 80

/obj/random/tool_upgrade/always
	name = "always random tool upgrade"
	spawn_nothing_percentage = 0

/obj/random/tool_upgrade/rare
	name = "random rare tool upgrade"
	icon_state = "tech-red"

/obj/random/tool_upgrade/rare/always_spawn
	name = "random always spawn rare tool upgrade"
	spawn_nothing_percentage = 0

//A fancier subset of the most desireable upgrades
/obj/random/tool_upgrade/rare/item_to_spawn()
	return pickweight(list(
	/obj/item/tool_upgrade/reinforcement/guard = 1,
	/obj/item/tool_upgrade/productivity/ergonomic_grip = 1,
	/obj/item/tool_upgrade/productivity/red_paint = 1,
	/obj/item/tool_upgrade/productivity/diamond_blade = 1,
	/obj/item/tool_upgrade/productivity/motor = 1,
	/obj/item/tool_upgrade/refinement/laserguide = 1,
	/obj/item/tool_upgrade/refinement/stabilized_grip = 1,
	/obj/item/tool_upgrade/augment/expansion = 1,
	/obj/item/tool_upgrade/augment/dampener = 0.5,
	/obj/item/tool_upgrade/reinforcement/plasmablock = 1,
	/obj/item/tool_upgrade/productivity/antistaining = 1,
	/obj/item/tool_upgrade/productivity/injector = 1,
	/obj/item/tool_upgrade/refinement/vibcompensator = 0.5,
	/obj/item/tool_upgrade/augment/hydraulic = 0.5))

/obj/random/tool_upgrade/rare/low_chance
	name = "low chance random rare tool upgrade"
	icon_state = "tech-red-low"
	spawn_nothing_percentage = 80
