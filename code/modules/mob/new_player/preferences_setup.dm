//#define ASSIGN_LIST_TO_COLORS(L, R, G, B) if(L) { R = L[1]; G = L[2]; B = L[3]; }

/datum/preferences
	//The mob should have a gender you want before running this proc. Will run fine without H
	proc/randomize_appearance_and_body_for(var/mob/living/carbon/human/H)
		var/datum/species/current_species = all_species[SPECIES_HUMAN]
		var/datum/species_form/current_form = GLOB.all_species_form_list[species_form]
		if(!current_form) current_form = GLOB.all_species_form_list[FORM_HUMAN]
		gender = pick(current_species.genders)
		h_style = random_hair_style(gender, species)
		f_style = random_facial_hair_style(gender, species)
		if(current_species)
			s_tone = random_skin_tone()
			if(current_form.appearance_flags & HAS_EYE_COLOR)
			//ASSIGN_LIST_TO_COLORS(current_species.get_random_eye_color(), r_eyes, g_eyes, b_eyes)
				randomize_eyes_color()
			if(current_form.appearance_flags & HAS_SKIN_COLOR)
				randomize_skin_color()
				//ASSIGN_LIST_TO_COLORS(current_species.get_random_skin_color(), r_skin, g_skin, b_skin)
			if(current_form.appearance_flags & HAS_HAIR_COLOR)
				randomize_hair_color("hair")
				randomize_hair_color("facial")
				/*
				//var/hair_colors = current_species.get_random_hair_color()
				var/hair_colors = ReadRGB("#000000")
				if(hair_colors)
					ASSIGN_LIST_TO_COLORS(hair_colors, r_hair, g_hair, b_hair)

					if(prob(75))
						r_facial = r_hair
						g_facial = g_hair
						b_facial = b_hair
					else
						//ASSIGN_LIST_TO_COLORS(current_species.get_random_facial_hair_color(), r_facial, g_facial, b_facial)
						ASSIGN_LIST_TO_COLORS(ReadRGB("#000000"), r_facial, g_facial, b_facial)
				*/
		if(current_form.appearance_flags & HAS_UNDERWEAR)
			if(all_underwear)
				all_underwear.Cut()
			for(var/datum/category_group/underwear/WRC in GLOB.underwear.categories)
				var/datum/category_item/underwear/WRI = pick(WRC.items)
				all_underwear[WRC.name] = WRI.name

		backpack = decls_repository.get_decl(pick(subtypesof(/decl/backpack_outfit)))
		age = rand(current_species.min_age, current_species.max_age)
		b_type = RANDOM_BLOOD_TYPE
		if(H)
			copy_to(H)

//#undef ASSIGN_LIST_TO_COLORS

/datum/preferences/proc/randomize_hair_color(var/target = "hair")
	if(prob (75) && target == "facial") // Chance to inherit hair color
		facial_color = hair_color
		return

	var/red
	var/green
	var/blue

	var/col = pick ("blonde", "black", "chestnut", "copper", "brown", "wheat", "old", "punk")
	switch(col)
		if("blonde")
			red = 255
			green = 255
			blue = 0
		if("black")
			red = 0
			green = 0
			blue = 0
		if("chestnut")
			red = 153
			green = 102
			blue = 51
		if("copper")
			red = 255
			green = 153
			blue = 0
		if("brown")
			red = 102
			green = 51
			blue = 0
		if("wheat")
			red = 255
			green = 255
			blue = 153
		if("old")
			red = rand (100, 255)
			green = red
			blue = red
		if("punk")
			red = rand (0, 255)
			green = rand (0, 255)
			blue = rand (0, 255)

	red = max(min(red + rand (-25, 25), 255), 0)
	green = max(min(green + rand (-25, 25), 255), 0)
	blue = max(min(blue + rand (-25, 25), 255), 0)

	switch(target)
		if("hair")
			hair_color = rgb(red, green, blue)
		if("facial")
			facial_color = rgb(red, green, blue)

/datum/preferences/proc/randomize_eyes_color()
	var/red
	var/green
	var/blue

	var/col = pick ("black", "grey", "brown", "chestnut", "blue", "lightblue", "green", "albino")
	switch(col)
		if("black")
			red = 0
			green = 0
			blue = 0
		if("grey")
			red = rand (100, 200)
			green = red
			blue = red
		if("brown")
			red = 102
			green = 51
			blue = 0
		if("chestnut")
			red = 153
			green = 102
			blue = 0
		if("blue")
			red = 51
			green = 102
			blue = 204
		if("lightblue")
			red = 102
			green = 204
			blue = 255
		if("green")
			red = 0
			green = 102
			blue = 0
		if("albino")
			red = rand (200, 255)
			green = rand (0, 150)
			blue = rand (0, 150)

	red = max(min(red + rand (-25, 25), 255), 0)
	green = max(min(green + rand (-25, 25), 255), 0)
	blue = max(min(blue + rand (-25, 25), 255), 0)

	eyes_color = rgb(red, green, blue)

/datum/preferences/proc/randomize_skin_color()
	var/red
	var/green
	var/blue

	var/col = pick ("black", "grey", "brown", "chestnut", "blue", "lightblue", "green", "albino")
	switch(col)
		if("black")
			red = 0
			green = 0
			blue = 0
		if("grey")
			red = rand (100, 200)
			green = red
			blue = red
		if("brown")
			red = 102
			green = 51
			blue = 0
		if("chestnut")
			red = 153
			green = 102
			blue = 0
		if("blue")
			red = 51
			green = 102
			blue = 204
		if("lightblue")
			red = 102
			green = 204
			blue = 255
		if("green")
			red = 0
			green = 102
			blue = 0
		if("albino")
			red = rand (200, 255)
			green = rand (0, 150)
			blue = rand (0, 150)

	red = max(min(red + rand (-25, 25), 255), 0)
	green = max(min(green + rand (-25, 25), 255), 0)
	blue = max(min(blue + rand (-25, 25), 255), 0)

	skin_color = rgb(red, green, blue)

/datum/preferences/proc/dress_preview_mob(var/mob/living/carbon/human/mannequin, naked = FALSE)
	var/update_icon = TRUE
	var/list/leftover_to_equip = list()
	copy_to(mannequin, TRUE)

	if(!naked)
		var/datum/job/previewJob
		if(equip_preview_mob && SSjob)
			// Determine what job is marked as 'High' priority, and dress them up as such.
			if("Assistant" in job_low)
				previewJob = SSjob.GetJob("Assistant")
			else
				for(var/datum/job/job in SSjob.occupations)
					if(job.title == job_high)
						previewJob = job
						break
		else
			return

		if((equip_preview_mob & EQUIP_PREVIEW_JOB) && previewJob)
			mannequin.job = previewJob.title
			previewJob.equip_preview(mannequin, player_alt_titles[previewJob.title])
			update_icon = TRUE

		if((equip_preview_mob & EQUIP_PREVIEW_LOADOUT) && !(previewJob && (equip_preview_mob & EQUIP_PREVIEW_JOB) && (previewJob.type == /datum/job/ai || previewJob.type == /datum/job/cyborg)))
			// Equip custom gear loadout, replacing any job items
			var/list/loadout_taken_slots = list()
			for(var/thing in Gear())
				var/datum/gear/G = gear_datums[thing]
				if(G)
					var/permitted = 0
					if(G.allowed_roles && G.allowed_roles.len)
						if(previewJob)
							for(var/job_title in G.allowed_roles)
								if(previewJob.title == job_title)
									permitted = 1
					else
						permitted = 1

					if(G.whitelisted && (G.whitelisted != mannequin.species.name))
						permitted = 0

					if(!permitted)
						continue

					if(G.slot == slot_accessory_buffer)
						leftover_to_equip.Add(G) //Save accessories 'til last
						update_icon = TRUE

					if(G.slot && G.slot != slot_accessory_buffer && !(G.slot in loadout_taken_slots) && G.spawn_on_mob(mannequin, gear_list[gear_slot][G.display_name]))
						loadout_taken_slots.Add(G.slot)
						update_icon = TRUE

			if(leftover_to_equip) //Equip accessories to the preview
				var/obj/item/clothing/under/under = mannequin.w_uniform
				for(var/datum/gear/thing in leftover_to_equip)
					under.attach_accessory(null, thing.spawn_item(mannequin, gear_list[gear_slot][thing.display_name]))

	if(update_icon)
		mannequin.update_icons()
