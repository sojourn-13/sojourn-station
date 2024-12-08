/datum/map_template/ruin
	name = null
	var/description = "Unset Desc"

	var/unpickable = FALSE 	 //If TRUE these won't be placed automatically (can still be forced or loaded with another ruin)
	var/always_place = FALSE //Will skip the whole weighting process and just plop this down, ideally you want the ruins of this kind to have no cost.
	var/placement_weight = 1 //How often should this ruin appear
	var/list/always_spawn_with = null //These ruin types will be spawned along with it (where dependent on the flag) eg list(/datum/map_template/ruin/space/teleporter_space = SPACERUIN_Z)
	var/list/never_spawn_with = null //If this ruin is spawned these will not eg list(/datum/map_template/ruin/base_alternate)

	var/prefix = null
	var/suffix = null

/datum/map_template/ruin/New()
	if(!name && id)
		name = id

	mappath = prefix + suffix
	..(path = mappath)