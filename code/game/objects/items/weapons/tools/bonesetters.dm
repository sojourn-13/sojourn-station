/obj/item/tool/bonesetter
	name = "bone setter"
	icon_state = "bone_setter"
	item_state = "bone_setter"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_STEEL = 4)
	price_tag = 40
	flags = CONDUCT
	attack_verb = list("attacked", "hit", "bludgeoned")
	tool_qualities = list(QUALITY_BONE_SETTING = 35)

/obj/item/tool/bonesetter/adv
	name = "clamp bone setter"
	desc = "An advanced bone clamping tool, allows for more precise settling of bones with less wrist force required."
	icon_state = "bone_setter_adv"
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_STEEL = 6, MATERIAL_GLASS = 3, MATERIAL_PLASTEEL = 1)
	tool_qualities = list(QUALITY_BONE_SETTING = 60)
	degradation = 0.75
	price_tag = 240

/obj/item/tool/bonesetter/adv/si
	icon_state = "bone_setter_SI"
