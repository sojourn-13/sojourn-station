// Main page for nanogates and non-power stuff. If it is related to nanogates and you don't know where to put it, put it here. -R4d6

// Proc to give people nanogates. Add the organ, and it will do the rest.
 // HOW TO USE: Right click person -> Click 'Advanced Proc Call Target -> Type 'give_nanogate' -> Click finish to give a normal nanogate, click 'num' then type '1', *then* finished to give them an opifex nanogate.
/mob/proc/give_nanogate(var/opifex = FALSE)
	var/mob/living/carbon/human/user = src
	if(istype(user))
		var/obj/item/organ/external/chest = user.get_organ(BP_CHEST)

		if(chest)
			var/obj/item/organ/internal/nanogate/B
			if(opifex)
				B = new /obj/item/organ/internal/nanogate/opifex
			else
				B = new /obj/item/organ/internal/nanogate
			B.replaced(chest)
			return TRUE
	return FALSE

// The main process
/obj/item/organ/internal/nanogate/Process()
	..()

	if(round(world.time) % 5 == 0)
		remove_foreign()

	if(!owner.stats.getPerk(PERK_NANOGATE))
		owner.stats.addPerk(PERK_NANOGATE)

/obj/item/organ/internal/nanogate/proc/remove_foreign()
	for(var/obj/item/organ/O in owner.internal_organs)
		if(istype(O, /obj/item/organ/internal/psionic_tumor) && !(O.status & ORGAN_DEAD)) // If we have the forbidden organ and we didn't kill it already
			to_chat(owner, SPAN_DANGER("You hear a synthetic voice, \"FOREIGN ORGANISM DETECTED. NEUTRALIZING\" before you feel an immense pain in [O.get_limb()]."))
			if(istype(O, /obj/item/organ/external))
				var/obj/item/organ/external/E = O
				E.droplimb()
			else
				O.die()
			return TRUE
	return FALSE

// Check if there's enough nano points and remove them.
/obj/item/organ/internal/nanogate/proc/pay_power_cost(var/nano_cost)
	if(owner.stat == DEAD)
		to_chat(src, "You are dead.")
		return FALSE
	if(owner.stat == UNCONSCIOUS)
		to_chat(src, "You cannot use your nanogates powers while unconsious.")
		return FALSE
	if(nanite_points < nano_cost)
		to_chat(usr,"You lack the nanites to do this.")
		return FALSE
	else
		nanite_points -= nano_cost
		return TRUE
