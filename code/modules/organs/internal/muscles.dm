/obj/item/organ/internal/muscle
	name = "muscle"
	icon_state = "human_muscle"
	desc = "Rip and tear"
	organ_efficiency = list(OP_MUSCLE = 100)
	price_tag = 100
	max_damage = IORGAN_SMALL_HEALTH
	min_bruised_damage = IORGAN_SMALL_BRUISE
	min_broken_damage = IORGAN_SMALL_BREAK
	specific_organ_size = 1
	blood_req = 0.5
	max_blood_storage = 2.5
	nutriment_req = 0.5
	w_class = ITEM_SIZE_SMALL

/obj/item/organ/internal/muscle/robotic
	name = "hydraulic muscles"
	desc = "Hydraulic systems that act as muscles. Doesn't outperform their organic counterpart though."
	icon_state = "robotic_muscle"
	desc = "Expand and contract"
	nature = MODIFICATION_SILICON
	organ_efficiency = list(OP_MUSCLE = 100)
	specific_organ_size = 1
	matter = list(MATERIAL_STEEL = 1)

/obj/item/organ/internal/muscle/super_muscle
	name = "super muscle"
	desc = "A wierd flex, but more than okay. This muscle has been genetically altered to be stronger than normal."
	icon_state = "human_muscle_super"
	price_tag = 150
	organ_efficiency = list(OP_MUSCLE = 150)
	specific_organ_size = 1.2

/obj/item/organ/internal/muscle/super_muscle/exalt
	name = "exalt muscle"
	desc = "Used for carrying this colony. This muscle makes an Exalt stronger than normal.\
	Likely worth more on the black market."

/obj/item/organ/internal/muscle/get_possible_wounds(damage_type, sharp, edge)
	var/list/possible_wounds = list()

	// Determine possible wounds based on nature and damage type
	var/is_robotic = BP_IS_ROBOTIC(src)
	var/is_organic = BP_IS_ORGANIC(src) || BP_IS_ASSISTED(src)

	switch(damage_type)
		if(BRUTE)
			if(!edge)
				if(sharp)
					if(is_organic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/muscle_sharp))
					if(is_robotic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/muscle_sharp))
				else
					if(is_organic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/muscle_blunt))
					if(is_robotic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/muscle_blunt))
			else
				if(is_organic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/muscle_edge))
				if(is_robotic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/muscle_edge))
		if(BURN)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/muscle_burn))
			if(is_robotic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/muscle_emp_burn))
		if(TOX)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/muscle_poisoning))
			//if(is_robotic)
			//	LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/muscle_build_up))
		if(CLONE)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/muscle_radiation))
		if(PSY)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/sanity))
			if(is_robotic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/sanity))

	return possible_wounds