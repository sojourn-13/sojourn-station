/obj/random/prothesis
	name = "random prosthesis"
	icon_state = "meds-green"

/obj/random/prothesis/one_star
	name = "random one star prosthesis"

/obj/random/prothesis/one_star/item_to_spawn()
	return pick(list(
	/obj/item/organ/external/robotic/one_star/l_arm,\
	/obj/item/organ/external/robotic/one_star/r_arm,\
	/obj/item/organ/external/robotic/one_star/l_leg,\
	/obj/item/organ/external/robotic/one_star/r_leg
	))

/obj/random/prothesis/junk_tech
	name = "random junk tech prosthesis"
	icon_state = "meds-green"

/obj/random/prothesis/junk_tech/item_to_spawn()
	return pick(list(
	/obj/item/organ/external/robotic/junktech/l_arm,\
	/obj/item/organ/external/robotic/junktech/r_arm,\
	/obj/item/organ/external/robotic/junktech/l_leg,\
	/obj/item/organ/external/robotic/junktech/r_leg
	))

/obj/random/prothesis/combat_prosthesis
	name = "random advanced prosthesis (has excelsior spawns)"
	icon_state = "meds-green"

/obj/random/prothesis/combat_prosthesis/item_to_spawn()
	return pick(list(
	/obj/item/organ/external/robotic/moebius/l_arm,\
	/obj/item/organ/external/robotic/moebius/r_arm,\
	/obj/item/organ/external/robotic/moebius/l_leg,\
	/obj/item/organ/external/robotic/moebius/r_leg,\

	/obj/item/organ/external/robotic/blackshield/l_arm,\
	/obj/item/organ/external/robotic/blackshield/r_arm,\
	/obj/item/organ/external/robotic/blackshield/l_leg,\
	/obj/item/organ/external/robotic/blackshield/r_leg,\

	/obj/item/organ/external/robotic/excelsior/l_arm,\
	/obj/item/organ/external/robotic/excelsior/r_arm,\
	/obj/item/organ/external/robotic/excelsior/l_leg,\
	/obj/item/organ/external/robotic/excelsior/r_leg
	))

/obj/random/prothesis/random_external_basic
	name = "random prosthesis"
	icon_state = "meds-green"

/obj/random/prothesis/junk_tech/item_to_spawn()
	return pick(list(
	/obj/item/organ/external/robotic/l_arm,\
	/obj/item/organ/external/robotic/r_arm,\
	/obj/item/organ/external/robotic/l_leg,\
	/obj/item/organ/external/robotic/r_leg
	))