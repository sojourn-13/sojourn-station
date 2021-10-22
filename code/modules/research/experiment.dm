// Contains everything related to earning research points
#define AUTOPSY_WEAPON_PAMT rand(5,10) * 200 // 1000-2000 points for random weapon
#define ARTIFACT_PAMT rand(5,10) * 1000 // 5000-10000 points for random artifact

GLOBAL_LIST_EMPTY(explosion_watcher_list)

/datum/experiment_data
	var/saved_best_explosion = 0

	var/static/list/tech_points = list(
		TECH_MATERIAL = 250,
		TECH_ENGINEERING = 300,
		TECH_PLASMA = 600, //Harder to get in higher levels, Rnd gets 2-3-4
		TECH_POWER = 350,
		TECH_BLUESPACE = 750,
		TECH_BIO = 350,
		TECH_COMBAT = 500,
		TECH_MAGNET = 350,
		TECH_DATA = 450,
		TECH_ILLEGAL = 3500,
	) //Ideally rnd DA should get you most things with right items well harder to get items like end nodes would require disks you buy/get or doing subdepartments

	// So we don't give points for researching non-artifact item
	var/static/list/artifact_types = list(
		/obj/machinery/auto_cloner,
		/obj/machinery/power/supermatter,
		/obj/machinery/giga_drill,
		/obj/mecha/working/hoverpod,
		/obj/machinery/replicator,
		/obj/machinery/artifact
	)

	var/list/saved_tech_levels = list() // list("materials" = list(1, 4, ...), ...)
	var/list/saved_autopsy_weapons = list()
	var/list/saved_artifacts = list()
	var/list/saved_symptoms = list()
	var/list/saved_slimecores = list()
	var/list/saved_fruituid = list()
	var/list/saved_fruitnames = list()
	var/list/saved_fruitchems = list()
	var/list/saved_fruittraits = list()

	// Special point amount for autopsy weapons
	var/static/list/special_weapons = list(
		"large organic needle" = 10000,
		"Hulk Foot" = 10000,
		"Explosive blast" = 7500,
		"Electronics meltdown" = 5000,
		"Low Pressure" = 8000, //Kinda hard when were on a planet
		"Facepalm" = 2000,
	)
	// Points for each symptom level, from 1 to 5
	var/static/list/level_to_points = list(200,500,1000,2500,10000)
	// Points for special slime cores
	var/static/list/core_points = list(
		//Level 0 - Gray
		/obj/item/slime_extract/grey = 3000,
		//Level 1
		/obj/item/slime_extract/metal = 4500,
		/obj/item/slime_extract/purple = 4500,
		/obj/item/slime_extract/orange = 4500,
		/obj/item/slime_extract/blue = 4500,
		//Level 2
		/obj/item/slime_extract/yellow = 5750,
		/obj/item/slime_extract/red = 5750,
		/obj/item/slime_extract/darkpurple = 5750,
		/obj/item/slime_extract/silver = 5750,
		/obj/item/slime_extract/gold = 5750,
		/obj/item/slime_extract/darkblue = 5750,
		/obj/item/slime_extract/pink = 5750,
		/obj/item/slime_extract/green = 5750,
		//Level 3
		/obj/item/slime_extract/black = 7500,
		/obj/item/slime_extract/lightpink = 7500,
		/obj/item/slime_extract/oil = 7500,
		/obj/item/slime_extract/adamantine = 7500,
		//Fancy/Rare
		/obj/item/slime_extract/pyrite = 10000,
		/obj/item/slime_extract/cerulean = 10000,
		/obj/item/slime_extract/sepia = 10000,
		/obj/item/slime_extract/bluespace = 15000,
		/obj/item/slime_extract/rainbow = 25000 //Lots of work for basiclly 1/4th of what RnD can do with a bit of metal
	)

/*
/datum/experiment_data/proc/ConvertReqString2List(list/source_list)
	var/list/temp_list = params2list(source_list)
	for(var/O in temp_list)
		temp_list[O] = text2num(temp_list[O])
	return temp_list
*/
// TODO: unify this with do_research_object?
/datum/experiment_data/proc/get_object_research_value(obj/item/I, ignoreRepeat = FALSE)
	var/list/temp_tech = I.origin_tech
	var/item_tech_points = 0
	var/has_new_tech = FALSE

	for(var/T in temp_tech)
		if(tech_points[T])
			if(ignoreRepeat)
				item_tech_points += temp_tech[T] * tech_points[T]
			else
				if(saved_tech_levels[T] && (temp_tech[T] in saved_tech_levels[T])) // You only get a fraction of points if you researched items with this level already
					if(istype(I,/obj/item/circuitboard) || istype(I,/obj/item/integrated_circuit)) //Boards and ciruits are cheap and spamable to make
						item_tech_points += temp_tech[T] * tech_points[T] * 0
					else
						item_tech_points += temp_tech[T] * tech_points[T] * 0.1
				else
					item_tech_points += temp_tech[T] * tech_points[T]
					has_new_tech = TRUE

	if(!ignoreRepeat && !has_new_tech) // We are deconstucting the same items, cut the reward really hard
		item_tech_points = min(item_tech_points, 400)

	return round(item_tech_points)

/datum/experiment_data/proc/do_research_object(obj/item/I)
	var/list/temp_tech = I.origin_tech

	for(var/T in temp_tech)
		if(!saved_tech_levels[T])
			saved_tech_levels[T] = list()

		if(!(temp_tech[T] in saved_tech_levels[T]))
			saved_tech_levels[T] += temp_tech[T]



// Returns amount of research points received
/datum/experiment_data/proc/read_science_tool(obj/item/device/science_tool/I)
	var/points = 0

	for(var/weapon in I.scanned_autopsy_weapons)
		if(!(weapon in saved_autopsy_weapons))
			saved_autopsy_weapons += weapon

			if(special_weapons[weapon])
				points += special_weapons[weapon]
			else
				points += AUTOPSY_WEAPON_PAMT

	for(var/list/artifact in I.scanned_artifacts)
		if(!(artifact["type"] in artifact_types)) // useless
			continue

		var/already_scanned = FALSE
		for(var/list/our_artifact in saved_artifacts)
			if(our_artifact["type"] == artifact["type"] && our_artifact["first_effect"] == artifact["first_effect"] && our_artifact["second_effect"] == artifact["second_effect"])
				already_scanned = TRUE
				break

		if(!already_scanned)
			points += ARTIFACT_PAMT
			saved_artifacts += list(artifact)

			/////////////////////////////////////// VIRUS SCANNER

	for(var/symptom in I.scanned_symptoms)
		if(saved_symptoms[symptom])
			continue

		var/level = I.scanned_symptoms[symptom]
		if(level_to_points[level])
			points += level_to_points[level]

		saved_symptoms[symptom] = level

		/////////////////////////////////////////// SLIME CORES

	for(var/core in I.scanned_slimecores)
		if(core in saved_slimecores)
			continue

		var/reward = 1000
		if(core in core_points)
			reward = core_points[core]
		points += reward
		saved_slimecores += core

		////////////////////////////////////////// PLANT DATA

	for(var/plantname in I.scanned_fruitnames)
		if (plantname in saved_fruitnames)
			continue
		var/given = rand (200,1000)
		saved_fruitnames+=plantname
		points += given

	for(var/chemname in I.scanned_fruitchems)
		if (chemname in saved_fruitchems)
			continue
		var/given = rand (750,2250)
		saved_fruitchems += chemname
		points += given
	for(var/traitname in I.scanned_fruittraits)
		if (traitname in saved_fruittraits)
			continue
		var/ given = rand (1500,2500)
		saved_fruittraits += traitname
		points += given


	I.clear_data()
	return round(points)

/datum/experiment_data/proc/merge_with(datum/experiment_data/O)
	for(var/tech in O.saved_tech_levels)
		if(!saved_tech_levels[tech])
			saved_tech_levels[tech] = list()

		saved_tech_levels[tech] |= O.saved_tech_levels[tech]

	for(var/weapon in O.saved_autopsy_weapons)
		saved_autopsy_weapons |= weapon

	for(var/list/artifact in O.saved_artifacts)
		var/has_artifact = FALSE
		for(var/list/our_artifact in saved_artifacts)
			if(our_artifact["type"] == artifact["type"] && our_artifact["first_effect"] == artifact["first_effect"] && our_artifact["second_effect"] == artifact["second_effect"])
				has_artifact = TRUE
				break
		if(!has_artifact)
			saved_artifacts += list(artifact)

	for(var/symptom in O.saved_symptoms)
		saved_symptoms[symptom] = O.saved_symptoms[symptom]

	for(var/core in O.saved_slimecores)
		saved_slimecores |= core

	saved_best_explosion = max(saved_best_explosion, O.saved_best_explosion)


// Grants research points when explosion happens nearby
/obj/item/device/radio/beacon/explosion_watcher
	name = "Kinetic Energy Scanner"
	desc = "Scans the level of kinetic energy from explosions. This beacon, is in fact bomb proof and to use it properly you must use the bomb within 10 tiles of this scanner."

	channels = list("Science" = 1)

/obj/item/device/radio/beacon/explosion_watcher/ex_act(severity)
	return

/obj/item/device/radio/beacon/explosion_watcher/Initialize()
	. = ..()
	GLOB.explosion_watcher_list += src

/obj/item/device/radio/beacon/explosion_watcher/Destroy()
	GLOB.explosion_watcher_list -= src
	return ..()

/obj/item/device/radio/beacon/explosion_watcher/proc/react_explosion(turf/epicenter, power)
	power = round(power)
	var/calculated_research_points = -1
	for(var/obj/machinery/computer/rdconsole/RD in GLOB.computer_list)
		if(RD.id == 1) // only core gets the science
			var/saved_power_level = RD.files.experiments.saved_best_explosion

			var/added_power = max(0, power - saved_power_level)
			var/already_earned_power = min(saved_power_level, power)

			calculated_research_points = added_power * 500 + already_earned_power * 200

			if(power > saved_power_level)
				RD.files.experiments.saved_best_explosion = power

			RD.files.research_points += calculated_research_points

	if(calculated_research_points > 0)
		autosay("Detected explosion with power level [power], received [calculated_research_points] research points", name ,"Science")
	else
		autosay("Detected explosion with power level [power], R&D console is missing or broken", name ,"Science")

// Universal tool to get research points from autopsy reports, virus info reports, archeology reports, slime cores
/obj/item/device/science_tool
	name = "science tool"
	icon_state = "science"
	item_state = "sciencetool"
	desc = "A hand-held device capable of extracting usefull data from various sources, such as paper reports and slime cores."
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throwforce = 3
	w_class = ITEM_SIZE_SMALL
	throw_speed = 5
	throw_range = 10
	matter = list(MATERIAL_STEEL = 5)
	origin_tech = list(TECH_ENGINEERING = 1, TECH_BIO = 1)

	var/datum/experiment_data/experiments
	var/list/scanned_autopsy_weapons = list()
	var/list/scanned_artifacts = list()
	var/list/scanned_symptoms = list()
	var/list/scanned_slimecores = list()
	var/list/scanned_fruituid = list()
	var/list/scanned_fruitnames = list()
	var/list/scanned_fruitchems = list()
	var/list/scanned_fruittraits = list()
	var/datablocks = 0

/obj/item/device/science_tool/Initialize()
	. = ..()
	experiments = new

/obj/item/device/science_tool/attack(mob/living/M, mob/living/user)
	if(!user.stat_check(STAT_COG, STAT_LEVEL_ADEPT))
		to_chat(user, SPAN_WARNING("Your cognitive understanding isn't high enough to use this!"))
		return

	return

/obj/item/device/science_tool/afterattack(obj/O, mob/living/user)
	var/scanneddata = 0

	if(istype(O,/obj/item/paper/autopsy_report))
		var/obj/item/paper/autopsy_report/report = O
		for(var/datum/autopsy_data/W in report.autopsy_data)
			if(!(W.weapon in scanned_autopsy_weapons))
				scanneddata += 1
				scanned_autopsy_weapons += W.weapon

	if(istype(O, /obj/item/paper/artifact_info))
		var/obj/item/paper/artifact_info/report = O
		if(report.artifact_type)
			for(var/list/artifact in scanned_artifacts)
				if(artifact["type"] == report.artifact_type && artifact["first_effect"] == report.artifact_first_effect && artifact["second_effect"] == report.artifact_second_effect)
					to_chat(user, SPAN_NOTICE("[src] already has data about this artifact report"))
					flick("science3", src)
					return

			scanned_artifacts += list(list(
				"type" = report.artifact_type,
				"first_effect" = report.artifact_first_effect,
				"second_effect" = report.artifact_second_effect,
			))
			scanneddata += 1

	if(istype(O, /obj/item/paper/virus_report))
		var/obj/item/paper/virus_report/report = O
		for(var/symptom in report.symptoms)
			if(!scanned_symptoms[symptom])
				scanneddata += 1
				scanned_symptoms[symptom] = report.symptoms[symptom]

	if(istype(O, /obj/item/slime_extract))
		if(!(O.type in scanned_slimecores))
			scanned_slimecores += O.type
			scanneddata += 1

	if(istype(O, /obj/item/paper/plant_report))
		var/obj/item/paper/plant_report/report = O

		if(!report.scanned_reagents)
			to_chat(user, SPAN_NOTICE("Can only gather research from fully grown fruit."))
			return

		var/datum/seed/P = report.scanned_seed

		if(P.uid in scanned_fruituid)
			to_chat(user, SPAN_NOTICE("[src] already has data about this fruit."))
			return

		scanned_fruituid += P.uid

		if (!(P.seed_name in scanned_fruitnames))
			scanned_fruitnames += P.seed_name
			scanneddata += 1

		for (var/datum/reagent/Q in report.scanned_reagents.reagent_list)
			if (Q.id in scanned_fruitchems)
				continue
			else
				scanned_fruitchems += Q.id
				scanneddata += 1

		if ((P.get_trait(TRAIT_HARVEST_REPEAT)) && !("TRAIT_HARVEST_REPEAT" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_HARVEST_REPEAT"
			scanneddata += 1
		if ((P.get_trait(TRAIT_PRODUCES_POWER)) && !("TRAIT_PRODUCES_POWER" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_PRODUCES_POWER"
			scanneddata += 1
		if ((P.get_trait(TRAIT_JUICY)) && !("TRAIT_JUICY" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_JUICY"
			scanneddata += 1
		if ((P.get_trait(TRAIT_EXPLOSIVE)) && !("TRAIT_EXPLOSIVE" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_EXPLOSIVE"
			scanneddata += 1
		if ((P.get_trait(TRAIT_PARASITE)) && !("TRAIT_PARASITE" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_PARASITE"
			scanneddata += 1
		if ((P.get_trait(TRAIT_STINGS)) && !("TRAIT_STINGS" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_STINGS"
			scanneddata += 1
		if ((P.get_trait(TRAIT_TELEPORTING)) && !("TRAIT_TELEPORTING" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_TELEPORTING"
			scanneddata += 1
		if ((P.get_trait(TRAIT_BIOLUM)) && !("TRAIT_BIOLUM" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_BIOLUM"
			scanneddata += 1
		if ((P.get_trait(TRAIT_CARNIVOROUS)==1) && !("TRAIT_CARNIVOROUS1" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_CARNIVOROUS1"
			scanneddata += 1
		if ((P.get_trait(TRAIT_CARNIVOROUS)==2) && !("TRAIT_CARNIVOROUS2" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_CARNIVOROUS2"
			scanneddata += 1
		if ((P.get_trait(TRAIT_SPREAD)==1) && !("TRAIT_SPREAD1" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_SPREAD1"
			scanneddata += 1
		if ((P.get_trait(TRAIT_SPREAD)==2) && !("TRAIT_SPREAD2" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_SPREAD2"
			scanneddata += 1
		if ((P.get_trait(TRAIT_ALTER_TEMP)<0) && !("TRAIT_ALTER_TEMPDOWN" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_ALTER_TEMPDOWN"
			scanneddata += 1
		if ((P.get_trait(TRAIT_ALTER_TEMP)>0) && !("TRAIT_ALTER_TEMPUP" in scanned_fruittraits))
			scanned_fruittraits += "TRAIT_ALTER_TEMPUP"
			scanneddata += 1

	if(scanneddata > 0)
		datablocks += scanneddata
		to_chat(user, SPAN_NOTICE("[src] received [scanneddata] data block[scanneddata>1?"s":""] from scanning [O]"))
		flick("science2", src)

	else if(istype(O, /obj/item))
		var/science_value = experiments.get_object_research_value(O)
		if(science_value > 0)
			to_chat(user, SPAN_NOTICE("Estimated research value of [O.name] is [science_value]"))
			flick("science2", src)
		else
			to_chat(user, SPAN_NOTICE("[O] has no research value"))
			flick("science3", src)

/obj/item/device/science_tool/proc/clear_data()
	scanned_autopsy_weapons = list()
	scanned_artifacts = list()
	scanned_symptoms = list()
	scanned_slimecores = list()
	scanned_fruitnames = list()
	scanned_fruitchems = list()
	scanned_fruittraits = list()
	datablocks = 0


/obj/item/computer_hardware/hard_drive/portable/research_points
	disk_name = "research data"
	icon_state = "onestar"
	var/min_points = 2000
	var/max_points = 10000

/obj/item/computer_hardware/hard_drive/portable/research_points/install_default_files()
	..()
	var/datum/computer_file/binary/research_points/F = new(size = rand(min_points / 1000, max_points / 1000))
	store_file(F)

/obj/item/computer_hardware/hard_drive/portable/research_points/rare
	min_points = 10000
	max_points = 20000
