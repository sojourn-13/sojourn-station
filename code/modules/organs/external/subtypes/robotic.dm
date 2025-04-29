/obj/item/organ/external/robotic
	name = "robotic"
	force_icon = 'icons/mob/human_races/cyberlimbs/generic.dmi'
	desc = "A skeletal limb wrapped in pseudomuscles, with a low-conductivity case."
	nerve_struck = -1 // no nerves here
	cannot_break = 1
	nature = MODIFICATION_SILICON
	armor_list = list(melee = 5, bullet = 5, energy = 5, bomb = 20, bio = 100, rad = 100)
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2) // Multiplied by w_class
	var/min_malfunction_damage = 20 // Any more damage than that and you start getting nasty random malfunctions

/*	EQUINOX EDIT - No idea why this needs a snowflake override, parent proc already handles robotic limbs no problem, and there's no point copy pasting code for bodymarking caching here.
/obj/item/organ/external/robotic/get_cache_key()
	return "Robotic[model]"
*/

/obj/item/organ/external/robotic/update_icon()
	var/gender = "m"
	if(owner)
		gender = owner.gender == FEMALE ? "f" : "m"
	icon_state = "[organ_tag]_[gender]"

	mob_icon = icon(force_icon, icon_state)

// EQUINOX EDIT START - furry - apply bodymarkings, copypasta from regular organic limbs.
	for(var/M in markings)
		var/datum/sprite_accessory/marking/mark_style = markings[M]["datum"]
		var/icon/mark_s
		var/icon/mark_splice	//temporary var to facilitate splicing together feet sprites into leg sprites where relevant

		mark_s = new/icon("icon" = mark_style.icon, "icon_state" = "[mark_style.icon_state]-[organ_tag]")

	// Horrible hackjob to botch together hands and feet into their parent limbs where relevant
		if(organ_tag == BP_L_LEG && (BP_L_FOOT in mark_style.body_parts))
			mark_splice = new/icon(mark_style.icon, "[mark_style.icon_state]-l_foot")
		else if(organ_tag == BP_R_LEG && (BP_R_FOOT in mark_style.body_parts))
			mark_splice = new/icon(mark_style.icon, "[mark_style.icon_state]-r_foot")
		else if(organ_tag == BP_L_ARM && (BP_L_HAND in mark_style.body_parts))
			mark_splice = new/icon(mark_style.icon, "[mark_style.icon_state]-l_hand")
		else if(organ_tag == BP_R_ARM && (BP_R_HAND in mark_style.body_parts))
			mark_splice = new/icon(mark_style.icon, "[mark_style.icon_state]-r_hand")

		if(mark_splice && mark_s)
			mark_s.Blend(mark_splice, ICON_OVERLAY)

		mark_s.Blend(markings[M]["color"], mark_style.blend)
		add_overlay(mark_s) //So when it's not on your body, it has icons
		mob_icon.Blend(mark_s, ICON_OVERLAY) //So when it's on your body, it has icons
// EQUINOX EDIT END

	icon = mob_icon
	return mob_icon

/obj/item/organ/external/robotic/is_malfunctioning()
	return prob(brute_dam + burn_dam - min_malfunction_damage)

/obj/item/organ/external/robotic/set_description(datum/organ_description/desc)
	..()
	src.name = "[initial(name)] [desc.name]"
	for(var/mat_name in matter)
		matter[mat_name] *= w_class

/obj/item/organ/external/robotic/Destroy()
	deactivate(emergency=TRUE)
	. = ..()

/obj/item/organ/external/robotic/removed()
	deactivate(emergency=TRUE)
	..()

/obj/item/organ/external/robotic/setBleeding()
	return FALSE

/obj/item/organ/external/robotic/proc/can_activate()
	return 1

/obj/item/organ/external/robotic/proc/activate()
	return 1

/obj/item/organ/external/robotic/proc/deactivate(emergency = TRUE)
	return 1

/obj/item/organ/external/robotic/limb
	max_damage = 50
	min_broken_damage = 30
	w_class = ITEM_SIZE_NORMAL

/obj/item/organ/external/robotic/tiny
	min_broken_damage = 15
	w_class = ITEM_SIZE_SMALL


/obj/item/organ/external/robotic/l_arm
	default_description = /datum/organ_description/arm/left

/obj/item/organ/external/robotic/r_arm
	default_description = /datum/organ_description/arm/right

/obj/item/organ/external/robotic/l_leg
	default_description = /datum/organ_description/leg/left

/obj/item/organ/external/robotic/r_leg
	default_description = /datum/organ_description/leg/right

/obj/item/organ/external/robotic/groin
	default_description = /datum/organ_description/groin
	max_damage = 200
