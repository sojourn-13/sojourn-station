/mob/living/carbon/superior_animal/xenomorph/UnarmedAttack(atom/A, proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && L.reagents)
			L.reagents.add_reagent(poison_type, poison_per_bite)

/mob/living/carbon/superior_animal/xenomorph/warrior/bull/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && !L.weakened && prob(15))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			L.Weaken(3)
			L.visible_message(SPAN_DANGER("\the [src] knocks down \the [L]!"))

	. = ..()

/mob/living/carbon/superior_animal/xenomorph/warrior/bull/crusher/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && !L.weakened && prob(30))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			L.Weaken(8)
			L.visible_message(SPAN_DANGER("\the [src] rams \the [L] off there feet!"))

	. = ..()

/mob/living/carbon/superior_animal/xenomorph/spitter/UnarmedAttack(atom/A, proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(50))
			var/damage = rand(4, 6)
			L.damage_through_armor(damage, TOX)
			playsound(src, 'sound/xenomorph/alien_help1.ogg', 50, 1, -3)
			L.visible_message(SPAN_DANGER("\the [src] vomits up some toxic bile all over \the [L]!"))
