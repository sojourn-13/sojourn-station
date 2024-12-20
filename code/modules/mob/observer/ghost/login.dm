/mob/observer/ghost/Login()
	..()
/* Soj Edit, for some reasont this makes issues
	. = ..()
	if(!. || !client)
		return FALSE
*/

	if(isAdminGhostAI(src))
		has_unlimited_silicon_privilege = TRUE

	if (ghost_image)
		ghost_image.appearance = src
		ghost_image.appearance_flags = RESET_ALPHA | DEFAULT_APPEARANCE_FLAGS
	updateghostimages()

	if (client)
		client.CAN_MOVE_DIAGONALLY = TRUE
		client.showSmartTip()
