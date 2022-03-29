// Custom arm augment, allow the user to insert/remove any item.
/obj/item/organ_module/active/simple/custom
	name = "embedded object"
	desc = "A device that can take any object, and allow the person to quickly deploy it."
	verb_name = "Deploy object"
	icon_state = "multitool"
	matter = list(MATERIAL_STEEL = 20)
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	holding_type = null
	price_tag = 200 //Just some metal

/obj/item/organ_module/active/simple/custom/attackby(var/obj/item/O, var/mob/user)
	if(!holding) // Do we have an item inserted?
		insert_item(O, user)
		holding = O
	else
		..()

/obj/item/organ_module/active/simple/custom/MouseDrop(atom/over_object)
	if(holding)
		eject_item(holding, usr)
		holding = null
	else
		..()
