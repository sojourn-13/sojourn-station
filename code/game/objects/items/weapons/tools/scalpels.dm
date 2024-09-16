/obj/item/tool/scalpel
	name = "scalpel"
	desc = "Cut, cut, and once more cut."
	icon_state = "scalpel_t3"
	flags = CONDUCT
	force = WEAPON_FORCE_PAINFUL
	armor_divisor = ARMOR_PEN_SHALLOW
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_TINY
	worksound = WORKSOUND_HARD_SLASH
	slot_flags = SLOT_EARS
	throw_speed = WEAPON_FORCE_WEAK
	max_health = 100
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	matter = list(MATERIAL_STEEL = 4)
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	tool_qualities = list(QUALITY_CUTTING = 35, QUALITY_WIRE_CUTTING = 10)
	price_tag = 45

/obj/item/tool/scalpel/advanced
	name = "advanced scalpel"
	desc = "Made of more expensive materials, sharper and generally more reliable."
	icon_state = "scalpel_t4"
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 1)
	tool_qualities = list(QUALITY_CUTTING = 45, QUALITY_WIRE_CUTTING = 10)
	degradation = 0.12
	max_upgrades = 4
	price_tag = 300

/obj/item/tool/scalpel/advanced/si
	icon_state = "scalpel_t4_SI"

/obj/item/tool/scalpel/laser
	name = "laser scalpel"
	desc = "A scalpel augmented with a directed laser, for more precise cutting while instantly searing bleeding cuts through laser cauterization."
	icon_state = "scalpel_t5"
	damtype = BURN
	force = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_MODERATE
	matter = list(MATERIAL_PLASTEEL = 1, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 1)
	tool_qualities = list(QUALITY_CUTTING = 60, QUALITY_WIRE_CUTTING = 20, QUALITY_LASER_CUTTING = 60, QUALITY_CAUTERIZING = 20)
	degradation = 0.11
	use_power_cost = 0.12
	suitable_cell = /obj/item/cell/small
	max_upgrades = 4
	price_tag = 550

/obj/item/tool/scalpel/laser/si
	icon_state = "scalpel_t5_SI"
	use_power_cost = 0.1

/obj/item/tool/scalpel/laser/si/robo
	cell = /obj/item/cell/small/moebius/nuclear
	force = WEAPON_FORCE_NORMAL
	embed_mult = 0

//A makeshift knife, for doing all manner of cutting and stabbing tasks in a half-assed manner
/obj/item/tool/knife/shiv
	name = "shiv"
	desc = "A pointy piece of glass, abraded to an edge and wrapped in tape for a handle. Could become a decent tool or weapon with right tool mods."
	icon = 'icons/obj/tools.dmi'
	icon_state = "impro_shiv"
	worksound = WORKSOUND_HARD_SLASH
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	matter = list(MATERIAL_GLASS = 1)
	sharp = TRUE
	edge = TRUE
	force = WEAPON_FORCE_NORMAL
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	tool_qualities = list(QUALITY_CUTTING = 15, QUALITY_WIRE_CUTTING = 5, QUALITY_DRILLING = 5)
	degradation = 4 //Gets worse with use
	max_upgrades = 5 //all makeshift tools get more mods to make them actually viable for mid-late game
	price_tag = 1
