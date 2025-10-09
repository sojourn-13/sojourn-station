/obj/item/organ/internal/vital/brain
	name = "brain"
	health = 50
	desc = "A piece of juicy meat found in a person's head."
	organ_efficiency = list(BP_BRAIN = 100)
	parent_organ_base = BP_HEAD
	unique_tag = BP_BRAIN
	vital = 1
	icon_state = "brain2"
	force = 1.0
	w_class = ITEM_SIZE_SMALL
	specific_organ_size = 2
	throwforce = 1.0
	throw_speed = 3
	throw_range = 5
	layer = ABOVE_MOB_LAYER
	origin_tech = list(TECH_BIO = 3)
	attack_verb = list("attacked", "slapped", "whacked")
	price_tag = 8000
	blood_req = 8
	max_blood_storage = 80
	oxygen_req = 8
	nutriment_req = 6
	var/mob/living/carbon/brain/brainmob = null
	var/timer_id
	var/last_hypoxia_damage = 0 // Timestamp of last brain damage application
	var/round_start_grace = 0 // Timestamp when brain was installed in owner

/obj/item/organ/internal/vital/brain/xeno
	name = "thinkpan"
	desc = "It looks kind of like an enormous wad of purple bubblegum."
	icon = 'icons/mob/alien.dmi'
	icon_state = "chitin"

/obj/item/organ/internal/vital/brain/New()
	..()
	timer_id = addtimer(CALLBACK(src, PROC_REF(clear_hud)), 5, TIMER_STOPPABLE)

/obj/item/organ/internal/vital/brain/Destroy()
	if(timer_id)
		deltimer(timer_id)
	if(brainmob)
		qdel(brainmob)
		brainmob = null
	. = ..()

/obj/item/organ/internal/vital/brain/take_damage(amount, damage_type = BRUTE, wounding_multiplier = 1, sharp = FALSE, edge = FALSE, silent = FALSE)
	if(!damage_type || status & ORGAN_DEAD)
		return

	health -= amount * wounding_multiplier

	if(health < 0)
		var/wound_damage = -health
		health = 0
		..(wound_damage, damage_type, wounding_multiplier, sharp, edge, silent)

/obj/item/organ/internal/vital/brain/get_possible_wounds(damage_type, sharp, edge)
	var/list/possible_wounds = list()

	// Determine possible wounds based on nature and damage type
	var/is_robotic = BP_IS_ROBOTIC(src)
	var/is_organic = BP_IS_ORGANIC(src) || BP_IS_ASSISTED(src)

	switch(damage_type)
		if(BRUTE)
			if(!edge)
				if(sharp) // dont even fucking ask whats the difference between this and eyes get_possible_wounds. I dont know, I wont tell you.
					if(is_organic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/brain_sharp))
					if(is_robotic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/brain_sharp))
				else
					if(is_organic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/brain_blunt))
					if(is_robotic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/brain_blunt))
			else
				if(is_organic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/brain_edge))
				if(is_robotic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/brain_edge))
		if(BURN)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/brain_burn))
			if(is_robotic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/brain_emp_burn))
		if(TOX)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/poisoning))
			//if(is_robotic)
			//	LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/poisoning))
		if(CLONE)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/radiation))
		if(PSY)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/sanity))
			if(is_robotic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/sanity))

	return possible_wounds

/// Brain blood oxygenation is handled via oxyloss
/obj/item/organ/internal/vital/brain/handle_blood()
	if(BP_IS_ROBOTIC(src) || !owner)
		return
	if(!blood_req)
		return

	current_blood = max_blood_storage

/obj/item/organ/internal/vital/brain/proc/clear_hud()
	if(brainmob && brainmob.client)
		brainmob.client.screen.len = null //clear the hud
	timer_id = null

/obj/item/organ/internal/vital/brain/proc/transfer_identity(mob/living/carbon/H)
	name = "\the [H]'s [initial(src.name)]"
	brainmob = new(src)
	brainmob.name = H.real_name
	brainmob.real_name = H.real_name
	brainmob.dna = H.dna.Clone()
	brainmob.timeofhostdeath = H.timeofdeath
	if(H.mind)
		H.mind.transfer_to(brainmob)

	to_chat(brainmob, SPAN_NOTICE("You feel slightly disoriented. That's normal when you're just a [initial(src.name)]."))
	callHook("debrain", list(brainmob))

/obj/item/organ/internal/vital/brain/examine(mob/user) // -- TLE
	..(user)
	if(brainmob && brainmob.client)//if thar be a brain inside... the brain.
		to_chat(user, "You can feel the small spark of life still left in this one.")
	else
		to_chat(user, "This one seems particularly lifeless. Perhaps it will regain some of its luster later..")

/obj/item/organ/internal/vital/brain/removed_mob(mob/living/user)
	name = "[owner.real_name]'s brain"

	if(!(owner.status_flags & REBUILDING_ORGANS))
		var/mob/living/simple/borer/borer = owner.has_brain_worms()
		if(borer)
			borer.detatch() //Should remove borer if the brain is removed - RR

		var/obj/item/organ/internal/carrion/core/C = owner.random_organ_by_process(BP_SPCORE)
		if(C)
			C.removed()
			qdel(src)
			return

		transfer_identity(owner)

	..()

/obj/item/organ/internal/vital/brain/replaced_mob(mob/living/carbon/target)
	..()
	if(owner.key && !(owner.status_flags & REBUILDING_ORGANS))
		owner.ghostize()

	if(brainmob)
		if(brainmob.mind)
			brainmob.mind.transfer_to(owner)
		else
			owner.key = brainmob.key
/obj/item/organ/internal/vital/brain/golem
	name = "scroll"
	desc = "A tightly furled roll of paper, covered with indecipherable runes."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "scroll"

/obj/item/organ/internal/vital/brain/synthetic
	name = "synthetic brain"
	desc = "A synthetic brain, free willed and extremely valuable, often used in only the most complex and dangerous robots."
	icon_state = "brain_synth"
	organ_efficiency = list(BP_BRAIN = 200)
	price_tag = 12000
	blood_req = 0
	max_blood_storage = 2.5
	oxygen_req = 0
	nutriment_req = 0
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1, MATERIAL_GOLD = 1)

/obj/item/organ/internal/vital/brain/plant
	name = "nuclei"
	desc = "A centralized nuclei functioning as a brain for plantoid species."
	icon_state = "brain_plant"
