/**
 * ## Loot panel
 * A datum that stores info containing the contents of a turf.
 * Handles opening the lootpanel UI and searching the turf for items.
 */
/datum/lootpanel
	/// The owner of the panel
	var/client/owner
	/// The list of all search objects indexed.
	var/list/datum/search_object/contents = list()
	/// We've been notified about client version
	var/notified = FALSE
	/// The turf being searched
	var/turf/source_turf

/datum/lootpanel/New(client/owner)
	. = ..()

	src.owner = owner

/datum/lootpanel/Destroy(force)
	reset_contents()
	owner = null
	source_turf = null

	return ..()
