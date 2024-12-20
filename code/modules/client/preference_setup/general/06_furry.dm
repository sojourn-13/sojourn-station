#define SANITIZECOLOR(COLORVAR)

datum/preferences
	//Addons to the body.
	var/ears_style = "Default"
	var/list/ears_colors = list("#ffffff", "#000000", "#777777")

	var/tail_style = "Default"
	var/list/tail_colors = list("#ffffff", "#000000", "#777777")

	var/wings_style = "Default"
	var/list/wings_colors = list("#ffffff", "#000000", "#777777")

	var/list/body_markings = list()

	//Twiddly Bits
	var/blood_color = "#A10808"

/datum/category_item/player_setup_item/physical/furry
	name = "Furry"
	sort_order = 6

/datum/category_item/player_setup_item/physical/furry/load_character(var/savefile/S)
	from_file(S["ears_style"], pref.ears_style)
	from_file(S["tail_style"], pref.tail_style)
	from_file(S["wings_style"], pref.wings_style)
	from_file(S["ears_colors"], pref.ears_colors)
	from_file(S["tail_colors"], pref.tail_colors)
	from_file(S["wings_colors"], pref.wings_colors)

	from_file(S["body_markings"], pref.body_markings)

	from_file(S["blood_color"], pref.blood_color)

/datum/category_item/player_setup_item/physical/furry/save_character(var/savefile/S)
	to_file(S["ears_style"], pref.ears_style)
	to_file(S["tail_style"], pref.tail_style)
	to_file(S["wings_style"], pref.wings_style)
	to_file(S["ears_colors"], pref.ears_colors)
	to_file(S["tail_colors"], pref.tail_colors)
	to_file(S["wings_colors"], pref.wings_colors)

	to_file(S["body_markings"], pref.body_markings)

	to_file(S["blood_color"], pref.blood_color)


/datum/category_item/player_setup_item/physical/furry/sanitize_character()
	// Parts
	pref.ears_style			= sanitize_inlist(pref.ears_style,  GLOB.ears_styles_list,  initial(pref.ears_style))
	pref.tail_style			= sanitize_inlist(pref.tail_style,  GLOB.tail_styles_list, initial(pref.tail_style))
	pref.wings_style		= sanitize_inlist(pref.wings_style, GLOB.wings_styles_list, initial(pref.wings_style))

	// Colors
	var/counter
	if(!istype(pref.ears_colors)) pref.ears_colors = list()
	if(GLOB.ears_styles_list[pref.ears_style])
		for(counter = 1, counter <= GLOB.ears_styles_list[pref.ears_style]?:colored_layers, counter++)
			if(counter > pref.ears_colors.len) pref.ears_colors.Add(counter ? (counter == 1 ? "#000000" : "#777777") : "#ffffff")
			else if(!iscolor(pref.ears_colors[counter])) pref.ears_colors[counter] = counter ? (counter == 1 ? "#000000" : "#777777") : "#ffffff"
	if(!istype(pref.tail_colors)) pref.tail_colors = list()
	if(GLOB.tail_styles_list[pref.tail_style])
		for(counter = 1, counter <= GLOB.tail_styles_list[pref.tail_style]?:colored_layers, counter++)
			if(counter > pref.tail_colors.len) pref.tail_colors.Add(counter ? (counter == 1 ? "#000000" : "#777777") : "#ffffff")
			else if(!iscolor(pref.tail_colors[counter])) pref.tail_colors[counter] = counter ? (counter == 1 ? "#000000" : "#777777") : "#ffffff"
	if(!istype(pref.wings_colors)) pref.wings_colors = list()
	if(GLOB.wings_styles_list[pref.wings_style])
		for(counter = 1, counter <= GLOB.wings_styles_list[pref.wings_style]?:colored_layers, counter++)
			if(counter > pref.wings_colors.len) pref.wings_colors.Add(counter ? (counter == 1 ? "#000000" : "#777777") : "#ffffff")
			else if(!iscolor(pref.wings_colors[counter])) pref.wings_colors[counter] = counter ? (counter == 1 ? "#000000" : "#777777") : "#ffffff"
	pref.blood_color = iscolor(pref.blood_color) ? pref.blood_color : initial(pref.blood_color)

	if(!istype(pref.body_markings)) pref.body_markings = list()
	for(var/item in pref.body_markings)
		if(!(item in GLOB.body_marking_list))
			pref.body_markings.Remove(item)
		if(!iscolor(pref.body_markings[item]))
			pref.body_markings[item] = "#000000"

	// Text
	pref.custom_species		= sanitize_text(pref.custom_species, initial(pref.custom_species))

/datum/category_item/player_setup_item/physical/furry/content(var/mob/user)
	. += "<style>span.color_holder_box{display: inline-block; width: 20px; height: 8px; border:1px solid #000; padding: 0px;}</style>"

	. += "<b>Blood Color:</b> <a href='?src=\ref[src];blood_color=1'><span class='color_holder_box' style='background-color:[pref.blood_color]'></span></a>"
	. += "<a href='?src=\ref[src];blood_reset=1'>&#707;</a>"
	. += "<br>"
	var/counter
	. += "<b>Ears:</b><br>"
	. += "Type: <a href='?src=\ref[src];ears_type=1'>[pref.ears_style]</a><br>"
	if(GLOB.ears_styles_list[pref.ears_style])
		for(counter = 1, counter <= GLOB.ears_styles_list[pref.ears_style]?:colored_layers, counter++)
			. += "<a href='?src=\ref[src];ears_color=[counter]'><span class='color_holder_box' style='background-color:[pref.ears_colors[counter]]'></span></a>"
	. += "<br>"
	. += "<b>Tail:</b><br>"
	. += "Type: <a href='?src=\ref[src];tail_type=1'>[pref.tail_style]</a><br>"
	if(GLOB.tail_styles_list[pref.tail_style])
		for(counter = 1, counter <= GLOB.tail_styles_list[pref.tail_style]?:colored_layers, counter++)
			. += "<a href='?src=\ref[src];tail_color=[counter]'><span class='color_holder_box' style='background-color:[pref.tail_colors[counter]]'></span></a>"
	. += "<br>"
	. += "<b>Wings:</b><br>"
	. += "Type: <a href='?src=\ref[src];wings_type=1'>[pref.wings_style]</a><br>"
	if(GLOB.wings_styles_list[pref.wings_style])
		for(counter = 1, counter <= GLOB.wings_styles_list[pref.wings_style]?:colored_layers, counter++)
			. += "<a href='?src=\ref[src];wings_color=[counter]'><span class='color_holder_box' style='background-color:[pref.wings_colors[counter]]'></span></a>"
	. += "<br>"
	. += "<b>Markings:</b><br>"
	. += "<a href='?src=\ref[src];marking_add=1'>Add Marking</a><br>"
	for(counter = pref.body_markings.len, counter >= 1, counter--)
		. += "<a [counter >= pref.body_markings.len ? "" : "href='?src=\ref[src];marking_up=[counter]'"]>&#708;</a>"
		. += "<a [counter <= 1 ? "" : "href='?src=\ref[src];marking_down=[counter]'"]>&#709;</a>"
		. += "<a href='?src=\ref[src];marking_color=[counter]'><span class='color_holder_box' style='background-color:[pref.body_markings[pref.body_markings[counter]]]'></span></a>"
		. += "<a href='?src=\ref[src];marking=[counter]'>[pref.body_markings[counter]]</a><br>"

/datum/category_item/player_setup_item/physical/furry/OnTopic(var/href,var/list/href_list, var/mob/user)
	pref.categoriesChanged = "Furry"
	var/datum/species/cspecies = global.all_species[pref.species]
	var/datum/species_form/cform = GLOB.all_species_form_list[pref.species_form]
	if(href_list["blood_color"])
		var/color = input(user, "Choose your character's blood color:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.blood_color) as color|null
		if(color && CanUseTopic(user))
			pref.blood_color = color
		return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["blood_reset"])
		if(CanUseTopic(user))
			pref.blood_color = (cform && cform.blood_color) ? cform.blood_color : "A10808"
		return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["ears_type"])
		var/valid_ears = cspecies.permitted_ears ? cspecies.permitted_ears : GLOB.ears_styles_list
		var/new_e_style = input(user, "Choose your character's ears:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ears_style)   as null|anything in (list("Default" = null) + valid_ears)
		if(new_e_style && CanUseTopic(user))
			pref.ears_style = new_e_style
			return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["ears_color"])
		var/colornum = text2num(href_list["ears_color"])
		if(colornum && colornum >= 1 && colornum <= GLOB.ears_styles_list[pref.ears_style]?:colored_layers)
			var/color = input(user, "Choose your character's ear color:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.ears_colors[colornum]) as color|null
			if(color && CanUseTopic(user))
				pref.ears_colors[colornum] = color
			return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["tail_type"])
		var/valid_tails = cspecies.permitted_tail ? cspecies.permitted_tail : GLOB.tail_styles_list
		var/new_t_style = input(user, "Choose your character's tail:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.tail_style)   as null|anything in (list("Default" = null) + valid_tails)
		if(new_t_style && CanUseTopic(user))
			pref.tail_style = new_t_style
			return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["tail_color"])
		var/colornum = text2num(href_list["tail_color"])
		if(colornum && colornum >= 1 && colornum <= GLOB.tail_styles_list[pref.tail_style]?:colored_layers)
			var/color = input(user, "Choose your character's tail color:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.tail_colors[colornum]) as color|null
			if(color && CanUseTopic(user))
				pref.tail_colors[colornum] = color
			return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["wings_type"])
		var/valid_wings = cspecies.permitted_wings ? cspecies.permitted_wings : GLOB.wings_styles_list
		var/new_w_style = input(user, "Choose your character's wings:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.wings_style) as null|anything in (list("Default" = null) + valid_wings)
		if(new_w_style && CanUseTopic(user))
			pref.wings_style = new_w_style
			return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["wings_color"])
		var/colornum = text2num(href_list["wings_color"])
		if(colornum && colornum >= 1 && colornum <= GLOB.wings_styles_list[pref.wings_style]?:colored_layers)
			var/color = input(user, "Choose your character's wings color:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.wings_colors[colornum]) as color|null
			if(color && CanUseTopic(user))
				pref.wings_colors[colornum] = color
			return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["marking_add"])
		if(cspecies.type != /datum/species/slime)
			var/new_marking = input(user, "Choose a marking to add:", CHARACTER_PREFERENCE_INPUT_TITLE, null) as null|anything in GLOB.body_marking_list - pref.body_markings
			if(new_marking && CanUseTopic(user))
				pref.body_markings[new_marking] = "#000000"
				log_and_message_admins("[key_name(usr)] has picked a new marking.") // So that admins can see who's crashing the server through sparkledogs.
			return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["marking"])
		if(CanUseTopic(user))
			var/pos = text2num(href_list["marking"])
			if(pos > 0 && pos <= pref.body_markings.len)
				pref.body_markings.Remove(pref.body_markings[pos])
		return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["marking_up"])
		var/pos = text2num(href_list["marking_up"])
		if(CanUseTopic(user) && pos && pos >= 1 && pos < pref.body_markings.len)
			pref.body_markings.Swap(pos, pos+1)
		return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["marking_down"])
		var/pos = text2num(href_list["marking_down"])
		if(CanUseTopic(user) && pos && pos > 1 && pos <= pref.body_markings.len)
			pref.body_markings.Swap(pos, pos-1)
		return TOPIC_REFRESH_UPDATE_PREVIEW
	if(href_list["marking_color"])
		var/pos = text2num(href_list["marking_color"])
		pos = pref.body_markings[pos]
		if(pos && (pos in pref.body_markings))
			var/color = input(user, "Choose the marking color:", CHARACTER_PREFERENCE_INPUT_TITLE, pref.body_markings[pos]) as color|null
			if(color && (pos in pref.body_markings) && CanUseTopic(user))
				pref.body_markings[pos] = color
		return TOPIC_REFRESH_UPDATE_PREVIEW
	. = ..()
