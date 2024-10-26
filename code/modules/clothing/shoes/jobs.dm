/obj/item/clothing/shoes/galoshes
	name = "galoshes"
	desc = "A pair of slip-resistant rubber boots used for janitorial work."
	icon_state = "galoshes"
	permeability_coefficient = 0.05
	siemens_coefficient = 0 // DAMN BOI
	item_flags = NOSLIP
	slowdown = SHOES_SLOWDOWN+1
	species_restricted = null

/obj/item/clothing/shoes/jackboots
	name = "jackboots"
	desc = "A pair of standard-issue jackboots typically worn by people who need to stomp things."
	icon_state = "jackboots"
	item_state = "jackboots"
	force = WEAPON_FORCE_HARMLESS
	armor_list = list(melee = 3, bullet = 0, energy = 2, bomb = 0, bio = 25, rad = 0)
	siemens_coefficient = 0.6
	can_hold_knife = TRUE

/obj/item/clothing/shoes/jackboots/german
	name = "brown jackboots"
	desc = "A pair of standard-issue jackboots typically worn by people who need to stomp things. These ones are brown."
	icon_state = "germanboots"

/obj/item/clothing/shoes/jackboots/duty
	name = "duty jackboots"
	desc = "A pair of standard-issue police steel-toed boots. For when you really need to remind the criminals what the law is."
	icon_state = "duty"
	armor_list = list(melee = 3, bullet = 2, energy = 2, bomb = 0, bio = 25, rad = 0)
	siemens_coefficient = 0.8
	can_hold_knife = TRUE

/obj/item/clothing/shoes/jackboots/duty/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Default"] = "duty"
	options["Default Knee High"] = "duty_long"
	options["Default Heel Knee High"] = "duty_heel"
	options["Lighter"] = "duty_sec"
	options["Lighter Knee High"] = "duty_long_sec"
	options["Lighter Heel Knee High"] = "duty_heel_sec"
	options["Brown"] = "duty_dirt_kicker"
	options["Brown Knee High"] = "duty_long_dirt_kicker"
	options["Brown Heel Knee High"] = "duty_heel_dirt_kicker"
	options["Camo Green"] = "duty_rainboots"
	options["Camo Knee High"] = "duty_long_rainboots"
	options["Camo Heel Knee High"] = "duty_heel_rainboots"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your boot's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/shoes/reinforced
	name = "reinforced boots"
	desc = "A pair of metallic boots designed for industrial environments."
	icon_state = "reinforced"
	item_state = "reinforced"
	armor_list = list(melee = 3, bullet = 0, energy = 2, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.5

/obj/item/clothing/shoes/reinforced/medical
	name = "soteria reinforced shoes"
	desc = "Slightly reinforced shoes for soteria medical personnel."
	icon_state = "medshoes"
	item_state = "medshoes"

/obj/item/clothing/shoes/workboots
	name = "workboots"
	desc = "A pair of steel-toed utility workboots."
	icon_state = "workboots"
	item_state = "workboots"
	armor_list = list(melee = 2, bullet = 0, energy = 2, bomb = 0, bio = 0, rad = 0) //Worse than jackboots and reinforced boots due to granting shock immunity to legs
	siemens_coefficient = 0
	can_hold_knife = 1

/obj/item/clothing/shoes/jackboots/janitor
	name = "custodian's jackboots"
	desc = "Specially altered jackboots for custodians to prevent them from slipping."
	icon_state = "jackboots"
	item_state = "jackboots"
	force = WEAPON_FORCE_HARMLESS
	siemens_coefficient = 0.3
	item_flags = NOSLIP
	can_hold_knife = TRUE

/obj/item/clothing/shoes/jackboots/toeless
	name = "toeless jackboots"
	desc = "A modified pair of jackboots, designed for species with clawed feet."
	icon_state = "digiboots"
	species_restricted = null

/obj/item/clothing/shoes/workboots/toeless
	name = "toeless workboots"
	desc = "A modified pair of workboots, designed for species with clawed feet."
	icon_state = "workbootstoeless"
	species_restricted = null

/obj/item/clothing/shoes/artist_shoes
	name = "Pointy Shoes"
	desc = "They're actually quite comfortable."
	icon_state = "artist"
	item_state = "artist_shoes"

/obj/item/clothing/shoes/hermes_shoes
	name = "Hermes Boots"
	desc = "Boots used by the faithful to spread the word of God more affectively with bulky items by small hidden wheels under the heels. Sadly not all that good at protecting your feet as other more robust boots."
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)
	matter = list(MATERIAL_BIOMATTER = 10, MATERIAL_PLASTIC = 2, MATERIAL_SILVER = 2, MATERIAL_GOLD = 2)
	icon_state = "hermes"
	item_state = "hermes"
	slowdown = SHOES_SLOWDOWN - 0.3 //Less of a speed buff more of an off-set to slowdown
	can_hold_knife = 1//Still boots
	price_tag = 120

/obj/item/clothing/shoes/hunterboots
	name = "Hunter Boots"
	desc = "A pair of shin high boots made of tahca or mukhwa leather. The neck is adorned with fur and what seem to be some sort of smooth scales. \
			They fit your feet snuggly, you could run in these forever."
	icon_state = "hunterboots"
	item_state = "hunterboots"
	force = WEAPON_FORCE_HARMLESS
	armor_list = list(melee = 5, bullet = 1, energy = 2, bomb = 5, bio = 25, rad = 5)
	siemens_coefficient = 0.6
	price_tag = 200
	can_hold_knife = 1

/obj/item/clothing/shoes/hunterboots/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Tahca Hide boots"] = "hunterboots"
	options["Mukhwa Leather boots"] = "hunterboots_alt"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		to_chat(M, "You adjusted your boot's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return 1

/obj/item/clothing/shoes/claws_hoofs_paws
	name = "clawsteps"
	desc = "A pair of claws (hoofs or paws). Aside of the person not wearing exactly anything on their feet aside of being barefoot, it does looks sturdy enough to walk in glass and probably protect againts some damage"
	icon_state = "feet_hoof_paw"
	item_state = "feet_hoof_paw"
	force = WEAPON_FORCE_HARMLESS
	can_hold_knife = FALSE //ITS YOUR FEEET!! YOU CAN'T HOLD A KNIFE ON YOUR FEET!!
