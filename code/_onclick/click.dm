/*
	Click code cleanup
	~Sayu
*/

// 1 decisecond click delay (above and beyond mob/next_move)
/mob/var/next_click = 0

/*
	Before anything else, defer these calls to a per-mobtype handler.  This allows us to
	remove istype() spaghetti code, but requires the addition of other handler procs to simplify it.

	Alternately, you could hardcode every mob's variation in a flat ClickOn() proc; however,
	that's a lot of code duplication and is hard to maintain.

	Note that this proc can be overridden, and is in the case of screen objects.
*/

/client/MouseDown(object,location,control,params)

	if (CH)
		if (!CH.MouseDown(object,location,control,params))
			return
	.=..()

/client/MouseUp(object,location,control,params)
	if (CH)
		if (!CH.MouseUp(object,location,control,params))
			return
	.=..()

/client/MouseDrag(over_object,src_location,over_location,src_control,over_control,params)
	if (CH)
		if (!CH.MouseDrag(over_object,src_location,over_location,src_control,over_control,params))
			return
	.=..()


/client/Click(var/atom/target, location, control, params)
	SEND_SIGNAL(src, COMSIG_CLIENT_CLICK, target, location, control, params, usr)

	var/list/L = params2list(params) //convert params into a list
	var/dragged = L["drag"] //grab what mouse button they are dragging with, if any.
	if(dragged && !L[dragged]) //check to ensure they aren't using drag clicks to aimbot
		return //if they are dragging, and they clicked with a different mouse button, reject the click as it will always go the atom they are currently dragging, even if out of view and not under the mouse

	if (CH)
		if (!CH.Click(target, location, control, params))
			return


	if(!target.Click(location, control, params))
		usr.ClickOn(target, params)

/atom/DblClick(var/location, var/control, var/params)
	if(src)
		usr.DblClickOn(src, params)

/*
	Standard mob ClickOn()
	Handles exceptions: Buildmode, middle click, modified clicks, mech actions

	After that, mostly just check your state, check whether you're holding an item,
	check whether you're adjacent to the target, then pass off the click to whoever
	is recieving it.
	The most common are:
	* mob/UnarmedAttack(atom, adjacent) - used here only when adjacent, with no item in hand; in the case of humans, checks gloves
	* atom/attackby(item, user) - used only when adjacent
	* item/afterattack(atom, user, adjacent, params) - used both ranged and adjacent
	* mob/RangedAttack(atom, params) - used only ranged, only used for tk and laser eyes but could be changed
*/
/mob/proc/ClickOn(var/atom/A, var/params)

	if(!can_click())
		return

	next_click = world.time + 1

	if(client.buildmode)
		build_click(src, client.buildmode, params, A)
		return

	var/list/modifiers = params2list(params)
	if(modifiers["shift"] && modifiers["ctrl"])
		CtrlShiftClickOn(A, params)
		return 1
	if(modifiers["ctrl"] && modifiers["alt"])
		CtrlAltClickOn(A)
		return 1
	if(modifiers["middle"])
		if(modifiers["shift"])
			ShiftMiddleClickOn(A)
		else
			MiddleClickOn(A)
		return 1
	if(modifiers["shift"])
		SEND_SIGNAL(src, COMSIG_SHIFTCLICK, A)
		ShiftClickOn(A)
		return 0
	if(modifiers["alt"]) // alt and alt-gr (rightalt)
		SEND_SIGNAL(src, COMSIG_ALTCLICK, A)
		AltClickOn(A)
		return 1
	if(modifiers["ctrl"])
		SEND_SIGNAL(src, COMSIG_CTRLCLICK, A)
		CtrlClickOn(A, params)
		return 1

	if(stat || paralysis || stunned || weakened)
		return

	face_atom(A) // change direction to face what you clicked on



	if(istype(loc, /obj/mecha))
		if(!locate(/turf) in list(A, A.loc)) // Prevents inventory from being drilled
			return
		var/obj/mecha/M = loc
		return M.click_action(A, src)

	if(restrained())
		setClickCooldown(10)
		RestrainedClickOn(A)
		return 1

	if(in_throw_mode)
		if(isturf(A) || isturf(A.loc))
			throw_item(A)
			return 1
		throw_mode_off()

	var/obj/item/W = get_active_hand()

	if(W == A) // Handle attack_self
		W.attack_self(src)
		return 1

	//Atoms on your person
	// A is your location but is not a turf; or is on you (backpack); or is on something on you (box in backpack); sdepth is needed here because contents depth does not equate inventory storage depth.
	var/sdepth = A.storage_depth(src)
	if((!isturf(A) && A == loc) || (sdepth != -1 && sdepth <= 1))
		// faster access to objects already on you
		if(W)
			var/resolved = (LEGACY_SEND_SIGNAL(W, COMSIG_IATTACK, A, src, params)) || (LEGACY_SEND_SIGNAL(A, COMSIG_ATTACKBY, W, src, params)) || W.resolve_attackby(A, src, params)
			if(!resolved && A && W)
				W.afterattack(A, src, 1, params) // 1 indicates adjacency
		else
			if(ismob(A)) // No instant mob attacking
				setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
			UnarmedAttack(A, 1, params)
		return 1

	if(!isturf(loc)) // This is going to stop you from telekinesing from inside a closet, but I don't shed many tears for that
		return

	//Atoms on turfs (not on your person)
	// A is a turf or is on a turf, or in something on a turf (pen in a box); but not something in something on a turf (pen in a box in a backpack)
	sdepth = A.storage_depth_turf()
	if(isturf(A) || isturf(A.loc) || (sdepth != -1 && sdepth <= 1))
		var/adjacent = A.Adjacent(src)
		if(adjacent) // see adjacent.dm
			if(W)
				// Return 1 in attackby() to prevent afterattack() effects (when safely moving items for example)
				var/resolved = (LEGACY_SEND_SIGNAL(W, COMSIG_IATTACK, A, src, params)) || (LEGACY_SEND_SIGNAL(A, COMSIG_ATTACKBY, W, src, params))
				if(!resolved && A && W)
					if(W.double_tact(src, A, adjacent))
						resolved = W.resolve_attackby(A, src, params)
					if(!resolved)
						W.afterattack(A, src, 1, params) // 1: clicking something Adjacent
			else
				if(ismob(A)) // No instant mob attacking
					setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
				UnarmedAttack(A, 1, params)
			return
		else // non-adjacent click
			if(W)
				if(W.double_tact(src, A))
					W.afterattack(A, src, 0, params) // 0: not Adjacent
			else
				setClickCooldown(DEFAULT_ATTACK_COOLDOWN) // no ranged spam
				RangedAttack(A, params)
	return 1

/mob/proc/setClickCooldown(var/timeout)
	next_click = max(world.time + (timeout + gather_click_delay(src)), next_click)

/mob/proc/gather_click_delay(mob/living/M as mob)
	var/gathered = 0
	if(ishuman(M))
		var/mob/living/carbon/human/back_pack_checker = M
		var/obj/item/W = M.get_active_hand()
		if(!back_pack_checker.back)
			gathered -= 1
		if(W)
			gathered += W.clickdelay_offset
	if(issilicon(M))
		var/mob/living/silicon/S = M
		var/obj/item/W = S.get_active_hand()
		if(W)
			gathered += W.clickdelay_offset
	gathered += click_delay_addition
	return gathered

/mob/proc/can_click()
	if(next_click <= world.time)
		return 1
	return 0

// Default behavior: ignore double clicks, the second click that makes the doubleclick call already calls for a normal click
/mob/proc/DblClickOn(var/atom/A, var/params)
	return

/*
	Translates into attack_hand, etc.

	Note: proximity_flag here is used to distinguish between normal usage (flag=1),
	and usage when clicking on things telekinetically (flag=0).  This proc will
	not be called at ranged except with telekinesis.

	proximity_flag is not currently passed to attack_hand, and is instead used
	in human click code to allow glove touches only at melee range.
*/
/mob/proc/UnarmedAttack(var/atom/A, var/proximity_flag, params)
	return

/mob/living/UnarmedAttack(var/atom/A, var/proximity_flag, params)
	if(stat)
		return 0

	return 1

/*
	Ranged unarmed attack:

	This currently is just a default for all mobs, involving
	laser eyes and telekinesis.  You could easily add exceptions
	for things like ranged glove touches, spitting alien acid/neurotoxin,
	animals lunging, etc.
*/
/mob/proc/RangedAttack(var/atom/A, var/params)
	if(!mutations.len) return
	if((LASER in mutations) && a_intent == I_HURT)
		LaserEyes(A) // moved into a proc below
	else if(TK in mutations)
		var/d = (get_dist(src, A))
		if (d == 0)
			return
		if (d <= tk_maxrange)
			A.attack_tk(src)
/*
	Restrained ClickOn

	Used when you are handcuffed and click things.
	Not currently used by anything but could easily be.
*/
/mob/proc/RestrainedClickOn(var/atom/A)
	return

/*
	Middle click
	Only used for swapping hands
*/
/mob/proc/MiddleClickOn(var/atom/A)
	swap_hand()
	return

/mob/proc/ShiftMiddleClickOn(var/atom/A)
	pointed(A)

// In case of use break glass
/*
/atom/proc/MiddleClick(var/mob/M as mob)
	return
*/

/*
	Shift click
	For most mobs, examine.
	This is overridden in ai.dm
*/
/mob/proc/ShiftClickOn(var/atom/A)
	A.ShiftClick(src)
	return

/atom/proc/ShiftClick(var/mob/user)
	if(user.client && user.client.eye == user)
		user.examinate(src)
	return

/*
	Control+Alt click
*/
/mob/proc/CtrlAltClickOn(var/atom/A)
	A.CtrlAltClick(src)
	return

/atom/proc/CtrlAltClick(var/mob/user)
	return

/*
	Ctrl click
	For most objects, pull
*/
/mob/proc/CtrlClickOn(var/atom/A, params)
	A.CtrlClick(src, params)
	return

/atom/proc/CtrlClick(var/mob/user, params)
	LEGACY_SEND_SIGNAL(src, COMSIG_CLICK_CTRL, user)
	return

/atom/movable/CtrlClick(var/mob/user, params)
	if(Adjacent(user) && loc != user) //cant pull things on yourself
		user.start_pulling(src)
	..()
/*
	Alt click
	Unused except for AI
*/
/mob/proc/AltClickOn(var/atom/A)
	A.AltClick(src)
	return

/**
 * Alt click on an atom.
 * Performs alt-click actions before attempting to open a loot window.
 * Returns TRUE if successful, FALSE if not.
 */
/atom/proc/AltClick(var/mob/user)
	LEGACY_SEND_SIGNAL(src, COMSIG_CLICK_ALT, user)

	var/turf/tile = get_turf(src)
	if(isnull(tile))
		return FALSE

	if(!isturf(loc) && !isturf(src))
		return FALSE

	if(!user.TurfAdjacent(tile))
		return FALSE

	var/datum/lootpanel/panel = user.client?.loot_panel
	if(isnull(panel))
		return FALSE

	panel.open(tile)
	return TRUE

/mob/proc/TurfAdjacent(var/turf/T)
	return T.AdjacentQuick(src)

/*
	Control+Shift click
	Unused except for AI
*/
/mob/proc/CtrlShiftClickOn(var/atom/A, params)
	A.CtrlShiftClick(src, params)
	return

/atom/proc/CtrlShiftClick(var/mob/user, params)
	return

/*
	Misc helpers

	Laser Eyes: as the name implies, handles this since nothing else does currently
	face_atom: turns the mob towards what you clicked on
*/
/mob/proc/LaserEyes(atom/A)
	return

/mob/living/LaserEyes(atom/A)
	setClickCooldown(4)
	var/turf/T = get_turf(src)

	var/obj/item/projectile/beam/LE = new (T)
	LE.icon = 'icons/effects/genetics.dmi'
	LE.icon_state = "eyelasers"
	mob_playsound(usr.loc, 'sound/weapons/energy/taser2.ogg', 75, 1)
	LE.launch(A)

/mob/living/carbon/human/LaserEyes()
	if(nutrition>0)
		..()
		nutrition = max(nutrition - rand(1, 5), 0)
		handle_regular_hud_updates()
	else
		to_chat(src, SPAN_WARNING("You're out of energy!  You need food!"))

// Simple helper to face what you clicked on, in case it should be needed in more than one place
/atom/movable/proc/face_atom(var/atom/A)
	if(!A || !x || !y || !A.x || !A.y) return
	var/dx = A.x - x
	var/dy = A.y - y
	if(!dx && !dy) return

	var/direction
	if(abs(dx) < abs(dy))
		if(dy > 0)	direction = NORTH
		else		direction = SOUTH
	else
		if(dx > 0)	direction = EAST
		else		direction = WEST
	if(direction != dir)
		facedir(direction)


/atom/movable/proc/facedir(var/ndir)
	set_dir(ndir)
	return 1


/obj/screen/click_catcher
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "catcher"
	plane = CLICKCATCHER_PLANE
	mouse_opacity = MOUSE_OPACITY_OPAQUE
	screen_loc = "CENTER"

/obj/screen/click_catcher/New(_name = "unnamed", mob/living/_parentmob, _icon, _icon_state)
	. = ..()
	// eris code is a bitch, we need this to be /actually fuckin unnamed you lil shit/
	name = ""

/obj/screen/click_catcher/MouseEntered(location, control, params)
	return

/obj/screen/click_catcher/MouseExited(location, control, params)
	return

#define MAX_SAFE_BYOND_ICON_SCALE_PX (33 * 32)			//Not using world.icon_size on purpose.
#define MAX_SAFE_BYOND_ICON_SCALE_TILES (MAX_SAFE_BYOND_ICON_SCALE_PX / world.icon_size)

/obj/screen/click_catcher/proc/UpdateGreed(view_size_x = 15, view_size_y = 15)
	var/icon/newicon = icon('icons/mob/screen_gen.dmi', "catcher")
	var/ox = min(MAX_SAFE_BYOND_ICON_SCALE_TILES, view_size_x)
	var/oy = min(MAX_SAFE_BYOND_ICON_SCALE_TILES, view_size_y)
	var/px = view_size_x * world.icon_size
	var/py = view_size_y * world.icon_size
	var/sx = min(MAX_SAFE_BYOND_ICON_SCALE_PX, px)
	var/sy = min(MAX_SAFE_BYOND_ICON_SCALE_PX, py)
	newicon.Scale(sx, sy)
	icon = newicon
	screen_loc = "CENTER-[(ox-1)*0.5],CENTER-[(oy-1)*0.5]"
	var/matrix/M = new
	M.Scale(px/sx, py/sy)
	transform = M

/obj/screen/click_catcher/Click(location, control, params)
	var/list/modifiers = params2list(params)
	if(modifiers["middle"] && iscarbon(usr))
		var/mob/living/carbon/C = usr
		C.swap_hand()
	else
		var/turf/T = params2turf(modifiers["screen-loc"], get_turf(usr), usr?.client)
		params += "&catcher=1"
		if(T)
			// we handle things differently than Paradise, client/Click is the entry point instead of atom/Click
			usr.client.Click(T, location, control, params)
	. = 1

/obj/screen/click_catcher/MouseDown(location, control, params)
	var/list/modifiers = params2list(params)
	var/turf/T = params2turf(modifiers["screen-loc"], get_turf(usr), usr?.client)
	params += "&catcher=1"
	if(T)
		usr.client.MouseDown(T, location, control, params)
	. = 1

/obj/screen/click_catcher/MouseUp(location, control, params)
	var/list/modifiers = params2list(params)
	var/turf/T = params2turf(modifiers["screen-loc"], get_turf(usr), usr?.client)
	params += "&catcher=1"
	if(T)
		usr.client.MouseUp(T, location, control, params)
	. = 1

#undef MAX_SAFE_BYOND_ICON_SCALE_TILES
#undef MAX_SAFE_BYOND_ICON_SCALE_PX

/mob/proc/add_click_catcher()
	client.screen += client.void

/mob/new_player/add_click_catcher()
	return
