/obj/effect/effect/water
	name = "water"
	icon = 'icons/effects/effects.dmi'
	icon_state = "extinguish"
	mouse_opacity = 0
	pass_flags = PASSTABLE | PASSGRILLE

/obj/effect/effect/water/New(loc)
	..()
	spawn(150) // In case whatever made it forgets to delete it
		if(src)
			qdel(src)

/obj/effect/effect/water/proc/set_color() // Call it after you move reagents to it
	icon += reagents.get_color()

/obj/effect/effect/water/proc/set_up(var/turf/target, var/step_count = 5, var/delay = 5, var/lifespan = 10)
	if(!target)
		return
	var/hit_mob = FALSE
	for(var/i = 1 to step_count)
		if(!loc)
			return
		step_towards(src, target)
		var/turf/T = get_turf(src)
		if(T && reagents)
			reagents.touch_turf(T)
			var/list/atom/affected_targets = new
			for (var/atom/A in T)
				if (ismob(A) || (isobj(A) && A.is_injectable()))
					affected_targets |= A
					if(ismob(A))
						hit_mob = TRUE
				else if (A.simulated)
					reagents.touch(A)

			if(affected_targets.len)
				//if we hit a mob, dump the rest of the reagents there.
				var/residue_amt
				if(hit_mob)
					residue_amt = reagents.total_volume/affected_targets.len
				else
					residue_amt = reagents.total_volume/(5*affected_targets.len)
				for (var/atom/chem_target in affected_targets)
					reagents.trans_to(chem_target, residue_amt)
			//Stop the spray if it hits a mob
			if (hit_mob)
				break


			if (T == get_turf(target))
				break
		sleep(delay)
	sleep(lifespan)
	qdel(src)

/obj/effect/effect/water/Move(var/atom/NewLoc, Dir = 0, step_x = 0, step_y = 0, var/glide_size_override = 0)
	if(NewLoc.density)
		return 0

	return ..()

/obj/effect/effect/water/Bump(atom/A)
	if(reagents)
		reagents.touch(A)
	return ..()

//Used by spraybottles.
/obj/effect/effect/water/chempuff
	name = "chemicals"
	icon = 'icons/obj/chempuff.dmi'
	icon_state = ""
