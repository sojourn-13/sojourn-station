
// Note on starting powers: These are round start.
// If you add to this power set make sure to to also add them to psion implant.
// Adding or tweaking powers here should be on the side of "Psions are intented to get powerful thoughout the shift"

/mob/living/carbon/human/proc/psionic_telepathy()
	set category = "Psionic powers.Telepathy"
	set name = "Telepathic Projection (1)"
	set desc = "Spend a single psi point to send a telepathic message to someone, projecting your thoughts directly into their mind. Be wary, as not all are susceptible to telepathy."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	var/list/creatures = list() // Who we can talk to
	for(var/mob/living/carbon/human/h in world) // Check every players in the game
		if(!h.species?.reagent_tag != IS_SYNTHETIC && !h.get_core_implant(/obj/item/implant/core_implant/cruciform) && !h.is_mannequin) // Can't talk to robots or people with cruciforms or mannequins
			creatures += h // Add the player to the list we can talk to
	var/mob/living/carbon/human/target = input("Who do you want to project your mind to ?") as null|anything in creatures
	if (isnull(target))
		return

	if(user.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(user, "Your mastery over psionics allows you to fully bypass the casting cost.")
		psi_point_cost = 0
	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility(TRUE, target))
		var/say = sanitize(input("What do you wish to say"))
		target.show_message("\blue <b><font size='3px'> [usr.real_name]'s thoughts are projected into your mind: [say] </font></b>")
		usr.show_message("\blue You project your mind into [target.real_name]: [say]")
		log_and_message_admins("[key_name(usr)] sent a telepathic message to [key_name(target)]: [say]")

		for(var/mob/observer/ghost/G in world)
			if(G.get_preference_value(/datum/client_preference/ghost_ears_plus) == GLOB.PREF_YES)
				G.show_message("<i>Telepathic message from <b>[user]</b> to <b>[target]</b>: [say]</i>")

