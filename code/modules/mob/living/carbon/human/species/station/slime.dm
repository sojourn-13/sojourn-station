
/datum/species/slime
	name = "Slime"
	name_plural = "slimes"

	default_form = FORM_SLIME
	obligate_form = TRUE
	reagent_tag = IS_SLIME
	unarmed_types = list(/datum/unarmed_attack/slime_glomp)
	flags = NO_SLIP | NO_BREATHE | NO_BLOOD | NO_SCAN | NO_MINOR_CUT
	siemens_coefficient = 3 //conductive
	darksight = 3
	virus_immune = TRUE
	breath_type = null
	poison_type = null
	hunger_factor = DEFAULT_HUNGER_FACTOR * 2
	spawn_flags = IS_RESTRICTED

	burn_mod = 1
	brute_mod = 1
	toxins_mod = -1 // Flips the affects of toxins, so dealing toxins heals well reducing toxins damages - R4D6|Trilby
	oxy_mod = 0

	has_process = list(
		BP_BRAIN = /obj/item/organ/internal/brain/slime
		)

	breath_type = null
	poison_type = null

	bump_flag = SLIME
	swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	push_flags = MONKEY|SLIME|SIMPLE_ANIMAL

	has_process = list(
		OP_HEART   = /obj/item/organ/internal/heart/slime,
		BP_BRAIN   = /obj/item/organ/internal/brain/slime,
		OP_EYES    = /obj/item/organ/internal/eyes/slime,
		OP_STOMACH = /obj/item/organ/internal/stomach/slime
		)

	has_limbs = list(
		BP_CHEST =  new /datum/organ_description/chest/slime,
		BP_GROIN =  new /datum/organ_description/groin/slime,
		BP_HEAD =   new /datum/organ_description/head/slime,
		BP_L_ARM =  new /datum/organ_description/arm/left/slime,
		BP_R_ARM =  new /datum/organ_description/arm/right/slime,
		BP_L_LEG =  new /datum/organ_description/leg/left/slime,
		BP_R_LEG =  new /datum/organ_description/leg/right/slime
	)

//	spawn_flags = CAN_JOIN

	perks = list(PERK_SPEED, PERK_LIMB_REGEN, PERK_MIND_BOOST, PERK_BODY_BOOST)

/datum/species/slime/handle_death(var/mob/living/carbon/human/H)
	spawn(1)
		if(H)
			H.gib()


/mob/living/carbon/human/proc/regenerate_organs()
	set name = "Regenerate missing limb"
	set desc = "Regenerate a missing limb at the cost of nutrition"
	set category = "Abilities"
	var/mob/living/carbon/human/user = usr
	var/missing_limb_tag
	if(!user || !species)
		return
	if(user.stat)
		return
	for(var/limb_tag in BP_ALL_LIMBS)
		var/obj/item/organ/external/organ_to_check = organs_by_name[limb_tag]
		if(!organ_to_check || istype(organ_to_check , /obj/item/organ/external/stump))
			missing_limb_tag = limb_tag
			break
	if(!missing_limb_tag)
		to_chat(user, "You don't have any limbs to replace!")
		return
	if(user.species.has_limbs.Find(missing_limb_tag))
		var/stump_to_delete = organs_by_name[missing_limb_tag]
		if(stump_to_delete)
			qdel(stump_to_delete)
		user.adjustNutrition(-50)
		var/datum/organ_description/OD = species.has_limbs[missing_limb_tag]
		OD.create_organ(src)
		to_chat(user, "You regenerate your [OD.name].") // OCCULUS EDIT - No more l_hand regenerating!
		update_body() //OCCULUS EDIT - No more invisible regenerated limbs!