/*
 * Science
 */
/obj/item/clothing/under/rank/expedition_overseer
	desc = "A brown suit complete with a white shirt and green tie. The fibre offers minor biohazard protection."
	name = "Research Overseer's suit"
	icon_state = "director"
	item_state = "lb_suit"

	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/scientist
	desc = "A dark navy scientist's jacket complete with navy pants. The fibre offers minor biohazard protection."
	name = "Soteria Scientist's uniform"
	icon_state = "science"
	item_state = "w_suit"

	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/under/rank/chemist
	desc = "Medical scrubs with orange shoulder patches denoting the wearer's role as a chemist. The fiber offers minor biohazard protection."
	name = "chemist's uniform"
	icon_state = "chemistry"
	item_state = "chemistry"

	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/chemist/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["regular"] = "chemistry"
	options["rapid response"] = "chemistry_evil"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You decided to roll with the [choice] style.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
 * Medical
 */
/obj/item/clothing/under/rank/moebius_biolab_officer
	desc = "Medical scrubs with crimson shoulder patches denoting the wearer's role as the chief medical officer. The fiber offers minor biohazard protection."
	name = "biolab overseer's uniform"
	icon_state = "cbo"
	item_state = "cbo"

	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/moebius_biolab_officer/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["regular"] = "cbo"
	options["rapid response"] = "cbo_evil"
	options["unofficial skirt"] = "cbo_skirt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You decided to roll with the [choice] style.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/virologist
	desc = "A green virologist's shirt complete with tan pants. The fiber offers minor biohazard protection."
	name = "Soteria Virologist's uniform"
	icon_state = "virology"
	item_state = "w_suit"

	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/medical
	desc = "Medical scrubs with cyan shoulder patches denoting the wearer's role as a doctor. The fiber offers minor biohazard protection."
	name = "doctor's uniform"
	icon_state = "medical"
	item_state = "medical"

	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/medical/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["regular"] = "medical"
	options["rapid response"] = "medical_evil"
	options["nursing"] = "medical_nurse"
	options["nursing rapid response"] = "medical_nurse_evil"
	options["unofficial skirt 1"] = "mediskirt"
	options["unofficial skirt 2"] = "mediskirt_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You decided to roll with the [choice] style.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/scrubs
	name = "blue scrubs"
	desc = "A sterile blue uniform designed to protect against contamination."
	icon_state = "scrubsblue"
	item_state = "b_suit"

/obj/item/clothing/under/scrubs/green
	name = "green scrubs"
	desc = "A sterile green uniform designed to protect against contamination."
	icon_state = "scrubsgreen"
	item_state = "scrubsgreen"

/obj/item/clothing/under/scrubs/purple
	name = "purple scrubs"
	desc = "A sterile purple uniform designed to protect against contamination."
	icon_state = "scrubspurple"
	item_state = "p_suit"

/obj/item/clothing/under/rank/psych
	desc = "Medical scrubs with purple shoulder patches denoting the wearer's role as a psychiatrist. The fiber offers minor biohazard protection."
	name = "Soteria psychologist's turtleneck"
	icon_state = "psych"
	item_state = "b_suit"

	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/psych/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["regular"] = "psych"
	options["rapid response"] = "psych_evil"
	options["unofficial turtleneck"] = "psychturtle"
	options["unofficial turtleneck skirt"] = "psychturtle_skirt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You decided to roll with the [choice] style.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/under/rank/paramedic
	desc = "A jumpsuit made for paramedics. It's made with reinforced fiber to offer more protection for recovery operations."
	name = "paramedic jumpsuit"
	icon_state = "paramedic"
	item_state = "paramedic"
	permeability_coefficient = 0.50
	armor_list = list(
		melee = 10,
		bullet = 5,
		energy = 5,
		bomb = 0,
		bio = 30,
		rad = 0
	)

/obj/item/clothing/under/rank/paramedic/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["class A uniform"] = "paramedic"
	options["class B uniform"] = "paramedic_b"
	options["class B uniform short sleeve"] = "paramedic_b_rolled"
	options["unofficial skirt"] = "paramedic_skirt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
		)
		to_chat(M, "You decided to roll with the [choice] style.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/paramedic/bdu
	desc = "An old BDU that someone appears to have dyed in the signature colours of Soteria Medical. It is made with reinforced fibers and sterile materials."
	name = "Soteria Paramedic bdu"
	icon_state = "bdutt"
	item_state = "bdutt"

/obj/item/clothing/under/rank/paramedic/bdu/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["suit up"] = ""
	options["suit down"] = "_pants"
	options["sleeves up"] = "_rolled"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You roll your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1
