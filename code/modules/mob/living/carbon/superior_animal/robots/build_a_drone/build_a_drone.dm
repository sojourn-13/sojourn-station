// This file is for custom drones built using the build_a_drone.dmi file.
/mob/living/carbon/superior_animal/robot/custom_drone
	name = "Custom Drone"
	desc = "A custom-built drone. They come in a variety of color and equipment."
	icon = 'icons/mob/build_a_drone.dmi'
	icon_state = "drone_st"
	cleaning = FALSE

	// Vars that determine the parts used for the sprite.
	var/chassis = "" // The chassis of the drone.
	var/radio = "" // The radio of the drone.
	var/shell = "" // The shell of the drone.
	var/marks = "" // Marks of the drone.
	var/screen = "" // The screen of the drone.
	var/right_tool = "" // The tool/weapon on the right side
	var/left_tool = "" // The tool/weapon on the left side
	var/scanner = "" // The scanner on the drone

	// Different from the right/left_tools, those vars are for the type of weapon, which determine its attacks.
	var/right_weapon_type
	var/left_weapon_type

/mob/living/carbon/superior_animal/robot/custom_drone/New()
	..()

/mob/living/carbon/superior_animal/robot/custom_drone/update_icon()
	cut_overlays()
	icon_state = "[chassis]"
	add_overlay("[radio]")
	add_overlay("[shell]")
	add_overlay("[marks]")
	add_overlay("[screen]")
	add_overlay("[scanner]")
	add_overlay("[right_tool]")
	add_overlay("[left_tool]")
	return TRUE

/mob/living/carbon/superior_animal/robot/custom_drone/proc/customize(_chassis, _radio, _shell, _marks, _screen, _scanner, _right_weapon_type, _left_weapon_type, _right_tool, _left_tool)
	if(!_chassis) // We only check if the chassis is null because it's the base icon. Anything else that is missing in on the coder's fault.
		chassis = "drone_st"
	else
		chassis = _chassis
	radio = _radio
	shell = _shell
	marks = _marks
	screen = _screen
	scanner = _scanner
	right_weapon_type = _right_weapon_type
	left_weapon_type = _left_weapon_type
	right_tool = _right_tool
	left_tool = _left_tool
	update_icon()
	return TRUE
