
/client/proc/view_var_Topic(href, href_list, hsrc)
	//This should all be moved over to datum/admins/Topic() or something ~Carn
	if( (usr.client != src) || !src.holder )
		return
	if(href_list["Vars"])
		debug_variables(locate(href_list["Vars"]))

	//~CARN: for renaming mobs (updates their name, real_name, mind.name, their ID/PDA and datacore records).
	else if(href_list["rename"])
		if(!check_rights(R_DEBUG|R_ADMIN))
			return

		var/mob/M = locate(href_list["rename"])
		if(!istype(M))
			to_chat(usr, "This can only be used on instances of type /mob")
			return

		var/new_name = sanitize(input(usr,"What would you like to name this mob?","Input a name",M.real_name) as text|null, MAX_NAME_LEN)
		if(!new_name || !M)
			return

		message_admins("Admin [key_name_admin(usr)] renamed [key_name_admin(M)] to [new_name].")
		M.fully_replace_character_name(M.real_name,new_name)
		href_list["datumrefresh"] = href_list["rename"]

	else if(href_list["varnameedit"] && href_list["datumedit"])
		if(!check_rights(R_DEBUG|R_ADMIN))
			return

		var/D = locate(href_list["datumedit"])
		if(!istype(D,/datum) && !istype(D,/client))
			to_chat(usr, "This can only be used on instances of types /client or /datum")
			return

		modify_variables(D, href_list["varnameedit"], 1)

	else if(href_list["varnamechange"] && href_list["datumchange"])
		if(!check_rights(R_DEBUG|R_ADMIN))
			return

		var/D = locate(href_list["datumchange"])
		if(!istype(D,/datum) && !istype(D,/client))
			to_chat(usr, "This can only be used on instances of types /client or /datum")
			return

		modify_variables(D, href_list["varnamechange"], 0)

	else if(href_list["varnamemass"] && href_list["datummass"])
		if(!check_rights(R_ADMIN|R_DEBUG))
			return

		var/atom/A = locate(href_list["datummass"])
		if(!istype(A))
			to_chat(usr, "This can only be used on instances of type /atom")
			return

		cmd_mass_modify_object_variables(A, href_list["varnamemass"])

	else if(href_list["mob_player_panel"])
		if(!check_rights(0))
			return

		var/mob/M = locate(href_list["mob_player_panel"])
		if(!istype(M))
			to_chat(usr, "This can only be used on instances of type /mob")
			return

		src.holder.show_player_panel(M)
		href_list["datumrefresh"] = href_list["mob_player_panel"]

	else if(href_list["godmode"])
		if(!check_rights(R_FUN))
			return

		var/mob/M = locate(href_list["godmode"])
		if(!istype(M))
			to_chat(usr, "This can only be used on instances of type /mob")
			return

		src.cmd_admin_godmode(M)
		href_list["datumrefresh"] = href_list["godmode"]

	else if(href_list["gib"])
		if(!check_rights(0))
			return

		var/mob/M = locate(href_list["gib"])
		if(!istype(M))
			to_chat(usr, "This can only be used on instances of type /mob")
			return

		src.cmd_admin_gib(M)

	else if(href_list["build_mode"])
		if(!check_rights(R_FUN))
			return

		var/mob/M = locate(href_list["build_mode"])
		if(!istype(M))
			to_chat(usr, "This can only be used on instances of type /mob")
			return

		togglebuildmode(M)
		href_list["datumrefresh"] = href_list["build_mode"]

	else if(href_list["drop_everything"])
		if(!check_rights(R_DEBUG|R_ADMIN))
			return

		var/mob/M = locate(href_list["drop_everything"])
		if(!istype(M))
			to_chat(usr, "This can only be used on instances of type /mob")
			return

		if(usr.client)
			usr.client.cmd_admin_drop_everything(M)

	else if(href_list["direct_control"])
		if(!check_rights(0))
			return

		var/mob/M = locate(href_list["direct_control"])
		if(!istype(M))
			to_chat(usr, "This can only be used on instances of type /mob")
			return

		if(usr.client)
			usr.client.cmd_assume_direct_control(M)

	else if(href_list["make_skeleton"])
		if(!check_rights(R_FUN))
			return

		var/mob/living/carbon/human/H = locate(href_list["make_skeleton"])
		if(!istype(H))
			to_chat(usr, "This can only be used on instances of type /mob/living/carbon/human")
			return

		H.ChangeToSkeleton()
		href_list["datumrefresh"] = href_list["make_skeleton"]

	else if(href_list["delall"])
		if(!check_rights(R_DEBUG|R_SERVER))
			return

		var/atom/movable/O = locate(href_list["delall"])
		if(!istype(O))
			to_chat(usr, "This can only be used on instances of type /atom/movable")
			return

		var/action_type = alert("Strict type ([O.type]) or type and all subtypes?",,"Strict type","Type and subtypes","Cancel")
		if(action_type == "Cancel" || !action_type)
			return

		if(alert("Are you really sure you want to delete all objects of type [O.type]?",,"Yes","No") != "Yes")
			return

		if(alert("Second confirmation required. Delete?",,"Yes","No") != "Yes")
			return

		var/O_type = O.type
		switch(action_type)
			if("Strict type")
				var/i = 0
				for(var/atom/movable/Obj in world)
					if(Obj.type == O_type)
						i++
						qdel(Obj)
				if(!i)
					to_chat(usr, "No objects of this type exist")
					return
				log_admin("[key_name(usr)] deleted all objects of type [O_type] ([i] objects deleted)")
				message_admins(SPAN_NOTICE("[key_name(usr)] deleted all objects of type [O_type] ([i] objects deleted)"))
			if("Type and subtypes")
				var/i = 0
				for(var/atom/movable/Obj in world)
					if(istype(Obj,O_type))
						i++
						qdel(Obj)
				if(!i)
					to_chat(usr, "No objects of this type exist")
					return
				log_admin("[key_name(usr)] deleted all objects of type or subtype of [O_type] ([i] objects deleted)")
				message_admins(SPAN_NOTICE("[key_name(usr)] deleted all objects of type or subtype of [O_type] ([i] objects deleted)"))

	else if(href_list["explode"])
		if(!check_rights(R_DEBUG|R_FUN))	return

		var/atom/A = locate(href_list["explode"])
		if(!isobj(A) && !ismob(A) && !isturf(A))
			to_chat(usr, "This can only be done to instances of type /obj, /mob and /turf")
			return

		src.cmd_admin_explosion(A)
		href_list["datumrefresh"] = href_list["explode"]

	else if(href_list["emp"])
		if(!check_rights(R_DEBUG|R_FUN))	return

		var/atom/A = locate(href_list["emp"])
		if(!isobj(A) && !ismob(A) && !isturf(A))
			to_chat(usr, "This can only be done to instances of type /obj, /mob and /turf")
			return

		src.cmd_admin_emp(A)
		href_list["datumrefresh"] = href_list["emp"]

	else if(href_list["mark_object"])
		if(!check_rights(0))	return

		var/datum/D = locate(href_list["mark_object"])
		if(!istype(D))
			to_chat(usr, "This can only be done to instances of type /datum")
			return

		src.holder.marked_datum_weak = WEAKREF(D)
		href_list["datumrefresh"] = href_list["mark_object"]

	else if(href_list["perkadd"])
		if(!check_rights(0))
			return
		var/mob/S = locate (href_list["perkadd"])
		if(!istype(S))
			to_chat(usr, "This can only be done to instances of type /mob")
			return
		var/datum/perk/perkname = input("What perk do you want to add?") as null|anything in subtypesof(/datum/perk/)
		if (!perkname)
			return
		if(QDELETED(S))
			to_chat(usr, "Creature has been delete in the meantime.")
			return
		S.stats.addPerk(perkname)
		message_admins("\blue [key_name_admin(usr)] gave the perk [perkname] to [key_name(S)].", 1)
		href_list["datumrefresh"] = href_list["perkadd"]

	else if(href_list["perkremove"])
		if(!check_rights(0))
			return
		var/mob/S = locate (href_list["perkremove"])
		if(!istype(S))
			to_chat(usr, "This can only be done to instances of type /mob")
			return
		if (S.stats.perks.len ==0)
			to_chat(usr, "Creature has no perks to remove")
			return
		var/datum/perk/perkname = input("What perk do you want to remove?") as null|anything in S.stats.perks
		if (!perkname)
			return
		if(QDELETED(S))
			to_chat(usr, "Creature has been delete in the meantime.")
			return
		S.stats.removePerk(perkname.type)
		message_admins("\blue [key_name_admin(usr)] removed the perk [perkname] from [key_name(S)].", 1)
		href_list["datumrefresh"] = href_list["perkremove"]

	else if(href_list["rotatedatum"])
		if(!check_rights(0))	return

		var/atom/A = locate(href_list["rotatedatum"])
		if(!istype(A))
			to_chat(usr, "This can only be done to instances of type /atom")
			return

		switch(href_list["rotatedir"])
			if("right")	A.set_dir(turn(A.dir, -45))
			if("left")	A.set_dir(turn(A.dir, 45))
		href_list["datumrefresh"] = href_list["rotatedatum"]

	else if(href_list["makemonkey"])
		if(!check_rights(R_FUN))
			return

		var/mob/living/carbon/human/H = locate(href_list["makemonkey"])
		if(!istype(H))
			to_chat(usr, "This can only be done to instances of type /mob/living/carbon/human")
			return

		if(alert("Confirm mob type change?",,"Transform","Cancel") != "Transform")	return
		if(!H)
			to_chat(usr, "Mob doesn't exist anymore")
			return
		holder.Topic(href, list("monkeyone"=href_list["makemonkey"]))

	else if(href_list["makerobot"])
		if(!check_rights(R_FUN))
			return

		var/mob/living/carbon/human/H = locate(href_list["makerobot"])
		if(!istype(H))
			to_chat(usr, "This can only be done to instances of type /mob/living/carbon/human")
			return

		if(alert("Confirm mob type change?",,"Transform","Cancel") != "Transform")	return
		if(!H)
			to_chat(usr, "Mob doesn't exist anymore")
			return
		holder.Topic(href, list("makerobot"=href_list["makerobot"]))

	else if(href_list["makeslime"])
		if(!check_rights(R_FUN))
			return

		var/mob/living/carbon/human/H = locate(href_list["makeslime"])
		if(!istype(H))
			to_chat(usr, "This can only be done to instances of type /mob/living/carbon/human")
			return

		if(alert("Confirm mob type change?",,"Transform","Cancel") != "Transform")	return
		if(!H)
			to_chat(usr, "Mob doesn't exist anymore")
			return
		holder.Topic(href, list("makeslime"=href_list["makeslime"]))

	else if(href_list["makeai"])
		if(!check_rights(R_FUN))
			return

		var/mob/living/carbon/human/H = locate(href_list["makeai"])
		if(!istype(H))
			to_chat(usr, "This can only be done to instances of type /mob/living/carbon/human")
			return

		if(alert("Confirm mob type change?",,"Transform","Cancel") != "Transform")	return
		if(!H)
			to_chat(usr, "Mob doesn't exist anymore")
			return
		holder.Topic(href, list("makeai"=href_list["makeai"]))

	else if(href_list["setspecies"])
		if(!check_rights(R_FUN))
			return

		var/mob/living/carbon/human/H = locate(href_list["setspecies"])
		if(!istype(H))
			to_chat(usr, "This can only be done to instances of type /mob/living/carbon/human")
			return

		var/new_species = input("Please choose a new species.","Species",null) as null|anything in all_species

		if(!H)
			to_chat(usr, "Mob doesn't exist anymore")
			return

		if(H.set_species(new_species))
			to_chat(usr, "Set species of [H] to [H.species].")
		else
			to_chat(usr, "Failed! Something went wrong.")

	else if(href_list["addlanguage"])
		if(!check_rights(R_FUN))
			return

		var/mob/H = locate(href_list["addlanguage"])
		if(!istype(H))
			to_chat(usr, "This can only be done to instances of type /mob")
			return

		var/new_language = input("Please choose a language to add.","Language",null) as null|anything in all_languages

		if(!new_language)
			return

		if(!H)
			to_chat(usr, "Mob doesn't exist anymore")
			return

		if(H.add_language(new_language))
			to_chat(usr, "Added [new_language] to [H].")
		else
			to_chat(usr, "Mob already knows that language.")

	else if(href_list["remlanguage"])
		if(!check_rights(R_FUN))
			return

		var/mob/H = locate(href_list["remlanguage"])
		if(!istype(H))
			to_chat(usr, "This can only be done to instances of type /mob")
			return

		if(!H.languages.len)
			to_chat(usr, "This mob knows no languages.")
			return

		var/datum/language/rem_language = input("Please choose a language to remove.","Language",null) as null|anything in H.languages

		if(!rem_language)
			return

		if(!H)
			to_chat(usr, "Mob doesn't exist anymore")
			return

		if(H.remove_language(rem_language.name))
			to_chat(usr, "Removed [rem_language] from [H].")
		else
			to_chat(usr, "Mob doesn't know that language.")

	else if(href_list["addverb"])
		if(!check_rights(R_DEBUG))
			return

		var/mob/living/H = locate(href_list["addverb"])

		if(!istype(H))
			to_chat(usr, "This can only be done to instances of type /mob/living")
			return
		var/list/possibleverbs = list()
		possibleverbs += "Cancel" 								// One for the top...
		possibleverbs += typesof(/mob/proc,/mob/verb,/mob/living/proc,/mob/living/verb)
		switch(H.type)
			if(/mob/living/carbon/human)
				possibleverbs += typesof(/mob/living/carbon/proc,/mob/living/carbon/verb,/mob/living/carbon/human/verb,/mob/living/carbon/human/proc)
			if(/mob/living/silicon/robot)
				possibleverbs += typesof(/mob/living/silicon/proc,/mob/living/silicon/robot/proc,/mob/living/silicon/robot/verb)
			if(/mob/living/silicon/ai)
				possibleverbs += typesof(/mob/living/silicon/proc,/mob/living/silicon/ai/proc,/mob/living/silicon/ai/verb)
		possibleverbs -= H.verbs
		possibleverbs += "Cancel" 								// ...And one for the bottom

		var/verb = input("Select a verb!", "Verbs",null) as anything in possibleverbs
		if(!H)
			to_chat(usr, "Mob doesn't exist anymore")
			return
		if(!verb || verb == "Cancel")
			return
		else
			add_verb(H, verb)

	else if(href_list["remverb"])
		if(!check_rights(R_DEBUG))      return

		var/mob/H = locate(href_list["remverb"])

		if(!istype(H))
			to_chat(usr, "This can only be done to instances of type /mob")
			return
		var/verb = input("Please choose a verb to remove.","Verbs",null) as null|anything in H.verbs
		if(!H)
			to_chat(usr, "Mob doesn't exist anymore")
			return
		if(!verb)
			return
		else
			remove_verb(H, verb)


	else if(href_list["saveTemplate"])
		if(!check_rights(R_DEBUG|R_ADMIN))
			return

		var/mob/living/carbon/human/H = locate(href_list["saveTemplate"])

		if(!istype(H))
			to_chat(usr, "This can only be done to instances of type /mob/living/carbon/human")
			return

		var/templateName = input("Please select name for template.","Template name",null) as null|text

		if(!templateName)
			to_chat(usr, "Mob doesn't exist anymore")
			return
		else if (H.ckey)
			to_chat(usr, "Mob must not have a ckey associated with it")
		else if(!templateName)
			return
		else
			var/savefile/F = new("data/mobTemplates/" + templateName)

			var/list/contentsList = list()
			var/list/names = list()
			var/list/descs = list()
			var/list/parents = list()
			var/itemCount =0

			for(var/atom/obj in H.contents)
				if(istype(obj, /obj/item))
					if(istype(obj, /obj/item/underwear))
						continue // no
					if(istype(obj, /obj/item/organ))
						continue // no

					itemCount += 1
					parents["[itemCount]"] = "0"

					names["[itemCount]"] = obj.name
					descs["[itemCount]"] =obj.desc
					contentsList["[itemCount]"] = obj.type
					//log_debug("logged [itemCount] - [obj.type] to file")

					if(istype(obj, /obj/item/storage))
						var/storageItemCount = itemCount
						var/obj/item/storage/bag = obj
						for(var/atom/bagObj in bag.contents)
							itemCount += 1
							parents["[itemCount]"] = "[storageItemCount]"

							contentsList["[itemCount]"] = bagObj.type
							names["[itemCount]"] = bagObj.name
							descs["[itemCount]"] = bagObj.desc
							//log_debug("logged [itemCount] - [bagObj.type] to file")

							if(istype(bagObj, /obj/item/storage))
								var/storageItemCount2 = itemCount
								var/obj/item/storage/bag2 = bagObj
								for(var/atom/bagObj2 in bag2.contents)
									itemCount += 1
									parents["[itemCount]"] = "[storageItemCount2]"

									contentsList["[itemCount]"] = bagObj2.type
									names["[itemCount]"] = bagObj2.name
									descs["[itemCount]"] = bagObj2.desc

									//log_debug("logged [itemCount] -  [bagObj2.type] to file")






			F["Name"] << H.name


			F["Contents"] << list2params(contentsList)
			F["names"] << list2params(names)
			F["descs"] << list2params(descs)
			F["parents"] << list2params(parents)
			F["DNA"] << H.dna
			F["stats"] << H.stats
			F["form"] << H.form
			F["species_name"] << H.species_name
			F["species"] << H.species
			F["flavor_text"] << H.flavor_text
			F["faction"] << H.faction
			F["body_markings"] << H.body_markings

			//log_debug("Done!  [contentsList.len],[names.len],[descs.len],[parents.len]")

			//F << H

			//var/txtfile = file("data/mobTemplates/[templateName].txt")
			//F.ExportText("/",txtfile)

			to_chat(usr, "Template '[templateName]' saved successfully")

	else if(href_list["addorgan"])
		if(!check_rights(R_FUN))
			return

		var/mob/living/carbon/M = locate(href_list["addorgan"])
		if(!istype(M))
			to_chat(usr, "This can only be done to instances of type /mob/living/carbon")
			return

		var/new_organ = input("Please choose an organ to add.","Organ",null) as null|anything in typesof(/obj/item/organ)-/obj/item/organ
		if(!new_organ) return

		if(!M)
			to_chat(usr, "Mob doesn't exist anymore")
			return

		if(locate(new_organ) in M.internal_organs)
			to_chat(usr, "Mob already has that organ.")
			return

		new new_organ(M)


	else if(href_list["remorgan"])
		if(!check_rights(R_FUN))
			return

		var/mob/living/carbon/M = locate(href_list["remorgan"])
		if(!istype(M))
			to_chat(usr, "This can only be done to instances of type /mob/living/carbon")
			return

		var/obj/item/organ/rem_organ = input("Please choose an organ to remove.","Organ",null) as null|anything in M.internal_organs

		if(!M)
			to_chat(usr, "Mob doesn't exist anymore")
			return

		if(!(locate(rem_organ) in M.internal_organs))
			to_chat(usr, "Mob does not have that organ.")
			return

		to_chat(usr, "Removed [rem_organ] from [M].")
		rem_organ.removed()
		qdel(rem_organ)

	else if(href_list["fix_nano"])
		to_chat(usr, "This is depricated with the new asset cache system. Do not use")

	else if(href_list["regenerateicons"])
		if(!check_rights(0))	return

		var/mob/M = locate(href_list["regenerateicons"])
		if(!ismob(M))
			to_chat(usr, "This can only be done to instances of type /mob")
			return
		M.regenerate_icons()

	else if(href_list["adjustDamage"] && href_list["mobToDamage"])
		if(!check_rights(R_DEBUG|R_ADMIN|R_FUN))	return

		var/mob/living/L = locate(href_list["mobToDamage"])
		if(!istype(L)) return

		var/Text = href_list["adjustDamage"]

		var/amount =  input("Deal how much damage to mob? (Negative values here heal)","Adjust [Text]loss",0) as num

		if(!L)
			to_chat(usr, "Mob doesn't exist anymore")
			return

		switch(Text)
			if("brute")	L.adjustBruteLoss(amount)
			if("fire")	L.adjustFireLoss(amount)
			if("toxin")	L.adjustToxLoss(amount)
			if("oxygen")L.adjustOxyLoss(amount)
			if("brain")	L.adjustBrainLoss(amount)
			if("clone")	L.adjustCloneLoss(amount)
			else
				to_chat(usr, "You caused an error. DEBUG: Text:[Text] Mob:[L]")
				return

		if(amount != 0)
			log_admin("[key_name(usr)] dealt [amount] amount of [Text] damage to [L]")
			message_admins(SPAN_NOTICE("[key_name(usr)] dealt [amount] amount of [Text] damage to [L]"))
			href_list["datumrefresh"] = href_list["mobToDamage"]

	else if(href_list["call_proc"])
		var/datum/D = locate(href_list["call_proc"])
		if(istype(D) || istype(D, /client)) // can call on clients too, not just datums
			callproc_targetpicked(1, D)

	else if(href_list["teleport_here"])
		if(!check_rights(R_ADMIN|R_MOD|R_DEBUG))
			return

		var/atom/movable/A = locate(href_list["teleport_here"])
		if(!istype(A))
			to_chat(usr, "This can only be done to instances of movable atoms.")
			return

		var/turf/T = get_turf(usr)
		A.forceMove(T)

	else if(href_list["teleport_to"])
		if(!check_rights(R_ADMIN|R_MOD|R_DEBUG))
			return

		var/atom/A = locate(href_list["teleport_to"])
		if(!istype(A))
			to_chat(usr, "This can only be done to instances of atoms.")
			return

		usr.forceMove(get_turf(A))

	else if (href_list["saveCopy"])
		if(!check_rights(R_DEBUG|R_ADMIN|R_FUN))
			return

		var/atom/copy_target = locate(href_list["saveCopy"])
		if (!istype(copy_target, /atom)) //we NEED to make sure we aren't spawning datums or clients, the consequences if we were could be godawful
			return

		var/name = stripped_input(usr, "What will the name of this save slot be?") //stripped_input is arbitrary, replace if needed
		if (name in GLOB.var_copies)
			to_chat(usr, "<span class='warning'>A save with that name already exists! Try the remove save verb if you really want the name.</span>")
			return
		var/stop = FALSE
		var/list/vars_to_add = list()
		while(!stop) // this while loop was made out of me, niko, not understanding the optimal implementation of a loop like this, please replace if able
			var/var_to_copy = input(usr, "What is the exact name of the var you want to copy, case sensitive? Type stop to continue.")
			if (var_to_copy == "stop")
				stop = TRUE
				break
			if (var_to_copy in GLOB.banned_vars) //prevents any naughty vars from being copied
				to_chat(usr, "<span class='warning'>You cannot add [var_to_copy] as a copied var! It has been determined to be too dangerous/unstable.</span>")
				continue

			if (!(var_to_copy in copy_target.vars)) //causes a runtime otherwise
				to_chat(usr, "<span class='warning'>[var_to_copy] does not exist within [copy_target]!</span>")
				continue

			if (!(var_to_copy in vars_to_add))
				vars_to_add[var_to_copy] += copy_target.vars[var_to_copy] //we assign the value of vars[var_to_copy] to our temporary list's key of the same name

		var/typepath = "type" //keys are stored as text, usually, as is the case with most vars
		if (!vars_to_add[typepath]) //do we have a typepath?
			vars_to_add["type"] = copy_target.vars["type"] //we add the type now, because otherwise, we wouldn't know what to spawn
			// You may ask: Why not just forbid admins from assigning their own type? I didnt because it lets admins specify the type of thing they spawn in a roundabout way.

		GLOB.var_copies[name] += vars_to_add //This is where we create the var copy

		to_chat(usr, "<span class='warning'>Copy creation, named [name] successful.</span>")
		log_and_message_admins("created a new var copy, named [name] and with a var list of [vars_to_add.len] vars.</span>")

	if(href_list["datumrefresh"])
		var/datum/DAT = locate(href_list["datumrefresh"])
		if(istype(DAT, /datum) || istype(DAT, /client))
			debug_variables(DAT)

	if(href_list["addreagent"])
		if(!check_rights(NONE))
			return

		var/atom/A = locate(href_list["addreagent"])

		if(!A.reagents)
			var/amount = input(usr, "Specify the reagent size of [A]", "Set Reagent Size", 50) as num
			if(amount)
				A.create_reagents(amount)

		if(A.reagents)
			var/chosen_id
			var/list/reagent_options = sortList(GLOB.chemical_reagents_list)
			switch(alert(usr, "Choose a method.", "Add Reagents", "Enter ID", "Choose ID"))
				if("Enter ID")
					var/valid_id
					while(!valid_id)
						chosen_id = stripped_input(usr, "Enter the ID of the reagent you want to add.")
						if(!chosen_id) //Get me out of here!
							break
						for(var/ID in reagent_options)
							if(ID == chosen_id)
								valid_id = 1
						if(!valid_id)
							to_chat(usr, "<span class='warning'>A reagent with that ID doesn't exist!</span>")
				if("Choose ID")
					chosen_id = input(usr, "Choose a reagent to add.", "Choose a reagent.") as null|anything in reagent_options
			if(chosen_id)
				var/amount = input(usr, "Choose the amount to add.", "Choose the amount.", A.reagents.get_free_space()) as num
				if(amount)
					A.reagents.add_reagent(chosen_id, amount)
					log_admin("[key_name(usr)] has added [amount] units of [chosen_id] to \the [A]")
					message_admins("<span class='notice'>[key_name(usr)] has added [amount] units of [chosen_id] to \the [A]</span>")

	return
