/obj/structure/displaycase
	name = "display case"
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "glassbox1"
	desc = "A display case for prized possessions. It taunts you to kick it."
	density = TRUE
	anchored = TRUE
	unacidable = TRUE//Dissolving the case would also delete the gun.
	health = 60
	var/occupied = TRUE
	var/destroyed = FALSE
	var/locked = TRUE

/obj/structure/displaycase/examine(mob/user)
	..()
	if(occupied)
		to_chat(user, "<span class='info'>Looks like theirs something inside it.</span>")
	if(locked)
		to_chat(user, "<span class='info'>The small wire locks are intact and active.</span>")
	if(!locked)
		to_chat(user, "<span class='info'>It seems someone has pulsed and disconencted the wire lock.</span>")
	if(health >= 60)
		to_chat(user, "<span class='info'>The case's glass is in perfect health.</span>")
	if(30 >= health && !destroyed)
		to_chat(user, "<span class='info'>The protective glass seems like its about to break.</span>")

/obj/structure/displaycase/ex_act(severity)
	switch(severity)
		if (1)
			new /obj/item/material/shard( src.loc )
			if (occupied)
				new /obj/item/gun/energy/captain( src.loc )
				occupied = FALSE
			qdel(src)
		if (2)
			if (prob(50))
				src.health -= 15
				src.healthCheck()
		if (3)
			if (prob(50))
				src.health -= 5
				src.healthCheck()


/obj/structure/displaycase/bullet_act(var/obj/item/projectile/Proj)
	if (!(Proj.testing))
		health -= Proj.get_structure_damage()
	..()
	if (!(Proj.testing))
		src.healthCheck()
	return

/obj/structure/displaycase/healthCheck()
	if (src.health <= 0)
		if (!( src.destroyed ))
			src.density = FALSE
			src.destroyed = TRUE
			src.locked = FALSE
			new /obj/item/material/shard( src.loc )
			playsound(src, "shatter", 70, 1)
			sanity_damage = 0.5 //Broken window theory
			update_icon()
	else
		playsound(src.loc, 'sound/effects/Glasshit.ogg', 75, 1)
	return

/obj/structure/displaycase/update_icon()
	if(src.destroyed)
		src.icon_state = "glassboxb[src.occupied]"
	else
		src.icon_state = "glassbox[src.occupied]"
	return


/obj/structure/displaycase/attackby(obj/item/W as obj, mob/user as mob)
	if(QUALITY_PULSING in W.tool_qualities)
		if (!locked)
			to_chat(user, SPAN_WARNING("The case is already unlocked!"))
		if (locked)
			user.visible_message(
			SPAN_DANGER("[user] starts to carefully unlock \the [src]."),
			SPAN_DANGER("You begin to unlock disarm \the [src].")
			)
		if(W.use_tool(user, src, WORKTIME_NORMAL, QUALITY_PULSING, FAILCHANCE_NORMAL,  required_stat = STAT_COG))
			user.visible_message(
				SPAN_DANGER("[user] has unlocked \the [src]."),
				SPAN_DANGER("You have unlocked \the [src]!")
				)
			locked = FALSE
			src.add_fingerprint(user)
			update_icon()
		return
	if(QUALITY_SCREW_DRIVING in W.tool_qualities)
		if (locked)
			to_chat(user, SPAN_WARNING("The case is already locked!"))
		if (!locked)
			user.visible_message(
			SPAN_DANGER("[user] starts to carefully lock \the [src]."),
			SPAN_DANGER("You begin to lock disarm \the [src].")
			)
		if(W.use_tool(user, src, WORKTIME_INSTANT, QUALITY_SCREW_DRIVING, FAILCHANCE_ZERO,  required_stat = STAT_COG))
			user.visible_message(
				SPAN_DANGER("[user] has locked \the [src]."),
				SPAN_DANGER("You have locked \the [src]!")
				)
			locked = TRUE
			src.add_fingerprint(user)
			update_icon()
		return
	if(istype(W, /obj/item/gun/energy/captain))
		if(locked)
			if(occupied)
				to_chat(user, SPAN_WARNING("There is already \a gun inside \the [src]."))
			else if(user.unEquip(W))
				W.forceMove(src)
				occupied = W
				to_chat(user, SPAN_NOTICE("You place \the gun into \the [src]."))
				update_icon()
				src.add_fingerprint(user)
			return

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	src.health -= W.force
	src.healthCheck()
	..()
	return

/obj/structure/displaycase/attack_hand(mob/user as mob)
	if (src.destroyed && src.occupied)
		new /obj/item/gun/energy/captain( src.loc )
		to_chat(user, SPAN_NOTICE("You deactivate the hover field built into the case."))
		src.occupied = FALSE
		src.add_fingerprint(user)
		update_icon()
		return
	if (src.occupied && !src.locked)
		new /obj/item/gun/energy/captain( src.loc )
		to_chat(user, SPAN_NOTICE("You deactivate the hover field built into the case."))
		src.occupied = FALSE
		src.add_fingerprint(user)
		update_icon()
		return
	else
		to_chat(usr, text(SPAN_WARNING("You kick the display case.")))
		for(var/mob/O in oviewers())
			if ((O.client && !( O.blinded )))
				to_chat(O, SPAN_WARNING("[usr] kicks the display case."))
		src.health -= 2
		healthCheck()
		return
