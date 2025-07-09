//temporary visual effects
/obj/effect/temp_visual/text
	duration = 20 //in deciseconds
	randomdir = FALSE
	var/txt_color = "#B134EB"  // Kinda light blueish red
	var/txt_size = 7
	var/txt_bx_wth = 94
	var/txt_frcd = FALSE
	var/txt = "John Text"

/obj/effect/temp_visual/text/Initialize(mapload, set_dir)
	if(set_dir)
		dir = set_dir

	// Do the thing!
	create_text_overlay(target = src, text = txt)

	. = ..()

// What a horrible proc.
/obj/effect/temp_visual/text/proc/create_text_overlay(atom/target, text)
	var/obj/effect/rotating_text_overlay = new()

	// RNG angle, typically looks bad, do to being bad
	var/angle = rand(-60, 60)

	//override the rng for a fixed one
	if(txt_frcd)
		angle = txt_frcd

	//Im not really good at making sytles so this is the best i got
	var/style = "font-family: 'Small Fonts'; font-size: [txt_size]px; color: [txt_color]; -dm-text-outline: 1px black;"

	rotating_text_overlay.maptext_width = txt_bx_wth
	rotating_text_overlay.maptext = "<span style=\"[style]\">[text]</span>"

	// Spin to win!
	rotating_text_overlay.transform = matrix(angle, MATRIX_ROTATE)

	// Add the thing to the thing
	target.overlays += rotating_text_overlay

/obj/effect/temp_visual/text/laz_box
	duration = 35 //in deciseconds
	randomdir = FALSE
	txt_color = "#A77D02"  // Gold-ish yellow
	txt = ""
