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
	armor = list(
		melee = 35,
		bullet = 25,
		energy = 20,
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

//Blackshield helmets
/obj/item/clothing/head/helmet/ballistic
	name = "helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel."
	icon_state = "helmet_mil"
	armor = list(melee = 30, bullet = 45,energy = 20, bomb = 30, bio = 0, rad = 0)

/obj/item/clothing/head/helmet/ballistic/militia
	name = "blackshield helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel.\
			This one bears the IFF stripes of the Blackshield."
	icon_state = "helmet_mil_alt"

/obj/item/clothing/head/helmet/ballistic/green
	name = "helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel.\
			Some folks are born to kill."
	icon_state = "helmet_green"

/obj/item/clothing/head/helmet/ballistic/tan
	name = "helmet"
	desc = "Standard military gear. Protects the head from impacts and shrapnel.\
			Smells like sweat."
	icon_state = "helmet_tan"

/obj/item/clothing/head/helmet/botanist
	name = "botanist hood"
	desc = "Don't want anything getting in your eyes."
	icon_state = "botanist"
	armor = list(melee = 30, bullet = 20, energy = 20, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/acolyte
	name = "vector hood"
	desc = "Even the most devout deserve head protection."
	icon_state = "acolyte"
	armor = list(melee = 30, bullet = 20, energy = 20, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/prime
	name = "prime hood"
	desc = "A visored helmet with a cloth hood covering it."
	icon_state = "prime"
	armor = list(
		melee = 30,
		bullet = 30,
		energy = 30,
		bomb = 50,
		bio = 100,
		rad = 100
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/custodian
	name = "custodian helmet"
	desc = "Cleaning floors is more dangerous than it looks."
	icon_state = "custodian"
	armor = list(melee = 30, bullet = 20, energy = 20, bomb = 25, bio = 100, rad = 80)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS

/obj/item/clothing/head/helmet/technomancersuit
	name = "'Mark V' enviromental protection helmet"
	desc = "You feel like this helmet is rare, for some reason."
	icon_state = "technohelmet"
	armor = list(melee = 40, bullet = 40, energy = 40, bomb = 60, bio = 100, rad = 100) //Cant have armor mods
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	flash_protection = FLASH_PROTECTION_MAJOR

/obj/item/clothing/head/helmet/soteriasuit
	name = "'Mark II' enviromental protection helmet"
	desc = "You feel like this helmet is cheap, for some reason."
	icon_state = "armor_engineering"
	armor = list(melee = 15, bullet = 15, energy = 25, bomb = 35, bio = 50, rad = 50)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	matter = list(MATERIAL_STEEL = 20)
	flash_protection = FLASH_PROTECTION_MODERATE

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "These are often used by highly trained Swat Members."
	icon_state = "swat"
	armor = list(melee = 80, bullet = 60, energy = 40, bomb = 50, bio = 10, rad = 0)
	flags_inv = HIDEEARS|HIDEEYES
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 0.5
	price_tag = 150

/obj/item/clothing/head/helmet/handmade
	name = "handmade combat helmet"
	desc = "It looks like it was made from a bucket and some steel. Uncomfortable and heavy but better than nothing."
	icon_state = "hm_helmet"
	armor = list(
		melee = 25,
		bullet = 10,
		energy = 20,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	price_tag = 75

/obj/item/clothing/head/helmet/handmade/greathelm
	name = "bucket-helm"
	desc = "A bucket with two holes for eyes and some smaller ones for ventilation, with steel added to gain some protection. One may say, <i>'Situla Vult!'</i>."
	icon_state = "hm_greathelm"
	armor = list(melee = 27, bullet = 29,energy = 27, bomb = 3, bio = 1, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS|EYES
	siemens_coefficient = 0.6
	price_tag = 85

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "<i>'Let the battle commence!'</i>"
	icon_state = "thunderdome"
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	armor = list(
		melee = 20,
		bullet = 10,
		energy = 10,
		bomb = 10,
		bio = 0,
		rad = 0
	)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	body_parts_covered = HEAD|FACE|EARS
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "Standard-issue marshal helmet with a basic HUD and targeting system included."
	icon_state = "light_riot"
	body_parts_covered = HEAD|FACE|EARS
	armor = list(
		melee = 60,
		bullet = 30,
		energy = 30,
		bomb = 25,
		bio = 0,
		rad = 0
	)
	item_flags = THICKMATERIAL | COVER_PREVENT_MANIPULATION
	flash_protection = FLASH_PROTECTION_MAJOR
	action_button_name = "Toggle Security Hud"
	var/obj/item/clothing/glasses/hud/security/hud
	price_tag = 150

/obj/item/clothing/head/helmet/riot/New()
	..()
	hud = new(src)
	hud.canremove = FALSE

/obj/item/clothing/head/helmet/riot/ui_action_click()
	if(..())
		return TRUE
	toggle()

/obj/item/clothing/head/helmet/riot/verb/toggle()
	set name = "Toggle Security Hud"
	set desc = "Shows you jobs and criminal statuses"
	set category = "Object"
	var/mob/user = loc
	if(usr.stat || user.restrained())
		return
	if(user.get_equipped_item(slot_head) != src)
		return
	if(hud in src)
		if(user.equip_to_slot_if_possible(hud, slot_glasses))
			to_chat(user, "You enable security hud on [src].")
			update_icon()
	else
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(user, "You disable security hud on [src].")
		hud.forceMove(src)
		update_icon()
	usr.update_action_buttons()

/obj/item/clothing/head/helmet/riot/dropped(usr)
	..()
	if(hud.loc != src)
		if(ismob(hud.loc))
			var/mob/hud_loc = hud.loc
			hud_loc.drop_from_inventory(hud, src)
			to_chat(hud_loc, "[hud] automaticly retract in [src].")
		hud.forceMove(src)
		update_icon()

/obj/item/clothing/head/helmet/riot/update_icon()
	if(hud in src)
		icon_state = "light_riot"
		set_light(0, 0)
	else
		icon_state = "light_riot_on"
		set_light(2, 2, COLOR_LIGHTING_ORANGE_MACHINERY)
	update_wear_icon()
	..()

// S E R B I A //

/obj/item/clothing/head/helmet/steelpot
	name = "steelpot helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "steelpot"
	armor = list(melee = 35, bullet = 30, energy = 0, bomb = 30, bio = 0, rad = 0) // slightly buffed IHS helmet minus energy resistance
	flags_inv = BLOCKHEADHAIR
	body_parts_covered = HEAD|EARS
	siemens_coefficient = 1

/obj/item/clothing/head/helmet/altyn
	name = "altyn helmet"
	desc = "A titanium helmet of serbian origin. Still widely used despite being discontinued."
	icon_state = "altyn"
	var/list/armor_up = list(melee = 20, bullet = 15, energy = 0, bomb = 15, bio = 0, rad = 0)
	var/list/armor_down = list(melee = 35, bullet = 30, energy = 0, bomb = 30, bio = 0, rad = 0) // slightly better than usual due to mask
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHEADHAIR
	flash_protection = FLASH_PROTECTION_MAJOR
	body_parts_covered = HEAD|FACE|EARS
	siemens_coefficient = 1

	action_button_name = "Flip Face Shield"
	var/up = TRUE


/obj/item/clothing/head/helmet/altyn/Initialize()
	. = ..()
	armor = up ? armor_up : armor_down
	update_icon()

/obj/item/clothing/head/helmet/altyn/update_icon()
	icon_state = up ? "[initial(icon_state)]_up" : initial(icon_state)

/obj/item/clothing/head/helmet/altyn/attack_self()
	toggle()


/obj/item/clothing/head/helmet/altyn/verb/toggle()
	set category = "Object"
	set name = "Adjust face shield"
	set src in usr

	if(!usr.incapacitated())
		src.up = !src.up

		if(src.up)
			body_parts_covered &= ~(EYES|FACE)
			flags_inv &= ~(HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			flash_protection = FLASH_PROTECTION_NONE
			armor = armor_up
			to_chat(usr, "You push the [src] up out of your face.")
		else
			body_parts_covered |= (EYES|FACE)
			flags_inv |= (HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE)
			flash_protection = initial(flash_protection)
			armor = armor_down
			to_chat(usr, "You flip the [src] down to protect your face.")

		update_icon()
		update_wear_icon()	//update our mob overlays
		usr.update_action_buttons()


/obj/item/clothing/head/helmet/altyn/brown
	icon_state = "altyn_brown"

/obj/item/clothing/head/helmet/altyn/black
	icon_state = "altyn_black"

/obj/item/clothing/head/helmet/altyn/maska
	name = "maska helmet"
	desc = "\"I do not know who I am, I don\'t know why I\'m here. All I know is that I must kill.\""
	icon_state = "maska"
	armor_down = list(melee = 40, bullet = 40, energy = 0, bomb = 45, bio = 0, rad = 0) // best what you can get, unless you face lasers

/obj/item/clothing/head/helmet/helmet/visor/cyberpunkgoggle
	name = "\improper Type-34C Semi-Enclosed Headwear"
	desc = "Civilian model of a popular helmet used by certain law enforcement agencies. It does not have any armor plating, but has a neo-laminated fabric lining."
	icon_state = "cyberpunkgoggle"
	flags_inv = HIDEEARS|HIDEEYES|BLOCKHAIR
	siemens_coefficient = 0.9	//More conductive than most helmets
	armor = list(
		melee = 5,
		bullet = 20,
		energy = 10,
		bomb = 0,
		bio = 0,
		rad = 0
	)
