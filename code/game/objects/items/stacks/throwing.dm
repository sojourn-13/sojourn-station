/obj/item/stack/thrown
	name = "throwing knife"
	gender = NEUTER  //Grammatically correct knives
	desc = "A knife that is specially designed and weighted so that the wielder\'s strength can be accounted when being thrown."
	icon = 'icons/obj/stack/items.dmi'
	icon_state = "knife"
	item_state = "knife"
	singular_name = "throwing knife"
	var/plural_name = "throwing knives"
	flags = CONDUCT
	sharp = TRUE
	edge = TRUE
	tool_qualities = list(QUALITY_WIRE_CUTTING = 5, QUALITY_CUTTING = 5)
	max_upgrades = 0
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	matter = list(MATERIAL_PLASTEEL = 1)
	amount = 1
	max_amount = 3
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_WEAK
	armor_divisor = ARMOR_PEN_SHALLOW
	slot_flags = SLOT_BELT

/obj/item/stack/thrown/update_icon()
	icon_state = "[initial(icon_state)][amount]"

/obj/item/stack/thrown/examine(mob/user)
	if(..(user, 1))
		to_chat(user, "There [src.amount == 1 ? "is" : "are"] [src.amount] [src.amount == 1 ? singular_name : plural_name] in the stack.")

/obj/item/stack/thrown/proc/fireAt(atom/target, mob/living/carbon/C)
	if(amount == 1)
		C.drop_from_inventory(src)
		launchAt(target, C)
	else
		amount--
		update_icon()

		var/obj/item/stack/thrown/J = new src.type(get_turf(src))
		J.throwforce = throwforce
		J.amount = 1
		J.update_icon()
		update_wear_icon()
		J.launchAt(target, C)
	visible_message(SPAN_DANGER("[C] has thrown \the [src]."))
	update_icon()

/obj/item/stack/thrown/proc/launchAt(atom/target, mob/living/carbon/C)
	throw_at(target, throw_range, throw_speed, C)

/obj/item/stack/thrown/throwing_knife
	name = "throwing knife"
	gender = NEUTER  //Grammatically correct knives
	desc = "A knife that is specially designed and weighted so that the wielder\'s strength can be accounted when being thrown."
	icon = 'icons/obj/stack/items.dmi'
	icon_state = "knife"
	item_state = "knife"
	singular_name = "throwing knife"
	flags = CONDUCT
	sharp = TRUE
	edge = TRUE
	embed_mult = 80 //MADE for embedding
	tool_qualities = list(QUALITY_WIRE_CUTTING = 5, QUALITY_CUTTING = 5)
	max_upgrades = 0
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	matter = list(MATERIAL_PLASTEEL = 1)
	amount = 1
	max_amount = 3
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_NORMAL
	armor_divisor = ARMOR_PEN_SHALLOW
	slot_flags = SLOT_BELT

/obj/item/stack/thrown/throwing_knife/launchAt(atom/target, mob/living/carbon/C)
	var/ROB_throwing_damage = max(C.stats.getStat(STAT_ROB), 1)
	throwforce = 35 / (1 + 100 / ROB_throwing_damage) + initial(throwforce) //soft cap; This would result in knives doing 10 damage at 0 rob, 20 at 50 ROB, 25 at 100 etc.
	..()

/////HUNTERS/////

/obj/item/stack/thrown/throwing_knife/bone_needle
	name = "throwing bone needle"
	desc = "Sharp and light chiseled bone needles designed for throwing. They have a high penetrating power, but only in cases where there is no armor between the flesh and their tip.\
	 They easily get stuck in wounds!"
	icon = 'icons/obj/stack/items.dmi'
	icon_state = "needle"
	singular_name = "bone needle"
	plural_name = "bone needles"
	price_tag = 0
	sharp = TRUE
	edge = TRUE
	embed_mult = 90
	tool_qualities = list()
	attack_verb = list("tears", "stabs", "pierces", "torn", "penetrates")
	hitsound = 'sound/weapons/pierce.ogg'
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	matter = list(MATERIAL_BONE = 2)
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_NORMAL
	throwforce = WEAPON_FORCE_BRUTAL
	armor_divisor = 0.5
	slot_flags = SLOT_BELT

/obj/item/stack/thrown/throwing_knife/bone_needle/launchAt(atom/target, mob/living/carbon/C)
	var/ROB_throwing_damage = max(C.stats.getStat(STAT_ROB), 1)
	throwforce = WEAPON_FORCE_BRUTAL / (1 + 100 / ROB_throwing_damage) + initial(throwforce)
	..()

/obj/item/stack/thrown/throwing_knife/bone_needle/update_icon()
	item_state = "needle[amount]"
	icon_state = "[initial(icon_state)][amount]"

/obj/item/stack/thrown/throwing_knife/bone_needle/poison
	name = "poisoned throwing bone needle"
	desc = "A bone needle that is slightly reinforced with a layer of dried amatoxin will not provide significant advantages, but it is worth taking a good breath at its end and the poison will enter the active stage.\
	 It is usually used as a shell for a blowpipe."
	icon = 'icons/obj/stack/items.dmi'
	icon_state = "needlep"
	singular_name = "poisoned bone needle"
	plural_name = "poisoned bone needles"
	price_tag = 0
	max_upgrades = 0
	attack_verb = list("flies in", "stabbed", "pierces", "torn", "penetrates")
	hitsound = 'sound/weapons/pierce.ogg'
	sharp = TRUE
	edge = TRUE
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_NORMAL
	reagent_flags = INJECTABLE
	embed_mult = 90
	amount = 1
	max_amount = 3
	damtype = BRUTE
	preloaded_reagents = list("amatoxin" = 3)
	throwforce = 36
	armor_divisor = 1
	slot_flags = SLOT_BELT
	var/toxin_damage = 10

/obj/item/stack/thrown/throwing_knife/bone_needle/poison/full
	amount = 3

/obj/item/stack/thrown/throwing_knife/bone_needle/poison/full/New()
	..()
	update_icon()

/obj/item/stack/thrown/throwing_knife/bone_needle/poison/launchAt(atom/target, mob/living/carbon/C)
	var/ROB_throwing_damage = max(C.stats.getStat(STAT_ROB), 1)
	throwforce = 36 / (1 + 100 / ROB_throwing_damage) + initial(throwforce)
	..()

/obj/item/stack/thrown/throwing_knife/bone_needle/poison/post_thrown_hit(mob)
	if(isliving(mob))
		var/mob/living/L
		if(ishuman(L))
			var/mob/living/carbon/human/H
			H.damage_through_armor(toxin_damage, BURN, null, ARMOR_BIO, armor_divisor, used_weapon = src, sharp = is_sharp(src), edge = has_edge(src))
		else
			//To non-human mobs we deal 30 toxin damage
			L.damage_through_armor((toxin_damage*3), TOX, null, ARMOR_BIO, armor_divisor, used_weapon = src, sharp = is_sharp(src), edge = has_edge(src))


/obj/item/stack/thrown/throwing_knife/bone_needle/poison/update_icon()
	item_state = "needle[amount]"
	icon_state = "[initial(icon_state)][amount]"

/obj/item/stack/thrown/throwing_knife/hunter
	name = "throwing hunting knife"
	gender = NEUTER
	desc = "A massive and heavy hunting knife designed for throwing and rough cutting. He will definitely not fly far because of his weight, but he will never get stuck in meat!"
	icon = 'icons/obj/stack/items.dmi'
	icon_state = "hunt_knife"
	singular_name = "throwing hunting knife"
	price_tag = 120
	flags = CONDUCT
	sharp = TRUE
	edge = FALSE
	embed_mult = 10 //very big and heavy, bad embed.
	tool_qualities = list(QUALITY_WIRE_CUTTING = 15, QUALITY_CUTTING = 30, QUALITY_SAWING = 15)
	max_upgrades = 0
	effective_faction = list("tengo", "tengolo_berserker", "xenomorph")
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = list('sound/weapons/bladeslice.ogg', 'sound/weapons/rapierhit.ogg')
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 10, MATERIAL_BONE = 2, MATERIAL_CLOTH = 1)
	amount = 1
	max_amount = 3
	w_class = ITEM_SIZE_SMALL
	force = 20
	throwforce = 50
	armor_divisor = 2
	var/wounding = 1.25

/obj/item/stack/thrown/throwing_knife/hunter/launchAt(atom/target, mob/living/carbon/C)
	var/ROB_throwing_damage = max(C.stats.getStat(STAT_ROB), 1)
	throwforce = (35 / (1 + 100 / ROB_throwing_damage) + initial(throwforce)) * wounding
	..()

/obj/item/stack/thrown/throwing_knife/hunter/update_icon()
	icon_state = "[initial(icon_state)][amount]"
	item_state = "hunt_knife[amount]"

