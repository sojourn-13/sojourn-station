/obj/item/clothing/head/helmet/space/void/acolyte
	name = "vector hood"
	desc = "Even the most devout deserve head protection."
	icon_state = "acolyte"
	item_state = "acolyte"
	armor_list = list(
		melee = 6,
		bullet = 6,
		energy = 6,
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
	matter = list(MATERIAL_PLASTIC = 15, MATERIAL_STEEL = 15, MATERIAL_BIOMATTER = 20)
	armor_list = list(
		melee = 6,
		bullet = 6,
		energy = 6,
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
		melee = 6,
		bullet = 6,
		energy = 6,
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
	matter = list(MATERIAL_PLASTIC = 30, MATERIAL_STEEL = 15, MATERIAL_BIOMATTER = 30)
	armor_list = list(
		melee = 6,
		bullet = 6,
		energy = 6,
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
		melee = 6,
		bullet = 6,
		energy = 6,
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
	matter = list(MATERIAL_PLASTIC = 15, MATERIAL_STEEL = 10, MATERIAL_BIOMATTER = 30)
	armor_list = list(
		melee = 6,
		bullet = 6,
		energy = 6,
		bomb = 25,
		bio = 100,
		rad = 90
	)
	unacidable = TRUE
	helmet = /obj/item/clothing/head/helmet/space/void/custodian

/obj/item/clothing/head/helmet/space/void/NTvoid
	name = "angel voidsuit helmet"
	desc = "A voidsuit helmet designed by the church with a most holy mix of biomatter and inorganic matter."
	icon_state = "ntvoidhelmet"
	item_state = "ntvoidhelmet"
	action_button_name = "Toggle Helmet Light"
	brightness_on = 4 //luminosity when on
	light_color = COLOR_LIGHTING_NEOTHEOLOGY_BRIGHT //Holyer then thou!
	armor_list = list(
		melee = 10,
		bullet = 7,
		energy = 7,
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
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 10, MATERIAL_BIOMATTER = 25)
	slowdown = 0.15
	armor_list = list(
		melee = 10,
		bullet = 7,
		energy = 7,
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
	flash_protection = FLASH_PROTECTION_MODERATE
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT|COVER_PREVENT_MANIPULATION
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR|DRAG_AND_DROP_UNEQUIP



//Church Crusader armor, credit to Valterak for the original sprite.
/obj/item/clothing/head/helmet/space/void/crusader
	name = "crusader hood"
	desc = "An armored helmet with a built in light system allowing you to shine heavens grace on heretics before you purge them."
	icon_state = "inqarmor_hood"
	item_state = "inqarmor_hood"
	armor_list = list(
		melee = 16,
		bullet = 16,
		energy = 16,
		bomb = 70,
		bio = 100,
		rad = 100
	)
	siemens_coefficient = 0
	species_restricted = list("Human")
	light_overlay = "helmet_light_white"
	brightness_on = 8 //luminosity when on
	max_upgrades = 0

/obj/item/clothing/head/helmet/space/void/crusader/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["standard"] = ""
	options["alternate"] = "_alt"

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

/obj/item/clothing/suit/space/void/crusader
	name = "crusader 'Deus Vult' power armor"
	desc = "The church of absolutes most powerful creation, the Mark I 'Deus Vult' power armor, a void capable ablative durasteel-forged suit with built in power systems linked to a wearers cruciform, recharged by its presence to prevent slow down from the armors weight. The only thing they fear is you."
	icon_state = "inqarmor"
	item_state = "inqarmor"
	slowdown = 0
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL
	armor_list = list(
		melee = 16,
		bullet = 16,
		energy = 16,
		bomb = 70,
		bio = 100,
		rad = 100
	)
	siemens_coefficient = 0
	species_restricted = list("Human")
	helmet = /obj/item/clothing/head/helmet/space/void/crusader
	max_upgrades = 0

/obj/item/clothing/suit/space/void/crusader/verb/toggle_style()
	set name = "Adjust style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["standard"] = ""
	options["alternate"] = "_alt"

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