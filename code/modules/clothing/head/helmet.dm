/*
 * Baseline Helmets
 */

//Regular Helmets
/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard operator gear. Protects the head from impacts."
	icon_state = "helmet"
	item_state_slots = list(
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet",
		)
	item_flags = THICKMATERIAL
	body_parts_covered = HEAD | EARS
	armor_list = list(
		melee = 8,
		bullet = 6,
		energy = 5,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	w_class = ITEM_SIZE_NORMAL
	price_tag = 100
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 1

/obj/item/clothing/head/helmet/tanker
	name = "tanker helmet"
	desc = "Protects the head from damage while you are in a mech or joy riding the cargo trolley."
	icon_state = "tanker_helmet"
	item_flags = THICKMATERIAL
	flags_inv = HIDEEARS|BLOCKHAIR
	siemens_coefficient = 1
	price_tag = 160
	armor_list = list(
		melee = 3,
		bullet = 3,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/tanker/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Black"] = "tanker_helmet"
	options["Green"] = "tanker_helmet_green"
	options["Brown"] = "tanker_helmet_brown"
	options["Gray"] = "tanker_helmet_gray"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/biker
	name = "biker helmet"
	desc = "A helmet usually worn by bikers to protect their heads. This one comes in black."
	icon_state = "celty" // Durarara reference
	item_state = "celty"
	item_flags = THICKMATERIAL
	flags_inv = HIDEEARS|BLOCKHAIR|HIDEEYES|BLOCKFACEHAIR|HIDEFACE //Speaking with one on should be muffled
	price_tag = 150
	armor_list = list(
		melee = 5,
		bullet = 2,
		energy = 1,
		bomb = 15, // Shock-absorbent
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/biker/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Black"] = "celty"
	options["White"] = "celty_white"
	options["Red"] = "celty_red"
	options["Green"] = "celty_green"
	options["Blue"] = "celty_blue"
	options["Purple"] = "celty_purple"
	options["Pink"] = "celty_pink"
	options["Yellow"] = "celty_yellow"
	options["Rugby"] = "rugby"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/handmade
	name = "handmade combat helmet"
	desc = "It looks like it was made from a bucket and some steel. Uncomfortable and heavy but better than nothing."
	icon_state = "hm_helmet"
	armor_list = list(
		melee = 6,
		bullet = 2,
		energy = 5,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 75
	max_upgrades = 2

/obj/item/clothing/head/helmet/handmade/greathelm
	name = "bucket-helm"
	desc = "A bucket with two holes for eyes and some smaller ones for ventilation, with steel added to gain some protection. One may say, <i>'Situla Vult!'</i>."
	icon_state = "hm_greathelm"
	armor_list = list(melee = 6, bullet = 3,energy = 6, bomb = 12, bio = 1, rad = 0) // Only difference with handmade combat helmet is 2 sheets of metal, shouldn't be that far superior.
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS|EYES
	siemens_coefficient = 0.6
	price_tag = 85
	obscuration = MEDIUM_OBSCURATION

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	armor_list = list(
		melee = 5,
		bullet = 2,
		energy = 2,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/steelpot
	name = "steelpot helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "steelpot"
	armor_list = list(melee = 8, bullet = 7, energy = 0, bomb = 30, bio = 0, rad = 0) // slightly buffed IHS helmet minus energy resistance
	flags_inv = BLOCKHEADHAIR|HIDEEARS
	body_parts_covered = HEAD|EARS
	siemens_coefficient = 1


/obj/item/clothing/head/helmet/visor/cyberpunkgoggle
	name = "\improper Type-34C Semi-Enclosed Head Wear"
	desc = "Civilian model of a popular helmet used by certain law enforcement agencies. It does not have any armor plating, but has a neo-laminated fabric lining."
	icon_state = "cyberpunkgoggle"
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHAIR
	siemens_coefficient = 0.9	//More conductive than most helmets
	armor_list = list(
		melee = 1,
		bullet = 5,
		energy = 2,
		bomb = 0,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/visor/cyberpunkgoggle/armored
	name = "\improper Type-34 Semi-Enclosed Headwear"
	desc = "Armored helmet used by certain law enforcement agencies. It's hard to believe there's someone somewhere behind that."
	armor_list = list(
		melee = 7,
		bullet = 7,
		energy = 7,
		bomb = 20,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/helmet/mercenary
	name = "mercenary helmet"
	desc = "What happens when someone combines ablative, melee, and bullet plating in the form of a fetching tan and visor. Not as singularly powerful as each individually but the best all round protection one can get."
	icon_state = "merchelm"
	armor_list = list(melee = 13, bullet = 13, energy = 13, bomb = 45, bio = 0, rad = 0) // best what you can get
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/generic_full
	name = "full helmet"
	desc = "A generic non-branded full cover helmet with decent all round protection."
	icon_state = "helmet_full"
	armor_list = list(melee = 7, bullet = 7, energy = 7, bomb = 25, bio = 10, rad = 10)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "An oldie but a goodie. This helmet was often the last thing seen by those so foolish as to draw the attention of the Solarian Frontier enforcement corps. Judging by the dents, it didn't save its last wearer, but perhaps you'll fare better?"
	icon_state = "swathelm"
	armor_list = list(melee = 13, bullet = 13, energy = 13, bomb = 55, bio = 0, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150

/obj/item/clothing/head/helmet/ballistic
	name = "ballistic helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel."
	icon_state = "helmet_black"
	armor_list = list(melee = 7, bullet = 10, energy = 5, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/head/helmet/ballistic/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "helmet_black"
	options["Green"] = "helmet_green"
	options["Tan"] = "helmet_tan"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/hazcap
	name = "cbrn Helmet"
	desc = "A field modified safety helmet used by Solarian Chemical Corps troops as a quick fix to a comfortable headpiece to wear over bulky chemical hoods."
	icon_state = "Haz_cap"
	item_state_slots = list(
		slot_l_hand_str = "Haz_cap",
		slot_r_hand_str = "Haz_cap",
		)
	item_flags = THICKMATERIAL
	body_parts_covered = HEAD | EARS
	armor_list = list(
		melee = 8,
		bullet = 8,
		energy = 8,
		bomb = 25,
		bio = 0,
		rad = 75
	)
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.7
	w_class = ITEM_SIZE_NORMAL
	price_tag = 500
	tool_qualities = list(QUALITY_ARMOR = 100)
	max_upgrades = 1

/obj/item/clothing/head/helmet/hazcap/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Base"] = "Haz_cap"
	options["Tan"] = "Haz_cap_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/*
 * Factions
 */

//Blackshield helmets
/obj/item/clothing/head/helmet/ballistic/militia
	name = "blackshield helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel.\
			This one bears the IFF stripes of the Blackshield."
	icon_state = "helmet_mil"

/obj/item/clothing/head/helmet/ballistic/militia/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Default Blackshield Combat"] = "helmet_mil"
	options["Default Blackshield Combat - Anthromorphic"] = "helmet_mil_anthro"
	options["Desert Blackshield Combat"] = "helmet_tan_mil"
	options["Desert Blackshield Combat - Anthromorphic"] = "helmet_tan_mil_anthro"
	options["Woodlands Blackshield Combat"] = "helmet_green_mil"
	options["Woodlands Blackshield Combat - Anthromorphic"] = "helmet_green_mil_anthro"
	options["Urban Blackshield Combat"] = "helmet_white_mil"
	options["Urban Blackshield Combat - Anthromorphic"] = "helmet_white_mil_anthro"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return TRUE

/obj/item/clothing/head/helmet/ballistic/militia/sergeant
	name = "sergeant's ballistic gorget"
	desc = "Standard military gear. A somewhat uncommon piece of equipment, despite its unusual appearance\n this piece of headgear provides much-needed protection to oft-neglected locations while not interfering unduly\
	with the user's range of motion or ability to communicate."
	icon_state = "sergeanthelm"
	item_state = "sergeanthelm"
	flags_inv = HIDEMASK

/obj/item/clothing/head/helmet/ballistic/militia/sergeant/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["gorget in standard mode"] = ""
	options["goggles on"] = "_goggle"
	options["cap on"] = "_cap"
	options["beret on"] = "_beret"
	options["head-strap on"] = "_bane"
	var/choice = input(M,"What do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You put your [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/ballistic/militia/full
	name = "blackshield full helm"
	desc = "Standard military gear. A full-faced variant of the common ballistic helmet. This one bears a few\
	key upgrades, notably the inclusion of a face-protecting plate and lit eyeshield."
	icon_state = "bs_fullhelm"
	item_state = "bs_fullhelm"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION
	action_button_name = "Toggle Headlamp"
	brightness_on = 4
	light_overlay = "bsfullhelm_light"

/obj/item/clothing/head/helmet/ballistic/militia/full/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Default Blackshield Combat"] = ""
	options["Default Blackshield Combat - Anthromorphic"] = "_anthro"
	options["Desert Blackshield Combat"] = "_tan"
	options["Desert Blackshield Combat - Anthromorphic"] = "_tan_anthro"
	options["Woodlands Blackshield Combat"] = "_green"
	options["Woodlands Blackshield Combat - Anthromorphic"] = "_green_anthro"
	options["Urban Blackshield Combat"] = "_white"
	options["Urban Blackshield Combat - Anthromorphic"] = "_white_anthro"
	options["Default Blackshield Combat - Hooded"] = "_gp"
	options["Desert Blackshield Combat - Hooded"] = "_tp"
	options["Woodlands Blackshield Combat - Hooded"] = "_grp"
	options["Camo Blackshield Combat - Hooded"] = "_cp"
	options["Urban Camo Combat - Hooded"] = "_wp"
	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You adjust to the [choice].")

		var/list/anthro = list(
			"_anthro",
			"_tan_anthro",
			"_green_anthro",
			"_white_anthro"
		)
		if (options[choice] in anthro)
			if (src.name == "blackshield full helm")
				light_overlay = "bsfullhelm_anthro_light"
			else
				light_overlay = "corpsmanfullhelm_anthro_light"
		else
			if (src.name == "blackshield full helm")
				light_overlay = "bsfullhelm_light"
			else
				light_overlay = "corpsmanfullhelm_light"

		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/ballistic/militia/full/corpsman
	name = "corpsman full helm"
	desc = "Standard military gear. A full-faced variant of the common ballistic helmet. This one bears a few\
	key upgrades, including sterile materials and contaminant resistant sealing."
	armor_list = list(melee = 7, bullet = 10, energy = 5, bomb = 30, bio = 75, rad = 0)
	action_button_name = "Toggle Headlamp"
	brightness_on = 4
	light_overlay = "corpsmanfullhelm_light"

/obj/item/clothing/head/helmet/ballistic/militia/full/co
	name = "blackshield Commanders full helm"
	desc = "Advanced military gear. This full-faced variant of the common ballistic helmet comes with high-end materials making it both lighter and \
	more durable."
	icon_state = "bs_fullhelm_co"
	item_state = "bs_fullhelm_co"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION
	action_button_name = "Toggle Headlamp"
	brightness_on = 5
	light_overlay = "bsfullhelm_light"
	armor_list = list(melee = 9, bullet = 12, energy = 10, bomb = 50, bio = 0, rad = 0)

/obj/item/clothing/head/helmet/ballistic/militia/full/co/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Default Blackshield Combat"] = ""
	options["Default Blackshield Combat - Anthromorphic"] = "_anthro"
	options["Desert Blackshield Combat"] = "_tan"
	options["Desert Blackshield Combat - Anthromorphic"] = "_tan_anthro"
	options["Woodlands Blackshield Combat"] = "_green"
	options["Woodlands Blackshield Combat - Anthromorphic"] = "_green_anthro"
	options["Urban Blackshield Combat"] = "_white"
	options["Urban Blackshield Combat - Anthromorphic"] = "_white_anthro"
	options["Default Blackshield Combat - Hooded"] = "_gp"
	options["Desert Blackshield Combat - Hooded"] = "_tp"
	options["Woodlands Blackshield Combat - Hooded"] = "_grp"
	options["Camo Blackshield Combat - Hooded"] = "_cp"
	options["Urban Camo Combat - Hooded"] = "_wp"
	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You adjust to the [choice].")

		var/list/anthro = list(
			"_anthro",
			"_tan_anthro",
			"_green_anthro",
			"_white_anthro"
		)
		if (options[choice] in anthro)
			light_overlay = "bsfullhelm_anthro_light"
		else
			light_overlay = "bsfullhelm_light"

		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Marshals
/obj/item/clothing/head/helmet/marshal
	name = "marshal helmet"
	desc = "Standard operator gear. Protects the head from impacts. Painted in marshal colors."
	icon_state = "helmet"
	icon_state = "helmet"
	armor_list = list(melee =7, bullet = 7, energy = 6, bomb = 25, bio = 70, rad = 0)
	body_parts_covered = HEAD|EARS

/obj/item/clothing/head/helmet/marshal/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["standard helmet"] = "helmet"
	options["visored helmet"] = "helmet_ironhammer"
	options["tactical helmet"] = "helmet_marshal"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		item_state_slots = null
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/marshal_full
	name = "marshal full helmet"
	desc = "A full helmet with a built in glow visor. While a weak light its better than nothing and the full cover design makes it ideal for general protection."
	icon_state = "ironhammer_full"
	item_state = "ironhammer_full"
	armor_list = list(melee =7, bullet = 7,energy = 6, bomb = 25, bio = 70, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	action_button_name = "Toggle Headlamp"
	brightness_on = 5
	light_overlay = "m_fullhelm"

/obj/item/clothing/head/helmet/marshal_full/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Standard fullhelm"] = ""
	options["xeno fullhelm"] = "_a"
	options["xeno fullhelm extended"] = "_k"
	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		var/base = initial(icon_state)
		base += options[choice]
		icon_state = base
		item_state = base
		item_state_slots = null
		to_chat(M, "You adjust to the [choice].")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/head/helmet/marshal_full/update_icon()
	if(on)
		icon_state = "ironhammer_full_on"
		set_light(brightness_on, 1, COLOR_LIGHTING_ORANGE_MACHINERY)
	else
		icon_state = "ironhammer_full"
		set_light(0, 0)
	update_wear_icon()
	..()

/obj/item/clothing/head/helmet/warrant_officer
	name = "warrant officer full helmet"
	desc = "A full helmet with a built in glow visor. This one appears to be fitted with new visor servos internally to protect from flashes as well as a bullet-proof reinforced mouth guard!"
	icon_state = "ironhammer_wo_full"
	item_state = "ironhammer_wo_full"
	flash_protection = FLASH_PROTECTION_MODERATE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	action_button_name = "Toggle Headlamp" //Excellent job forgetting the verb, Friend.
	brightness_on = 6
	light_overlay = "m_fullhelm"
	armor_list = list(melee = 12, bullet = 12, energy = 7, bomb = 10, bio = 100, rad = 0)

/obj/item/clothing/head/helmet/warrant_officer/update_icon()
	if(on)
		icon_state = "ironhammer_wo_full_on"
		set_light(brightness_on, 1, COLOR_LIGHTING_ORANGE_MACHINERY)
	else
		icon_state = "ironhammer_wo_full"
		set_light(0, 0)
	update_wear_icon()
	..()

//Church
/obj/item/clothing/head/helmet/botanist
	name = "botanist hood"
	desc = "Design frequently used by hydroponicists and floral caretakers of New Byzantine. Protection is paramount when working with dangerous plants."
	icon_state = "botanist"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee =7, bullet = 5, energy = 5, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/botanist/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["botanist default"] = "botanist"
	options["cosine men yoroi lens"] = "cosine_men_yoroi"
	options["cosine men yoroi lensless"] = "cosine_men_yoroi_switched"
	options["cosine men yoroi round lens"] = "cosine_men_yoroi_weeaboomode"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/acolyte
	name = "vector hood"
	desc = "Helmet for every faithful of the Absolute. Even the most devout need protection."
	icon_state = "acolyte"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee =7, bullet = 5, energy = 5, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/acolyte/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["vector default"] = "acolyte"
	options["tangent ridge helmet"] = "tangent_ridge_helmet_switched"
	options["tangent ridge helmet open"] = "tangent_ridge_helmet"
	options["greater heart helmet"] = "greater_heart"
	options["tessellate helmet"] = "tessellate_helmet"
	options["factorial armor"] = "factorial_helmet"
	options["lemniscate helmet"] = "lemniscate_helmet"
	options["divisor helmet"] = "divisor_helmet"
	options["monomial helmet"] = "monomial_helmet"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/head/helmet/path //No path ?
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee =7, bullet = 5, energy = 5, bomb = 25, bio = 100, rad = 80)
	body_parts_covered = HEAD|EARS
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/path/divisor
	name = "Divisor Plate Greathelm"
	desc = "A greathelm with latin engravings that let everyone know the user is an enlightened Divisor, sworn protector and soldier."
	icon_state = "divisor_plate_greathelm"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/divisor/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Divisor Plate Greathelm"] = "divisor_plate_greathelm"
	options["Divisor's Guardsmen Helmet"] = "divisor_guardsmen_helmet"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/path/tessallate
	name = "Tessellate Veil"
	desc = "The Tesselate Veil keeps the user's face protected from the sun and sweat while performing their duty."
	icon_state = "tessellate_veil"
	flags_inv = BLOCKHAIR

/obj/item/clothing/head/helmet/path/tessallate/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Tessellate Veil"] = "tessellate_veil"
	options["Tessellate Headgear"] = "tessellate_maskheadgear"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/path/lemniscate
	name = "Lemniscate Hat"
	desc = "The incredibly wide hat of Lemniscates exudes radiance as it is the biggest amongst hats there is. The design ensures a comfortable fit along with the prevention of sunburn. Hidden beneath the smooth silk of the hat is a layer of chainmail."
	icon_state = "lemniscate_hat"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/lemniscate/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Lemniscate Hat"] = "lemniscate_hat"
	options["Lemniscate Grenadier Hat"] = "lemniscate_grenadier_bearskin"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1


/obj/item/clothing/head/helmet/path/monomial
	name = "Monomial Kabuto"
	desc = "An archaic helmet design with small overlapping plates, keeping the skull of its user mostly safe from damage. It disperses the impact of an attack across the entire helmet instead of only one point, adding to the survival of the wearer."
	icon_state = "monomial_kabuto"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/monomial/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Monomial Kabuto"] = "monomial_kabuto"
	options["Monomial Ajirogasa"] = "monomial_ajirogasa"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/path/factorial
	name = "Factorial Powerhood"
	desc = "An indespensable headwear of any combat vehicle operator, mostly used by the mechanics and factorials who served under the banner of New Byzantine. Even to this day the design is used by absolutist pilots."
	icon_state = "factorial_powerhood"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR

/obj/item/clothing/head/helmet/path/factorial/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Factorial Powerhood"] = "factorial_powerhood"
	options["Factorial Vesselcrew skullcap"] = "factorial_vesselcrew_shlemofon"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/rosaria
	name = "rosaria great helm"
	desc = "The rosaria protects. The Absolute wills it!"
	icon_state = "rosaria_helm"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee =10, bullet = 10, energy = 10, bomb = 50, bio = 100, rad = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 3, MATERIAL_GOLD = 2)

/obj/item/clothing/head/helmet/rosaria/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["rosaria default"] = "rosaria_helm"
	options["rosaria alt"] = "rosaria_alt_helmet"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/prime
	name = "prime hood"
	desc = "A visored helmet with a cloth hood covering it. The craftsmanship and decorations are only fit for a Prime of the Absolute"
	icon_state = "prime"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee =7, bullet = 7, energy = 7, bomb = 50, bio = 100, rad = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 4, MATERIAL_GLASS = 5, MATERIAL_GOLD = 5)

/obj/item/clothing/head/helmet/prime/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["prime dark"] = "prime"
	options["prime royal"] = "prime_alt"
	options["prime saint"] = "prime_saint"
	options["prime paladin"] = "prime_paladin"
	options["prime laurel"] = "laurel_g"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		if(choice == "prime saint" || choice ==  "prime laurel")
			flags_inv = HIDEEARS
		else
			flags_inv = HIDEMASK|HIDEEARS|HIDEEYES
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/custodian
	name = "custodian helmet"
	desc = "Cleaning floors is more dangerous than it looks."
	icon_state = "custodian"
	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	armor_list = list(melee =7, bullet = 5, energy = 5, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/custodian/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["default custodian helmet"] = "custodian"
	options["sine cornette"] = "sine_cornette"
	options["sine cornette switched"] = "sine_cornette_switched"
	options["sine cornette switched alternative"] = "sine_cornette_switched_alternative"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Hunter's Lodge
/obj/item/clothing/head/helmet/huntmaster_helmet
	name = "huntmaster nomad helm"
	desc = "Made from the hide of a render patriarch, this visored helmet made of bone and leather with glass lenses to keep blood and grit from the eyes. \
			There is a small chimera etched into the bone on the rear of the helmet."
	item_state = "huntmaster_helmet"
	icon_state = "huntmaster_helmet"
	armor_list = list(
		melee = 15,
		bullet = 5,
		energy = 3,
		bomb = 15,
		bio = 15,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/huntmaster_helmet/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["huntmaster horned nomad helm"] = "huntmaster_helmet"
	options["huntmaster horned helm long snout"] = "huntmaster_helmet_alt"
	options["huntmaster hornless nomad helm"] = "huntmaster_helmet_hornless"
	options["huntmaster hornless helm long snout"] = "huntmaster_helmet_hornless_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/hunter
	name = "hunter's hood"
	desc = "A visored helmet made of bone and leather with glass lenses to keep blood and grit from the eyes."
	item_state = "hunter_helmet"
	icon_state = "hunter_helmet"
	armor_list = list(
		melee = 15,
		bullet = 2,
		energy = 1,
		bomb = 0,
		bio = 10,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/hunter/stalker
	item_state = "hunter_helmet_stalker"
	icon_state = "hunter_helmet_stalker"

/obj/item/clothing/head/helmet/hunter/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["combat helmet"] = "hunter_helmet"
	options["stalker hood"] = "hunter_helmet_stalker"
	options["visored helmet"] = "hunter_helmet_visor"
	options["nomad hooded-helm"] = "hunter_helmet_nomad"
	options["nomad helm long snout"] = "hunter_helmet_nomad_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Guild
/obj/item/clothing/head/helmet/technomancersuit
	name = "'Mark V' environmental protection helmet"
	desc = "You feel like this helmet is rare, for some reason."
	icon_state = "technohelmet"
	armor_list = list(melee = 10, bullet = 10, energy = 10, bomb = 60, bio = 100, rad = 100)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	flash_protection = FLASH_PROTECTION_MODERATE
	action_button_name = "Toggle Headlamp"
	light_overlay = "technohelmet_light"
	brightness_on = 4
	max_upgrades = 2
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/technomancersuit/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Environmental Default Helmet"] = "technohelmet"
	options["Anthro Helmet"] = "technohelmet_anthro"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your mask's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//Soteria
/obj/item/clothing/head/helmet/soteriasuit
	name = "'Mark II' environmental protection helmet"
	desc = "You feel like this helmet is cheap, for some reason."
	icon_state = "armor_engineering"
	armor_list = list(melee = 3, bullet = 3, energy = 6, bomb = 35, bio = 50, rad = 50)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	matter = list(MATERIAL_STEEL = 20)
	flash_protection = FLASH_PROTECTION_MINOR
	max_upgrades = 2

//Prospectors
/obj/item/clothing/head/helmet/foreman
	name = "salvaged helmet"
	desc = "A helmet patched together by Prospector Salvagers, light and easy to breath in, \
	the helmet has a few bells and whistles, a set of inbuilt goggles to keep dust and blood out of ones eyes, \
	salvaged Greyson material coating it's outside it offer superb protection, and even a inbuilt radio. \
	Tragically the scav in charge of the radio was unable to tune it or turn it on."
	icon_state = "forehead_helmet"
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 10, MATERIAL_STEEL = 30, MATERIAL_SILVER = 12) //worth stealing
	price_tag = 1200
	armor_list = list(
		melee = 10,
		bullet = 7,
		energy = 7,
		bomb = 65,
		bio = 100,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	flash_protection = FLASH_PROTECTION_MODERATE
	action_button_name = "Toggle Headlamp"
	light_overlay = "technohelmet_light"
	brightness_on = 5 //Slightly better do to the sear costs
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/foreman/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["salvaged helmet"] = "forehead_helmet"
	options["Rust"] = "alt_scavenger_helmet"
	options["Ranger"] = "quak" // Due to popular demand
	options["Rust Radio"] = "Scavrust_helm"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/handmade/scavengerhelmet
	name = "scavenger helmet"
	desc = "A sturdy, handcrafted helmet. It's well balanced and sits low on your head, with padding on the inside."
	icon_state = "scav_helmet"
	armor_list = list(melee =8, bullet = 5, energy = 6, bomb = 25, bio = 0, rad = 0)
	price_tag = 200
	max_upgrades = 1 // Good baseline already

/obj/item/clothing/head/helmet/handmade/scavengerhelmet/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["scavenger grey"] = "scav_helmet"
	options["scavenger brown"] = "quak" // Quad damage!

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] colors.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/scav_heavy
	name = "scavenger plate helmet"
	desc = "A heavy helmet equipped with layers of metal and a reinforced glass visor, ideal for protection and headbutts. It even protects your eyes from welding flares!"
	icon_state = "scav_heavy"
	armor_list = list(melee = 10, bullet = 5, energy = 3, bomb = 35, bio = 0, rad = 0)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	flash_protection = FLASH_PROTECTION_MODERATE
	price_tag = 150

/obj/item/clothing/head/helmet/scav_heavy/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["scavenger plate"] = "scav_heavy"
	options["alt scavenger plate"] = "scav_heavy_alt" // Quad damage!

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your helmet's style into [choice] colors.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

//////////////

/*
 * Racial / Lore
 */

/obj/item/clothing/head/armor/helmet/penance
	name = "penance helmet"
	desc = "An old iron-wrought helmet upon a chainmail coif. These were resurrected from the time of castle retinues to serve again upon the heads of terrified conscripts and penal soldiers in the battle of Krios when the surplus of kevlar dwindled to a luxury; now only a distant piece of trash on a disconnected world. Among Kriosians, wearing this is a sign of penance and military ritual. Among Men, it is poverty and desperation interchanged."
	icon_state = "helmet_kriosanpenace"
	flags_inv = BLOCKHAIR
	armor_list = list(
		melee = 3,
		bullet = 3,
		energy = 0,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/armor/helmet/frog
	name = "mar'qua helmet"
	desc = "A very old helmet from times of the first mar'qua spacefarers. It is beaten around the edges and made out of metal instead of polymer and alloys like the modern ones. Still for the mar'qua in the colony this is probably the best they have."
	icon_state = "helmet_frog"
	flags_inv = BLOCKHAIR
	armor_list = list(
		melee = 5,
		bullet = 5,
		energy = 1,
		bomb = 10,
		bio = 0,
		rad = 0
	)

/obj/item/clothing/head/armor/helmet/frog/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Base Helmet"] = "helmet_frog"
	options["Blackshield Helmet"] = "helmet_frog_mil"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your mask's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/*
 * Special helmets
 */
//Bulletproof
/obj/item/clothing/head/helmet/bulletproof
	name = "bulletproof helmet"
	desc = "A bulletproof security helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "bulletproof"
	body_parts_covered = HEAD | EARS | FACE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	armor_list = list(
		melee = 6,
		bullet = 15,
		energy = 6,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 250

/obj/item/clothing/head/helmet/ballistic/bulletproof/militia
	name = "blackshield bulletproof helmet"
	icon_state = "bulletproof_bs"
	desc = "Standard military gear. Protects exceptionally well from high-velocity solid projectiles \
	This one bears the IFF stripes of the Blackshield."
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	armor_list = list(melee = 6, bullet = 15, energy = 6, bomb = 10, bio = 0, rad = 0)
	action_button_name = "Toggle Headlamp"
	brightness_on = 4
	light_overlay = "bs_bulletproof"

//Ablatives
/obj/item/clothing/head/helmet/laserproof
	name = "ablative helmet"
	desc = "A helmet that excels in protecting the wearer against energy projectiles."
	icon_state = "ablative"
	armor_list = list(melee =7, bullet = 7, energy = 18, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	body_parts_covered = HEAD|EYES|EARS
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150
	obscuration = LIGHT_OBSCURATION

/obj/item/clothing/head/helmet/laserproof/marshal
	icon_state = "ablative_ironhammer"
	item_state = "ablative_ironhammer"

/obj/item/clothing/head/helmet/laserproof/militia
	name = "blackshield ablative helmet"
	icon_state = "ablative_bs"
	desc = "An outdated, energy resistant helmet in a distinctive style. Loved by politicians, loathed by taxpayers and tolerated by the \
			local forces so often outfitted with it."
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	armor_list = list(melee = 6, bullet = 6, energy = 15, bomb = 10, bio = 0, rad = 0)
	action_button_name = "Toggle Headlamp"
	brightness_on = 4
	light_overlay = "bs_ablative"

/obj/item/clothing/head/helmet/laserproof/iron_lock_security
	name = "outdated ablative helmet"
	desc = "A \"Iron Lock Security\" helmet that excels in protecting the wearer against energy projectiles this even after all these years still is the base of ablative helmet design. Produced by Greyson Positronic"
	icon_state = "ablative"
	armor_list = list(melee = 5, bullet = 5, energy = 17, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 10, MATERIAL_PLATINUM = 2) //cheaper
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150

//Thunderdome
/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1

/*
 * Special helmets with HUDs
 */

//Security
/obj/item/clothing/head/helmet/riot_hud
	name = "marshal riot helmet"
	desc = "Standard-issue marshal helmet with a basic HUD and targeting system included, produced by Seinemetall Defense GmbH after more classic riot helmets were not able to handle the day to day riots."
	icon_state = "light_riot"
	flags_inv = HIDEEARS|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	armor_list = list(
		melee = 15,
		bullet = 6,
		energy = 6,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	flash_protection = FLASH_PROTECTION_MODERATE
	var/last_toggle = 0
	var/toggle_delay = 2 SECONDS
	action_button_name = "Toggle Security Hud"
	var/obj/item/clothing/glasses/hud/security/hud
	price_tag = 300

/obj/item/clothing/head/helmet/riot_hud/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/riot_hud/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/riot_hud/verb/toggle()
	set name = "Toggle Riot HUD"
	set desc = "Shows you jobs and criminal statuses"
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses) && world.time > last_toggle)
			to_chat(user, "You flip down [src] HUD goggles with a high-pitched whine.")
			last_toggle = world.time + toggle_delay
			hud.toggle(user, TRUE)//Turns the goggles on
			update_icon()
		else
			to_chat(user, "You are wearing something which is in the way or trying to flip the googles too fast!")
	else
		if(ismob(hud.loc) && world.time > last_toggle)
			last_toggle = world.time + toggle_delay
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			hud.toggle(user, FALSE)//Turns the goggles off so they won't drain power while retracted
			to_chat(user, "You flip up [src] HUD goggles, turning them off.")
			hud.forceMove(src)
		else
			to_chat(user, "You can't pull off the goggles so fast!")
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/riot_hud/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/riot_hud/update_icon()
	if(hud in src)
		icon_state = "light_riot"
		set_light(0, 0)
	else
		icon_state = "light_riot_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	update_wear_icon()
	..()

//Nightvision
/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg
	name = "marshal tactical bulletproof helmet"
	desc = "A bulletproof security helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent. \
			Comes with inbuilt nightvision HUD."
	icon_state = "bulletproof_ironhammer"
	body_parts_covered = HEAD|EARS
	flags_inv = NONE
	action_button_name = "Toggle Night Vision"
	var/obj/item/clothing/glasses/powered/nightvision_helmet/hud
	var/last_toggle = 0
	var/toggle_delay = 2 SECONDS
	price_tag = 600

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/verb/toggle()
	set name = "Toggle Night Vision HUD"
	set desc = "Allows you to see in the dark."
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses) && world.time > last_toggle)
			to_chat(user, "You flip down [src] night vision goggles with a high-pitched whine.")
			last_toggle = world.time + toggle_delay
			hud.toggle(user, TRUE)
			update_icon()
		else
			to_chat(user, "You are wearing something which is in the way or trying to flip the googles too fast!")
	else
		if(ismob(hud.loc) && world.time > last_toggle)
			last_toggle = world.time + toggle_delay
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			hud.toggle(user, FALSE)
			to_chat(user, "You flip up [src] night vision goggles, turning them off.")
			hud.forceMove(src)
		else
			to_chat(user, "You can't pull off the goggles so fast!")
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_nvg/update_icon()
	if(hud in src)
		icon_state = "bulletproof_ironhammer_nv"
		set_light(0, 0)
	else
		icon_state = "bulletproof_ironhammer_nv_on"
		set_light(1, 1, COLOR_LIGHTING_GREEN_MACHINERY)
	update_wear_icon()
	..()

//Thermal
/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal
	name = "marshal thermo-nightvision helmet"
	desc = "A bulletproof security helmet with mandibles that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent. \
			Comes with inbuilt thermal imaging HUD."
	icon_state = "bulletproof_ironhammer_thermal"
	body_parts_covered = HEAD|FACE|EARS
	flags_inv = HIDEEARS
	action_button_name = "Toggle Thermal Night Vision HUD"
	var/last_toggle = 0
	var/toggle_delay = 2 SECONDS
	var/obj/item/clothing/glasses/powered/thermal/thermal_helmet/hud
	price_tag = 2000

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/verb/toggle()
	set name = "Toggle Thermal Night Vision HUD"
	set desc = "Allows you to see in the dark."
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses) && world.time > last_toggle)
			to_chat(user, "You flip down [src] thermal imaging goggles with a high-pitched whine.")
			last_toggle = world.time + toggle_delay
			hud.toggle(user, TRUE)
			update_icon()
		else
			to_chat(user, "You are wearing something which is in the way or trying to flip the googles too fast!")
	else
		if(ismob(hud.loc) && world.time > last_toggle)
			last_toggle = world.time + toggle_delay
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			hud.toggle(user, FALSE)
			to_chat(user, "You flip up [src] thermal imaging goggles, turning them off.")
			hud.forceMove(src)
		else
			to_chat(user, "You can't pull off the goggles so fast!")
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/bulletproof/ironhammer_thermal/update_icon()
	if(hud in src)
		icon_state = "bulletproof_ironhammer_thermal"
		set_light(0, 0)
	else
		icon_state = "bulletproof_ironhammer_thermal_on"
		set_light(1, 1, COLOR_LIGHTING_RED_BRIGHT)
	update_wear_icon()
	..()

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
 * Faceshield Helmets
 */


// toggleable face guard
/obj/item/clothing/head/helmet/faceshield
	//We cant just use the armor var to store the original since initial(armor) will return a null pointer
	var/tint_down = TINT_LOW
	var/tint_up = TINT_NONE
	var/obscuration_down = MEDIUM_OBSCURATION
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHEADHAIR
	var/flags_inv_up = HIDEEARS
	body_parts_covered = HEAD|EARS|EYES|FACE
	var/body_parts_covered_up = HEAD|EARS
	flash_protection = FLASH_PROTECTION_MODERATE
	var/flash_protection_up = FLASH_PROTECTION_NONE
	action_button_name = "Flip Face Shield"
	tool_qualities = list()
	max_upgrades = 0
	var/list/armor_up = list()
	var/up = FALSE
	var/base_state

/obj/item/clothing/head/helmet/faceshield/riot
	name = "riot helmet"
	desc = "It's a outdated helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	armor_up = list(melee = 4, bullet = 4, energy = 4, bomb = 20, bio = 0, rad = 0)
	armor_list = list(melee = 10, bullet = 5, energy = 5, bomb = 35, bio = 0, rad = 0)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	price_tag = 150

/obj/item/clothing/head/helmet/faceshield/attack_self()
	if(!base_state)
		base_state = icon_state
	toggle()

/obj/item/clothing/head/helmet/faceshield/update_icon()
	if(!base_state)
		base_state = icon_state
	if(up)
		icon_state = "[base_state]_up"
	else
		icon_state = "[base_state]"

/obj/item/clothing/head/helmet/faceshield/refresh_upgrades()
	. = ..()
	if(!base_state)
		base_state = icon_state
	if(up)
		armor = getArmor(arglist(armor_up))
		flash_protection = flash_protection_up
		tint = tint_up
		obscuration = initial(obscuration)
		flags_inv = flags_inv_up
		body_parts_covered = body_parts_covered_up
	else
		flash_protection = initial(flash_protection)
		tint = initial(tint)
		obscuration = initial(obscuration)
		flags_inv = initial(flags_inv)
		body_parts_covered = initial(body_parts_covered)

//I wanted to name it set_up() but some how I thought that would be misleading
/obj/item/clothing/head/helmet/faceshield/proc/set_is_up(is_up)
	if(up == is_up) return
	up = is_up

	refresh_upgrades()

	update_icon()
	update_wear_icon()	//update our mob overlays

/obj/item/clothing/head/helmet/faceshield/verb/toggle()
	set category = "Object"
	set name = "Adjust face shield"
	set src in usr

	if(!usr.incapacitated())
		src.set_is_up(!src.up)

		if(src.up)
			to_chat(usr, "You push the [src] up out of your face.")
		else
			to_chat(usr, "You flip the [src] down to protect your face.")

		usr.update_action_buttons()

//S E C M A S K//

/obj/item/clothing/head/helmet/faceshield/bmask
	name = "ballistic mask"
	desc = "An armored mask, Protects the head and face from impacts and shrapnel."
	icon_state = "bmask"
	armor_up = list(melee = 4, bullet = 4, energy = 4, bomb = 10, bio = 0, rad = 0)
	armor_list = list(melee = 9, bullet = 9, energy = 9, bomb = 20, bio = 0, rad = 0)
	matter = list(MATERIAL_STEEL = 30, MATERIAL_PLASTIC = 10, MATERIAL_PLASTEEL = 10)
	flags_inv = null
	siemens_coefficient = 1
	up = TRUE

/obj/item/clothing/head/helmet/faceshield/bmask/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Black"] = "bmask"
	options["Tan"] = "bmask_tan"
	options["Green"] = "bmask_green"
	options["Steel"] = "bmask_steel"
	options["Kriosan"] = "bmask_snoot"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		base_state = options[choice]
		icon_state = options[choice]
		item_state = options[choice]
		if(up)
			icon_state = "[base_state]up"
		item_state_slots = list(
		slot_l_hand_str = options[choice],
		slot_r_hand_str = options[choice],
		)
		to_chat(M, "You adjusted your mask's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

// S E R B I A //

/obj/item/clothing/head/helmet/faceshield/altyn
	name = "altyn helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "altyn"
	armor_up = list(melee = 3, bullet = 5, energy = 2, bomb = 10, bio = 0, rad = 0)
	armor_list = list(melee = 7, bullet = 9, energy = 0, bomb = 10, bio = 0, rad = 0)
	siemens_coefficient = 1
	up = TRUE

/obj/item/clothing/head/helmet/faceshield/altyn/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Baseline"] = "altyn"
	options["Brown"] = "altyn_brown"
	options["Black"] = "altyn_black"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		base_state = options[choice]
		icon_state = options[choice]
		item_state = options[choice]
		if(up)
			icon_state = "[base_state]up"
		item_state_slots = list(
		slot_l_hand_str = options[choice],
		slot_r_hand_str = options[choice],
		)
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/faceshield/altyn/ironhammer
	icon_state = "ironhammer_altyn"
	item_state = "ironhammer_altyn"

/obj/item/clothing/head/helmet/faceshield/altyn/maska
	name = "maska helmet"
	desc = "\"I do not know who I am, I don\'t know why I\'m here. All I know is that I must kill.\""
	icon_state = "maska"
	armor_list = list(melee = 13, bullet = 13, energy = 0, bomb = 45, bio = 0, rad = 0) // best what you can get, unless you face lasers

/obj/item/clothing/head/helmet/faceshield/altyn/mardinat_yunan
	desc = "\"Human rights are not only violated by terrorism, repression or assassination, but also by unfair economic structures that create huge inequalities.\" An Altyn-pattern helmet commonly found throughout the frontier. This example has been painted up in the national colours of Mardinat-Yunan and comes with a copy of the tenets of a galaxy's economic manifesto held against the helmet by a strap."
	icon_state = "altyn_mardinat-yunan"
	item_state = "altyn_mardinat-yunan"

/obj/item/clothing/head/helmet/faceshield/altyn/maska/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["maska"] = "maska"
	options["maska killa"] = "maska_killa"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		base_state = options[choice]
		icon_state = options[choice]
		item_state = options[choice]
		if(up)
			icon_state = "[base_state]up"
		item_state_slots = list(
		slot_l_hand_str = options[choice],
		slot_r_hand_str = options[choice],
		)
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/faceshield/altyn/milisha
	name = "blackshield maska helmet"
	desc = "A maska helmet like any other but with nice camo options"
	icon_state = "maska_bs"

/obj/item/clothing/head/helmet/faceshield/altyn/milisha/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Default Blackshield Combat"] = "maska_bs"
	options["Woodlands Blackshield Combat"] = "maska_bs_green"
	options["Desert Blackshield Combat"] = "maska_bs_tan"
	options["Urban Blackshield Combat"] = "maska_bs_white"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		base_state = options[choice]
		icon_state = options[choice]
		item_state = options[choice]
		if(up)
			icon_state = "[base_state]up"
		item_state_slots = list(
		slot_l_hand_str = options[choice],
		slot_r_hand_str = options[choice],
		)
		to_chat(M, "You adjusted your helmet's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/head/helmet/faceshield/paramedic
	name = "advanced paramedic helmet"
	desc = "A smart helmet that aids in medical tracking."
	icon_state = "trauma_team"
	item_state = "trauma_team"
	flags_inv = HIDEEARS|BLOCKHAIR
	item_flags = BLOCK_GAS_SMOKE_EFFECT|AIRTIGHT
	tint_down = TINT_NONE
	obscuration_down = LIGHT_OBSCURATION
	matter = list(
		MATERIAL_PLASTEEL = 10,
		MATERIAL_GLASS = 5,
		MATERIAL_PLASTIC = 5,
		MATERIAL_PLATINUM = 2
		)
	armor_up = list(melee = 1, bullet = 5, energy = 2, bomb = 10, bio = 100, rad = 50)
	armor_list = list(melee = 6, bullet = 6, energy = 6, bomb = 20, bio = 100, rad = 50)
	up = TRUE
	action_button_name = "Adjust Face Shield"
	brightness_on = 4
	light_overlay = "helmet_light"
	var/speaker_enabled = TRUE
	var/scan_scheduled = FALSE
	var/scan_interval = 15 SECONDS
	var/repeat_report_after = 60 SECONDS
	var/list/crewmembers_recently_reported = list()
	var/obj/screen/tracking_arrow/tracking_overlay = null

/obj/item/clothing/head/helmet/faceshield/paramedic/equipped(mob/M)
	. = ..()
	schedule_scan()
	START_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/faceshield/paramedic/attack_self(mob/user)
	if(!user.incapacitated())
		src.set_is_up(!src.up)

		if(src.up)
			to_chat(user, "You push the [src] up out of your face.")
			remove_tracking_overlay()
		else
			to_chat(user, "You flip the [src] down to protect your face.")

		user.update_action_buttons()

/obj/item/clothing/head/helmet/faceshield/paramedic/proc/schedule_scan()
	if(scan_scheduled)
		return

	if(!speaker_enabled)
		return

	scan_scheduled = TRUE
	spawn(scan_interval)
		if(QDELETED(src))
			return
		scan_scheduled = FALSE
		report_health_alerts()


/obj/item/clothing/head/helmet/faceshield/paramedic/proc/schedule_memory_cleanup(entry)
	spawn(repeat_report_after)
		if(QDELETED(src))
			return
		crewmembers_recently_reported.Remove(entry)


/obj/item/clothing/head/helmet/faceshield/paramedic/proc/report_health_alerts()
	if(!speaker_enabled)
		return

	if(!ishuman(loc))
		return

	var/mob/living/carbon/human/user = loc

	var/list/crewmembers = list()
	var/list/z_levels_to_scan = list(1, 2, 3, 4, 5, 8, 9)

	for(var/z_level in z_levels_to_scan)
		crewmembers += crew_repository.health_data(z_level)

	if(crewmembers.len)
		for(var/i = 1, i <= crewmembers.len, i++)
			var/list/entry = crewmembers[i]
			if(entry["alert"] && !entry["muted"])
				if(entry["name"] in crewmembers_recently_reported)
					continue
				crewmembers_recently_reported += entry["name"]
				schedule_memory_cleanup(entry["name"])
				if((entry["area"]))
					to_chat(user, SPAN_WARNING("[src] beeps: '[entry["name"]]'s on-suit sensors broadcast an emergency signal from [entry["area"]]. Access monitoring software for details.'"))
				else
					to_chat(user, SPAN_WARNING("[src] beeps: '[entry["name"]]'s on-suit sensors broadcast an emergency signal from an unidentified location. Access monitoring software for details.'"))


	schedule_scan()

/obj/item/clothing/head/helmet/faceshield/paramedic/proc/get_direction_to_target()
	if(!ishuman(loc))
		return null

	var/mob/living/carbon/human/user = loc

	// Check if helmet is down (active)
	if(up)
		return null

	// Look for a Moebius tablet in user's inventory that is tracking
	var/obj/item/modular_computer/tablet/moebius/tablet = null
	for(var/obj/item/I in user.get_all_slots())
		if(istype(I, /obj/item/modular_computer/tablet/moebius))
			var/obj/item/modular_computer/tablet/moebius/T = I
			if(T.is_tracking && T.target_mob)
				tablet = T
				break

	if(!tablet)
		return null

	var/turf/user_turf = get_turf(user)
	var/turf/target_turf = get_turf(tablet.target_mob)

	if(!user_turf || !target_turf || user_turf.z != target_turf.z)
		return null

	return get_dir(user_turf, target_turf)

/obj/item/clothing/head/helmet/faceshield/paramedic/proc/update_tracking_overlay()
	if(!ishuman(loc))
		remove_tracking_overlay()
		return

	var/mob/living/carbon/human/user = loc
	if(!user.client)
		remove_tracking_overlay()
		return

	// Remove any existing tracking overlay
	remove_tracking_overlay()

	var/direction = get_direction_to_target()
	if(!direction)
		return

	// Create screen object for tracking arrow
	tracking_overlay = new /obj/screen/tracking_arrow()

	// Set the arrow direction icon
	switch(direction)
		if(NORTH)
			tracking_overlay.icon_state = "ARROW_NORTH"
		if(SOUTH)
			tracking_overlay.icon_state = "ARROW_SOUTH"
		if(EAST)
			tracking_overlay.icon_state = "ARROW_EAST"
		if(WEST)
			tracking_overlay.icon_state = "ARROW_WEST"
		if(NORTHEAST)
			tracking_overlay.icon_state = "ARROW_NORTHEAST"
		if(NORTHWEST)
			tracking_overlay.icon_state = "ARROW_NORTHWEST"
		if(SOUTHEAST)
			tracking_overlay.icon_state = "ARROW_SOUTHEAST"
		if(SOUTHWEST)
			tracking_overlay.icon_state = "ARROW_SOUTHWEST"
		else
			qdel(tracking_overlay)
			tracking_overlay = null
			return

	// Add the overlay to the user's screen
	user.client.screen += tracking_overlay

/obj/item/clothing/head/helmet/faceshield/paramedic/proc/remove_tracking_overlay()
	if(tracking_overlay && ishuman(loc))
		var/mob/living/carbon/human/user = loc
		if(user.client)
			user.client.screen -= tracking_overlay
		qdel(tracking_overlay)
	tracking_overlay = null

/obj/item/clothing/head/helmet/faceshield/paramedic/dropped(mob/user)
	. = ..()
	remove_tracking_overlay()
	STOP_PROCESSING(SSobj, src)

/obj/item/clothing/head/helmet/faceshield/paramedic/Process()
	update_tracking_overlay()

/obj/item/clothing/head/helmet/faceshield/paramedic/set_is_up(is_up)
	. = ..()
	// Clear overlay when helmet is raised
	if(is_up)
		remove_tracking_overlay()

/obj/item/clothing/head/helmet/faceshield/paramedic/AltClick()
	toggle_speaker()

/obj/item/clothing/head/helmet/faceshield/paramedic/ShiftClick(mob/user)
	toggle_light()

/obj/item/clothing/head/helmet/faceshield/paramedic/verb/toggle_faceshield()
	set name = "Adjust face shield"
	set category = "Object"
	set src in usr

	if(!usr.incapacitated())
		src.set_is_up(!src.up)

		if(src.up)
			to_chat(usr, "You push the [src] up out of your face.")
			remove_tracking_overlay()
		else
			to_chat(usr, "You flip the [src] down to protect your face.")

		usr.update_action_buttons()

/obj/item/clothing/head/helmet/faceshield/paramedic/verb/toggle_light()
	set name = "Toggle helmet light"
	set category = "Object"
	set src in usr

	if(!usr.incapacitated())
		if(!isturf(usr.loc))
			to_chat(usr, "You cannot turn the light on while in this [usr.loc]")
			return
		on = !on
		to_chat(usr, "You [on ? "enable" : "disable"] the helmet light.")
		update_flashlight(usr)

/obj/item/clothing/head/helmet/faceshield/paramedic/verb/toggle_tracking_overlay()
	set name = "Toggle tracking overlay"
	set category = "Object"
	set src in usr

	if(!usr.incapacitated())
		if(tracking_overlay)
			remove_tracking_overlay()
			to_chat(usr, "You turn off the tracking overlay.")
		else
			update_tracking_overlay()
			to_chat(usr, "You turn on the tracking overlay.")

/obj/item/clothing/head/helmet/faceshield/paramedic/verb/toggle_speaker()
	set name = "Toggle helmet's speaker"
	set category = "Object"
	set src in usr

	if(speaker_enabled)
		to_chat(usr, SPAN_WARNING("[src] beeps: 'Notifications disabled.'"))
		speaker_enabled = FALSE
	else
		to_chat(usr, SPAN_WARNING("[src] beeps: 'Notifications enabled.'"))
		speaker_enabled = TRUE
		report_health_alerts()




