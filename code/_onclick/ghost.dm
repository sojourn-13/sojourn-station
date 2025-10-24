/client/var/inquisitive_ghost = FALSE
/mob/observer/ghost/verb/toggle_inquisition() // warning: unexpected inquisition
	set name = "Toggle Inquisitiveness"
	set desc = "Sets whether your ghost examines everything on click by default"
	set category = "Ghost"

	if(!client)
		return

	client.inquisitive_ghost = !client.inquisitive_ghost

	if(client.inquisitive_ghost)
		to_chat(src, SPAN_NOTICE("You will now examine everything you click on."))
	else
		to_chat(src, SPAN_NOTICE("You will no longer examine things you click on."))

/mob/observer/ghost/DblClickOn(var/atom/A, var/params)
	if(client.buildmode)
		build_click(src, client.buildmode, params, A)
		return
	if(can_reenter_corpse && mind && mind.current)
		if(A == mind.current || (mind.current in A)) // double click your corpse or whatever holds it
			reenter_corpse()						// (cloning scanner, body bag, closet, mech, etc)
			return

	// Things you might plausibly want to follow
	if(istype(A,/atom/movable) && !istype(A,/HUD_element))
		ManualFollow(A)
	// Otherwise jump
	else
		stop_following()
		forceMove(get_turf(A))

/mob/observer/ghost/ClickOn(var/atom/A, var/params)
	var/list/modifiers = params2list(params)
	if(modifiers["shift"] && modifiers["ctrl"] && check_rights(R_ADMIN)) // Admin click shortcuts
		client.debug_variables(A)
		return


	if(client.buildmode)
		build_click(src, client.buildmode, params, A)
		return
	if(!can_click()) return
	setClickCooldown(4)
	if(modifiers["shift"])
		A.GhostShiftClick(src)
		return
	// You are responsible for checking config.ghost_interaction when you override this function
	// Not all of them require checking, see below
	A.attack_ghost(src)

/atom/proc/GhostShiftClick(mob/observer/ghost/user)
	if(user.client)
		user.examinate(src)

		if(user.health_scanner_mode)
			if(ishuman(src) || istype(src, /obj/structure/closet/body_bag))
				var/scan_data = medical_scan_action(src, user, null, TRUE, FALSE, TRUE)
				var/datum/browser/popup = new(user, "scanner", "Spector's Health Scanner", 600, 650)
				popup.set_content("[scan_data]")
				popup.open()

	return FALSE

// Oh by the way this didn't work with old click code which is why clicking shit didn't spam you
/atom/proc/attack_ghost(mob/observer/ghost/user as mob)
	if(user?.client?.inquisitive_ghost)
		user.examinate(src)
	return FALSE

// ---------------------------------------
// And here are some good things for free:
// Now you can click through portals, wormholes, gateways, and teleporters while observing. -Sayu

/obj/machinery/teleport/hub/attack_ghost(mob/user as mob)
	var/atom/l = loc
	var/obj/machinery/computer/teleporter/com = locate(/obj/machinery/computer/teleporter, locate(l.x - 2, l.y, l.z))
	if(com.locked)
		user.forceMove(get_turf(com.locked))

/obj/effect/portal/attack_ghost(mob/user as mob)
	if(target)
		user.forceMove(get_turf(target))

/*
/obj/machinery/gateway/centerstation/attack_ghost(mob/user as mob)
	if(awaygate)
		user.loc = awaygate.loc
	else
		to_chat(user, "[src] has no destination.")

/obj/machinery/gateway/centeraway/attack_ghost(mob/user as mob)
	if(stationgate)
		user.loc = stationgate.loc
	else
		to_chat(user, "[src] has no destination.")
*/

// -------------------------------------------
// This was supposed to be used by adminghosts
// I think it is a *terrible* idea
// but I'm leaving it here anyway
// commented out, of course.
/*
/atom/proc/attack_admin(mob/user as mob)
	if(!user || !user.client || !user.client.holder)
		return
	attack_hand(user)

*/
