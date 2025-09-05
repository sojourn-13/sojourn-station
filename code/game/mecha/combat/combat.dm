/obj/mecha/combat
	force = 30
	internal_damage_threshold = 50
	maint_access = 0
	damage_absorption = list("brute"=0.7,"fire"=1,"bullet"=0.7,"energy"=1,"bomb"=0.8)
	cargo_capacity = 5

/obj/mecha/combat/moved_inside(mob/living/carbon/human/H)
	. = ..()
	if(. && H.client)
		H.client.mouse_pointer_icon = file('icons/mecha/mecha_mouse.dmi')

/obj/mecha/combat/go_out()
	if(occupant?.client)
		occupant.client.mouse_pointer_icon = initial(occupant.client.mouse_pointer_icon)
	. = ..()
