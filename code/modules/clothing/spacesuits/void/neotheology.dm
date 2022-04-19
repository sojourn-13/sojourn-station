/obj/item/clothing/head/helmet/space/void/acolyte
	name = "vector hood"
	desc = "Even the most devout deserve head protection."
	icon_state = "acolyte"
	item_state = "acolyte"
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)

/obj/item/clothing/suit/space/void/acolyte
	name = "vector armor"
	desc = "Worn, heavy, steadfast in the name of God."
	icon_state = "acolyte"
	item_state = "acolyte"
	slowdown = 0.15
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_STEEL = 25, MATERIAL_BIOMATTER = 40)
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	helmet = /obj/item/clothing/head/helmet/space/void/acolyte

/obj/item/clothing/head/helmet/space/void/agrolyte
	name = "agrolyte hood"
	desc = "Don't want anything getting in your eyes."
	icon_state = "botanist"
	item_state = "botanist"
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)

/obj/item/clothing/suit/space/void/agrolyte
	name = "agrolyte armor"
	desc = "Every rose has its thorns."
	icon_state = "botanist"
	item_state = "botanist"
	slowdown = 0
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_STEEL = 15, MATERIAL_BIOMATTER = 40)
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 75
	)
	helmet = /obj/item/clothing/head/helmet/space/void/agrolyte

/obj/item/clothing/head/helmet/space/void/custodian
	name = "custodian helmet"
	desc = "Cleaning floors is more dangerous than it looks."
	icon_state = "custodian"
	item_state = "custodian"
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 90
	)
	unacidable = TRUE

/obj/item/clothing/suit/space/void/custodian
	name = "custodian armor"
	desc = "Someone's gotta clean this mess. While this armor is technically church property, lonestar custodians often use it on loan to protect themselves from the colonies various dangerous pests."
	icon_state = "custodian"
	item_state = "custodian"
	slowdown = 0.05
	matter = list(MATERIAL_PLASTIC = 40, MATERIAL_STEEL = 15, MATERIAL_BIOMATTER = 40)
	armor_list = list(
		melee = 25,
		bullet = 25,
		energy = 25,
		bomb = 25,
		bio = 100,
		rad = 90
	)
	unacidable = TRUE
	helmet = /obj/item/clothing/head/helmet/space/void/custodian

/obj/item/clothing/head/helmet/space/void/prime
	name = "prime hood"
	desc = "A visored helmet with a cloth hood covering it."
	icon_state = "prime"
	armor_list = list(
		melee = 40,
		bullet = 40,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 100
	)

/obj/item/clothing/head/helmet/space/void/prime/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["standard"] = ""
	options["golden"] = "_alt"
	options["golden alternate"] = "_alt2"
	options["golden muzzle"] = "_alt3"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You change to the [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/suit/space/void/prime
	name = "prime armor"
	desc = "Trust in god but keep your armor on."
	icon_state = "prime"
	slowdown = 0.15
	armor_list = list(
		melee = 40,
		bullet = 40,
		energy = 40,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	helmet = /obj/item/clothing/head/helmet/space/void/prime

/obj/item/clothing/suit/space/void/prime/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["standard"] = ""
	options["golden"] = "_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You change to the [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/space/void/NTvoid
	name = "angel voidsuit helmet"
	desc = "A voidsuit helmet designed by the church with a most holy mix of biomatter and inorganic matter."
	icon_state = "ntvoidhelmet"
	item_state = "ntvoidhelmet"
	action_button_name = "Toggle Helmet Light"
	brightness_on = 4 //luminosity when on
	light_color = COLOR_LIGHTING_NEOTHEOLOGY_BRIGHT //Holyer then thou!
	armor_list = list(
		melee = 40,
		bullet = 30,
		energy = 30,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.35
	light_overlay = "helmet_light"

/obj/item/clothing/suit/space/void/NTvoid
	name = "angel voidsuit"
	desc = "A voidsuit designed by the church with a most holy mix of biomatter and inorganic matter."
	icon_state = "ntvoid"
	item_state = "ntvoid"
	matter = list(MATERIAL_PLASTEEL = 8, MATERIAL_STEEL = 10, MATERIAL_BIOMATTER = 29)
	slowdown = 0.15
	armor_list = list(
		melee = 40,
		bullet = 30,
		energy = 30,
		bomb = 30,
		bio = 100,
		rad = 50
	)
	siemens_coefficient = 0.35
	breach_threshold = 10
	resilience = 0.07
	price_tag = 300


	helmet = /obj/item/clothing/head/helmet/space/void/NTvoid

	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	flash_protection = FLASH_PROTECTION_MAJOR
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|COVER_PREVENT_MANIPULATION
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
