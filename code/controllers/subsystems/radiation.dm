/* Radiation Subsystem by r4d6#9842
	The radiation subsystem handles objects emitting radiation, and also update any nearby geiger counters.
	It work off the rad_producers list, which is actually a list of list with the following format :
		list("Source" = [Object], "Power" = [Number], "Range" = [TileNumber])
	This subsystem also clean its references, preventing radiation-producing objects from being stuck in limbo forever and without relying on the rad-producing item from cleaning itself
*/

#define AddRadSource(Source, Power, Range) \
	rad_producers += list(list("Source" = (Source), "Power" = (Power), "Range" = (Range))) // We need to do list(list()) because otherwise each element is individually added instead of as a list

#define AddRadDetector(X) \
	rad_detectors += (X)

#define PulseRadiation(Source, Power, Range) \
	produce_radiation((Source), (Power), (Range))

// List of items that produce radiation.
var/list/global/rad_producers = list()
// List of all the geiger counters that exist in the world for easy referencing
var/list/global/rad_detectors = list()

SUBSYSTEM_DEF(radiation)
	name = "Radiation"
	init_order = INIT_ORDER_LATELOAD
	flags = SS_POST_FIRE_TIMING
	wait = 2 SECONDS
	var/list/rad_sources = list()
	var/list/rad_sinks = list()

/datum/controller/subsystem/radiation/Initialize()
	. = ..()
	clear_garbage()

/datum/controller/subsystem/radiation/fire()
	clear_garbage()
	reset_geigers()
	handle_radiation()

// Handle all of the radiation stuff
/datum/controller/subsystem/radiation/proc/handle_radiation()
	for(var/list/L in rad_producers) // Loop through all the items emitting radiation
		// Run through all the mobs in range and irradiate them.
		for(var/mob/living/M in range(L["Range"], L["Source"]))
			M.apply_effect(L["Power"], IRRADIATE)
			M.updatehealth()
			// We run though geiger counters a second time because [range()] doesn't check the contents of mobs.
			for(var/obj/item/device/geiger/G in M.contents)
				G.add_rads(L["Power"])

		// Run through all the geiger counters in range and update their radiation levels
		for(var/obj/item/device/geiger/G in range(L["Range"], L["Source"]))
			G.add_rads(L["Power"])

// Reset all of the geigers counters that ever existed
/datum/controller/subsystem/radiation/proc/reset_geigers()
	for(var/obj/item/device/geiger/G in rad_detectors)
		G.reset_rads() // Clear the rads

// Check both global lists and remove null/qdel items
/datum/controller/subsystem/radiation/proc/clear_garbage()
	for(var/list/L in rad_producers) // Loop through all the items emitting radiation
		if(!L["Source"] || L["Source"]:loc == null) // The source was qdel'ed
			L["Source"] = null // Clear the reference
			rad_producers -= list(L) // Remove the list, we need to do list(L) despite L being a list, because otherwise it wouldn't work.
			continue // Move to the next one

	for(var/obj/item/device/geiger/G in rad_detectors)
		if(G.loc == null) // The geiger counter was qdel'ed
			rad_detectors -= G // Remove the reference
			continue // Move to the next one

	update_internal_list() // Update the internal list

// For testing/tracking purposes, because we can't directly see the global list in-game
/datum/controller/subsystem/radiation/proc/update_internal_list()
	rad_sources = rad_producers
	rad_sinks = rad_detectors

// "Manually" irradiate nearby people.
proc/produce_radiation(var/Source, var/Power, var/Range)
	if(!Source || !Power || !Range)
		return

	for(var/mob/living/M in range(Range, Source))
		if(isInSight(Source, M))
			M.apply_effect(((Power / 10) * ( 1 / (Range**2) )), IRRADIATE) //inverse square lawed, adjust the Power/10 to tweak this value
			M.updatehealth()
		for(var/obj/item/device/geiger/G in M.contents)
			G.add_rads(Power)

	for(var/obj/item/device/geiger/G in range(Range, Source))
		G.add_rads(Power)
