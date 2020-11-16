// Here we finally see a solution for assisted organ damage fixing.

/datum/surgery_step/assisted
	difficulty = FAILCHANCE_NORMAL
	inflict_agony = 60

/datum/surgery_step/assisted/fix_organ
	target_organ_type = /obj/item/organ/internal
	required_tool_quality = QUALITY_SCREW_DRIVING
	allowed_tools = list(
		/obj/item/stack/medical/advanced/bruise_pack = 100,
		/obj/item/stack/medical/bruise_pack = 20,
		/obj/item/stack/nanopaste = 100,
	)

	duration = 80

/datum/surgery_step/assisted/fix_organ/require_tool_message(mob/living/user)
	to_chat(user, SPAN_WARNING("You need a tool capable of [required_tool_quality], any kind of bruise pack, or some Nanopaste to complete this step."))
	
/datum/surgery_step/assisted/fix_organ/proc/get_tool_name(obj/item/stack/tool)
	var/tool_name = "\the [tool]"
	if (istype(tool, /obj/item/stack/medical/advanced/bruise_pack))
		tool_name = "regenerative membrane"
	if (istype(tool, /obj/item/stack/medical/bruise_pack))
		tool_name = "the bandaid"
	if (istype(tool, /obj/item/stack/nanopaste))
		tool_name = "the nanopaste"
	return tool_name

/datum/surgery_step/assisted/fix_organ/can_use(mob/living/user, obj/item/organ/internal/organ, obj/item/tool)
	return ..() && organ.is_open() && organ.damage > 0

/datum/surgery_step/assisted/fix_organ/begin_step(mob/living/user, obj/item/organ/internal/organ, obj/item/tool)
	user.visible_message(
		SPAN_NOTICE("[user] starts mending the damage to [organ.get_surgery_name()]."),
		SPAN_NOTICE("You start mending the damage to [organ.get_surgery_name()].")
	)

/datum/surgery_step/assisted/fix_organ/end_step(mob/living/user, obj/item/organ/internal/organ, obj/item/tool)
	user.visible_message(
		SPAN_NOTICE("[user] fixes [organ.get_surgery_name()] with [tool]."),
		SPAN_NOTICE("You fix [organ.get_surgery_name()] with [tool].")
	)
	organ.damage = 0
	if(istype(tool, /obj/item/stack/nanopaste))
		var/obj/item/stack/S = tool
		S.use(1)

/datum/surgery_step/assisted/fix_organ/fail_step(mob/living/user, obj/item/organ/internal/organ, obj/item/tool)
	user.visible_message(
		SPAN_WARNING("[user]'s hand slips, damaging the integrity of [organ.get_surgery_name()] with [tool]!"),
		SPAN_WARNING("Your hand slips, damaging the integrity of [organ.get_surgery_name()] with [tool]!")
	)
	organ.take_damage(7, 0) //They're hanging by a thread! Be careful with assisted organs!