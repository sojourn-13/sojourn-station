
GLOBAL_LIST_EMPTY(gender_datums)

/hook/startup/proc/populate_gender_datum_list()
	for(var/type in typesof(/datum/gender))
		var/datum/gender/G = new type
		GLOB.gender_datums[G.key] = G
	return 1

/datum/gender
	var/key  = "plural"

	var/He   = "They"
	var/he   = "they"
	var/His  = "Their"
	var/his  = "their"
	var/him  = "them"
	var/has  = "have"
	var/is   = "are"
	var/does = "do"

/datum/gender/proc/word(var/position)
	switch(position)
		if("He","She","It","They")		return He
		if("he","she","it","they")		return he
		if("His","Her","Its","Their")	return His
		if("his","her","its","their")	return his
		if("him","her","it","them")		return him

		if("has","have")				return has
		if("is","are")					return is
		if("does","do")					return does
		if("gender")					return key
		if("Gender")					return gender2text(key)
		else
			CRASH("Genderword proc called with invalid position. ([position])")

/datum/gender/male
	key  = "male"

	He   = "He"
	he   = "he"
	His  = "His"
	his  = "his"
	him  = "him"
	has  = "has"
	is   = "is"
	does = "does"

/datum/gender/female
	key  = "female"

	He   = "She"
	he   = "she"
	His  = "Her"
	his  = "her"
	him  = "her"
	has  = "has"
	is   = "is"
	does = "does"

/datum/gender/neuter
	key = "neuter"

	He   = "It"
	he   = "it"
	His  = "Its"
	his  = "its"
	him  = "it"
	has  = "has"
	is   = "is"
	does = "does"
