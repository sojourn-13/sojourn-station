
//Bartender
/obj/item/clothing/head/rank/chef
	name = "chef's hat"
	desc = "It's a hat used by chefs to keep hair out of your food. Judging by the food in the mess, they don't work."
	icon_state = "chefhat"
	item_state = "chefhat"

//Captain
/obj/item/clothing/head/rank/captain
	name = "captain's hat"
	icon_state = "captain"
	desc = "It's good being the king."
	item_state_slots = list(
		slot_l_hand_str = "caphat",
		slot_r_hand_str = "caphat",
		)
	body_parts_covered = 0

/obj/item/clothing/head/rank/captain/cap
	name = "captain's cap"
	desc = "You fear to wear it for the negligence it brings."
	icon_state = "capcap"

/obj/item/clothing/head/rank/captain/formal
	name = "parade hat"
	desc = "No one in a commanding position should be without a perfect, white hat of ultimate authority."
	icon_state = "officercap"

//HOP
/obj/item/clothing/head/rank/first_officer
	name = "crew resource's hat"
	desc = "A stylish hat that both protects you from enraged former-crewmembers and gives you a false sense of authority."
	icon_state = "hopcap"

//Chaplain
/obj/item/clothing/head/rank/chaplain
	name = "preacher's hood"
	desc = "It's hood that covers the head. It keeps you warm during the space winters."
	icon_state = "chaplain_hood"
	flags_inv = BLOCKHAIR
	body_parts_covered = HEAD

//Chaplain


//Mime
/obj/item/clothing/head/beret
	name = "red beret"
	desc = "A formidable red beret."
	icon_state = "beret"
	body_parts_covered = 0

//Security
/obj/item/clothing/head/sec/navy/officer
	name = "Ironhammer operative beret"
	desc = "A navy blue Ironhammer beret signifying a Operative position."
	icon_state = "beret_navy_officer"

/obj/item/clothing/head/sec/navy/hos
	name = "Ironhammer commander beret"
	desc = "A grey Ironhammer beret signifying a Commander position."
	icon_state = "beret_navy_hos"

/obj/item/clothing/head/sec/navy/warden
	name = "Ironhammer sergeant beret"
	desc = "A red Ironhammer beret signifying a Gunnery Sergeant position."
	icon_state = "beret_navy_warden"

/obj/item/clothing/head/engineering
	name = "technomancer beret"
	desc = "A yellow beret signifying a Technomancer position."
	icon_state = "beret_engineering"

/obj/item/clothing/head/beret/purple
	name = "purple beret"
	desc = "A rather stylish purple beret."
	icon_state = "beret_purple"

/obj/item/clothing/head/beret/black
	name = "black beret"
	desc = "A dark and imposing black beret."
	icon_state = "beretblack"

/obj/item/clothing/head/seccap
	name = "Ironhammer security cap"
	initial_name = "Ironhammer security cap"
	desc = "A generic red Ironhammer field cap."
	icon_state = "secsoft"

/obj/item/clothing/head/seccorp
	name = "Ironhammer inspector cap"
	initial_name = "Ironhammer inspector cap"
	desc = "A black field cap with an Ironhammer Inspector logo."
	icon_state = "corpsoft"

//Medical
/obj/item/clothing/head/surgery
	name = "blue surgical cap"
	desc = "A sterile blue surgical cap for medical operations."
	icon_state = "surgcap_blue"
	flags_inv = BLOCKHEADHAIR

/obj/item/clothing/head/surgery/purple
	name = "purple surgical cap"
	desc = "A sterile purple surgical cap for medical operations."
	icon_state = "surgcap_purple"

/obj/item/clothing/head/surgery/green
	name = "green surgical cap"
	desc = "A sterile green surgical cap for medical operations."
	icon_state = "surgcap_green"
