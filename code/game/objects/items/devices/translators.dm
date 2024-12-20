//Universal translator
/obj/item/device/universal_translator
	name = "handheld translator"
	desc = "A handheld device that translates foreign language to a language known to the user."
	icon = 'icons/obj/items.dmi'
	icon_state = "translator"
	item_state = "translator"
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_DATA = 8)
	matter = list(MATERIAL_STEEL = 4, MATERIAL_GLASS = 4, MATERIAL_PLASTIC = 2)
	var/mult_icons = 1	//Changes sprite when it translates
	var/visual = 1		//If you need to see to get the message
	var/audio = 0		//If you need to hear to get the message
	var/listening = 0
	var/datum/language/langset

/obj/item/device/universal_translator/Destroy()
	if(listening)
		remove_hearing()
	. = ..()

/obj/item/device/universal_translator/attack_self(mob/user) 
	if(!listening) //Turning ON
		langset = input(user,"Translate to which of your languages?","Language Selection") as null|anything in user.languages
		if(langset)
			if(langset && ((langset.flags & NONVERBAL) || (langset.flags & HIVEMIND) || (langset.flags & NO_TRANSLATE)))
				to_chat(user, "<span class='warning'>\The [src] cannot output that language.</span>")
				return
			else
				add_hearing()
				listening = 1
			to_chat(user, "<span class='notice'>You enable \the [src], translating into [langset.name].</span>")
	else	//Turning OFF
		listening = 0
		remove_hearing()
		langset = null
		to_chat(user, "<span class='notice'>You disable \the [src].</span>")

/obj/item/device/universal_translator/hear_talk(var/mob/speaker, var/message, var/vrb, var/datum/language/language)
	if(!listening || !istype(speaker) || isanimal(speaker))
		return

	//Handheld or pocket only.
	if(!isliving(loc))
		return

	var/mob/living/L = loc

	if (language && (language.flags & NONVERBAL))
		return //Sign language and other non-vergbals cannot be translated

	if (visual && ((L.sdisabilities & BLIND) || L.eye_blind))
		return //Blind people cannot see it

	if (audio && ((L.sdisabilities & DEAF) || L.ear_deaf))
		return //Deaf people cannot hear it
		
	if (language && ((language.flags & HIVEMIND)))
		return //How do you hear a hivemind

	if (language && ((language.flags & NO_TRANSLATE)))
		return //Prevents Opifex Language and other untranslatable languages from being translated

	//Only translate if they can't understand, otherwise pointlessly spammy
	//I'll just assume they don't look at the screen in that case

	//They don't understand the spoken language we're translating FROM
	if(!L.say_understands(speaker,language))
		//They understand the output language
		if(L.say_understands(null,langset))
			to_chat(L, "<i><b>[src]</b> translates, </i>\"<span class='[langset.colour]'>[message]</span>\"")

		//They don't understand the output language
		else
			to_chat(L, "<i><b>[src]</b> translates, </i>\"<span class='[langset.colour]'>[langset.scramble(message)]</span>\"")

//Earpiece
/obj/item/device/universal_translator/ear
	name = "translator earpiece"
	desc = "A headset that translates foreign languages to a known language of the users choice."
	icon = 'icons/obj/items.dmi'
	icon_state = "earpiece"
	item_state = "earpiece"
	origin_tech = list(TECH_DATA = 8)
	matter = list(MATERIAL_STEEL = 2, MATERIAL_GLASS = 2, MATERIAL_PLASTIC = 1, MATERIAL_SILVER = 1)
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
