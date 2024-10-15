/obj/item/organ_module/momentum_speed_adder
	name = "Momentum Spring Relay Leg Agument" //msrla
	desc = "An experimental augment to help soldiers, assassins, and with parkour. \
	The set of springs and tubes helps with mainly diving and gathering momentum while moving, as well as helping with climbing."
	allowed_organs = list(BP_R_LEG, BP_L_LEG)
	icon_state = "springs"
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 9)


/obj/item/organ_module/momentum_speed_adder/onInstall(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.momentum_speed_adder += 1
		H.mod_climb_delay -= 0.15

/obj/item/organ_module/momentum_speed_adder/onRemove(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.momentum_speed_adder -= 1
		H.mod_climb_delay += 0.15