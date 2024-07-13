/mob/living/silicon/robot/Login()
	..()
/* Soj Edit, for some reasont this makes issues
	. = ..()
	if(!. || !client)
		return FALSE
*/
	regenerate_icons()
	update_hud()
	show_laws(0)

	winset(src, null, "mainwindow.macro=borgmacro hotkey_toggle.is-checked=false input.focus=true")
	if(client.get_preference_value(/datum/client_preference/stay_in_hotkey_mode) == GLOB.PREF_YES)
		winset(client, null, "mainwindow.macro=borgmacro hotkey_toggle.is-checked=true mapwindow.map.focus=true")
	else
		winset(client, null, "mainwindow.macro=borgmacro hotkey_toggle.is-checked=false input.focus=true")

	// Forces synths to select an icon relevant to their module
	if(!icon_selected)
		choose_icon()
