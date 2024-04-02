/obj/mecha/medical/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	if(isPlayerLevel(T.z))
		new /obj/item/mecha_parts/mecha_tracking(src)
	return


/obj/mecha/medical/mechturn(direction)
	set_dir(direction)
	playsound(src,'sound/mecha/mechmove01.ogg',40,1)
	return 1

/obj/mecha/medical/mechstep(direction)
	var/result = step(src,direction)
	if(result)
		playsound(src,'sound/mecha/mechstep.ogg',25,1)
	return result

/obj/mecha/medical/mechsteprand()
	var/result = step_rand(src)
	if(result)
		playsound(src,'sound/mecha/mechstep.ogg',25,1)
	return result


/obj/mecha/medical
	internal_damage_threshold = 40
	var/list/cargo = new
	var/cargo_capacity = 5

/obj/mecha/medical/Topic(href, href_list)
	..()
	if(href_list["drop_from_cargo"])
		var/obj/O = locate(href_list["drop_from_cargo"])
		if(O && (O in src.cargo))
			occupant_message(SPAN_NOTICE("You unload [O]."))
			O.loc = get_turf(src)
			cargo -= O
			O.reset_plane_and_layer()
			var/turf/T = get_turf(O)
			if(T)
				T.Entered(O)
			log_message("Unloaded [O]. Cargo compartment capacity: [cargo_capacity - src.cargo.len]")
	return

/obj/mecha/medical/Exit(atom/movable/O)
	if(O in cargo)
		return 0
	return ..()

/obj/mecha/medical/get_stats_part()
	var/output = ..()
	output += "<b>Cargo Compartment Contents:</b><div style=\"margin-left: 15px;\">"
	if(src.cargo.len)
		for(var/obj/O in src.cargo)
			output += "<a href='?src=\ref[src];drop_from_cargo=\ref[O]'>Unload</a> : [O]<br>"
	else
		output += "Nothing"
	output += "</div>"
	return output

/obj/mecha/medical/range_action(atom/target as obj|mob|turf)
	return
