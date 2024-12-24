//YOU MUST UPDATE MAINTS_RUINS.DM! Otherwise, your maps will NOT load! BE SURE you use the NAME variable!
// EXAMPLE:

// NAME = "Maint Oldstorage"

// In the list, you use the name VARIABLE Maint Oldstorage, NOT the datum path name, and NOT its ID.

///Base for all station ruins.
/datum/map_template/ruin/station/maint
	prefix = "maps/MaintsRuins/"

///Base for the 3x3 rooms.
/datum/map_template/ruin/station/maint/threexthree
	prefix = "maps/MaintsRuins/3x3/"

/* Examples / not ported
/datum/map_template/ruin/station/maint/threexthree/oldstorage
	id = "OldStorage"
	suffix = "3x3_OldStorage.dmm"
	name = "Maint OldStorage"
*/

///Base for the 4x4 rooms.
/datum/map_template/ruin/station/maint/fourxfour
	prefix = "maps/MaintsRuins/4x4/"

/datum/map_template/ruin/station/maint/fourxfour/oldstorage
	id = "OldStorage"
	prefix = "maps/MaintsRuins/4x4/"
	suffix = "4x4_mixed_storage.dmm"
	name = "Maint MixedStorage"

/datum/map_template/ruin/station/maint/fourxfour/trashdump
	id = "Trashdump"
	prefix = "maps/MaintsRuins/4x4/"
	suffix = "4x4_trash_dump.dmm"
	name = "Maint Trashdump"

/datum/map_template/ruin/station/maint/fourxfour/mini_bar
	id = "MiniBar"
	prefix = "maps/MaintsRuins/4x4/"
	suffix = "4x4_mini_bar.dmm"
	name = "Maint Mini Bar"

/datum/map_template/ruin/station/maint/fourxfour/guntinker
	id = "Guntinker"
	prefix = "maps/MaintsRuins/4x4/"
	suffix = "4x4_guntinker.dmm"
	name = "Maint Guntinker"