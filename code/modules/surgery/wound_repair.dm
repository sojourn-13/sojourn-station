// Wound repair surgeries.
datum/old_surgery_step/external
	priority = 2 // Must be higher than /datum/old_surgery_step/internal
	can_infect = 1

	duration = 70

/datum/old_surgery_step/external/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)

	if (!hasorgans(target))
		return 0

	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	return affected && affected.open >= 2

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

// Internal Bleeding

/datum/old_surgery_step/fix_vein
	priority = 2
	required_tool_quality = QUALITY_CLAMPING
	can_infect = 1
	blood_level = 1

	duration = 70

/datum/old_surgery_step/fix_vein/can_use(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	if(!hasorgans(target))
		return 0

	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	if(!affected) return
	var/internal_bleeding = 0
	for(var/datum/wound/W in affected.wounds) if(W.internal)
		internal_bleeding = 1
		break

	return affected.open >= 2 && internal_bleeding

/datum/old_surgery_step/fix_vein/begin_step(mob/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(
		"[user] starts patching the damaged vein in [target]'s [affected.name] with \the [tool].",
		"You start patching the damaged vein in [target]'s [affected.name] with \the [tool]."
	)
	target.custom_pain("The pain in [affected.name] is unbearable!",1)
	..()

/datum/old_surgery_step/fix_vein/end_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(
		"\blue [user] has patched the damaged vein in [target]'s [affected.name] with \the [tool].",
		"\blue You have patched the damaged vein in [target]'s [affected.name] with \the [tool]."
	)

	for(var/datum/wound/W in affected.wounds) if(W.internal)
		affected.wounds -= W
		affected.update_damages()
	if (ishuman(user) && prob(40)) user:bloody_hands(target, 0)

/datum/old_surgery_step/fix_vein/fail_step(mob/living/user, mob/living/carbon/human/target, target_zone, obj/item/tool)
	var/obj/item/organ/external/affected = target.get_organ(target_zone)
	user.visible_message(
		"\red [user]'s hand slips, smearing [tool] in the incision in [target]'s [affected.name]!",
		"\red Your hand slips, smearing [tool] in the incision in [target]'s [affected.name]!"
	)
	affected.take_damage(5, 0)
