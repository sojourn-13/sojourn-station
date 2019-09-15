/obj/item/clothing/head/soft
	name = "yellow cap"
	initial_name = "yellow cap"
	desc = "A peaked cap in a yellow color."
	icon_state = "cargosoft"
	item_state_slots = list(
		slot_l_hand_str = "helmet", //probably a placeholder
		slot_r_hand_str = "helmet",
		)
	var/flipped = 0
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/soft/dropped()
	src.icon_state = initial(icon_state)
	src.flipped=0
	..()

/obj/item/clothing/head/soft/attack_self(mob/user)
	src.flipped = !src.flipped
	if(src.flipped)
		icon_state = "[icon_state]_flipped"
		to_chat(user, "You flip the hat backwards.")
	else
		src.icon_state = initial(icon_state)
		to_chat(user, "You flip the hat back in normal position.")
	update_wear_icon()	//so our mob-overlays update

/obj/item/clothing/head/soft/red
	name = "red cap"
	initial_name = "red cap"
	desc = "A peaked cap in a red color."
	icon_state = "redsoft"

/obj/item/clothing/head/soft/blue
	name = "blue cap"
	initial_name = "blue cap"
	desc = "A peaked cap in a blue color."
	icon_state = "bluesoft"

/obj/item/clothing/head/soft/green
	name = "green cap"
	initial_name = "green cap"
	desc = "A peaked cap in a green color."
	icon_state = "greensoft"

/obj/item/clothing/head/soft/grey
	name = "grey cap"
	initial_name = "grey cap"
	desc = "A peaked cap in a grey color."
	icon_state = "greysoft"

/obj/item/clothing/head/soft/orange
	name = "orange cap"
	initial_name = "orange cap"
	desc = "A peaked cap in a orange color."
	icon_state = "orangesoft"

/obj/item/clothing/head/soft/mime
	name = "white cap"
	initial_name = "white cap"
	desc = "A peaked cap in a white color."
	icon_state = "mimesoft"

/obj/item/clothing/head/soft/purple
	name = "purple cap"
	initial_name = "purple cap"
	desc = "A peaked cap in a purple color."
	icon_state = "purplesoft"

/obj/item/clothing/head/customcap
	name = "customized cap"
	initial_name = "customized  cap"
	desc = "A customized cap in a tailored color."
	icon_state = "mimesoft"