/obj/item/organ_module/active/simple/surgical
	name = "embedded surgical multitool"
	desc = "An all-in-one medical tool implant based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels, and requires a power cell."
	verb_name = "Deploy surgical omnitool"
	icon_state = "medimplant"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/weapon/tool/medmultitool/medimplant

/obj/item/organ_module/active/simple/surgical/organic
	name = "embedded organic surgical multitool"
	desc = "An all-in-one medical tool implant based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels. This version is made of entirely organic materials and doesn't require a power cell, sadly it cannot be upgraded and works slower, but at least it is self repairing."
	verb_name = "Deploy organic surgical omnitool"
	icon_state = "organicmedimplant"
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = /obj/item/weapon/tool/medmultitool/medimplant/organic
	matter = list(MATERIAL_BIOMATTER = 10)