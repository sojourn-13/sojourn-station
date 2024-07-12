/**
 * ## Search Object
 * An object for content lists. Compacted item data.
 */
/datum/search_object
	/// Item we're indexing
	var/atom/item
	/// Url to the image of the object
	var/icon
	/// Name of the original object
	var/name
	/// Typepath of the original object for ui grouping
	var/path

/datum/search_object/New(client/owner, atom/item)
	. = ..()

	src.item = item
	name = item.name
	if(isobj(item))
		path = item.type

	if(isturf(item))
		RegisterSignal(item, COMSIG_TURF_CHANGE, PROC_REF(on_turf_change))
	else
		// Lest we find ourselves here again, this is intentionally stupid.
		// It tracks items going out and user actions, otherwise they can refresh the lootpanel.
		// If this is to be made to track everything, we'll need to make a new signal to specifically create/delete a search object
		RegisterSignal(item, list(
			COMSIG_ITEM_PICKED,
			COMSIG_MOVABLE_MOVED,
			COMSIG_QDELETING_NEW,
			), PROC_REF(on_item_moved))

	// Condition 4: Using older byond version
	var/build = owner.byond_build
	var/version = owner.byond_version
	if(build < 515 || (build == 515 && version < 1590))
		icon = "n/a"
		return

	icon = "\ref[item.appearance]"

/datum/search_object/Destroy(force)
	item = null
	return ..()

/// Parent item has been altered, search object no longer valid
/datum/search_object/proc/on_item_moved(atom/source)
	SIGNAL_HANDLER
	qdel(src)

/// Parent tile has been altered, entire search needs reset
// Uses post_change_callbacks so that we aren't recreated before the turf has finished changing
/datum/search_object/proc/on_turf_change(turf/source, path, flags, list/post_change_callbacks)
	SIGNAL_HANDLER
	post_change_callbacks += CALLBACK(src, GLOBAL_PROC_REF(qdel), src)
