/*
//Cloning
/datum/ritual/cruciform/machines/resurrection
	name = "Resurrection"
	phrase = "Qui fuit, et crediderunt in me non morietur in aeternum"
	desc = "A ritual of formation of a new body in a speclially designed machine.  Deceased person's cruciform has to be placed on the scanner then a prayer is to be uttered over the apparatus."

/datum/ritual/cruciform/machines/resurrection/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/list/OBJS = get_front(user)

	var/obj/machinery/neotheology/cloner/pod = locate(/obj/machinery/neotheology/cloner) in OBJS

	if(!pod)
		fail("You fail to find any cloner here.", user, C)
		return FALSE

	if(pod.cloning)
		fail("Cloner is already cloning.", user, C)
		return FALSE

	if(pod.stat & NOPOWER)
		fail("Cloner is off.", user, C)
		return FALSE

	pod.start()
	return TRUE
*/

/*
/datum/ritual/cruciform/priest/reincarnation
	name = "Reincarnation"
	phrase = "Vetus moritur et onus hoc levaverit"
	desc = "A reunion of a spirit with it's new body, ritual of activation of a crucifrom, lying on the body. The process requires NeoTheology's special altar on which a body stripped of clothes is to be placed."

/datum/ritual/cruciform/priest/reincarnation/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/obj/item/implant/core_implant/cruciform/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform, FALSE)

	if(!CI)
		fail("There is no cruciform on this one", user, C)
		return FALSE

	var/datum/core_module/cruciform/cloning/data = CI.get_module(CRUCIFORM_CLONING)

	if(!CI.wearer)
		fail("Cruciform is not installed.", user, C)
		return FALSE

	if(!CI.activated)
		fail("This cruciform doesn't have soul inside.", user, C)
		return FALSE

	if(CI.active)
		fail("This cruciform already activated.", user, C)
		return FALSE

	if(CI.wearer.stat == DEAD)
		fail("Soul cannot move to dead body.", user, C)
		return FALSE

	var/datum/mind/MN = data.mind
	if(!istype(MN, /datum/mind))
		fail("Soul is lost.", user, C)
		return FALSE
	if(MN.active)
		if(data.ckey != ckey(MN.key))
			fail("Soul is lost.", user, C)
			return FALSE
	if(MN.current && MN.current.stat != DEAD)
		fail("Soul is lost.", user, C)
		return FALSE

	var/succ = CI.transfer_soul()

	if(!succ)
		fail("Soul transfer failed.", user, C)
		return FALSE


	return TRUE
*/


//cloner
/*
/datum/nt_blueprint/machinery/cloner
	name = "Cloner Pod"
	build_path = /obj/machinery/neotheology/cloner
	materials = list(
		/obj/item/stack/material/glass = 15,
		/obj/item/stack/material/plasteel = 10,
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/glass/reinforced = 10,
	)
	build_time = 10 SECONDS

/datum/nt_blueprint/machinery/reader
	name = "Cruciform Reader"
	build_path = /obj/machinery/neotheology/reader
	materials = list(
		/obj/item/stack/material/steel = 10,
		/obj/item/stack/material/plasteel = 5,
		/obj/item/stack/material/silver = 10,
		/CRUCIFORM_TYPE = 1
	)
	build_time = 10 SECONDS

/datum/nt_blueprint/machinery/biocan
	name = "Biomass tank"
	build_path = /obj/machinery/neotheology/biomass_container
	materials = list(
		/obj/item/stack/material/gold = 5,
		/obj/item/stack/material/plasteel = 5,
		/obj/structure/reagent_dispensers/biomatter/large = 1
	)
	build_time = 8 SECONDS
*/
