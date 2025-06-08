//temporary visual effects
/obj/effect/temp_visual/text
	duration = 20 //in deciseconds
	randomdir = FALSE
	var/txt_color = "#00008B"  // This is the blue color you want
	var/txt_size = 7

/obj/effect/temp_visual/text/Initialize(mapload, set_dir)
	if(set_dir)
		dir = set_dir

	// Do the thing!
	create_text_overlay(target = src, text = "candy candy candy")

	. = ..()

// What a horrible proc.
/obj/effect/temp_visual/text/proc/create_text_overlay(atom/target, text)
	var/obj/effect/rotating_text_overlay = new()

	// RNG rotation, typically looks bad, do to being bad
	var/angle = rand(0, 360)

	// Set up the style for the text
	var/style = "font-family: 'Small Fonts'; font-size: [txt_size]px; color: [txt_color]; -dm-text-outline: 1px black"  // Properly format the color
	rotating_text_overlay.maptext_width = 64
	rotating_text_overlay.maptext = "<span style='[style]'>[text]</span>"
	//Spin to win
	rotating_text_overlay.transform = matrix(angle, MATRIX_ROTATE)

	// Givth overlay
	target.overlays += rotating_text_overlay
