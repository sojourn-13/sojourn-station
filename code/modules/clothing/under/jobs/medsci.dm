/*
 * Science
 */
/obj/item/clothing/under/rank/expedition_overseer
	desc = "A brown suit complete with a white shirt and green tie. The fibre offers minor biohazard protection."
	name = "research overseer's suit"
	icon_state = "director"
	item_state = "lb_suit"

	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/scientist
	desc = "A dark navy scientist's jacket complete with navy pants. The fibre offers minor biohazard protection."
	name = "soteria scientist's uniform"
	icon_state = "science"
	item_state = "w_suit"

	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/under/rank/chemist
	desc = "A orange chemist's shirt complete with tan pants. The fiber offers minor biohazard protection."
	name = "soteria chemist's uniform"
	icon_state = "chemistry"
	item_state = "chemistry"

	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/*
 * Medical
 */
/obj/item/clothing/under/rank/moebius_biolab_officer
	desc = "A white biolab overseer's shirt complete with tan pants. The fiber offers minor biohazard protection."
	name = "biolab overseer's uniform"
	icon_state = "cmo"
	item_state = "cmo"

	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/virologist
	desc = "A green virologist's shirt complete with tan pants. The fiber offers minor biohazard protection."
	name = "soteria virologist's uniform"
	icon_state = "virology"
	item_state = "w_suit"

	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

/obj/item/clothing/under/rank/medical
	desc = "A blue doctor's shirt complete with tan pants. The fiber offers minor biohazard protection."
	name = "sotera doctor's uniform"
	icon_state = "medical"
	item_state = "medical"

	permeability_coefficient = 0.50
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)

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
	name = "soteria psychologist's turtleneck"
	icon_state = "psychturtle"
	item_state = "b_suit"

/obj/item/clothing/under/rank/paramedic
	desc = "A jumpsuit of the soteria medical paramedics. It's made with reinforced fiber to offer more protection for recovery operators."
	name = "soteria paramedic's jumpsuit"
	icon_state = "paramedic"
	item_state = "paramedic"
	permeability_coefficient = 0.50
	armor = list(
		melee = 10,
		bullet = 5,
		energy = 5,
		bomb = 0,
		bio = 30,
		rad = 0
	)