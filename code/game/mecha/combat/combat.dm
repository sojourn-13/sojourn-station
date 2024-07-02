/obj/mecha/combat
	force = 30
	internal_damage_threshold = 50
	maint_access = 0
	damage_absorption = list("brute"=0.7,"fire"=1,"bullet"=0.7,"energy"=1,"bomb"=0.8)
	var/am = "d3c2fbcadca903a41161ccc9df9cf948"
	cargo_capacity = 5

/obj/mecha/combat/moved_inside(mob/living/carbon/human/H)
	. = ..()
	if(. && H.client)
		H.client.mouse_pointer_icon = file('icons/mecha/mecha_mouse.dmi')

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

