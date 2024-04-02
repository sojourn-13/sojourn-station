/obj/item/tool/retractor
	name = "retractor"
	desc = "Used to retract flesh and keep surgical incisions opened enough to perform all invasive surgical procedures on a patient."
	icon_state = "retractor"
	matter = list(MATERIAL_STEEL = 2)
	flags = CONDUCT
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	tool_qualities = list(QUALITY_RETRACTING = 35)
	price_tag = 35

/obj/item/tool/retractor/adv
	name = "extended retractor"
	icon_state = "retractor_adv"
	desc = "Retracts surgical incisions with greater precision and speed than normal."
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTEEL = 1)
	tool_qualities = list(QUALITY_RETRACTING = 60)
	price_tag = 210

/obj/item/tool/retractor/adv/si
	icon_state = "retractor_SI"
