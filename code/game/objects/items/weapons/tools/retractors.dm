/obj/item/weapon/tool/retractor
	name = "retractor"
	desc = "Retracts stuff."
	icon_state = "retractor"
	matter = list(MATERIAL_STEEL = 2)
	flags = CONDUCT
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	tool_qualities = list(QUALITY_RETRACTING = 30)

/obj/item/weapon/tool/retractor/adv
	name = "extended retractor"
	desc = "Retracts with greater force and length then normal."
	matter = list(MATERIAL_STEEL = 8)
	tool_qualities = list(QUALITY_RETRACTING = 60)
