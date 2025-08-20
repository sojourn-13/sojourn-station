/obj/item/tool/shovel
	name = "shovel"
	desc = "A large tool for digging and moving dirt and rock."
	icon_state = "shovel"
	item_state = "shovel"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_MATERIAL = 1, TECH_ENGINEERING = 1)
	matter = list(MATERIAL_STEEL = 5)
	attack_verb = list("bashed", "bludgeoned", "thrashed", "whacked")
	sharp = FALSE
	edge = TRUE
	max_health = 500
	tool_qualities = list(QUALITY_SHOVELING = 35, QUALITY_DIGGING = 35, QUALITY_EXCAVATION = 10)
	effective_faction = list("spiders") // Spiders are weak to crushing.
	damage_mult = 2
	hitsound = 'sound/weapons/smash.ogg'
	price_tag = 15

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "switches their stance to avoid using the blade of their weapon"
	alt_mode_lossrate = 0.9


/obj/item/tool/shovel/improvised
	name = "junk shovel"
	desc = "A large but fragile tool for moving dirt and rock, made by hand. Has more than enough space for tool mods to make it better."
	icon_state = "impro_shovel"
	tool_qualities = list(QUALITY_SHOVELING = 25, QUALITY_DIGGING = 25, QUALITY_EXCAVATION = 10)
	degradation = 1.5
	max_upgrades = 5 //all makeshift tools get more mods to make them actually viable for mid-late game
	price_tag = 10

/obj/item/tool/shovel/combat
	name = "combat crovel"
	desc = "A plasteel crovel with a sharp head, serrated side, crowbar lever on the pommel, and a fold-able winch for easy transport. For when you need to dig out trenches, hammer barricades together, cave in skulls, and cut your steak."
	icon_state = "combat_shovel"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_SMALL
	armor_divisor = ARMOR_PEN_SHALLOW
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTEEL = 6)
	tool_qualities = list(QUALITY_SHOVELING = 45, QUALITY_DIGGING = 45, QUALITY_PRYING = 30, QUALITY_CUTTING = 10, QUALITY_SAWING = 5, QUALITY_HAMMERING = 5)
	workspeed = 1.2
	price_tag = 175

/obj/item/tool/shovel/combat/marqua
	name = "Mar'quaian crovel"
	desc = "A sharp, balanced crovel made from a strange alloy."
	icon_state = "clustertool-shovel"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	w_class = ITEM_SIZE_SMALL
	armor_divisor = ARMOR_PEN_SHALLOW
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTEEL = 6)
	tool_qualities = list(QUALITY_SHOVELING = 85, QUALITY_DIGGING = 85, QUALITY_PRYING = 70, QUALITY_CUTTING = 30, QUALITY_SAWING = 45, QUALITY_HAMMERING = 30)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_SILVER = 3, MATERIAL_GOLD = 2, MATERIAL_DIAMOND = 0.5, MATERIAL_BIOMATTER = 10)
	max_upgrades = 0
	workspeed = 1.5
	degradation = 0
	price_tag = 2875

/obj/item/tool/shovel/combat/turbo
	name = "Artificer Power Crovel"
	desc = "A creation of the Artificer's Guild dreamed up by an adept with a love for internal combustion. Rather than a cell, this device uses a high power fuel burning engine for high-octane shoveling. An engraving on the handle reads, \"THIS MACHINE KILLS SPIDERS.\""
	icon_state = "Powercrovel" //Sprites by Dromkii
	item_state = "Powercrovel"
	icon = "icons/obj/powercrovel.dmi"
	slot_flags = SLOT_BELT|SLOT_BACK //I PAID FOR THE WHOLE BACK SPRITE, I'M GONNA USE THE WHOLE BACK SPRITE
	switched_on_icon_state = "Powercrovel-on"
	wielded_icon = "Powercrovel_wielded"
	switched_on_forcemult = 1.3 //26 damage. Slightly worse than a chainsaw. Gets bonus damage vs spiders, like all shovels
	workspeed = 1.3
	w_class = ITEM_SIZE_NORMAL //Bigger than a normal crovel, doesn't fit in your pocket
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "Powercrovel"
		)


	toggleable = TRUE
	use_fuel_cost = 0.1
	passive_fuel_cost = 0.05
	max_fuel = 80

	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTEEL = 6, MATERIAL_DIAMOND = 1) //Added 1 diamond due to the crafting repice having one
	switched_on_qualities = list(QUALITY_SHOVELING = 60, QUALITY_DIGGING = 45, QUALITY_PRYING = 30, QUALITY_CUTTING = 10, QUALITY_SAWING = 15)
	switched_off_qualities = list(QUALITY_SHOVELING = 25, QUALITY_DIGGING = 25, QUALITY_PRYING = 25, QUALITY_CUTTING = 5, QUALITY_SAWING = 5) //Still kindof usable when off

/obj/item/tool/shovel/combat/turbo/turn_on(mob/user)
	.=..()
	if(.)
		to_chat(user, SPAN_NOTICE("You rev up the [src]."))
		playsound(loc, 'sound/items/chainsaw_on.ogg', 40)
		hitsound = WORKSOUND_CHAINSAW //It only makes chainsaw noises when it's on!
		START_PROCESSING(SSobj, src)

/obj/item/tool/shovel/combat/turbo/turn_off()
	playsound(loc, 'sound/items/chainsaw_off.ogg', 80)
	hitsound = 'sound/weapons/smash.ogg'
	..()

/obj/item/tool/shovel/onestar_shovel
	name = "Greyson Positronic shovel"
	desc = "A large tool for digging and moving dirt and rock with the finest engineering put into it for maximum lift and heaving."
	icon_state = "one_star_shovel"
	force = WEAPON_FORCE_DANGEROUS
	throwforce = WEAPON_FORCE_DANGEROUS
	matter = list(MATERIAL_STEEL = 6, MATERIAL_PLASTEEL = 6, MATERIAL_PLATINUM = 3)
	tool_qualities = list(QUALITY_SHOVELING = 60, QUALITY_DIGGING = 45, QUALITY_EXCAVATION = 45)
	workspeed = 1.4
	degradation = 2
	max_upgrades = 2
	price_tag = 320 // Still just a shovel.
	allow_greyson_mods = TRUE

/obj/item/tool/shovel/spade
	name = "spade"
	desc = "A small tool ofter used for simple gardening task such as digging soil and moving dirt."
	icon_state = "spade"
	item_state = "spade"
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_SMALL
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)
	tool_qualities = list(QUALITY_SHOVELING = 20, QUALITY_DIGGING = 20, QUALITY_EXCAVATION = 10)
	max_upgrades = 2
	price_tag = 60

/obj/item/tool/shovel/power
	name = "power shovel 9000"
	desc = "A powered shovel for all your dumpster diving needs."
	icon_state = "powershovel"
	item_state = "shovel"
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 6,  MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 1)
	tool_qualities = list(QUALITY_SHOVELING = 60, QUALITY_DIGGING = 45, QUALITY_EXCAVATION = 20)
	workspeed = 1.3
	use_power_cost = 0.8
	degradation = 0.7
	max_upgrades = 4
	suitable_cell = /obj/item/cell/medium
	price_tag = 300
