/******************************
	UPGRADE TYPES
******************************/
// 	 REINFORCEMENT: REDUCES TOOL DEGRADATION
//------------------------------------------------

//This can be attached to basically any long tool
//This includes most mechanical ones
/obj/item/tool_upgrade/reinforcement/stick
	name = "brace bar"
	desc = "A sturdy pole made of fiber tape and plasteel rods. Can be used to reinforce the shaft of many tools."
	icon_state = "brace_bar"

	price_tag = 120
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 1)
	preloaded_reagents = list("iron" = 15, "plasticide" = 5)

//list/tool_upgrades, list/required_qualities, list/negative_qualities, prefix, req_fuel, req_cell

/obj/item/tool_upgrade/reinforcement/stick/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
		UPGRADE_DEGRADATION_MULT = 0.65,
		UPGRADE_FORCE_MOD = 1
		)

	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PRYING, QUALITY_SAWING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CUTTING, QUALITY_HAMMERING)
	I.prefix = "braced"

//Heatsink can be attached to any tool that uses fuel or power
/obj/item/tool_upgrade/reinforcement/heatsink
	name = "heatsink"
	desc = "An array of plasteel fins which dissipates heat, reducing damage and extending the lifespan of power tools or improving energy weapon cooling."
	icon_state = "heatsink"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 1)
	preloaded_reagents = list("iron" = 15, "plasticide" = 5)

/obj/item/tool_upgrade/reinforcement/heatsink/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
		UPGRADE_DEGRADATION_MULT = 0.65
		)
	I.weapon_upgrades = list(
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.8,
		GUN_UPGRADE_STEPDELAY_MULT = 0.8,
		UPGRADE_BULK = 1
	)
	I.prefix = "heatsunk"
	I.req_fuel_cell = REQ_FUEL_OR_CELL
	I.gun_loc_tag = GUN_MECHANISM
	I.req_gun_tags = list(GUN_ENERGY)

/obj/item/tool_upgrade/reinforcement/plating
	name = "reinforced plating"
	desc = "A sturdy bit of plasteel that can be bolted onto any tool to protect it. Tough, but bulky."
	icon_state = "plate"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 2) //steel to compensate for metal rods used in crafting
	preloaded_reagents = list("iron" = 20)

/obj/item/tool_upgrade/reinforcement/plating/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = 0.55,
	UPGRADE_FORCE_MOD = 1,
	UPGRADE_PRECISION = -5,
	UPGRADE_BULK = 1)
	I.prefix = "reinforced"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)

/obj/item/tool_upgrade/reinforcement/guard
	name = "metal guard"
	desc = "A bent piece of metal that wraps around sensitive parts of a tool, protecting it from impacts, debris, and stray fingers. Could be added to the back of a gun to help stablize it as well."
	icon_state = "guard"
	matter = list(MATERIAL_PLASTEEL = 5)
	preloaded_reagents = list("aluminum" = 9, "iron" = 9)
	price_tag = 160

/obj/item/tool_upgrade/reinforcement/guard/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = 0.75,
	UPGRADE_PRECISION = 5
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 0.85,
	UPGRADE_BULK = 1
	)
	I.required_qualities = list(QUALITY_CUTTING,QUALITY_DRILLING, QUALITY_SAWING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_WELDING, QUALITY_HAMMERING, QUALITY_BONE_SETTING)
	I.prefix = "shielded"

// Plasmablock can be attached to any tool that uses fuel or power
/obj/item/tool_upgrade/reinforcement/plasmablock
	name = "plasmablock"
	desc = "A plasmablock is way more efficient to dissipate heat than classic heatsinks or waterblocks thanks to the tremendous heat-transfer capacity of liquid plasma. The fluid that is actively pumped through a radiator and cooled by fans. It greatly extends the lifespan of power tools or heat dissipation of energy weapons."
	icon_state = "plasmablock"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 2, MATERIAL_PLASMA = 1)
	preloaded_reagents = list("iron" = 15, "plasticide" = 5, "plasma" = 3)

/obj/item/tool_upgrade/reinforcement/plasmablock/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
		UPGRADE_DEGRADATION_MULT = 0.45,
		UPGRADE_HEALTH_THRESHOLD = 10,
		UPGRADE_POWERCOST_MULT = 1.05,
		UPGRADE_FUELCOST_MULT = 1.05
		)
	I.weapon_upgrades = list(
		GUN_UPGRADE_STEPDELAY_MULT = 0.6,
		UPGRADE_BULK = 1
	)
	I.prefix = "plasma-cooled"
	I.req_fuel_cell = REQ_FUEL_OR_CELL
	I.gun_loc_tag = GUN_MECHANISM
	I.req_gun_tags = list(GUN_ENERGY)

/obj/item/tool_upgrade/reinforcement/rubbermesh
	name = "rubber mesh"
	desc = "A rubber mesh that can wrapped around sensitive parts of a tool to protecting them from impacts and debris."
	icon_state = "rubbermesh"
	matter = list(MATERIAL_PLASTIC = 3)
	preloaded_reagents = list("plasticide" = 8)
	price_tag = 60

/obj/item/tool_upgrade/reinforcement/rubbermesh/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = 0.7
	)
	I.required_qualities = list(QUALITY_CUTTING, QUALITY_DRILLING, QUALITY_SAWING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_WELDING, QUALITY_HAMMERING)
	I.prefix = "rubber-wrapped"

// 	 PRODUCTIVITY: INCREASES WORKSPEED
//------------------------------------------------
/obj/item/tool_upgrade/productivity/ergonomic_grip
	name = "ergonomic grip"
	desc = "A replacement grip for a tool which allows it to be more precisely controlled with one hand. Can be placed under a gun's barrel to reduce recoil. However, it also makes bracing impossible."
	icon_state = "ergonomic"
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 5)
	preloaded_reagents = list("aluminum" = 9, "plasticide" = 3)
	price_tag = 120

/obj/item/tool_upgrade/productivity/ergonomic_grip/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.15
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.8,
		UPGRADE_BULK = 1
	)
	I.gun_loc_tag = GUN_UNDERBARREL
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING, QUALITY_WEAVING)
	I.prefix = "ergonomic"

/obj/item/tool_upgrade/productivity/ratchet
	name = "ratcheting mechanism"
	desc = "A mechanical upgrade for wrenches and screwdrivers which allows the tool to only turn in one direction."
	icon_state = "ratchet"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 4, MATERIAL_PLASTIC = 1)
	preloaded_reagents = list("iron" = 15, "plasticide" = 5)

/obj/item/tool_upgrade/productivity/ratchet/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.25
	)
	I.required_qualities = list(QUALITY_BOLT_TURNING,QUALITY_SCREW_DRIVING)
	I.prefix = "ratcheting"

/obj/item/tool_upgrade/productivity/red_paint
	name = "red paint"
	desc = "Do red tools really work faster or is the effect purely psychological? Needless to say, you can't strip it off once applied. Ye'z boyz kin' put in on ya shootahz too!"
	icon_state = "paint_red"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)
	preloaded_reagents = list("acetone" = 15, "iron" = 5)
	can_remove = FALSE
	price_tag = 60

/obj/item/tool_upgrade/productivity/red_paint/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.20,
	UPGRADE_PRECISION = -10,
	UPGRADE_COLOR = "#FF4444"
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.75,
		GUN_UPGRADE_STEPDELAY_MULT = 0.75,
		GUN_UPGRADE_OFFSET = 3,
		GUN_UPGRADE_RECOIL = 1.3,
		UPGRADE_COLOR = "#FF4444"
	)
	I.prefix = "red"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING, QUALITY_WEAVING)

/obj/item/tool_upgrade/productivity/whetstone
	name = "sharpening block"
	desc = "A rough single-use block to sharpen a blade or a rifle bayonet. The honed edge cuts smoothly, and can never be dulled."
	icon_state = "whetstone"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_DIAMOND = 3)
	can_remove = FALSE
	price_tag = 260

/obj/item/tool_upgrade/productivity/whetstone/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.15,
	UPGRADE_PRECISION = 5,
	UPGRADE_FORCE_MULT = 1.15
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_MELEE_DAMAGE = 1.3,
	)
	I.req_gun_tags = list(GUN_BAYONET)
	I.gun_loc_tag = GUN_KNIFE
	I.required_qualities = list(QUALITY_CUTTING, QUALITY_SAWING, QUALITY_SHOVELING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING)
	I.prefix = "sharpened"

/obj/item/tool_upgrade/productivity/diamond_blade
	name = "Lonestars \"Gleaming Edge\": diamond blade"
	desc = "An adaptable industrial grade cutting disc, with diamond dust worked into the metal. Exceptionally durable. Works for both cutting tools and rifle bayonets."
	icon_state = "diamond_blade"
	price_tag = 300
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_DIAMOND = 4)

/obj/item/tool_upgrade/productivity/diamond_blade/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.25,
	UPGRADE_DEGRADATION_MULT = 0.85,
	UPGRADE_FORCE_MULT = 1.1,
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_MELEE_DAMAGE = 1.2,
	)
	I.req_gun_tags = list(GUN_BAYONET)
	I.gun_loc_tag = GUN_KNIFE
	I.required_qualities = list(QUALITY_CUTTING, QUALITY_SHOVELING, QUALITY_SAWING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_PRYING)
	I.negative_qualities = list(QUALITY_WELDING, QUALITY_LASER_CUTTING, QUALITY_HAMMERING)
	I.prefix = "diamond-edged"

/obj/item/tool_upgrade/productivity/oxyjet
	name = "oxyjet canister"
	desc = "A canister of pure, compressed oxygen with adapters for mounting onto a welding tool. Used alongside fuel, it allows for higher burn temperatures."
	icon_state = "oxyjet"
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 1)
	preloaded_reagents = list("iron" = 15, "plasticide" = 5)
	price_tag = 180

/obj/item/tool_upgrade/productivity/oxyjet/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.25,
	UPGRADE_FORCE_MULT = 1.15,
	UPGRADE_DEGRADATION_MULT = 1.15
	)
	I.required_qualities = list(QUALITY_WELDING)
	I.prefix = "oxyjet"

//Enhances power tools majorly, but also increases costs
/obj/item/tool_upgrade/productivity/motor
	name = "high power motor"
	desc = "A motor for power tools with a higher horsepower than usually expected. Significantly enhances productivity and lifespan, but more expensive to run and harder to control."
	icon_state = "motor"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 4)
	preloaded_reagents = list("iron" = 15, "oil"= 9)

/obj/item/tool_upgrade/productivity/motor/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.5,
	UPGRADE_FORCE_MULT = 1.15,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_POWERCOST_MULT = 1.35,
	UPGRADE_FUELCOST_MULT = 1.35,
	UPGRADE_PRECISION = -10
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RECOIL = 1.5,
		GUN_UPGRADE_PEN_BASE = 0.2,
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.8,
		GUN_UPGRADE_MOVE_DELAY_MULT = 0.8,
		GUN_UPGRADE_MUZZLEFLASH = 1.5,
		GUN_UPGRADE_CHARGECOST = 1.25,
		GUN_UPGRADE_OVERCHARGE_MAX = 1.2,
		GUN_UPGRADE_OVERCHARGE_RATE = 0.8,
		UPGRADE_BULK = 1
	)
	I.required_qualities = list(QUALITY_SCREW_DRIVING, QUALITY_DRILLING, QUALITY_SAWING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_HAMMERING)
	I.prefix = "high-power"
	I.req_fuel_cell = REQ_FUEL_OR_CELL
	I.req_gun_tags = list(GUN_ENERGY)
	I.gun_loc_tag = GUN_MECHANISM

/obj/item/tool_upgrade/productivity/antistaining
	name = "anti-staining paint"
	desc = "Applying a thin coat of this paint on a tool prevents blood stains, dirt or dust to adhere to its surface. Everyone works better and faster with clean tools. Once applied, it can't ever be stripped."
	icon_state = "antistaining"
	preloaded_reagents = list("oil" = 5, "aluminum" = 5, "mercury" = 5)
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_PLASMA = 3)
	can_remove = FALSE
	price_tag = 180

/obj/item/tool_upgrade/productivity/antistaining/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.30,
	UPGRADE_PRECISION = 5,
	UPGRADE_ITEMFLAGPLUS = NOBLOODY
	)
	I.prefix = "anti-stain coated"

/obj/item/tool_upgrade/productivity/booster
	name = "booster"
	desc = "When you do not care about energy comsumption and just want to get shit done quickly. This device shunts the power safeties of your tool whether it uses fuel or electricity."
	icon_state = "booster"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_GOLD = 1)
	price_tag = 230

/obj/item/tool_upgrade/productivity/booster/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.35,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_POWERCOST_MULT = 1.25,
	UPGRADE_FUELCOST_MULT = 1.25
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_PEN_BASE = 0.3,
	GUN_UPGRADE_CHARGECOST = 1.2
	)
	I.prefix = "boosted"
	I.req_fuel_cell = REQ_FUEL_OR_CELL
	I.gun_loc_tag = GUN_MECHANISM
	I.req_gun_tags = list(GUN_ENERGY)

/obj/item/tool_upgrade/productivity/injector
	name = "plasma injector"
	desc = "If the words \"safety regulations\" do not mean anything to you, you may consider installing this fine piece of technology on your tool. It injects small amounts of plasma in the fuel mix before combustion to greatly increase its power output, making all kinds of tasks easier to perform. If you're insane, you could attach it to an energy weapon's barrel."
	icon_state = "injector"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 2, MATERIAL_PLASMA = 2)
	preloaded_reagents = list("iron" = 15, "plasticide" = 5, "plasma" = 3)
	price_tag = 280

/obj/item/tool_upgrade/productivity/injector/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.75,
	UPGRADE_DEGRADATION_MULT = 1.3,
	UPGRADE_POWERCOST_MULT = 1.3,
	UPGRADE_FUELCOST_MULT = 1.3
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_BURN = 10,
		GUN_UPGRADE_RECOIL = 1.3,
		GUN_UPGRADE_FIRE_DELAY_MULT = 1.3
		)
	I.prefix = "plasma-fueled"
	I.req_fuel_cell = REQ_FUEL
	I.gun_loc_tag = GUN_BARREL
	I.req_gun_tags = list(GUN_ENERGY)

/obj/item/tool_upgrade/productivity/rocket_engine
	name = "rocket engine"
	desc = "A singular rocket engine, used in assisted ballistics, tools, and once in a blue moon its intended purpose."
	icon = 'icons/obj/items.dmi'
	icon_state = "rocket_engine"
	origin_tech = list(TECH_ENGINEERING = 3, TECH_POWER = 4)
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_GOLD = 1)
	preloaded_reagents = list("iron" = 15, "oil"= 9)

/obj/item/tool_upgrade/productivity/rocket_engine/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.75,
	UPGRADE_FORCE_MULT = 1.2,
	UPGRADE_DEGRADATION_MULT = 3,
	UPGRADE_POWERCOST_MULT = 2,
	UPGRADE_FUELCOST_MULT = 2,
	UPGRADE_PRECISION = -15
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_STEPDELAY_MULT = 0.1,
		UPGRADE_BULK = 2,
		GUN_UPGRADE_RECOIL = 1.5,
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.8
		)
	I.prefix = "rocket-assisted "
	I.req_fuel_cell = REQ_FUEL_OR_CELL
	I.gun_loc_tag = GUN_MECHANISM
	I.req_gun_tags = list(GUN_PROJECTILE)

// Wax coating- shrinks tool and give it anti-staining properties, can be applied to clothes
/obj/item/tool_upgrade/productivity/waxcoat
	name = "Wax Coating"
	desc = "A bucket of filtered beeswax, to be applied to tools or clothes to prevent stains, minor nicks, and damage."
	icon_state = "waxcoat"
	matter = list(MATERIAL_BIOMATTER = 2, MATERIAL_PLASTIC = 5)
	can_remove = FALSE
	price_tag = 380

/obj/item/tool_upgrade/productivity/waxcoat/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = -2,
	UPGRADE_DEGRADATION_MULT = 0.90,
	UPGRADE_ITEMFLAGPLUS = NOBLOODY
	)
	I.prefix = "waxed"

// 	 REFINEMENT: INCREASES PRECISION
//------------------------------------------------
/obj/item/tool_upgrade/refinement/laserguide
	name = "\improper Lonestars \"Guiding Light\" laser guide"
	desc = "A small visible laser which can be strapped onto any tool, giving an accurate representation of its target. Helps improve precision."
	icon_state = "laser_guide"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_URANIUM = 1)
	preloaded_reagents = list("plasticide" = 3, "radium" = 5, "phosphorus" = 15)
	price_tag = 90

/obj/item/tool_upgrade/refinement/laserguide/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 10)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 0.9,
	UPGRADE_BULK = 1
	)
	I.gun_loc_tag = GUN_SIGHT
	I.prefix = "laser-guided"

//Fits onto generally small tools that require precision, especially surgical tools
//Doesn't work onlarger things like crowbars and drills
/obj/item/tool_upgrade/refinement/stabilized_grip
	name = "gyrostabilized grip"
	desc = "A fancy mechanical grip that partially floats around a tool, absorbing tremors and shocks. Allows precise work with a shaky hand. \
			Can also be applied to guns to slightly help with recoil control."
	icon_state = "stabilizing"
	matter = list(MATERIAL_PLASTIC = 3)
	preloaded_reagents = list("plasticide" = 5)
	price_tag = 30

/obj/item/tool_upgrade/refinement/stabilized_grip/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 10)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RECOIL = 0.8
	)
	I.gun_loc_tag = GUN_GRIP
	I.required_qualities = list(QUALITY_CUTTING, QUALITY_WIRE_CUTTING, QUALITY_SCREW_DRIVING, QUALITY_WELDING,QUALITY_PULSING, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_BONE_SETTING, QUALITY_LASER_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_WEAVING, QUALITY_BONE_GRAFTING)
	I.prefix = "stabilized"

/obj/item/tool_upgrade/refinement/magbit
	name = "magnetic bit"
	desc = "Magnetises tools used for handling small objects, reducing instances of dropping screws and bolts."
	icon_state = "magnetic"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 2)
	preloaded_reagents = list("iron" = 15)
	price_tag = 100

/obj/item/tool_upgrade/refinement/magbit/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 10
	)
	I.required_qualities = list(QUALITY_SCREW_DRIVING, QUALITY_BOLT_TURNING, QUALITY_CLAMPING, QUALITY_BONE_SETTING, QUALITY_PULSING, QUALITY_SHOVELING, QUALITY_DIGGING)
	I.prefix = "magnetic tipped"

/obj/item/tool_upgrade/refinement/ported_barrel // Faster tool but more costly, stronger gun but more unwieldy
	name = "composite barrel"
	desc = "A barrel extension for a welding tool (or gun) which increases gas pressure on either torch or gun. When attached to a gun it allows for greater stopping power at the cost of recoil control and firerate."
	icon_state = "ported_barrel"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 2)
	preloaded_reagents = list("aluminum" = 9, "iron" = 9)
	price_tag = 100

/obj/item/tool_upgrade/refinement/ported_barrel/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
		UPGRADE_WORKSPEED = 0.35,
		UPGRADE_POWERCOST_MULT = 1.05,
		UPGRADE_FUELCOST_MULT = 1.05,
		UPGRADE_DEGRADATION_MULT = 1.15,
		UPGRADE_BULK = 1)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_BASE = 0.2, // Think of the guild's heavy barrel as a direct upgrade of this, as it's part of its recipe.
		GUN_UPGRADE_FIRE_DELAY_MULT = 1.2,
		GUN_UPGRADE_STEPDELAY_MULT = 1.1,
		GUN_UPGRADE_RECOIL = 1.2,
		UPGRADE_BULK = 1
		)
	I.req_gun_tags = list(GUN_PROJECTILE)
	I.gun_loc_tag = GUN_MUZZLE
	I.required_qualities = list(QUALITY_WELDING)
	I.prefix = "composite barreled"

/obj/item/tool_upgrade/refinement/compensatedbarrel // More accurate tool but slower, faster gun but less hitting
	name = "gravity compensated barrel"
	desc = "A barrel extension for welding tools that integrates a miniaturized gravity generator that help keep the torch steady by compensating the weight of the tool. It can also be attached to guns both energy and projectile to offer greater recoil control at the cost of stopping power."
	icon_state = "compensatedbarrel"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 1, MATERIAL_PLASTIC = 1, MATERIAL_GOLD = 1)
	preloaded_reagents = list("aluminum" = 15, "plasticide" = 5, "iron" = 3)
	price_tag = 175

/obj/item/tool_upgrade/refinement/compensatedbarrel/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 15,
	UPGRADE_DEGRADATION_MULT = 0.90,
	UPGRADE_WORKSPEED = -0.5,
	UPGRADE_BULK = 1
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_FIRE_DELAY_MULT = 0.85,
		GUN_UPGRADE_STEPDELAY_MULT = 0.85,
		GUN_UPGRADE_MUZZLEFLASH = 0.6,
		GUN_UPGRADE_RECOIL = 0.6,
		GUN_UPGRADE_DAMAGE_MULT = 0.9
		)
	I.gun_loc_tag = GUN_MUZZLE
	I.required_qualities = list(QUALITY_WELDING)
	I.prefix = "gravity-compensated"
	I.req_fuel_cell = REQ_FUEL_OR_CELL

/obj/item/tool_upgrade/refinement/vibcompensator
	name = "vibration compensator"
	desc = "A ground-breaking innovation that dampens the vibration of a tool by emitting sound waves in a frequency nobody can hear. It does not make any sense but neither will you by installing that on your tool. Alternatively, it could fit a gun grip to lessen recoil."
	icon_state = "vibcompensator"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 1, MATERIAL_GOLD = 1)
	preloaded_reagents = list("aluminum" = 15, "plasticide" = 5, "iron" = 3)
	price_tag = 120

/obj/item/tool_upgrade/refinement/vibcompensator/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_PRECISION = 15,
	UPGRADE_ITEMFLAGPLUS = SILENT
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_RECOIL = 0.5,
		UPGRADE_BULK = 0.5,
		GUN_UPGRADE_PEN_BASE = -0.1
	)
	I.gun_loc_tag = GUN_GRIP
	I.required_qualities = list(QUALITY_CUTTING, QUALITY_WIRE_CUTTING, QUALITY_SCREW_DRIVING, QUALITY_WELDING ,QUALITY_PULSING, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_BONE_SETTING, QUALITY_LASER_CUTTING, QUALITY_BONE_GRAFTING)
	I.prefix = "vibration-compensated"

// 		AUGMENTS: MISCELLANEOUS AND UTILITY
//------------------------------------------------

//Allows the tool to use a cell one size category larger than it currently uses. Small to medium, medium to large, etc
/obj/item/tool_upgrade/augment/cell_mount
	name = "heavy cell mount"
	icon_state = "cell_mount"
	desc = "A bulky adapter which allows oversized power cells to be installed into small tools. Due to its delicate integration, it can't be removed once installed."
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 1)
	can_remove = FALSE // To fix exploit of fitting large cells on tools then taking out the mod while conserving a large cell.
	price_tag = 115
	preloaded_reagents = list("iron" = 8, "plasticide" = 5)

/obj/item/tool_upgrade/augment/cell_mount/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_CELLPLUS = 1
	)
	I.prefix = "large-socketed"
	I.req_fuel_cell = REQ_CELL

/obj/item/tool_upgrade/augment/cell_adapt
	name = "small cell adapter"
	icon_state = "cell_adapt"
	desc = "A cell adapter which allows undersized power cells to be installed into tools. Due to its delicate integration, it can't be removed once installed."
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 1)
	can_remove = FALSE // To fix exploit of fitting large cells on tools then taking out the mod while conserving a large cell.
	price_tag = 115
	preloaded_reagents = list("iron" = 8, "plasticide" = 5)

/obj/item/tool_upgrade/augment/cell_adapt/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_BULK = -1,
	UPGRADE_CELLMINUS = 1
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_CELLMINUS = 1,
	UPGRADE_BULK = -2)
	I.prefix = "small-socketed"
	I.req_fuel_cell = REQ_CELL
	I.req_gun_tags = list(GUN_ENERGY)
	I.gun_loc_tag = GUN_MECHANISM

//Stores moar fuel!
/obj/item/tool_upgrade/augment/fuel_tank
	name = "expanded fuel tank"
	desc = "An auxiliary tank which stores 100 extra units of fuel at the cost of degradation."
	icon_state = "canister"
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_PLASTIC = 1)
	preloaded_reagents = list("aluminum" = 15, "plasticide" = 5, "plasma" = 3)
	price_tag = 90

/obj/item/tool_upgrade/augment/fuel_tank/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_MAXFUEL = 100)
	I.prefix = "expanded"
	I.req_fuel_cell = REQ_FUEL

//Greyson fuel mod
/obj/item/tool_upgrade/augment/holding_tank
	name = "expanded fuel tank of holding"
	desc = "Rare relic of Greyson uses the bluetech space to store additional 600 units of fuel at the cost of degradation."
	icon_state = "canister_holding"
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_PLASTEEL = 4, MATERIAL_PLATINUM = 4)
	price_tag = 250

/obj/item/tool_upgrade/augment/holding_tank/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 1,
	UPGRADE_DEGRADATION_MULT = 1.3,
	UPGRADE_MAXFUEL = 600
	)
	I.prefix = "holding"
	I.req_fuel_cell = REQ_FUEL
	item_flags |= BLUESPACE
	bluespace_entropy(5, get_turf(src))

//Penalises the tool, but unlocks several more augment slots.
/obj/item/tool_upgrade/augment/expansion
	name = "expansion port"
	icon_state = "expand"
	desc = "A bulky adapter which allows more modifications to be attached to the tool or gun. A bit fragile but you can compensate. Due to its complex design it cannot be removed once installed."
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 1)
	preloaded_reagents = list("aluminum" = 9, "plasticide" = 5, "iron" = 9)
	can_remove = FALSE
	price_tag = 125

/obj/item/tool_upgrade/augment/expansion/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BULK = 2,
	UPGRADE_DEGRADATION_MULT = 1.5,
	UPGRADE_PRECISION = -8,
	UPGRADE_MAXUPGRADES = 3
	)
	I.weapon_upgrades = list(
	UPGRADE_BULK = 2,
	UPGRADE_MAXUPGRADES = 3
	)
	I.removal_time *= 20
	I.gun_loc_tag = GUN_KNIFE //No stacking a melee with this
	I.prefix = "custom"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)

/obj/item/tool_upgrade/augment/spikes
	name = "spikes"
	icon_state = "spike"
	desc = "An array of sharp bits of steel, seemingly adapted for easy affixing to a tool. Would make it into a better weapon, but won't do much for productivity. Alternatively you could slap it on the end of a gun barrel as a ghetto bayonet at the cost of some accuracy."
	matter = list(MATERIAL_STEEL = 2)
	preloaded_reagents = list("iron" = 9)
	price_tag = 10

/obj/item/tool_upgrade/augment/spikes/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_FORCE_MOD = 4,
	UPGRADE_PRECISION = -5,
	UPGRADE_DEGRADATION_MULT = 1.15,
	UPGRADE_WORKSPEED = -0.15,
	UPGRADE_SHARP = TRUE
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_MELEE_DAMAGE = 1.2,
		GUN_UPGRADE_RECOIL = 1.1,
		UPGRADE_BULK = 1
	)
	I.gun_loc_tag = GUN_KNIFE
	I.prefix = "spiked"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)

/obj/item/tool_upgrade/augment/sanctifier
	name = "sanctifier"
	icon_state = "sanctifier"
	desc = "Recommended for crusades against mutants, wild life, and heretics. Does this device actually make a better weapon or is it something else? Regardless, it makes one more thoughtful during labor."
	matter = list(MATERIAL_BIOMATTER = 3, MATERIAL_PLASTEEL = 2)
	price_tag = 20

/obj/item/tool_upgrade/augment/sanctifier/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_SANCTIFY = TRUE,
	UPGRADE_FORCE_MULT = 1.25,
	UPGRADE_PRECISION = 10,
	UPGRADE_DEGRADATION_MULT = 0.8,
	UPGRADE_WORKSPEED = -0.5
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 0.8,
	GUN_UPGRADE_FIRE_DELAY_MULT = 1.2,
	GUN_UPGRADE_MOVE_DELAY_MULT = 1.2,
	GUN_UPGRADE_CHARGECOST = 0.8
	)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "sanctified"
	I.req_fuel_cell = REQ_FUEL_OR_CELL

/*
/obj/item/tool_upgrade/augment/sanctifier_plus
	name = "overclocked sanctifier"
	icon_state = "sanctifier_plus"
	desc = "Recommended for crusades against mutants, wild life, and heretics. Does this device actually make a better weapon or is it something else? Regardless, it makes one more thoughtful during labor. \
	This one has been overclocked by members of the factortial path, increasing both its benefits and its drawbacks."
	matter = list(MATERIAL_BIOMATTER = 3, MATERIAL_PLASTEEL = 2)
	price_tag = 20

/obj/item/tool_upgrade/augment/sanctifier_plus/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_SANCTIFY = TRUE,
	UPGRADE_FORCE_MOD = 12,
	UPGRADE_PRECISION = 15,
	UPGRADE_DEGRADATION_MULT = 0.7,
	UPGRADE_WORKSPEED = -0.75
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 0.6,
	GUN_UPGRADE_FIRE_DELAY_MULT = 1.3,
	GUN_UPGRADE_MOVE_DELAY_MULT = 1.3,
	GUN_UPGRADE_CHARGECOST = 0.7
	)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "over sanctified"
	I.req_fuel_cell = REQ_FUEL_OR_CELL
*/

/obj/item/tool_upgrade/augment/holy_oils
	name = "holy oils"
	icon_state = "oils" //yes it's a recoloured teapot
	desc = "Oils of unknown composition, used by Factorials to anoint both tools and weapons. Applied properly, they can render a tool more efficient - but require the user to take their time when using it."
	matter = list(MATERIAL_BIOMATTER = 10)
	price_tag = 20

/obj/item/tool_upgrade/augment/holy_oils/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_SANCTIFY = TRUE,
	UPGRADE_FORCE_MULT = 1.3,
	UPGRADE_PRECISION = 10,
	UPGRADE_DEGRADATION_MULT = 0.8,
	UPGRADE_WORKSPEED = -0.5
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 0.8,
	GUN_UPGRADE_FIRE_DELAY_MULT = 1.2,
	GUN_UPGRADE_MOVE_DELAY_MULT = 1.2,
	GUN_UPGRADE_CHARGECOST = 0.8
	)
	I.gun_loc_tag = GUN_MECHANISM
	I.prefix = "blessed"

/obj/item/tool_upgrade/augment/crusader_seal
	name = "righteous seal"
	desc = "A runic seal that interfaces with a weapon in unclear ways, but which enhances its deadliness at the cost of heightened power drain. Often given as a reward to those who risk their safety in the name of the Absolute."
	icon_state = "seal"
	matter = list(MATERIAL_BIOMATTER = 3, MATERIAL_PLASTEEL = 1, MATERIAL_GOLD = 1, MATERIAL_GLASS = 1)
	price_tag = 160

/obj/item/tool_upgrade/augment/crusader_seal/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
		UPGRADE_FORCE_MULT = 1.1,
		UPGRADE_FUELCOST_MULT = 1.25
	)
	I.weapon_upgrades = list(
		GUN_UPGRADE_DAMAGE_MULT = 1.1,
		GUN_UPGRADE_CHARGECOST = 1.25,
		UPGRADE_BULK = 0.5,
		)
	I.prefix = "righteous"

/*
/obj/item/tool_upgrade/augment/hammer_addon
	name = "flat surface"
	icon_state = "hammer_addon"
	desc = "A attachment that fits on almost everything to create a simple flat surface for hammering."
	matter = list(MATERIAL_PLASTEEL = 3, MATERIAL_STEEL = 2)

/obj/item/tool_upgrade/augment/hammer_addon/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = -0.5,
	UPGRADE_HEALTH_THRESHOLD = 5,
	tool_qualities = list(QUALITY_HAMMERING = 10)
	)
	I.prefix = "flattened"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)
*/

//Vastly reduces tool sounds, for stealthy hacking
/obj/item/tool_upgrade/augment/dampener
	name = "aural dampener"
	desc = "This aural dampener is a cutting edge tool attachment which mostly nullifies sound waves within a tiny radius. It minimises the noise created during use, perfect for stealth operations."
	icon_state = "dampener"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_PLASTEEL = 1, MATERIAL_PLATINUM = 1)
	preloaded_reagents = list("mercury" = 20, "lithium" = 15, "iron" = 3)
	price_tag = 155

/obj/item/tool_upgrade/augment/dampener/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_COLOR = "#AAAAAA",
	UPGRADE_DEGRADATION_MULT = 1.1,
	UPGRADE_ITEMFLAGPLUS = SILENT
	)
	I.prefix = "silenced"
	I.required_qualities = list(QUALITY_BOLT_TURNING, QUALITY_PULSING, QUALITY_PRYING, QUALITY_WELDING, QUALITY_SCREW_DRIVING, QUALITY_WIRE_CUTTING, QUALITY_SHOVELING, QUALITY_DIGGING, QUALITY_EXCAVATION, QUALITY_CLAMPING, QUALITY_CAUTERIZING, QUALITY_RETRACTING, QUALITY_DRILLING, QUALITY_HAMMERING, QUALITY_SAWING, QUALITY_CUTTING)

/obj/item/tool_upgrade/augment/ai_tool
	name = "nanointegrated AI"
	desc = "A forgotten Greyson Positronic tech. Due to its unique installation method of \"slapping it hard enough onto anything should do the trick\", it is highly sought after. \
		A powerful AI will integrate itself into this tool with the aid of nanotechnology and improve it in every way possible. Once added its embeding into the object making it a permanent integration."
	icon_state = "ai_tool"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_PLASTEEL = 3, MATERIAL_PLATINUM = 3, MATERIAL_GOLD = 3, MATERIAL_DIAMOND = 1)
	price_tag = 725
	can_remove = FALSE

/obj/item/tool_upgrade/augment/ai_tool/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_POWERCOST_MULT = 1.20,
	UPGRADE_PRECISION = 12,
	UPGRADE_WORKSPEED = 3,
	UPGRADE_ALLOW_GREYON_MODS = TRUE,
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_ALLOW_GREYON_MODS = TRUE,
	GUN_UPGRADE_RECOIL = 0.8,
	GUN_UPGRADE_DAMAGE_BASE = 0.2,
	GUN_UPGRADE_PEN_MULT = 1.1,
	GUN_UPGRADE_FIRE_DELAY_MULT = 0.8,
	GUN_UPGRADE_MOVE_DELAY_MULT = 0.8,
	GUN_UPGRADE_MUZZLEFLASH = 0.8,
	GUN_UPGRADE_CHARGECOST = 0.8,
	GUN_UPGRADE_OVERCHARGE_MAX = 0.8,
	GUN_UPGRADE_OVERCHARGE_RATE = 1.2
	)
	I.prefix = "intelligent"
	I.req_fuel_cell = REQ_CELL
	I.greyson_moding = TRUE

/obj/item/tool_upgrade/augment/ai_tool_excelsior
	name = "excelsior nanointegrated AI"
	desc = "An attempt by the excelsior to copy the superior Greyson nano-AI for their weaponry. It isn't nearly as good, but its cheaper to produce and can fit any tool, not just energy based, as it draws its power from excelsior teleporation technology.\
	 Once added its embeding into the object making it a permanent integration."
	icon_state = "ai_tool_excelsior"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_PLASTEEL = 3, MATERIAL_GOLD = 3)
	price_tag = 325 //freee markeetttt
	can_remove = FALSE

/obj/item/tool_upgrade/augment/ai_tool_excelsior/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_POWERCOST_MULT = 1.10,
	UPGRADE_PRECISION = 7,
	UPGRADE_WORKSPEED = 7
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = 0.9,
	GUN_UPGRADE_DAMAGE_MULT = 1.1,
	GUN_UPGRADE_PEN_MULT = 1.1,
	GUN_UPGRADE_FIRE_DELAY_MULT = 0.9,
	GUN_UPGRADE_MOVE_DELAY_MULT = 0.9,
	GUN_UPGRADE_MUZZLEFLASH = 0.9,
	GUN_UPGRADE_CHARGECOST = 0.9,
	GUN_UPGRADE_OVERCHARGE_MAX = 0.9,
	GUN_UPGRADE_OVERCHARGE_RATE = 1.1
	)
	I.prefix = "collective"

/obj/item/tool_upgrade/augment/repair_nano
	name = "repair nano"
	desc = "Very rare tool mod from Greyson powered by their nanomachines. It repairs the tool while in use and makes it near unbreakable."
	icon_state = "repair_nano"
	matter = list(MATERIAL_PLASTIC = 1, MATERIAL_PLASTEEL = 1, MATERIAL_PLATINUM = 1)
	price_tag = 325

/obj/item/tool_upgrade/augment/repair_nano/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = 0.01,
	UPGRADE_HEALTH_THRESHOLD = 10
	)
	I.greyson_moding = TRUE
	I.req_fuel_cell = REQ_FUEL_OR_CELL
	I.prefix = "self-repairing"

/obj/item/tool_upgrade/augment/hydraulic
	name = "hydraulic circuits"
	desc = "A complex set of hydraulic circuits that can be installed on a tool to greatly improve its functions. It's loud as hell though so do not plan on being stealthy."
	icon_state = "hydraulic"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTEEL = 3, MATERIAL_PLASTIC = 3)
	price_tag = 175

/obj/item/tool_upgrade/augment/hydraulic/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_WORKSPEED = 0.5,
	UPGRADE_PRECISION = 5,
	UPGRADE_DEGRADATION_MULT = 1.5,
	UPGRADE_FUELCOST_MULT = 1.5,
	UPGRADE_POWERCOST_MULT = 1.5,
	UPGRADE_ITEMFLAGPLUS = LOUD
	)
	I.prefix = "hydraulic"
	I.req_fuel_cell = REQ_FUEL_OR_CELL

// Randomizes a bunch of weapon stats on application - stats are set on creation of the item to prevent people from re-rolling until they get what they want
/obj/item/tool_upgrade/augment/randomizer
	name = "BSL \"Randomizer\" tool polish"
	desc = "This unidentified tar-like stable liquid warps and bends reality around it. Applying it to a tool may have unexpected results."
	icon_state = "randomizer"
	matter = list(MATERIAL_PLASMA = 4, MATERIAL_URANIUM = 4)
	price_tag = 100

/obj/item/tool_upgrade/augment/randomizer/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = rand(-1,10),
	UPGRADE_WORKSPEED = rand(-1,3),
	UPGRADE_PRECISION = rand(-20,20),
	UPGRADE_FORCE_MOD = rand(-10,10),
	UPGRADE_BULK = rand(-1,2),
	UPGRADE_COLOR = "#3366ff"
	)
	I.prefix = "theoretical"
	bluespace_entropy(1, get_turf(src))

/obj/item/tool_upgrade/artwork_tool_mod
	name = "Weird Revolver"
	desc = "This is an artistically-made tool mod."
	icon_state = "artmod_1"
	price_tag = 200

/obj/item/tool_upgrade/artwork_tool_mod/New()
	..()
	name = get_weapon_name(capitalize = TRUE)
	icon_state = "artmod_[rand(1,16)]"
	price_tag += rand(100, 3000)

	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_DEGRADATION_MULT = rand(-2.1,1.5),
	UPGRADE_WORKSPEED = rand(-1.1,3.5),
	UPGRADE_PRECISION = rand(-3,15),
	UPGRADE_FORCE_MOD = rand(-2,5),
	UPGRADE_BULK = rand(-1,1)
	)
	I.weapon_upgrades = list(
	GUN_UPGRADE_RECOIL = pick(1.2,1.1,0,0.9,0.8),
	GUN_UPGRADE_DAMAGE_MULT = pick(1.2,1.1,0,0.9,0.8),
	GUN_UPGRADE_PEN_MULT = pick(1.2,1.1,0,0.9,0.8),
	GUN_UPGRADE_FIRE_DELAY_MULT = pick(1.2,1.1,0,0.9,0.8),
	GUN_UPGRADE_MOVE_DELAY_MULT = pick(1.2,1.1,0,0.9,0.8),
	GUN_UPGRADE_MUZZLEFLASH = pick(1.2,1.1,0,0.9,0.8),
	GUN_UPGRADE_CHARGECOST = pick(1.2,1.1,0,0.9,0.8),
	GUN_UPGRADE_OVERCHARGE_MAX = pick(1.2,1.1,0,0.9,0.8),
	GUN_UPGRADE_OVERCHARGE_RATE = pick(1.2,1.1,0,0.9,0.8)
	)
	I.prefix = "artistic"
