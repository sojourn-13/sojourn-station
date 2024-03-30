#define HUMAN_EATING_NO_ISSUE		0
#define HUMAN_EATING_NO_MOUTH		1
#define HUMAN_EATING_BLOCKED_MOUTH	2

#define add_clothing_protection(A)	\
	var/obj/item/clothing/C = A; \
	flash_protection += C.flash_protection; \
	psi_blocking += C.psi_blocking; \
	equipment_tint_total += C.tint;

/mob/living/carbon/human/can_eat(var/food, var/feedback = 1)
	var/list/status = can_eat_status()
	if(status[1] == HUMAN_EATING_NO_ISSUE)
		return 1
	if(feedback)
		if(status[1] == HUMAN_EATING_BLOCKED_MOUTH)
			to_chat(src, SPAN_WARNING("\The [status[2]] is in the way!"))
	return 0

/mob/living/carbon/human/can_see_reagents()
	if(istype(glasses, /obj/item/clothing/glasses/powered/science))
		var/obj/item/clothing/glasses/powered/our_glasses = glasses
		if(our_glasses.active)
			return TRUE
	if(stats.check_for_shared_perk(PERK_SHARED_SEE_REAGENTS))
		return TRUE
	if(stats.getStat(STAT_COG) >= HUMAN_REQ_COG_FOR_REG || stats.getStat(STAT_BIO) >= HUMAN_REQ_BIO_FOR_REG)
		return TRUE
	return FALSE

/mob/living/carbon/human/can_see_common_reagents()
	if(stats.check_for_shared_perk(PERK_SHARED_SEE_COMMON_REAGENTS))
		return TRUE
	return FALSE

/mob/living/carbon/human/can_see_illegal_reagents()
	if(istype(glasses, /obj/item/clothing/glasses/hud/security) || istype(glasses, /obj/item/clothing/glasses/sechud))
		return TRUE
	else if(stats.check_for_shared_perk(PERK_SHARED_SEE_ILLEGAL_REAGENTS))
		return TRUE
	return FALSE


/mob/living/carbon/human/can_force_feed(var/feeder, var/food, var/feedback = 1)
	var/list/status = can_eat_status()
	if(status[1] == HUMAN_EATING_NO_ISSUE)
		return 1
	if(feedback)
		if(status[1] == HUMAN_EATING_BLOCKED_MOUTH)
			to_chat(feeder, SPAN_WARNING("\The [status[2]] is in the way!"))
	return 0

/mob/living/carbon/human/proc/can_eat_status()
	if(!check_has_mouth())
		return list(HUMAN_EATING_NO_MOUTH)
	var/obj/item/blocked = check_mouth_coverage()
	if(blocked)
		return list(HUMAN_EATING_BLOCKED_MOUTH, blocked)
	return list(HUMAN_EATING_NO_ISSUE)

/mob/living/carbon/human/proc/update_equipment_vision()
	flash_protection = 0
	psi_blocking = 0
	equipment_tint_total = 0
	equipment_see_invis	= 0
	equipment_vision_flags = 0
	equipment_prescription = 0
	equipment_darkness_modifier = 0
//	equipment_cut_over-lays()

	if(istype(src.head, /obj/item/clothing/head))
		add_clothing_protection(head)
	if(istype(src.glasses, /obj/item/clothing/glasses))
		process_glasses(glasses)
	if(istype(src.wear_mask, /obj/item/clothing/mask))
		add_clothing_protection(wear_mask)
	if(istype(wearing_rig,/obj/item/rig))
		process_rig(wearing_rig)
	if(istype(using_scope,/obj/item/gun))
		process_scope(using_scope)

	psi_blocking += psi_blocking_additive //So we dont null are perks or other sources of psi blocking

/mob/living/carbon/human/proc/process_glasses(var/obj/item/clothing/glasses/G, var/forceActive)
	if(G && (G.active || forceActive))
		equipment_darkness_modifier += G.darkness_view
		equipment_vision_flags |= G.vision_flags
		equipment_prescription = equipment_prescription || G.prescription
//		if(G.overlay)
//			equipment_add_overlay(G.overlay)
//		if (src.HUDtech.Find("glassesoverlay"))//i process that ocerlay
//			var/obj/screen/glasses_overlay/GO = src.HUDtech["glassesoverlay"]
//			GO.update_icon()
		if(G.see_invisible >= 0)
			if(equipment_see_invis)
				equipment_see_invis = min(equipment_see_invis, G.see_invisible)
			else
				equipment_see_invis = G.see_invisible

		add_clothing_protection(G)
		G.process_hud(src)

/mob/living/carbon/human/proc/process_rig(var/obj/item/rig/O)
	if(O.helmet && O.helmet == head && (O.helmet.body_parts_covered & EYES))
		if((O.offline && O.offline_vision_restriction == 2) || (!O.offline && O.vision_restriction == 2))
			equipment_tint_total += TINT_BLIND
	var/obj/item/clothing/glasses/G = O.getCurrentGlasses()
	if(G && O.visor.active)
		process_glasses(G,1)

/mob/living/carbon/human/reset_layer()
	if(hiding)
		set_plane(HIDING_MOB_PLANE)
		layer = HIDING_MOB_LAYER
	else if(lying)
		set_plane(LYING_HUMAN_PLANE)
		layer = LYING_HUMAN_LAYER
	else
		..()

/mob/living/carbon/human/proc/get_all_slots() //General code for checking all external slots for something. Does not search inside objects in slots.
	. = get_head_slots() | get_body_slots()

/mob/living/carbon/human/proc/get_body_slots()
	return list(
		l_hand,
		r_hand,
		back,
		s_store,
		handcuffed,
		legcuffed,
		wear_suit,
		gloves,
		shoes,
		belt,
		wear_id,
		l_store,
		r_store,
		w_uniform
		)

/mob/living/carbon/human/proc/get_head_slots()
	return list(
		head,
		wear_mask,
		glasses,
		r_ear,
		l_ear,
		)

/mob/living/carbon/human/proc/process_scope(mob/user)
	var/obj/item/gun/A = using_scope
	equipment_darkness_modifier += A.darkness_view
	equipment_vision_flags |= A.vision_flags
	if(A.see_invisible_gun >= 0)
		if(equipment_see_invis)
			equipment_see_invis = min(equipment_see_invis, A.see_invisible_gun)
		else
			equipment_see_invis = A.see_invisible_gun
