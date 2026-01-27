//temporary visual effects
/obj/effect/temp_visual/text
	duration = 20 //in deciseconds
	randomdir = FALSE
	var/txt_color = "#B134EB"  // Kinda light blueish red
	var/txt_size = 7
	var/txt_bx_wth = 94
	var/txt_frcd = FALSE
	var/txt = "John Text"
	var/max_tilt = 60
	var/min_tilt = -60

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
	var/angle = rand(min_tilt, max_tilt)

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

/obj/effect/temp_visual/text/communal_judgment
	duration = 20 //in deciseconds
	randomdir = FALSE
	txt_color = "#A77D02"  // Gold-ish yellow
	txt = "Per Absolutum, iudicium tibi dabimus." //Through the Absolute, we will give you judgment.

/obj/effect/temp_visual/text/communal_judgment_divi
	duration = 20 //in deciseconds
	randomdir = FALSE
	txt_color = "#FFFDD0"  // Non eyebleed yellow
	txt = "Scutum robustum ero." //I will be a strong shield.

/obj/effect/temp_visual/text/communal_judgment_mono
	duration = 20 //in deciseconds
	randomdir = FALSE
	txt_color = "#FFFDD0"  // Non eyebleed yellow
	txt = "Dolorem feram." //I shall bear the pain

/obj/effect/temp_visual/text/communal_judgment_lemn
	duration = 20 //in deciseconds
	randomdir = FALSE
	txt_color = "#FFFDD0"  // Non eyebleed yellow
	txt = "Hoc iudicium non festinabitur." //This judgment will not be hastened.

/obj/effect/temp_visual/text/communal_judgment_fact
	duration = 20 //in deciseconds
	randomdir = FALSE
	txt_color = "#FFFDD0"  // Non eyebleed yellow
	txt = "Iudicium memoriae mandabo." //I will commit the judgment to memory.

/obj/effect/temp_visual/text/communal_judgment_tess
	duration = 20 //in deciseconds
	randomdir = FALSE
	txt_color = "#FFFDD0"  // Non eyebleed yellow
	txt = "Desperationem, dolorem, et mentes lamentantes iuratorum sanabo." //I will heal the despair, the pain, and the lamenting minds of the jurors.

//The best teacher :D
/obj/effect/temp_visual/text/fae_correction
	duration = 20 //in deciseconds
	randomdir = FALSE
	txt_color = "#D93FC4"  // Same as the flame
	txt = "Incorrect! Losen your grip!"
	max_tilt = 30
	min_tilt = -30

/obj/effect/temp_visual/text/fae_correction_ii
	duration = 30 //in deciseconds
	randomdir = FALSE
	txt_color = "#D93FC4"  // Same as the flame
	txt = "Don't use both hands, your from is all wrong! Correct it this insistence!"
	max_tilt = 30
	min_tilt = -30

/obj/effect/temp_visual/text/fae_correction_iii
	duration = 10 //in deciseconds
	randomdir = FALSE
	txt_color = "#D93FC4"  // Same as the flame
	txt = "Wrong Wrong Wrong! Your doing it all wrong!"
	max_tilt = 30
	min_tilt = -30

/obj/effect/temp_visual/text/fae_correction_iv
	duration = 10 //in deciseconds
	randomdir = FALSE
	txt_color = "#D93FC4"  // Same as the flame
	txt = "You haven't even done a quarter of what you're meant to do!"
	max_tilt = 30
	min_tilt = -30

/obj/effect/temp_visual/text/fae_correction_v
	duration = 10 //in deciseconds
	randomdir = FALSE
	txt_color = "#D93FC4"  // Same as the flame
	txt = "Shoot them! Pointblank fire! Aim for the head! What are you waiting for!?"
	max_tilt = 30
	min_tilt = -30

/obj/effect/temp_visual/text/fae_correction_vi
	duration = 10 //in deciseconds
	randomdir = FALSE
	txt_color = "#D93FC4"  // Same as the flame
	txt = "You incompident fool! SWING that rapier now! Fire now! Do anything useful!"
	max_tilt = 30
	min_tilt = -30

/obj/effect/temp_visual/text/fae_correction_vii
	duration = 10 //in deciseconds
	randomdir = FALSE
	txt_color = "#D93FC4"  // Same as the flame
	txt = "You failed to cut that things head off! Burn them to ashes now! Stab harder!"
	max_tilt = 30
	min_tilt = -30