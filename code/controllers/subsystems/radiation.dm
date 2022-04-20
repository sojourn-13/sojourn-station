/* Radiation Subsystem by r4d6#9842
	The radiation subsystem handles objects emitting radiation, and also update any nearby geiger counters.
	It work off the rad_producers list, which is actually a list of list with the following format :
		list("Source" = [Object], "Power" = [Number], "Range" = [TileNumber])
	This subsystem also clean its references, preventing radiation-producing objects from being stuck in limbo forever and without relying on the rad-producing item from cleaning itself
*/

#define AddRadSource(Source, Power, Range) \
	rad_producers += list("Source" = (Source), "Power" = (Power), "Range" = (Range))

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

/datum/controller/subsystem/radiation/fire()
	update_internal_list()
	reset_geigers()
	handle_radiation()

// Handle all of the radiation stuff
/datum/controller/subsystem/radiation/proc/handle_radiation()
	for(var/list/L in rad_producers) // Loop through all the items emitting radiation
		if(L["Source"].loc == null) // The source was qdel'ed
			L["Source"] = null // Clear the reference
			rad_producers -= L // Remove the list
			continue // Move to the next one

		// Run through all the mobs in range and irradiate them.
		for(var/mob/living/M in range(L["Range"], L["Source"]))
			M.apply_effect(L["Power"], IRRADIATE)
			M.updatehealth()

		// Run through all the geiger counters in range and update their radiation levels
		for(var/obj/item/device/geiger/G in range(L["Range"], L["Source"]))
			G.add_rads(L["Power"])

// "Manually" irradiate nearby people. S is the source, P is the amount of rads, and R is the range
proc/produce_radiation(var/S, var/P, var/R)
	if(!S || !P || !R)
		return

	for(var/mob/living/M in range(R, S))
		M.apply_effect(P, IRRADIATE)
		M.updatehealth()

	for(var/obj/item/device/geiger/G in range(R, S))
		G.add_rads(P)

// Reset all of the geigers counters that ever existed
/datum/controller/subsystem/radiation/proc/reset_geigers()
	for(var/obj/item/device/geiger/G in rad_detectors)
		if(G.loc == null) // The geiger counter was qdel'ed
			rad_detectors -= G // Remove the reference
			continue // Move to the next one

		G.reset_rads() // Clear the rads

// For testing/tracking purposes.
/datum/controller/subsystem/radiation/proc/update_internal_list()
	rad_sources = rad_producers
	rad_sinks = rad_detectors
