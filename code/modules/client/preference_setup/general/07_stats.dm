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
	//Stat caps - STAT_VALUE_DEFAULT_MAXIMUM
	var/BIO_CAP = STAT_VALUE_DEFAULT_MAXIMUM
	var/COG_CAP = STAT_VALUE_DEFAULT_MAXIMUM
	var/MEC_CAP = STAT_VALUE_DEFAULT_MAXIMUM
	var/ROB_CAP = STAT_VALUE_DEFAULT_MAXIMUM
	var/TGH_CAP = STAT_VALUE_DEFAULT_MAXIMUM
	var/VIG_CAP = STAT_VALUE_DEFAULT_MAXIMUM
	var/VIV_CAP = STAT_VALUE_DEFAULT_MAXIMUM
	var/ANA_CAP = STAT_VALUE_DEFAULT_MAXIMUM

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

	from_file(S["BIO_CAP"],pref.BIO_CAP)
	from_file(S["COG_CAP"],pref.COG_CAP)
	from_file(S["MEC_CAP"],pref.MEC_CAP)
	from_file(S["ROB_CAP"],pref.ROB_CAP)
	from_file(S["TGH_CAP"],pref.TGH_CAP)
	from_file(S["VIG_CAP"],pref.VIG_CAP)
	from_file(S["VIV_CAP"],pref.VIV_CAP)
	from_file(S["ANA_CAP"],pref.ANA_CAP)

/datum/category_item/player_setup_item/background/education/save_character(var/savefile/S)
	to_file(S["BIOMOD"],pref.BIOMOD)
	to_file(S["COGMOD"],pref.COGMOD)
	to_file(S["MECMOD"],pref.MECMOD)
	to_file(S["ROBMOD"],pref.ROBMOD)
	to_file(S["TGHMOD"],pref.TGHMOD)
	to_file(S["VIGMOD"],pref.VIGMOD)
	to_file(S["VIVMOD"],pref.VIVMOD)
	to_file(S["ANAMOD"],pref.ANAMOD)

	to_file(S["BIO_CAP"],pref.BIO_CAP)
	to_file(S["COG_CAP"],pref.COG_CAP)
	to_file(S["MEC_CAP"],pref.MEC_CAP)
	to_file(S["ROB_CAP"],pref.ROB_CAP)
	to_file(S["TGH_CAP"],pref.TGH_CAP)
	to_file(S["VIG_CAP"],pref.VIG_CAP)
	to_file(S["VIV_CAP"],pref.VIV_CAP)
	to_file(S["ANA_CAP"],pref.ANA_CAP)

/datum/category_item/player_setup_item/background/education/sanitize_character()
	pref.BIOMOD             = sanitize_integer(pref.BIOMOD, -10, 15, initial(pref.BIOMOD))
	pref.COGMOD             = sanitize_integer(pref.COGMOD, -10, 15, initial(pref.COGMOD))
	pref.MECMOD             = sanitize_integer(pref.MECMOD, -10, 15, initial(pref.MECMOD))
	pref.ROBMOD             = sanitize_integer(pref.ROBMOD, -10, 15, initial(pref.ROBMOD))
	pref.TGHMOD             = sanitize_integer(pref.TGHMOD, -10, 15, initial(pref.TGHMOD))
	pref.VIGMOD             = sanitize_integer(pref.VIGMOD, -10, 15, initial(pref.VIGMOD))
	pref.VIVMOD             = sanitize_integer(pref.VIVMOD, -10, 15, initial(pref.VIVMOD))
	pref.ANAMOD             = sanitize_integer(pref.ANAMOD, -10, 15, initial(pref.ANAMOD))

	pref.BIO_CAP            = sanitize_integer(pref.BIO_CAP, -30, STAT_VALUE_DEFAULT_MAXIMUM, initial(pref.BIO_CAP))
	pref.COG_CAP            = sanitize_integer(pref.COG_CAP, -30, STAT_VALUE_DEFAULT_MAXIMUM, initial(pref.COG_CAP))
	pref.MEC_CAP            = sanitize_integer(pref.MEC_CAP, -30, STAT_VALUE_DEFAULT_MAXIMUM, initial(pref.MEC_CAP))
	pref.ROB_CAP            = sanitize_integer(pref.ROB_CAP, -30, STAT_VALUE_DEFAULT_MAXIMUM, initial(pref.ROB_CAP))
	pref.TGH_CAP            = sanitize_integer(pref.TGH_CAP, -30, STAT_VALUE_DEFAULT_MAXIMUM, initial(pref.TGH_CAP))
	pref.VIG_CAP            = sanitize_integer(pref.VIG_CAP, -30, STAT_VALUE_DEFAULT_MAXIMUM, initial(pref.VIG_CAP))
	pref.VIV_CAP            = sanitize_integer(pref.VIV_CAP, -30, STAT_VALUE_DEFAULT_MAXIMUM, initial(pref.VIV_CAP))
	pref.ANA_CAP            = sanitize_integer(pref.ANA_CAP, 0,   STAT_VALUE_DEFAULT_MAXIMUM, initial(pref.ANA_CAP))

	if(calculatetotalpoints() > 15)
		pref.BIOMOD = 0
		pref.COGMOD = 0
		pref.MECMOD = 0
		pref.ROBMOD = 0
		pref.TGHMOD = 0
		pref.VIGMOD = 0
		pref.VIVMOD = 0
		pref.ANAMOD = 0

		pref.BIO_CAP = STAT_VALUE_DEFAULT_MAXIMUM
		pref.COG_CAP = STAT_VALUE_DEFAULT_MAXIMUM
		pref.MEC_CAP = STAT_VALUE_DEFAULT_MAXIMUM
		pref.ROB_CAP = STAT_VALUE_DEFAULT_MAXIMUM
		pref.TGH_CAP = STAT_VALUE_DEFAULT_MAXIMUM
		pref.VIG_CAP = STAT_VALUE_DEFAULT_MAXIMUM
		pref.VIV_CAP = STAT_VALUE_DEFAULT_MAXIMUM
		pref.ANA_CAP = STAT_VALUE_DEFAULT_MAXIMUM

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
	. += "<br/>"
	. += "<br/><b>Stat Caps: Default is [STAT_VALUE_DEFAULT_MAXIMUM]</b>:<br/>"
	. += "<b>Note: Job Stats are added before Cap. Skills are added after Stat Cap</b>:<br/>"
	. += "Cap-Biology-At: <a href='?src=\ref[src];bio_cap=1'>[pref.BIO_CAP]</a><br>"
	. += "Cap-Cognition-At: <a href='?src=\ref[src];cog_cap=1'>[pref.COG_CAP]</a><br>"
	. += "Cap-Mechanical-At: <a href='?src=\ref[src];mec_cap=1'>[pref.MEC_CAP]</a><br>"
	. += "Cap-Robustness-At:  <a href='?src=\ref[src];rob_cap=1'>[pref.ROB_CAP]</a><br>"
	. += "Cap-Toughness-At:  <a href='?src=\ref[src];tgh_cap=1'>[pref.TGH_CAP]</a><br>"
	. += "Cap-Vigilance-At:  <a href='?src=\ref[src];vig_cap=1'>[pref.VIG_CAP]</a><br>"
	. += "Cap-Vivification-At:  <a href='?src=\ref[src];viv_cap=1'>[pref.VIV_CAP]</a><br>"
	. += "Cap-Anatomy-At:  <a href='?src=\ref[src];ana_cap=1'>[pref.ANA_CAP]</a><br>"


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

	else if(href_list["bio_cap"])
		var/new_bio = 0
		new_bio = input(user, "Enter a value between -30 and [STAT_VALUE_DEFAULT_MAXIMUM] for your biology", CHARACTER_PREFERENCE_INPUT_TITLE, pref.BIO_CAP) as num
		if(CanUseTopic(user))
			var/old_bio = pref.BIO_CAP
			pref.BIO_CAP = max(min(round(new_bio), STAT_VALUE_DEFAULT_MAXIMUM), -30)
			if(calculatetotalpoints() > 15)
				pref.BIO_CAP = old_bio
			return TOPIC_REFRESH

	else if(href_list["cog_cap"])
		var/new_cog = 0
		new_cog = input(user, "Enter a value between -30 and [STAT_VALUE_DEFAULT_MAXIMUM] for your cognition.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.COG_CAP) as num
		if(CanUseTopic(user))
			var/old_cog = pref.COG_CAP
			pref.COG_CAP = max(min(round(new_cog),STAT_VALUE_DEFAULT_MAXIMUM),-30)
			if(calculatetotalpoints() > 15)
				pref.COG_CAP = old_cog
			return TOPIC_REFRESH

	else if(href_list["mec_cap"])
		var/new_mec = 0
		new_mec = input(user, "Enter a value between -30 and [STAT_VALUE_DEFAULT_MAXIMUM] for your mechanical.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.MEC_CAP) as num
		if(CanUseTopic(user))
			var/old_mec = pref.MEC_CAP
			pref.MEC_CAP = max(min(round(new_mec), STAT_VALUE_DEFAULT_MAXIMUM), -10)
			if(calculatetotalpoints() > 15)
				pref.MEC_CAP = old_mec
			return TOPIC_REFRESH

	else if(href_list["rob_cap"])
		var/new_rob = 0
		new_rob = input(user, "Enter a value between -30 and [STAT_VALUE_DEFAULT_MAXIMUM] for your robustness.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ROB_CAP) as num
		if(CanUseTopic(user))
			var/old_rob = pref.ROB_CAP
			pref.ROB_CAP = max(min(round(new_rob), STAT_VALUE_DEFAULT_MAXIMUM), -30)
			if(calculatetotalpoints() > 15)
				pref.ROB_CAP = old_rob
			return TOPIC_REFRESH

	else if(href_list["tgh_cap"])
		var/new_tgh = 0
		new_tgh = input(user, "Enter a value between -30 and [STAT_VALUE_DEFAULT_MAXIMUM] for your toughness.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.TGH_CAP) as num
		if(CanUseTopic(user))
			var/old_tgh = pref.TGH_CAP
			pref.TGH_CAP = max(min(round(new_tgh), STAT_VALUE_DEFAULT_MAXIMUM), -30)
			if(calculatetotalpoints() > 15)
				pref.TGH_CAP = old_tgh
			return TOPIC_REFRESH

	else if(href_list["vig_cap"])
		var/new_vig = 0
		new_vig = input(user, "Enter a value between -30 and [STAT_VALUE_DEFAULT_MAXIMUM] for your vigilance.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.VIG_CAP) as num
		if(CanUseTopic(user))
			var/old_vig = pref.VIG_CAP
			pref.VIG_CAP = max(min(round(new_vig), STAT_VALUE_DEFAULT_MAXIMUM), -30)
			if(calculatetotalpoints() > 15)
				pref.VIG_CAP = old_vig
			return TOPIC_REFRESH

	else if(href_list["viv_cap"])
		var/new_viv = 0
		new_viv = input(user, "Enter a value between -30 and [STAT_VALUE_DEFAULT_MAXIMUM] for your vivification.", CHARACTER_PREFERENCE_INPUT_TITLE, pref.VIV_CAP) as num
		if(CanUseTopic(user))
			var/old_viv = pref.VIV_CAP
			pref.VIV_CAP = max(min(round(new_viv), STAT_VALUE_DEFAULT_MAXIMUM), -30)
			if(calculatetotalpoints() > 15)
				pref.VIV_CAP = old_viv
			return TOPIC_REFRESH

	else if(href_list["ana_cap"])
		var/new_ana = 0
		new_ana = input(user, "Enter a value between 0 and [STAT_VALUE_DEFAULT_MAXIMUM] for your anatomy  (Anatomey caps at 0 unlike other skills).", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ANA_CAP) as num
		if(CanUseTopic(user))
			var/old_ana = pref.ANA_CAP
			pref.ANA_CAP = max(min(round(new_ana), STAT_VALUE_DEFAULT_MAXIMUM), 0)
			if(calculatetotalpoints() > 15)
				pref.ANA_CAP = old_ana
			return TOPIC_REFRESH


	return ..()