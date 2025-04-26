//todo: Basiclly taming for roaches but with discount monkeys

/mob/living/carbon/superior/vox/doTargetMessage()
	. = ..()

	playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)

/mob/living/carbon/superior/vox/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && !L.weakened && prob(knock_over_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			L.Weaken(3)
			L.visible_message(SPAN_DANGER("\the [src] knocks down \the [L]!"))

	. = ..()

/mob/living/carbon/superior/vox/handle_ammo_check()
	if(!limited_ammo)
		return //Quick return

	for(var/mob/living/carbon/superior/vox/thrower_spear/trained/T in oview(3))
		if(T)
			return //Reload off are ally

	rounds_left -= rounds_per_fire //modular, tho likely will always be one
	if(rounds_left <= 0 && mags_left >= 1) //If were out of ammo and can reload
		mob_reload()
	if(rounds_left <= 0 && mags_left <= 0) //If were out of ammo and can't reload
		ranged = FALSE
		rapid = FALSE
