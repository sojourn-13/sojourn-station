/obj/item/organ/internal
	max_damage = IORGAN_STANDARD_HEALTH
	min_bruised_damage = IORGAN_STANDARD_BRUISE
	min_broken_damage = IORGAN_STANDARD_BREAK
	var/list/owner_verbs = list()
	var/list/organ_efficiency = list()	//Efficency of an organ, should become the most important variable
	var/list/initial_owner_verbs = list()		// For refreshing when a mod is removed
	var/list/initial_organ_efficiency = list()
	var/unique_tag						//If an organ is unique and doesn't scale off of organ processes
	var/specific_organ_size = 1 		//Space organs take up in weight calculations, unaffected by w_class for balance reasons
	var/max_blood_storage = 0			//How much blood an organ stores. Base is 5 * blood_req, so the organ can survive without blood for 5 ticks beofre taking damage (+ blood supply of blood vessels)
	var/current_blood = 100				//How much blood is currently in the organ
	var/blood_req = 0					//How much blood an organ takes to funcion
	var/scanner_hidden = FALSE 			//Does this organ show on a body scanner?
	var/nutriment_req = 0				//Controls passive nutriment loss
	var/oxygen_req = 0					//If oxygen reqs are not satisfied, get debuff and brain starts taking damage
	layer = ABOVE_LYING_MOB_LAYER
	origin_tech = list(TECH_BIO = 2)

/obj/item/organ/internal/Initialize()
	. = ..()
	initialize_organ_efficiencies()
	initialize_owner_verbs()
	update_icon()
	RegisterSignal(src, COMSIG_IORGAN_ADD_WOUND, PROC_REF(add_wound))
	RegisterSignal(src, COMSIG_IORGAN_REMOVE_WOUND, PROC_REF(remove_wound))
	RegisterSignal(src, COMSIG_IORGAN_REFRESH_SELF, PROC_REF(refresh_upgrades))

/obj/item/organ/internal/Process()
	refresh_damage()	// Death check is in the parent proc
	..()
	handle_blood()

/obj/item/organ/internal/Destroy()
	QDEL_LAZYLIST(item_upgrades)
	for(var/comp in GetComponents(/datum/component/internal_wound))
		remove_wound(comp)
	UnregisterSignal(src, COMSIG_IORGAN_ADD_WOUND)
	UnregisterSignal(src, COMSIG_IORGAN_REMOVE_WOUND)
	UnregisterSignal(src, COMSIG_IORGAN_REFRESH_SELF)
	..()

/obj/item/organ/internal/removed()
	UnregisterSignal(parent, COMSIG_IORGAN_WOUND_COUNT)
	UnregisterSignal(parent, COMSIG_IORGAN_REFRESH_PARENT)
	UnregisterSignal(parent, COMSIG_IORGAN_APPLY)
	SEND_SIGNAL(src, COMSIG_IWOUND_FLAGS_REMOVE)
	..()

/obj/item/organ/internal/die()
	..()
	if(status&ORGAN_DEAD)
		if(item_upgrades)
			for(var/obj/item/modification/organ/internal/agument/A in item_upgrades)
				if(A.cares_about_life && status&ORGAN_DEAD)
					A.sync_remove()

/obj/item/organ/internal/removed_mob()
	if(item_upgrades)
		for(var/obj/item/modification/organ/internal/agument/A in item_upgrades)
			A.sync_remove()

	for(var/process in organ_efficiency)
		owner.internal_organs_by_efficiency[process] -= src
	owner.internal_organs -= src

	var/skipverbs = FALSE
	for(var/organ in owner.internal_organs)
		var/obj/I = organ
		if(I.type == type)
			skipverbs = TRUE
	if(!skipverbs)
		remove_verb(owner, owner_verbs)
	// Reset when removed
	owner_verbs = initial_owner_verbs.Copy()
	..()

/obj/item/organ/internal/replaced(obj/item/organ/external/affected)
	..()
	parent.internal_organs |= src
	parent.internal_organs[src] = specific_organ_size // Larger organs have greater pick weight for organ damage
	RegisterSignal(parent, COMSIG_IORGAN_WOUND_COUNT, PROC_REF(wound_count), TRUE)
	RegisterSignal(parent, COMSIG_IORGAN_REFRESH_PARENT, PROC_REF(refresh_organ_stats), TRUE)
	RegisterSignal(parent, COMSIG_IORGAN_APPLY, PROC_REF(apply_modifiers), TRUE)
	SEND_SIGNAL(src, COMSIG_IWOUND_FLAGS_ADD)

/obj/item/organ/internal/replaced_mob(mob/living/carbon/human/target)
	..()
	owner.internal_organs |= src
	for(var/process in organ_efficiency)
		if(!islist(owner.internal_organs_by_efficiency[process]))
			owner.internal_organs_by_efficiency[process] = list()
		owner.internal_organs_by_efficiency[process] += src

	add_verb(owner, owner_verbs)

	for(var/obj/item/modification/organ/internal/agument/A in item_upgrades)
		if(A.cares_about_life && !(status&ORGAN_DEAD))
			return
		A.sync_add(owner)

/obj/item/organ/internal/proc/organ_add_verb(procpath/P)
	owner_verbs |= P
	if(owner)
		add_verb(owner, P)

/obj/item/organ/internal/proc/organ_remove_verb(procpath/P)
	owner_verbs -= P
	if(owner)
		remove_verb(owner, P)

/obj/item/organ/internal/proc/get_process_efficiency(process_define)
	return organ_efficiency[process_define] - (organ_efficiency[process_define] * (damage / max_damage))

/obj/item/organ/internal/take_damage(amount, damage_type = BRUTE, wounding_multiplier = 1, silent = FALSE, sharp = FALSE, edge = FALSE) //Deals damage to the organ itself
	if(!damage_type || status & ORGAN_DEAD)
		return FALSE

	var/wound_count = max(0, round(amount / 4)) // At base values, every 8 points of damage is 1 wound

	if(!wound_count)
		return FALSE

	var/list/possible_wounds = get_possible_wounds(damage_type, sharp, edge)

	if(LAZYLEN(possible_wounds))
		for(var/i in 1 to wound_count)
			var/choice = pick(possible_wounds)
			add_wound(choice)
			//LAZYREMOVE(possible_wounds, choice) // If this is commented out, we can get a higher severity of a single wound
			if(!LAZYLEN(possible_wounds))
				break

		owner?.custom_pain("Something inside your [parent.name] hurts a lot.", 0)		// Let em know they're hurting

		return TRUE
	return FALSE

/obj/item/organ/internal/proc/get_possible_wounds(damage_type, sharp, edge)
	var/list/possible_wounds = list()

	// Determine possible wounds based on nature and damage type
	var/is_robotic = BP_IS_ROBOTIC(src) || BP_IS_ASSISTED(src)
	var/is_organic = BP_IS_ORGANIC(src) || BP_IS_ASSISTED(src)
	var/is_slime = BP_IS_SLIME(src)

	switch(damage_type)
		if(BRUTE)
			if(!edge)
				if(sharp)
					if(is_organic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/sharp))
					if(is_robotic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/sharp))
					if(is_slime)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/slime/sharp))
				else
					if(is_organic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/blunt))
					if(is_robotic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/blunt))
					if(is_slime)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/slime/blunt))
			else
				if(is_organic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/edge))
				if(is_robotic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/edge))
				if(is_slime)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/slime/edge))
		if(BURN)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/burn))
			if(is_robotic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/emp_burn))
			if(is_slime)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/slime/burn))
		if(TOX)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/poisoning))
			//if(is_robotic)
			//	LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/build_up))
		if(CLONE)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/radiation))
			if(is_slime)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/slime/radiation))
		if(PSY)
			if(LAZYACCESS(organ_efficiency, OP_EYES) || LAZYACCESS(organ_efficiency, BP_BRAIN))
				if(is_organic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/sanity))
				if(is_robotic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/sanity))
				if(is_slime)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/sanity))

	return possible_wounds

/obj/item/organ/internal/proc/handle_blood()
	if(BP_IS_ROBOTIC(src) || !owner)
		return
	if(OP_BLOOD_VESSEL in organ_efficiency && !(owner.status_flags & BLEEDOUT))
		current_blood = min(current_blood + 5, max_blood_storage)	//Blood vessels get an extra flat 5 blood regen
	if(!blood_req)
		return

	if(owner.status_flags & BLEEDOUT)
		current_blood = max(current_blood - blood_req, 0)
		if(!current_blood)	//When all blood is lost, take blood from blood vessels
			var/obj/item/organ/internal/BV
			for(var/organ in shuffle(parent.internal_organs))
				var/obj/item/organ/internal/I = organ
				if(OP_BLOOD_VESSEL in I.organ_efficiency)
					BV = I
					break
			if(BV)
				BV.current_blood = max(BV.current_blood - blood_req, 0)
			if(!damage && BV?.current_blood == 0)	//When all blood from the organ and blood vessel is lost,
				add_wound(/datum/component/internal_wound/organic/oxy/blood_loss)

		return

	// If the bleedout status is removed, remove blood loss wound
	if(damage)
		remove_wound(GetComponent(/datum/component/internal_wound/organic/oxy/blood_loss))

	current_blood = min(current_blood + blood_req, max_blood_storage)

/obj/item/organ/internal/examine(mob/user)
	. = ..()
	if(user.stats?.getStat(STAT_BIO) > STAT_LEVEL_BASIC)
		to_chat(user, SPAN_NOTICE("Organ size: [specific_organ_size]"))
	if(user.stats?.getStat(STAT_BIO) > STAT_LEVEL_EXPERT)
		var/organs
		for(var/organ in organ_efficiency)
			organs += organ + " ([organ_efficiency[organ]]), "
		organs = copytext(organs, 1, length(organs) - 1)

		to_chat(user, SPAN_NOTICE("Requirements: <span style='color:red'>[blood_req]</span>/<span style='color:blue'>[oxygen_req]</span>/<span style='color:orange'>[nutriment_req]</span>"))
		to_chat(user, SPAN_NOTICE("Organ tissues present (efficiency): <span style='color:pink'>[organs ? organs : "none"]</span>"))

		if(LAZYLEN(item_upgrades))
			to_chat(user, SPAN_NOTICE("Organ grafts present ([LAZYLEN(item_upgrades)]/[max_upgrades]). Use a laser cutting tool to remove."))

/obj/item/organ/internal/is_usable()
	return ..() && !is_broken()

/obj/item/organ/internal/heal_damage(amount, natural = TRUE)
	return

/obj/item/organ/internal/emp_act(severity)
	var/rand_modifier = rand(1, 3)
	if(!BP_IS_ROBOTIC(src))
		return

	switch(severity)
		if	(1)
			take_damage(3 * rand_modifier, BURN)
		if	(2)
			take_damage(2 * rand_modifier, BURN)
		if	(3)
			take_damage(1 * rand_modifier, BURN)

// Is body part open for most surgerical operations?
/obj/item/organ/internal/is_open()
	var/obj/item/organ/external/limb = get_limb()

	if(limb)
		return limb.is_open()
	else
		return TRUE

// The bone zone
/obj/item/organ/internal/proc/fracture()
	if(LAZYACCESS(organ_efficiency, OP_BONE))
		// Determine possible wounds based on nature and damage type
		var/obj/item/organ/external/limb = get_limb()
		var/is_robotic = BP_IS_ROBOTIC(src) || BP_IS_ASSISTED(src)
		var/is_organic = BP_IS_ORGANIC(src) || BP_IS_ASSISTED(src)
		var/is_slime   = BP_IS_SLIME(src)
		var/list/possible_wounds = list()

		if(is_organic)
			LAZYADD(possible_wounds, /datum/component/internal_wound/organic/bone_fracture)
		if(is_robotic)
			LAZYADD(possible_wounds, /datum/component/internal_wound/robotic/deformation)
		if(is_slime)
			limb.droplimb(TRUE, DISMEMBER_METHOD_BLUNT) //We aren't like normal bones, if you hurt us enough to break then we burst.
		if(LAZYLEN(possible_wounds))
			var/choice = pick(possible_wounds)
			add_wound(choice)

		if(owner)
			playsound(loc, 'sound/weapons/jointORbonebreak.ogg', 50, 1, -1)

			owner.visible_message(
				SPAN_DANGER("You hear a loud cracking sound coming from \the [owner]."),
				SPAN_DANGER("Something feels like it shattered in your [name]"),
				SPAN_DANGER("You hear a sickening crack.")
			)

			if(!((owner.species.flags & NO_PAIN) || (PAIN_LESS in owner.mutations)))
				owner.emote("scream")
			// Fractures have a chance of getting you out of restraints
			if(prob(25))
				parent.release_restraints()

/obj/item/organ/internal/proc/mend()
	if(LAZYACCESS(organ_efficiency, OP_BONE))
		parent.status &= ~ORGAN_SPLINTED

		// Determine possible wounds based on nature and damage type
		var/is_robotic = BP_IS_ROBOTIC(src) || BP_IS_ASSISTED(src)
		var/is_organic = BP_IS_ORGANIC(src) || BP_IS_ASSISTED(src)

		if(is_organic)
			var/organic_wound = GetComponent(/datum/component/internal_wound/organic/bone_fracture)
			if(organic_wound)
				remove_wound(organic_wound)
		if(is_robotic)
			var/robotic_wound = GetComponent(/datum/component/internal_wound/robotic/deformation)
			if(robotic_wound)
				remove_wound(robotic_wound)



/obj/item/organ/internal/get_actions()
	var/list/actions_list = ..()

	if(LAZYACCESS(organ_efficiency, OP_BONE))
		if(BP_IS_ROBOTIC(src))
			if(parent.status & ORGAN_BROKEN)
				actions_list.Add(list(list(
					"name" = "Mend",
					"organ" = "\ref[src]",
					"step" = /datum/surgery_step/robotic/fix_bone
				)))
		else
			if(istype(src, /obj/item/organ/internal/bone))
				actions_list.Add(list(list(
					"name" = "Graft",
					"organ" = "\ref[src]",
					"step" = /datum/surgery_step/fix_bone
				)))
			else
				actions_list.Add(list(list(
				"name" = (parent.status & ORGAN_BROKEN) ? "Mend" : "Break",
				"organ" = "\ref[src]",
				"step" = (parent.status & ORGAN_BROKEN) ? /datum/surgery_step/mend_bone : /datum/surgery_step/break_bone
			)))
			actions_list.Add(list(list(
					"name" = "Replace",
					"organ" = "\ref[src]",
					"step" = /datum/surgery_step/replace_bone
				)))

	return actions_list
// End of the bone zone

// Mutations
/obj/item/organ/internal/proc/unmutate()
	if(!BP_IS_ORGANIC(src) || !BP_IS_ASSISTED(src) || BP_IS_SLIME(src))
		return

	for(var/wound in GetComponents(/datum/component/internal_wound/organic/radiation))
		remove_wound(wound)

/obj/item/organ/internal/proc/get_wounds()
	var/list/wound_data = list()

	for(var/datum/component/internal_wound/IW in GetComponents(/datum/component/internal_wound))
		var/treatment_info = ""
		var/list/treatments = IW.treatments_item + IW.treatments_tool + IW.treatments_chem

		// Make treatments into a string for the UI
		for(var/treatment in treatments)
			var/name = treatment
			if(ispath(treatment))
				var/atom/movable/AM = treatment
				name = initial(AM.name)
			treatment_info += "[name] ([num2text(treatments[treatment])]), "

		if(length(treatment_info))
			treatment_info = copytext(treatment_info, 1, length(treatment_info) - 1)

		wound_data += list(list(
			"name" = IW.name,
			"severity" = IW.severity,
			"severity_max" = IW.severity_max,
			"treatments" = treatment_info,
			"wound" = "\ref[IW]"
			))

	return wound_data

/obj/item/organ/internal/proc/get_mods()
	var/list/mod_data = list()

	for(var/atom/M as anything in item_upgrades)
		mod_data += list(list(
			"name" = M.name
		))
	return mod_data

/obj/item/organ/internal/rejuvenate()
	status = null
	for(var/datum/component/comp as anything in GetComponents(/datum/component))
		istype(comp, /datum/component/internal_wound) ? remove_wound(comp) : qdel(comp)

// Organ eating
/obj/item/organ/internal/proc/prepare_eat()
	if(BP_IS_ROBOTIC(src))
		return // No eating cybernetic implants!
	var/obj/item/reagent_containers/snacks/organ/S = new
	S.name = name
	S.desc = desc
	S.icon = icon
	S.icon_state = icon_state
	S.w_class = w_class

	return S

/obj/item/organ/internal/attack(mob/living/carbon/M, mob/user)
	if(M == user && ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/reagent_containers/snacks/S = prepare_eat()
		if(S)
			H.drop_item()
			H.put_in_active_hand(S)
			S.attack(H, H)
			qdel(src)
	else
		..()

// Store these so we can properly restore them when installing/removing mods
/obj/item/organ/internal/proc/initialize_organ_efficiencies()
	initial_organ_efficiency = organ_efficiency.Copy()

/obj/item/organ/internal/proc/initialize_owner_verbs()
	initial_owner_verbs = owner_verbs.Copy()

/obj/item/organ/internal/refresh_upgrades()
	refresh_organ_stats()
	apply_modifiers()

/obj/item/organ/internal/proc/refresh_organ_stats()
	name = initial(name)
	color = initial(color)
	max_upgrades = initial(max_upgrades)
	LAZYNULL(name_prefixes)
	min_bruised_damage = initial(min_bruised_damage)
	min_broken_damage = initial(min_broken_damage)
	max_damage = initial(max_damage) ? initial(max_damage) : min_broken_damage * 2
	organ_efficiency = initial_organ_efficiency.Copy()
	scanner_hidden = initial(scanner_hidden)
	unique_tag = initial(unique_tag)
	specific_organ_size = initial(specific_organ_size)
	max_blood_storage = initial(max_blood_storage)
	current_blood = initial(current_blood)
	blood_req = initial(blood_req)
	nutriment_req = initial(nutriment_req)
	oxygen_req = initial(oxygen_req)
	SEND_SIGNAL(src, COMSIG_IWOUND_FLAGS_REMOVE)
	//If we shove lets say robotics into a flesh arm it should be 50% less affective for organ efficiency
	if(parent)
		if(istype(parent, /obj/item/organ))
			var/obj/item/organ/O = parent
			//Basically if we missmatch are major three types then we get a 50% reduction, Assisted organs bypass this
			if(BP_IS_ORGANIC(O))
				if(!BP_IS_ORGANIC(src) && !BP_IS_ASSISTED(src))
					for(var/efficiency in organ_efficiency)
						organ_efficiency[efficiency] *= 0.5
			if(BP_IS_ROBOTIC(O))
				if(!BP_IS_ROBOTIC(src) && !BP_IS_ASSISTED(src))
					for(var/efficiency in organ_efficiency)
						organ_efficiency[efficiency] *= 0.5
			if(BP_IS_SLIME(O))
				if(!BP_IS_SLIME(src) && !BP_IS_ASSISTED(src))
					for(var/efficiency in organ_efficiency)
						organ_efficiency[efficiency] *= 0.5

/obj/item/organ/internal/proc/apply_modifiers()
	SEND_SIGNAL(src, COMSIG_IWOUND_EFFECTS)
	SEND_SIGNAL(src, COMSIG_IWOUND_LIMB_EFFECTS)
	SEND_SIGNAL(src, COMSIG_APPVAL, src)
	SEND_SIGNAL(src, COMSIG_IWOUND_FLAGS_ADD)

	refresh_damage()

	for(var/prefix in name_prefixes)
		name = "[prefix] [name]"

/obj/item/organ/internal/proc/refresh_damage()
	if(status & ORGAN_DEAD)
		damage = max_damage
		return
	damage = initial(damage)
	SEND_SIGNAL(src, COMSIG_IWOUND_DAMAGE)

/obj/item/organ/internal/proc/add_wound(datum/component/internal_wound/IW, wound_name = null)
	if(!IW || initial(IW.wound_nature) != nature || status & ORGAN_DEAD)
		return
	var/datum/component/internal_wound/new_wound = AddComponent(IW)
	if(wound_name)
		new_wound.name = wound_name
	refresh_upgrades()

/obj/item/organ/internal/proc/remove_wound(datum/component/wound)
	if(!wound)
		return
	refresh_organ_stats()	// Split like this because we need to remove flags,
	qdel(wound)				// remove the wound (which may apply a flag that shouldn't be there anymore),
	apply_modifiers()		// and re-apply existing flags

/obj/item/organ/internal/proc/wound_count()
	if(!parent)
		return
	var/list/wounds = GetComponents(/datum/component/internal_wound)
	if(wounds)
		parent.number_internal_wounds += LAZYLEN(wounds)
		parent.severity_internal_wounds += damage
	parent.total_internal_health += max_damage
