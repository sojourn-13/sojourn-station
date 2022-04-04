/mob/living/carbon/superior_animal/psi_monster/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && L.reagents)
			L.reagents.add_reagent(poison_type, poison_per_bite)
	alpha = 255


/mob/living/carbon/superior_animal/psi_monster/pus_maggot/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(75))
			var/damage = rand(melee_damage_lower, melee_damage_upper)
			L.damage_through_armor(damage, BURN)
			playsound(src, burn_attack_sound, 50, 1, -3)
			L.visible_message(SPAN_DANGER(burn_attack_text))

/mob/living/carbon/superior_animal/psi_monster/dreaming_king/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L))
			shake_camera(L, 3, 1)