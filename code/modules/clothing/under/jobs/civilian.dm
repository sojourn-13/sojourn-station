//Alphabetical order of civilian jobs.

/obj/item/clothing/under/rank/assistant
	desc = "A standard-issue black and orange assistant uniform."
	name = "assistant's uniform"
	icon_state = "assistant"
	item_state = "assistant"

/obj/item/clothing/under/rank/bartender
	desc = "A smart bartender's suit adorned with a bow tie."
	name = "bartender's uniform"
	icon_state = "ba_suit"
	item_state = "ba_suit"

/obj/item/clothing/under/rank/captain //Alright, technically not a 'civilian' but its better then giving a .dm file for a single define.
	desc = "An authoritative green uniform with gold flair denoting the rank of captain."
	name = "captain's uniform"
	icon_state = "captain"
	item_state = "b_suit"

/obj/item/clothing/under/rank/cargotech
	name = "guild technician's uniform"
	desc = "A dull guild turtleneck complete with sturdy work jeans."
	icon_state = "cargotech"
	item_state = "lb_suit"

	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/under/rank/chaplain
	desc = "A dark ceremonial robe tailored for NeoTheology preachers."
	name = "neotheology preacher's robe"
	icon_state = "preacher"
	item_state = "w_suit"

/obj/item/clothing/under/rank/chef
	desc = "A pleasant yet practical suit for professional kitchen staff."
	name = "chef's uniform"
	icon_state = "chef"
	item_state = "w_suit"

/obj/item/clothing/under/rank/first_officer
	desc = "A tan shirt with a first officer's badge, worn alongside some black leggings."
	name = "first officer's uniform"
	icon_state = "hop"
	item_state = "b_suit"

/obj/item/clothing/under/rank/hydroponics
	desc = "A hardy dark green jumpsuit, designed to provide protection from botanic dangers."
	name = "botanist's jumpsuit"
	icon_state = "hydroponics"
	item_state = "g_suit"

	permeability_coefficient = 0.50

/obj/item/clothing/under/rank/janitor
	desc = "A sturdy janitorial jumpsuit, designed to provide minor protection from biohazards."
	name = "janitor's jumpsuit"
	icon_state = "janitor"
	item_state = "janitor"
	armor = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 30, rad = 0)

/obj/item/clothing/under/rank/miner
	desc = "A snappy guild jumpsuit complete with sturdy mining overalls."
	name = "guild miner's jumpsuit"
	icon_state = "miner"
	item_state = "lb_suit"