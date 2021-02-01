/obj/item/weapon/tool/cautery
	name = "cautery"
	desc = "This stops bleeding."
	icon_state = "cautery"
	item_state = "cautery"
	matter = list(MATERIAL_STEEL = 5, MATERIAL_GLASS = 2)
	flags = CONDUCT
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 1)
	attack_verb = list("burnt")
	tool_qualities = list(QUALITY_CAUTERIZING = 30)

/obj/item/weapon/tool/cautery/adv
	name = "high powered cautery"
	desc = "A Cautery with self-regulating heat transfer capabilities, allows for quicker and more precise cauterization of surgical incisions."
	matter = list(MATERIAL_STEEL = 12, MATERIAL_GLASS = 4)
	origin_tech = list(TECH_MATERIAL = 1, TECH_BIO = 2)
	tool_qualities = list(QUALITY_CAUTERIZING = 50)
