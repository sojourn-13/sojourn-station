/area
	luminosity           = TRUE
	var/dynamic_lighting = TRUE
	var/is_forest = FALSE

/area/New()
	. = ..()

	if(dynamic_lighting)
		luminosity = FALSE
