// Wound repair surgeries.
datum/old_surgery_step/external
	priority = 2 // Must be higher than /datum/old_surgery_step/internal
	can_infect = 1

	duration = 70

/datum/old_surgery_step/external/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)

	if (!hasorgans(target))
		return 0

	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return affected && affected.open == 2

//////////////////////////////////////////////////////////////////
//					WOUND REPAIR SURGERY						//
//////////////////////////////////////////////////////////////////

/*datum/old_surgery_step/external/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if (!hasorgans(target))
		return 0
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if (affected)
		return 0
	var/list/organ_data = target.species.has_limbs["[target_zone]"]
	return !isnull(organ_data)*/

// Brute Heal Surgery

/datum/old_surgery_step/external/brute_heal
	allowed_tools = list(/obj/item/stack/medical/advanced/bruise_pack = 100)

/datum/old_surgery_step/external/brute_heal/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/tool_name = "\the [tool]"
	if (istype(tool, /obj/item/stack/medical/advanced/bruise_pack))
		tool_name = "regenerative membrane"

	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	for(var/obj/item/organ/E in affected.internal_organs)
		if (target.getBruteLoss() > 0)
			user.visible_message(SPAN_NOTICE("[user] begins treating the brute damage to [target]'s body with the [tool_name]."), \
			SPAN_NOTICE("You begin treating the brute damage to [target]'s body with the [tool_name].") )

	target.custom_pain("The pain in your [affected.name] is living hell!",1)
	..()

/datum/old_surgery_step/external/brute_heal/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/tool_name = "\the [tool]"
	if (istype(tool, /obj/item/stack/medical/advanced/bruise_pack))
		tool_name = "regenerative membrane"

	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	for(var/obj/item/organ/E in affected.internal_organs)
		if (target.getBruteLoss() > 0)
			user.visible_message(SPAN_NOTICE("[user] treats the brute damage to [target]'s body with the [tool_name]."), \
			SPAN_NOTICE("You treat the brute damage to [target]'s body with [tool_name].") )
			target.adjustBruteLoss(-15)

/datum/old_surgery_step/external/brute_heal/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)

	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	user.visible_message(SPAN_WARNING("[user]'s hand slips, smushing the inside of [target]'s [affected.name] with \the [tool]!"), \
	SPAN_WARNING("Your hand slips, smushing the inside of [target]'s [affected.name] with \the [tool]!"))
	var/dam_amt = 2

	if (istype(tool, /obj/item/stack/medical/advanced/bruise_pack))
		target.adjustToxLoss(5)

	else if (istype(tool, /obj/item/stack/medical/bruise_pack))
		dam_amt = 5
		target.adjustToxLoss(10)
		affected.createwound(CUT, 5)

	for(var/obj/item/organ/I in affected.internal_organs)
		if(I && I.damage > 0)
			I.take_damage(dam_amt,0)

// Burn Heal Surgery

/datum/old_surgery_step/external/burn_heal
	allowed_tools = list(/obj/item/stack/medical/advanced/ointment = 100)

/datum/old_surgery_step/external/burn_heal/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/tool_name = "\the [tool]"
	if (istype(tool, /obj/item/stack/medical/advanced/ointment))
		tool_name = "regenerative graft"

	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	for(var/obj/item/organ/E in affected.internal_organs)
		if (target.getFireLoss() > 0)
			user.visible_message(SPAN_NOTICE("[user] begins treating the burn damage to [target]'s body with the [tool_name]."), \
			SPAN_NOTICE("You begin treating the burn damage to [target]'s body with the [tool_name].") )

	target.custom_pain("The pain in your [affected.name] is living hell!",1)
	..()

/datum/old_surgery_step/external/burn_heal/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/tool_name = "\the [tool]"
	if (istype(tool, /obj/item/stack/medical/advanced/ointment))
		tool_name = "regenerative graft"

	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	for(var/obj/item/organ/E in affected.internal_organs)
		if (target.getFireLoss() > 0)
			user.visible_message(SPAN_NOTICE("[user] treats the burn damage to [target]'s body with the [tool_name]."), \
			SPAN_NOTICE("You treat the burn damage to [target]'s body with [tool_name].") )
			target.adjustFireLoss(-15)


/datum/old_surgery_step/external/burn_heal/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)

	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	user.visible_message(SPAN_WARNING("[user]'s hand slips, tearing the inside of [target]'s [affected.name] with \the [tool]!"), \
	SPAN_WARNING("Your hand slips, tearing the inside of [target]'s [affected.name] with \the [tool]!"))
	var/dam_amt = 2

	for(var/obj/item/organ/I in affected.internal_organs)
		if(I && I.damage > 0)
			I.take_damage(dam_amt,0)

// Toxin Heal Surgery

/datum/old_surgery_step/external/tox_heal
	allowed_tools = list(/obj/item/stack/nanopaste = 100)

/datum/old_surgery_step/external/tox_heal/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/tool_name = "\the [tool]"
	if (istype(tool, /obj/item/stack/nanopaste))
		tool_name = "nanite swarm"

	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	for(var/obj/item/organ/E in affected.internal_organs)
		if (target.getToxLoss() >= 0)
			user.visible_message(SPAN_NOTICE("[user] begins filtering out any toxins in [target]'s body and repairing any neural degradation with the [tool_name]."), \
			SPAN_NOTICE("You begin to filter out any toxins to [target]'s body and repair any neural degradation with the [tool_name].") )

	target.custom_pain("The pain in your [affected.name] is living hell!",1)
	..()

/datum/old_surgery_step/external/tox_heal/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/tool_name = "\the [tool]"
	if (istype(tool, /obj/item/stack/nanopaste))
		tool_name = "nanite swarm"

	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	for(var/obj/item/organ/E in affected.internal_organs)
		if (target.getToxLoss() >= 0)
			user.visible_message(SPAN_NOTICE("[user] finishess filtering out any toxins in [target]'s body and repairing any neural degradation with the [tool_name]."), \
			SPAN_NOTICE("You finish filtering out any toxins to [target]'s body and repairing any neural degradation with the [tool_name].") )
			target.adjustToxLoss(-200)
			target.timeofdeath = 99999999


/datum/old_surgery_step/external/tox_heal/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)

	if (!hasorgans(target))
		return
	var/obj/item/organ/external/affected = target.get_organ(target_zone)

	user.visible_message(SPAN_WARNING("[user]'s hand slips, filtering healthy cells from the inside of [target]'s [affected.name] with \the [tool]!"), \
	SPAN_WARNING("Your hand slips, filtering healthy cells from the inside of [target]'s [affected.name] with \the [tool]!"))
	var/dam_amt = 2

	for(var/obj/item/organ/I in affected.internal_organs)
		if(I && I.damage > 0)
			I.take_damage(dam_amt,0)
