var/list/obj/effect/bump_teleporter/BUMP_TELEPORTERS = list()

/obj/effect/bump_teleporter
	name = "bump-teleporter"
	icon_state = "config--blue"
	var/id = null			//id of this bump_teleporter.
	var/id_target = null	//id of bump_teleporter which this moves you to.
	invisibility = 101 		//nope, can't see this
	anchored = 1
	density = 1
	opacity = 0

/obj/effect/bump_teleporter/New()
	..()
	BUMP_TELEPORTERS += src

/obj/effect/bump_teleporter/Destroy()
	BUMP_TELEPORTERS -= src
	return ..()

/obj/effect/bump_teleporter/Bumped(atom/user)
	if(!ismob(user))
		//user.loc = src.loc	//Stop at teleporter location
		return

	if(!id_target)
		//user.loc = src.loc	//Stop at teleporter location, there is nowhere to teleport to.
		return

	for(var/obj/effect/bump_teleporter/BT in BUMP_TELEPORTERS)
		if(BT.id == src.id_target)
			usr.loc = BT.loc	//Teleport to location with correct id.
			return

/obj/effect/bump_teleporter/AFentrance
	id = "abentrance"
	id_target = "abexit"

/obj/effect/bump_teleporter/AFexit
	id = "abexit"
	id_target = "abentrance"

//Map teleporters, don't fuck with'em. These are basically dynamic versions of the bump teleporters for map functions so the coordinates are not hard coded. -Kaz
//You should always make news ones of these when connecting maps in normal ways such as through stairs or cave entrances, its safer than hard coded map stuff.

//Underground to stairs.
/obj/effect/bump_teleporter/underground_to_transition_1_A
	id = "underground_to_transition_1_A"
	id_target = "underground_to_transition_2_A"

/obj/effect/bump_teleporter/underground_to_transition_2_A
	id = "underground_to_transition_2_A"
	id_target = "underground_to_transition_1_A"

/obj/effect/bump_teleporter/underground_to_transition_1_B
	id = "underground_to_transition_1_B"
	id_target = "underground_to_transition_2_B"

/obj/effect/bump_teleporter/underground_to_transition_2_B
	id = "underground_to_transition_2_B"
	id_target = "underground_to_transition_1_B"

//Surface to stairs.
/obj/effect/bump_teleporter/surface_to_transition_1_A
	id = "surface_to_transition_1_A"
	id_target = "surface_to_transition_2_A"

/obj/effect/bump_teleporter/surface_to_transition_2_A
	id = "surface_to_transition_2_A"
	id_target = "surface_to_transition_1_A"

/obj/effect/bump_teleporter/surface_to_transition_1_B
	id = "surface_to_transition_1_B"
	id_target = "surface_to_transition_2_B"

/obj/effect/bump_teleporter/surface_to_transition_2_B
	id = "surface_to_transition_2_B"
	id_target = "surface_to_transition_1_B"

//Surface to forest
/obj/effect/bump_teleporter/surface_to_forest_1_A
	id = "surface_to_forest_1_A"
	id_target = "surface_to_forest_2_A"

/obj/effect/bump_teleporter/surface_to_forest_2_A
	id = "surface_to_forest_2_A"
	id_target = "surface_to_forest_1_A"

/obj/effect/bump_teleporter/surface_to_forest_1_B
	id = "surface_to_forest_1_B"
	id_target = "surface_to_forest_2_B"

/obj/effect/bump_teleporter/surface_to_forest_2_B
	id = "surface_to_forest_2_B"
	id_target = "surface_to_forest_1_B"