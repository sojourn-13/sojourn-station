/datum/chemical_reaction/steel_skin
	result = "iron_skin_brew"
	required_reagents = list("iron" = 1, "tungsten" = 1, "sodiumchloride" = 1)
	result_amount = 1
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

/datum/chemical_reaction/toxin_draft
	result = "toxin_draft"
	required_reagents = list("ammonia" = 1, "carbon" = 1, "sodiumchloride" = 1)
	result_amount = 1
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

/datum/chemical_reaction/sight_dram
	result = "sight_dram"
	required_reagents = list("water" = 1, "carbon" = 1, "sodiumchloride" = 1)
	result_amount = 1
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

/datum/chemical_reaction/lively_concoxion
	result = "lively_concoxion"
	required_reagents = list("detox" = 1, "viroputine" = 1, "citalopram" = 1)
	result_amount = 1
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

/datum/chemical_reaction/nervs
	result = "nervs"
	required_reagents = list("detox" = 1, "purger" = 1, "citalopram" = 1)
	result_amount = 1
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

/datum/chemical_reaction/harms
	result = "harms"
	required_reagents = list("iron" = 1, "silicon" = 1, "sodiumchloride" = 1)
	result_amount = 1
	mix_message = "The solution crystalizes into small golden fragments."
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

/datum/chemical_reaction/oils
	result = "burns"
	required_reagents = list("oil" = 1, "sodiumchloride" = 1, "iron" = 1)
	result_amount = 1
	mix_message = "The solution begins to fizzle violently, falling inert shortly afterwards..."
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

/datum/chemical_reaction/mind_expander
	result = "mind_expander"
	required_reagents = list(MATERIAL_GOLD = 1, "sodiumchloride" = 1, "milk" = 1)
	result_amount = 1
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

/datum/chemical_reaction/work_tonic
	result = "work_tonic"
	required_reagents = list("milk" = 1, "protein" = 1, "egg" = 1)
	result_amount = 1
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

/datum/chemical_reaction/combat_brew
	result = "combat_brew"
	required_reagents = list("protein" = 1, "honey" = 1, "ethanol" = 1)
	result_amount = 1
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

/datum/chemical_reaction/eye_lid
	result = "eye_lid"
	required_reagents = list("blackpepper" = 1, "milk" = 1, "ethanol" = 1)
	result_amount = 1
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)

//hardest one to make
/datum/chemical_reaction/red_heart
	result = "red_heart"
	required_reagents = list("blood" = 1, MATERIAL_GOLD = 1, "lively_concoxion" = 1)
	result_amount = 1
	mix_message = "The blood congeals into a golden droplet!"
	require_containers = list(/obj/item/reagent_containers/glass/beaker/flask_alchemy)
