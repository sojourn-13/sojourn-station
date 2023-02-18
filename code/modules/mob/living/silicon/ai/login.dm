/mob/living/silicon/ai/Login()
	..()
/* Soj Edit, for some reasont this makes issues
	. = ..()
	if(!. || !client)
		return FALSE
*/

	regenerate_icons()

	if(stat != DEAD)
		for(var/obj/machinery/ai_status_display/O in GLOB.ai_status_display_list) //change status
			O.mode = 1
			O.emotion = "Neutral"
	src.view_core()

	client.CAN_MOVE_DIAGONALLY = TRUE