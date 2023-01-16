
/obj/item/organ/internal/psionic_tumor/proc/telekineticprowress()
	set category = "Psionic powers"
	set name = "Telekinetic Prowess (1)"
	set desc = "Expend a single point of your psi essence to gain telekinesis. Lasts indefinitely unless a genetics lab or you yourself willingly end it."
	psi_point_cost = 1

	if(owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(owner, "Your psionic attunement allows you to bypass fully using your essence.")
		psi_point_cost = 0

	if(pay_power_cost(psi_point_cost))
		if (!(TK in owner.mutations)) // We can't get TK if we already have TK
			owner.mutations.Add(TK)
			to_chat(owner, "You feel your abilities expanding, your mind growing outward, allowing you to manipulate and move objects with your mind.")
		else
			to_chat(owner, "You already have telekinesis.")

/obj/item/organ/internal/psionic_tumor/proc/telekineticprowress_end()
	set category = "Psionic powers"
	set name = "End Telekinesis (0)"
	set desc = "End your telekinesis at will, at no essence cost. Beware, you will need to expend more to get telekinesis back."
	psi_point_cost = 0

	if(pay_power_cost(psi_point_cost))
		if((TK in owner.mutations)) // We can't remove TK if we don't already have TK
			owner.mutations.Remove(TK)
			to_chat(owner, "You feel your telekinetic powers becoming dormant as your mind withdraws into itself, for now.")
		else
			to_chat(owner, "You do not have telekinesis.")
