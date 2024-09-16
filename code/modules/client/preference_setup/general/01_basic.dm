/datum/preferences
	var/gender = MALE							//physical gender of character (well duh)
	var/gender_identity = null
	var/age = 30								//age of character
	var/spawnpoint = "Cryogenic Storage" 		//where this character will spawn
	var/real_name								//our character's name
	var/be_random_name = 0						//whether we are a random name every round
	var/b_type = "A+"							//blood type (not-chooseable)
	var/disabilities = 0

	var/custom_species = "Human"
	var/species_aan = ""
	var/species_color = "#0000CC"

/datum/category_item/player_setup_item/physical/basic
	name = "Basic"
	sort_order = 1

/datum/category_item/player_setup_item/physical/basic/load_character(var/savefile/S)
	from_file(S["gender"],					pref.gender)
	from_file(S["gender_identity"],			pref.gender_identity)
	from_file(S["age"],						pref.age)
	from_file(S["b_type"],					pref.b_type)
	from_file(S["disabilities"], 			pref.disabilities)
	from_file(S["spawnpoint"],				pref.spawnpoint)
	from_file(S["real_name"],				pref.real_name)
	from_file(S["name_is_always_random"],	pref.be_random_name)
//	from_file(S["religion"],				pref.religion)

	from_file(S["species_aan"], pref.species_aan)
	from_file(S["custom_species"], pref.custom_species)
	from_file(S["species_color"], pref.species_color)

/datum/category_item/player_setup_item/physical/basic/save_character(var/savefile/S)
	to_file(S["gender"],					pref.gender)
	to_file(S["gender_identity"],			pref.gender_identity)
	to_file(S["age"],						pref.age)
	to_file(S["b_type"],					pref.b_type)
	to_file(S["disabilities"],				pref.disabilities)
	to_file(S["spawnpoint"],				pref.spawnpoint)
	to_file(S["real_name"],					pref.real_name)
	to_file(S["name_is_always_random"],		pref.be_random_name)
//	to_file(S["religion"],					pref.religion)

	to_file(S["species_aan"], pref.species_aan)
	to_file(S["custom_species"], pref.custom_species)
	to_file(S["species_color"], pref.species_color)

/datum/category_item/player_setup_item/physical/basic/sanitize_character()
	var/datum/species/S = all_species[pref.species ? pref.species : SPECIES_HUMAN]
	if(!S) S = all_species[SPECIES_HUMAN]
	if(S.obligate_name)
		pref.custom_species = S.name
		pref.species_aan = S.aan
		pref.species_color = S.light_color
	pref.age                = sanitize_integer(pref.age, S.min_age, S.max_age, initial(pref.age))
	pref.b_type				= sanitize_text(pref.b_type, initial(pref.b_type))
	pref.disabilities		= sanitize_integer(pref.disabilities, 0, 65535, initial(pref.disabilities))
	pref.gender             = sanitize_inlist(pref.gender, S.genders, pick(S.genders))
	if(pref.gender_identity != null && !(pref.gender_identity in GLOB.gender_datums)) pref.gender_identity = null;
	pref.spawnpoint         = sanitize_inlist(pref.spawnpoint, get_late_spawntypes(), initial(pref.spawnpoint))
	pref.be_random_name     = sanitize_integer(pref.be_random_name, 0, 1, initial(pref.be_random_name))
	pref.real_name				= sanitize_text(pref.real_name, random_name(pref.gender, pref.species))
//	if(!pref.religion)
//		pref.religion =    "None"
	pref.species_color		= iscolor(pref.species_color) ? pref.species_color : initial(pref.species_color)
	var/adjusted = FALSE
	var/RGB = ReadRGB(pref.species_color) //This shit exists because I have no better ideas on how to adjust colors.
	var/R = RGB[1]
	var/G = RGB[2]
	var/B = RGB[3]
	if(R+G+B > 191*3)
		var/totrgb = R+G+B
		totrgb /= 3
		R = R/totrgb*191
		G = G/totrgb*191
		B = B/totrgb*191
		adjusted = TRUE
	if(G > 191)
		R = R/G*191
		B = B/G*191
		G = G/G*191
		adjusted = TRUE
	if(adjusted)
		pref.species_color = rgb(R,G,B)

	pref.species_aan		= sanitize_inlist(pref.species_aan, list("", "n"), initial(pref.species_aan))
	pref.custom_species		= sanitize_text(pref.custom_species, "Human")
	// This is a bit noodly. If pref.cultural_info[TAG_CULTURE] is null, then we haven't finished loading/sanitizing, which means we might purge
	// numbers or w/e from someone's name by comparing them to the map default. So we just don't bother sanitizing at this point otherwise.
	/*
	if(pref.cultural_info[TAG_CULTURE])
		var/decl/cultural_info/check = SSculture.get_culture(pref.cultural_info[TAG_CULTURE])
		if(check)
			pref.real_name = check.sanitize_name(pref.real_name, pref.species)
			if(!pref.real_name)
				pref.real_name = random_name(pref.gender, pref.species)
	*/
/datum/category_item/player_setup_item/physical/basic/content()
	if(global.all_species[pref.species]?:obligate_name)
		pref.custom_species = global.all_species[pref.species]
	if ((pref.species == "Human") && (pref.custom_species in global.all_species))
		pref.custom_species = "Human"

	. = list()
	. += "<style>span.color_holder_box{display: inline-block; width: 20px; height: 8px; border:1px solid #000; padding: 0px;}</style>"
	. += "<span class='info' style='color:#0000cc;background-color:#ffffff;padding:5px;'> This is <b>[pref.real_name]</b>, <b><font color='[pref.species_color]'>a[pref.species_aan] [pref.custom_species]</font></b>!</span> <br>"
	. += "<b>Name:</b> "
	. += "<a href='?src=\ref[src];rename=1'><b>[pref.real_name]</b></a><br>"
	. += "<a href='?src=\ref[src];random_name=1'>Randomize Name</A><br>"
	. += "<a href='?src=\ref[src];always_random_name=1'>Always Random Name: [pref.be_random_name ? "Yes" : "No"]</a>"
	. += "<hr>"
	. += "<b>Species Name:</b> <a href='?src=\ref[src];species_aan=1'>A[pref.species_aan]</a><a href='?src=\ref[src];species_name=1'>[pref.custom_species]</a>"
	. += "<a href='?src=\ref[src];species_name_color=1'><span class='color_holder_box' style='background-color:[pref.species_color]'></span></a><br>"

	. += "<b>Sex:</b> <a href='?src=\ref[src];gender=1'>[gender2text(pref.gender)]</a><br>"
	. += "<b>Gender Identity:</b> <a href='?src=\ref[src];gender_identity=1'>[pref.gender_identity ? gender2text(pref.gender_identity) : "Default"]</a><br>"
	. += "<b>Age:</b> <a href='?src=\ref[src];age=1'>[pref.age]</a><br>"
	. += "<b>Blood Type:</b> <a href='?src=\ref[src];blood_type=1'>[pref.b_type]</a><br>"
	. += "<b>Needs Glasses:</b> <a href='?src=\ref[src];disabilities=[NEARSIGHTED]'><b>[pref.disabilities & NEARSIGHTED ? "Yes" : "No"]</b></a><br>"
	. += "<b>Spawn Point</b>: <a href='?src=\ref[src];spawnpoint=1'>[pref.spawnpoint]</a><br>"

	. = jointext(.,null)

/datum/category_item/player_setup_item/physical/basic/OnTopic(var/href,var/list/href_list, var/mob/user)
	var/datum/species/S = all_species[pref.species]
	pref.categoriesChanged = "Basic"

	if(href_list["rename"])
		var/raw_name = input(user, "Choose your character's name:", "Character Name", pref.real_name)  as text|null
		if (!isnull(raw_name) && CanUseTopic(user))
			var/new_name = sanitizeName(raw_name)
			if(new_name)
				pref.real_name = new_name
				return TOPIC_REFRESH
			else
				to_chat(user, SPAN_WARNING("Invalid name. Your name should be at least 2 and at most [MAX_NAME_LEN] characters long. It may only contain the characters A-Z, a-z, -, ' and ."))
				return TOPIC_NOACTION

	else if(href_list["random_name"])
		pref.real_name = random_name(pref.gender, pref.species)
		return TOPIC_REFRESH

	else if(href_list["always_random_name"])
		pref.be_random_name = !pref.be_random_name
		return TOPIC_REFRESH

	else if(href_list["gender"])
		var/new_gender = input(user, "Choose your character's gender:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.gender) as null|anything in S.genders
		S = all_species[pref.species]
		if(new_gender && CanUseTopic(user) && (new_gender in S.genders))
			pref.gender = new_gender
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["gender_identity"])
		var/new_gender = input(user, "Choose your character's gender identity:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.gender_identity ? pref.gender_identity : "Default") as null|anything in (list("Default" = "") + GLOB.gender_datums)
		if(new_gender && CanUseTopic(user) && (new_gender in (list("Default" = "") + GLOB.gender_datums)))
			if(new_gender == "Default")
				pref.gender_identity = pref.gender // This should stop "default" from defaulting into genderlessness.
			else
				pref.gender_identity = new_gender
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["age"])
		var/new_age = input(user, "Choose your character's age:\n([S.min_age]-[S.max_age])", CHARACTER_PREFERENCE_INPUT_TITLE, pref.age) as num|null
		if(new_age && CanUseTopic(user))
			pref.age = max(min(round(text2num(new_age)), S.max_age), S.min_age)
			//pref.skills_allocated = pref.sanitize_skills(pref.skills_allocated)		// The age may invalidate skill loadouts
			return TOPIC_REFRESH

	else if(href_list["blood_type"])
		var/new_b_type = input(user, "Choose your character's blood-type:", CHARACTER_PREFERENCE_INPUT_TITLE) as null|anything in valid_bloodtypes
		if(new_b_type && CanUseTopic(user))
			pref.b_type = new_b_type
			return TOPIC_REFRESH

	else if(href_list["disabilities"])
		var/disability_flag = text2num(href_list["disabilities"])
		pref.disabilities ^= disability_flag
		return TOPIC_REFRESH_UPDATE_PREVIEW

	else if(href_list["spawnpoint"])
		var/list/spawnkeys = list()
		for(var/spawntype in get_late_spawntypes())
			spawnkeys += spawntype
		var/choice = input(user, "Where would you like to spawn when late-joining?") as null|anything in spawnkeys
		if(!choice || !get_late_spawntypes()[choice] || !CanUseTopic(user))	return TOPIC_NOACTION
		pref.spawnpoint = choice
		return TOPIC_REFRESH

	else if(href_list["species_name"])
		if(global.all_species[pref.species]?:obligate_name)
			return TOPIC_NOACTION
		var/new_species_name = input(user, "Choose your character's species name. This is cosmetic.") as text|null
		if(CanUseTopic(user))
			new_species_name = sanitizeName(new_species_name)
			if(new_species_name && CanUseTopic(user))
				pref.custom_species = new_species_name
				return TOPIC_REFRESH
			else
				to_chat(user, SPAN_WARNING("Invalid species name. Either it's a single character, or more than [MAX_NAME_LEN] characters long. Aside from letters, it can only contain _, ' and ."))
				return TOPIC_NOACTION
	else if(href_list["species_aan"])
		if(global.all_species[pref.species]?:obligate_name)
			return TOPIC_NOACTION
		if(CanUseTopic(user))
			pref.species_aan = pref.species_aan == "n" ? "" : "n"
			return TOPIC_REFRESH
	else if(href_list["species_name_color"])
		if(global.all_species[pref.species]?:obligate_name)
			return TOPIC_NOACTION
		var/new_color = input(user, "Choose your species name's color. This should be shared with others using that species if you propagate it.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.species_color) as color|null
		if(new_color && CanUseTopic(user))
			var/adjusted = FALSE
			var/RGB = ReadRGB(new_color)
			var/R = RGB[1]
			var/G = RGB[2]
			var/B = RGB[3]
			if(R+G+B > 191*3)
				var/totrgb = R+G+B
				totrgb /= 3
				R = R/totrgb*191
				G = G/totrgb*191
				B = B/totrgb*191
				adjusted = TRUE
			if(G > 191)
				R = R/G*191
				B = B/G*191
				G = 191
				adjusted = TRUE
			if(adjusted)
				to_chat(user, SPAN_WARNING("Invalid custom species color. Your color is too bright for use against a white background and has been adjusted."))
				new_color = rgb(R, G, B)
			pref.species_color = new_color
			return TOPIC_REFRESH

	return ..()
