/obj/item/organ_module/active/simple/taser
	name = "embedded taser"
	desc = "A taser designed to be inserted into an arm. Gives you a nice advantage in a brawl."
	verb_name = "Deploy taser"
	icon_state = "taser"
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 3)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/gun/energy/taser
	price_tag = 1385

/obj/item/organ_module/active/simple/taser/blackshield
	holding_type = /obj/item/gun/energy/taser/blackshield
