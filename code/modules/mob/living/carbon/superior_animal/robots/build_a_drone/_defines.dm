// This is for the global/define stuff used by the build-a-drone stuff

// This is the different types of attack the build-a-drone can do.
#define TOOL_LASER 1 // Ranged Laser attack
#define TOOL_GUN 2 // Bullet Attack
#define TOOL_BOMB 3 // Explode on impact. Unavailable currently but possible.
#define TOOL_MEDIC 4 // Melee Chem attack
#define TOOL_FLAMER 5 // Ranged Fire Attack
#define TOOL_WELDER 6 // Melee Fire Attack


// Global lists of the drones parts
var/global/list/drone_chassis_options = list("Greyson Chassis" = "drone_os",
											"Standard Chassis" = "drone_st")

var/global/list/drone_radio_options = list(	"Greyson Radio" = "radio_os",
											"Standard Radio" = "radio_st")

var/global/list/drone_shell_options = list(	"Greyson Shell" = "shell_os",
											"Grey Shell" = "shell_grey",
											"White Shell" = "shell_white",
											"Medical White Shell" = "shell_medical_white",
											"Metal Shell" = "shell_metal",
											"Green Shell" = "shell_green",
											"Blue Shell" = "shell_blue",
											"Cyan Shell" = "shell_cyan",
											"Pink Shell" = "shell_pink",
											"Purple Shell" = "shell_purple",
											"Red Shell" = "shell_red",
											"Dark Orange Shell" = "shell_orange_1",
											"Orange Shell" = "shell_orange_2")

var/global/list/drone_marks_options = list(	"Greyson Markings" = "marks_os",
											"Greyson Medical Markings" = "marks_medic_os",
											"Green Markings" = "marks_green",
											"Green Medical Markings" = "marks_medic_green",
											"Blue Markings" = "marks_blue",
											"Blue Medical Markings" = "marks_medic_blue",
											"Cyan Markings" = "marks_cyan",
											"Cyan Medical Markings" = "marks_medic_cyan",
											"Pink Markings" = "marks_pink",
											"Pink Medical Markings" = "marks_medic_pink",
											"Purple Markings" = "marks_purple",
											"Purple Medical Markings" = "marks_medic_purple",
											"Red Markings" = "marks_red",
											"Red Medical Markings" = "marks_medic_red",
											"Dark Orange Markings" = "marks_orange_1",
											"Dark Orange Medical Markings" = "marks_medic_orange_1",
											"Orange Markings" = "marks_orange_2",
											"Orange Medical Markings" = "marks_medic_orange_2")

var/global/list/drone_screen_options = list("Greyson Screen" = "screen_os",
											"Red Greyson Screen" = "screen_os_red",
											"Yellow Screen" = "screen_yellow",
											"Cyan Screen" = "screen_cyan",
											"Red Screen" = "screen_red",
											"Pink Screen" = "screen_pink",
											"Green Screen" = "screen_green")

var/global/list/drone_scanner_options = list("Greyson Scanner" = "scanner_os",
											"Red Greyson Scanner" = "scanner_os_red",
											"Yellow Scanner" = "scanner_yellow",
											"Cyan Scanner" = "scanner_cyan",
											"Red Scanner" = "scanner_red",
											"Pink Scanner" = "scanner_pink",
											"Green Scanner" = "scanner_green")

var/global/list/drone_right_weapon_type_options = list(	"Energy" = TOOL_LASER,
														"Ballistic" = TOOL_GUN)

var/global/list/drone_left_weapon_type_options = list(	"Syringe" = TOOL_MEDIC,
														"Flamer" = TOOL_FLAMER,
														"Welder" = TOOL_WELDER)

var/global/list/drone_laser_options = list(	"Greyson Laser" = "tool_laser_os",
											"Red Greyson Laser" = "tool_laser_os_red",
											"Yellow Laser" = "tool_laser_yellow",
											"Cyan Laser" = "tool_laser_cyan",
											"Red Laser" = "tool_laser_red",
											"Pink Laser" = "tool_laser_pink",
											"Green Laser" = "tool_laser_green")

var/global/list/drone_medic_options = list(	"Greyson Syringe" = "tool_medic_os",
											"Red Greyson Syringe" = "tool_medic_os_red",
											"Yellow Syringe" = "tool_medic_yellow",
											"Cyan Syringe" = "tool_medic_cyan",
											"Red Syringe" = "tool_medic_red",
											"Pink Syringe" = "tool_medic_pink",
											"Green Syringe" = "tool_medic_green")

var/global/list/drone_flamer_options = list("Greyson Flamer" = "tool_flamer_os",
											"Green Flamer" = "tool_flamer_green",
											"Blue Flamer" = "tool_flamer_blue",
											"Cyan Flamer" = "tool_flamer_cyan",
											"Pink Flamer" = "tool_flamer_pink",
											"Purple Flamer" = "tool_flamer_purple",
											"Red Flamer" = "tool_flamer_red",
											"Dark Orange Flamer" = "tool_flamer_orange_1",
											"Orange Flamer" = "tool_flamer_orange_2")

var/global/list/drone_gun_options = list(	"Greyson Gun" = "tool_mg_os",
											"Green Gun" = "tool_mg_green",
											"Blue Gun" = "tool_mg_blue",
											"Cyan Gun" = "tool_mg_cyan",
											"Pink Gun" = "tool_mg_pink",
											"Purple Gun" = "tool_mg_purple",
											"Red Gun" = "tool_mg_red",
											"Dark Orange Gun" = "tool_mg_orange_1",
											"Orange Gun" = "tool_mg_orange_2")

var/global/list/drone_welder_options = list("Greyson Welder" = "tool_welder_os",
											"Red Greyson Welder" = "tool_welder_os_red",
											"Green Yellow Welder" = "tool_welder_green_yellow",
											"Green Cyan Welder" = "tool_welder_green_cyan",
											"Green Red Welder" = "tool_welder_green_red",
											"Green Pink Welder" = "tool_welder_green_pink",
											"Green Green Welder" = "tool_welder_green_green",
											"Blue Yellow Welder" = "tool_welder_blue_yellow",
											"Blue Cyan Welder" = "tool_welder_blue_cyan",
											"Blue Red Welder" = "tool_welder_blue_red",
											"Blue Pink Welder" = "tool_welder_blue_pink",
											"Blue Green Welder" = "tool_welder_blue_green",
											"Cyan Yellow Welder" = "tool_welder_cyan_yellow",
											"Cyan Cyan Welder" = "tool_welder_cyan_cyan",
											"Cyan Red Welder" = "tool_welder_cyan_red",
											"Cyan Pink Welder" = "tool_welder_cyan_pink",
											"Cyan Green Welder" = "tool_welder_cyan_green",
											"Pink Yellow Welder" = "tool_welder_pink_yellow",
											"Pink Cyan Welder" = "tool_welder_pink_cyan",
											"Pink Red Welder" = "tool_welder_pink_red",
											"Pink Pink Welder" = "tool_welder_pink_pink",
											"Pink Green Welder" = "tool_welder_pink_green",
											"Purple Yellow Welder" = "tool_welder_purple_yellow",
											"Purple Cyan Welder" = "tool_welder_purple_cyan",
											"Purple Red Welder" = "tool_welder_purple_red",
											"Purple Pink Welder" = "tool_welder_purple_pink",
											"Purple Green Welder" = "tool_welder_purple_green",
											"Red Yellow Welder" = "tool_welder_red_yellow",
											"Red Cyan Welder" = "tool_welder_red_cyan",
											"Red Red Welder" = "tool_welder_red_red",
											"Red Pink Welder" = "tool_welder_red_pink",
											"Red Green Welder" = "tool_welder_red_green",
											"Dark Orange Yellow Welder" = "tool_welder_orange_1_yellow",
											"Dark Orange Cyan Welder" = "tool_welder_orange_1_cyan",
											"Dark Orange Red Welder" = "tool_welder_orange_1_red",
											"Dark Orange Pink Welder" = "tool_welder_orange_1_pink",
											"Dark Orange Green Welder" = "tool_welder_orange_1_green",
											"Orange Yellow Welder" = "tool_welder_orange_2_yellow",
											"Orange Cyan Welder" = "tool_welder_orange_2_cyan",
											"Orange Red Welder" = "tool_welder_orange_2_red",
											"Orange Pink Welder" = "tool_welder_orange_2_pink",
											"Orange Green Welder" = "tool_welder_orange_2_green")

/proc/build_a_drone(mob/user)
	if(user)
		usr = user

	var/chassis_choice = drone_chassis_options[input("Select the chassis of your drone ", "Chassis : ") as null | anything in drone_chassis_options]
	if(!chassis_choice) // We didn't chose a chassis, leave the proc.
		return FALSE

	var/radio_choice = drone_radio_options[input("Select the radio of your drone ", "Radio : ") as null | anything in drone_radio_options]
	if(!radio_choice) // We didn't chose a radio, leave the proc.
		return FALSE
	var/shell_choice = drone_shell_options[input("Select the color of the shell of your drone ", "Shell : ") as null | anything in drone_shell_options]
	if(!shell_choice) // We didn't chose a shell, leave the proc.
		return FALSE
	var/marks_choice = drone_marks_options[input("Select the markings of your drone ", "Markings : ") as null | anything in drone_marks_options]
	if(!marks_choice) // We didn't chose a marking, leave the proc.
		return FALSE
	var/screen_choice = drone_screen_options[input("Select the chassis of your drone ", "Chassis : ") as null | anything in drone_screen_options]
	if(!screen_choice) // We didn't chose a screen, leave the proc.
		return FALSE
	
	// Scanner and weapons are optional, and at this point they probably want to have the drone anyway instead of being a mistake.
	var/scanner_choice = drone_scanner_options[input("Select the chassis of your drone ", "Chassis : ") as null | anything in drone_scanner_options]
	var/right_weapon_type_choice = drone_right_weapon_type_options[input("Select the first weapon type of your drone ", "Right Weapon : ") as null | anything in drone_right_weapon_type_options]
	var/left_weapon_type_choice = drone_left_weapon_type_options[input("Select the second weapon type of your drone ", "Left Weapon : ") as null | anything in drone_left_weapon_type_options]
	var/right_tool_choice
	var/left_tool_choice
	var/name // The name of the bot

	switch(right_weapon_type_choice)
		if(TOOL_LASER)
			right_tool_choice = drone_laser_options[input("Select the energy weapon of your drone ", "Laser : ") as null | anything in drone_laser_options]
		if(TOOL_GUN)
			right_tool_choice = drone_gun_options[input("Select the ballistic weapon of your drone ", "Gun : ") as null | anything in drone_gun_options]

	if(right_weapon_type_choice && !right_tool_choice) // If we chose to have a weapon in the right slot, but didn't actually chose anything
		right_weapon_type_choice = null // Set it to null so that it doesn't have an invisible weapon.

	switch(left_weapon_type_choice)
		if(TOOL_MEDIC)
			left_tool_choice = drone_medic_options[input("Select the syringe of your drone ", "Syringe : ") as null | anything in drone_medic_options]
		if(TOOL_FLAMER)
			left_tool_choice = drone_flamer_options[input("Select the flamer of your drone ", "Flamer : ") as null | anything in drone_flamer_options]
		if(TOOL_WELDER)
			left_tool_choice = drone_welder_options[input("Select the welder of your drone ", "Welder : ") as null | anything in drone_welder_options]

	if(left_weapon_type_choice && !left_tool_choice) // If we chose to have a weapon in the left slot, but didn't actually chose anything
		left_weapon_type_choice = null // Set it to null so that it doesn't have an invisible weapon.

	name = input("Please enter the name of your drone.", "Name") as text
	if(!name)
		name = "Generic Drone"

	var/mob/living/carbon/superior_animal/robot/custom_drone/CD = new(usr.loc) // Spawn a new drone
	CD.customize(chassis_choice, radio_choice, shell_choice, marks_choice, screen_choice, scanner_choice, right_weapon_type_choice, left_weapon_type_choice, right_tool_choice, left_tool_choice) // Customize the drone's sprite
	CD.name = name
	CD.friends += usr
	return TRUE

mob/proc/mob_build_a_drone()
	return build_a_drone(usr)
