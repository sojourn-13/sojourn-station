/*
	Powers contained here:
	Penance: Deals large amounts of harmless pain to a target disciple
	//Obey: Second step of a two-part process to enslave a disciple with an Obey module
	Succour: Heals a target disciple within arms reach
	Knowledge: Checks remaining telecrystals (Inquisitor also has a contractor uplink)
	Bounty: Calls up the uplink to order supplies
*/

/datum/ritual/cruciform/inquisitor
	name = "inquisitor"
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Inquisitor"
	power = 30

/datum/ritual/targeted/cruciform/inquisitor
	name = "inquisitor targeted"
	implant_type = /obj/item/implant/core_implant/cruciform
	category = "Inquisitor"
	power = 30

/*
	Obey
	Goes with obey module, disabled for now
*/

/*
/datum/ritual/cruciform/inquisitor/obey
	name = "Obey"
	phrase = "Sicut dilexit me Pater et ego dilexi, vos manete in dilectione mea"
	desc = "Bound believer to your will."

/datum/ritual/cruciform/inquisitor/obey/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/obj/item/implant/core_implant/CI = get_implant_from_victim(user, /obj/item/implant/core_implant/cruciform)

	if(!CI || !CI.wearer || !ishuman(CI.wearer) || !CI.active)

		fail("Cruciform not found",user,C)
		return FALSE

	if(CI.get_module(CRUCIFORM_OBEY))
		fail("The target is already obeying.",user,C)
		return FALSE

	var/datum/core_module/activatable/cruciform/obey_activator/OA = CI.get_module(CRUCIFORM_OBEY_ACTIVATOR)

	if(!OA)
		fail("Target must have obey upgrade inside his cruciform.",user,C)
		return FALSE

	OA.activate()

	return TRUE
*/


/*
/datum/ritual/cruciform/inquisitor/check_telecrystals
	name = "Knowledge"
	phrase = "Cor sapientis quaerit doctrinam, et os stultorum pascetur inperitia"
	desc = "Find out the limits of your power, how much telecrystals you have now."
	power = 5

/datum/ritual/cruciform/inquisitor/check_telecrystals/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C,list/targets)
	var/datum/core_module/cruciform/uplink/I = C.get_module(CRUCIFORM_UPLINK)

	if(I && I.uplink)
		I.telecrystals = I.uplink.uses
		to_chat(user, "<span class='info'>You have [I.telecrystals] telecrystals.</span>")
		return FALSE
	else
		to_chat(user, "<span class='info'>You have no uplink.</span>")
		return FALSE
*/

/datum/ritual/cruciform/inquisitor/brotherhood
	name = "Reveal the Faithful" //Distinct name so the other one still appears on Crusader lists
	phrase = "Ita multi unum corpus sumus in Christo singuli autem alter alterius membra."
	desc = "Reveals other disciples to speaker."


/datum/ritual/cruciform/inquisitor/brotherhood/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C)
	var/datum/core_module/cruciform/neotheologyhud/hud_module = C.get_module(/datum/core_module/cruciform/neotheologyhud)
	if(hud_module)
		C.remove_module(hud_module)
	else
		C.add_module(new /datum/core_module/cruciform/neotheologyhud)
	return TRUE


/datum/ritual/cruciform/inquisitor/search
	name = "Inquisitor's Query" //This is for you, Trilby. Without you insisting I name something this, I wouldn't have thought to port this litany from Eris
	phrase = "Ut ostenderet viam filio suo."
	desc = "Find the location of disciple."
	success_message = "Your prayers have been heard."
	fail_message = "Your prayers have not been answered."
	power = 25

/datum/ritual/cruciform/inquisitor/search/perform(mob/living/carbon/human/user, obj/item/implant/core_implant/C, list/targets)
	var/list/OBJS = get_front(user)

	var/obj/machinery/power/eotp/EOTP = locate(/obj/machinery/power/eotp) in OBJS
	if(!EOTP)
		fail("You must be in front of the Will of the Protector.", user, C)
		return FALSE

	var/mob/living/carbon/human/H = pick_disciple_global(user, TRUE)
	if (!H)
		return
	var/datum/gps_data/gps = new /datum/gps_data(H)
	var/datum/coords/coords = gps.get_coords()
	var/area/t = get_area(H)
	log_game("[key_name(user)] locates [H] in [t] using a Search litany.")
	to_chat(user, span_info("[H], registered disciple of the Absolute, is currently at coordinates [coords.x_pos]:[coords.y_pos]:[coords.z_pos] in [t.name]."))
	return TRUE

