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

/mob/living/carbon/superior/vox/mob_reload()
	..()

	//Litterly the worst code ive ever done for a simple icon tweaking, like idk how real games do this
	var/icon_mover = 1
	for(var/mob/living/carbon/superior/vox/thrower_spear/trained/T in oview(3, src))

		var/image/I = image(icon ='icons/mob/battle_overlays.dmi', icon_state = "ammo_up")
		I.alpha /= icon_mover
		I.pixel_y = -icon_mover
		add_overlay(I)
		addtimer(CALLBACK(src, TYPE_PROC_REF(/atom, cut_overlay), I), 20 - icon_mover)
		icon_mover += 1

		rounds_left += 2 //Torn Bandolier, once per Ciriklo
