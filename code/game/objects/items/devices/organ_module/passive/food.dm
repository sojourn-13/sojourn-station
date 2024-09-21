/obj/item/organ_module/snack_system
	name = "S.N.A.C.K System"
	desc = "The Storage Nutrient: Advanced Calorie Keeper. A state of the art implant that is attached to the large intenstine. \
	Aids in banking additional nutrients in human body as well as aiding in efficient distribution, this design is credited to two aspiring SI Studens."
	matter = list(MATERIAL_WOOD = 1, MATERIAL_PLASTIC = 12, MATERIAL_GLASS = 5, MATERIAL_SILVER = 1)
	allowed_organs = list(BP_GROIN)
	icon_state = "fluid_sack"

/obj/item/organ_module/snack_system/onInstall(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.nutrition += 100
		H.total_nutriment_req  *= 0.5

/obj/item/organ_module/snack_system/onRemove(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.nutrition -= 100
		H.total_nutriment_req *= 2
