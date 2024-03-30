/datum/language/sonnet
	name = LANGUAGE_BLORP
	desc = "A peculiar tonal language used by the Aulvae charictarized by inclusion of aural elements only possible using their unique non-solid anatomy. Though often \
	chaotic and dissonant sounding, when spoken slowly one can almost hear the underlying music that the Aulvae claim is present."
	speech_verb = list("hums")
	ask_verb = list("chimes")
	exclaim_verb = list("sings")
	has_written_form = TRUE
	flags = RESTRICTED
	colour = "slime"
	key = "w"
	shorthand = "AS"
	partial_understanding = list(
		LANGUAGE_CULT = 30, //Another language with a deep connection to Amethyn that goes back who knows how many years.
		LANGUAGE_MARQUA = 40, //another ancient tonal language
	)
	space_chance = 10
	syllables = list(
		"blorb", "blurble", ,"blorp", "Ahh", "Ahhhh","aa","aaa","a", "Mmmmh!", "Wrrr", "ghp", "Oooo", "ooo", "oo", "qrr", "qss", "Wrrr", "vrr", "!", "?", "*",
		"rrr", "trr", "Trrrrrrl", "uuu", "A", "a", "R", "r", "U", "u", "M", "m", "L", "l", "E", "e", "N", "n"
	)
