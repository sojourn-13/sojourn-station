/obj/item/organ/internal/liver
	name = "liver"
	icon_state = "liver"
	organ_efficiency = list(OP_LIVER = 100)
	parent_organ_base = BP_GROIN
	blood_req = 5
	max_blood_storage = 25
	oxygen_req = 7
	nutriment_req = 5
	price_tag = 800
	w_class = ITEM_SIZE_SMALL
	var/toxin_handling_multy = 1 //One is default, this value is a mult on toxin affect when processed by the liver

/obj/item/organ/internal/liver/plant
	name = "plant sprout"
	desc = "A lively sprout of a plant that acts like a filter and processer for different reagents that it sucks up."
	icon_state = "liver_plant"

/obj/item/organ/internal/liver/prosthetic
	name = "prosthetic liver"
	desc = "A liver made of metal. Does the same job as a normal liver, and just as well."
	icon_state = "liver-prosthetic"
	price_tag = 100
	nature = MODIFICATION_SILICON
	matter = list(MATERIAL_STEEL = 1)
	organ_efficiency = list(OP_LIVER = 100)

/obj/item/organ/internal/liver/big
	name = "big liver"
	icon_state = "liver_big"
	organ_efficiency = list(OP_LIVER = 150)
	specific_organ_size = 1.2
	price_tag = 900

/obj/item/organ/internal/liver/big/exalt
	name = "exalt liver"
	desc = "A robust liver for filtering robust chemicals."
	specific_organ_size = 1

/obj/item/organ/internal/liver/get_possible_wounds(damage_type, sharp, edge)
	var/list/possible_wounds = list()

	// Determine possible wounds based on nature and damage type
	var/is_robotic = BP_IS_ROBOTIC(src)
	var/is_organic = BP_IS_ORGANIC(src) || BP_IS_ASSISTED(src)

	switch(damage_type)
		if(BRUTE)
			if(!edge)
				if(sharp)
					if(is_organic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/liver_sharp))
					if(is_robotic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/liver_sharp))
				else
					if(is_organic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/liver_blunt))
					if(is_robotic)
						LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/liver_blunt))
			else
				if(is_organic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/liver_edge))
				if(is_robotic)
					LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/liver_edge))
		if(BURN)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/liver_burn))
			if(is_robotic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/liver_emp_burn))
		if(TOX)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/liver_poisoning))
			//if(is_robotic)
			//	LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/liver_build_up))
		if(CLONE)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/liver_radiation))
		if(PSY)
			if(is_organic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/organic/sanity))
			if(is_robotic)
				LAZYADD(possible_wounds, subtypesof(/datum/component/internal_wound/robotic/sanity))

	return possible_wounds

