/obj/item/weapon/tool/bonesetter
	name = "bone setter"
	icon_state = "bone setter"
	throw_speed = 3
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_STEEL = 4)
	attack_verb = list("attacked", "hit", "bludgeoned")
	tool_qualities = list(QUALITY_BONE_SETTING = 30)

/obj/item/weapon/tool/bonesetter/adv
	name = "clamp bone setter"
	desc = "A more powerful yet still rather small bone clamp tool."
	icon_state = "bone setter"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_STEEL = 6, MATERIAL_GLASS = 3)
	tool_qualities = list(QUALITY_BONE_SETTING = 50)
	degradation = 0.75
