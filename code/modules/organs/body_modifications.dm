var/global/list/body_modifications = list()
var/global/list/modifications_types = list(
	BP_CHEST = "",  "chest2" = "", BP_HEAD = "",   BP_GROIN = "",
	BP_L_ARM  = "", BP_R_ARM  = "", BP_L_LEG  = "", BP_R_LEG  = "",
	OP_HEART  = "", OP_LUNGS  = "", OP_LIVER  = "", OP_EYES   = "",
	OP_KIDNEY_LEFT = "", OP_KIDNEY_RIGHT = "" , OP_STOMACH = "", BP_BRAIN = ""
)

/proc/generate_body_modification_lists()
	for(var/mod_type in typesof(/datum/body_modification))
		var/datum/body_modification/BM = new mod_type()
		if(!BM.id)
			continue
		body_modifications[BM.id] = BM
		var/class = ""
		if(BM.allowed_species && BM.allowed_species.len)
			class = " limited [BM.allowed_species.Join(" ")]"
		for(var/part in BM.body_parts)
			modifications_types[part] += "<div style = 'padding:2px' onclick=\"set('body_modification', '[BM.id]');\" class='block[class]'><b>[BM.name]</b><br>[BM.desc]</div>"

/proc/get_default_modificaton(var/nature = MODIFICATION_ORGANIC)
	switch(nature)
		if(MODIFICATION_ORGANIC, MODIFICATION_SUPERIOR, MODIFICATION_SLIME)
			return body_modifications["nothing"]
		if(MODIFICATION_SILICON)
			return body_modifications["robotize_organ"]
		if(MODIFICATION_REMOVED)
			return body_modifications["amputated"]

/datum/body_modification
	var/name = ""
	var/short_name = ""
	var/id = ""								// For savefile. Must be unique.
	var/desc = ""							// Description.
	var/list/body_parts = list(				// For sorting'n'selection optimization.
		BP_CHEST, BP_BACK, BP_HEAD, BP_GROIN, BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG,\
		OP_HEART, OP_LUNGS, OP_LIVER, BP_BRAIN, OP_EYES, OP_KIDNEY_LEFT, OP_KIDNEY_RIGHT, OP_STOMACH)
	var/list/allowed_species = list("Human")// Species restriction.
	var/replace_limb = null					// To draw usual limb or not.
	var/mob_icon = ""
	var/icon/icon = 'icons/mob/human_races/body_modification.dmi'
	var/nature = MODIFICATION_ORGANIC
	var/hascolor = FALSE
	var/allow_nt = TRUE
	var/list/department_specific = ALL_DEPARTMENTS

/datum/body_modification/proc/get_mob_icon(organ, body_build = "", color="#ffffff", gender = MALE, var/datum/species_form/species_form)	//Use in setup character only
	return new/icon('icons/mob/human.dmi', "blank")

/datum/body_modification/proc/is_allowed(organ = "", datum/preferences/P, mob/living/carbon/human/H)
	if(!organ || !(organ in body_parts))
		//usr << "[name] isn't useable for [organ]"
		return FALSE
	var/parent_organ
	for(var/organ_parent in organ_structure)
		var/list/organ_data = organ_structure[organ_parent]
		if(organ in organ_data["children"])
			parent_organ = organ_parent

	if(parent_organ)
		var/datum/body_modification/parent = P.get_modification(parent_organ)
		if(parent.nature > nature)
			to_chat(usr, "[name] can't be attached to [parent.name]")
			return FALSE

	if(department_specific.len && !(department_specific ~= ALL_DEPARTMENTS))
		if(H && H.mind)
			var/department = H.mind.assigned_job.department
			if(!department)
				return FALSE
			if(!department_specific.Find(department))
				to_chat(usr, "This body-mod does not match your chosen department.")
				return FALSE
		else if(P)
			var/datum/job/J
			if(ASSISTANT in P.job_low)
				J = SSjob.GetJob(ASSISTANT)
			else
				J = SSjob.GetJob(P.job_high)
			if(!J || !department_specific.Find(J.department))
				to_chat(usr, "This body-mod does not match your highest-priority department.")
				return FALSE

	if(!allow_nt && H?.get_core_implant(/obj/item/implant/core_implant/cruciform))
		to_chat(usr, "Your cruciform prevents you from using this modification.")
		return FALSE

	return TRUE

/datum/body_modification/proc/create_organ(var/mob/living/carbon/holder, var/organ, var/color)
	return null

/datum/body_modification/none
	name = "Unmodified organ"
	id = "nothing"
	short_name = "Nothing"
	desc = "Normal organ."
	allowed_species = null

/datum/body_modification/none/create_organ(var/mob/living/carbon/holder, var/datum/organ_description/OD, var/color)
	if(istype(OD))
		return OD.create_organ(holder,OD)
	else if(ispath(OD))
		return new OD(holder)
	else
		return null


/datum/body_modification/limb/create_organ(var/mob/living/carbon/holder, var/datum/organ_description/OD, var/color)
	if(replace_limb)
		return new replace_limb(holder,OD)
	else
		return new OD.default_type(holder,OD)

/datum/body_modification/limb/amputation
	name = "Removed"
	short_name = "Removed"
	id = "amputated"
	desc = "Organ was removed."
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG, OP_KIDNEY_LEFT, OP_KIDNEY_RIGHT, OP_EYES) // No more headless, crotchless people. Also organs are VITAL!
	replace_limb = 1
	nature = MODIFICATION_REMOVED

/datum/body_modification/limb/amputation/create_organ()
	return null

/datum/body_modification/limb/prosthesis
	name = "Unbranded"
	id = "prosthesis_basic"
	desc = "A simple, brutal and reliable prosthesis."
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)
	replace_limb = /obj/item/organ/external/robotic
	icon = 'icons/mob/human_races/cyberlimbs/generic.dmi'
	nature = MODIFICATION_SILICON
	allow_nt = TRUE

/datum/body_modification/limb/prosthesis/New()
	var/obj/item/organ/external/robotic/R = replace_limb
	name = initial(R.name)
	icon = initial(R.force_icon)
	desc = initial(R.desc)
	short_name = "P: [name]"
	name = "Prosthesis: [name]"

/datum/body_modification/limb/prosthesis/get_mob_icon(organ, body_build, color, gender, species)
	return new/icon(icon, "[organ][gender == FEMALE ? "_f" : "_m"][body_build]")

/datum/body_modification/limb/prosthesis/bishop
	id = "prosthesis_bishop"
	replace_limb = /obj/item/organ/external/robotic/bishop
	icon = 'icons/mob/human_races/cyberlimbs/bishop.dmi'

/datum/body_modification/limb/prosthesis/hesphaistos
	id = "prosthesis_hesphaistos"
	replace_limb = /obj/item/organ/external/robotic/hesphaistos
	icon = 'icons/mob/human_races/cyberlimbs/hesphaistos.dmi'

/datum/body_modification/limb/prosthesis/hesphaistos/alt
	id = "prosthesis_hesphaistos_alt"
	replace_limb = /obj/item/organ/external/robotic/hesphaistos/athena
	icon = 'icons/mob/human_races/cyberlimbs/hesphaistos_alt.dmi'

/datum/body_modification/limb/prosthesis/zenghu
	id = "prosthesis_zenghu"
	replace_limb = /obj/item/organ/external/robotic/zenghu
	icon = 'icons/mob/human_races/cyberlimbs/zenghu.dmi'

/datum/body_modification/limb/prosthesis/xion
	id = "prosthesis_xion"
	replace_limb = /obj/item/organ/external/robotic/xion
	icon = 'icons/mob/human_races/cyberlimbs/xion.dmi'

/datum/body_modification/limb/prosthesis/ward
	id = "ward"
	replace_limb = /obj/item/organ/external/robotic/ward
	icon = 'icons/mob/human_races/cyberlimbs/ward.dmi'

/datum/body_modification/limb/prosthesis/ward/spirit
	id = "prosthesis_spirit"
	replace_limb = /obj/item/organ/external/robotic/ward/spirit
	icon = 'icons/mob/human_races/cyberlimbs/spirit.dmi'

/datum/body_modification/limb/prosthesis/asters
	id = "prosthesis_asters"
	replace_limb = /obj/item/organ/external/robotic/asters
	icon = 'icons/mob/human_races/cyberlimbs/asters.dmi'
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)

/datum/body_modification/limb/prosthesis/serbian
	id = "prosthesis_serbian"
	replace_limb = /obj/item/organ/external/robotic/serbian
	icon = 'icons/mob/human_races/cyberlimbs/serbian.dmi'
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)

/datum/body_modification/limb/prosthesis/frozen_star
	id = "prosthesis_frozen_star"
	replace_limb = /obj/item/organ/external/robotic/frozen_star
	icon = 'icons/mob/human_races/cyberlimbs/frozen_star.dmi'

/datum/body_modification/limb/prosthesis/technomancer
	id = "prosthesis_technomancer"
	replace_limb = /obj/item/organ/external/robotic/technomancer
	icon = 'icons/mob/human_races/cyberlimbs/technomancer.dmi'

/datum/body_modification/limb/prosthesis/junktech
	id = "prosthesis_ghetto"
	replace_limb = /obj/item/organ/external/robotic/junktech
	icon = 'icons/mob/human_races/cyberlimbs/advanced_ghetto.dmi'
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)

/datum/body_modification/limb/prosthesis/synthskin
	id = "prosthesis_full_body_prosthetic"
	replace_limb = /obj/item/organ/external/robotic/synthskin
	icon = 'icons/mob/human_races/cyberlimbs/fbp.dmi'

/datum/body_modification/limb/prosthesis/moebius
	id = "prosthesis_moebius"
	replace_limb = /obj/item/organ/external/robotic/moebius
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)
	icon = 'icons/mob/human_races/cyberlimbs/moebius.dmi'
	department_specific = list(DEPARTMENT_MEDICAL, DEPARTMENT_SCIENCE)

/datum/body_modification/limb/prosthesis/blackshield
	id = "prosthesis_blackshield"
	replace_limb = /obj/item/organ/external/robotic/blackshield
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)
	icon = 'icons/mob/human_races/cyberlimbs/blackshield.dmi'
	department_specific = list(DEPARTMENT_SECURITY, DEPARTMENT_BLACKSHIELD)

/datum/body_modification/limb/prosthesis/church
	id = "prosthesis_church"
	replace_limb = /obj/item/organ/external/robotic/church
	body_parts = list(BP_L_ARM, BP_R_ARM, BP_L_LEG, BP_R_LEG)
	icon = 'icons/mob/human_races/cyberlimbs/church.dmi'

/datum/body_modification/limb/mutation/New()
	short_name = "M: [name]"
	name = "Mutation: [name]"

////Organ Modules////
/datum/body_modification/limb/organ_module
	replace_limb = null
	allow_nt = FALSE
	var/module_type = null

/datum/body_modification/limb/organ_module/create_organ(var/mob/living/carbon/holder, var/datum/organ_description/OD, var/color)
	var/obj/item/organ/external/E = ..()
	if(module_type)
		var/obj/item/organ_module/OM = new module_type()
		OM.install(E)
	return E

////Internals////
/datum/body_modification/organ/create_organ(var/mob/living/carbon/holder, var/organ, var/color)
	if(replace_limb)
		return new replace_limb(holder)
	else
		return new organ(holder)
/* Commented out due to no way to differenciate them.
/datum/body_modification/organ/assisted
	name = "Assisted organ"
	short_name = "P: assisted"
	id = "assisted"
	desc = "Assisted organ."
	body_parts = list(OP_HEART, OP_LUNGS, OP_KIDNEY_LEFT, OP_KIDNEY_RIGHT, OP_STOMACH, BP_BRAIN, OP_LIVER, OP_EYES)

/datum/body_modification/organ/assisted/create_organ(var/mob/living/carbon/holder, var/O, var/color)
	var/obj/item/organ/I = ..(holder,O,color)
	I.nature = MODIFICATION_ASSISTED
	I.min_bruised_damage = 15
	I.min_broken_damage = 35
	return I
*/

/datum/body_modification/organ/robotize_organ
	name = "Robotic organ"
	short_name = "P: prosthesis"
	id = "robotize_organ"
	desc = "Robotic organ."
	body_parts = list(OP_HEART, OP_LUNGS, OP_KIDNEY_LEFT, OP_KIDNEY_RIGHT, OP_STOMACH, BP_BRAIN, OP_LIVER, OP_EYES)
	nature = MODIFICATION_SILICON

/datum/body_modification/organ/robotize_organ/create_organ(var/mob/living/carbon/holder, O, color)
	var/obj/item/organ/I = ..(holder,O,color)
	I.nature = MODIFICATION_SILICON
	if(istype(I, /obj/item/organ/internal/eyes))
		var/obj/item/organ/internal/eyes/E = I
		E.robo_color = iscolor(color) ? color : "#FFFFFF"
	return I

////Eyes////

/datum/body_modification/organ/oneeye
	name = "One eye (left)"
	short_name = "M: One eye (l)"
	id = "missed_eye"
	desc = "One of your eyes was missed."
	body_parts = list(BP_EYES)
	hascolor = TRUE
	replace_limb = /obj/item/organ/internal/eyes/oneeye

/datum/body_modification/organ/oneeye/get_mob_icon(organ, body_build, color, gender, species_form)
	var/datum/species_form/S = GLOB.all_species_form_list[species_form]
	var/icon/I = new/icon(S.face, "eye_l[body_build]")
	I.Blend(color, ICON_ADD)
	return I

/datum/body_modification/organ/oneeye/create_organ(var/mob/living/carbon/human/holder, var/organ, var/color)
	var/obj/item/organ/internal/eyes/E = ..(holder,organ,color)
	E.eyes_color = color
	return E

/datum/body_modification/organ/oneeye/right
	name = "One eye (right)"
	short_name = "M: One eye (r)"
	id = "missed_eye_right"
	replace_limb = /obj/item/organ/internal/eyes/oneeye/right

/datum/body_modification/organ/oneeye/right/get_mob_icon(organ, body_build, color, gender, species_form)
	var/datum/species_form/S = GLOB.all_species_form_list[species_form]
	var/icon/I = new/icon(S.face, "eye_r[body_build]")
	I.Blend(color, ICON_ADD)
	return I

/datum/body_modification/organ/heterochromia
	name = "Heterochromia"
	short_name = "M: Heterochromia"
	id = "mutation_heterochromia"
	desc = "Special color for left eye."
	body_parts = list(BP_EYES)
	hascolor = TRUE

/datum/body_modification/organ/heterochromia/get_mob_icon(organ, body_build, color, gender, species_form)
	var/datum/species_form/S = GLOB.all_species_form_list[species_form]
	var/icon/I = new/icon(S.face, "eye_l[body_build]")
	I.Blend(color, ICON_ADD)
	return I

/datum/body_modification/organ/heterochromia/create_organ(var/mob/living/carbon/holder, organ_type, color)
	var/obj/item/organ/internal/eyes/heterohromia/E = new(holder,organ_type,color)
	E.second_color = color
	return E
