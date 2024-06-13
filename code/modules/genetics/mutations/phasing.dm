/datum/genetics/mutation/phasing
	name = "Object Phasing"
	key = "MUTATION_PHASE"
	desc = "Allows one to phase trough solid objects, albeit slowly."
	gain_text = "It feels like your atoms are a little too far apart."
	instability = 20

/datum/genetics/mutation/phasing/onMobImplant()
	add_verb(container.holder, /mob/living/carbon/human/proc/phaze_trough)


/datum/genetics/mutation/phasing/onMobRemove()
	remove_verb(container.holder, /mob/living/carbon/human/proc/phaze_trough)


/mob/living/carbon/human/proc/phaze_trough()
	set name = "Phasing"
	set category = "Mutation"

	if(stat)
		to_chat(src, SPAN_WARNING("You can't do that right now!"))
		return

	// TODO: Here and in other psionic abilities - add checks for NT obelisks,
	// reality cores and whatever else could prevent use of said abilities -- KIROV

	var/original_x = pixel_x
	var/original_y = pixel_y

	var/atom/bingo
	var/turf/T = get_step(loc, dir)
	if(T.density)
		bingo = T
	else
		for(var/atom/i in T)
			if(i.density)
				bingo = i
				break

	if(bingo)
		to_chat(src, SPAN_NOTICE("You begin to phaze trough \the [bingo]"))
		var/target_y = 0
		var/target_x = 0
		switch(dir)
			if(NORTH)
				target_y = 32
			if(SOUTH)
				target_y = -32
			if(WEST)
				target_x = -32
			if(EAST)
				target_x = 32
		animate(src, pixel_x = target_x, pixel_y = target_y, time = 15 SECONDS, easing = LINEAR_EASING, flags = ANIMATION_END_NOW)
		if(do_after(src, 15 SECONDS, bingo))
			forceMove(get_turf(bingo))

		animate(src)
		pixel_x = original_x
		pixel_y = original_y
