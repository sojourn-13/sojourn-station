/obj/item/clothing/gloves/captain
	desc = "A pair of regal blue gloves with a swanky gold trim."
	name = "captain's gloves"
	icon_state = "captain"
	item_state = "egloves"
	price_tag = 500

/obj/item/clothing/gloves/cyborg
	desc = "Beep boop."
	name = "cyborg gloves"
	icon_state = "robohands"
	item_state = "r_hands"
	siemens_coefficient = 1.0

/obj/item/clothing/gloves/insulated
	desc = "A pair of gloves which protect the wearer from electric shocks."
	name = "insulated gloves"
	icon_state = "yellow"
	item_state = "ygloves"
	siemens_coefficient = 0
	permeability_coefficient = 0.05
	price_tag = 200

/obj/item/clothing/gloves/insulated/cheap                          //Cheap Chinese Crap
	desc = "A pair of cheaply-made insulated gloves. Not known for reliability."
	name = "budget insulated gloves"
	siemens_coefficient = 1			//Set to a default of 1, gets overridden in New()
	permeability_coefficient = 0.05
	price_tag = 50

	New()
		//average of 0.5, somewhat better than regular gloves' 0.75
		siemens_coefficient = pick(0,0.1,0.3,0.5,0.5,0.75,1.35)

/obj/item/clothing/gloves/thick
	desc = "A pair of fire-resistant black work gloves."
	name = "thick gloves"
	icon_state = "black"
	item_state = "bgloves"
	siemens_coefficient = 0.50
	permeability_coefficient = 0.05
	price_tag = 100

	cold_protection = ARMS
	min_cold_protection_temperature = GLOVES_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = ARMS
	max_heat_protection_temperature = GLOVES_MAX_HEAT_PROTECTION_TEMPERATURE

/obj/item/clothing/gloves/thick/handmade
	name = "handmade combat gloves"
	desc = "A pair of modified work gloves with some steel."
	icon_state = "hm_combat"
	item_state = "bgloves"
	armor = list(melee = 25, bullet = 15, laser = 15,energy = 12, bomb = 25, bio = 5, rad = 0)
	siemens_coefficient = 0.6
	price_tag = 150

/obj/item/clothing/gloves/thick/swat
	desc = "A pair of fire and impact-resistant IHS combat gloves."
	name = "IHS combat gloves"
	icon_state = "ihscombat"
	item_state = "ihscombat"
	armor = list(melee = 40, bullet = 30,energy = 30, bomb = 40, bio = 10, rad = 0)
	price_tag = 300

/obj/item/clothing/gloves/thick/combat //Combined effect of SWAT gloves and insulated gloves
	desc = "A pair of fire and impact-resistant combat gloves."
	name = "combat gloves"
	icon_state = "black"
	item_state = "swat_gl"
	armor = list(melee = 40, bullet = 30, energy = 30, bomb = 40, bio = 10, rad = 0)
	siemens_coefficient = 0
	price_tag = 500

/obj/item/clothing/gloves/evening
	name = "evening gloves"
	initial_name = "evening gloves"
	desc = "A pair of elegant evening gloves."
	icon_state = "evening_gloves"
	item_state = "evening_gloves"

/obj/item/clothing/gloves/latex
	name = "latex gloves"
	desc = "A pair of sterile latex gloves."
	icon_state = "latex"
	item_state = "lgloves"
	siemens_coefficient = 1.0 //thin latex gloves, much more conductive than fabric gloves (basically a capacitor for AC)
	permeability_coefficient = 0.01
	germ_level = 0
	price_tag = 50

/obj/item/clothing/gloves/botanic_leather
	desc = "A pair of leather work gloves that protect against floral dangers such as thorns and barbs."
	name = "botanist's leather gloves"
	icon_state = "leather"
	item_state = "ggloves"
	permeability_coefficient = 0.05
	siemens_coefficient = 0.50 //thick work gloves
	price_tag = 50
