/*
	Radiation storm is a really severe event that forces everyone to flee into maintenance or a similar
	shielded area. Anyone caught outside a shielded area will recieve lethal doses of radiation,
	and will die without medical attention

*/

/datum/storyevent/mail_overflow
	id = "mail_overflow"
	name = "mail call"

	weight = 0.25

	event_type = /datum/event/mail_overflow
	event_pools = list(EVENT_LEVEL_MUNDANE = POOL_THRESHOLD_MUNDANE)

	tags = list(TAG_POSITIVE)

/datum/event/mail_overflow/announce()
	command_announcement.Announce("A large amount of mail is backed up in the lower colony. Please handle some of it for us.", "LLS: Mail Overflow Office Mannigment Unit Captain Rozland")

/datum/event/mail_overflow
	startWhen	= 10
	endWhen		= 30

/datum/event/mail_overflow/start()
	var/mail_number = rand(3, 4)
	for(var/obj/structure/mailpile/MP in world)
		for(var/i = 0, i<mail_number, i++)
			new /obj/item/mail(MP.loc)

/datum/event/mail_overflow/end()
	var/mail_number = rand(2, 3)
	for(var/obj/structure/mailpile/MP in world)
		for(var/i = 0, i<mail_number, i++)
			new /obj/item/mail(MP.loc)