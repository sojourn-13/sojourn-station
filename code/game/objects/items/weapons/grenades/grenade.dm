/obj/item/grenade
	name = "grenade"
	desc = "A hand held grenade, with an adjustable timer."
	w_class = ITEM_SIZE_SMALL
	icon = 'icons/obj/grenade.dmi'
	icon_state = "grenade"
	item_state = "grenade"
	throw_speed = 4
	throw_range = 20
	flags = CONDUCT
	slot_flags = SLOT_BELT|SLOT_MASK
	price_tag = 300
	var/active = 0
	var/det_time = 40
	var/loadable = TRUE
	//How much the fuse time varies up or down. Punishes cooking with makeshift nades, proper ones should have 0
	var/variance = 0
	var/impact = FALSE
	var/impact_unsafe = FALSE
	var/exploded = FALSE

/obj/item/grenade/proc/clown_check(var/mob/living/user)
	if((CLUMSY in user.mutations) && prob(10))
		to_chat(user, SPAN_WARNING("Huh? ... HELL, I PRIMED THE GRENADE!"))

		activate(user)
		add_fingerprint(user)
		spawn(5)
			prime()
		return 0
	return 1

/obj/item/grenade/examine(mob/user)
	if(..(user, 0))
		if(impact)
			to_chat(user, "This grenade is set to explode when hitting anything[impact_unsafe ? "" : " when primed"].")
		if(det_time > 1)
			to_chat(user, "The timer is set to [det_time/10] seconds.")
			return
		if(det_time == null)
			return
		to_chat(user, "\The [src] is set for instant detonation.")


/obj/item/grenade/attack_self(mob/user as mob)
	if(!active)
		if(clown_check(user))
			to_chat(user, SPAN_WARNING("You prime \the [name]! [det_time/10] seconds!"))

			activate(user)
			add_fingerprint(user)
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.throw_mode_on()
	return


/obj/item/grenade/proc/activate(mob/user as mob)
	if(active)
		return

	if(user)
		log_and_message_admins("primed \a [src]")
		user.attack_log += "\[[time_stamp()]\] <font color='red'>primed \a [src]</font>"

	icon_state = initial(icon_state) + "_active"
	active = 1
	playsound(loc, 'sound/weapons/armbomb.ogg', 75, 1, -3)
	update_icon()

	if(variance)
		det_time *= RAND_DECIMAL(1-variance, 1+variance)

	spawn(det_time)
		prime(user)
		return


/obj/item/grenade/proc/prime(mob/user)
	if(exploded)
		return
	exploded = TRUE
	var/turf/T = get_turf(src)
	T.hotspot_expose(700,125)
	if(ismob(user))
		user.hud_used.updatePlaneMasters(user)


/obj/item/grenade/attackby(obj/item/I, mob/user as mob)

	var/list/usable_qualities = list(QUALITY_SCREW_DRIVING)

	if(impact)
		usable_qualities += QUALITY_BOLT_TURNING

	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	switch(tool_type)
		if(QUALITY_BOLT_TURNING)
			if(impact)
				impact_unsafe = !impact_unsafe

				to_chat(user, "You adjust the [src] to \
				[impact_unsafe ? "explode even when unprimed on impact" : "explode only when when primed"].")
				add_fingerprint(user)


		if(QUALITY_SCREW_DRIVING)
			if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_EASY, required_stat = STAT_COG))
				switch(det_time)
					if (1)
						det_time = 30
						to_chat(user, SPAN_NOTICE("You set the [name] for 3 second detonation time."))
					if (30)
						det_time = 40
						to_chat(user, SPAN_NOTICE("You set the [name] for 4 second detonation time."))
					if (40)
						det_time = 1
						to_chat(user, SPAN_NOTICE("You set the [name] for instant detonation."))

			add_fingerprint(user)

		if(ABORT_CHECK)
			return

	..()
	return

/obj/item/grenade/throw_at(atom/target, range, speed, thrower)
	..()

	//More logging
	if(active && impact)
		if(throwing && thrower)
			log_and_message_admins("impact based nade \a [src] used by [thrower], to hit [target] at [jumplink(thrower)]")
			if(ismob(thrower))
				var/mob/M = thrower
				M.attack_log += "\[[time_stamp()]\] <font color='red'>primed \a [src] via impact</font>"

	if(impact_unsafe)
		log_and_message_admins("impact -unsafe- based nade \a [src] used by [thrower], to hit [target] at [jumplink(thrower)]")
		if(ismob(thrower))
			var/mob/M = thrower
			M.attack_log += "\[[time_stamp()]\] <font color='red'>primed \a [src] via impact</font>"


//called when src is thrown into hit_atom
/obj/item/grenade/throw_impact(atom/hit_atom, var/speed)
	..()
	if(active && impact)
		if(throwing && thrower)
			log_and_message_admins("primed \a [src] via impact at [hit_atom]")
			if(ismob(thrower))
				var/mob/M = thrower
				M.attack_log += "\[[time_stamp()]\] <font color='red'>primed \a [src] via impact</font>"
		prime(hit_atom)

	if(impact_unsafe)
		log_and_message_admins("primed \a [src] via impact at [hit_atom]")
		if(ismob(thrower))
			var/mob/M = thrower
			M.attack_log += "\[[time_stamp()]\] <font color='red'>primed \a [src] via impact</font>"

		prime(hit_atom)