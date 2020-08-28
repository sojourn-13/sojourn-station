/obj/item/weapon/tool/hammer
	name = "hammer"
	desc = "Used for applying blunt force to a surface."
	icon_state = "hammer"
	item_state = "hammer"
	flags = CONDUCT
	force = WEAPON_FORCE_PAINFUL
	worksound = WORKSOUND_HAMMER
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_ENGINEERING = 1)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_WOOD = 2)
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked","flattened","pulped")
	tool_qualities = list(QUALITY_HAMMERING = 30, QUALITY_PRYING = 10)

/obj/item/weapon/tool/hammer/powered_hammer
	name = "powered sledgehammer"
	desc = "Used for applying excessive blunt force to a surface."
	icon_state = "powered_hammer"
	item_state = "powered_hammer"
	wielded_icon = "powered_hammer_on"
	switched_on_force = WEAPON_FORCE_BRUTAL
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BELT|SLOT_BACK
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 6, MATERIAL_PLASTIC = 1)
	switched_on_qualities = list(QUALITY_HAMMERING = 45)
	switched_off_qualities = list(QUALITY_HAMMERING = 30)
	toggleable = TRUE
	armor_penetration = ARMOR_PEN_EXTREME
	max_health = 600 //Stronk
	degradation = 0.7
	use_power_cost = 2
	suitable_cell = /obj/item/weapon/cell/medium
	max_upgrades = 3

/obj/item/weapon/tool/hammer/powered_hammer/turn_on(mob/user)

	if (cell && cell.charge > 0)
		item_state = "[initial(item_state)]_on"
		to_chat(user, SPAN_NOTICE("You switch [src] on."))
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		..()
	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src] has no power!"))

/obj/item/weapon/tool/hammer/powered_hammer/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You switch [src] off."))
	..()

/obj/item/weapon/tool/hammer/powered_hammer/onestar_hammer
	name = "greyson sledgehammer"
	desc = "Used for applying immeasurable blunt force to anything in your way."
	icon_state = "onehammer"
	item_state = "onehammer"
	wielded_icon = "onehammer_on"
	switched_on_force = WEAPON_FORCE_LETHAL
	structure_damage_factor = STRUCTURE_DAMAGE_DESTRUCTIVE
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLATINUM = 3, MATERIAL_DIAMOND = 3)
	switched_on_qualities = list(QUALITY_HAMMERING = 60)
	switched_off_qualities = list(QUALITY_HAMMERING = 35)
	toggleable = TRUE
	max_health = 600 //Stronk
	degradation = 0.6
	use_power_cost = 1.5
	workspeed = 1.5
	max_upgrades = 2

/obj/item/weapon/tool/hammer/homewrecker
	name = "homewrecker"
	desc = "A large steel chunk welded to a long handle. Extremely heavy."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "homewrecker0"
	wielded_icon = "homewrecker1"
	max_health = 100 //weak
	armor_penetration = ARMOR_PEN_DEEP
	w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_NORMAL
	force_unwielded = WEAPON_FORCE_NORMAL
	force_wielded = WEAPON_FORCE_DANGEROUS
	tool_qualities = list(QUALITY_HAMMERING = 15)
	attack_verb = list("attacked", "smashed", "bludgeoned", "beaten")
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING


/obj/item/weapon/tool/hammer/mace
	name = "mace"
	desc = "Used for applying blunt force trauma to a person's ribcage."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "mace"
	item_state = "mace"
	matter = list(MATERIAL_STEEL = 10)

	armor_penetration = ARMOR_PEN_DEEP
	force = WEAPON_FORCE_DANGEROUS

	tool_qualities = list(QUALITY_HAMMERING = 20)

/obj/item/weapon/tool/hammer/mace/makeshift
	name = "makeshift mace"
	desc = "Some metal attached to the end of a stick, for applying blunt force trauma to a roach."
	icon_state = "ghetto_mace"
	item_state = "ghetto_mace"
	max_health = 100 //weak
	force = WEAPON_FORCE_PAINFUL

	tool_qualities = list(QUALITY_HAMMERING = 15)
	degradation = 5 //This one breaks REALLY fast
	max_upgrades = 5 //all makeshift tools get more mods to make them actually viable for mid-late game