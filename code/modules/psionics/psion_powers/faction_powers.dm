
// Powers that affect the psionic users faction or faction of others

/obj/item/organ/internal/psionic_tumor/proc/nightmare_mind()
	set category = "Psionic powers"
	set name = "Nightmarish Mind (1)"
	set desc = "Expend a single psi point to realign your mind to that of nightmare stalkers, causing them to not react to your presence, even when you attack them. May have unforseen consequences."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		owner.faction = "stalker"
		usr.show_message("\blue How easy it would be, to peel back the skin, to see the flesh writhe and bleed as tendons were cut and viscera sliced out with your claws.")
