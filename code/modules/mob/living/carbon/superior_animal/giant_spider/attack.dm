/mob/living/carbon/superior_animal/giant_spider/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()
	if(!.)
		return

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && L.reagents)
			var/poison_injected = poison_per_bite * (-100 * L.getarmor(targeted_organ, ARMOR_MELEE) + 100)
			L.reagents.add_reagent(poison_type, poison_per_bite)
