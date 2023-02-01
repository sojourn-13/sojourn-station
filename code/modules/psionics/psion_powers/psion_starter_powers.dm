
// Note on starting powers: These are round start.
// If you add to this power set make sure to to also add them to psion implant.
// Adding or tweaking powers here should be on the side of "Psions are intented to get powerful thoughout the shift"

/obj/item/organ/internal/psionic_tumor/proc/psionic_telepathy()
	set category = "Psionic powers"
	set name = "Telepathic projection (1)"
	set desc = "Expend a single point of your psi essence to send a message to someone. Cruciform users are shielded from this heresy and synthetics lack the flesh for it."
	psi_point_cost = 1

	var/list/creatures = list() // Who we can talk to
	for(var/mob/living/carbon/human/h in world) // Check every players in the game
		if(!h.species?.reagent_tag != IS_SYNTHETIC && !h.get_core_implant(/obj/item/implant/core_implant/cruciform) && !h.is_mannequin) // Can't talk to robots or people with cruciforms or mannequins
			creatures += h // Add the player to the list we can talk to
	var/mob/living/carbon/human/target = input("Who do you want to project your mind to ?") as null|anything in creatures
	if (isnull(target))
		return

	if(owner.stats.getPerk(PERK_PSI_ATTUNEMENT))
		to_chat(owner, "Your psionic attunement allows you to bypass fully using your essence.")
		psi_point_cost = 0

	if(pay_power_cost(psi_point_cost))
		var/say = sanitize(input("What do you wish to say"))
		if(target.psi_blocking >= 10)
			owner.stun_effect_act(0, target.psi_blocking * 5, BP_HEAD)
			owner.weakened = target.psi_blocking
			usr.show_message(SPAN_DANGER("Your head pulsates with pain as your mind bashes against an unbreakable barrier!"))
		else
			target.show_message("\blue <b><font size='3px'> You hear [usr.real_name]'s voice: [say] </font></b>")
			usr.show_message("\blue You project your mind into [target.real_name]: [say]")
			log_say("[key_name(usr)] sent a telepathic message to [key_name(target)]: [say]")
			for(var/mob/observer/ghost/G in world)
				G.show_message("<i>Telepathic message from <b>[owner]</b> to <b>[target]</b>: [say]</i>")

