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

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/threexthree/minihydro
	id = "MiniHydro"
	suffix = "3x3_minihydro.dmm"
	name = "Maint MiniHydro"

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/threexthree/posters
	id = "Posters"
	suffix = "3x3_posters.dmm"
	name = "Maint Posters"

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/threexthree/guntinerk
	id = "Guntinerk"
	suffix = "3x3_guntinerk.dmm"
	name = "Maint Guntinerk"

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/threexthree/kcoin
	id = "Kcoin"
	suffix = "3x3_kcoin.dmm"
	name = "Maint Kcoin"

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/threexthree/meat
	id = "Meat"
	suffix = "3x3_meat.dmm"
	name = "Maint Meat"

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/threexthree/barrels
	id = "Barrels"
	suffix = "3x3_barrels.dmm"
	name = "Maint Barrels"

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/threexthree/floor_repair_shop
	id = "Floor Repair Shop"
	suffix = "3x3_floor_repair_shop.dmm"
	name = "Maint Floor Repair Shop"

/* Examples / not ported
/datum/map_template/ruin/station/maint/threexthree/oldstorage
	id = "OldStorage"
	suffix = "3x3_OldStorage.dmm"
	name = "Maint OldStorage"
*/

///Base for the 4x4 rooms.
/datum/map_template/ruin/station/maint/fourxfour
	prefix = "maps/MaintsRuins/4x4/"

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/fourxfour/oldstorage
	id = "OldStorage"
	suffix = "4x4_mixed_storage.dmm"
	name = "Maint MixedStorage"

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/fourxfour/trashdump
	id = "Trashdump"
	suffix = "4x4_trash_dump.dmm"
	name = "Maint Trashdump"

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/fourxfour/mini_bar
	id = "MiniBar"
	suffix = "4x4_mini_bar.dmm"
	name = "Maint Mini Bar"

//Made assuming door is on the west
/datum/map_template/ruin/station/maint/fourxfour/guntinker
	id = "Guntinker"
	suffix = "4x4_guntinker.dmm"
	name = "Maint Guntinker"