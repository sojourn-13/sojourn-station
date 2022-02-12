// This is where you write the powers for the nanogate implant/organ. Keep in mind that the points it use are only regenerated as the beginning of the shift.
/*
The user get a limited pool of points at shift start and has no way of regenerating or getting more points.
He can use those points to either build & upgrade a robot companion similar to a shroomling, upgrade themselves, upgrade their suit, or mix and match both option.
Each power can only be bought once.
Opifex have access to a better version with a bigger point pool and more available powers to buy.

The powers here are those that don't currently fit in any categories

List of powers in this page :
- Communication : A free power that allow the user to speak with anyone else that also got a nanogate.
- Nanite Swarm : A reusable power that allow the user to create a controllable nanite swarm. // Commented out until we make the mob work in like 5 years
*/

var/global/datum/computer_file/data/email_account/service/nanogate/nano_mailer = null

/proc/setup_nanite_mailer()
	nano_mailer = new

/obj/item/organ/internal/nanogate/proc/nanite_antenna()
	set category = "Nanogate Powers"
	set name = "Nanogate Antenna (1)"
	set desc = "Turns the user's body into an antenna that allows them to send emails freely to other colonists."
	nano_point_cost = 1 // It's not free.
	if(pay_power_cost(nano_point_cost))
		verbs += /obj/item/organ/internal/nanogate/proc/nanite_message

		owner_verbs += /obj/item/organ/internal/nanogate/proc/nanite_message //Add to owner_verbs so it is removed properly.
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_antenna
		usr.show_message("\blue You feel a brief headache as nanobots form an antenna inside of you.")


/obj/item/organ/internal/nanogate/proc/nanite_message()
	set category = "Nanogate Powers"
	set name = "Nanite Email"
	set desc = "Send a message to anyone via email."
	nano_point_cost = 0 // It's free (once activated).

	var/list/mob/living/carbon/human/target_list = list() // Who we can talk to

	for(var/datum/computer_file/report/crew_record/record in GLOB.all_crew_records) // Check every email in the game
		target_list += record.get_email() // Add the email to the list we can talk to

	var/target = input("Who do you want to send a message to?") as null|anything in target_list
	if (isnull(target))
		return
	var/topic = sanitize(input("What do you wish the topic to be?"))
	var/say = sanitize(input("What do you wish to say?"))

	if(!topic)
		usr.show_message("\blue Your email must have a topic.")
	else if(!say)
		usr.show_message("\blue Your email must have a message.")
	else if(pay_power_cost(nano_point_cost)) // Just in case we decide to not make it free.

		//target.show_message("\blue <b><font size='3px'> You receive a message from [usr.real_name] : [say] </font><b>")

		var/datum/computer_file/data/email_message/message = new()
		message.title = topic
		message.stored_data = "INCOMING TRANSMISSION FROM [owner.real_name]:\n\n \
		MESSAGE: [say]\n\n \
		----------------------------\n \
		Sent via Nanogate Satellite Uplink\n\n"

		message.source = nano_mailer.login
		if(!nano_mailer.send_mail(target, message))
			usr.show_message("\blue Your attempt to send a message failed.")
		else
			usr.show_message("\blue You send a message to [target] : [say]")
			log_say("[key_name(usr)] sent a nanite message to [target]: [say]")
			for(var/mob/observer/ghost/G in world)
				G.show_message("<i>Nanite message from <b>[owner]</b> to <b>[target]</b>: [say]</i>")


/*
// Create a swarm of nanites. We're not removing the power once used because the swarm is fairly weak
/obj/item/organ/internal/nanogate/proc/nanite_swarm()
	set category = "Nanogate Powers"
	set name = "Nanite Swarm"
	set desc = "Create a small swarm of nanites that follow you around.."
	nano_point_cost = 1

	if(pay_power_cost(nano_point_cost))
		to_chat(owner, "You permanently assign some of your nanites to become a swarm.")
		var/mob/living/simple_animal/hostile/commanded/nanomachine/nanomachine = new /mob/living/simple_animal/hostile/commanded/nanomachine(owner.loc)
		nanomachine.master = owner*/
