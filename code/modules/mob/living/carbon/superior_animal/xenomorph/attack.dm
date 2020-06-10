/mob/living/carbon/superior_animal/xenomorph/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && L.reagents)
			L.reagents.add_reagent(poison_type, poison_per_bite)

/mob/living/carbon/superior_animal/xenomorph/warrior/bull/UnarmedAttack(var/atom/A, var/proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && !L.weakened && prob(15))
			L.Weaken(3)
			L.visible_message(SPAN_DANGER("\the [src] knocks down \the [L]!"))

	. = ..()

/mob/living/carbon/superior_animal/xenomorph/spitter/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(50))
			var/damage = rand(melee_damage_lower, melee_damage_upper)
			L.damage_through_armor(damage, TOX)
			playsound(src, 'sound/xenomorph/alien_help1.ogg', 30, 1, -3)
			L.visible_message(SPAN_DANGER("\the [src] vomits up some toxic bile all over \the [L]!"))