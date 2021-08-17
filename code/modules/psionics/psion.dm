//Main page for psionic processes and functions. Put all non-power functions here. -Kazkin

 //useful proc for making people psions randomly, in case its needed for an event. Adds the organ to the head and then the organ takes care of the rest.
/mob/proc/make_psion()
	var/mob/living/carbon/human/user = src
	if(istype(user))
		var/obj/item/organ/external/head = user.get_organ(BP_HEAD)

		if(head)
			var/obj/item/organ/internal/psionic_tumor/B = new /obj/item/organ/internal/psionic_tumor
			B.replaced(head)

			B.max_psi_points = round(clamp((user.stats.getStat(STAT_COG) / 10), 1, 30))
			B.psi_points = B.max_psi_points

//Main process, synthetics and impants are removed here, max psi points are determined, and checks to regen psi points.
/obj/item/organ/internal/psionic_tumor/Process()
	..()
	if(round(world.time) % 5 == 0)
		remove_synthetics()

	if(!owner.stats.getPerk(PERK_PSION))
		owner.stats.addPerk(PERK_PSION)

	max_psi_points = round(clamp((owner.stats.getStat(STAT_COG) / 10), 1, 30))

	if(world.time > last_psi_point_gain)
		if(psi_points >= max_psi_points)
			return
		psi_points += 1
		last_psi_point_gain = world.time + 5 MINUTES

//This proc removes all implants, including cruciforms, and synthetics from any psions, violently so. You've been warned.
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

		if(istype(O, /obj/item/implant))
			if(O == src)
				continue
			var/obj/item/implant/R = O
			if(R.wearer != owner)
				continue
			owner.visible_message(SPAN_DANGER("[R.name] rips through [owner]'s [R.part]."),\
			SPAN_DANGER("[R.name] rips through your [R.part]."))
			R.part.take_damage(rand(20,40))
			R.uninstall()
			R.malfunction = MALFUNCTION_PERMANENT
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		H.update_implants()

//Subtracts psi points from you fool and checks if you can pay for powers.
/obj/item/organ/internal/psionic_tumor/proc/pay_power_cost(var/psi_cost)
	if(psi_points < psi_cost)
		to_chat(usr,"You lack the psionic essence to do this.")
		return FALSE
	else
		psi_points -= psi_cost
		return TRUE