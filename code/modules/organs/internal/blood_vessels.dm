/obj/item/organ/internal/blood_vessel
	name = "blood vessels"
	icon_state = "blood_vessel"
	organ_efficiency = list(OP_BLOOD_VESSEL= 100)
	price_tag = 100
	max_damage = IORGAN_SMALL_HEALTH
	min_bruised_damage = IORGAN_SMALL_BRUISE
	min_broken_damage = IORGAN_SMALL_BREAK
	max_damage = 8
	min_bruised_damage = 2
	min_broken_damage = 4
	specific_organ_size = 0.5
	max_blood_storage = 100
	oxygen_req = 2
	nutriment_req = 1
	w_class =  ITEM_SIZE_TINY

/obj/item/organ/internal/blood_vessel/prosthetic
	name = "plastic tubes"
	desc = "Some thin plastic tubes, can act as blood vesels."
	icon_state = "blood_vessel-prosthetic"
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)
	organ_efficiency = list(OP_BLOOD_VESSEL = 100)

/obj/item/organ/internal/blood_vessel/extensive
	name = "extensive blood vessels"
	icon_state = "blood_vessel_extensive"
	price_tag = 150
	oxygen_req = 2
	organ_efficiency = list(OP_BLOOD_VESSEL = 150)
	specific_organ_size = 0.6


/obj/item/organ/internal/blood_vessel/extensive/exalt
	name = "Exalt blood vessels"
	desc = "Genetically Improved blood vessels for pumping only the most blue of blood."

/obj/item/organ/internal/blood_vessel/get_possible_wounds(damage_type, sharp, edge)
	var/list/possible_wounds = list()

	// Determine possible wounds based on nature and damage type
	var/is_robotic = BP_IS_ROBOTIC(src)
	var/is_organic = BP_IS_ORGANIC(src) || BP_IS_ASSISTED(src)

	switch(damage_type)
		if(BRUTE)
			if(!edge)
				if(sharp)
					if(is_organic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/blood_vessel_sharp))
					if(is_robotic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/blood_vessel_sharp))
				else
					if(is_organic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/blood_vessel_blunt))
					if(is_robotic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/blood_vessel_blunt))
			else
				if(is_organic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/blood_vessel_edge))
				if(is_robotic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/blood_vessel_edge))
		if(BURN)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/blood_vessel_burn))
			if(is_robotic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/blood_vessel_emp_burn))
		if(TOX)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/blood_vessel_poisoning))
			//if(is_robotic)
			//	LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/blood_vessel_build_up))
		if(CLONE)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/blood_vessel_radiation))
		if(PSY)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/sanity))
			if(is_robotic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/sanity))

	return possible_wounds

