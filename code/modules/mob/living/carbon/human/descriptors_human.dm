/datum/mob_descriptor/height
	var/name = "height"
	var/list/standalone_value_descriptors = list(
		"very short",
		"short",
		"of average height",
		"tall",
		"very tall"
		)
	var/comparative_value_descriptor_equivalent = "around the same height as you"
	var/list/comparative_value_descriptors_smaller = list(
		"slightly shorter than you",
		"shorter than you",
		"much shorter than you",
		"tiny and insignificant next to you"
		)
	var/list/comparative_value_descriptors_larger = list(
		"slightly taller than you",
		"taller than you",
		"much taller than you",
		"towering over you"
		)
	var/scale_effect

/datum/mob_descriptor/build
	var/name = "build"
	var/comparative_value_descriptor_equivalent = "around the same build as you"
	var/list/standalone_value_descriptors = list(
		"rail thin",
		"thin",
		"of average build",
		"well-built",
		"heavily built"
		)
	var/list/comparative_value_descriptors_smaller = list(
		"a bit smaller in build than you",
		"smaller in build than you",
		"much smaller in build than you",
		"dwarfed by your bulk"
		)
	var/list/comparative_value_descriptors_larger = list(
		"slightly larger than you in build",
		"built larger than you",
		"built much larger than you",
		"dwarfing you"
		)
