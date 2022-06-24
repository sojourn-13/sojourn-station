/obj/item/organ/foreskin
	name = "foreskin"
	desc = "A small strip of skin harvested from a male. Certain cultures attribute mythical powers to these."
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_FORESKIN
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "scrap"
	var/foreskincolor = "#ffe0d1"

/obj/item/organ/foreskin/Insert(mob/living/carbon/M)
	..()

	if (M)
		if (M.gender == FEMALE)
			qdel(src)

	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		foreskincolor = "#" + skintone2hex(H.skin_tone)
	add_atom_colour(foreskincolor, FIXED_COLOUR_PRIORITY)

/obj/item/organ/foreskin/prepare_eat()
	var/obj/item/reagent_containers/food/snacks/organ/S = new
	S.name = name
	S.desc = desc
	S.icon = icon
	S.icon_state = icon_state
	S.w_class = w_class
	S.add_atom_colour(foreskincolor, FIXED_COLOUR_PRIORITY)

	return S

/datum/surgery_step/incise/circumcise
	name = "circumcise"
	var/obj/item/organ/foreskin/F = null

/datum/surgery/circumcision
	name = "circumcision"
	steps = list(/datum/surgery_step/retract_skin, /datum/surgery_step/incise/circumcise)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_PRECISE_GROIN)
	requires_bodypart_type = 0

/datum/surgery_step/incise/circumcise/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	return ..()

/datum/surgery/circumcision/can_start(mob/user, mob/living/carbon/target)
	var/obj/item/organ/foreskin/F = target.getorganslot(ORGAN_SLOT_FORESKIN)

	if (target.gender == FEMALE)
		to_chat(user, "<span class='warning'>We're not barbarians.</span>")
		return FALSE

	if(!F)
		to_chat(user, "It's hard to cut off someone's foreskin when [target.p_they()] [target.p_do()]n't have any.")
		return FALSE

	return TRUE

/datum/surgery_step/incise/circumcise/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	F = target.getorgan(/obj/item/organ/foreskin)
	if(F && F.owner == target)
		user.visible_message("[user] successfully circumcises [target].","<span class='notice'>You successfully circumcise [target].</span>")
		log_combat(user, target, "circumcised", addition="INTENT: [uppertext(user.a_intent)]")
		F.Remove(target)
		F.forceMove(get_turf(target))
		return 0
	else
		return -1