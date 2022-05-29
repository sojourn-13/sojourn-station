/mob/living/carbon/superior_animal/giant_spider/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()
	if(!.)
		return

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && L.reagents)
			var/poison_injected = L.can_inject(src) ? poison_per_bite * 0.6 : poison_per_bite
			L.reagents.add_reagent(poison_type, poison_per_bite)
