/obj/item/mecha_parts/mecha_equipment/combat_shield
	name = "linear combat shield"
	desc = "A shield generator that forms a rectangular, unidirectionally projectile-blocking wall in front of the exosuit."
	icon_state = "shield_droid"
	origin_tech = list(TECH_PLASMA = 3, TECH_MAGNET = 6, TECH_ILLEGAL = 4)
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_GOLD = 6, MATERIAL_SILVER = 6, MATERIAL_URANIUM = 4, MATERIAL_PLATINUM = 4, MATERIAL_DIAMOND = 2)
	equip_cooldown = 5
	energy_drain = 20
	range = 0
	price_tag = 2000

	var/obj/item/shield_projector/line/exosuit/my_shield = null
	var/my_shield_type = /obj/item/shield_projector/line/exosuit
	var/icon/drone_overlay

/obj/item/mecha_parts/mecha_equipment/combat_shield/New()
	. = ..()
	my_shield = new my_shield_type
	my_shield.shield_regen_delay = equip_cooldown
	my_shield.my_tool = src

/obj/item/mecha_parts/mecha_equipment/combat_shield/critfail()
	..()
	my_shield.adjust_health(-200)

/obj/item/mecha_parts/mecha_equipment/combat_shield/Destroy()
	if(chassis)
		chassis.overlays -= drone_overlay
		my_shield.forceMove(src)
		my_shield.destroy_shields()
		my_shield.my_tool = null
		my_shield.my_mecha = null
	if(my_shield)
		QDEL_NULL(my_shield)
	return ..()

/obj/item/mecha_parts/mecha_equipment/combat_shield/attach(obj/mecha/M as obj)
	..()
	if(chassis)
		my_shield.shield_health = 0
		my_shield.my_mecha = chassis
		my_shield.forceMove(chassis)

		drone_overlay = new(icon, icon_state = "shield_droid")
		M.add_overlay(drone_overlay)

/obj/item/mecha_parts/mecha_equipment/combat_shield/detach()
	chassis.overlays -= drone_overlay
	. = ..()
	my_shield.destroy_shields()
	my_shield.my_mecha = null
	my_shield.shield_health = my_shield.max_shield_health
	my_shield.forceMove(src)

/obj/item/mecha_parts/mecha_equipment/proc/handle_movement_action() //Any modules that have special effects or needs when taking a step or floating through space.
	return

/obj/item/mecha_parts/mecha_equipment/combat_shield/handle_movement_action()
	if(chassis)
		my_shield.update_shield_positions()

/obj/item/mecha_parts/mecha_equipment/combat_shield/proc/toggle_shield()
	if(chassis)
		my_shield.attack_self(chassis.occupant)
		if(my_shield.active)
			set_ready_state(0)
			log_message("Activated.")
		else
			set_ready_state(1)
			log_message("Deactivated.")

/obj/item/mecha_parts/mecha_equipment/combat_shield/Topic(href, href_list)
	..()
	if(href_list["toggle_shield"])
		toggle_shield()

/obj/item/mecha_parts/mecha_equipment/combat_shield/get_equip_info()
	if(!chassis) return
	return "<span style=\"color:[equip_ready?"#0f0":"#f00"];\">*</span>&nbsp;[name] - <a href='?src=\ref[src];toggle_shield=1'>[my_shield.active?"Dea":"A"]ctivate</a>"

//shield subtypes (personal shields)
/obj/effect/directional_shield/personal
	name = "personal combat shield"
	desc = "A wide shield, which has the property to block incoming projectiles but allow outgoing projectiles to pass it.  \
	Slower moving objects are not blocked, so people can walk in and out of the barrier, and things can be thrown into and out \
	of it."
	icon_state = "church_shield" //this icon is really really annoying so I've soft-disabeld it on the projecter itself. No point in deleting it so I'll leave it here incase someone wants to improve it.

// This is the actual shield.  The projector is a different item.
/obj/effect/directional_shield
	name = "directional combat shield"
	desc = "A wide shield, which has the property to block incoming projectiles but allow outgoing projectiles to pass it.  \
	Slower moving objects are not blocked, so people can walk in and out of the barrier, and things can be thrown into and out \
	of it."
	icon = 'icons/effects/effects.dmi'
	icon_state = "directional_shield"
	density = FALSE // People can move pass these shields.
	opacity = FALSE
	anchored = TRUE
	unacidable = TRUE
	layer = MOB_LAYER + 0.1
	mouse_opacity = FALSE
	var/obj/item/shield_projector/projector = null // The thing creating the shield.
	var/x_offset = 0 // Offset from the 'center' of where the projector is, so that if it moves, the shield can recalc its position.
	var/y_offset = 0 // Ditto.

/obj/effect/directional_shield/Initialize(mapload, new_projector)
	. = ..()
	if(new_projector)
		projector = new_projector
		var/turf/us = get_turf(src)
		var/turf/them = get_turf(projector)
		if(them)
			x_offset = us.x - them.x
			y_offset = us.y - them.y
	else
		update_color()

/obj/effect/directional_shield/proc/relocate()
	if(!projector)
		return // Nothing to follow.
	var/turf/T = get_turf(projector)
	if(!T)
		return
	var/turf/new_pos = locate(T.x + x_offset, T.y + y_offset, T.z)
	if(new_pos)
		forceMove(new_pos)
	else
		qdel(src)

/obj/effect/directional_shield/proc/update_color(var/new_color)
	if(!projector)
		color = "#0099FF"
	else
		animate(src, color = new_color, 5)

/obj/effect/directional_shield/Destroy()
	if(projector)
		projector.active_shields -= src
		projector = null
	return ..()

/obj/effect/directional_shield/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height == 0))
		return TRUE
	else if(istype(mover, /obj/item/projectile))
		var/obj/item/projectile/P = mover
		if(istype(P, /obj/item/projectile/test) || P.testing) // Turrets need to try to kill the shield and so their test bullet needs to penetrate.
			return TRUE

		var/bad_arc = reverse_direction(dir) // Arc of directions from which we cannot block.
		if(check_parry_arc(src, bad_arc, P)) // This is actually for mobs but it will work for our purposes as well.
			return FALSE
		else
			return TRUE
	return TRUE

/obj/effect/directional_shield/bullet_act(var/obj/item/projectile/P)
	if(!P.testing)
		adjust_health(-P.get_structure_damage())
	P.on_hit()
	if(!P.testing)
		playsound(get_turf(src), 'sound/effects/EMPulse.ogg', 75, 1)

// All the shields tied to their projector are one 'unit', and don't have individualized health values like most other shields.
/obj/effect/directional_shield/proc/adjust_health(amount)
	if(projector)
		projector.adjust_health(amount) // Projector will kill the shield if needed.
	// If the shield lacks a projector, then it was probably spawned in by an admin for bus, so it's indestructable.

// This actually creates the shields.  It's an item so that it can be carried, but it could also be placed inside a stationary object if desired.
// It should work inside the contents of any mob.
/obj/item/shield_projector
	name = "combat shield projector"
	desc = "A miniturized and compact shield projector.  This type has been optimized to diffuse lasers or block high velocity projectiles from the outside, \
	but allow those projectiles to leave the shield from the inside.  Blocking too many damaging projectiles will cause the shield to fail."
	icon = 'icons/obj/device.dmi'
	icon_state = "shield1"
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_POCKET|SLOT_BELT
	matter = list(MATERIAL_PLASTEEL = 6, MATERIAL_GOLD = 3, MATERIAL_SILVER = 3, MATERIAL_URANIUM = 2, MATERIAL_PLATINUM = 2, MATERIAL_DIAMOND = 1)
	var/active = FALSE					// If it's on.
	var/shield_health = 400				// How much damage the shield blocks before breaking.  This is a shared health pool for all shields attached to this projector.
	var/max_shield_health = 400			// Ditto.  This is fairly high, but shields are really big, you can't miss them, and laser carbines pump out so much hurt.
	var/shield_regen_amount = 10		// How much to recharge every process(), after the delay.
	var/shield_regen_delay = 10 SECONDS	// If the shield takes damage, it won't recharge for this long.
	var/last_damaged_time = null		// world.time when the shields took damage, used for the delay.
	var/list/active_shields = list()	// Shields that are active and deployed.
	var/always_on = FALSE				// If true, will always try to reactivate if disabled for whatever reason, ideal if AI mobs are holding this.
	var/high_color = "#7f7fff"			// Color the shield will be when at max health.  Clear so it cannot be seen.
	var/low_color = "#FF0000"			// Color the shield will drift towards as health is lowered.  Deep red.

/obj/item/shield_projector/Initialize(mapload)
	. = ..()
	START_PROCESSING(SSobj, src)
	if(always_on)
		create_shields()

/obj/item/shield_projector/Destroy()
	destroy_shields()
	STOP_PROCESSING(SSobj, src)
	return ..()

//called to set the atom's dir and used to add behaviour to dir-changes
/atom/proc/setDir(new_dir)
	. = new_dir != dir
	dir = new_dir

/obj/item/shield_projector/proc/create_shield(var/newloc, var/new_dir)
	var/obj/effect/directional_shield/S = new(newloc, src)
	S.dir = new_dir
	active_shields += S

/obj/item/shield_projector/proc/create_shields() // Override this for a specific shape.  Be sure to call ..() for the checks, however.
	if(active) // Already made.
		return FALSE
	if(shield_health <= 0)
		return FALSE
	active = TRUE
	return TRUE

/obj/item/shield_projector/proc/destroy_shields()
	for(var/obj/effect/directional_shield/S in active_shields)
		active_shields -= S
		qdel(S)
	active = FALSE

/obj/item/shield_projector/proc/update_shield_positions()
	if(istype(loc,/obj/item/storage) || istype(loc,/obj/structure/closet || istype(loc,/obj/item/clothing/suit/storage)))	//no point in finding spot for light if flashlight is inside container
		destroy_shields()
		return
	for(var/obj/effect/directional_shield/S in active_shields)
		S.relocate()

/obj/item/shield_projector/proc/adjust_health(amount)
	shield_health = between(0, shield_health + amount, max_shield_health)
	if(amount < 0)
		if(shield_health <= 0)
			destroy_shields()
			var/turf/T = get_turf(src)
			T.visible_message(SPAN_DANGER("[src] overloads and the shield vanishes!"))
			playsound(get_turf(src), 'sound/machines/defib_failed.ogg', 75, 0)
		else
			if(shield_health < max_shield_health / 4) // Play a more urgent sounding beep if it's at 25% health.
				playsound(get_turf(src), 'sound/machines/defib_success.ogg', 75, 0)
			else
				playsound(get_turf(src), 'sound/machines/defib_SafetyOn.ogg', 75, 0)
		last_damaged_time = world.time
	update_shield_colors()

// Makes shields become gradually more red as the projector's health decreases.
/obj/item/shield_projector/proc/update_shield_colors()
	// This is done at the projector instead of the shields themselves to avoid needing to calculate this more than once every update.
	var/lerp_weight = shield_health / max_shield_health

	var/list/low_color_list = hex2rgb(low_color)
	var/low_r = low_color_list[1]
	var/low_g = low_color_list[2]
	var/low_b = low_color_list[3]

	var/list/high_color_list = hex2rgb(high_color)
	var/high_r = high_color_list[1]
	var/high_g = high_color_list[2]
	var/high_b = high_color_list[3]

	var/new_r = LERP(low_r, high_r, lerp_weight)
	var/new_g = LERP(low_g, high_g, lerp_weight)
	var/new_b = LERP(low_b, high_b, lerp_weight)

	var/new_color = rgb(new_r, new_g, new_b)

	// Now deploy the new color to all the shields.
	for(var/obj/effect/directional_shield/S in active_shields)
		S.update_color(new_color)

/obj/item/shield_projector/attack_self(mob/living/user)
	if(active)
		if(always_on)
			to_chat(user, SPAN_WARNING("You can't seem to deactivate [src]"))
			return

		destroy_shields()
	else
		setDir(user.dir) // Needed for linear shields.
		create_shields()
	visible_message(SPAN_NOTICE("[user] [!active ? "de":""]activates \the [src]."))

/obj/item/shield_projector/Process()
	if(always_on && !active) // Make shields as soon as possible if this is set.
		create_shields()
	if(shield_health < max_shield_health)
		if( (last_damaged_time + shield_regen_delay) < world.time)
			if(always_on || !active)
				adjust_health(shield_regen_amount)
			if(shield_health == max_shield_health)
				playsound(get_turf(src), 'sound/machines/defib_ready.ogg', 75, 0)
		else
			playsound(get_turf(src), 'sound/machines/defib_safetyOff.ogg', 75, 0)

/obj/item/shield_projector/examine(mob/user)
	. = ..()
	if(get_dist(src, user) <= 1)
		to_chat(user, "\The [src]'s shield matrix is at [round( (shield_health / max_shield_health) * 100, 0.01)]% strength.")

/obj/item/shield_projector/emp_act(severity)
	adjust_health(-max_shield_health / severity) // A strong EMP will kill the shield instantly, but weaker ones won't on the first hit.

/obj/item/shield_projector/Move(newloc, direct)
	. = ..(newloc, direct)
	update_shield_positions()

/obj/item/shield_projector/entered_with_container()
	update_shield_positions()

/obj/item/shield_projector/container_dir_changed(new_dir)
	update_shield_positions()

/obj/item/shield_projector/pre_pickup(mob/user)
	update_shield_positions()
	return ..()

/obj/item/shield_projector/dropped(mob/user as mob)
	update_shield_positions()

// Subtypes

/obj/item/shield_projector/rectangle
	name = "rectangular combat shield projector"
	description_info = "This creates a shield in a rectangular shape, which allows projectiles to leave from inside but blocks projectiles from outside.  \
	Everything else can pass through the shield freely, including other people and thrown objects. The shield also cannot block certain effects which \
	take place over an area, such as flashbangs or explosions."
	var/size_x = 3						// How big the rectangle will be, in tiles from the center.
	var/size_y = 3						// Ditto.

//Personal variants
/obj/item/shield_projector/rectangle/soteria_personal
	name = "research overseer personal shield"
	description_info = "This creates a shield in a square shape around the user, which allows projectiles to leave from inside but blocks projectiles from outside.  \
	Everything else can pass through the shield freely, including other people and thrown objects. The shield also cannot block certain effects which \
	take place over an area, such as flashbangs or explosions."
	size_x = 1 //Focus on protecting areself over others.
	size_y = 1

/obj/item/shield_projector/rectangle/church_personal
	name = "rosaria personal shield"
	description_info = "A personal shield designed by the church to rival the Soteria shields, though it is weaker than most soteria shields it none the less provides extra protection, \
	this allows projectiles to leave from inside but blocks projectiles from outside. Everything else can pass through the shield freely, including other people and thrown objects. \
	The shield also cannot block certain effects which \
	take place over an area, such as flashbangs or explosions."
	icon_state = "last_shelter"
	high_color = "#EADB83"
	shield_health = 300
	max_shield_health = 300
	size_x = 2 //but the Prime? We protect are own!
	size_y = 2

/obj/item/shield_projector/rectangle/borg_personal
	name = "integrated combat shield projector"
	description_info = "A small integral shield emitter designed for use by synthetics. Smaller and more cheaply made, it is notably less efficient than higher end models,\
	Persona Shields allow projectiles to leave from inside but blocks projectiles from outside.  Everything else can pass through the shield freely, \
	including other people and thrown objects. The shield also cannot block certain effects which \
	take place over an area, such as flashbangs or explosions."
	shield_health = 200
	max_shield_health = 200
	shield_regen_amount = 5
	size_x = 1
	size_y = 1

// A shortcut for admins to spawn in to put into simple animals or other things where it needs to reactivate automatically.
/obj/item/shield_projector/rectangle/automatic
	always_on = TRUE

/obj/item/shield_projector/rectangle/automatic/weak
	shield_health = 200 // Half as strong as the default.
	max_shield_health = 200
	size_x = 2
	size_y = 2

// Horrible implementation below.
/obj/item/shield_projector/rectangle/create_shields()
	if(!..())
		return FALSE

	// Make a rectangle in a really terrible way.
	var/x_dist = size_x
	var/y_dist = size_y

	var/turf/T = get_turf(src)
	if(!T)
		return FALSE
	// Top left corner.
	var/turf/T1 = locate(T.x - x_dist, T.y + y_dist, T.z)
	// Bottom right corner.
	var/turf/T2 = locate(T.x + x_dist, T.y - y_dist, T.z)
	if(!T1 || !T2) // If we're on the edge of the map then don't bother.
		return FALSE

	// Build half of the corners first, as they are 'anchors' for the rest of the code below.
	create_shield(T1, NORTHWEST)
	create_shield(T2, SOUTHEAST)

	// Build the edges.
	// First start with the north side.
	var/current_x = T1.x + 1 // Start next to the top left corner.
	var/current_y = T1.y
	var/length = (x_dist * 2) - 1
	for(var/i = 1 to length)
		create_shield(locate(current_x, current_y, T.z), NORTH)
		current_x++

	// Make the top right corner.
	create_shield(locate(current_x, current_y, T.z), NORTHEAST)

	// Now for the west edge.
	current_x = T1.x
	current_y = T1.y - 1
	length = (y_dist * 2) - 1
	for(var/i = 1 to length)
		create_shield(locate(current_x, current_y, T.z), WEST)
		current_y--

	// Make the bottom left corner.
	create_shield(locate(current_x, current_y, T.z), SOUTHWEST)

	// Switch to the second corner, and make the east edge.
	current_x = T2.x
	current_y = T2.y + 1
	length = (y_dist * 2) - 1
	for(var/i = 1 to length)
		create_shield(locate(current_x, current_y, T.z), EAST)
		current_y++

	// There are no more corners to create, so we can just go build the south edge now.
	current_x = T2.x - 1
	current_y = T2.y
	length = (x_dist * 2) - 1
	for(var/i = 1 to length)
		create_shield(locate(current_x, current_y, T.z), SOUTH)
		current_x--
	// Finally done.
	update_shield_colors()
	return TRUE

/obj/item/shield_projector/line
	name = "linear combat shield projector"
	description_info = "This creates a shield in a straight line perpendicular to the direction where the user was facing when it was activated. \
	The shield allows projectiles to leave from inside but blocks projectiles from outside.  Everything else can pass through the shield freely, \
	including other people and thrown objects.  The shield also cannot block certain effects which take place over an area, such as flashbangs or explosions."
	var/line_length = 5			// How long the line is.  Recommended to be an odd number.
	var/offset_from_center = 2	// How far from the projector will the line's center be.

/obj/item/shield_projector/line/create_shields()
	if(!..())
		return FALSE

	var/turf/T = get_turf(src) // This is another 'anchor', or will be once we move away from the projector.
	for(var/i = 1 to offset_from_center)
		T = get_step(T, dir)
	if(!T) // We went off the map or something.
		return
	// We're at the right spot now.  Build the center piece.
	create_shield(T, dir)

	var/length_to_build = round( (line_length - 1) / 2)
	var/turf/temp_T = T

	// First loop, we build the left (from a north perspective) side of the line.
	for(var/i = 1 to length_to_build)
		temp_T = get_step(temp_T, turn(dir, 90) )
		if(!temp_T)
			break
		create_shield(temp_T, i == length_to_build ? turn(dir, 45) : dir)

	temp_T = T

	// Second loop, we build the right side.
	for(var/i = 1 to length_to_build)
		temp_T = get_step(temp_T, turn(dir, -90) )
		if(!temp_T)
			break
		create_shield(temp_T, i == length_to_build ? turn(dir, -45) : dir)
	// Finished.
	update_shield_colors()
	return TRUE

/obj/item/shield_projector/line/exosuit //Variant for Exosuit design.
	name = "linear exosuit shield projector"
	offset_from_center = 1 //Snug against the exosuit.
	max_shield_health = 200

	var/obj/mecha/my_mecha = null
	var/obj/item/mecha_parts/mecha_equipment/combat_shield/my_tool = null

/obj/item/shield_projector/line/exosuit/Process()
	..()
	if((my_tool && loc != my_tool) && (my_mecha && loc != my_mecha))
		forceMove(my_tool)
	if(active)
		my_tool.set_ready_state(0)
		if(my_mecha.has_charge(my_tool.energy_drain * 50)) //Stops at around 1000 charge.
			my_mecha.use_power(my_tool.energy_drain)
		else
			destroy_shields()
			my_tool.set_ready_state(1)
			my_tool.log_message("Power lost.")
	else
		my_tool.set_ready_state(1)

/obj/item/shield_projector/line/exosuit/attack_self(mob/living/user)
	if(active)
		if(always_on)
			to_chat(user, SPAN_WARNING("You can't seem to deactivate [src]."))
			return

		destroy_shields()
	else
		if(istype(user.loc, /obj/mecha))
			setDir(user.loc.dir)
		else
			setDir(user.dir)
		create_shields()
	visible_message(SPAN_NOTICE("[user] [!active ? "de":""]activates [src]."))

/obj/item/shield_projector/line/exosuit/adjust_health(amount)
	. = ..()
	my_mecha.use_power(my_tool.energy_drain)
	if(!active && shield_health < shield_regen_amount)
		my_tool.log_message("Shield overloaded.")
		my_mecha.use_power(my_tool.energy_drain * 4)

// Converts a hexadecimal color (e.g. #FF0050) to a list of numbers for red, green, and blue (e.g. list(255,0,80) ).
/proc/hex2rgb(hex)
	// Strips the starting #, in case this is ever supplied without one, so everything doesn't break.
	if(findtext(hex,"#",1,2))
		hex = copytext(hex, 2)
	return list(hex2rgb_r(hex), hex2rgb_g(hex), hex2rgb_b(hex))

// The three procs below require that the '#' part of the hex be stripped, which hex2rgb() does automatically.
/proc/hex2rgb_r(hex)
	var/hex_to_work_on = copytext(hex,1,3)
	return hex2num(hex_to_work_on)

/proc/hex2rgb_g(hex)
	var/hex_to_work_on = copytext(hex,3,5)
	return hex2num(hex_to_work_on)

/proc/hex2rgb_b(hex)
	var/hex_to_work_on = copytext(hex,5,7)
	return hex2num(hex_to_work_on)
