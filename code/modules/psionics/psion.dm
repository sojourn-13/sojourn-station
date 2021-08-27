// Main page for psionic processes and functions. Put all non-power functions here. -Kazkin

 // Useful proc for making people psions, in case its needed for an event, debugging, or fixing. Adds the organ to the head and then the organ takes care of the rest.
 // HOW TO USE: Right click person -> view variables -> call proc -> type "make_psion" -> click finished -> done
/mob/proc/make_psion()
	var/mob/living/carbon/human/user = src
	if(istype(user))
		var/obj/item/organ/external/head = user.get_organ(BP_HEAD)

		if(head)
			var/obj/item/organ/internal/psionic_tumor/B = new /obj/item/organ/internal/psionic_tumor
			B.replaced(head)

			B.max_psi_points = round(clamp((user.stats.getStat(STAT_COG) / 10), 1, 30))
			B.psi_points = B.max_psi_points

// Main process, this runs through all the needed checks for a psion. Removal of implants like cruciforms and synthetics are called here.
// This also handles psi points limits and regeneration, the effect is dynamic so increases to cognition through things like stims and chems will update accordingly.
/obj/item/organ/internal/psionic_tumor/Process()
	..()
	var/psi_max_bonus = 0
	if(round(world.time) % 5 == 0)
		remove_synthetics()

	if(!owner.stats.getPerk(PERK_PSION))
		owner.stats.addPerk(PERK_PSION)

	if(owner.stats.getPerk(PERK_PSI_HARMONY))
		psi_max_bonus = 3

	max_psi_points = round(clamp((owner.stats.getStat(STAT_COG) / 10), 1, 30)) + psi_max_bonus

	if(world.time > last_psi_point_gain)
		if(psi_points >= max_psi_points)
			return
		psi_points += 1
		last_psi_point_gain = world.time + 10 MINUTES

	if(psi_points > max_psi_points)
		psi_points = max_psi_points

// This proc removes all implants. Synthetic limbs and implants are exploded out of the body while organ_modules and synthetic organs are teleported away.
/obj/item/organ/internal/psionic_tumor/proc/remove_synthetics()
	if(!owner)
		return
	for(var/obj/O in owner)
		if(istype(O, /obj/item/organ/external))
			var/obj/item/organ/external/R = O
			if(!BP_IS_ROBOTIC(R))
				continue

			if(R.owner != owner)
				continue
			owner.visible_message(SPAN_DANGER("[owner]'s [R.name] tears off."),
			SPAN_DANGER("Your [R.name] tears off."))
			R.droplimb()
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.update_implants()

		if(istype(O, /obj/item/organ/internal))
			var/obj/item/organ/internal/R = O
			if(!BP_IS_ROBOTIC(R))
				continue

			if(R.owner != owner)
				continue
			to_chat(owner, SPAN_DANGER("You feeling a sickeningly emptying feeling as the synthetic organ within your body is forcefully shunted elsewhere by your psionic power."))
			qdel(O)
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.update_implants()

		if(istype(O, /obj/item/implant))
			if(O == src)
				continue
			var/obj/item/implant/R = O
			owner.visible_message(SPAN_DANGER("[R.name] rips through [owner]'s body."),\
			SPAN_DANGER("[R.name] rips through your body."))
			R.uninstall()
			R.malfunction = MALFUNCTION_PERMANENT
			if(ishuman(owner))
				var/mob/living/carbon/human/H = owner
				H.update_implants()

		if(istype(O, /obj/item/organ_module))
			if(O == src)
				continue
			var/obj/item/organ_module/R = O
			if(R.is_organic_module == FALSE)
				owner.visible_message(SPAN_DANGER("[R.name] rips through [owner]'s body."),\
				SPAN_DANGER("[R.name] rips through your body."))
				to_chat(owner, SPAN_DANGER("You feeling a sickeningly emptying feeling as the synthetic module within your body is forcefully shunted elsewhere by your psionic power."))
				qdel(O)
				if(ishuman(owner))
					var/mob/living/carbon/human/H = owner
					H.update_implants()


// This proc handles paying for your powers and checks if you attempt to use your power while you are dead or unconcious. Placed here so it doesn't need to be in every power function.
/obj/item/organ/internal/psionic_tumor/proc/pay_power_cost(var/psi_cost)
	if(owner.stat == DEAD)
		to_chat(src, "You are dead.")
		return
	if(owner.stat == UNCONSCIOUS)
		to_chat(src, "You cannot use your psionic powers while unconsious.")
		return
	if(psi_points < psi_cost)
		to_chat(usr,"You lack the psionic essence to do this.")
		return FALSE
	else
		psi_points -= psi_cost
		return TRUE
