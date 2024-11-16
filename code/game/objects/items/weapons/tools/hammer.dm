/obj/item/tool/hammer
	name = "hammer"
	desc = "Used for applying blunt force to a surface."
	icon_state = "hammer"
	item_state = "hammer"
	flags = CONDUCT
	force = WEAPON_FORCE_PAINFUL
	worksound = WORKSOUND_HAMMER
	w_class = ITEM_SIZE_SMALL
	push_attack = TRUE
	origin_tech = list(TECH_ENGINEERING = 1)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_WOOD = 2)
	price_tag = 30
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked","flattened","pulped")
	tool_qualities = list(QUALITY_HAMMERING = 35, QUALITY_PRYING = 10)
	effective_faction = list("spider") // Spiders are weak to crushing.
	damage_mult = 2
	hitsound = 'sound/weapons/smash.ogg'
	blacklist_upgrades = list(/obj/item/tool_upgrade/productivity/whetstone = TRUE, /obj/item/tool_upgrade/productivity/diamond_blade = TRUE) //it's hammers.

	has_alt_mode = TRUE
	alt_mode_damagetype = HALLOSS
	alt_mode_sharp = FALSE
	alt_mode_verbs = list("bashes", "stunts", "wacks", "blunts")
	alt_mode_toggle = "loosens their grip on the handle of their weapon"
	alt_mode_lossrate = 0.4


/obj/item/tool/hammer/deadblow
	name = "deadblow hammer"
	desc = "Used for applying blunt force to a surface. This one has sand inside its plasteel head to help do strikes much more constantly in the same place with the same force well reducing trama onto soft surfaces."
	icon_state = "deadblow"
	item_state = "hammer"
	tool_qualities = list(QUALITY_HAMMERING = 45)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_WOOD = 2, MATERIAL_GLASS = 1, MATERIAL_PLASTEEL = 2)
	attack_verb = list("attacked", "blunted", "brused", "smacked", "whacked", "striked", "bonked")
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_ENGINEERING = 3)

/obj/item/tool/hammer/powered_hammer
	name = "powered sledgehammer"
	desc = "Used for applying excessive blunt force to a surface."
	icon_state = "powered_hammer"
	item_state = "powered_hammer"
	wielded_icon = "powered_hammer_on"
	switched_on_forcemult = 2.2 //33 total
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BELT|SLOT_BACK
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTEEL = 6, MATERIAL_PLASTIC = 1)
	price_tag = 340
	switched_on_qualities = list(QUALITY_HAMMERING = 45)
	switched_off_qualities = list(QUALITY_HAMMERING = 30)
	toggleable = TRUE
	armor_divisor = ARMOR_PEN_EXTREME // Retains AP when turned off - it's a hammer.
	degradation = 0.7
	use_power_cost = 2
	suitable_cell = /obj/item/cell/medium
	max_upgrades = 4
	item_icons = list(
		slot_back_str = 'icons/obj/tools.dmi')
	item_state_slots = list(
		slot_back_str = "onehammer_back"
		)

/obj/item/tool/hammer/powered_hammer/turn_on(mob/user)

	if (cell && cell.charge >= 1)
		item_state = "[initial(item_state)]_on"
		to_chat(user, SPAN_NOTICE("You switch [src] on."))
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		..()
	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src]'s battery is dead or missing."))

/obj/item/tool/hammer/powered_hammer/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You switch [src] off."))
	..()

/obj/item/tool/hammer/powered_hammer/onestar_hammer
	name = "Greyson sledgehammer"
	desc = "Used for applying immeasurable blunt force to anything in your way."
	icon_state = "onehammer"
	item_state = "onehammer"
	wielded_icon = "onehammer_on"
	switched_on_forcemult = 2.6 // 39 total
	armor_divisor = ARMOR_PEN_EXTREME // Retains AP when turned off - it's a hammer.
	structure_damage_factor = STRUCTURE_DAMAGE_DESTRUCTIVE
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLATINUM = 3, MATERIAL_DIAMOND = 3)
	price_tag = 860
	switched_on_qualities = list(QUALITY_HAMMERING = 60)
	switched_off_qualities = list(QUALITY_HAMMERING = 35)
	toggleable = TRUE
	degradation = 2
	use_power_cost = 1.5
	workspeed = 1.5
	max_upgrades = 2
	allow_greyson_mods = TRUE

/obj/item/tool/hammer/foremansledge
	name = "foreman's sledgehammer"
	desc = "Once a tool used to nail rivets, now a tool used to crush skulls. The signature weapon of the prospector's foreman."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "sledgehammer"
	item_state = "sledgehammer0"
	wielded_icon = "sledgehammer1"
	force = WEAPON_FORCE_LETHAL
	slot_flags = SLOT_BELT|SLOT_BACK
	armor_divisor = ARMOR_PEN_EXTREME
	throwforce = WEAPON_FORCE_LETHAL
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_PLASTIC = 5)
	throw_speed = 1
	throw_range = 7
	w_class = ITEM_SIZE_BULKY
	origin_tech = list(TECH_COMBAT = 3)
	attack_verb = list("attacked", "bashed", "battered", "bludgeoned", "whacked","flattened","pulped")
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	tool_qualities = list(QUALITY_HAMMERING = 45)
	price_tag = 2000

/obj/item/tool/hammer/homewrecker
	name = "homewrecker"
	desc = "A large steel chunk welded to a long handle. Extremely heavy."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "homewrecker"
	item_state = "homewrecker0"
	wielded_icon = "homewrecker1"
	armor_divisor = ARMOR_PEN_EXTREME
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_ROBUST
	tool_qualities = list(QUALITY_HAMMERING = 15)
	attack_verb = list("attacked", "smashed", "bludgeoned", "beaten")
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	max_upgrades = 5
	price_tag = 15
	item_icons = list(
		slot_back_str = 'icons/inventory/back/mob.dmi')
	item_state_slots = list(
		slot_back_str = "homewrecker0"
		)


/obj/item/tool/hammer/ironhammer
	name = "Seinemetall Defense \"Ironhammer\" Breaching Hammer"
	desc = "A modified sledgehammer produced by Seinemetall Defense GmbH for police forces across Sol space."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "iron_hammer"
	item_state = "iron_hammer"
	wielded_icon = "iron_hammer_wielded"
	w_class = ITEM_SIZE_HUGE
	armor_divisor = ARMOR_PEN_DEEP
	slot_flags = SLOT_BELT|SLOT_BACK
	force = WEAPON_FORCE_LETHAL
	structure_damage_factor = STRUCTURE_DAMAGE_BORING
	tool_qualities = list(QUALITY_HAMMERING = 40, QUALITY_PRYING = 1)
	matter = list(MATERIAL_STEEL = 30, MATERIAL_PLASTIC = 10, MATERIAL_PLASTEEL = 15)
	clickdelay_offset = DEFAULT_LONG_COOLDOWN

//Exl verson of the above hammer, slightly faster but deals less damaeg mostly used for breaking walls/windows/ect
/obj/item/tool/hammer/excelsior_hammer
	name = "Excelsior \"Chain-Braker\" siege hammer"
	desc = "A massive hammer to break the chains of oppression with."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "excelsior_hammer"
	item_state = "excelsior_hammer"
	wielded_icon = "excelsior_hammer_wielded"
	w_class = ITEM_SIZE_HUGE
	armor_divisor = ARMOR_PEN_DEEP
	slot_flags = SLOT_BELT
	force = WEAPON_FORCE_BRUTAL
	structure_damage_factor = STRUCTURE_DAMAGE_BORING + 2
	tool_qualities = list(QUALITY_HAMMERING = 60, QUALITY_PRYING = 10)
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 10, MATERIAL_PLASTEEL = 10)
	clickdelay_offset = DEFAULT_ATTACK_COOLDOWN

/obj/item/tool/hammer/mace
	name = "mace"
	desc = "Used for applying blunt force trauma to a person's rib cage."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "mace"
	item_state = "mace"
	matter = list(MATERIAL_STEEL = 10)
	price_tag = 30

	armor_divisor = ARMOR_PEN_DEEP
	force = WEAPON_FORCE_DANGEROUS

	tool_qualities = list(QUALITY_HAMMERING = 20)

/obj/item/tool/hammer/mace/makeshift
	name = "makeshift mace"
	desc = "Some metal attached to the end of a stick, for applying blunt force trauma to a roach."
	icon_state = "ghetto_mace"
	item_state = "ghetto_mace"

	force = WEAPON_FORCE_PAINFUL

	tool_qualities = list(QUALITY_HAMMERING = 15)
	price_tag = 20
	degradation = 5 //This one breaks REALLY fast
	max_upgrades = 5 //all makeshift tools get more mods to make them actually viable for mid-late game

/obj/item/tool/hammer/makeshift_staff
	name = "makeshift staff"
	desc = "Three rods, some duct tape and a lot of bloodlust give you this."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "makeshift_staff"
	item_state = "makeshift_staff"
	wielded_icon = "makeshift_staff_wielded"
	tool_qualities = list(QUALITY_HAMMERING = 5)
	matter = list(MATERIAL_STEEL = 3)
	max_upgrades = 3
	armor_divisor = ARMOR_PEN_GRAZING
	force = WEAPON_FORCE_PAINFUL
	w_class = ITEM_SIZE_HUGE

/obj/item/tool/hammer/dumbbell
	name = "dumbbell"
	desc = "To get stronger with this thing, you need to regularly train for many a month. But to hammer a nail, or crack a skull..."
	icon_state = "dumbbell"
	item_state = "dumbbell"
	tool_qualities = list(QUALITY_HAMMERING = 15)
	matter = list(MATERIAL_STEEL = 5)

/obj/item/tool/hammer/charge
	name = "rocket hammer"
	desc = "After many issues with scientists trying to hammer a nail, one bright individual wondered what could be achieved by attaching a stellar-grade ship engine to the back."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "chargehammer"
	wielded_icon = "chargehammer1"
	item_state = "chargehammer0"
	w_class = ITEM_SIZE_HUGE
	switched_on_forcemult = 2.2
	armor_divisor = ARMOR_PEN_EXTREME // Retains AP when turned off - it's a hammer.
	structure_damage_factor = STRUCTURE_DAMAGE_BREACHING
	switched_on_qualities = list(QUALITY_HAMMERING = 60)
	switched_off_qualities = list(QUALITY_HAMMERING = 35)
	toggleable = TRUE
	slot_flags = SLOT_BELT|SLOT_BACK
	suitable_cell = /obj/item/cell/medium
	use_power_cost = 15
	price_tag = 420 // Has a rocket engine on it.
	var/datum/effect/effect/system/trail/T
	var/last_launch

/obj/item/tool/hammer/charge/turn_on(mob/user)

	if (cell && cell.charge >= 1)
		item_state = "[initial(item_state)]-on"
		icon_state = "[initial(icon_state)]_on"
		if(wielded)
			item_state = "chargehammer1-on"
		to_chat(user, SPAN_NOTICE("You switch [src] on."))
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		..()
	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src]'s battery is dead or missing."))

/obj/item/tool/hammer/charge/turn_off(mob/user)
	item_state = initial(item_state)
	icon_state = initial(icon_state)
	if(wielded)
		item_state = "chargehammer1"
	playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You switch [src] off."))
	..()

/obj/item/tool/hammer/charge/New()
	..()
	T = new /datum/effect/effect/system/trail/fire()
	T.set_up(src)

/obj/item/tool/hammer/charge/Destroy()
	QDEL_NULL(T)
	return ..()

/obj/item/tool/hammer/charge/afterattack(atom/target, mob/user, proximity_flag, params)
	if(!switched_on || world.time < last_launch + 3 SECONDS)
		return
	var/cost = use_power_cost*get_dist(target, user)
	if(user.check_gravity())
		cost *= (user.mob_size/10)

	if(cell?.checked_use(cost))
		if(!wielded)
			var/drop_prob = 50
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				drop_prob *= H.stats.getMult(STAT_ROB, STAT_LEVEL_EXPERT)
			if(prob(drop_prob))
				to_chat(user, SPAN_WARNING("\The [src] launches from your grasp!"))
				user.drop_item(src)
				T.start()
				playsound(src, 'sound/machines/hiss.ogg', 50, 0, 0)
				throw_at(target, get_dist(target, user), 1, user)
				T.stop()
				last_launch = world.time
				return
		last_launch = world.time
		T.start()
		playsound(src, 'sound/machines/hiss.ogg', 50, 0, 0)
		user.throw_at(target, get_dist(target, user), 1, user)
		T.stop()
