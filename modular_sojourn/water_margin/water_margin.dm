/obj/structure/dram_spawner
	name = "Dram Treasure Box"
	desc = "Slowly produces Culivated Dram's. Simply swipe any stamp to vend one. Also has a Dram recycler."
	density = FALSE //Small stucture you can walk around or over it basically
	throwpass = TRUE //Dont block thorwing we are smoll
	anchored = TRUE
	icon = 'modular_sojourn/bolus_icons.dmi' //Same things as this as im really bad at spriting
	icon_state = "motor_old"
	var/cooldown = 30 SECONDS
	var/coolingdown = FALSE

/obj/structure/dram_spawner/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/culivation_dram))
		to_chat(user, SPAN_NOTICE("You silently place the dram in the hopper."))
		coolingdown = FALSE
		qdel(I)
	if(istype(I, /obj/item/stamp))
		if(!coolingdown)
			to_chat(user, SPAN_NOTICE("After stamping a metal plate, a small round dram is molded around the ink, then sprayed blue."))
			new /obj/item/culivation_dram(src.loc)
			coolingdown = TRUE
			addtimer(CALLBACK(src, PROC_REF(cooldown_clearer)), cooldown)
		else
			to_chat(user, SPAN_NOTICE("The [src] buzzes as its unable to rapidly produce Drams. Best to give it around 30 seconds before trying again."))
	else
		..()

/obj/structure/dram_spawner/proc/cooldown_clearer()
	coolingdown = FALSE

/obj/structure/classics
	name = "Classics contructor frame"
	desc = "A frame for making a C-3 Classics stucture, useless to anyone without the related canon, materals and time to contruct it." //Classic-3
	density = FALSE //Small stucture you can walk around or over it basically
	throwpass = TRUE //Dont block thorwing we are smoll
	anchored = TRUE
	icon = 'modular_sojourn/bolus_icons.dmi' //Same things as this as im really bad at spriting
	var/the_super_message = ""


/obj/structure/classics/examine(mob/user)
	..()

	var/message = ""

	if(the_super_message)
		message += "THEORUM Reagents: [the_super_message].\n"

	if(dry_culivation())
		message += "THEORIUM PRINTOUT (May be inaccurate depending on levels of Enhancers) : <span class='big bold'>[dry_culivation()]</span>.\n"

	if(message != "")
		to_chat(user, "[message]")

/obj/structure/classics/Initialize()
	. = ..()
	create_reagents(100) //We want to store a bit of reagents for are crazy alchemy
	reagent_flags = OPENCONTAINER //At any point in time you can just open the lid and look inside

/obj/structure/classics/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/culivation_dram))
		var/obj/item/culivation_dram/dram = I
		to_chat(user, "<span class='info'>The [src] silently proesses [dram].</span>")
		culivation(dram)
	else
		..()

/obj/structure/classics/proc/culivation()
	return

/obj/structure/classics/proc/dry_culivation()
	return

//5 out of 8 treasures
/obj/structure/classics/chapters
	name = "O-992 M.P Coral Anex-1b.v921" //Outlawed Mind Papges
	desc = "When Collecting The Fallen Stars Of The Mind: A collection of last brain scans mapped onto graybrain matter."
	icon_state = "pod"
	the_super_message = "Reactents:\nWater (G),\nSilver (R),\nSodiumchloride(B),\nAlkysine(P).\nEnhancers = Cerebrix (Will add an additional G, R, B, P when processing a Reactent)"

/obj/structure/classics/chapters/culivation(obj/item/dram)
	if(istype(dram, /obj/item/culivation_dram))
		var/obj/item/culivation_dram/CD = dram
		if(reagents.get_reagent_amount("water"))
			reagents.remove_reagent("water", rand(1, 2), 1)
			CD.internal_code += span_green("▌")

			//Do it again!
			if(reagents.get_reagent_amount("psi_juice"))
				reagents.remove_reagent("psi_juice", rand(1, 2), 1)
				CD.internal_code += span_green("▌")

		if(reagents.get_reagent_amount("silver"))
			reagents.remove_reagent("silver", rand(1, 2), 1)
			CD.internal_code += span_red("▌")

			if(reagents.get_reagent_amount("psi_juice"))
				reagents.remove_reagent("psi_juice", rand(1, 2), 1)
				CD.internal_code += span_red("▌")

		if(reagents.get_reagent_amount("sodiumchloride"))
			reagents.remove_reagent("sodiumchloride", rand(1, 2), 1)
			CD.internal_code += span_blue("▌")

			if(reagents.get_reagent_amount("psi_juice"))
				reagents.remove_reagent("psi_juice", rand(1, 2), 1)
				CD.internal_code += span_blue("▌")

		if(reagents.get_reagent_amount("alkysine"))
			reagents.remove_reagent("alkysine", rand(1, 2), 1)
			CD.internal_code += span_purple("▌")

			if(reagents.get_reagent_amount("psi_juice"))
				reagents.remove_reagent("psi_juice", rand(1, 2), 1)
				CD.internal_code += span_purple("▌")

		if(CD.free_processes <= 0)
			CD.insight_rest_threshold_editor += 5 - CD.free_processes
			CD.damage_fire += 5 - CD.free_processes
			CD.damage_brute += 5 - CD.free_processes

		CD.free_processes -= 1

/obj/structure/classics/chapters/dry_culivation()
	var/the_message = ""

	if(reagents.get_reagent_amount("water"))
		the_message += span_green("▌")

		if(reagents.get_reagent_amount("psi_juice"))
			the_message += span_green("▌")

	if(reagents.get_reagent_amount("silver"))
		the_message += span_red("▌")

		if(reagents.get_reagent_amount("psi_juice"))
			the_message += span_red("▌")

	if(reagents.get_reagent_amount("sodiumchloride"))
		the_message += span_blue("▌")

		if(reagents.get_reagent_amount("psi_juice"))
			the_message += span_blue("▌")

	if(reagents.get_reagent_amount("alkysine"))
		the_message += span_purple("▌")

		if(reagents.get_reagent_amount("psi_juice"))
			the_message += span_purple("▌")

	return the_message

/obj/structure/classics/pages
	name = "PX-22 Jade Tangji-93c" //Pages eXtracted
	desc = "When Gutting A Mouth Of All Its Breath: Jars full of last breaths."
	icon_state = "analyser_old"
	the_super_message = "Reactents:\nCopper (GR),\nPotassium (RB),\nSodiumchloride(BP),\nSugar(PG).\nEnhancers = Tungsten (Will add an additional G, R, B, P when processing a Reactent)"

/obj/structure/classics/pages/culivation(obj/item/dram)
	if(istype(dram, /obj/item/culivation_dram))
		var/obj/item/culivation_dram/CD = dram
		if(reagents.get_reagent_amount("copper"))
			reagents.remove_reagent("copper", rand(1, 2), 1)
			CD.internal_code += span_green("▌")
			CD.internal_code += span_red("▌")

			if(reagents.get_reagent_amount("tungsten"))
				reagents.remove_reagent("tungsten", rand(1, 2), 1)
				CD.internal_code += span_green("▌")

		if(reagents.get_reagent_amount("potassium"))
			reagents.remove_reagent("potassium", rand(1, 2), 1)
			CD.internal_code += span_red("▌")
			CD.internal_code += span_blue("▌")

			if(reagents.get_reagent_amount("tungsten"))
				reagents.remove_reagent("tungsten", rand(1, 2), 1)
				CD.internal_code += span_red("▌")

		if(reagents.get_reagent_amount("sodiumchloride"))
			reagents.remove_reagent("sodiumchloride", rand(1, 2), 1)
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_purple("▌")

			if(reagents.get_reagent_amount("tungsten"))
				reagents.remove_reagent("tungsten", rand(1, 2), 1)
				CD.internal_code += span_blue("▌")

		if(reagents.get_reagent_amount("sugar"))
			reagents.remove_reagent("sugar", rand(1, 2), 1)
			CD.internal_code += span_purple("▌")
			CD.internal_code += span_green("▌")

			if(reagents.get_reagent_amount("tungsten"))
				reagents.remove_reagent("tungsten", rand(1, 2), 1)
				CD.internal_code += span_purple("▌")

		if(CD.free_processes <= 0)
			CD.insight_rest_threshold_editor += 5 - CD.free_processes
			CD.damage_fire += 5 - CD.free_processes
			CD.damage_brute += 5 - CD.free_processes

		CD.free_processes -= 1

/obj/structure/classics/pages/dry_culivation()
	var/the_message = ""

	if(reagents.get_reagent_amount("copper"))
		the_message +=  span_green("▌")
		the_message +=  span_red("▌")

		if(reagents.get_reagent_amount("tungsten"))
			the_message +=  span_green("▌")

	if(reagents.get_reagent_amount("potassium"))
		the_message +=  span_red("▌")
		the_message +=  span_blue("▌")

		if(reagents.get_reagent_amount("tungsten"))
			the_message +=  span_red("▌")

	if(reagents.get_reagent_amount("sodiumchloride"))
		the_message +=  span_blue("▌")
		the_message +=  span_purple("▌")

		if(reagents.get_reagent_amount("tungsten"))
			the_message +=  span_blue("▌")

	if(reagents.get_reagent_amount("sugar"))
		the_message +=  span_purple("▌")
		the_message +=  span_green("▌")

		if(reagents.get_reagent_amount("tungsten"))
			the_message +=  span_purple("▌")

	return the_message

/obj/structure/classics/records
	name = "RDDK Pear Ji-7cbd" //Records Documents of Dead Kids
	desc = "When Seeing The Life Not Lived Before: Small cases of eyedrops and optic nerves holding the last sights."
	icon_state = "analyser"
	the_super_message = "Reactents:\nIron (GR),\nPotassium (RB),\nRadium(BP),\nAcetone(PG),\nImidazoline(GP)."

/obj/structure/classics/records/culivation(obj/item/dram)
	if(istype(dram, /obj/item/culivation_dram))
		var/obj/item/culivation_dram/CD = dram
		if(reagents.get_reagent_amount("iron"))
			reagents.remove_reagent("iron", rand(1, 2), 1)
			CD.internal_code += span_green("▌")
			CD.internal_code += span_red("▌")

		if(reagents.get_reagent_amount("potassium"))
			reagents.remove_reagent("potassium", rand(1, 2), 1)
			CD.internal_code += span_red("▌")
			CD.internal_code += span_blue("▌")

		if(reagents.get_reagent_amount("radium"))
			reagents.remove_reagent("radium", rand(1, 2), 1)
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_purple("▌")

		if(reagents.get_reagent_amount("acetone"))
			reagents.remove_reagent("acetone", rand(1, 2), 1)
			CD.internal_code += span_purple("▌")
			CD.internal_code += span_green("▌")

		if(reagents.get_reagent_amount("imidazoline"))
			reagents.remove_reagent("imidazoline", rand(1, 2), 1)
			CD.internal_code += span_green("▌")
			CD.internal_code += span_purple("▌")

		if(CD.free_processes <= 0)
			CD.insight_rest_threshold_editor += 5 - CD.free_processes
			CD.damage_fire += 5 - CD.free_processes
			CD.damage_brute += 5 - CD.free_processes

		CD.free_processes -= 1

/obj/structure/classics/records/dry_culivation()
	var/the_message = ""

	if(reagents.get_reagent_amount("iron"))
		the_message += span_green("▌")
		the_message += span_red("▌")

	if(reagents.get_reagent_amount("potassium"))
		the_message += span_red("▌")
		the_message += span_blue("▌")

	if(reagents.get_reagent_amount("radium"))
		the_message += span_blue("▌")
		the_message += span_purple("▌")

	if(reagents.get_reagent_amount("acetone"))
		the_message += span_purple("▌")
		the_message += span_green("▌")

	if(reagents.get_reagent_amount("imidazoline"))
		the_message += span_green("▌")
		the_message += span_purple("▌")

	return the_message

/obj/structure/classics/letters
	name = "LOTMOX Gold Kyloxi-4.3pvmxc" //Leaflets Of Thermial Minds On Xylographs
	desc = "When Warmth Falls To Coldness Of The Failing Body: Sealed nano-thin sheets of warmed silk from last moments."
	icon_state = "stillifer"
	the_super_message = "Reactents:\nBlood (BPBB),\nNutriment (BPPR),\nProtein(RGGR),\nMilk(BPGR),\nLeporazine(BGGB)."

/obj/structure/classics/letters/culivation(obj/item/dram)
	if(istype(dram, /obj/item/culivation_dram))
		var/obj/item/culivation_dram/CD = dram
		if(reagents.get_reagent_amount("blood"))
			reagents.remove_reagent("blood", rand(1, 2), 1)
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_purple("▌")
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_blue("▌")

		if(reagents.get_reagent_amount("nutriment"))
			reagents.remove_reagent("nutriment", rand(1, 2), 1)
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_purple("▌")
			CD.internal_code += span_purple("▌")
			CD.internal_code += span_red("▌")

		if(reagents.get_reagent_amount("protein"))
			reagents.remove_reagent("protein", rand(1, 2), 1)
			CD.internal_code += span_red("▌")
			CD.internal_code += span_green("▌")
			CD.internal_code += span_green("▌")
			CD.internal_code += span_red("▌")

		if(reagents.get_reagent_amount("milk"))
			reagents.remove_reagent("milk", rand(1, 2), 1)
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_purple("▌")
			CD.internal_code += span_green("▌")
			CD.internal_code += span_red("▌")

		if(reagents.get_reagent_amount("leporazine"))
			reagents.remove_reagent("leporazine", rand(1, 2), 1)
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_green("▌")
			CD.internal_code += span_green("▌")
			CD.internal_code += span_blue("▌")

		if(CD.free_processes <= 0)
			CD.insight_rest_threshold_editor += 5 - CD.free_processes
			CD.damage_fire += 5 - CD.free_processes
			CD.damage_brute += 5 - CD.free_processes

		CD.free_processes -= 1

/obj/structure/classics/letters/dry_culivation()
	var/the_message = ""

	if(reagents.get_reagent_amount("blood"))
		the_message += span_blue("▌")
		the_message += span_purple("▌")
		the_message += span_blue("▌")
		the_message += span_blue("▌")

	if(reagents.get_reagent_amount("nutriment"))
		the_message += span_blue("▌")
		the_message += span_purple("▌")
		the_message += span_purple("▌")
		the_message += span_red("▌")

	if(reagents.get_reagent_amount("protein"))
		the_message += span_red("▌")
		the_message += span_green("▌")
		the_message += span_green("▌")
		the_message += span_red("▌")

	if(reagents.get_reagent_amount("milk"))
		the_message += span_blue("▌")
		the_message += span_purple("▌")
		the_message += span_green("▌")
		the_message += span_red("▌")

	if(reagents.get_reagent_amount("leporazine"))
		the_message += span_blue("▌")
		the_message += span_green("▌")
		the_message += span_green("▌")
		the_message += span_blue("▌")

	return the_message

/obj/structure/classics/stars
	name = "HQOMA Lozenges Effloresced E.G.O::Dark Sky Under One Eye" //HeadQuarters Of Mental Affairs
	desc = "When Adorning The Streets With Your Cerebrospinal Fluid: The last emotions condensed and made into liquid."
	icon_state = "stillifer"
	the_super_message = "Reactents:\nEthanol (RPBB),\nLithium (BPBB),\nMercury(RRBB),\nSilicon(GGBR),\nSodium(PPGB)."

/obj/structure/classics/stars/culivation(obj/item/dram)
	if(istype(dram, /obj/item/culivation_dram))
		var/obj/item/culivation_dram/CD = dram
		if(reagents.get_reagent_amount("ethanol"))
			reagents.remove_reagent("ethanol", rand(1, 2), 1)
			CD.internal_code += span_red("▌")
			CD.internal_code += span_purple("▌")
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_blue("▌")

		if(reagents.get_reagent_amount("lithium"))
			reagents.remove_reagent("lithium", rand(1, 2), 1)
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_purple("▌")
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_blue("▌")

		if(reagents.get_reagent_amount("mercury"))
			reagents.remove_reagent("mercury", rand(1, 2), 1)
			CD.internal_code += span_red("▌")
			CD.internal_code += span_red("▌")
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_blue("▌")

		if(reagents.get_reagent_amount("silicon"))
			reagents.remove_reagent("silicon", rand(1, 2), 1)
			CD.internal_code += span_green("▌")
			CD.internal_code += span_green("▌")
			CD.internal_code += span_blue("▌")
			CD.internal_code += span_red("▌")

		if(reagents.get_reagent_amount("sodium"))
			reagents.remove_reagent("sodium", rand(1, 2), 1)
			CD.internal_code += span_purple("▌")
			CD.internal_code += span_purple("▌")
			CD.internal_code += span_green("▌")
			CD.internal_code += span_blue("▌")

		if(CD.free_processes <= 0)
			CD.insight_rest_threshold_editor += 5 - CD.free_processes
			CD.damage_fire += 5 - CD.free_processes
			CD.damage_brute += 5 - CD.free_processes

		CD.free_processes -= 1

/obj/structure/classics/stars/dry_culivation()
	var/the_message = ""

	if(reagents.get_reagent_amount("ethanol"))
		the_message += span_red("▌")
		the_message += span_purple("▌")
		the_message += span_blue("▌")
		the_message += span_blue("▌")

	if(reagents.get_reagent_amount("lithium"))
		the_message += span_blue("▌")
		the_message += span_purple("▌")
		the_message += span_blue("▌")
		the_message += span_blue("▌")

	if(reagents.get_reagent_amount("mercury"))
		the_message += span_red("▌")
		the_message += span_red("▌")
		the_message += span_blue("▌")
		the_message += span_blue("▌")

	if(reagents.get_reagent_amount("silicon"))
		the_message += span_green("▌")
		the_message += span_green("▌")
		the_message += span_blue("▌")
		the_message += span_red("▌")

	if(reagents.get_reagent_amount("sodium"))
		the_message += span_purple("▌")
		the_message += span_purple("▌")
		the_message += span_green("▌")
		the_message += span_blue("▌")

	return the_message
