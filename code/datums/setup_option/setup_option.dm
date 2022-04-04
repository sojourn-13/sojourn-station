/datum/category_collection/setup_option_collection
	category_group_type = /datum/category_group/setup_option_category

/datum/category_group/setup_option_category

/datum/category_item/setup_option
	name = "None"
	var/desc = ""
	var/restricted_depts = 0          //department_flag
	var/allowed_depts = 0
	var/list/restricted_jobs = list() //job paths
	var/list/allowed_jobs = list()
	var/list/stat_modifiers = list()  //STAT = number
	var/list/perks = list()           //perk paths
	var/allow_modifications = TRUE
	var/list/restricted_to_species = list()
	var/obj/item/organ_module/racial_implants = null // Implants for the right arm
	var/obj/item/organ_module/racial_implants_l = null // Implants for the left arm
	var/obj/item/organ_module/racial_implants_head = null // head implants

/datum/category_item/setup_option/New()
	. = ..()
	for(var/job in GLOB.joblist)
		var/datum/job/J = GLOB.joblist[job]
		if(!J.setup_restricted)
			if(J.type in allowed_jobs)
				allowed_jobs -= J.type //job is not setup_restricted so no reason to keep it
				                       //however do not add to restricted as it was explicitly allowed
			else if(J.department_flag & restricted_depts)
				restricted_jobs |= J.type
		else
			if(J.type in restricted_jobs)
				restricted_jobs -= J.type
			else if(J.department_flag & allowed_depts)
				allowed_jobs |= J.type

/datum/category_item/setup_option/proc/apply(mob/living/carbon/human/character)
	for(var/stat in src.stat_modifiers)
		character.stats.changeStat(stat, stat_modifiers[stat])
	for(var/perk in src.perks)
		character.stats.addPerk(perk)
	if(racial_implants)
		var/obj/item/organ_module/install_implant = new racial_implants
		install_implant.install(character.organs_by_name[BP_R_ARM])
	if(racial_implants_l)
		var/obj/item/organ_module/install_implant = new racial_implants_l
		install_implant.install(character.organs_by_name[BP_L_ARM])
	if(racial_implants_head)
		var/obj/item/organ_module/install_implant = new racial_implants_head
		install_implant.install(character.organs_by_name[BP_HEAD])

/datum/category_item/setup_option/proc/get_icon()