//Contains: Engineering department jumpsuits
/obj/item/clothing/under/rank/exultant
	name = "guild master's jumpsuit"
	desc = "A blue-yellow engineering jumpsuit worn by Guild Masters. It has good radiation shielding."
	icon_state = "chiefengineer"
	item_state = "g_suit"
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 30
	)

/obj/item/clothing/under/rank/exultant/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["GM jumpsuit"] = "chiefengineer"
	options["GM jumpskirt"] = "artificer_jumpskirt_master"
	options["GM High Visiblity Jumpsuit"] = "GM uniform" // Sprites by Ezoken/Dromkii

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You adjust your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/engineer
	desc = "A yellow engineering jumpsuit worn by Guild Adepts. It has minor radiation shielding."
	name = "adept's jumpsuit"
	icon_state = "engine"
	item_state = "engi_suit"
	armor_list = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 10
	)

/obj/item/clothing/under/rank/engineer/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Adept Jumpsuit"] = "engine"
	options["Adept Jumpsuit Padded"] = "artificer_armored_jumpsuit"
	options["Adept Jumpskirt"] = "artificer_apprentice_skirt"
	options["Adept Jumpskirt Padded"] = "artificer_jumpskirt_adept"
	options["High Visiblity Jumpsuit"] = "GA uniform" // Sprites by Ezoken/Dromkii
	options["High Visiblity Two Piece"] = "adept_alt" // Sprites by Ezoken/Dromkii
	options["High Visiblity Rolled sleeves"] = "adept_alt_rolled" // Sprites by Ezoken/Dromkii
	options["High Visiblity Shirt down"] = "adept_alt_pants" // Sprites by Ezoken/Dromkii

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You adjust your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/roboticist
	desc = "An orange and tan Soteria jumpsuit designed for mechanical work."
	name = "roboticist's jumpsuit"
	icon_state = "robotics"
	item_state = "bl_suit"

/obj/item/clothing/under/rank/engineer/adv
	desc = "A plastic coated and padded engineering suit worn by Guild Adepts heading into dangerously radioactive areas for repair work. Offers full radiation protection."
	name = "adept's padded emergency suit"
	icon_state = "engineadv"
	item_state = "engineadv"
	armor_list = list(
		melee = 5, //if they are not waring any armor over this then we give *something*
		bullet = 5,
		energy = 6,
		bomb = 10,
		bio = 50,
		rad = 100 //Rad proof
	)

/obj/item/clothing/under/rank/engineer/adv_master
	desc = "A plastic-coated and iron-woven engineering suit worn by Guild Masters heading into dangerously radioactive areas for repair work. Offers full radiation protection."
	name = "adept's padded emergency suit"
	icon_state = "chiefengineeradv"
	item_state = "chiefengineeradv"
	armor_list = list(
		melee = 7, //if they are not waring any armor over this then we give *something*
		bullet = 7,
		energy = 11,
		bomb = 80,
		bio = 70,
		rad = 100 //Rad proof
	)
