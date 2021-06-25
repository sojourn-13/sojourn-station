/mob/living/carbon/superior_animal/fungi/shroom
	name = "Mushroom Follower"
	desc = "A mushroom follower, made by a Mushroom-born Mycus. It will produce random medicine when fed."
	var/drop_threshold = 90 // Nutrition threshold upon which the shroom drop the med.

	// The meds they can drop, weighted for brute -> burn -> toxins -> organ healing -> everything else.
	var/list/droppable_meds = list(	/obj/item/weapon/reagent_containers/glass/bottle/organic/dexalinp = 2, // Dexalin Plus, heal muscles and O2 damage
									/obj/item/weapon/reagent_containers/glass/bottle/organic/haloperidol = 1, // Haloperidol, sedate and purge chems
									/obj/item/weapon/reagent_containers/glass/bottle/organic/hyronalin = 1, // Hyronalin, heal Radiation poisoning
									/obj/item/weapon/reagent_containers/glass/bottle/organic/vermicetol = 1, // Vermicetol, heal brute damage
									/obj/item/weapon/reagent_containers/glass/bottle/organic/dermatane = 5, // Dermaline & Kelotane mix, heal brute & burn damage
									/obj/item/weapon/reagent_containers/glass/bottle/organic/peridaxon = 2, // Peridaxon, heal internal organs and toxin
									/obj/item/weapon/reagent_containers/glass/bottle/organic/varceptol = 3, // Varceptol, heal brute and purge toxins
									/obj/item/weapon/reagent_containers/glass/bottle/organic/oxycodone = 1, // Oxycodone, Painkiller
									/obj/item/weapon/reagent_containers/glass/bottle/organic/tricordrazine = 3, // Tricordrazine, heal brute, burn and toxin damage
									/obj/item/weapon/reagent_containers/glass/bottle/organic/meralyne = 1, // Meralyne, heal brute damage better than bicaridine
									)

/mob/living/carbon/superior_animal/fungi/shroom/Life()
	..()

	if(nutrition > drop_threshold) // If the current nutrition is above the treshold ?
		var/obj/item/weapon/reagent_containers/glass/bottle/organic/medicine = pickweight(droppable_meds) // Select a random medicine...
		new medicine(src.loc) // Spawn the medicine...
		nutrition -= drop_threshold // And reduce the nutrition by the threshold.
