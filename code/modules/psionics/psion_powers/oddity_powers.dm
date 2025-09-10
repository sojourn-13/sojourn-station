
//Powers that affect/transform oddites in some way

/mob/living/carbon/human/proc/psionic_weapon()
	set category = "Psionic powers.Transform"
	set name = "Psionic Weapon Construction (3)"
	set desc = "Expend three psi points to reshape an oddity into a ranged weapon. The properties of the oddity used heavily influcence the final product."
	var/psi_point_cost = 3
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	var/obj/item/oddity/active = usr.get_active_hand()
	if(istype(usr.get_active_hand(), /obj/item/oddity))
		if(!active.oddity_stats)
			to_chat(usr, "This oddity has no aspects to build a weapon from!")
			return
		if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
			var/list/LStats = active.oddity_stats
			var/obj/item/cultweaponchoice = pickweight(list(
				/obj/item/gun/energy/plasma/auretian/cult = (1 + LStats[STAT_ROB]),
				/obj/item/gun/energy/laser/cult = (1 + LStats[STAT_COG]),
				/obj/item/gun/projectile/automatic/greasegun/cult= (1 + LStats[STAT_TGH]),
				/obj/item/gun/energy/plasma/cassad/cult = (1 + LStats[STAT_BIO]),
				))

			playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
			var/turf/T = get_turf(usr)
			do_sparks(8, 0, T)
			cultweaponchoice = new cultweaponchoice(T)
			usr.visible_message(
				SPAN_DANGER("[usr] molds and twists the [active] like clay, transforming it into [cultweaponchoice]!"),
				SPAN_DANGER("You mold and twist the [active] like clay, transforming it into [cultweaponchoice]!")
				)
			usr.drop_item()
			usr.put_in_active_hand(cultweaponchoice)
			qdel(active)
	else
		to_chat(usr, "You must hold an oddity in your active hand.")

/mob/living/carbon/human/proc/psionic_melee()
	set category = "Psionic powers.Transform"
	set name = "Psionic Melee Construction (3)"
	set desc = "Spend three psi points to reshape an oddity into a melee weapon. The properties of the oddity used heavily influcence the final product."
	var/psi_point_cost = 3
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	var/obj/item/oddity/active = usr.get_active_hand()
	if(istype(usr.get_active_hand(), /obj/item/oddity))
		if(!active.oddity_stats)
			to_chat(usr, "This oddity has no aspects to build a weapon from!")
			return

		if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
			var/list/LStats = active.oddity_stats
			var/obj/item/cultweaponchoice = pickweight(list(
				/obj/item/tool/sword/cult = (1 + LStats[STAT_ROB]),
				/obj/item/tool/sword/machete/cult = (1 + LStats[STAT_VIG]),
				/obj/item/tool/saw/chain/cult = (1 + LStats[STAT_COG]),
				/obj/item/tool/hammer/homewrecker/cult= (1 + LStats[STAT_TGH]),
				/obj/item/tool/sword/cleaver/cult = (1 + LStats[STAT_BIO]),
				/obj/item/tool/power_fist/cult = (1 + LStats[STAT_MEC])))


			playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
			var/turf/T = get_turf(usr)
			do_sparks(8, 0, T)
			cultweaponchoice = new cultweaponchoice(T)
			usr.visible_message(
				SPAN_DANGER("[usr] molds and twists the [active] like clay, transforming it into [cultweaponchoice]!"),
				SPAN_DANGER("You mold and twist the [active] like clay, transforming it into [cultweaponchoice]!")
				)
			usr.drop_item()
			usr.put_in_active_hand(cultweaponchoice)
			qdel(active)
	else
		to_chat(usr, "You must hold an oddity in your active hand.")

/mob/living/carbon/human/proc/psionic_tool()
	set category = "Psionic powers.Transform"
	set name = "Psionic Tool Creation (2)"
	set desc = "Spend two psi points to reshape an oddity into a tool. The properties of the oddity used heavily influcence the final product."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	var/obj/item/oddity/active = usr.get_active_hand()
	if(istype(usr.get_active_hand(), /obj/item/oddity))
		if(!active.oddity_stats)
			to_chat(usr, "This oddity has no aspects to build a weapon from!")
			return
		if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
			var/list/LStats = active.oddity_stats
			var/obj/item/cultweaponchoice = pickweight(list(
				/obj/item/tool/shovel/combat/cult = (1 + LStats[STAT_ROB]),
				/obj/item/tool/wrench/big_wrench/cult = (1 + LStats[STAT_VIG]),
				/obj/item/tool/multitool/advanced/cult = (1 + LStats[STAT_COG]),
				/obj/item/tool/shovel/power/cult = (1 + LStats[STAT_TGH]),
				/obj/item/tool/screwdriver/combi_driver/cult = (1 + LStats[STAT_BIO]),
				/obj/item/tool/weldingtool/advanced/cult = (1 + LStats[STAT_MEC])))

			playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
			var/turf/T = get_turf(usr)
			do_sparks(8, 0, T)
			cultweaponchoice = new cultweaponchoice(T)
			usr.visible_message(
				SPAN_DANGER("[usr] molds and twists the [active] like clay, transforming it into a [cultweaponchoice]!"),
				SPAN_DANGER("You mold and twist the [active] like clay, transforming it into a [cultweaponchoice]!")
				)
			usr.drop_item()
			usr.put_in_active_hand(cultweaponchoice)
			qdel(active)
		else
			to_chat(usr, "Your mind fails to graps onto its creative throughts.")
	else
		to_chat(usr, "You must hold an oddity in your active hand.")

/mob/living/carbon/human/proc/psychoactive_manipulation()
	set category = "Psionic powers.Transform"
	set name = "Psychoactive Manipulation (2)"
	set desc = "Spend two psi points to alter an oddity or an anomaly in an unpredictable manner. The process could make the oddity or anomaly \
	better or worse."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	var/obj/item/oddity/O = user.get_active_hand()
	if(!istype(O, /obj/item/oddity))
		to_chat(user, SPAN_NOTICE("You're not holding an oddity or a proper anomaly!"))
		return FALSE

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		user.visible_message("<b><font color='purple'>[user] concentrates on the anomaly in their hand, something about it changing in a subtle way.</font><b>", "<b><font color='purple'>You focus on the energies around the object, swaying them to your will and trying to change it!</font><b>")

		if(O.oddity_stats)
			for(var/stat in O.oddity_stats)
				O.oddity_stats[stat] = rand(1, O.oddity_stats[stat])

		if(O.perk)
			O.perk = null
		if(prob(O.prob_perk))
			O.perk = get_oddity_perk()
