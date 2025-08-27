/datum/job

	//The name of the job
	var/title = "NOPE"
	var/list/access = list()				// Useful for servers which either have fewer players, so each person needs to fill more than one role, or servers which like to give more access, so players can't hide forever in their super secure departments (I'm looking at you, chemistry!)
	var/list/cruciform_access = list()		// Assign this access into cruciform if target has it
	var/security_clearance = CLEARANCE_NONE	// Cruciform-specific access type, used by absolute doors
	var/list/software_on_spawn = list()		// Defines the software files that spawn on tablets and labtops
	var/list/core_upgrades = list()			// Defines the upgrades that would be installed into core implant on spawn, if any.
	var/flag = NONE							// Bitflags for the job
	var/department_flag = NONE
	var/faction = "None"					// Players will be allowed to spawn in as jobs that are set to "Station"
	var/total_positions = 0					// How many players can be this job
	var/spawn_positions = 0					// How many players can spawn in as this job
	var/current_positions = 0				// How many players have this job
	var/supervisors					// Supervisors, who this person answers to directly
	var/selection_color = "#ffffff"			// Selection screen color
	var/noob_name
	var/list/alt_titles
	var/list/alt_perks
	var/difficulty = "Null"

	var/req_admin_notify					// If this is set to 1, a text is printed to the player when jobs are assigned, telling him that he should let admins know that he has to disconnect.
	var/department					// Does this position have a department tag?
	var/head_position = FALSE				// Is this position Command?
	var/aster_guild_member = FALSE			// If this person's account authorized to register new accounts
	var/department_account_access = FALSE	// Can this position access the department acount, even if they're not a head?
	var/minimum_character_age = 0
	var/ideal_character_age = 30
	var/playtimerequired = 0				// How many minutes in this deaprtment are required to play this job?
	var/coltimerequired = 0					// How many minutes do we need to play of Colonist/Visitor before we're allowed this job?
	var/create_record = 1					// Do we announce/make records for people who spawn on this job?
	var/list/also_known_languages = list()	// additional chance based languages to all jobs.

	var/account_allowed = 1					// Does this job type come with a station account?
	var/wage = WAGE_LABOUR					// How much base wage does this job recieve per payday
	var/initial_balance	=	-1				// If set to a value other than -1, overrides the wage based initial balance calculation

	var/outfit_type							// The outfit the employee will be dressed in, if any

	var/loadout_allowed = TRUE				// Does this job allows loadout ?
	var/description = ""
	var/duties = ""
	var/loyalties = ""

	var/setup_restricted = FALSE
	var/list/disallow_species = list()

	//Character stats modifers
	var/list/stat_modifiers = list()

	// Sojourn Additions

	//Changes max hp
	var/health_modifier = 0

	//Does not display this job on the occupation setup screen
	var/latejoin_only = 0

	//Every hour playing this role gains this much time off. (Can be negative for off duty jobs!)
	var/timeoff_factor = 3

	/// Does this job spawn with an ID?
	var/has_id = TRUE

	// End Sojourn Additions

	var/list/perks = list()

/datum/job/proc/equip(var/mob/living/carbon/human/H, var/alt_title)
	var/decl/hierarchy/outfit/outfit = get_outfit() // Put alt_title in get_outfit() in order to turn on alternative name outfits.
	if(!outfit)										// in order to code in a custom outfit, make a subtype of the base job's outfit, then have that alternate name equal the alt path.
		return FALSE								// Pleas see Medical Doctors for an example.
	. = outfit.equip(H, title, alt_title)

/datum/job/proc/get_outfit(var/alt_title)
	if(alt_title && alt_titles)
		. = alt_titles[alt_title]
	. = . || outfit_type
	. = outfit_by_type(.)

/datum/job/proc/add_stats(var/mob/living/carbon/human/target)
	if(!ishuman(target))
		return FALSE
	for(var/name in src.stat_modifiers)
		target.stats.changeStat(name, stat_modifiers[name])
	for(var/perk in perks)
		target.stats.addPerk(perk)

	target.health += health_modifier
	target.maxHealth += health_modifier

	return TRUE

/datum/job/proc/finalTweaks(var/mob/living/carbon/human/target)
	var/datum/department/topDept
	var/datum/department/secondDept
	if (!istype(target))
		return FALSE

	if ((alt_perks) && (target.mind.role_alt_title in alt_perks)) // If an alternative job has alternative perks, change it out. Please see Salvager for example of syntax.
		perks = alt_perks[target.mind.role_alt_title]

//////////////////////////////////////
	for (var/counter in GLOB.all_departments)
		var/datum/department/selectedDept = GLOB.all_departments[counter]
		if ((SSjob.JobTimeCheck(target.ckey,selectedDept.jobs_in_department)) > 1200)     ////// AMOUNT OF TIME UNTIL THE PLAYER BECOMES EXPERIENCED
			if (!topDept)
				topDept = selectedDept
			else
				if (SSjob.JobTimeCheck(target.ckey,selectedDept.jobs_in_department) > SSjob.JobTimeCheck(target.ckey,topDept.jobs_in_department))
					secondDept = topDept
					topDept = selectedDept													// This code chunk goe through the different departments that have been tracked, and if they have
				else																		// played more time than the required variable above, it grants them a Perk regarding having "Experience"
					if (!secondDept)														// in that particular department.
						secondDept = selectedDept
					else
						if (SSjob.JobTimeCheck(target.ckey,selectedDept.jobs_in_department) > SSjob.JobTimeCheck(target.ckey,secondDept.jobs_in_department))
							secondDept = selectedDept
			if (target.mind.assigned_job)
				var/datum/job/checkedJob = target.mind.assigned_job
				if ((checkedJob.department == selectedDept.id) && ((checkedJob.department == topDept.id) || (checkedJob.department == secondDept.id)))
					to_chat(world, SPAN_DANGER("Huzzah."))
					var/list/paths = subtypesof(/datum/perk/experienced)
					for (var/T in paths)
						var/datum/perk/experienced/pathCheck = new T
						if ((!pathCheck.subPerk) && (target.mind.assigned_job.department == pathCheck.dept))// Also, you can only have two of these Perks, so you can only have the Perks
							perks += list(pathCheck.type)																		// for two highest played departments.

/////////////////////////////////////////

/datum/job/proc/add_additiional_language(var/mob/living/carbon/human/target)
	if(!ishuman(target))
		return FALSE

	var/mob/living/carbon/human/H = target

	if(!also_known_languages.len)
		return FALSE

	var/i

	for(i in also_known_languages)
		if(prob(also_known_languages[i]))
			H.add_language(i)

	return TRUE



/datum/job/proc/setup_account(var/mob/living/carbon/human/H)
	if(!account_allowed || (H.mind && H.mind.initial_account))
		return

	var/nepotism = 1
	if(H && H.stats.getPerk(PERK_NEPOTISM))
		nepotism += 0.3

	var/money_amount = one_time_payment(nepotism)
	var/datum/money_account/M = create_account(H.real_name, money_amount, null, department, wage, aster_guild_member)
	if(H.mind)
		var/remembered_info = ""
		remembered_info += "<b>Your account number is:</b> #[M.account_number]<br>"
		remembered_info += "<b>Your account pin is:</b> [M.remote_access_pin]<br>"
		remembered_info += "<b>Your account funds are:</b> [M.money][CREDS]<br>"

		if(M.transaction_log.len)
			var/datum/transaction/T = M.transaction_log[1]
			remembered_info += "<b>Your account was created:</b> [T.time], [T.date] at [T.source_terminal]<br>"
		H.mind.store_memory(remembered_info)

		H.mind.initial_account = M

	to_chat(H, SPAN_NOTICE("<b>Your account number is: [M.account_number], your account pin is: [M.remote_access_pin]</b>"))

// overrideable separately so AIs/borgs can have cardborg hats without unneccessary new()/qdel()
/datum/job/proc/equip_preview(mob/living/carbon/human/H, var/alt_title, var/datum/branch, var/additional_skips)
	var/decl/hierarchy/outfit/outfit = get_outfit(H, alt_title)
	if(!outfit)
		return FALSE
	. = outfit.equip(H, title, alt_title, OUTFIT_ADJUSTMENT_SKIP_POST_EQUIP|OUTFIT_ADJUSTMENT_SKIP_ID_PDA|additional_skips)

/datum/job/proc/get_access()
	return src.access.Copy()

/datum/job/proc/is_experienced_enough(client/C) //This can be reimplemented if you want to have special requirements for jobs.
	var/are_we_experienced_enough = FALSE //We start under the assumption of NO!
	var/list/jobs_in_department = list() //What jobs are in this department?

	for(var/job in GLOB.joblist)
		var/datum/job/J = GLOB.joblist[job]
		if(department_flag == COMMAND)
			if(department_flag & J.department_flag)
				jobs_in_department += "[J.type]"
		else
			if(department == J.department)
				jobs_in_department += "[J.type]"
	if(playtimerequired > 0)
		if(C)
			if(C.ckey)
				if(SSjob.JobTimeAutoCheck(C.ckey, "[type]", jobs_in_department, playtimerequired))
					are_we_experienced_enough = TRUE //We are experienced enough, hurray.
	if(coltimerequired > 0)
		if(C)
			if(C.ckey)
				if(SSjob.JobTimeAutoCheck(C.ckey, "[type]", "/datum/job/assistant", coltimerequired))
					are_we_experienced_enough = TRUE //We are experienced enough as a colonist, hurray.
	if(playtimerequired == 0 && coltimerequired == 0)
		are_we_experienced_enough = TRUE //We're doing a job that requires 0 experience, hurray.
	return are_we_experienced_enough

/datum/job/proc/apply_fingerprints(var/mob/living/carbon/human/target)
	if(!istype(target))
		return 0
	for(var/obj/item/item in target.contents)
		apply_fingerprints_to_item(target, item)
	return 1
/*
//If the configuration option is set to require players to be logged as old enough to play certain jobs, then this proc checks that they are, otherwise it just returns 1
/datum/job/proc/player_old_enough(client/C)
	return (available_in_days(C) == 0) //Available in 0 days = available right now = player is old enough to play.

/datum/job/proc/available_in_days(client/C)
	if(C && config.use_age_restriction_for_jobs && isnull(C.holder) && isnum(C.player_age) && isnum(minimal_player_age))
		return max(0, minimal_player_age - C.player_age)
	return 0
*/
/datum/job/proc/apply_fingerprints_to_item(var/mob/living/carbon/human/holder, var/obj/item/item)
	item.add_fingerprint(holder,1)
	if(item.contents.len)
		for(var/obj/item/sub_item in item.contents)
			apply_fingerprints_to_item(holder, sub_item)

/datum/job/proc/is_position_available()
	return (current_positions < total_positions) || (total_positions == -1)

/datum/job/proc/is_restricted(datum/preferences/prefs, feedback)
	if(is_setup_restricted(prefs.setup_options))
		to_chat(feedback, "<span class='boldannounce'>[setup_restricted ? "The job requires you to pick a specific setup option." : "The job conflicts with one of your setup options."]</span>")
		return TRUE

	if(prefs.species_form in disallow_species)
		to_chat(feedback, "<span class='boldannounce'>[setup_restricted ? "You are playing a species that cannot take this job." : "The job conflicts with one of your setup options."]</span>")
		return TRUE

	if(minimum_character_age && (prefs.age < minimum_character_age))
		to_chat(feedback, "<span class='boldannounce'>Not old enough. Minimum character age is [minimum_character_age].</span>")
		return TRUE

	if(!is_experienced_enough(prefs.client))
		to_chat(feedback, "<span class='boldannounce'>Not experienced enough. This job requires that you play [coltimerequired] minutes of colonist and [playtimerequired] in the [department] department.</span>")
		return TRUE
	//Disabled since I rewrote the system to be more granular. Will need later work.
	/*if(coltimerequired)
		if(coltimerequired > prefs.playtime["Civilian"])
			to_chat(feedback, "<span class='boldannounce'>Not enough playtime as a colonist. Minimum playtime is [coltimerequired] minutes.</span>")
			return TRUE

	if(playtimerequired)
		if(playtimerequired > prefs.playtime[department])
			to_chat(feedback, "<span class='boldannounce'>Not enough playtime in this department. Minimum playtime is [playtimerequired] minutes.</span>")
			return TRUE*/
	return FALSE

/datum/job/proc/is_setup_restricted(list/options)
	. = setup_restricted
	for(var/category in options)
		var/datum/category_item/setup_option/option = SScharacter_setup.setup_options[category][options[category]]
		if(!option)
			continue
			//warning("Option [options[category]] could not be found in SScharacter category [category]")
		if(type in option.restricted_jobs)
			return TRUE
		if(type in option.allowed_jobs)
			. = FALSE

//	Creates mannequin with equipment for current job and stores it for future reference
//	used for preview
//	You can use getflaticon(mannequin) to get icon out of it
/datum/job/proc/get_job_mannequin()
	if(!SSjob.job_mannequins[title])
		var/mob/living/carbon/human/dummy/mannequin/mannequin = get_mannequin("#job_icon_[title]")
		dress_mannequin(mannequin)

		SSjob.job_mannequins[title] = mannequin
	return SSjob.job_mannequins[title]

/datum/job/proc/get_description_blurb()
	var/job_desc = ""
	//Here's the actual content of the description
	if (description)
		job_desc += "<h1>Overview:</h1>"
		job_desc += "<hr>"
		job_desc += description
		job_desc += "<br>"

	if (duties)
		job_desc += "<h1>Duties:</h1>"
		job_desc += "<hr>"
		job_desc += duties
		job_desc += "<br>"

	if (loyalties)
		job_desc += "<h1>Loyalties:</h1>"
		job_desc += "<hr>"
		job_desc += loyalties
		job_desc += "<br>"

	return job_desc

/datum/job/proc/dress_mannequin(var/mob/living/carbon/human/dummy/mannequin/mannequin)
	mannequin.delete_inventory(TRUE)
	equip_preview(mannequin, additional_skips = OUTFIT_ADJUSTMENT_SKIP_BACKPACK|OUTFIT_ADJUSTMENT_SKIP_SURVIVAL_GEAR)



// Check client-specific availability rules.
// We don't have an SQL server nor do we really care that much about
// enforcing this mechanically.
/datum/job/proc/player_has_enough_pto(client/C)
	return TRUE

/datum/job/proc/change_playtime(client/C, var/amount = 0)
	//The string processing is necessary so that string queries can return too.
	//For some reason, /datum/job/hydro and "/datum/job/hydro" are not considered the same string.
	SSjob.JobTimeAdd(C.ckey, "[type]", amount)
