#define CHAMELEON_MIN_PIXELS 32

GLOBAL_LIST_INIT(champroj_blacklist, list(/obj/item/disk/nuclear))
GLOBAL_LIST_INIT(champroj_whitelist, list())

/obj/item/device/chameleon
	name = "chameleon projector"
	desc = "A projection device allowing for high-tech imitation."
	icon_state = "shield0"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	item_state = "electronic"
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_ILLEGAL = 4, TECH_MAGNET = 4)
	var/can_use = 1
	var/obj/effect/dummy/chameleon/active_dummy = null
	var/saved_item
	var/saved_icon
	var/saved_icon_state
	var/saved_overlays

	var/tick_cost = 2 //how much charge is consumed per process tick from the cell
	var/move_cost = 4 //how much charge is consumed per movement
	suitable_cell = /obj/item/cell/small

/obj/item/device/chameleon/Initialize()
	.=..()
	if(. && !cell && suitable_cell)
		cell = new suitable_cell(src)

/obj/item/device/chameleon/get_cell()
	return cell

/obj/item/device/chameleon/handle_atom_del(atom/A)
	..()
	if(A == cell)
		cell = null

/obj/item/device/chameleon/examine(mob/user)
	..()
	if(cell)
		to_chat(user, SPAN_NOTICE("\The [src]'s cell reads \"[round(cell.percent())]%\""))
	else
		to_chat(user, SPAN_WARNING("\The [src] has no cell."))

/obj/item/device/chameleon/dropped()
	disrupt()
	..()

/obj/item/device/chameleon/equipped()
	disrupt()
	..()

/obj/item/device/chameleon/attack_self()
	toggle()

/obj/item/device/chameleon/Process()
	if(active_dummy)
		if(cell)
			cell.checked_use(tick_cost)

/obj/item/device/chameleon/MouseDrop(over_object)
	if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell,usr))
		cell = null
	else
		return ..()

/obj/item/device/chameleon/attackby(var/obj/item/C, mob/living/user)
	if(istype(C, suitable_cell) && !cell && insert_item(C, user))
		cell = C
		return
	..()

/obj/item/device/chameleon/afterattack(atom/target, mob/user , proximity)
	if (istype(target, /obj/item/storage)) return
	if(!proximity) return
	if(!active_dummy)
		if(scan_item(target))
			playsound(get_turf(src), 'sound/weapons/flash.ogg', 100, 1, -6)
			to_chat(user, SPAN_NOTICE("Scanned [target]."))
			saved_item = target.type
			saved_icon = target.icon
			saved_icon_state = target.icon_state
			saved_overlays = target.overlays
		to_chat(user, SPAN_WARNING("\The [target] is an invalid target."))

/obj/item/device/chameleon/proc/scan_item(var/obj/item/I)
	if(!istype(I))
		return FALSE
	if(GLOB.champroj_blacklist.Find(I.type))
		return FALSE
	if(GLOB.champroj_whitelist.Find(I.type))
		return TRUE
	var/icon/icon_to_check = icon(I.icon, I.icon_state, I.dir)
	var/total_pixels = 0
	for(var/y = 0 to icon_to_check.Width())
		for(var/x = 0 to icon_to_check.Height())
			if(icon_to_check.GetPixel(x, y))
				total_pixels++
	if(total_pixels < CHAMELEON_MIN_PIXELS)
		GLOB.champroj_blacklist.Add(I.type)
		return FALSE
	GLOB.champroj_whitelist.Add(I.type)
	return TRUE

/obj/item/device/chameleon/proc/toggle()
	if(!can_use || !saved_item) return
	if(active_dummy)
		eject_all()
		playsound(get_turf(src), 'sound/effects/pop.ogg', 100, 1, -6)
		qdel(active_dummy)
		active_dummy = null
		to_chat(usr, SPAN_NOTICE("You deactivate the [src]."))
		var/obj/effect/overlay/T = new(get_turf(src))
		T.icon = 'icons/effects/effects.dmi'
		flick("emppulse",T)
		STOP_PROCESSING(SSobj, src)
		spawn(8) qdel(T)
	else
		playsound(get_turf(src), 'sound/effects/pop.ogg', 100, 1, -6)
		var/obj/O = new saved_item(src)
		if(!O) return
		var/obj/effect/dummy/chameleon/C = new(usr.loc)
		C.activate(O, usr, saved_icon, saved_icon_state, saved_overlays, src)
		qdel(O)
		to_chat(usr, SPAN_NOTICE("You activate the [src]."))
		var/obj/effect/overlay/T = new/obj/effect/overlay(get_turf(src))
		T.icon = 'icons/effects/effects.dmi'
		flick("emppulse",T)
		START_PROCESSING(SSobj, src)
		spawn(8) qdel(T)

/obj/item/device/chameleon/proc/disrupt(var/delete_dummy = 1)
	if(active_dummy)
		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread
		spark_system.set_up(5, 0, src)
		spark_system.attach(src)
		spark_system.start()
		eject_all()
		if(delete_dummy)
			qdel(active_dummy)
		active_dummy = null
		can_use = 0
		spawn(50) can_use = 1

/obj/item/device/chameleon/proc/eject_all()
	for(var/atom/movable/A in active_dummy)
		A.loc = active_dummy.loc
		if(ismob(A))
			var/mob/M = A
			M.reset_view(null)

/obj/effect/dummy/chameleon
	name = ""
	desc = ""
	density = 0
	anchored = 1
	var/obj/item/device/chameleon/master = null

/obj/effect/dummy/chameleon/proc/activate(var/obj/O, var/mob/M, new_icon, new_iconstate, new_overlays, var/obj/item/device/chameleon/C)
	name = O.name
	desc = O.desc
	icon = new_icon
	icon_state = new_iconstate
	copy_overlays(new_overlays, TRUE)
	set_dir(O.dir)
	M.loc = src
	master = C
	master.active_dummy = src

/obj/effect/dummy/chameleon/attackby()
	for(var/mob/M in src)
		to_chat(M, SPAN_WARNING("Your chameleon-projector deactivates."))
	master.disrupt()

/obj/effect/dummy/chameleon/attack_hand()
	for(var/mob/M in src)
		to_chat(M, SPAN_WARNING("Your chameleon-projector deactivates."))
	master.disrupt()

/obj/effect/dummy/chameleon/ex_act()
	for(var/mob/M in src)
		to_chat(M, SPAN_WARNING("Your chameleon-projector deactivates."))
	master.disrupt()

/obj/effect/dummy/chameleon/bullet_act(var/obj/item/projectile/Proj)
	if (!(Proj.testing))
		for(var/mob/M in src)
			to_chat(M, SPAN_WARNING("Your chameleon-projector deactivates."))
	..()
	if (!(Proj.testing))
		master.disrupt()

/obj/effect/dummy/chameleon/relaymove(var/mob/user, direction)
	if(istype(loc, /turf/space)) return //No magical space movement!
	var/move_delay = 0
	switch(user.bodytemperature)
		if(300 to INFINITY)
			move_delay = 10
		if(295 to 300)
			move_delay = 13
		if(280 to 295)
			move_delay = 16
		if(260 to 280)
			move_delay = 20
		else
			move_delay = 25
	if(!master.cell || !master.cell.checked_use(master.move_cost))
		user.add_move_cooldown(move_delay)

	step(src, direction)

/obj/effect/dummy/chameleon/Destroy()
	master.disrupt(0)
	. = ..()

/obj/effect/dummy/chameleon/Crossed(AM as mob|obj)
	if(isobj(AM) || isliving(AM))
		master.disrupt()
	..()
