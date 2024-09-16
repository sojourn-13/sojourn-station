/obj/mecha/working
	internal_damage_threshold = 50
	force = 15
	cargo_capacity = 5

/obj/mecha/working/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	if(isPlayerLevel(T.z))
		new /obj/item/mecha_parts/mecha_tracking(src)
