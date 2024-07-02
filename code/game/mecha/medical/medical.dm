/obj/mecha/medical
	step_sound = 'sound/mecha/mechstep.ogg'
	step_turn_sound = 'sound/mecha/mechmove01.ogg'

	internal_damage_threshold = 40
	cargo_capacity = 5

/obj/mecha/medical/Initialize()
	. = ..()
	var/turf/T = get_turf(src)
	if(isPlayerLevel(T.z))
		new /obj/item/mecha_parts/mecha_tracking(src)

