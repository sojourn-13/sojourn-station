/obj/item/energy_net
	name = "energy net"
	desc = "It's a net made of green energy."
	icon = 'icons/effects/effects.dmi'
	icon_state = "energynet"
	throwforce = 0
	force = 0
	var/net_type = /obj/effect/energy_net

/obj/item/energy_net/safari
	name = "animal net"
	desc = "An energized net meant to subdue animals."
	net_type = /obj/effect/energy_net

/obj/item/energy_net/dropped()
	spawn(10)
		if(src) qdel(src)

/obj/item/energy_net/throw_impact(atom/hit_atom)
	..()

	var/mob/living/M = hit_atom

	if(!istype(M) || locate(/obj/effect/energy_net) in M.loc)
		qdel(src)
		return 0

	var/turf/T = get_turf(M)
	if(T)
		var/obj/effect/energy_net/net = new net_type(T)
		net.layer = M.layer+1
		net.buckle_mob(M)
		net.affecting = M
		T.visible_message("[M] was caught in an energy net!")
		qdel(src)

	// If we miss or hit an obstacle, we still want to delete the net.
	spawn(10)
		if(src) qdel(src)

/obj/effect/energy_net
	name = "energy net"
	desc = "It's a net made of green energy."
	icon = 'icons/effects/effects.dmi'
	icon_state = "energynet"

	density = 1
	opacity = 0
	mouse_opacity = 1
	anchored = 1
	layer = ABOVE_ALL_MOB_LAYER

	health = 25
	var/mob/living/affecting = null //Who it is currently affecting, if anyone.
	var/mob/living/master = null    //Who shot web. Will let this person know if the net was successful.
	var/countdown = -1

/obj/effect/energy_net/safari
	name = "animal net"
	desc = "An energized net meant to subdue animals."
	anchored = 0  // Safari nets are not anchored

/obj/effect/energy_net/teleport
	countdown = 60

/obj/effect/energy_net/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/effect/energy_net/Destroy()

	if(affecting)
		var/mob/living/carbon/M = affecting
		M.anchored = initial(affecting.anchored)
		M.buckled = null
		to_chat(M, "You are free of the net!")

	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/effect/energy_net/healthCheck()

	if(health <=0)
		density = 0
		src.visible_message("The energy net is torn apart!")
		qdel(src)
	return

/obj/effect/energy_net/Process()

	if(isnull(affecting) || affecting.loc != loc)
		qdel(src)
		return

	// Countdown begin set to -1 will stop the teleporter from firing.
	// Clientless mobs can be netted but they will not teleport or decrement the timer.
	var/mob/living/M = affecting
	if(countdown == -1 || (istype(M) && !M.client))
		return

	if(countdown > 0)
		countdown--
		return

/obj/effect/energy_net/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, var/glide_size_override = 0)
	. = ..()
	if(affecting && affecting.buckled == src)
		affecting.forceMove(loc, glide_size_override=glide_size_override)

/obj/effect/energy_net/bullet_act(var/obj/item/projectile/Proj)
	if (!(Proj.testing))
		health -= Proj.get_structure_damage()
		healthCheck()
	return 0

/obj/effect/energy_net/ex_act()
	health = 0
	healthCheck()

/obj/effect/energy_net/attack_hand(var/mob/user)

	var/mob/living/carbon/human/H = user
	if(istype(H))
		if(H.species.can_shred(H))
			playsound(src.loc, 'sound/weapons/slash.ogg', 80, 1)
			health -= rand(10, 20)
		else
			health -= rand(1,3)

	else if (HULK in user.mutations)
		health = 0
	else
		health -= rand(5,8)

	to_chat(H, SPAN_DANGER("You claw at the energy net."))

	healthCheck()
	return

/obj/effect/energy_net/attackby(obj/item/W as obj, mob/user as mob)
	if(QUALITY_CUTTING in W.tool_qualities)
		user.visible_message(
			SPAN_WARNING("\The [user] starts to saw at \the [src]!"),
			SPAN_WARNING("You start sawing at \the [src]!"),
			"You hear the sound of a knife rubbing against flesh!")
		if(W.use_tool(user, src, WORKTIME_FAST, QUALITY_CUTTING, FAILCHANCE_EASY, required_stat = STAT_TGH))
			to_chat(user, SPAN_NOTICE("You manage to destroy \the [src]."))
			health = 0
	else
		health -= W.force/2

	healthCheck()
	..()

/obj/effect/energy_net/resist_buckle(var/mob/user)
	if (affecting == user)
		to_chat(affecting, SPAN_WARNING("\The [src] seems impossible to wriggle through without a cutting tool or some help!"))

	return FALSE
