/obj/structure/anomaly_container
	name = "anomaly container"
	desc = "Used to safely contain and move anomalies."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "anomaly_container"
	density = 1

	var/obj/machinery/artifact/contained

/obj/structure/anomaly_container/Initialize()
	. = ..()

	var/obj/machinery/artifact/A = locate() in loc
	if(A)
		contain(A)

/obj/structure/anomaly_container/examine(mob/user)
	. = ..()
	if(contained)
		to_chat(user, SPAN_NOTICE("There is \a [contained] contained within."))
		to_chat(user, SPAN_NOTICE("Click on the container to release the contained anomaly."))
	else
		to_chat(user, SPAN_NOTICE("The container is empty."))
		to_chat(user, SPAN_NOTICE("Drag an anomaly onto this container to contain it."))

/obj/structure/anomaly_container/attack_hand(var/mob/user)
	if(contained)
		release(user)
	else
		to_chat(user, SPAN_WARNING("The container is empty."))

/obj/structure/anomaly_container/attack_robot(var/mob/user)
	if(Adjacent(user))
		attack_hand(user)

/obj/structure/anomaly_container/proc/contain(var/obj/machinery/artifact/artifact, var/mob/user)
	if(contained)
		if(user)
			to_chat(user, SPAN_WARNING("The container already contains \a [contained]."))
		return FALSE

	if(!istype(artifact))
		if(user)
			to_chat(user, SPAN_WARNING("You can only contain artifacts in this container."))
		return FALSE

	contained = artifact
	artifact.forceMove(src)

	// Stop the artifact from processing while contained
	if(artifact in SSobj.processing)
		STOP_PROCESSING(SSobj, artifact)

	update_icon()

	if(user)
		to_chat(user, SPAN_NOTICE("You successfully contain \the [artifact] in \the [src]."))
		user.visible_message(SPAN_NOTICE("[user] places \the [artifact] into \the [src]."))

	desc = "Used to safely contain and move anomalies. \The [contained] is safely contained within."
	return TRUE

/obj/structure/anomaly_container/proc/release(var/mob/user)
	if(!contained)
		if(user)
			to_chat(user, SPAN_WARNING("The container is empty."))
		return FALSE

	var/obj/machinery/artifact/releasing = contained
	contained.forceMove(get_turf(src))

	// Restart artifact processing
	if(!(releasing in SSobj.processing))
		START_PROCESSING(SSobj, releasing)

	contained = null
	update_icon()

	if(user)
		to_chat(user, SPAN_NOTICE("You release \the [releasing] from \the [src]."))
		user.visible_message(SPAN_NOTICE("[user] releases \the [releasing] from \the [src]."))

	desc = initial(desc)
	return TRUE

/obj/structure/anomaly_container/update_icon()
	if(contained)
		underlays.Cut()
		underlays += image(contained)
		icon_state = "anomaly_container_full"
	else
		underlays.Cut()
		icon_state = "anomaly_container"

/obj/machinery/artifact/MouseDrop(var/obj/structure/anomaly_container/over_object)
	if(!istype(over_object))
		return

	if(!Adjacent(over_object))
		to_chat(usr, SPAN_WARNING("You need to be closer to the container."))
		return

	if(!CanMouseDrop(over_object, usr))
		return

	if(!ishuman(usr))
		to_chat(usr, SPAN_WARNING("You don't have the dexterity to do this."))
		return

	var/mob/living/carbon/human/user = usr

	if(user.incapacitated())
		to_chat(user, SPAN_WARNING("You can't do this while incapacitated."))
		return

	over_object.contain(src, user)