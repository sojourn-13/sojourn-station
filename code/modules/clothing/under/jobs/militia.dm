/*
 * Contains:
 *		Trooper
 *		Corpsman
 *		Sergeant
 *		Blackshield Commander
 */


/*
 * Cadet
 */

/obj/item/clothing/under/rank/trooper/cadet
	name = "green cadet uniform"
	desc = "A rugged, baggy, one-size-fits-all set of militant and quite slavic two-tone clothes for volunteers, cadets, and conscripts."
	icon_state = "gorka"
	item_state = "gorka"

/*
 * Extra Fatigues
 */

/obj/item/clothing/under/rank/fatigues
	name = "green utility uniform"
	desc = "A green utility uniform, bearing the old marks of patches long since removed."
	icon_state = "greenutility"
	item_state = "greenutility"

/obj/item/clothing/under/rank/fatigues/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Green Utility Uniform"] = "greenutility"
	options["Green Utility Uniform Alt"] = "greenutility_alt"
	options["Green Utility Uniform Corpsman"] = "greenutility_Corpsman"
	options["Green Utility Uniform Corpsman Alt"] = "greenutility_alt_med"
	options["Green Utility Pants"] = "greenutility_pants"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/fatigues/grey
	name = "grey utility uniform"
	desc = "A grey utility uniform, bearing the old marks of patches long since removed."
	icon_state = "greyutility"
	item_state = "greyutility"

/obj/item/clothing/under/rank/fatigues/grey/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Grey Utility Uniform"] = "greyutility"
	options["Grey Utility Uniform Alt"] = "greyutility_alt"
	options["Grey Utility Medical"] = "greyutility_med"
	options["Grey Utility Pants"] = "greyutility_pants"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/fatigues/navy
	name = "navy utility uniform"
	desc = "A navy utility uniform, bearing the old marks of patches long since removed."
	icon_state = "navyutility"
	item_state = "navyutility"

/obj/item/clothing/under/rank/fatigues/navy/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Navy Utility Uniform"] = "navyutility"
	options["Navy Utility Uniform Alt"] = "navyutility_alt"
	options["Navy Utility Medical"] = "navyutility_med"
	options["Navy Utility Pants"] = "navyutility_pants"
	options["Dark Utility Pants"] = "blackutility_pants"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/fatigues/tan
	name = "tan utility uniform"
	desc = "A tan utility uniform, bearing the old marks of patches long since removed."
	icon_state = "tanutility"
	item_state = "tanutility"

/obj/item/clothing/under/rank/fatigues/tan/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Tan Utility Uniform"] = "tanutility"
	options["Tan Utility Uniform Alt"] = "tanutility_alt"
	options["Tan Utility Medical"] = "tanutility_med"
	options["Tan Utility Pants"] = "tanutility_pants"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/fatigues/camo
	name = "camo utility uniform"
	desc = "A camo utility uniform, bearing the old marks of patches long since removed."
	icon_state = "camoutility"
	item_state = "camoutility"

/obj/item/clothing/under/rank/fatigues/camo/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Camo Utility Uniform"] = "camoutility"
	options["Camo Utility Uniform Alt"] = "camoutility_alt"
	options["Camo Utility Corpsman"] = "camoutility_med"
	options["Camo Utility Uniform Corpsman Alt"] = "camoutility_alt_med"
	options["Camo Utility Pants"] = "camoutility_pants"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/fatigues/kav //My beautiful baby boi Kavrick, thank u for the sprites.
	name = "grey Blackshield fatigues"
	desc = "A robust, grey utility suit bearing the markings of the Nadezhda Blackshield Militia. Comes with EZ roll sleeves, roll-down shirt, optional corpsman patch and skirt! "
	icon_state = "bsgrey"
	item_state = "bsgrey"

/obj/item/clothing/under/rank/fatigues/kav/green
	name = "green Blackshield fatigues"
	desc = "A robust, olive green grey utility suit bearing the markings of the Nadezhda Blackshield Militia. Comes with EZ roll sleeves, roll-down shirt, optional corpsman patch and skirt! "
	icon_state = "bsgreen"
	item_state = "bsgreen"

/obj/item/clothing/under/rank/fatigues/kav/tan
	name = "tan Blackshield fatigues"
	desc = "A robust, tan utility suit bearing the markings of the Nadezhda Blackshield Militia. Comes with EZ roll sleeves, roll-down shirt, optional corpsman patch and skirt! "
	icon_state = "bstan"
	item_state = "bstan"

/obj/item/clothing/under/rank/fatigues/kav/jungle
	name = "jungle Blackshield fatigues"
	desc = "A robust, jungle green utility suit bearing the markings of the Nadezhda Blackshield Militia. Comes with EZ roll sleeves, roll-down shirt, optional corpsman patch and skirt! "
	icon_state = "bsjungle"
	item_state = "bsjungle"

/obj/item/clothing/under/rank/fatigues/kav/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["standard"] = ""
	options["Sleeves rolled up"] = "_rolled"
	options["Shirt rolled down"] = "_pant"
	options["Medic patch"] = "_corps"
	options["Medic patch, sleeves rolled up"] = "_corpsrolled"
	options["Skirt"] = "_skirt"
	options["Skirt, sleeves rolled up"] = "_skirtrolled"
	options["Skirt, shirt rolled down"] = "_skirtpant"

	var/choice = input(M,"How would you like to wear your suit?","Adjust Style") as null|anything in options

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


/*
 * Trooper/Corpsman
 */

/obj/item/clothing/under/rank/trooper/gorka
	name = "blackshield gorka suit"
	desc = "A rugged set of vaguely slavic two-tone overwear, made with robust materials and wearing the insignia of the Blackshield."
	icon_state = "gorka_ih"

/obj/item/clothing/under/rank/trooper/gorka/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Standard Colors"] = "gorka_ih"
	options["Blackshield Woodland Colors"] = "gorka"
	options["Blackshield Desert Colors"] = "gorka_tan"
	options["Blackshield Skirt"] = "gorka_blackshield_skort"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/trooper/service
	name = "blackshield service uniform"
	desc = "A modern uniform with dark blue pants, with a white button up shirt. There are straps on the shoulders for adding shoulderboards."
	icon_state = "trooper_service"
	item_state = "trooper_service"

/obj/item/clothing/suit/rank/trooper/service
	name = "blackshield service jacket"
	desc = "A modern dark blue uniform jacket. Fit for a trooper, even one on the frontier."
	icon_state = "trooper_service"
	item_state = "trooper_service"

/obj/item/clothing/suit/rank/trooper/dress
	name = "blackshield dress jacket"
	desc = "A modern dark blue uniform jacket. Fit for a trooper, even one on the frontier."
	icon_state = "trooper_dress"
	item_state = "trooper_dress"

/obj/item/clothing/under/rank/corpsman
	name = "Medical Corpsman uniform"
	desc = "A durable, baggy uniform featuring blue medical liverly and stain-resistant coating."
	icon_state = "gorka_ih_med_b"
	item_state = "gorka_ih_med_b"
	permeability_coefficient = 0.50
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 10, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/corpsman/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["medical corpsman's uniform"] = "gorka_ih_med_b"
	options["militia corpsman's jumpsuit"] = "medspec"
	options["militia corpsman's jumpskirt"] = "medspec_skirt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/under/rank/bdu/trooper
	name = "Blackshield BDU"
	desc = "A rugged militia Battle Dress Uniform, made with robust materials and wearing the insignia of the Blackshield."
	icon_state = "bdubsstandard"
	item_state = "bdubsstandard"

/obj/item/clothing/under/rank/bdu/trooper/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Standard Colors"] = "bdubsstandard"
	options["Blackshield Standard Colors Rolled Up"] = "bdubsstandard_rolled"
	options["Blackshield Woodland Colors"] = "bdubsgreen"
	options["Blackshield Woodland Colors Rolled Up"] = "bdubsgreen_rolled"
	options["Blackshield Desert Colors"] = "bdubstan"
	options["Blackshield Desert Colors Rolled Up"] = "bdutan_rolled"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
 * Sergeant
 */

/obj/item/clothing/under/rank/armorer/gorka
	name = "Sergeant's uniform"
	desc = "A rugged set of vaguely slavic two-tone overwear, made with robust materials and wearing the pins of a Blackshield Sergeant."
	icon_state = "gorka_ih"

/obj/item/clothing/under/rank/armorer/gorka/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Blackshield Standard Colors"] = "gorka_ih"
	options["Blackshield Woodland Colors"] = "gorka"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/tactical
	name = "tactical turtleneck"
	desc = "A reinforced military turtleneck, designed to provide moderate combat protection."
	icon_state = "syndicate"
	armor_list = list(melee = 1, bullet = 1, energy = 1, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9

/obj/item/clothing/under/rank/armorer/service
	name = "Blackshield NCO service uniform"
	desc = "A modern uniform with silver trimmings on the dark blue pants, with a white button up shirt. There are straps on the shoulders for adding shoulderboards."
	icon_state = "sergeant_service"
	item_state = "sergeant_service"

/obj/item/clothing/suit/rank/armorer/service
	name = "Blackshield NCO service jacket"
	desc = "A modern dark blue uniform jacket with silver trimmings. Fit for a mid-level trooper, even one on the frontier."
	icon_state = "sergeant_service"
	item_state = "sergeant_service"

/obj/item/clothing/suit/rank/armorer/dress
	name = "Blackshield NCO dress jacket"
	desc = "A modern dark blue uniform jacket with silver trimmings. Fit for a mid-level trooper, even one on the frontier."
	icon_state = "sergeant_dress"
	item_state = "sergeant_dress"


/*
 * Militia Commander
 */
/obj/item/clothing/under/rank/commander
	name = "commander's combat uniform"
	desc = "It's a uniform worn by those few with the dedication to achieve the position of \"Blackshield Commander\". It has additional armor to protect the wearer."
	icon_state = "gorka_ih"
	siemens_coefficient = 0.8

/obj/item/clothing/under/rank/commander/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Commander's Combat Uniform"] = "gorka_ih"
	options["Commander's Dress Uniform"] = "commander"
	options["Drill Instructor Uniform"] = "instructor"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/suit/rank/commander_service
	name = "blackshield command service jacket"
	desc = "A modern dark blue uniform jacket with gold trimmings. Fit for a command officer, even one on the frontier."
	icon_state = "commander_service"
	item_state = "commander_service"

/obj/item/clothing/under/rank/commander_service/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Commander's Service Uniform"] = "commander_service"
	options["Commander's Service Dress Uniform"] = "commander_dress"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = list(
			slot_back_str = options[choice]
			)
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/under/rank/brigservice
	name = "blackshield general's service uniform"
	desc = "A modern uniform with red trimmings on the dark blue pants, with a white button up shirt. There are straps on the shoulders for adding shoulderboards."
	icon_state = "brigadier_service"
	item_state = "brigadier_service"

/obj/item/clothing/suit/rank/brigservice
	name = "blackshield general's service jacket"
	desc = "A modern dark blue uniform jacket with red trimmings. Fit for a general officer, even one on the frontier."
	icon_state = "brigadier_service"
	item_state = "brigadier_service"

/obj/item/clothing/suit/rank/brigdress
	name = "blackshield general's dress jacket"
	desc = "A modern dark blue uniform jacket with red trimmings. Fit for a general officer, even one on the frontier."
	icon_state = "brigadier_dress"
	item_state = "brigadier_dress"

//Solfed alternatives.
/obj/item/clothing/under/rank/fatigues/camo/solfed
	name = "camo utility uniform"
	desc = "A camo utility uniform, bearing worn patches of the Solar armed forces.."
	armor_list = list(melee = 2, bullet = 0, energy = 2, bomb = 0, bio = 0, rad = 0)
