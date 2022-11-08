//Many thanks to Jamini/Occulus-Eris for coding and bug testing/improving this stat via cilent system

/datum/preferences
	var/BIOMOD = 0
	var/COGMOD = 0
	var/MECMOD = 0
	var/ROBMOD = 0
	var/TGHMOD = 0
	var/VIGMOD = 0
	var/VIVMOD = 0
	var/ANAMOD = 0

/datum/category_item/player_setup_item/background/education
	name = "Skills"
	sort_order = 7

/datum/category_item/player_setup_item/background/education/load_character(var/savefile/S)
	from_file(S["BIOMOD"],pref.BIOMOD)
	from_file(S["COGMOD"],pref.COGMOD)
	from_file(S["MECMOD"],pref.MECMOD)
	from_file(S["ROBMOD"],pref.ROBMOD)
	from_file(S["TGHMOD"],pref.TGHMOD)
	from_file(S["VIGMOD"],pref.VIGMOD)
	from_file(S["VIVMOD"],pref.VIVMOD)
	from_file(S["ANAMOD"],pref.ANAMOD)

/datum/category_item/player_setup_item/background/education/save_character(var/savefile/S)
	to_file(S["BIOMOD"],pref.BIOMOD)
	to_file(S["COGMOD"],pref.COGMOD)
	to_file(S["MECMOD"],pref.MECMOD)
	to_file(S["ROBMOD"],pref.ROBMOD)
	to_file(S["TGHMOD"],pref.TGHMOD)
	to_file(S["VIGMOD"],pref.VIGMOD)
	to_file(S["VIVMOD"],pref.VIVMOD)
	to_file(S["ANAMOD"],pref.ANAMOD)

/datum/category_item/player_setup_item/background/education/sanitize_character()
	pref.BIOMOD             = sanitize_integer(pref.BIOMOD, -10, 15, initial(pref.BIOMOD))
	pref.COGMOD             = sanitize_integer(pref.COGMOD, -10, 15, initial(pref.COGMOD))
	pref.MECMOD             = sanitize_integer(pref.MECMOD, -10, 15, initial(pref.MECMOD))
	pref.ROBMOD             = sanitize_integer(pref.ROBMOD, -10, 15, initial(pref.ROBMOD))
	pref.TGHMOD             = sanitize_integer(pref.TGHMOD, -10, 15, initial(pref.TGHMOD))
	pref.VIGMOD             = sanitize_integer(pref.VIGMOD, -10, 15, initial(pref.VIGMOD))
	pref.VIVMOD             = sanitize_integer(pref.VIVMOD, -10, 15, initial(pref.VIVMOD))
	pref.ANAMOD             = sanitize_integer(pref.ANAMOD, -10, 15, initial(pref.ANAMOD))
	if(calculatetotalpoints() > 15)
		pref.BIOMOD = 0
		pref.COGMOD = 0
		pref.MECMOD = 0
		pref.ROBMOD = 0
		pref.TGHMOD = 0
		pref.VIGMOD = 0
		pref.VIVMOD = 0
		pref.ANAMOD = 0

/datum/category_item/player_setup_item/background/education/content(var/mob/user)
	. = list()
	. += "<br/><b>Skills</b>:<br/>"
	. += "Biology: <a href='?src=\ref[src];biomod=1'>[pref.BIOMOD]</a><br>"
	. += "Cognition: <a href='?src=\ref[src];cogmod=1'>[pref.COGMOD]</a><br>"
	. += "Mechanical: <a href='?src=\ref[src];mecmod=1'>[pref.MECMOD]</a><br>"
	. += "Robustness:  <a href='?src=\ref[src];robmod=1'>[pref.ROBMOD]</a><br>"
	. += "Toughness:  <a href='?src=\ref[src];tghmod=1'>[pref.TGHMOD]</a><br>"
	. += "Vigilance:  <a href='?src=\ref[src];vigmod=1'>[pref.VIGMOD]</a><br>"
	. += "Vivification:  <a href='?src=\ref[src];vivmod=1'>[pref.VIVMOD]</a><br>"
	. += "Anatomy:  <a href='?src=\ref[src];anamod=1'>[pref.ANAMOD]</a><br>"
	. += "<br/>"
	. += "You have used [pref.BIOMOD + round(pref.COGMOD/2) + pref.MECMOD + pref.ROBMOD + pref.TGHMOD + pref.VIGMOD + pref.VIVMOD  + round(pref.ANAMOD*5)] / 15 skill points"
	. = jointext(.,null)

/datum/category_item/player_setup_item/background/education/proc/calculatetotalpoints()
	return (pref.BIOMOD + round(pref.COGMOD/2) + pref.MECMOD + pref.ROBMOD + pref.TGHMOD + pref.VIGMOD + pref.VIVMOD + round(pref.ANAMOD*5))

/datum/category_item/player_setup_item/background/education/OnTopic(var/href,var/list/href_list, var/mob/user)
	if(href_list["biomod"])
		var/new_bio = 0
		new_bio = input(user, "Enter a value between -10 and 15 for your biology", CHARACTER_PREFERENCE_INPUT_TITLE, pref.BIOMOD) as num
		if(CanUseTopic(user))
			var/old_bio = pref.BIOMOD
			pref.BIOMOD = max(min(round(new_bio), 15), -10)
			if(calculatetotalpoints() > 15)
				pref.BIOMOD = old_bio
			return TOPIC_REFRESH

	else if(href_list["cogmod"])
		var/new_cog = 0
		new_cog = input(user, "Enter a value between -10 and 15 for your cognition. (Cognition 50% the cost of other stats).", CHARACTER_PREFERENCE_INPUT_TITLE, pref.COGMOD) as num
		if(CanUseTopic(user))
			var/old_cog = pref.COGMOD
			pref.COGMOD = max(min(round(new_cog),15),-10)
			if(calculatetotalpoints() > 15)
				pref.COGMOD = old_cog
			return TOPIC_REFRESH

	else if(href_list["mecmod"])
		var/new_mec = 0
		new_mec = input(user, "Enter a value between -10 and 15 for your mechanical.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.MECMOD) as num
		if(CanUseTopic(user))
			var/old_mec = pref.MECMOD
			pref.MECMOD = max(min(round(new_mec), 15), -10)
			if(calculatetotalpoints() > 15)
				pref.MECMOD = old_mec
			return TOPIC_REFRESH

	else if(href_list["robmod"])
		var/new_rob = 0
		new_rob = input(user, "Enter a value between -10 and 15 for your robustness.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ROBMOD) as num
		if(CanUseTopic(user))
			var/old_rob = pref.ROBMOD
			pref.ROBMOD = max(min(round(new_rob), 15), -10)
			if(calculatetotalpoints() > 15)
				pref.ROBMOD = old_rob
			return TOPIC_REFRESH

	else if(href_list["tghmod"])
		var/new_tgh = 0
		new_tgh = input(user, "Enter a value between -10 and 15 for your toughness.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.TGHMOD) as num
		if(CanUseTopic(user))
			var/old_tgh = pref.TGHMOD
			pref.TGHMOD = max(min(round(new_tgh), 15), -10)
			if(calculatetotalpoints() > 15)
				pref.TGHMOD = old_tgh
			return TOPIC_REFRESH

	else if(href_list["vigmod"])
		var/new_vig = 0
		new_vig = input(user, "Enter a value between -10 and 15 for your vigilance.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.VIGMOD) as num
		if(CanUseTopic(user))
			var/old_vig = pref.VIGMOD
			pref.VIGMOD = max(min(round(new_vig), 15), -10)
			if(calculatetotalpoints() > 15)
				pref.VIGMOD = old_vig
			return TOPIC_REFRESH

	else if(href_list["vivmod"])
		var/new_viv = 0
		new_viv = input(user, "Enter a value between -10 and 15 for your vivification.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.VIVMOD) as num
		if(CanUseTopic(user))
			var/old_viv = pref.VIVMOD
			pref.VIVMOD = max(min(round(new_viv), 15), -10)
			if(calculatetotalpoints() > 15)
				pref.VIVMOD = old_viv
			return TOPIC_REFRESH

	else if(href_list["anamod"])
		var/new_ana = 0
		new_ana = input(user, "Enter a value between -3 and 5 for your anatomy  (Anatomy 500% the cost of other stats).", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ANAMOD) as num
		if(CanUseTopic(user))
			var/old_ana = pref.ANAMOD
			pref.ANAMOD = max(min(round(new_ana), 5), -3)
			if(calculatetotalpoints() > 15)
				pref.ANAMOD = old_ana
			return TOPIC_REFRESH

	return ..()