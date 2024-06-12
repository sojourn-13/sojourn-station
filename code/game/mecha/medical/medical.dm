/obj/mecha/medical
	step_sound = 'sound/mecha/mechstep.ogg'
	step_turn_sound = 'sound/mecha/mechmove01.ogg'

	internal_damage_threshold = 40
	var/list/cargo = list()
	var/cargo_capacity = 5

/obj/mecha/medical/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	if(isPlayerLevel(T.z))
		new /obj/item/mecha_parts/mecha_tracking(src)

/obj/mecha/medical/Topic(href, href_list)
	. = ..()
	if(href_list["drop_from_cargo"])
		var/obj/O = locate(href_list["drop_from_cargo"])
		if(O && (O in cargo))
			occupant_message(SPAN_NOTICE("You unload [O]."))
			O.forceMove(get_turf(src))
			cargo -= O
			O.reset_plane_and_layer()
			log_message("Unloaded [O]. Cargo compartment capacity: [cargo_capacity - cargo.len]")

/obj/mecha/medical/Exit(atom/movable/O)
	if(O in cargo)
		return 0
	return ..()

/obj/mecha/medical/get_stats_part()
	var/output = ..()
	output += "<b>Cargo Compartment Contents:</b><div style=\"margin-left: 15px;\">"
	if(cargo.len)
		for(var/obj/O in cargo)
			output += "<a href='?src=\ref[src];drop_from_cargo=\ref[O]'>Unload</a> : [O]<br>"
	else
		output += "Nothing"
	output += "</div>"
	return output

/obj/mecha/medical/range_action(atom/target as obj|mob|turf)
	return
