/mob/living/carbon/superior_animal/psi_monster/findTarget()
	. = ..()
	if(.)
		if(last_noise <= (world.time) && aggro_noise)
			playsound(src.loc, list(aggro_noise), 120, 1)
			last_noise = world.time + 30 SECONDS
		//We do if src in case someone has a gun to 1 shot them mid-animation and kills them on the spot.
		animate(src, alpha = chameleon_skill, time = 2)
		spawn(3) if(src) animate(src, alpha = 55, time = 2)
		spawn(3) if(src) animate(src, alpha = 155, time = 2)
		spawn(3) if(src) animate(src, alpha = 255, time = 2)

/mob/living/carbon/superior_animal/psi_monster/death(var/gibbed,var/message = deathmessage)
	if (stat != DEAD)
		target_mob = null
		playsound(src.loc, list('sound/hallucinations/growl1.ogg', 'sound/hallucinations/growl2.ogg', 'sound/hallucinations/growl3.ogg'), 120, 1)

		density = FALSE
		layer = LYING_MOB_LAYER

	for(var/obj/item/I in src)
		drop_from_inventory(I)
		I.throw_at(get_edge_target_turf(src,pick(alldirs)), rand(1,3), round(30/I.w_class))

	new momento_mori(src.loc)

	dust(src) //Leaves a second dust pile but this is better then deleting the mob directly

	. = ..()

/mob/living/carbon/superior_animal/psi_monster/gib(var/anim = icon_gib, var/do_gibs = 1)
	if (!anim)
		anim = 0

	spawn(3)
		if(src)

		for(var/obj/item/I in src)
			drop_from_inventory(I)
			I.throw_at(get_edge_target_turf(src,pick(alldirs)), rand(1,3), round(30/I.w_class))

		new momento_mori(src.loc)

	. = ..()
