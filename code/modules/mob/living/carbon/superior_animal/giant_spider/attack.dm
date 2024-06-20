/mob/living/carbon/superior_animal/giant_spider/UnarmedAttack(atom/A, proximity)
	. = ..()
	if(!.)
		return

	if(poison_per_bite > 0)

		if(isliving(A))
			var/mob/living/L = A
			if(istype(L) && L.reagents)
				var/zone_armor =  L.getarmor(targeted_organ, ARMOR_MELEE)
				var/poison_injected = zone_armor ? poison_per_bite * (-0.01 * (zone_armor * 25) + 1) : poison_per_bite //the 25x multiplier on zone armor is due to armor divisor changes reducing armor numbers by 3/4ths due to how it works. this will fix it for now.
				L.reagents.add_reagent(poison_type, poison_injected)
