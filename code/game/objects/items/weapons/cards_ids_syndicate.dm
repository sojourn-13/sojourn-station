/obj/item/card/id/syndicate
	name = "agent card"
	icon_state = "syndicate"
	assignment = "Agent"
	origin_tech = list(TECH_ILLEGAL = 3)
	var/electronic_warfare = 1
	var/mob/registered_user = null

/obj/item/card/id/syndicate/New(mob/user as mob)
	..()
	access += syndicate_access.Copy()

/obj/item/card/id/syndicate/Destroy()
	unset_registered_user(registered_user)
	return ..()

/obj/item/card/id/syndicate/prevent_tracking()
	return electronic_warfare

/obj/item/card/id/syndicate/afterattack(var/obj/item/O as obj, mob/user as mob, proximity)
	if(!proximity) return
	if(istype(O, /obj/item/card/id))
		var/obj/item/card/id/I = O
		src.access |= I.access
		if(player_is_antag(user.mind))
			to_chat(user, SPAN_NOTICE("The microscanner activates as you pass it over the ID, copying its access."))

/obj/item/card/id/syndicate/attack_self(mob/user as mob)
	// We use the fact that registered_name is not unset should the owner be vaporized, to ensure the id doesn't magically become unlocked.
	if(!registered_user && register_user(user))
		to_chat(user, SPAN_NOTICE("The microscanner marks you as its owner, preventing others from accessing its internals."))
	if(registered_user == user)
		switch(alert("Would you like edit the ID, or show it?","Show or Edit?", "Edit","Show"))
			if("Edit")
				nano_ui_interact(user)
			if("Show")
				..()
	else
		..()

/obj/item/card/id/syndicate/nano_ui_interact(mob/user, ui_key = "main", var/datum/nanoui/ui = null, var/force_open = NANOUI_FOCUS)
	var/data[0]
	var/entries[0]
	entries[++entries.len] = list("name" = "Age", 				"value" = age)
	entries[++entries.len] = list("name" = "Appearance",		"value" = "Set")
	entries[++entries.len] = list("name" = "Assignment",		"value" = assignment)
	entries[++entries.len] = list("name" = "Blood Type",		"value" = blood_type)
	entries[++entries.len] = list("name" = "DNA Hash", 			"value" = dna_hash)
	entries[++entries.len] = list("name" = "Fingerprint Hash",	"value" = fingerprint_hash)
	entries[++entries.len] = list("name" = "Name", 				"value" = registered_name)
	entries[++entries.len] = list("name" = "Photo", 			"value" = "Update")
	entries[++entries.len] = list("name" = "Sex", 				"value" = sex)
	entries[++entries.len] = list("name" = "Factory Reset",		"value" = "Use With Care")
	data["electronic_warfare"] = electronic_warfare
	data["entries"] = entries

	ui = SSnano.try_update_ui(user, src, ui_key, ui, data, force_open)
	if (!ui)
		ui = new(user, src, ui_key, "agent_id_card.tmpl", "Agent id", 600, 400)
		ui.set_initial_data(data)
		ui.open()

/obj/item/card/id/syndicate/proc/register_user(var/mob/user)
	if(!istype(user) || user == registered_user)
		return FALSE
	unset_registered_user()
	registered_user = user
	user.set_id_info(src)
	GLOB.destroyed_event.register(user, src, /obj/item/card/id/syndicate/proc/unset_registered_user)
	return TRUE

/obj/item/card/id/syndicate/proc/unset_registered_user(var/mob/user)
	if(!registered_user || (user && user != registered_user))
		return
	GLOB.destroyed_event.unregister(registered_user, src)
	registered_user = null

/obj/item/card/id/syndicate/CanUseTopic(mob/user)
	if(user != registered_user)
		return STATUS_CLOSE
	return ..()

/obj/item/card/id/syndicate/Topic(href, href_list, var/datum/nano_topic_state/state)
	if(..())
		return 1

	var/user = usr
	if(href_list["electronic_warfare"])
		electronic_warfare = text2num(href_list["electronic_warfare"])
		to_chat(user, "<span class='notice'>Electronic warfare [electronic_warfare ? "enabled" : "disabled"].</span>")
	else if(href_list["set"])
		switch(href_list["set"])
			if("Age")
				var/new_age = input(user,"What age would you like to put on this card?","Agent Card Age", age) as null|num
				if(!isnull(new_age) && CanUseTopic(user, state))
					if(new_age < 0)
						age = initial(age)
					else
						age = new_age
					to_chat(user, SPAN_NOTICE("Age has been set to '[age]'."))
					. = 1
			if("Appearance")
				var/datum/card_state/choice = input(user, "Select the appearance for this card.", "Agent Card Appearance") as null|anything in id_card_states()
				if(choice && CanUseTopic(user, state))
					src.icon_state = choice.icon_state
					src.item_state = choice.item_state
					to_chat(usr, SPAN_NOTICE("Appearance changed to [choice]."))
					. = 1
			if("Assignment")
				var/new_job = sanitize(input(user,"What assignment would you like to put on this card?\nChanging assignment will not grant or remove any access levels.","Agent Card Assignment", assignment) as null|text)
				if(!isnull(new_job) && CanUseTopic(user, state))
					src.assignment = new_job
					to_chat(user, SPAN_NOTICE("Occupation changed to '[new_job]'."))
					update_name()
					. = 1
			if("Blood Type")
				var/default = blood_type
				if(default == initial(blood_type) && ishuman(user))
					var/mob/living/carbon/human/H = user
					if(H.dna)
						default = H.dna.b_type
				var/new_blood_type = sanitize(input(user,"What blood type would you like to be written on this card?","Agent Card Blood Type",default) as null|text)
				if(!isnull(new_blood_type) && CanUseTopic(user, state))
					src.blood_type = new_blood_type
					to_chat(user, SPAN_NOTICE("Blood type changed to '[new_blood_type]'."))
					. = 1
			if("DNA Hash")
				var/default = dna_hash
				if(default == initial(dna_hash) && ishuman(user))
					var/mob/living/carbon/human/H = user
					if(H.dna)
						default = H.dna.unique_enzymes
				var/new_dna_hash = sanitize(input(user,"What DNA hash would you like to be written on this card?","Agent Card DNA Hash",default) as null|text)
				if(!isnull(new_dna_hash) && CanUseTopic(user, state))
					src.dna_hash = new_dna_hash
					to_chat(user, SPAN_NOTICE("DNA hash changed to '[new_dna_hash]'."))
					. = 1
			if("Fingerprint Hash")
				var/default = fingerprint_hash
				if(default == initial(fingerprint_hash) && ishuman(user))
					var/mob/living/carbon/human/H = user
					if(H.dna)
						default = md5(H.dna.uni_identity)
				var/new_fingerprint_hash = sanitize(input(user,"What fingerprint hash would you like to be written on this card?","Agent Card Fingerprint Hash",default) as null|text)
				if(!isnull(new_fingerprint_hash) && CanUseTopic(user, state))
					src.fingerprint_hash = new_fingerprint_hash
					to_chat(user, SPAN_NOTICE("Fingerprint hash changed to '[new_fingerprint_hash]'."))
					. = 1
			if("Name")
				var/new_name = sanitizeName(input(user,"What name would you like to put on this card?","Agent Card Name", registered_name) as null|text)
				if(!isnull(new_name) && CanUseTopic(user, state))
					src.registered_name = new_name
					update_name()
					to_chat(user, SPAN_NOTICE("Name changed to '[new_name]'."))
					. = 1
			if("Photo")
				set_id_photo(user)
				to_chat(user, SPAN_NOTICE("Photo changed."))
				. = 1
			if("Sex")
				var/new_sex = sanitize(input(user,"What sex would you like to put on this card?","Agent Card Sex", sex) as null|text)
				if(!isnull(new_sex) && CanUseTopic(user, state))
					src.sex = new_sex
					to_chat(user, SPAN_NOTICE("Sex changed to '[new_sex]'."))
					. = 1
			if("Factory Reset")
				if(alert("This will factory reset the card, including access and owner. Continue?", "Factory Reset", "No", "Yes") == "Yes" && CanUseTopic(user, state))
					age = initial(age)
					access = syndicate_access.Copy()
					assignment = initial(assignment)
					blood_type = initial(blood_type)
					dna_hash = initial(dna_hash)
					electronic_warfare = initial(electronic_warfare)
					fingerprint_hash = initial(fingerprint_hash)
					icon_state = initial(icon_state)
					name = initial(name)
					registered_name = initial(registered_name)
					unset_registered_user()
					sex = initial(sex)
					to_chat(user, SPAN_NOTICE("All information has been deleted from \the [src]."))
					. = 1

	// Always update the UI, or buttons will spin indefinitely
	SSnano.update_uis(src)

/var/global/list/id_card_states
/proc/id_card_states()
	if(!id_card_states)
		id_card_states = list()
		for(var/path in typesof(/obj/item/card/id))
			var/obj/item/card/id/ID = path
			var/datum/card_state/CS = new()
			CS.icon_state = initial(ID.icon_state)
			CS.item_state = initial(ID.item_state)
			CS.name = initial(ID.name) + " - " + initial(ID.icon_state)
			id_card_states += CS
		id_card_states = dd_sortedObjectList(id_card_states)

	return id_card_states

/datum/card_state
	var/name
	var/icon_state
	var/item_state

/datum/card_state/dd_SortValue()
	return name

//Admin custom role stuff for agents, operatives, etc.
/obj/item/card/id/syndicate/ert
	name = "operative id card"
	desc = "A specialized ID for the appointed operatives of the high council."
	registered_name = "Agent"
	assignment = "Agent"
	icon_state = "centcom_all-access"
	group = "golden"

/obj/item/card/id/syndicate/ert/aa
	name = "all access operative id card"
	desc = "A specialized all access ID for the appointed operatives of the high council."
	registered_name = "Agent"
	assignment = "Agent"
	icon_state = "hc_all-access"

/obj/item/card/id/syndicate/ert/aa/New()
	access = get_all_station_access()
	..()

/obj/item/card/id/syndicate/ert/aa/marshal_ert
	name = "Marshal Agent's ID card"
	desc = "A specialized all access ID issued to agents of the Provost Marshal and the Nadezhda Marshals."
	registered_name = "Special Agent"
	assignment = "Special Agent"

/obj/item/card/id/syndicate/ert/aa/marshal_ert/New()
	access = get_all_station_access()
	..()

/obj/item/card/id/syndicate/ert/aa/blackshield_ert
	name = "Blackshield Specialist's ID card"
	desc = "A specialized all access ID issued to agents of the Brigadier and Blackshield Militia."
	registered_name = "Specialist"
	assignment = "Specialist"

/obj/item/card/id/syndicate/ert/aa/blackshield_ert/New()
	access = get_all_station_access()
	..()

/obj/item/card/id/syndicate/ert/aa/guild_ert
	name = "Guild AA ID card"
	desc = "An ID card with all access as the guild uses several backdoors and emergency access commands to bypass most access requirements."
	registered_name = "Guild ERT"
	assignment = "Guild ERT"

/obj/item/card/id/syndicate/ert/aa/guild_ert/New()
	access = get_all_station_access()
	..()

/obj/item/card/id/syndicate/ert/aa/auditor_ert
	name = "LSS Auditor ID card"
	desc = "An ID card that is for top down, with access to check out and inspect anything anyware at a moments time."
	registered_name = "LSS Auditor"
	assignment = "LSS Auditor"

/obj/item/card/id/syndicate/ert/aa/auditor_ert/New()
	access = get_all_station_access()
	..()

/obj/item/card/id/syndicate/ert/church_ert
	name = "Inquisitor ID card"
	desc = "An ID card made for Inquisitors of the Church of the Absolute"
	registered_name = "Inquisitor"
	assignment = "Inquisitor"
	access = list(access_nt_preacher, access_nt_disciple, access_morgue, access_chapel_office, access_crematorium, access_maint_tunnels, access_RC_announce, access_keycard_auth, access_heads, access_sec_doors)

/obj/item/card/id/syndicate/ert/medical_ert
	name = "Medical ID card"
	desc = "An ID straight from the SI Medical Divisions."
	registered_name = "Medical ERT"
	assignment = "SI Medical ERT"
	access = list(access_moebius, access_medical_equip, access_morgue, access_genetics, access_heads,
		access_chemistry, access_virology, access_cmo, access_surgery, access_RC_announce,
		access_keycard_auth, access_sec_doors, access_psychiatrist, access_eva, access_maint_tunnels,
		access_external_airlocks, access_paramedic, access_research_equipment, access_medical_suits)

/obj/item/card/id/syndicate/ert/research_ert
	name = "SI ID card"
	desc = "An ID straight from the SI Ethics Committee. Wait, they have an ethics commitee?"
	registered_name = "Ethics Commitee Agent"
	assignment = "Ethics Commitee Agent"
	access = list(
		access_rd, access_heads, access_tox, access_genetics, access_morgue, access_cmo,
		access_tox_storage, access_teleporter, access_sec_doors, access_paramedic,
		access_moebius, access_medical_equip, access_chemistry, access_virology, access_surgery, access_psychiatrist,
		access_robotics, access_xenobiology, access_ai_upload, access_tech_storage, access_eva, access_external_airlocks, access_medical_suits,
		access_RC_announce, access_keycard_auth, access_tcomsat, access_gateway, access_xenoarch, access_network, access_maint_tunnels, access_research_equipment
	) //Same as RD

/obj/item/card/id/syndicate/ert/prospector_ert
	name = "Prospector Underboss ID card"
	desc = "An ID straight from Boss Hogg, or at least from his dictation PAI. "
	registered_name = "Underboss"
	assignment = "Prospectors Underboss"
	access = list(
		access_prospector, access_foreman, access_external_airlocks, access_eva, access_heads, access_sec_doors,
		access_RC_announce, access_keycard_auth, access_maint_tunnels, access_medical_suits
	) //same as foreman, ofc.

//Event and similar IDs.
/obj/item/card/id/syndicate/solfed
	name = "SF Armed Forces ID card"
	icon_state = "tags"
	desc = "A set of identifyiing tags for a member of the Solarian Armed Forces. This particular set is de-personalized and contains minimal personal information."
	registered_name = "MSgt Joker"
	assignment = "Solarian Armed Forces"

