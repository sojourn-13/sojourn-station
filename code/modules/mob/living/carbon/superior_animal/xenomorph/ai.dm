/mob/living/carbon/superior_animal/xenomorph/findTarget()
	. = ..()
	if(.)
		//visible_emote("charges at [.]!") //commented out to reduce chat lag
		playsound(src.loc, list('sound/xenomorph/alien_growl1.ogg', 'sound/xenomorph/alien_growl2.ogg', 'sound/xenomorph/alien_growl3.ogg', 'sound/xenomorph/alien_hiss1.ogg', 'sound/xenomorph/alien_hiss2.ogg', 'sound/xenomorph/alien_hiss3.ogg'), 120, 1)

/mob/living/carbon/superior_animal/xenomorph/death(var/gibbed,var/message = deathmessage)
	if (stat != DEAD)
		target_mob = null
		stance = initial(stance)
		stop_automated_movement = initial(stop_automated_movement)
		walk(src, 0)
		playsound(src.loc, list('sound/xenomorph/alien_death.ogg', 'sound/xenomorph/alien_death2.ogg', 'sound/xenomorph/alien_help1.ogg'), 120, 1)

		density = 0
		layer = LYING_MOB_LAYER

	. = ..()

/mob/living/carbon/superior_animal/xenomorph/spitter/boiler/death(var/gibbed,var/message = deathmessage)
	if (stat != DEAD)
		target_mob = null
		stance = initial(stance)
		stop_automated_movement = initial(stop_automated_movement)
		walk(src, 0)
		playsound(src.loc, list('sound/xenomorph/alien_death.ogg', 'sound/xenomorph/alien_death2.ogg', 'sound/xenomorph/alien_help1.ogg'))
		explosion(src.loc, 0,1,3)

		density = 0
		layer = LYING_MOB_LAYER

	. = ..()

/mob/living/carbon/superior_animal/xenomorph/gib(var/anim = icon_gib, var/do_gibs = 1)
	if (!anim)
		anim = 0

	sleep(1)

	for(var/obj/item/I in src)
		drop_from_inventory(I)
		I.throw_at(get_edge_target_turf(src,pick(alldirs)), rand(1,3), round(30/I.w_class))

	for(var/obj/item/I in src)
		drop_from_inventory(I)
		I.throw_at(get_edge_target_turf(src,pick(alldirs)), rand(1,3), round(30/I.w_class))

	playsound(src.loc, 'sound/effects/splat.ogg', max(10,min(50,maxHealth)), 1)
	. = ..(anim,do_gibs)

