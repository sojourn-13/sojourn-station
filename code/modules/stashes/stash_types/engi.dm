//Engi stashes, mostly tools and mats
//No engi crafted items like - Arc welders, armor mods and their hand-made suits.
/datum/stash/engi
	base_type = /datum/stash/engi
	loot_type = "Engi"

	contents_list_base = list(/obj/random/tool_upgrade = 2,
	/obj/random/pouch = 2,
	/obj/random/tool_upgrade = 3,
	/obj/random/tool_upgrade/rare = 5)

	contents_list_random = list(/obj/random/tool_upgrade/rare= 30,
	/obj/random/tool_upgrade/rare = 30,
	/obj/random/rig/engi = 40,
	/obj/random/tool/advanced = 30,
	/obj/random/tool/advanced = 70,
	/obj/random/material = 50,
	/obj/random/material = 50,
	/obj/random/material = 50,
	/obj/random/material_rare = 50,
	/obj/random/material_rare = 50,
	/obj/item/rcd = 1,
	/obj/item/stack/material/compressed_matter/random = 10,
	/obj/item/stack/material/compressed_matter/random = 5)

/datum/stash/engi/inspection
	contents_list_extra = list(/obj/item/stack/material/steel/full = 2,
	/obj/item/stack/material/glass = 2,
	/obj/item/stack/material/plastic = 2,
	/obj/random/pouch = 1,
	/obj/item/stack/material/plasteel/random = 1,
	)

/datum/stash/engi/illicit_trade
	contents_list_extra = list(/obj/random/rig/engi = 1,
	/obj/random/pouch = 1,
	/obj/item/hatton = 1,
	/obj/item/hatton_magazine = 1,
	)

/datum/stash/engi/blown
	contents_list_extra = list(
	/obj/random/pouch = 1,
	/obj/random/tool_upgrade = 1,
	/obj/random/tool_upgrade/rare = 1,
	/obj/item/stack/material/plasteel/random = 3,
	)

/datum/stash/engi/handoff
	contents_list_extra = list(
	/obj/item/rcd = 1,
	/obj/item/stack/material/compressed_matter/random = 3,
	/obj/item/stack/material/plasteel/random = 1,
	)

/datum/stash/engi/restock
	contents_list_extra = list(/obj/random/material_rare = 6)
