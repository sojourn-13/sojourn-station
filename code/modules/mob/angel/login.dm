/mob/observer/eye/angel/Login()
	..()
/* Soj Edit, for some reasont this makes issues
	. = ..()
	if(!. || !client)
		return FALSE
*/
	visualnet.updateVisibility(owner, 0)
	visualnet.visibility(src)
	update_see_static_mobs()
