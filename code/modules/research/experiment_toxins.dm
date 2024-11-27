
// Grants research points when explosion happens nearby
/obj/item/device/radio/beacon/explosion_watcher
	name = "Kinetic Energy Scanner"
	desc = "Scans the level of kinetic energy from explosions. \
	This beacon is, in fact, bombproof and to use it properly you must use the bomb within 10 tiles of this scanner."

	channels = list("Science" = 1)
	var/targetBoom
	var/stored_points = 250000 //This is how many points we hve stored, we use them up when successfull
	//6.1 perfect bombs
	var/target_wealth = 0 //Used for how much stuff is worth around.
	var/over_value_punishment = 1.5

/obj/item/device/radio/beacon/explosion_watcher/examine(mob/user)
	..()
	to_chat(usr, "EXPECTED EXPLOSION - [targetBoom]")
	to_chat(usr, "Points Left - [stored_points]")
	to_chat(usr, "Required Asset Value - [target_wealth] to [target_wealth*over_value_punishment]")
	to_chat(usr, "Assets in view worth - [asset_wealth(give_value=TRUE)]")
	if(iscarbon(user))
		to_chat(usr, "Randomize List Simple For Reaching Target Wealth - [rlsfrtw()]")

/obj/item/device/radio/beacon/explosion_watcher/ex_act(severity)
	return

/obj/item/device/radio/beacon/explosion_watcher/Initialize()
	. = ..()
	GLOB.explosion_watcher_list += src
	targetBoom = rand(10,35)
	target_wealth = 120 //First ones free 100% of the time.

/obj/item/device/radio/beacon/explosion_watcher/Destroy()
	GLOB.explosion_watcher_list -= src
	return ..()

/obj/item/device/radio/beacon/explosion_watcher/proc/rlsfrtw()
	var/return_orders = "\n"
	if(asset_wealth())
		return_orders = "Current Area Matches Wealth Requirements"
		return return_orders
	if(asset_wealth(give_value=TRUE) > (target_wealth * over_value_punishment))
		return_orders = "Current Area Matches Has To Much Wealth. Please remove some structures!"
		return return_orders

	var/shopping_list = 0
	var/picked_picker
	//Someone more smart then me should make this into a list
	var/closets = 0
	var/railings = 0
	var/tables = 0
	var/grilles = 0
	var/bookcases = 0
	var/chairstables = 0
	var/lowwalls = 0
	var/windows = 0
	var/barricades = 0

	while(shopping_list < target_wealth)
		picked_picker = pick("Closets","Railings","Tables","Grilles","Bookcases","ChairsTables","LowWalls","Windows", "Barricades")
		switch(picked_picker)
			if("Closets")
				closets += 1
				shopping_list += 10
			if("Railings")
				railings += 1
				shopping_list += 2
			if("Tables")
				tables += 1
				shopping_list += 5
			if("Grilles")
				grilles += 1
				shopping_list += 10
			if("Bookcases")
				bookcases += 1
				shopping_list += 15
			if("ChairsTables")
				chairstables += 1
				shopping_list += 2
			if("LowWalls")
				lowwalls += 1
				shopping_list += 5
			if("Windows")
				windows += 1
				shopping_list += 2
			if("Barricades")
				barricades += 1
				shopping_list += 3

	return_orders += "Closets:[closets].\n"
	return_orders += "Railings:[railings].\n"
	return_orders += "Tables:[tables].\n"
	return_orders += "Grilles:[grilles].\n"
	return_orders += "Bookcases:[bookcases].\n"
	return_orders += "Chairs and Tables:[chairstables].\n"
	return_orders += "Low Walls:[lowwalls].\n"
	return_orders += "Windows (basic glass):[windows].\n"
	return_orders += "Barricades:[barricades].\n"

	return return_orders

/obj/item/device/radio/beacon/explosion_watcher/proc/asset_wealth(give_value = FALSE)
	var/gathered_value = 0
	for(var/obj/structure/S in orange(8, src))
		if(istype(S, /obj/structure/closet))
			gathered_value += 10

		if(istype(S, /obj/structure/railing))
			gathered_value += 2
			var/obj/structure/railing/R = S
			if(R.reinforced) //If we add a few extra bits of reinforcement then we add a small amount
				gathered_value += 3

		if(istype(S, /obj/structure/low_wall))
			gathered_value += 5

		if(istype(S, /obj/structure/window))
			gathered_value += 2
			if(istype(S, /obj/structure/window/reinforced))
				gathered_value += 1
			if(istype(S, /obj/structure/window/reinforced/plasma))
				gathered_value += 8
			if(istype(S, /obj/structure/window/plasmabasic))
				gathered_value += 3

		if(istype(S, /obj/structure/table))
			gathered_value += 5
		if(istype(S, /obj/structure/bed))
			gathered_value += 2
		if(istype(S, /obj/structure/catwalk))
			gathered_value += 1
		if(istype(S, /obj/structure/bookcase))
			gathered_value += 15
		if(istype(S, /obj/structure/barricade))
			gathered_value += 3
		if(istype(S, /obj/structure/grille))
			gathered_value += 2
		if(istype(S, /obj/structure/filingcabinet))
			gathered_value += 30
		//Bringind trash down or going to a trash ritch area should be rewarded
		if(istype(S, /obj/structure/salvageable))
			gathered_value += 60
		if(istype(S, /obj/structure/scrap_cube))
			gathered_value += 7
		if(istype(S, /obj/structure/flora))
			gathered_value += 2
		if(istype(S, /obj/structure/reagent_dispensers))
			gathered_value += 25 //Rare-ish

	for(var/obj/item/target/T in orange(8, src))
		if(T)
			gathered_value += 5 //Targets are worth 5 as you can buy and stack like 400 in a single tile!

	for(var/obj/machinery/constructable_frame/machine_frame/CF in orange(8, src))
		if(CF)
			gathered_value += 15
			if(CF.state > 1)
				gathered_value += 2

	for(var/obj/item/modular_computer/console/PC in orange(8, src))
		if(PC)
			gathered_value += 18

	for(var/obj/machinery/computer/C in orange(8, src))
		if(C)
			gathered_value += 17
/*
	for(var/turf/simulated/floor/F in orange(8, src))
		if(F.health != F.maxHealth)
			gathered_value -= 2 // Repair the floors you smucks!
*/
	if(give_value)
		return gathered_value

	if(gathered_value > (target_wealth * over_value_punishment))
		return FALSE
	if(gathered_value < target_wealth)
		return FALSE
	return TRUE

/obj/item/device/radio/beacon/explosion_watcher/proc/react_explosion(turf/epicenter, power)
	power = round(power)
	var/calculated_research_points = -1
	var/target_wealth_achived = asset_wealth()
	for(var/obj/machinery/computer/rdconsole/RD in GLOB.computer_list)
		if(RD.id == 1) // only core gets the science
			var missed

			if(target_wealth_achived)
				missed = abs(power-targetBoom) * 8000 // each step away from the target will result in 8,000 points less, this is a range of 11.
				if(stored_points >= 40000)
					calculated_research_points = max(0,40000 - missed)
				else
					calculated_research_points = max(0,stored_points - missed)
				stored_points -= calculated_research_points
				RD.files.adjust_research_points(calculated_research_points)
			else
				autosay("Notice: Explosion environment not correctly fielded. No Points generated.", name ,"Science")

	if(target_wealth_achived)
		if(calculated_research_points > 0 && stored_points)
			autosay("Detected explosion with power level [power]. Expected explosion was [targetBoom]. Received [calculated_research_points] Research Points", name ,"Science")
		if(0 >= stored_points)
			autosay("Detected explosion with power level [power]. Expected explosion was [targetBoom]. No Additional Data Points Able To Gather", name ,"Science")
		if(0 >= calculated_research_points)
			autosay("Detected explosion with power level [power], Expected explosion was [targetBoom]. Test Results Outside Expected Range", name ,"Science")
	targetBoom = rand(10,35)
	if(target_wealth == initial(target_wealth))
		target_wealth = rand(80, 120)

	else
		if(calculated_research_points)
			var/wealth_mult = initial(stored_points)/(stored_points + 1)
			if(wealth_mult > 3) //Slower scaling
				wealth_mult *= 0.5
			target_wealth = rand(80, 120) * wealth_mult
			target_wealth = round(target_wealth)
	autosay("Next expected power level is [targetBoom]; Asset Value Range: [target_wealth] to [target_wealth*over_value_punishment].", name ,"Science")


