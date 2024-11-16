/mob/living/carbon/human/gib(max_range=3, keep_only_robotics=FALSE)

	var/on_turf = istype(loc, /turf)

	for(var/obj/item/organ/I in internal_organs)
		if (!(keep_only_robotics && !(I.nature == MODIFICATION_SILICON)))
			I.removed()
			if(on_turf)
				I.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,max_range),30)

	for(var/obj/item/organ/external/E in src.organs)
		if (!(keep_only_robotics && !(E.nature == MODIFICATION_SILICON)))
			E.droplimb(TRUE, DISMEMBER_METHOD_EDGE, 1)
			if(on_turf)
				E.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,max_range),30)

	sleep(1)

	for(var/obj/item/D in src)
		if (keep_only_robotics && istype(D, /obj/item/organ))
			continue
		else
			drop_from_inventory(D)
			D.throw_at(get_edge_target_turf(src,pick(alldirs)), rand(1,max_range), round(30/D.w_class))

	..(species.gibbed_anim)
	gibs(loc, dna, null, species.flesh_color, species.blood_color)

/mob/living/carbon/human/death(gibbed)
	if(stat == DEAD) return

	BITSET(hud_updateflag, HEALTH_HUD)
	BITSET(hud_updateflag, STATUS_HUD)
	BITSET(hud_updateflag, LIFE_HUD)

	//Handle species-specific deaths.
	species.handle_death(src)

	//Handle brain slugs.
	var/obj/item/organ/external/head = get_organ(BP_HEAD)
	var/mob/living/simple_animal/borer/B

	if(head)
		for(var/I in head.implants)
			if(istype(I,/mob/living/simple_animal/borer))
				B = I
		if(B)
			if(!B.ckey && ckey && B.controlling)
				B.ckey = ckey
				B.controlling = 0
			if(B.host_brain?.ckey)
				ckey = B.host_brain.ckey
				B.host_brain.ckey = null
				B.host_brain.name = "host brain"
				B.host_brain.real_name = "host brain"
			remove_verb(src, /mob/living/carbon/proc/release_control)

	callHook("death", list(src, gibbed))

	if(wearing_rig)
		wearing_rig.notify_ai(
			SPAN_DANGER("Warning: user death event. Mobility control passed to integrated intelligence system.")
		)

	learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/rebound_case, "REBOUND_CASE", skill_gained = 1, learner = src)

	if(stats.getPerk(PERK_TERRIBLE_FATE))
		visible_message(SPAN_WARNING("their inert body emits a strange sensation and a cold invades your body. Their screams before dying recount in your mind."))

	. = ..(gibbed,form.death_message)
	if(!gibbed)

		handle_organs()
		dead_HUD()
		if(form.death_sound)
			playsound(loc, form.death_sound, 80, 1, 1)
	handle_hud_list()

	var/obj/item/implant/core_implant/cruciform/C = get_core_implant(/obj/item/implant/core_implant/cruciform)
	if(C && C.active)
		var/obj/item/cruciform_upgrade/upgrade = C.upgrade
		if(upgrade && upgrade.active && istype(upgrade, CUPGRADE_MARTYR_GIFT))
			var/obj/item/cruciform_upgrade/martyr_gift/martyr = upgrade
			visible_message(SPAN_DANGER("The [C] emit a massive light!"))
			var/damage_healed
			for(var/mob/living/L in oviewers(6, src))
				if(ishuman(L))
					var/mob/living/carbon/human/H = L
					damage_healed = martyr.damage_healed / get_dist(src, H)
					H.adjustFireLoss(-damage_healed)
					H.adjustBruteLoss(-damage_healed)
					to_chat(H, SPAN_DANGER("You are get healed by radiance!"))

			qdel(martyr)
			C.upgrade = null

/mob/living/carbon/human/proc/ChangeToHusk()
	if(HUSK in mutations)	return

	if(f_style)
		f_style = "Shaved"	//we only change the icon_state of the hair datum, so it doesn't mess up their UI/UE
	if(h_style)
		h_style = "Bald"
	update_hair(0)

	mutations.Add(HUSK)
	status_flags |= ORGAN_DISFIGURED	//makes them unknown without fucking up other stuff like admintools
	update_body(1)
	return

/mob/living/carbon/human/proc/Drain()
	ChangeToHusk()
	mutations |= HUSK
	return

/mob/living/carbon/human/proc/ChangeToSkeleton()
	if(SKELETON in src.mutations)	return

	if(f_style)
		f_style = "Shaved"
	if(h_style)
		h_style = "Bald"
	update_hair(0)

	mutations.Add(SKELETON)
	status_flags |= ORGAN_DISFIGURED
	update_body(0)
	return

/mob/living/carbon/human/proc/ChangeHairToBald()
//We only change the icon_state of the hair datum, so it doesn't mess up their UI/UE
	if(f_style)
		f_style = "Shaved"
	if(h_style)
		h_style = "Bald"
	update_hair(0)
	return
