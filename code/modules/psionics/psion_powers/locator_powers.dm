
// Psionic powers that assit in locating someone or something

/mob/living/carbon/human/proc/detect_thoughts()
	set category = "Psionic powers.Telepathy"
	set name = "Locate Mind-Essence (5)"
	set desc = "Spend five psi points to telepathically detect the thoughts and location of another higher life form. Does not work on animals, cruciform bearers, synthetics, or those \
	wearing psionic protection. Can locate lingering echoes of thoughts in the deceased, allowing you to find bodies."
	var/psi_point_cost = 5
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	var/list/creatures = list() // Who we can talk to
	for(var/mob/living/carbon/human/h in world) // Check every players in the game
		if(!h.species?.reagent_tag != IS_SYNTHETIC && !h.get_core_implant(/obj/item/implant/core_implant/cruciform) && !h.is_mannequin) // Can't talk to robots or people with cruciforms or mannequins
			creatures += h // Add the player to the list we can talk to
	var/mob/living/carbon/human/target = input("Who do you want to locate?") as null|anything in creatures
	if (isnull(target))
		return

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility()) //Doesn't use the normal check possibility flags since we want it to work on dead people
		if(target.psi_blocking >= 10)
			user.stun_effect_act(0, target.psi_blocking * 5, BP_HEAD)
			user.weakened = target.psi_blocking
			usr.show_message(SPAN_DANGER("Your head pulsates with pain as your mind bashes against an unbreakable barrier!"))
		else
			var/area/t = get_area(target)
			usr.show_message("\blue You psionically locate [target.real_name], they are at : [target.x], [target.y], [target.z] in [t.name].")
