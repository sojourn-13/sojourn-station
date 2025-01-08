/mob/living/carbon/human/psionic_tumor/proc/summan_trash_pile()
	set category = "Psionic powers"
	set name = "Scrap Together (4)"
	set desc = "Spend four psi points to summon a random trash pile right in front of you."
	var/psi_point_cost = 4
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(user, "Your mastery over psionics allows you to recover a psi point.")
		psi_point_cost = 3

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/turf/T = get_step(user, user.dir)
		if(T)
			to_chat(user, "You momentarily focus on what was lost and forgotten, bringing some of it back in the form of a trash pile!")
			new /obj/random/scrap/moderate_weighted(T)

/mob/living/carbon/human/psionic_tumor/proc/trash_pile_compress()
	set category = "Psionic powers"
	set name = "Reorganize (2)"
	set desc = "Spend two psi points to compress a scrap pile into a condensed cube."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(user, "Your mastery over psionics allows you to recover a psi point.")
		psi_point_cost = 1

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/turf/T = get_step(user, user.dir)
		if(T)
			var/refund = TRUE
			for(var/obj/structure/scrap/jnk in T.contents)
				jnk.make_cube()
				refund = FALSE
				break
			if(refund)
				to_chat(user, "Due to being unable to compress down a scrap pile you don't waste your psi points.")
				PT.psi_points += psi_point_cost
			return

/mob/living/carbon/human/psionic_tumor/proc/trash_pile_exploid()
	set category = "Psionic powers"
	set name = "Discombobulate (1)"
	set desc = "Spend a single psi point to completely obliterate a trash pile."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(user, "Your mastery over psionics allows you to fully bypass the casting cost.")
		psi_point_cost = 0

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/turf/T = get_step(user, user.dir)
		if(T)
			var/refund = TRUE
			for(var/obj/structure/scrap/jnk in T.contents)
				jnk.ex_act(1)
				refund = FALSE
				break
			if(refund)
				to_chat(user, "Due to being unable to rapidly decompress a scrap pile you don't waste your psi points.")
				PT.psi_points += psi_point_cost
			return
