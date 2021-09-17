// This is where you write the powers for the nanogate implant/organ. Keep in mind that the points it use are only regenerated as the beginning of the shift.
/*
The user get a limited pool of points at shift start and has no way of regenerating or getting more points.
He can use those points to either build & upgrade a robot companion similar to a shroomling, upgrade themselves, upgrade their suit, or mix and match both option.
Each power can only be bought once.
Opifex have access to a better version with a bigger point pool and more available powers to buy.

The powers here are those that don't currently fit in any categories

List of powers in this page :
- Communication : A free power that allow the user to speak with anyone else that also got a nanogate.
- Nanite Swarm : A reusable power that allow the user to create a controllable nanite swarm.
*/

/obj/item/organ/internal/nanogate/proc/nanite_message()
	set category = "Nanogate Powers"
	set name = "Nanite Message"
	set desc = "Send a message to anyone who also has a nanogate."
	nano_point_cost = 0 // It's free.

	var/list/mob/living/carbon/human/target_list = list() // Who we can talk to
	for(var/mob/living/carbon/human/h in world) // Check every players in the game
		if(ishuman(h) && !h.is_mannequin)
			for(var/organ_inside in h.internal_organs)
				if(istype(organ_inside, /obj/item/organ/internal/nanogate))
					target_list += h // Add the player to the list we can talk to
					break
	target_list -= owner
	var/mob/target = input("Who do you want to project your mind to ?") as null|anything in target_list
	if (isnull(target))
		return

	if(pay_power_cost(nano_point_cost)) // Just in case we decide to not make it free.
		var/say = sanitize(input("What do you wish to say"))
		target.show_message("\blue <b><font size='3px'> You receive a message from [usr.real_name] : [say] </font><b>")
		usr.show_message("\blue You send a message to [target.real_name] : [say]")
		log_say("[key_name(usr)] sent a nanite message to [key_name(target)]: [say]")
		for(var/mob/observer/ghost/G in world)
			G.show_message("<i>Nanite message from <b>[owner]</b> to <b>[target]</b>: [say]</i>")

// Create a swarm of nanites. We're not removing the power once used because the swarm is fairly weak
/obj/item/organ/internal/nanogate/proc/nanite_swarm()
	set category = "Nanogate Powers"
	set name = "Nanite Swarm"
	set desc = "Create a small swarm of nanites that follow you around.."
	nano_point_cost = 1

	if(pay_power_cost(nano_point_cost))
		to_chat(owner, "You permanently assign some of your nanites to become a swarm.")
		var/mob/living/simple_animal/hostile/commanded/nanomachine/nanomachine = new /mob/living/simple_animal/hostile/commanded/nanomachine(owner.loc)
		nanomachine.master = owner
