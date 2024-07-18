/datum/unit_test/loadout_has_cost_and_name/Run()
	for(var/geartype in subtypesof(/datum/gear))
		var/datum/gear/G = geartype
		Check(G)

// because test assert returns, and we dont want that.
/datum/unit_test/loadout_has_cost_and_name/proc/Check(datum/gear/G)
	if(G == /datum/gear/gloves)
		return
	if(initial(G.category) == G)
		return
	TEST_ASSERT(initial(G.display_name), "Loadout ([G]) has no display name.")
	//TEST_ASSERT(initial(G.cost), "Loadout ([G]) has no cost.")	//SoJ edits, we dont always want a cost
	TEST_ASSERT(initial(G.path), "Loadout ([G]) has no path definition.")
