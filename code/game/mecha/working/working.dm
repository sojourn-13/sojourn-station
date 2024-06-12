/obj/mecha/working
	internal_damage_threshold = 50
	force = 15
	var/list/cargo = list()
	var/cargo_capacity = 5

/obj/mecha/working/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	if(isPlayerLevel(T.z))
		new /obj/item/mecha_parts/mecha_tracking(src)

/obj/mecha/working/Destroy()
	for(var/mob/M in src)
		if(M == occupant)
			continue
		M.forceMove(get_turf(src))
		step_rand(M)
	for(var/atom/movable/A in cargo)
		A.forceMove(get_turf(src))
		step_rand(A)
	return ..()

/obj/mecha/working/Topic(href, href_list)
	..()
	if(href_list["drop_from_cargo"])
		var/obj/O = locate(href_list["drop_from_cargo"])
		if(O && (O in cargo))
			occupant_message(SPAN_NOTICE("You unload [O]."))
			O.forceMove(get_turf(src))
			cargo -= O
			O.reset_plane_and_layer()
			log_message("Unloaded [O]. Cargo compartment capacity: [cargo_capacity - cargo.len]")

/obj/mecha/working/Exit(atom/movable/O)
	if(O in cargo)
		return 0
	return ..()

/obj/mecha/working/get_stats_part()
	var/output = ..()
	output += "<b>Cargo Compartment Contents:</b><div style=\"margin-left: 15px;\">"
	if(cargo.len)
		for(var/obj/O in cargo)
			output += "<a href='?src=\ref[src];drop_from_cargo=\ref[O]'>Unload</a> : [O]<br>"
	else
		output += "Nothing"
	output += "</div>"
	return output

/obj/mecha/working/range_action(atom/target)
	return
