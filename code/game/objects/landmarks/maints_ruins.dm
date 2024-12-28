GLOBAL_LIST_EMPTY(chosen_station_templates)

/obj/effect/landmark/stationroom
	var/list/template_names = list()
	/// Whether or not we can choose templates that have already been chosen
	var/unique = FALSE

/obj/effect/landmark/stationroom/New()
	..()
	GLOB.stationroom_landmarks += src

/obj/effect/landmark/stationroom/Destroy()
	if(src in GLOB.stationroom_landmarks)
		GLOB.stationroom_landmarks -= src
	return ..()

/obj/effect/landmark/stationroom/proc/load(template_name)
	var/turf/T = get_turf(src)
	if(!T)
		return FALSE
	if(!template_name)
		for(var/t in template_names)
			if(!SSmapping.station_room_templates[t])
				stack_trace("Station room spawner placed at ([T.x], [T.y], [T.z]) has invalid ruin name of \"[t]\" in its list")
				template_names -= t
		template_name = choose()
	if(!template_name)
		GLOB.stationroom_landmarks -= src
		qdel(src)
		return FALSE
	GLOB.chosen_station_templates += template_name
	var/datum/map_template/template = SSmapping.station_room_templates[template_name]
	if(!template)
		return FALSE
	testing("Ruin \"[template_name]\" placed at ([T.x], [T.y], [T.z])")
	template.load(T, centered = FALSE)
	template.loaded++
	GLOB.stationroom_landmarks -= src
	qdel(src)
	return TRUE

// Proc to allow you to add conditions for choosing templates, instead of just randomly picking from the template list.
// Examples where this would be useful, would be choosing certain templates depending on conditions such as holidays,
// Or co-dependent templates, such as having a template for the core and one for the satelite, and swapping AI and comms.git
/obj/effect/landmark/stationroom/proc/choose()
	if(unique)
		var/list/current_templates = template_names
		for(var/i in GLOB.chosen_station_templates)
			template_names -= i
		if(!template_names.len)
			stack_trace("Station room spawner (type: [type]) has run out of ruins, unique will be ignored")
			template_names = current_templates
	return pickweight(template_names)

/* Examples
/obj/effect/landmark/stationroom/maint/threexthree
	template_names = list("Maint OldStorage", "Maint OldStorage1", "Maint OldStorage2")

(untested example) - this maybe makes them more or less rare
/obj/effect/landmark/stationroom/maint/threexthree
	template_names = list("Common OldStorage" = 12, "Rare OldStorage" = 4, "Super Rare OldStorage" = 2)
*/

/obj/effect/landmark/stationroom/maint/
	unique = TRUE

/obj/effect/landmark/stationroom/maint/threexthree
	template_names = list("Maint MiniHydro" = 5, "Maint Posters" = 5, "Maint Guntinerk" = 5, "Maint Kcoin" = 1, "Maint Meat" = 1, "Maint Barrels" = 1, "Maint Floor Repair Shop" = 1)

/obj/effect/landmark/stationroom/maint/threexfive
	template_names = list()

/obj/effect/landmark/stationroom/maint/fourfour
	template_names = list("Maint MixedStorage" = 5, "Maint Trashdump" = 3, "Maint Mini Bar" = 1, "Maint Guntinker" = 1)

/obj/effect/landmark/stationroom/maint/fivexthree
	template_names = list()

/obj/effect/landmark/stationroom/maint/fivexfour
	template_names = list()

/obj/effect/landmark/stationroom/maint/tenxfive
	template_names = list()

/obj/effect/landmark/stationroom/maint/tenxten
	template_names = list()

//Localted in ruins/hallway.dm
/obj/effect/landmark/stationroom/maint/right_side_vacant_office
	template_names = list()

//Located in ruins/hallway.dm
/obj/effect/landmark/stationroom/maint/left_side_vacant_office
	template_names = list("Vacant Clearedout" = 5, "Vacant Tabled" = 2, "Vacant Framed" = 2, "Vacant Bookcased" = 2, "Vacant Trashed" = 2, "Vacant Housing" = 1)