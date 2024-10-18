/obj/item/organ_module/punch_helper
	name = "Punch Helper Melee Brace" //PHMB
	desc = "A design that grafts itself on top of the bone in a person’s hand increasing the force of physical punches."
	allowed_organs = list(BP_R_ARM, BP_L_ARM)
	//Dont want these to be free
	matter = list(MATERIAL_PLASTEEL = 6, MATERIAL_PLATINUM = 2,  MATERIAL_DIAMOND = 1)
	icon_state = "punch_helper"


//Rather strong as they are stack with knuckle dusters and stats so we dont want to get tooo crazy
//If both added they deal an extra 16 damage by themselfs combo with knuckle dusters leading to punch additions of +31! Crazy!
/obj/item/organ_module/punch_helper/onInstall(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.punch_damage_increase += 8

/obj/item/organ_module/punch_helper/onRemove(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.punch_damage_increase -= 8