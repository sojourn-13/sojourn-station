/obj/item/clothing/head/helmet/space/void/SCAF
	name = "SCAF helmet"
	desc = "A thick airtight helmet designed for planetside warfare retrofitted with seals to act like normal space suit helmet."
	icon_state = "scaf"
	item_state = "scaf"
	armor = list(
		melee = 60,
		bullet = 55,
		energy = 50,
		bomb = 75,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.35
	species_restricted = list("Human")
	camera_networks = list(NETWORK_MERCENARY)
	light_overlay = "helmet_light_green"

/obj/item/clothing/suit/space/void/SCAF
	name = "SCAF suit"
	desc = "A bulky antique suit of refurbished infantry armour, retrofitted with seals and coatings to make it EVA capable but also reducing mobility."
	icon_state = "scaf"
	item_state = "scaf"
	slowdown = 1.3
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL
	armor = list(
		melee = 60,
		bullet = 55,
		energy = 50,
		bomb = 75,
		bio = 100,
		rad = 25
	)
	siemens_coefficient = 0.35
	species_restricted = list("Human")
	helmet = /obj/item/clothing/head/helmet/space/void/SCAF

/obj/item/clothing/head/helmet/space/void/SCAF/blackshield
	name = "blackshield SCAF helmet"
	desc = "A thick airtight helmet designed for planetside warfare retrofitted with seals to act like normal space suit helmet. Features an inbuilt camera feed and helmet light."
	icon_state = "scaf_mil"
	item_state = "scaf_mil"
	camera_networks = list(NETWORK_SECURITY)
	light_overlay = "helmet_light_white"

/obj/item/clothing/suit/space/void/SCAF/blackshield
	name = "blackshield SCAF suit"
	desc = "A bulky antique suit of refurbished into elite infantry armour, retrofitted with seals and coatings to make it EVA capable but also reducing mobility. The blackshields answers to an all purpose mobile tank suit."
	icon_state = "scaf_mil"
	item_state = "scaf_mil"
	helmet = /obj/item/clothing/head/helmet/space/void/SCAF/blackshield

//Voidsuit for traitors
/obj/item/clothing/head/helmet/space/void/merc
	name = "blood-red voidsuit helmet"
	desc = "An advanced helmet designed for work in special operations. This version is additionally reinforced against melee attacks."
	icon_state = "syndiehelm"
	item_state = "syndiehelm"
	armor = list(
		melee = 50,
		bullet = 40,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 75
	)
	siemens_coefficient = 0.35
	species_restricted = list("Human")
	camera_networks = list(NETWORK_MERCENARY)
	light_overlay = "helmet_light_ihs"

/obj/item/clothing/head/helmet/space/void/merc/update_icon()
	..()
	if(on)
		icon_state = "syndiehelm_on"
	else
		icon_state = initial(icon_state)
	return

/obj/item/clothing/suit/space/void/merc
	icon_state = "syndievoidsuit"
	name = "blood-red voidsuit"
	desc = "An advanced suit that protects against injuries during special operations. This version is additionally reinforced against melee attacks."
	item_state = "syndie_voidsuit"
	armor = list(
		melee = 50,
		bullet = 40,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 75
	)
	siemens_coefficient = 0.35
	species_restricted = list("Human")
	helmet = /obj/item/clothing/head/helmet/space/void/merc

/obj/item/clothing/suit/space/void/merc/equipped
	boots = /obj/item/clothing/shoes/magboots
	tank = /obj/item/weapon/tank/oxygen

/obj/item/clothing/suit/space/void/merc/boxed
	tank = /obj/item/weapon/tank/emergency_oxygen/double

/obj/item/clothing/head/helmet/space/void/merc/xanorath
	name = "xanorath voidsuit helmet"
	desc = "A crimson helmet sporting clean lines and durable plating. Engineered to look menacing. This one is branded with a small rune at the back of the neck noting it was made by the Xanorath Syndicate."

/obj/item/clothing/suit/space/void/merc/xanorath
	name = "xanorath voidsuit"
	desc = "A crimson spacesuit sporting clean lines and durable plating. Robust, reliable, and slightly suspicious. This one is branded with a small rune at the collar noting it was made by the Xanorath Syndicate."
	helmet = /obj/item/clothing/head/helmet/space/void/merc/xanorath
	price_tag = 650


//Church Crusader armor, credit to Valterak for the original sprite.
/obj/item/clothing/head/helmet/space/void/crusader
	name = "crusader hood"
	desc = "An armored helmet with a built in light system allowing you to shine heavens grace on heretics before you purge them."
	icon_state = "inqarmor_hood"
	item_state = "inqarmor_hood"
	armor = list(
		melee = 75,
		bullet = 75,
		energy = 75,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	siemens_coefficient = 0
	species_restricted = list("Human")
	light_overlay = "helmet_light_white"
	brightness_on = 10 //luminosity when on

/obj/item/clothing/suit/space/void/crusader
	name = "crusader 'Deus Vult' power armor"
	desc = "The church of absolutes most powerful creation, the Mark I 'Deus Vult' power armor, a void capable ablative durasteel-forged suit with built in power systems linked to a wearers cruciform, recharged by its presence to prevent slow down from the armors weight. The only thing they fear is you."
	icon_state = "inqarmor"
	item_state = "inqarmor"
	slowdown = 0
	flags_inv = HIDEGLOVES|HIDEJUMPSUIT|HIDETAIL
	armor = list(
		melee = 75,
		bullet = 75,
		energy = 75,
		bomb = 90,
		bio = 100,
		rad = 100
	)
	siemens_coefficient = 0
	species_restricted = list("Human")
	helmet = /obj/item/clothing/head/helmet/space/void/crusader