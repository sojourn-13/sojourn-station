/mob/living/carbon/superior_animal/xenomorph/doTargetMessage()
	. = ..()

	playsound(loc, list('sound/xenomorph/alien_growl1.ogg', 'sound/xenomorph/alien_growl2.ogg', 'sound/xenomorph/alien_growl3.ogg', 'sound/xenomorph/alien_hiss1.ogg', 'sound/xenomorph/alien_hiss2.ogg', 'sound/xenomorph/alien_hiss3.ogg'), 120, 1)

/mob/living/carbon/superior_animal/xenomorph/death(gibbed,message = deathmessage)
	if (stat != DEAD)
		target_mob = null
		stance = initial(stance)
		stop_automated_movement = initial(stop_automated_movement)
		SSmove_manager.stop_looping(src)
		playsound(loc, list('sound/xenomorph/alien_death.ogg', 'sound/xenomorph/alien_death2.ogg', 'sound/xenomorph/alien_help1.ogg'), 120, 1)

		density = FALSE
		layer = LYING_MOB_LAYER

	. = ..()

/mob/living/carbon/superior_animal/xenomorph/spitter/boiler/death(gibbed,message = deathmessage)
	if (stat != DEAD)
		target_mob = null
		stance = initial(stance)
		stop_automated_movement = initial(stop_automated_movement)
		SSmove_manager.stop_looping(src)
		playsound(loc, list('sound/xenomorph/alien_death.ogg', 'sound/xenomorph/alien_death2.ogg', 'sound/xenomorph/alien_help1.ogg'))
		explosion(loc, 0,1,3)

		density = FALSE
		layer = LYING_MOB_LAYER

	. = ..()

/mob/living/carbon/superior_animal/xenomorph/gib(anim = icon_gib, do_gibs = 1)
	if (!anim)
		anim = FALSE

	for(var/obj/item/I in src)
		drop_from_inventory(I)
		I.throw_at(get_edge_target_turf(src,pick(alldirs)), rand(1,3), round(30/I.w_class))

	for(var/obj/item/I in src)
		drop_from_inventory(I)
		I.throw_at(get_edge_target_turf(src,pick(alldirs)), rand(1,3), round(30/I.w_class))

	playsound(loc, 'sound/effects/splat.ogg', max(10,min(50,maxHealth)), 1)
	. = ..(anim,do_gibs)

