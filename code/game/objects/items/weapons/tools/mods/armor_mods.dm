
//Armor mods
/obj/item/tool_upgrade/armor/melee
	name = "melee plating"
	desc = "A sturdy bit of plasteel that can be bolted onto any armor to enhance its melee resistance."
	icon_state = "melee"
	matter = list(MATERIAL_STEEL = 30)
	price_tag = 275

/obj/item/tool_upgrade/armor/melee/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_MELEE_ARMOR = 5
	)
	I.prefix = "reinforced"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/tool_upgrade/armor/bullet
	name = "ballistic plating"
	desc = "A sturdy bit of plasteel that can be bolted onto any armor to enhance its ballistic resistance."
	icon_state = "bullet"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 10)
	price_tag = 750

/obj/item/tool_upgrade/armor/bullet/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BALLISTIC_ARMOR = 5
	)
	I.prefix = "kevlar-plated"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/tool_upgrade/armor/energy
	name = "energy plating"
	desc = "A sturdy bit of plasteel that can be bolted onto any armor to enhance its energy resistance."
	icon_state = "energy"
	matter = list(MATERIAL_PLATINUM = 3, MATERIAL_PLASTIC = 12)
	price_tag = 1000

/obj/item/tool_upgrade/armor/energy/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_ENERGY_ARMOR = 5
	)
	I.prefix = "ablative-plated"
	I.required_qualities = list(QUALITY_ARMOR)

/obj/item/tool_upgrade/armor/bomb
	name = "bomb proofing"
	desc = "A sturdy bit of plasteel that can be bolted onto any armor to enhance its bomb resistance."
	icon_state = "bomb"
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 20)
	price_tag = 450

/obj/item/tool_upgrade/armor/bomb/New()
	..()
	var/datum/component/item_upgrade/I = AddComponent(/datum/component/item_upgrade)
	I.tool_upgrades = list(
	UPGRADE_BOMB_ARMOR = 10
	)
	I.prefix = "bomb-proofed"
	I.required_qualities = list(QUALITY_ARMOR)
