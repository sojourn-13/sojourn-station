/obj/item/organ_module/sanguin_stash
	name = "Sanguin-Stash"
	//TLDR: gives more blood max volume + if you install this willy nilly you can give someone low blood issues
	desc = "Connected to femoral artery, this small blood pouch allows for the storing of additional blood. \
	It comes printed with a few warning lables about people with low blood flow needing a transfusion after installation."
	matter = list(MATERIAL_PLASTIC = 12, MATERIAL_GLASS = 5)
	allowed_organs = list(BP_GROIN)
	icon_state = "blood_sack"

/obj/item/organ_module/sanguin_stash/onInstall(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.vessel.maximum_volume  += 100

/obj/item/organ_module/sanguin_stash/onRemove(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.vessel.maximum_volume  -= 100