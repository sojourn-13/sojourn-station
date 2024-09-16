/obj/item/stack/medical/splint
	name = "medical splints"
	singular_name = "medical splint"
	icon_state = "splint" //sprites by @LiLJard @Ajajumbo123
	amount = 5
	max_amount = 5
	fancy_icon = FALSE
	bio_requirement = -25
	always_useful = TRUE

/obj/item/stack/medical/splint/non_consumable
	consumable = FALSE
	splittable = FALSE

/obj/item/stack/medical/splint/improvised
	name = "improvised bone splint"
	singular_name = "improvised bone splint"
	desc = "A pair of wooden planks held together by wire that can work as a splint on a pinch."
	icon_state = "improsplint"
	amount = 1
	max_amount = 1

/obj/item/stack/medical/splint/attack(mob/living/carbon/M, mob/living/user)
	if(..())
		return 1

	if (ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/external/affecting = H.get_organ(user.targeted_organ)

		if(!affecting)
			to_chat(user, SPAN_WARNING("What [user.targeted_organ]?"))
			return TRUE

		var/limb = affecting.name
		if(!(affecting.organ_tag in list(BP_L_LEG, BP_R_LEG, BP_L_ARM, BP_R_ARM, BP_CHEST, BP_GROIN, BP_HEAD)))
			to_chat(user, SPAN_DANGER("You can't apply a splint there!"))
			return
		if(affecting.status & ORGAN_SPLINTED)
			to_chat(user, SPAN_DANGER("[M]'s [limb] is already splinted!"))
			return
		if (M != user)
			user.visible_message(
				SPAN_DANGER("[user] starts to apply \the [src] to [M]'s [limb]."),
				SPAN_DANGER("You start to apply \the [src] to [M]'s [limb]."),
				SPAN_DANGER("You hear something being wrapped.")
			)
		else
			if((!user.hand && affecting.organ_tag == BP_R_ARM) || (user.hand && affecting.organ_tag == BP_L_ARM))
				to_chat(user, SPAN_DANGER("You can't apply a splint to the arm you're using!"))
				return
			user.visible_message(
				SPAN_DANGER("[user] starts to apply \the [src] to their [limb]."),
				SPAN_DANGER("You start to apply \the [src] to your [limb]."),
				SPAN_DANGER("You hear something being wrapped.")
			)
		if(do_after(user, max(0, 60 - user.stats.getStat(STAT_BIO)), M))
			if (M != user)
				user.visible_message(
					SPAN_DANGER("[user] finishes applying \the [src] to [M]'s [limb]."),
					SPAN_DANGER("You finish applying \the [src] to [M]'s [limb]."),
					SPAN_DANGER("You hear something being wrapped.")
				)
			else
				if(prob(25 + user.stats.getStat(STAT_BIO)))
					user.visible_message(
						SPAN_DANGER("[user] successfully applies \the [src] to their [limb]."),
						SPAN_DANGER("You successfully apply \the [src] to your [limb]."),
						SPAN_DANGER("You hear something being wrapped.")
					)
				else
					user.visible_message(
						SPAN_DANGER("[user] fumbles \the [src]."),
						SPAN_DANGER("You fumble \the [src]."),
						SPAN_DANGER("You hear something being wrapped.")
					)
					return
			affecting.status |= ORGAN_SPLINTED
			use(1) //You cannot "waste less" of a splint! Their uses are supposed to be expended since it's one whole item not some ointment!
		return