/***************************************************************
**						Design Datums						  **
**	All the data for building stuff and tracking reliability. **
***************************************************************/
/*
For the materials datum, it assumes you need reagents unless specified otherwise. To designate a material that isn't a reagent,
you use one of the material IDs below. These are NOT ids in the usual sense (they aren't defined in the object or part of a datum),
they are simply references used as part of a "has materials?" type proc. They all start with a to denote that they aren't reagents.
The currently supporting non-reagent materials:

Don't add new keyword/IDs if they are made from an existing one (such as rods which are made from metal). Only add raw materials.

Design Guidlines
- When adding new designs, check rdreadme.dm to see what kind of things have already been made and where new stuff is needed.

- A single sheet of anything is 1 unit of material. Materials besides metal/glass require help from other jobs (mining for
other types of metals and chemistry for reagents).

- When making something have a cost, it !adds! onto the materials it needs to print
(But when resycaled in an autolathen you do not get them back)

*/


/datum/design/research     //Datum for object designs, used in construction
	starts_unlocked = FALSE

/datum/design/research/item
	build_type = AUTOLATHE | PROTOLATHE
	category = "Misc" //No more unsorted things

/datum/design/research/item/mechfab
	build_type = MECHFAB

	required_printer_code = TRUE
	code_dex = "MECHFAB"

/datum/design/research/item/clothing
	category = CAT_CLOTHING

/datum/design/research/item/tool
	category = CAT_TOOLS

/datum/design/research/item/part
	build_type = AUTOLATHE | PROTOLATHE
	category = CAT_STOCKPARTS

/datum/design/research/item/part/AssembleDesignDesc()
	if(!desc)
		desc = "A stock part used in the construction of various devices."
