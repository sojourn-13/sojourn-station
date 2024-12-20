/mob/living
	var/datum/language/default_language

/mob/living/verb/set_default_lang_verb()
	set name = "Set Default Language"
	set category = "IC"

	var/language = tgui_input_list(src, "Pick your default language", "Default Language", list("None") + languages, default_language || "None")
	if(!language)
		return

	if(language != "None")
		to_chat(src, SPAN_NOTICE("You will now speak [language] if you do not specify a language when speaking."))
	else
		to_chat(src, SPAN_NOTICE("You will now speak whatever your standard default language is if you do not specify one when speaking."))
	set_default_language(language)

/mob/living/verb/check_default_language()
	set name = "Check Default Language"
	set category = "IC"

	if(default_language)
		to_chat(src, SPAN_NOTICE("You are currently speaking [default_language] by default."))
	else
		to_chat(src, SPAN_NOTICE("Your current default language is your species or mob type default."))

// Note: "None" works here because L = all_languages["None"] -> L = null -> default_language = null
/mob/living/proc/set_default_language(var/langname)
	var/datum/language/L
	//Support for passing a datum directly, or the name of a language to go fetch. Very flexible proc
	if (istype(langname, /datum/language))
		L = langname
	else
		L = all_languages[langname]
	if(L) // don't add null to the language list pls
		languages |= L
	default_language = L
