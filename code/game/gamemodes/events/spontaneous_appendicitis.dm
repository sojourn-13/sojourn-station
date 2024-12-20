/*
	Disabled for now, baymed is coming.

	Possible future todo: Add a random (not-viral) disease event for stuff like this with a bigger content pool
*/

/datum/storyevent/spontaneous_appendicitis
	id = "spontaneous_appendicitis"
	name = "spontaneous appendicitis"


	event_type = /datum/event/spontaneous_appendicitis
	event_pools = list(EVENT_LEVEL_MAJOR = POOL_THRESHOLD_MAJOR) //Someone needs to get surgery on this!!!

	tags = list(TAG_NEGATIVE)

	ocurrences_max = 1 //typically requires a medical doctor to handle having it trigger more then this is just annoying


/datum/event/spontaneous_appendicitis/start()
	var/success = FALSE
	for(var/mob/living/carbon/human/H in shuffle(GLOB.living_mob_list))
		if(H.client && H.stat != DEAD)
			var/obj/item/organ/internal/appendix/A = H.random_organ_by_process(OP_APPENDIX)
			if(!istype(A) || A.inflamed)
				continue
			A.inflamed = 1
			success = TRUE
			A.update_icon()
			break
	if(!success)
		log_and_message_admins("Spontaneous appendicitis failed to fine a vaild target!")

