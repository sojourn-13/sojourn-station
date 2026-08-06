/obj/item/reagent_containers/glass/replenishing
	var/spawning_id
	var/spawning_reagent_amount = 0.3

/obj/item/reagent_containers/glass/replenishing/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/glass/replenishing/Process()
	if(spawning_id)
		reagents.add_reagent(spawning_id, spawning_reagent_amount)

//spray

/obj/item/reagent_containers/spray/replenishing
	var/spawning_id
	var/spawning_reagent_amount = 0.3

/obj/item/reagent_containers/spray/replenishing/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/spray/replenishing/Process()
	if(spawning_id)
		reagents.add_reagent(spawning_id, spawning_reagent_amount)
		update_icon()

/obj/item/reagent_containers/spray/replenishing/space_cleaner_mixer
	name = "SCM - \"Janny\" Type C: Spray Bottle" // Space Cleaner Mixer, Cleaning
	desc = "A mix of psionics and chemmaster chemical synthesizing, this spray bottle slowly will refill itself based on a small dial. \
	The dial settings are: Water, Ammonia, Space Cleaner."
	spawning_id = "water"
	spawning_reagent_amount = 2
	icon_state = "psion_cleaner"

/obj/item/reagent_containers/spray/replenishing/space_cleaner_mixer/verb/flippyswitchy()

	set name = "Change Spray Bottle Synthesizing"
	set category = "Object"
	set src in usr

	switch(alert(usr, "Chemical to Synthesize", "Current Reagent: [spawning_id]", "water", "ammonia", "cleaner"))
		if("water")
			spawning_id = "water"
			spawning_reagent_amount = 2
		if("ammonia")
			spawning_id = "ammonia"
			spawning_reagent_amount = 2
		if("cleaner")
			spawning_id = "cleaner"
			spawning_reagent_amount = 1

	to_chat(usr, SPAN_NOTICE("With a simple twist of a dial you set the synthesizing reagent to [spawning_id] at a rate of [spawning_reagent_amount] units."))

/obj/item/reagent_containers/spray/replenishing/space_cleaner_mixer/examine(mob/user)
	..()
	to_chat(user, "The dial is set to [spawning_id].")

// autoinjectors

/obj/item/reagent_containers/hypospray/autoinjector/replenishing
	var/spawning_id
	var/spawning_reagent_amount = 0.3

/obj/item/reagent_containers/hypospray/autoinjector/replenishing/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/hypospray/autoinjector/replenishing/Process()
	if(spawning_id)
		reagents.add_reagent(spawning_id, spawning_reagent_amount)
		update_icon()

//Crazy long path
/obj/item/reagent_containers/hypospray/autoinjector/replenishing/stablizer
	name = "HAI - \"Stablizer\" Type E-2.3v1: IA | D+ | QC" //Hypospray AutoInjector
	desc = "A mix of psionics and chemmaster chemical synthesizing, this autoinjector slowly will refill itself based on a small dial. \
	The dial settings are: inaprovaline, dexalinp, quickclot."
	spawning_id = "inaprovaline"
	spawning_reagent_amount = 1
	icon_state = "syrette_psionic"
	baseline_sprite = "syrette_psionic"

//CRAZY long path
/obj/item/reagent_containers/hypospray/autoinjector/replenishing/stablizer/verb/flippyswitchy()

	set name = "Change Stablizer Synthesizing"
	set category = "Object"
	set src in usr

	switch(alert(usr, "Chemical to Synthesize", "Current Reagent: [spawning_id]", "inaprovaline", "dexalinp", "quickclot"))
		if("inaprovaline")
			spawning_id = "inaprovaline"
			spawning_reagent_amount = 1
		if("dexalinp")
			spawning_id = "dexalinp"
			spawning_reagent_amount = 0.5
		if("quickclot")
			spawning_id = "quickclot"
			spawning_reagent_amount = 0.25

	to_chat(usr, SPAN_NOTICE("With a simple twist of a dial you set the synthesizing reagent to [spawning_id] at a rate of [spawning_reagent_amount] units."))

/obj/item/reagent_containers/hypospray/autoinjector/replenishing/stablizer/examine(mob/user)
	..()
	to_chat(user, "The dial is set to [spawning_id].")
