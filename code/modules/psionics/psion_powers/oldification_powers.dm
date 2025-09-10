
//Psionic powers that intract with the oldification system

/mob/living/carbon/human/proc/rust()
	set category = "Psionic powers.Chrono"
	set name = "Rust (1)"
	set desc = "Spend a single psi point to wither an object, making it rust away and weaken."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if(user.get_active_hand())
			var/obj/A = user.get_active_hand()
			A.make_old()
			to_chat(user, "You focus on the [A], withering and aging it.")
		else
			to_chat(user, "You must hold an item in your active hand to wither it.")

/mob/living/carbon/human/proc/restore()
	set category = "Psionic powers.Chrono"
	set name = "Restore (1)"
	set desc = "Spend a single psi point to restore a rusted object to its former glory."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if(user.get_active_hand())
			var/obj/A = user.get_active_hand()
			A.make_young()
			to_chat(user, "You focus on the [A], restoring it to its former glory.")
		else
			to_chat(user, "You must hold an item in your active hand to restore it.")

/mob/living/carbon/human/proc/relic_intuition()
	set category = "Psionic powers.Chrono"
	set name = "Reclamation (2)"
	set desc = "Spend two psi points to reclaim a locker from the clutches of roaches and rust."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/turf/T = get_step(user, user.dir)
		if(T)
			var/refund = TRUE
			for(var/obj/structure/closet/clst in T.contents)
				if(clst.oldified) // To prevent cheesing and having an instant-unlock
					clst.make_young()
					clst.has_mobs_to_spawn = FALSE
					clst.locked = FALSE
					clst.secure = FALSE
					user.visible_message(
					"[user] runs [identifying_gender == "male" ? "his" : identifying_gender == "female" ? "her" : identifying_gender == "neuter" ? "its" : "their"] hand over the [clst], the rust and time-worn debris falling away.",
					"You run your hand across the surface of the [clst], the rust and time-worn debris falling away."
					)
					playsound(user.loc,'sound/effects/teleport.ogg', 50, 1, -3)
					clst.update_icon()
					refund = FALSE
					break
				else
					to_chat(src, "You cannot restore what is already clean!")
			if(refund)
				PT.psi_points += psi_point_cost
			return


/mob/living/carbon/human/proc/decay()
	set category = "Psionic powers.Chrono"
	set name = "Decay (2)"
	set desc = "Spend two psi points to wither and rust every object a person you are grabbing is holding or wearing, rendering their equipment weaker."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(get_grabbed_mob(user))
		if(PT && PT.pay_power_cost(psi_point_cost))
			var/mob/living/L
			L = get_grabbed_mob(user)
			if(istype(L, /mob/living/carbon/human))
				var/mob/living/carbon/human/H = L
				if(PT.check_possibility(TRUE, L))
					for(var/obj/objects in H.contents)
						if(istype(objects, /obj/item/organ))
							continue
						if(istype(objects, /obj/parallax))
							continue
						if(istype(objects, /obj/item/grab))
							continue
						else
							objects.make_old()
							visible_message(
							SPAN_DANGER("[objects] rusts and decays!"),
							)
	else
		to_chat(src, "You must grab your target!")
