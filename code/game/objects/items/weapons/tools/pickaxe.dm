/obj/item/tool/pickaxe
	name = "Pickaxe"
	desc = "The most basic of mining tools, for short excavations and small mineral extractions."
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_EXTREME // It's a pickaxe. It's destined to poke holes in things, even armor.
	throwforce = WEAPON_FORCE_NORMAL
	worksound = WORKSOUND_PICKAXE
	icon_state = "pickaxe"
	item_state = "pickaxe"
	max_health = 500
	w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_STEEL = 6)
	tool_qualities = list(QUALITY_EXCAVATION = 10, QUALITY_PRYING = 20) //So it still shares its switch off quality despite not yet being used.
	switched_off_qualities = list(QUALITY_EXCAVATION = 10, QUALITY_PRYING = 20)
	switched_on_qualities = list(QUALITY_DIGGING = 35, QUALITY_PRYING = 20)
	toggleable = TRUE
	origin_tech = list(TECH_MATERIAL = 1, TECH_ENGINEERING = 1)
	attack_verb = list("hit", "pierced", "sliced", "attacked")
	sharp = TRUE
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY //Drills and picks are made for getting through hard materials
	//They are the best anti-structure melee weapons
	embed_mult = 1.2 //Digs deep
	mode = EXCAVATE //Mode should be whatever is the starting tool and off quality.
	price_tag = 45

/obj/item/tool/pickaxe/equipped(mob/user)
	..()
	update_icon()

/obj/item/tool/pickaxe/dropped(mob/user)
	..()
	update_icon()

/obj/item/tool/pickaxe/turn_on(mob/user)
	.=..()
	if(.)
		mode = DIG
		to_chat(user, SPAN_NOTICE("You tighten your grip on [src], and ready yourself to strike earth."))

/obj/item/tool/pickaxe/turn_off(mob/user)

	mode = EXCAVATE
	to_chat(user, SPAN_NOTICE("You loosen your grip on [src], and prepare to remove debris."))
	..()

/obj/item/tool/pickaxe/upgraded
	name = "plasteel-head pickaxe"
	desc = "A normal-looking pickaxe with the head replaced with plasteel."
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 2)
	tool_qualities = list(QUALITY_EXCAVATION = 20, QUALITY_PRYING = 20)
	switched_off_qualities = list(QUALITY_EXCAVATION = 20, QUALITY_PRYING = 20)
	switched_on_qualities = list(QUALITY_DIGGING = 40, QUALITY_PRYING = 20)
	workspeed = 1.1

/obj/item/tool/pickaxe/onestar
	name = "Greyson Positronic Pickaxe"
	desc = "A standard Greyson Positronic digging tool. Whatever secrets they used to make this so powerful and cheap is a mystery."
	icon_state = "one_star_pickaxe"
	item_state = "pickaxe"
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLATINUM = 2, MATERIAL_DIAMOND = 2)
	price_tag = 900 //Diamond and fancy.
	origin_tech = list(TECH_MATERIAL = 3, TECH_ENGINEERING = 2, TECH_POWER = 3)
	switched_on_forcemult = 1.3 //26
	tool_qualities = list(QUALITY_EXCAVATION = 50, QUALITY_PRYING = 25)
	switched_off_qualities = list(QUALITY_EXCAVATION = 50, QUALITY_PRYING = 25)
	switched_on_qualities = list(QUALITY_DIGGING = 50, QUALITY_PRYING = 25)
	glow_color = COLOR_BLUE_LIGHT
	degradation = 2
	workspeed = 1.2
	use_power_cost = 0
	allow_greyson_mods = TRUE

/obj/item/tool/pickaxe/onestar/turn_on(mob/user)
	..(null, TRUE)
	mode = DIG
	to_chat(user, SPAN_NOTICE("You turn on [src], readying yourself to strike earth."))
	playsound(user, 'sound/weapons/saberon.ogg', 50, 1)

/obj/item/tool/pickaxe/onestar/turn_off(mob/user)
	..(null, TRUE)
	mode = EXCAVATE
	to_chat(user, SPAN_NOTICE("You turn off [src], and prepare to remove debris."))
	playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)

/obj/item/tool/pickaxe/onestar/cyborg
	workspeed = 1.4

/obj/item/tool/pickaxe/jackhammer
	name = "jackhammer"
	desc = "Cracks rocks with blasts, perfect for killing cave lizards."
	icon_state = "jackhammer"
	item_state = "jackhammer"
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTIC = 2)
	tool_qualities = list(QUALITY_EXCAVATION = 35)
	switched_off_qualities = list(QUALITY_EXCAVATION = 35)
	switched_on_qualities = list(QUALITY_DIGGING = 45)
	origin_tech = list(TECH_MATERIAL = 3, TECH_POWER = 2, TECH_ENGINEERING = 2)
	workspeed = 1.4
	degradation = 0.7
	use_power_cost = 0.6
	suitable_cell = /obj/item/cell/medium
	price_tag = 60

/obj/item/tool/pickaxe/jackhammer/onestar
	name = "Greyson Positronic Jackhammer"
	desc = "A heavy Greyson Positronic tool that cracks rocks with blasts, perfect for killing capitalist pigs."
	icon_state = "one_star_jackhammer"
	item_state = "jackhammer"
	matter = list(MATERIAL_STEEL = 7, MATERIAL_PLATINUM = 2)
	tool_qualities = list(QUALITY_EXCAVATION = 35)
	switched_off_qualities = list(QUALITY_EXCAVATION = 35)
	switched_on_qualities = list(QUALITY_DIGGING = 75)
	origin_tech = list(TECH_MATERIAL = 4, TECH_POWER = 2, TECH_ENGINEERING = 3)
	degradation = 0.6
	workspeed = 1.7
	max_upgrades = 2
	use_power_cost = 0.8
	price_tag = 1100

/obj/item/tool/pickaxe/drill
	name = "mining drill" // Can dig sand as well!
	desc = "Yours is the drill that will pierce through the rock walls."
	icon_state = "handdrill"
	item_state = "jackhammer"
	tool_qualities = list(QUALITY_EXCAVATION = 10, QUALITY_DRILLING = 15)
	switched_off_qualities = list(QUALITY_EXCAVATION = 10, QUALITY_DRILLING = 15)
	switched_on_qualities = list(QUALITY_DIGGING = 40, QUALITY_DRILLING = 40)
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 2)
	origin_tech = list(TECH_MATERIAL = 2, TECH_POWER = 3, TECH_ENGINEERING = 2)
	degradation = 0.7
	use_fuel_cost = 0.07
	max_fuel = 100
	price_tag = 90

/obj/item/tool/pickaxe/drill/onestar
	name = "Greyson Positronic mining drill"
	desc = "Yours is the drill that will pierce through the worker, metaphorically."
	icon_state = "one_star_drill"
	tool_qualities = list(QUALITY_EXCAVATION = 20, QUALITY_DRILLING = 20)
	switched_off_qualities = list(QUALITY_EXCAVATION = 20, QUALITY_DRILLING = 20)
	switched_on_qualities = list(QUALITY_DIGGING = 60, QUALITY_DRILLING = 60)
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLATINUM = 2)
	origin_tech = list(TECH_MATERIAL = 4, TECH_POWER = 3, TECH_ENGINEERING = 2)
	degradation = 0.6
	workspeed = 1.7
	max_upgrades = 2
	use_fuel_cost = 0.10
	max_fuel = 90
	price_tag = 1400

/obj/item/tool/pickaxe/diamonddrill
	name = "diamond-point mining drill"
	desc = "Yours is the drill that will pierce the universe!"
	icon_state = "diamonddrill"
	item_state = "jackhammer"
	force = WEAPON_FORCE_DANGEROUS * 1.15
	tool_qualities = list(QUALITY_EXCAVATION = 10, QUALITY_DRILLING = 20)
	switched_off_qualities = list(QUALITY_EXCAVATION = 10, QUALITY_DRILLING = 20)
	switched_on_qualities = list(QUALITY_DIGGING = 50, QUALITY_DRILLING = 50)
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 2, MATERIAL_DIAMOND = 1)
	origin_tech = list(TECH_MATERIAL = 6, TECH_POWER = 4, TECH_ENGINEERING = 5)
	max_upgrades = 4
	degradation = 0.1
	use_fuel_cost = 0.07
	max_fuel = 120
	workspeed = 1.5
	price_tag = 900

/obj/item/tool/pickaxe/diamonddrill/rig
	tool_qualities = list(QUALITY_DIGGING = 50, QUALITY_DRILLING = 50)
	use_fuel_cost = 0
	passive_fuel_cost = 0

/obj/item/tool/pickaxe/excavation
	name = "hand pickaxe"
	desc = "A smaller, more precise version of the pickaxe, used for archaeological excavation."
	icon_state = "pick_hand"
	item_state = "syringe_0"
	force = WEAPON_FORCE_PAINFUL //It's smaller
	tool_qualities = list(QUALITY_EXCAVATION = 50, QUALITY_PRYING = 15)
	switched_off_qualities = list(QUALITY_EXCAVATION = 50, QUALITY_PRYING = 15)
	switched_on_qualities = list(QUALITY_DIGGING = 15, QUALITY_PRYING = 15)
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_STEEL = 3)
	price_tag = 70
