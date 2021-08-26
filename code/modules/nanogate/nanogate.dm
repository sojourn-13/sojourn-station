// Main page for nanogates and non-power stuff. If it is related to nanogates and you don't know where to put it, put it here. -R4d6

// Proc to give people nanogates. Add the organ, and it will do the rest.
 // HOW TO USE: Right click person -> view variables -> call proc -> type "make_psion" -> click finished -> done
/mob/proc/give_nanogate()
	var/mob/living/carbon/human/user = src
	if(istype(user))
		var/obj/item/organ/external/chest = user.get_organ(BP_CHEST)

		if(chest)
			var/obj/item/organ/internal/nanogate/B = new /obj/item/organ/internal/nanogate
			B.replaced(chest)

// The main process
/obj/item/organ/internal/nanogate/Process()
	..()

	if(!owner.stats.getPerk(PERK_NANOGATE))
		owner.stats.addPerk(PERK_NANOGATE)

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
