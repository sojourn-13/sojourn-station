
// Powers that affect the psionic users faction or faction of others

/mob/living/carbon/human/proc/nightmare_mind()
	set category = "Psionic powers.Ascension"
	set name = "Nightmarish Mind (1)"
	set desc = "Spend a single psi point to realign your mind to that of nightmare stalkers, causing them to not react to your presence, even when you attack them. May have unforseen consequences."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		user.faction = "stalker"
		usr.show_message("\blue How easy it would be, to peel back the skin, to see the flesh writhe and bleed as tendons were cut and viscera sliced out with your claws.")
