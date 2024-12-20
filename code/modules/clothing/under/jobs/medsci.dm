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
	desc = "A orange chemist's shirt complete with tan pants. The fiber offers minor biohazard protection."
	name = "Soteria Chemist's uniform"
	icon_state = "chemistry"
	item_state = "chemistry"

	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/*
 * Medical
 */
/obj/item/clothing/under/rank/moebius_biolab_officer
	desc = "A Biolab Overseer's outfit in Soteria Medical colors. The fiber offers minor biohazard protection."
	name = "Biolab Overseer's uniform"
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
	options["shirt and pants"] = "cbo"
	options["girlboss"] = "cbo_skirt"

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
	desc = "A Doctor's outfit in Soteria Medical colors. The fiber offers minor biohazard protection."
	name = "Soteria Doctor's uniform"
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
	options["shirt and pants"] = "medical"
	options["shirt and skirt"] = "mediskirt"
	options["shirt with pencil skirt"] = "mediskirt_alt"

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
	desc = "A calming turquoise turtleneck combined with dark blue slacks."
	name = "Soteria psychologist's turtleneck"
	icon_state = "psychturtle"
	item_state = "b_suit"

/obj/item/clothing/under/rank/paramedic
	desc = "A jumpsuit made by soteria for their Lifeline Technicians. It's made with reinforced fiber to offer more protection for recovery operations."
	name = "Soteria Lifeline Technician jumpsuit"
	icon_state = "paramedic"
	item_state = "paramedic"
	permeability_coefficient = 0.50
	armor_list = list(
		melee = 2,
		bullet = 1,
		energy = 1,
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
	options["shirt and pants"] = "paramedic"
	options["shirt and skirt"] = "paramedic_skirt"

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
	name = "Soteria Lifeline Technician bdu"
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
