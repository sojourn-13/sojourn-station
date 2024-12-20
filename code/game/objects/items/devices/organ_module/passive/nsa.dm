/obj/item/organ_module/viv_bank
	name = "NSA Banker Implant"
	desc = "A small boxy implant that is attached to the connection point of the skull and the spine with series of small needle-like cables and electrodes, helping \
	regulate the intensity of the signals sent to and received from the brain."
	allowed_organs = list(BP_HEAD)
	icon_state = "viv_banker"

/obj/item/organ_module/viv_bank/onInstall(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.stats.changeStat(STAT_VIV, 30)
		H.stats.add_Stat_cap(STAT_VIV, 30)
		H.metabolism_effects.calculate_nsa()

/obj/item/organ_module/viv_bank/onRemove(obj/item/organ/external/E)
	if(ishuman(E.owner))
		var/mob/living/carbon/human/H = E.owner
		H.stats.changeStat(STAT_VIV, -30)
		H.stats.add_Stat_cap(STAT_VIV, -30)
		H.metabolism_effects.calculate_nsa()
