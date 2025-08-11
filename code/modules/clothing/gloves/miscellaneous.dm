/obj/item/clothing/gloves/captain
	desc = "A pair of regal blue gloves with a swanky gold trim."
	name = "premier's gloves"  //Sprites from Eris
	icon_state = "captain"
	item_state = "captain"
	armor_list = list(melee = 6, bullet = 2, energy = 6, bomb = 0, bio = 0, rad = 0)
	price_tag = 250

/obj/item/clothing/gloves/runed
	name = "rune gloves"
	desc = "An expensive designers gloves fitted with a golden ring and engraved with decretive runes."
	icon_state = "runed_glove_ring"
	item_state = "runed_glove_ring"
	price_tag = 220

/obj/item/clothing/gloves/cyborg
	desc = "Beep boop."
	name = "cyborg gloves"
	icon_state = "robohands"
	item_state = "robohands"
	siemens_coefficient = 1

/obj/item/clothing/gloves/insulated
	desc = "A pair of gloves which protect the wearer from electric shocks."
	name = "insulated gloves"
	icon_state = "yellow"
	item_state = "yellow"
	armor_list = list(melee = 0, bullet = 0, energy = 3, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	price_tag = 200

/obj/item/clothing/gloves/insulated/guild
	name = "Artificers insulated gloves"
	desc = "A pair of insulated gloves woven into a thicker fire resistant pair."
	icon_state = "guild_yellow"
	item_state = "guild_yellow"
	armor_list = list(melee = 5, bullet = 3, energy = 3, bomb = 10, bio = 100, rad = 100)
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	price_tag = 500
	cold_protection = ARMS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = ARMS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE


/obj/item/clothing/gloves/insulated/cheap                          //Cheap Chinese Crap
	desc = "A pair of cheaply-made insulated gloves. Not known for reliability."
	name = "budget insulated gloves"
	siemens_coefficient = 1			//Set to a default of 1, gets overridden in New()
	permeability_coefficient = 0.05
	price_tag = 50

/obj/item/clothing/gloves/insulated/cheap/Initialize(mapload, ...)
	. = ..()
	//average of 0.5, somewhat better than regular gloves' 0.75
	siemens_coefficient = pick(0,0.1,0.3,0.5,0.5,0.75,1.35)

/obj/item/clothing/gloves/thick
	desc = "A pair of fire-resistant black work gloves with light electrical insulation."
	name = "thick gloves"
	icon_state = "black"
	item_state = "black"
	armor_list = list(melee = 5, bullet = 0, energy = 5, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.2
	permeability_coefficient = 0.05
	price_tag = 100

	cold_protection = ARMS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = ARMS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/thick/brown
	desc = "A pair of fire-resistant brown work gloves."
	name = "thick brown gloves"
	icon_state = "germangloves"
	item_state = "germangloves"

/obj/item/clothing/gloves/thick/handmade
	name = "handmade combat gloves"
	desc = "A pair of modified work gloves with some steel."
	icon_state = "hm_combat"
	item_state = "hm_combat"
	armor_list = list(melee = 6, bullet = 1, energy = 5, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.6
	price_tag = 150

/obj/item/clothing/gloves/thick/swat
	desc = "A pair of fire and impact-resistant security combat gloves."
	name = "combat gloves"
	icon_state = "ihscombat"
	item_state = "ihscombat"
	armor_list = list(melee = 6, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	price_tag = 150

/obj/item/clothing/gloves/thick/swat/insulated
	name = "insulated combat gloves"
	desc = "A pair of fire and impact-resistant security combat gloves. \
	These have added insulated gloves sacerficing some of its protection to be better suited to deal with eletrical work under less then ideal cases."
	icon_state = "combat_yellow"
	item_state = "combat_yellow"
	armor_list = list(melee = 3, bullet = 3, energy = 2, bomb = 0, bio = 0, rad = 0)
	price_tag = 350
	siemens_coefficient = 0


/obj/item/clothing/gloves/thick/ablative
	name = "ablative gloves"
	desc = "A thick pair of gloves that excel at protecting the wearer against energy projectiles."
	armor_list = list(melee = 2, bullet = 2, energy = 17, bomb = 30, bio = 10, rad = 0)
	icon_state = "ihscombat"
	item_state = "ihscombat"
	price_tag = 150
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 10, MATERIAL_PLATINUM = 2)

/obj/item/clothing/gloves/thick/ablative/militia
	name = "militia ablative gloves"
	desc = "A thick pair of gloves that excel at protecting the wearer against energy projectiles."
	armor_list = list(melee = 2, bullet = 2, energy = 3, bomb = 10, bio = 0, rad = 0)
	icon_state = "bs_ablative"
	item_state = "ihscombat"

/obj/item/clothing/gloves/thick/ablative/iron_lock_security
	name = "outdated gloves"
	desc = "A pair of \"Iron Lock Security\" ablative gloves with plates designed to absorb energy projectiles, even after all this time no one has been able to improve its design by Greyson Positronic."

/obj/item/clothing/gloves/thick/swat/militia
	name = "militia bulletproof gloves"
	desc = "A pair of heavy duty gauntlets designed with high-grade bulletproof materials."
	icon_state = "bs_bulletproof"
	item_state = "ihscombat"
	armor_list = list(melee = 2, bullet = 15, energy = 2, bomb = 10, bio = 0, rad = 0)

/obj/item/clothing/gloves/thick/swat/blackshield_corpsman
	name = "corpsman combat gloves"
	desc = "A pair of fire and impact-resistant corpsman combat gloves." // No lying, it's not anti-germs.
	icon_state = "corpsman_base_gloves"
	item_state = "corpsman_base_gloves"
	armor_list = list(melee = 6, bullet = 5, energy = 5, bomb = 0, bio = 15, rad = 0)
	siemens_coefficient = 0
	price_tag = 250

/obj/item/clothing/gloves/thick/swat/blackshield_corpsman/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Basics"] = "corpsman_base_gloves"
	options["Night Camo"] = "corpsman_black_gloves"
	options["Gray Clays Camo"] = "corpsman_drab_gloves"
	options["Jungle Camo"] = "corpsman_green_gloves"
	options["Swamp Camo"] = "corpsman_tan_gloves"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return TRUE


/obj/item/clothing/gloves/thick/swat/blackshield //Combined effect of SWAT gloves and insulated gloves
	name = "blackshield combat gloves"
	icon_state = "bs_base_gloves"
	item_state = "bs_base_gloves"
	armor_list = list(melee = 6, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0
	price_tag = 250

/obj/item/clothing/gloves/thick/swat/blackshield/verb/toggle_style()
	set name = "Adjust Style"
	set category = "Object"
	set src in usr

	if(!isliving(loc))
		return

	var/mob/M = usr
	var/list/options = list()
	options["Basics"] = "bs_base_gloves"
	options["Night Camo"] = "bs_black_gloves"
	options["Gray Clays Camo"] = "bs_drab_gloves"
	options["Jungle Camo"] = "bs_green_gloves"
	options["Swamp Camo"] = "bs_tan_gloves"

	var/choice = input(M,"What kind of style do you want?","Adjust Style") as null|anything in options

	if(src && choice && !M.incapacitated() && Adjacent(M))
		icon_state = options[choice]
		item_state = options[choice]
		to_chat(M, "You adjusted your attire's style into [choice] mode.")
		update_icon()
		update_wear_icon()
		usr.update_action_buttons()
		return TRUE


/obj/item/clothing/gloves/thick/combat //Combined effect of SWAT gloves and insulated gloves
	desc = "A pair of fire, shock-proof, and impact-resistant combat gloves."
	name = "combat gloves"
	icon_state = "black"
	item_state = "black"
	armor_list = list(melee = 6, bullet = 5, energy = 5, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0
	price_tag = 250


/obj/item/clothing/gloves/thick/hunter
	desc = "Tough, tight fitting and reinforced with bone this pair of leather gloves blend a perfect compromise between durability and comfort thanks to the different materials used."
	name = "hunter gloves"
	icon_state = "huntergloves"
	item_state = "huntergloves"
	armor_list = list(melee = 7, bullet = 2, energy = 5, bomb = 10, bio = 5, rad = 0)
	siemens_coefficient = 0.5
	price_tag = 200

/obj/item/clothing/gloves/knuckles
	name = "knuckle gloves"
	desc = "Gloves with additional reinforcment on the knuckles."
	icon_state = "knuckles"
	item_state = "knuckles"
	armor_list = list(melee = 5, bullet = 1, energy = 0, bomb = 0, bio = 0, rad = 0)
	price_tag = 50

/obj/item/clothing/gloves/evening
	name = "evening gloves"
	initial_name = "evening gloves"
	desc = "A pair of elegant evening gloves."
	icon_state = "evening_gloves"
	item_state = "evening_gloves"

/obj/item/clothing/gloves/ash_evening
	name = "ash evening gloves"
	initial_name = "ash evening gloves"
	desc = "A pair of ash elegant evening gloves."
	icon_state = "ash_evening_gloves"
	item_state = "ash_evening_gloves"

/obj/item/clothing/gloves/ash_evening
	name = "ash evening gloves"
	initial_name = "ash evening gloves"
	desc = "A pair of ash elegant evening gloves."
	icon_state = "ash_evening_gloves"
	item_state = "ash_evening_gloves"

/obj/item/clothing/gloves/goldenring
	name = "golden ring"
	initial_name = "golden ring"
	desc = "Large ring made of gold, to put on the naked hand, sadly cant fit any gloves over its bulk." //Todo: make rings be able to be placed on gloves and on the bar hand
	icon_state = "goldenring"
	item_state = "goldenring"
	price_tag = 250
	siemens_coefficient = 1.0 //Its not protecting you
	armor_list = list(melee = 0, bullet = 0, energy = 0, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/gloves/latex
	name = "latex gloves"
	desc = "A pair of sterile latex gloves."
	icon_state = "latex"
	item_state = "latex"
	siemens_coefficient = 1.0 //thin latex gloves, much more conductive than fabric gloves (basically a capacitor for AC)
	permeability_coefficient = 0.01
	price_tag = 50

/obj/item/clothing/gloves/latex/nitrile
	name = "nitrile gloves"
	desc = "A pair of sterile nitrile gloves."
	icon_state = "nitrile"
	item_state = "nitrile"

/obj/item/clothing/gloves/latex/regal
	name = "regal white gloves"
	desc = "A pair of white gloves, made with old fashioned gauze rather than latex. Still surprisingly sterile for all medical purposes."
	icon_state = "regal"
	item_state = "regal"
	siemens_coefficient = 1.0
	permeability_coefficient = 0.01
	price_tag = 300 // A relic!

/obj/item/clothing/gloves/botanic_leather
	desc = "A pair of leather work gloves that protect against floral dangers such as thorns and barbs."
	name = "botanist's leather gloves"
	icon_state = "leather"
	item_state = "leather"
	permeability_coefficient = 0.05
	siemens_coefficient = 0.50 //thick work gloves
	price_tag = 50

/obj/item/clothing/gloves/botanic_leather/claw
	name = "clawed glove"
	desc = "A single claw took away from some type of animal, that protects against floral dangers such as thorns and barbs."
	icon_state = "claw"
	item_state = "claw"

/obj/item/clothing/gloves/aerostatic_gloves
	name = "red designer leather gloves"
	desc = "A pair of elegant leather gloves."
	icon_state = "aerostatic_gloves"
	item_state = "aerostatic_gloves"
	permeability_coefficient = 0.05
	siemens_coefficient = 0.50 //thick work gloves
	price_tag = 50

/obj/item/clothing/gloves/fingerless
	desc = "A pair of gloves modified for species with clawed hands."
	name = "fingerless gloves"
	icon_state = "fingerlessgloves"
	clipped = TRUE
	cold_protection = ARMS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = ARMS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE
	price_tag = 10

/obj/item/clothing/gloves/membrane
	name = "scientific gloves"
	desc = "Heavy gloves to keep your hands intact for future experiments."
	icon_state = "science"
	item_state = "science"
	armor_list = list(melee = 6, bullet = 1, energy = 5, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.5
	permeability_coefficient = 0.05
	price_tag = 50
