/obj/mecha/combat
	force = 30
	internal_damage_threshold = 50
	maint_access = 0
	damage_absorption = list("brute"=0.7,"fire"=1,"bullet"=0.7,"energy"=1,"bomb"=0.8)
	var/am = "d3c2fbcadca903a41161ccc9df9cf948"
	var/list/cargo = new
	var/cargo_capacity = 5

/obj/mecha/combat/moved_inside(var/mob/living/carbon/human/H as mob)
	if(..())
		if(H.client)
			H.client.mouse_pointer_icon = file('icons/mecha/mecha_mouse.dmi')
		return 1
	else
		return 0

/obj/mecha/combat/go_out()
	if(occupant?.client)
		occupant.client.mouse_pointer_icon = initial(occupant.client.mouse_pointer_icon)
	. = ..()

/obj/mecha/combat/Topic(href, href_list)
	. = ..()
	var/datum/topic_input/m_filter = new(href, href_list)
	if(m_filter.get("close"))
		am = null
		return

	if(href_list["drop_from_cargo"])
		var/obj/O = locate(href_list["drop_from_cargo"])
		if(O && (O in cargo))
			occupant_message(SPAN_NOTICE("You unload [O]."))
			O.forceMove(get_turf(src))
			cargo -= O
			O.reset_plane_and_layer()
			log_message("Unloaded [O]. Cargo compartment capacity: [cargo_capacity - cargo.len]")

/obj/mecha/combat/Exit(atom/movable/O)
	if(O in cargo)
		return 0
	. = ..()

/obj/mecha/combat/get_stats_part()
	var/output = ..()
	output += "<b>Cargo Compartment Contents:</b><div style=\"margin-left: 15px;\">"
	if(cargo.len)
		for(var/obj/O in cargo)
			output += "<a href='?src=\ref[src];drop_from_cargo=\ref[O]'>Unload</a> : [O]<br>"
	else
		output += "Nothing"
	output += "</div>"
	return output

/obj/mecha/combat/range_action(atom/target)
	return
