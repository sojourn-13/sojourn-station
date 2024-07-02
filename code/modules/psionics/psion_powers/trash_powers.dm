/mob/living/carbon/human/psionic_tumor/proc/summan_trash_pile()
	set category = "Psionic powers"
	set name = "Scrap Togather (4)"
	set desc = "Exspend some essence to collect trash from deepmaints and pile it infrount of you."
	var/psi_point_cost = 4
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(user, "Your psionic attunement allows save an essence.")
		psi_point_cost = 3

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/turf/T = get_step(user, user.dir)
		if(T)
			to_chat(user, "Your mind works to geather random junk fallin deepmaints and bring them to your current location.")
			new /obj/random/scrap/moderate_weighted(T.contents)

/mob/living/carbon/human/psionic_tumor/proc/trash_pile_compress()
	set category = "Psionic powers"
	set name = "Reorganize (2)"
	set desc = "Exspend a small amount of essene to compress a scrap pile into a condenced cube for easyer transportation."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(user, "Your psionic attunement allows save an essence.")
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
				to_chat(user, "Do to being unable to compress down a scrap pile you dont waste your essene.")
				PT.psi_points += psi_point_cost
			return

/mob/living/carbon/human/psionic_tumor/proc/trash_pile_exploid()
	set category = "Psionic powers"
	set name = "Discombobulate (1)"
	set desc = "Spend an essene to voilently destory a pile of trash."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(user, "Your psionic attunement allows save your essence.")
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
				to_chat(user, "Do to being unable to rapidly decompress a scrap pile you dont waste your essene.")
				PT.psi_points += psi_point_cost
			return