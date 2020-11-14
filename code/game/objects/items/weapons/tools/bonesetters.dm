/obj/item/weapon/tool/bonesetter
	name = "bone setter"
	icon_state = "bone setter"
	item_state = "bone_setter"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_STEEL = 4)
	flags = CONDUCT
	attack_verb = list("attacked", "hit", "bludgeoned")
	tool_qualities = list(QUALITY_BONE_SETTING = 30)

/obj/item/weapon/tool/bonesetter/adv
	name = "clamp bone setter"
	desc = "An advanced bone clamping tool, allows for more precise settling of bones with less wrist force required."
	icon_state = "bone setter"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_STEEL = 6, MATERIAL_GLASS = 3)
	tool_qualities = list(QUALITY_BONE_SETTING = 50)
	degradation = 0.75
