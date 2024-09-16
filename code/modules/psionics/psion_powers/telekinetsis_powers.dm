
/mob/living/carbon/human/proc/telekineticprowress()
	set category = "Psionic powers"
	set name = "Telekinetic Prowess (1)"
	set desc = "Expend a single point of your psi essence to gain telekinesis. Lasts indefinitely unless a genetics lab or you yourself willingly end it."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(user, "Your psionic attunement allows you to bypass fully using your essence.")
		psi_point_cost = 0

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if (!(TK in user.mutations)) // We can't get TK if we already have TK
			user.mutations.Add(TK)
			to_chat(user, "You feel your abilities expanding, your mind growing outward, allowing you to manipulate and move objects with your mind.")
		else
			to_chat(user, "You already have telekinesis.")

/mob/living/carbon/human/proc/telekineticprowress_end()
	set category = "Psionic powers"
	set name = "End Telekinesis (0)"
	set desc = "End your telekinesis at will, at no essence cost. Beware, you will need to expend more to get telekinesis back."
	var/psi_point_cost = 0
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost)) //No possibility check; this is just stopping a power that's in process
		if((TK in user.mutations)) // We can't remove TK if we don't already have TK
			user.mutations.Remove(TK)
			to_chat(user, "You feel your telekinetic powers becoming dormant as your mind withdraws into itself, for now.")
		else
			to_chat(user, "You do not have telekinesis.")
