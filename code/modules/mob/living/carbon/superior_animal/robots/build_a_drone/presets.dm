// Build-a-drone presets, for when people want to spawn a specific type without manually messing with the build-a-drone creator.

// Greyson/Onestar preset
/mob/living/carbon/superior_animal/robot/custom_drone/greyson/New()
	..()
	name = "Greyson Drone"
	faction = "greyson"
	customize("drone_os", "radio_os", "shell_os", "marks_os", "screen_os", "tool_scanner_os", TOOL_LASER, TOOL_FLAMER, "tool_laser_os", "tool_flamer_os")
	colony_friend = FALSE
	friendly_to_colony = FALSE
