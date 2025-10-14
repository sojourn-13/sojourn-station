/obj/structure/bolus
	name = "Bolus materal contructor frame"
	desc = "A frame for making a bolus stucture, useless to anyone without the blueprints, materals and time to contruct it."
	density = FALSE //Small stucture you can walk around or over it basically
	throwpass = TRUE //Dont block thorwing we are smoll
	anchored = TRUE
	icon = 'modular_sojourn/bolus_icons.dmi'

//                      ///
// The scanner of Water ///
//                      ///

/obj/structure/bolus/stillifer
	name = "Water Stillifer"
	desc = "A metal barrel with many small lasers that pin point and manipulate still water particals through bluespace. Runs on its own power bank."

	icon_state = "stillifer"
	reagent_flags = OPENCONTAINER //At any point in time you can just open the lid and look inside
	price_tag = 120 //Useless to most people

	var/waves_needed = 90 //Loops before we find a still water
	var/waves_delay = 3 //do_after timer used to slow down the proccess of producing a still water
	var/waves_done = 0 //a simple progress var, when reaching churns needed will be set back to zero, does not decay

/obj/structure/bolus/stillifer/Initialize()
	. = ..()
	create_reagents(250) //on batch making

/obj/structure/bolus/stillifer/attack_hand(mob/user as mob)
	if(turntable(user))
		table_turns(user)
	..()

/obj/structure/bolus/stillifer/proc/turntable(mob/user)
	if(reagents.get_reagent_amount("water"))
		return TRUE
	to_chat(user, SPAN_NOTICE("The stillifer needs water, in order to operate."))
	return FALSE

/obj/structure/bolus/stillifer/proc/table_turns(mob/user)
	while(waves_needed > waves_done)
		if(!turntable(user))
			break
		if(do_after(user, waves_delay))
			reagents.remove_reagent("water", rand(1, 2), 1)
			waves_done += 1
			if(prob(waves_done/12))
				cycle_completed()
				break
		else
			break
	if(waves_done >= waves_needed)
		cycle_completed()


/obj/structure/bolus/stillifer/proc/cycle_completed()
	waves_done = 0
	new /obj/item/bolus_craftable/still_water(src.loc)

//Remove and reset
/obj/structure/bolus/stillifer/proc/clear_out()
	if(reagents)
		reagents.clear_reagents()
	waves_done = 0
	return

/obj/structure/bolus/stillifer/verb/reset_stillifer()
	set name = "Clear Stillifer Completely Resets"
	set category = "Object"
	set src in range(1)

	if(!isghost(usr))
		clear_out()
	else
		to_chat(usr, SPAN_NOTICE("The stillifer cant detect ghosts! For they move to much..."))

///                               ///
/// The Scanner of Physical Items ///
///                               ///

/obj/structure/bolus/cellose
	name = "Bluespace Cellose Scanner"
	desc = "A Modifed scanner searching through logs for branches of in a super potion lost in bluespace. Runs on its own power bank."

	icon_state = "analyser"
	price_tag = 120 //Useless to most people

	var/scans_needed = 20 //Loops before we find a still water
	var/scans_time = 3 //do_after timer used to slow down the proccess of producing a still water
	var/scans_done = 0 //a simple progress var, when reaching churns needed will be set back to zero, does not decay

	var/planks = 0 //How many planks we have added to us

/obj/structure/bolus/cellose/examine(mob/user)
	..()

	var/message = "WARNING ONCE MATERALS ARE ADDED THEY ARE UNABLE TO BE REMOVED!!:\n"

	if(planks)
		message += "Cellose Materal Level Detected: [planks] units.\n"
	else
		message += "No Cellose Materal Detected: Add Tower Cap Like Logs"

	to_chat(user, "<span class='info'>[message]</span>")

/obj/structure/bolus/cellose/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/reagent_containers/snacks/grown))
		if(I.reagents.get_reagent_amount("woodpulp"))
			to_chat(user, "<span class='info'>The [src] silently eats the [I] making a happy plinking sound.</span>")
			planks += rand(10, 15)
			qdel(I)
		else
			to_chat(user, "<span class='info'>The [src] seems to not think that [I] is not a suitable log.</span>")
	else
		..()

/obj/structure/bolus/cellose/Initialize()
	. = ..()

/obj/structure/bolus/cellose/attack_hand(mob/user as mob)
	if(turntable(user))
		table_turns(user)
	..()

/obj/structure/bolus/cellose/proc/turntable(mob/user)
	if(planks)
		return TRUE
	to_chat(user, SPAN_NOTICE("The [src] needs more tower cap logs to scan."))
	return FALSE

/obj/structure/bolus/cellose/proc/table_turns(mob/user)
	while(scans_needed > scans_done)
		if(!turntable(user))
			break
		if(do_after(user, scans_time))
			scans_time = rand(1, 3)
			scans_done += 1
			planks -= 1
			//Got to get a bit lucky - Gambling!
			if(prob(scans_done/2))
				cycle_completed(1)
				break
		else
			break
	if(scans_done >= scans_needed)
		cycle_completed(0)

/obj/structure/bolus/cellose/proc/cycle_completed(outcome)
	scans_done = 0
	if(outcome)
		new /obj/item/bolus_craftable/blade_of_grass(src.loc)
	new /obj/item/bolus_craftable/ygg_twing(src.loc)

/obj/structure/bolus/roller
	name = "Mossifier Roller"
	desc = "A barrel filled with watery moss covered in bluespace dust and bluespace shard spikes, its handle is moves with easy."

	icon_state = "motor_old"
	price_tag = 120 //Useless to most people

	var/rotations_needed = 80 //Loops before we find a still water
	var/rotations_time = 3 //do_after timer used to slow down the proccess of producing a still water
	var/rotations_done = 0 //a simple progress var, when reaching churns needed will be set back to zero, does not decay

	var/stone = 0 //How many rocks we have added to us

/obj/structure/bolus/roller/examine(mob/user)
	..()

	var/message = "WARNING ONCE MATERALS ARE ADDED THEY ARE UNABLE TO BE REMOVED!!:\n"

	if(stone)
		message += "Rock Materal: [stone].\n"
	else
		message += "No Rock Materal: Add Raw Ore"

	to_chat(user, "<span class='info'>[message]</span>")

/obj/structure/bolus/roller/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/stack/ore))
		var/obj/item/stack/ore/O = I
		to_chat(user, "<span class='info'>With ease the [src] allows the stack of stones into the barrel.</span>")
		stone += rand(3, 5) * O.amount
		qdel(I)
	else
		to_chat(user, "<span class='info'>The [src] seems to not think that [I] is not a suitable stone.</span>")
	..()

/obj/structure/bolus/roller/Initialize()
	. = ..()

/obj/structure/bolus/roller/attack_hand(mob/user as mob)
	if(turntable(user))
		table_turns(user)
	..()

/obj/structure/bolus/roller/proc/turntable(mob/user)
	if(stone > 0)
		return TRUE
	to_chat(user, SPAN_NOTICE("The [src] needs more stones to turn."))
	return FALSE

/obj/structure/bolus/roller/proc/table_turns(mob/user)
	while(rotations_needed > rotations_done)
		if(!turntable(user))
			break
		if(do_after(user, rotations_time))
			rotations_time = rand(3, 6)
			rotations_done += 4
			stone -= rand(1, 2)
			if(prob(rotations_done/12))
				cycle_completed()
				break
		else
			break
	if(rotations_done >= rotations_needed)
		cycle_completed()


/obj/structure/bolus/roller/proc/cycle_completed()
	rotations_done = 0
	new /obj/item/bolus_craftable/rolling_stone(src.loc)

//                        ///
// The scanner of Liquids ///
//                        ///

//The majority of items are made from this as its juices/reagents
/obj/structure/bolus/liquid_to_soild
	name = "Xenophobic Spacetime Substack Tracking Unit."
	desc = "An advanced scanner that looks at the past of reagents placed inside slowly pulling out materal lost to entropy and bluespace. \
	Alt Clt to change what type of liquid to scan."

	icon_state = "analyser_old"
	reagent_flags = OPENCONTAINER //At any point in time you can just open the lid and look inside
	price_tag = 120 //Useless to most people

	var/waves_needed = 90 //Loops before we find a still water
	var/waves_delay = 3 //do_after timer used to slow down the proccess of producing a still water
	var/waves_done = 0 //a simple progress var, when reaching churns needed will be set back to zero, does not decay

	var/liquid_workings = "applejuce"
	var/liquid_name = "Apple Juice" //We do it like this to be more flavourful then automatic
	var/list/liquids = list("Apple Juce", "Grape Juice", "Fibers", "DNA", "Cancle")

/obj/structure/bolus/liquid_to_soild/Initialize()
	. = ..()
	create_reagents(250) //on batch making

/obj/structure/bolus/liquid_to_soild/attack_hand(mob/user as mob)
	if(turntable(user))
		table_turns(user)
	..()

/obj/structure/bolus/liquid_to_soild/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>Currently Processing: [liquid_name].</span>")

/obj/structure/bolus/liquid_to_soild/AltClick(mob/user)
	if(ishuman(user) || issilicon(user))
		var/user_is_choosing = TRUE
		while(user_is_choosing)
			var/action = input(user, "Swapping from: [liquid_name]", "Lost work will be: [waves_done] out of [waves_needed]!") as null|anything in liquids
			//Prevents griffen by holding a menu well someone else works.
			if(get_dist(src,user) >= 2)
				to_chat(user, SPAN_NOTICE("Your a little to far away to do this."))
				user_is_choosing = FALSE
				return
			switch(action)
				if("Apple Juice")
					liquid_workings = "applejuce"
					liquid_name = "Apple Juice"
					waves_done = 0
					to_chat(user, SPAN_NOTICE("You swap the Substack to process Apple Juice suspended in a falling motion."))
				if("Grape Juice")
					liquid_workings = "grapejuice"
					liquid_name = "Grape Juice"
					waves_done = 0
					to_chat(user, SPAN_NOTICE("You swap the Substack to process Grape Juice made by grapes that pre-exist the juice."))
				if("Fibers")
					liquid_workings = "clothfiber"
					liquid_name = "Fibers"
					waves_done = 0
					to_chat(user, SPAN_NOTICE("You swap the Substack to process Fibers that have have already been woven in a different dimension."))
				if("DNA")
					liquid_workings = "blood"
					liquid_name = "DNA"
					waves_done = 0
					to_chat(user, SPAN_NOTICE("You swap the Substack to process DNA from blood."))
				if("Cancel")
					to_chat(user, SPAN_NOTICE("You did not change the Substack in the end."))
			user_is_choosing = FALSE

	else
		to_chat(user, SPAN_NOTICE("The Substack needs to be handled by a human."))
		return

/obj/structure/bolus/liquid_to_soild/proc/turntable(mob/user)
	if(reagents.get_reagent_amount(liquid_workings))
		return TRUE
	to_chat(user, SPAN_NOTICE("The Substack needs [liquid_name], in order to operate."))
	return FALSE

/obj/structure/bolus/liquid_to_soild/proc/table_turns(mob/user)
	while(waves_needed > waves_done)
		if(!turntable(user))
			break
		if(do_after(user, waves_delay))
			reagents.remove_reagent("water", rand(1, 2), 1)
			waves_done += 1
			if(prob(waves_done/12))
				cycle_completed()
				break
		else
			break
	if(waves_done >= waves_needed)
		cycle_completed()


/obj/structure/bolus/liquid_to_soild/proc/cycle_completed()
	waves_done = 0

	//Item is given by the liquid name for that extra flavour
	switch(liquid_name)
		if("Apple Juice")
			new /obj/item/bolus_craftable/applejuice(src.loc)
		if("Grape Juice")
			new /obj/item/bolus_craftable/seed(src.loc)
		if("Fibers")
			new /obj/item/bolus_craftable/cotton(src.loc)
		if("DNA")
			new /obj/item/bolus_craftable/dust_bunny(src.loc)

//Remove and reset
/obj/structure/bolus/liquid_to_soild/proc/clear_out()
	if(reagents)
		reagents.clear_reagents()
	waves_done = 0
	return

/obj/structure/bolus/liquid_to_soild/verb/reset_stillifer()
	set name = "Clear Stillifer Completely Resets"
	set category = "Object"
	set src in range(1)

	if(!isghost(usr))
		clear_out()
	else
		to_chat(usr, SPAN_NOTICE("The device cant detect ghosts! For they have to little mass."))

//                 ///
// The Bolus Maker ///
//                 ///

/obj/structure/bolus/maker
	//Fruits of Labour, Boluse Young Operations Numberical Device
	name = "F.O.L: Endless Growth of Root and Seed of the Ideal World B.Y.O.N.D the Vail of Worlds at the Edge of Humanity and Space."
	desc = "A large strange device that takes strange materals not able to be found normally and turns them into short lasting medical boluses. \
	Almost all the engravings are short Latin phrases and warnings about over use of the products. Alt Click when ready to make a Boluse or to use the \"Help\" command."

	icon = 'modular_sojourn/bolus_maker.dmi'
	icon_state = "bolus_maker"

	pixel_x = -18 //Better alinement to the tile
	layer = 2.9 //So pills are over

	//A simple number. higher the value the different items it crafts.
	var/cultivation_level = 0

	//The value of the strongest item it had placed inside itself, Used to over-ride lower ones
	var/strongest_alinement_number = -1
	//Basically the alinement item that had the highest score is what determins type
	var/strongest_alinement = "Will"

	//List of alinements that we have successfully used to make a bolus
	var/list/descovered_alinements = list("Will")

	//Allows for reseting of the known index and production for the Will path
	var/index_purge_unlocked = FALSE

	//A way to keep track of all are recipies in game and debug issues.
	var/debug_list = null

	//Are radio
	var/obj/item/device/radio/ring_ring

/obj/structure/bolus/maker/Initialize(mapload)
	..()

	debug_list = BOLUS.recipes

/obj/structure/bolus/maker/Destroy()
	debug_list = null
	qdel(ring_ring)

	..()

/obj/structure/bolus/maker/AltClick(mob/user)
	if(ishuman(user) || issilicon(user))
		var/user_is_choosing = TRUE
		while(user_is_choosing)
			var/action = sanitizeSafe(input(user, "Producing Bolus: Alinemet type = [strongest_alinement]", "Cultivation Level: [cultivation_level]!", "Yes", "No"))
			//Prevents griffen by holding a menu well someone else works.
			if(get_dist(src,user) >= 2)
				to_chat(user, SPAN_NOTICE("Your a little to far away to do this."))
				user_is_choosing = FALSE
				return
			if(action == "Yes" || action == "Y" || action == "Ye")
				produce_boluse(user)
				user_is_choosing = FALSE
				return

			//Hidden Parser Stuff for code divers or folks that teach one another cool things.

			if(action == "?" || action == "Help" || action == "Hint" || action == "Question" || action == "How")
				generate_hints(user)
				user_is_choosing = FALSE
				return

			if(action == "Index Purge." || action == "I.P")
				if(index_purge_unlocked)
					index_purge(user)
					index_purge_unlocked = FALSE
				else
					to_chat(user, SPAN_NOTICE("You must unlock this feature first using the \"Help\" Command after descovering every bolus."))
				user_is_choosing = FALSE
				return

			if(action == "Clear" || action == "C" || action == "Clr")
				strongest_alinement_number = -1
				cultivation_level = 0
				to_chat(user, SPAN_NOTICE("Boluse cultivation Cleared. Alinement reset to Will"))
				strongest_alinement = "Will"
				user_is_choosing = FALSE
				return

			if(action == "Subtrack" || action == "Reduce" || action == "-")
				cultivation_level = cultivation_level * 0.9
				to_chat(user, SPAN_NOTICE("Boluse cultivation [action] by 10%."))
				user_is_choosing = FALSE
				return

			if(action == "Debug" || action == "Statis" || action == "Db" || action == "D.B")
				to_chat(user, SPAN_NOTICE("Boluse cultivation is at [cultivation_level]. \
				Strongest Alinement is [strongest_alinement_number] for [strongest_alinement]."))
				user_is_choosing = FALSE
				return

			to_chat(user, SPAN_NOTICE("Boluse cultivation cancled."))
			user_is_choosing = FALSE

/obj/structure/bolus/maker/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/bolus_craftable))
		var/obj/item/bolus_craftable/C = I
		to_chat(user, "<span class='info'>With ease the F.O.L eats and proccesses [C] into useable Bolus materals.</span>")
		if(strongest_alinement_number < C.strangth)
			strongest_alinement_number = C.strangth
			strongest_alinement = C.bolus_alinement
		cultivation_level += C.strangth
		to_chat(user, "<span class='info'>The F.O.L reads back its states: Cultivation Level = [cultivation_level] with Alinement of [strongest_alinement]. \
		The strongest Alinement value was [strongest_alinement_number].</span>")

		qdel(I)
	else
		to_chat(user, "<span class='info'>The F.O.L seems to not think that [I] is not a Bolus materal.</span>")
	..()

/obj/structure/bolus/maker/examine(mob/user)
	..()
	var/message = "WARNING ONCE MATERALS ARE ADDED THEY ARE UNABLE TO BE REMOVED!!:\n"

	if(cultivation_level > -10)
		message += "Cultivation Level: [cultivation_level].\n"
	if(strongest_alinement)
		message += "Strongest Cultivation Alinement: [strongest_alinement]"

	to_chat(user, SPAN_NOTICE("[message]"))

/obj/structure/bolus/maker/proc/produce_boluse(mob/user)
	var/completed = FALSE
	var/how_many = 0
	var/success_number = 0

	//Gather this for debug reasons
	if(!debug_list)
		debug_list = BOLUS.recipes

	for(var/path in typesof(/datum/bolus_crafting))
		var/datum/bolus_crafting/recipe = BOLUS.recipes[path]

		if(recipe.alinement == strongest_alinement)
			how_many++
			if(!(cultivation_level > recipe.max) && !(cultivation_level < recipe.min))
				new recipe.item(src.loc)
				completed = TRUE
				success_number = how_many
				//Hint System much
				var/indexed = FALSE
				for(var/DA in descovered_alinements)
					if(DA == recipe.alinement)
						indexed = TRUE
						break
				if(!indexed)
					LAZYADD(descovered_alinements, recipe.alinement)

				//Finding AND giving RnD points sections
				if(!recipe.found)
					if(recipe.awarding_points > 0)
						for(var/obj/machinery/computer/rdconsole/RD in GLOB.computer_list) // Check every RnD computer in existance
							if(RD.id == 1) // only core gets the science
								RD.files.adjust_research_points(recipe.awarding_points) // Give the points
								ring_ring.autosay("Bolus Research Uploaded, granting [recipe.awarding_points] research points!", "F.O.L Announcement System", "Science") // Make the radio say a message.

					recipe.found = TRUE
				//Writing down are descovery, used for feedback command
				recipe.level_descovered = cultivation_level
				if(recipe.lowest_level_descovered > cultivation_level)
					recipe.lowest_level_descovered = cultivation_level
				if(recipe.highest_level_descovered < cultivation_level)
					recipe.highest_level_descovered = cultivation_level

	if(!completed)
		to_chat(user, SPAN_NOTICE("The F.O.L fails to make a boluse, wasting its materals and resetting itself."))
	else
		to_chat(user, SPAN_NOTICE("The F.O.L makes a bolus! It's cultivaion level: [cultivation_level], with a [strongest_alinement] Alinement. \
		This is [success_number] out of [how_many] for [strongest_alinement]."))

	strongest_alinement_number = -1
	cultivation_level = 0

/obj/structure/bolus/maker/proc/generate_hints(mob/user)
	var/how_many = 0
	var/success_number = 0
	var/total_found = 0
	var/total_total = 0

	var/held_alinement = "ERROR"

	var/message = "Made F.O.L Bolus Index:\n"


	for(var/path in typesof(/datum/bolus_crafting))
		var/datum/bolus_crafting/recipe = BOLUS.recipes[path]
		//Dont waste processing on unknown ones
		if(recipe.found)
			total_found++

		//We moved past a type reset are how_many to get accurate sub-totals
		if(recipe.alinement != held_alinement)
			held_alinement = recipe.alinement
			how_many = 1 //We set to 1 for math reasons so we dont have 3/2

		total_total++
		for(var/hintkey in descovered_alinements)
			if(hintkey == recipe.alinement)
				how_many++
				if(recipe.found)
					success_number++
					message += "Following Stats for Bolus [success_number]/[how_many] for [recipe.alinement] alinement. \
					Found with a Cultivation level of [recipe.level_descovered]. \
					Highest Cultivation level on record is [recipe.highest_level_descovered] \
					Lowest is [recipe.lowest_level_descovered].\n"


	message += "Total Bolus found [total_found]/[total_total]"

	to_chat(user, SPAN_NOTICE("[message]"))

	if(total_found + 1 == total_total)
		index_purge_unlocked = TRUE
		visible_message("<b><font color='#ffaa00'>The F.O.L shimmers and prints a message on its screens \"Commend Unlocked: Index Purge.\" </font></b>")


	return message

/obj/structure/bolus/maker/proc/index_purge(mob/user)
	cultivation_level = 42
	strongest_alinement_number = -1
	strongest_alinement = "Will"

	descovered_alinements = list("Will")

	for(var/path in typesof(/datum/bolus_crafting))
		var/datum/bolus_crafting/recipe = BOLUS.recipes[path]
		recipe.found = FALSE
		recipe.level_descovered = 0
		recipe.highest_level_descovered = 0
		recipe.lowest_level_descovered = 0

