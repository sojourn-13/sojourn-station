/****************************************************
			   DISMEMBERMENT
****************************************************/

//Handles dismemberment
/obj/item/organ/external/proc/droplimb(var/clean, var/disintegrate = DISMEMBER_METHOD_EDGE, var/ignore_children = null)

	if(cannot_amputate || !owner)
		return
	//Ugh.
	if(organ_tag == BP_HEAD) //UGLY UGLY UGLY
		if(owner.has_brain_worms())
			var/mob/living/simple/borer/B = owner.has_brain_worms()
			if(B)
				B.leave_host()
				B.reset_view(null) //Camera bug.
				to_chat(owner, SPAN_NOTICE("Your host has been decapitated! Resist to leave their dismembered head!"))
				B.detatch()
				B.emergency_leave = TRUE
				if(!B.ckey && owner.ckey && B.controlling)
					B.ckey = owner.ckey
					B.controlling = 0
				if(B.host_brain?.ckey)
					owner.ckey = B.host_brain.ckey //this will technically allow you to be revived by just attaching any head and brain but whatever bro fixing it is so ass
					B.host_brain.ckey = null
					B.host_brain.name = "host brain"
					B.host_brain.real_name = "host brain"
	switch(disintegrate)
		if(DISMEMBER_METHOD_EDGE)
			if(!clean)
				var/gore_sound = "[BP_IS_ROBOTIC(src) ? "tortured metal" : "ripping tendons and flesh"]"
				owner.visible_message(
					SPAN_DANGER("\The [owner]'s [src.name] flies off in an arc!"),\
					"<span class='moderate'><b>Your [src.name] goes flying off!</b></span>",\
					SPAN_DANGER("You hear a terrible sound of [gore_sound]."))
		if(DISMEMBER_METHOD_BURN)
			var/gore = "[BP_IS_ROBOTIC(src) ? "": " of burning flesh"]"
			owner.visible_message(
				SPAN_DANGER("\The [owner]'s [src.name] flashes away into ashes!"),\
				"<span class='moderate'><b>Your [src.name] flashes away into ashes!</b></span>",\
				SPAN_DANGER("You hear a crackling sound[gore]."))
		if(DISMEMBER_METHOD_BLUNT)
			var/gore = BP_IS_ROBOTIC(src) ? "": " in shower of gore"
			var/gore_sound = BP_IS_ROBOTIC(src) ? "rending sound of tortured metal" : "sickening splatter of gore"
			owner.visible_message(
				SPAN_DANGER("\The [owner]'s [src.name] explodes[gore]!"),\
				"<span class='moderate'><b>Your [src.name] explodes[gore]!</b></span>",\
				SPAN_DANGER("You hear the [gore_sound]."))

	var/mob/living/carbon/human/victim = owner //Keep a reference for post-removed().
	var/obj/item/organ/external/parent_organ = parent
	removed(null, ignore_children)
	victim.adjustHalLoss(30)

	if(parent_organ)
		var/datum/wound/lost_limb/W = new (src, disintegrate, clean)
		if((clean) || (BP_IS_SLIME(src)))
			if(!BP_IS_ROBOTIC(src))
				parent_organ.wounds |= W
				parent_organ.update_damages()
		else
			var/obj/item/organ/external/stump/stump = new (victim, 0, src)
			stump.wounds |= W
			victim.organs |= stump
			stump.update_damages()

	spawn(1)
		victim.updatehealth()
		victim.UpdateDamageIcon()
		victim.regenerate_icons()
		dir = 2

	switch(disintegrate)
		if(DISMEMBER_METHOD_EDGE)
			compile_icon()
			add_blood(victim)
			add_new_transformation(/datum/transform_type/random_rotation/half)
			if(!clean)
				// Throw limb around.
				if(src && istype(loc,/turf))
					throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,3),30)
				dir = 2
		if(DISMEMBER_METHOD_BURN)
			new /obj/effect/decal/cleanable/ash(get_turf(victim))

			for(var/obj/item/organ/I in internal_organs)
				I.removed()
				I.forceMove(get_turf(src))

			for(var/obj/item/I in src)
				if(I.w_class > ITEM_SIZE_SMALL)
					I.forceMove(get_turf(src))
			qdel(src)
		if(DISMEMBER_METHOD_BLUNT)
			var/obj/effect/decal/cleanable/blood/gibs/gore = new victim.form.single_gib_type(get_turf(victim))
			if(victim.form.flesh_color)
				gore.fleshcolor = victim.form.flesh_color
			if(victim.form.blood_color)
				gore.basecolor = victim.form.blood_color
			gore.update_icon()
			gore.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,3),30)

			for(var/obj/item/organ/I in internal_organs)
				I.removed()
				I.forceMove(get_turf(src))
				I.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,3),30)

			for(var/obj/item/I in src)
				if(I.w_class <= ITEM_SIZE_SMALL)
					qdel(I)
					continue
				I.forceMove(get_turf(src))
				I.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,3),30)
			qdel(src)
