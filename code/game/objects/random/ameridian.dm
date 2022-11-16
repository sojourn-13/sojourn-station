/obj/random/structures/ameridian_crystal
	name = "random ameridian crystal"
	icon_state = "hostilemob-purple"
	alpha = 128

/obj/random/structures/ameridian_crystal/item_to_spawn()
	return pickweight(list(/obj/structure/ameridian_crystal = 70,
		/obj/structure/ameridian_crystal/spire/dormit = 5,
		/obj/structure/ameridian_crystal/spire = 3,
		/obj/structure/ameridian_crystal/spire/range_2 = 2,,
		/obj/structure/ameridian_crystal/spire/range_3 = 1,
		))
