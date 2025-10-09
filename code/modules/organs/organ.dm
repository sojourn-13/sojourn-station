/obj/item/organ
	name = "organ"
	icon = 'icons/obj/surgery.dmi'

	// Strings.
	var/surgery_name					// A special name that replaces item name in surgery messages
	var/organ_tag = "organ"				// Unique identifier.
	var/additional_limb_parts = list()  // Other parts to put on top, if the limb is incomplete.
	var/parent_organ_base = BP_CHEST			// Organ holding this object.
	var/dead_icon

	// Status tracking.
	var/status = NONE					// Various status flags
	var/vital = FALSE					// Lose a vital limb, die immediately.
	var/damage = 0						// Current damage to the organ

	// Type of modification, (If you ever need to apply several types make this a bit flag)
	var/nature = MODIFICATION_ORGANIC

	// Reference data.
	var/mob/living/carbon/human/owner	// Current mob owning the organ.
	var/obj/item/organ/external/parent	// A limb the organ is currently attached to or installed in.
	var/list/transplant_data			// Transplant match data.
	var/list/autopsy_data = list()		// Trauma data for forensics.
	var/list/trace_chemicals = list()	// Traces of chemicals in the organ.
	var/datum/dna/dna
	var/datum/species/species			//TODO: Fix this
	var/datum/species_form/form

	var/inserted_and_processing = TRUE //Organs are removed from the object subsystem when inserted inside of a person.
									   //This makes sure they can turn off processing while implanted in someone.

	// Damage vars.
	var/min_bruised_damage = 10      	// Damage before considered bruised
	var/min_broken_damage = 30       	// Damage before becoming broken
	var/max_damage                   	// Damage cap
	var/rejecting                    	// Is this organ already being rejected?
	matter = list(MATERIAL_BIOMATTER = 20)

	var/death_time // limits organ self recovery
	var/germ_level = 0				// Infection/contamination level - Ported from Baystation12

/obj/item/organ/Destroy()
	if(parent || owner)
		removed()
	QDEL_NULL(dna)
	species = null
	STOP_PROCESSING(SSobj, src)

	return ..()

/obj/item/organ/proc/update_health()
	return

/obj/item/organ/New(mob/living/carbon/human/holder, datum/organ_description/OD)
	..(holder)
	create_reagents(5)
	if(!max_damage)
		max_damage = min_broken_damage * 2

	if(istype(holder))
		species = holder.species
		if(!species) species = all_species[SPECIES_HUMAN]
		form = holder.form
		if(!form) form = GLOB.all_species_form_list[FORM_HUMAN]
		if(holder.dna)
			dna = holder.dna.Clone()
			species = all_species[dna.species]
			if(!blood_DNA)
				blood_DNA = list()
			blood_DNA[dna.unique_enzymes] = dna.b_type
		else
			log_debug("[src] at [loc] spawned without a proper DNA.")
		if(parent_organ_base)
			replaced(holder.get_organ(parent_organ_base))
		else
			replaced_mob(holder)

// Surgery hooks
/obj/item/organ/attack_self(mob/living/user)
	if(do_surgery(user, null))
		return
	return ..()

/obj/item/organ/attackby(obj/item/I, mob/living/user)
	if(do_surgery(user, I))
		return
	return ..()

/obj/item/organ/proc/set_dna(datum/dna/new_dna)
	if(new_dna)
		dna = new_dna.Clone()
		if(!blood_DNA)
			blood_DNA = list()
		blood_DNA.Cut()
		blood_DNA[dna.unique_enzymes] = dna.b_type
		species = all_species[new_dna.species]

/obj/item/organ/proc/die()
	if(BP_IS_ROBOTIC(src) || status & ORGAN_DEAD)
		return
	damage = max_damage
	status |= ORGAN_DEAD
	STOP_PROCESSING(SSobj, src)
	death_time = world.time
	if(dead_icon)
		icon_state = dead_icon
	if(owner && vital && owner.stat != DEAD)
		owner.death()

/obj/item/organ/get_item_cost()
	if((status & ORGAN_DEAD) || species != all_species["Human"]) //No dead or monkey organs!
		return 0
	return ..()


// Checks if the organ is in a freezer, an MMI or a stasis bag - it will not be processed then
/obj/item/organ/proc/is_in_stasis()
	if(istype(loc, /obj/item/device/mmi) || istype(loc, /mob/living/simple/spider_core))
		return TRUE

	var/list/stasis_types = list(
		/obj/structure/closet/body_bag/cryobag,
		/obj/structure/closet/crate/freezer,
		/obj/item/storage/freezer,
		/obj/machinery/smartfridge,
		/obj/machinery/vending
	)

	if(is_type_in_list(loc, stasis_types))
		return TRUE

	return FALSE

/obj/item/organ/Process()

	if(loc != owner)
		owner = null

	//dead already, no need for more processing
	if(status & ORGAN_DEAD)
		return

	//check if we've hit max_damage
	if(damage >= max_damage)
		die()
		return

	//Process infections (Ported from Baystation12)
	if (BP_IS_ROBOTIC(src) || (owner && owner.species && (owner.species.flags & NO_BREATHE)))
		germ_level = 0
		return

	// Don't process if we're in a freezer, an MMI or a stasis bag.
	if(is_in_stasis())
		return

	if(!owner && reagents)
		var/datum/reagent/organic/blood/B = locate(/datum/reagent/organic/blood) in reagents.reagent_list
		if(B && prob(40))
			reagents.remove_reagent("blood",0.1)
			blood_splatter(src,B,1)
		if(config.organs_decay)
			take_damage(rand(1,3), BRUTE)
		germ_level += rand(2,6)
		if(germ_level >= INFECTION_LEVEL_TWO)
			germ_level += rand(2,6)
		if(germ_level >= INFECTION_LEVEL_THREE)
			die()

	else if(owner && owner.bodytemperature >= 170)	//cryo stops germs from moving and doing their bad stuffs
		//** Handle antibiotics and curing infections
		handle_antibiotics()
		handle_rejection()
		handle_germ_effects()

/obj/item/organ/examine(mob/user)
	..(user)
	if(status & ORGAN_DEAD)
		to_chat(user, SPAN_NOTICE("The decay has set in."))

/obj/item/organ/proc/handle_rejection()
	// Process unsuitable transplants. TODO: consider some kind of
	// immunosuppressant that changes transplant data to make it match.
	if(dna)
		if(!rejecting)
			if(blood_incompatible(dna.b_type, owner.dna.b_type, species, owner.species))
				rejecting = 1
		else
			rejecting++ //Rejection severity increases over time.
			if(rejecting % 10 == 0) //Only fire every ten rejection ticks.
				take_damage(round(rejecting / 50), TOX)		// Will cause toxin accumulation wounds

// Infection system functions - Ported from Baystation12
/obj/item/organ/proc/handle_germ_effects()
	//** Handle the effects of infections
	if(!owner)
		return

	var/virus_immunity = owner.virus_immunity() //reduces the amount of times we need to call this proc
	var/antibiotics = owner.reagents?.get_reagent_amount("spaceacillin") || 0

	if (germ_level > 0 && germ_level < INFECTION_LEVEL_ONE/2 && prob(virus_immunity*0.3))
		germ_level--

	if (germ_level >= INFECTION_LEVEL_ONE/2)
		//aiming for germ level to go from ambient to INFECTION_LEVEL_TWO in an average of 15 minutes, when immunity is full.
		if(antibiotics < 5 && prob(round(germ_level/6 * owner.immunity_weakness() * 0.01)))
			if(virus_immunity > 0)
				germ_level += clamp(round(1/virus_immunity), 1, 10) // Immunity starts at 100. This doubles infection rate at 50% immunity. Rounded to nearest whole.
			else // Will only trigger if immunity has hit zero. Once it does, 10x infection rate.
				germ_level += 10

	if(germ_level >= INFECTION_LEVEL_ONE)
		var/fever_temperature = (owner.species.heat_level_1 - owner.species.body_temperature - 5)* min(germ_level/INFECTION_LEVEL_TWO, 1) + owner.species.body_temperature
		owner.bodytemperature += clamp((fever_temperature - T0C)/BODYTEMP_COLD_DIVISOR + 1, 0, fever_temperature - owner.bodytemperature)

	if (germ_level >= INFECTION_LEVEL_TWO)
		var/obj/item/organ/external/parent_limb = owner.get_organ(parent_organ_base)
		//spread germs
		if (antibiotics < 5 && parent_limb && parent_limb.germ_level < germ_level && ( parent_limb.germ_level < INFECTION_LEVEL_ONE*2 || prob(owner.immunity_weakness() * 0.3) ))
			parent_limb.germ_level++

		if (prob(3))	//about once every 30 seconds
			take_damage(1, BRUTE, silent=prob(30))

//Germs
/obj/item/organ/proc/handle_antibiotics()
	if(!owner || !germ_level)
		return

	var/antibiotics = owner.chem_effects[CE_ANTIBIOTIC]
	if (!antibiotics)
		return

	if (germ_level < INFECTION_LEVEL_ONE)
		germ_level = 0	//cure instantly
	else if (germ_level < INFECTION_LEVEL_TWO)
		germ_level -= 5	//at germ_level == 500, this should cure the infection in 5 minutes
	else
		germ_level -= 3 //at germ_level == 1000, this will cure the infection in 10 minutes
	if(owner && owner.lying)
		germ_level -= 2
	germ_level = max(0, germ_level)

/obj/item/organ/proc/receive_chem(chemical as obj)
	return FALSE

/obj/item/organ/proc/rejuvenate()
	status = NONE //Added in status reset so that aheal works on the organs.
	damage = 0

/obj/item/organ/proc/is_damaged()
	return damage > 0

/obj/item/organ/proc/is_bruised()
	return damage >= min_bruised_damage

/obj/item/organ/proc/is_broken()
	return (damage >= min_broken_damage || (status & ORGAN_CUT_AWAY) || (status & ORGAN_BROKEN))

//Adds autopsy data for used_weapon.
/obj/item/organ/proc/add_autopsy_data(used_weapon, damage)
	var/datum/autopsy_data/W = autopsy_data[used_weapon]
	if(!W)
		W = new()
		W.weapon = used_weapon
		autopsy_data[used_weapon] = W

	W.hits += 1
	W.damage += damage
	W.time_inflicted = world.time

//Note: external organs have their own version of this proc
/obj/item/organ/proc/take_damage(amount, damage_type, wounding_multiplier = 1, silent)
	if(!BP_IS_ROBOTIC(src)) //only show this if the organ is not robotic

		if(owner && parent && amount > 0 && !silent && (owner.status_flags && ORGAN_INFECTED)) //a little bit of warning that an infection is doing damage inside you.
			owner.custom_pain("Something inside your [parent.name] feels tender and painful.", 1)

		if(owner && parent && amount > 0 && !silent && !(owner.status_flags && ORGAN_INFECTED))
			owner.custom_pain("Something inside your [parent.name] hurts a lot.", 1)

/obj/item/organ/emp_act(severity)
	if(!BP_IS_ROBOTIC(src))
		return

	//Robotic body parts conduct EMPs way better than flesh
	if(parent && BP_IS_ROBOTIC(parent))
		switch (severity)
			if(1)
				take_damage(40, BURN) //Deals half the organs damage
			if(2)
				take_damage(30, BURN)
			if(3)
				take_damage(20, BURN)
	else
		switch (severity)
			if(1)
				take_damage(25, BURN) //Deals half the organs damage
			if(2)
				take_damage(20, BURN)
			if(3)
				take_damage(10, BURN)


// Gets the limb this organ is located in, if any
/obj/item/organ/proc/get_limb()
	if(parent)
		return parent

	if(owner)
		return owner.get_organ(parent_organ_base)

	else if(istype(loc, /obj/item/organ/external))
		return loc

	return null

/obj/item/organ/proc/removed(mob/living/user)
	var/obj/item/organ/external/affected = get_limb()

	if(affected)
		affected.internal_organs -= src
		forceMove(affected.drop_location())
	else
		forceMove(get_turf(src))

	parent = null

	if(owner)
		removed_mob(user)

/obj/item/organ/proc/removed_mob(mob/living/user)
	var/datum/reagent/organic/blood/organ_blood = locate(/datum/reagent/organic/blood) in reagents?.reagent_list
	if(!organ_blood || !organ_blood.data["blood_DNA"])
		owner.vessel.trans_to(src, 5, 1, 1)

	if(vital && !(owner.status_flags & REBUILDING_ORGANS) && owner.stat != DEAD)
		if(user)
			admin_attack_log(user, owner, "Removed a vital organ ([src])", "Had a a vital organ ([src]) removed.", "removed a vital organ ([src]) from")
		owner.death()

	owner = null
	rejecting = null

	if(parent)
		forceMove(parent)

	START_PROCESSING(SSobj, src)

/obj/item/organ/proc/replaced(obj/item/organ/external/affected)
	parent = affected
	forceMove(parent)
	if(parent.owner)
		replaced_mob(parent.owner)


/obj/item/organ/proc/replaced_mob(mob/living/carbon/human/target)
	owner = target
	forceMove(owner)
	STOP_PROCESSING(SSobj, src)

	var/datum/reagent/organic/blood/transplant_blood = locate(/datum/reagent/organic/blood) in reagents?.reagent_list
	transplant_data = list()
	if(!transplant_blood)
		transplant_data["species"] =    owner.species.name
		transplant_data["blood_type"] = owner.dna.b_type
		transplant_data["blood_DNA"] =  owner.dna.unique_enzymes
	else
		transplant_data["species"] =    transplant_blood.data["species"]
		transplant_data["blood_type"] = transplant_blood.data["blood_type"]
		transplant_data["blood_DNA"] =  transplant_blood.data["blood_DNA"]

/obj/item/organ/proc/heal_damage(amount)
	return

/obj/item/organ/proc/can_recover()
	return (max_damage > 0) && !(status & ORGAN_DEAD) || death_time >= world.time - ORGAN_RECOVERY_THRESHOLD

/obj/item/organ/proc/can_feel_pain()
	if(!owner)
		return FALSE

	if(BP_IS_ROBOTIC(src))
		return FALSE

	if(status & ORGAN_DEAD)
		return FALSE

	if((species?.flags & NO_PAIN) || (PAIN_LESS in owner.mutations))
		return FALSE

	if(owner.stat >= UNCONSCIOUS)
		return FALSE

	if(owner.analgesic >= 100)
		return FALSE

	return TRUE

/obj/item/organ/proc/is_usable()
	return !(status & (ORGAN_CUT_AWAY|ORGAN_DEAD))

// Medical scan results showing infection status - Ported from Baystation12
/obj/item/organ/proc/get_scan_results(tag = FALSE)
	. = list()
	if(BP_IS_ROBOTIC(src))
		. += tag ? "<span style='font-weight: bold; color: blue'>Mechanical</span>" : "Mechanical"
	else if(status & ORGAN_ASSISTED)
		. += tag ? "<span style='font-weight: bold; color: blue'>Assisted</span>" : "Assisted"

	if(status & ORGAN_CUT_AWAY)
		. += tag ? "<span style='font-weight: bold; color: red'>Severed</span>" : "Severed"
	if(status & ORGAN_DEAD)
		if(BP_IS_ROBOTIC(src))
			if(can_recover())
				. += tag ? "<span style='font-weight: bold; color: orange'>Failing</span>" : "Failing"
			else
				. += tag ? "<span style='font-weight: bold; color: red'>Irreparably Damaged</span>" : "Irreparably Damaged"
		else
			if(can_recover())
				. += tag ? "<span style='font-weight: bold; color: orange'>Decaying</span>" : "Decaying"
			else
				. += tag ? "<span style='font-weight: bold; color: red'>Necrotic</span>" : "Necrotic"

	// Infection status display
	var/germ_message
	switch (germ_level)
		if (INFECTION_LEVEL_ONE to INFECTION_LEVEL_ONE + ((INFECTION_LEVEL_TWO - INFECTION_LEVEL_ONE) / 3))
			germ_message = "Mild Infection"
		if (INFECTION_LEVEL_ONE + ((INFECTION_LEVEL_TWO - INFECTION_LEVEL_ONE) / 3) to INFECTION_LEVEL_ONE + (2 * (INFECTION_LEVEL_TWO - INFECTION_LEVEL_ONE) / 3))
			germ_message = "Mild Infection+"
		if (INFECTION_LEVEL_ONE + (2 * (INFECTION_LEVEL_TWO - INFECTION_LEVEL_ONE) / 3) to INFECTION_LEVEL_TWO)
			germ_message = "Moderate Infection"
		if (INFECTION_LEVEL_TWO to INFECTION_LEVEL_TWO + ((INFECTION_LEVEL_THREE - INFECTION_LEVEL_TWO) / 3))
			germ_message = "Moderate Infection+"
		if (INFECTION_LEVEL_TWO + ((INFECTION_LEVEL_THREE - INFECTION_LEVEL_TWO) / 3) to INFECTION_LEVEL_TWO + (2 * (INFECTION_LEVEL_THREE - INFECTION_LEVEL_TWO) / 3))
			germ_message = "Severe Infection"
		if (INFECTION_LEVEL_TWO + (2 * (INFECTION_LEVEL_THREE - INFECTION_LEVEL_TWO) / 3) to INFECTION_LEVEL_THREE)
			germ_message = "Severe Infection+"
		if (INFECTION_LEVEL_THREE to INFINITY)
			germ_message = "Septic"

	if(germ_message)
		. += tag ? "<span style='font-weight: bold; color: orange'>[germ_message]</span>" : germ_message
