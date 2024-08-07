/obj/item/organ_module/snack_system
	name = "S.N.A.C.K System"
	desc = "The Storage Nutrience: Advanced Cal Keeper, a state of the art addition to the large intestant track, \
	both as a helper prevent nutrition loss and store a bunch of healthy nutrition. The designs are credited to two SI students."
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