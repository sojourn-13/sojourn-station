/obj/random/material
	name = "random building material"
	icon_state = "material-grey"
	spawn_nothing_percentage = 20

//This stuff can't be easily converted to pickweight because of these amount fields
/obj/random/material/item_to_spawn()
	return pick(/obj/item/stack/material/steel/random,\
				/obj/item/stack/material/glass/random,\
				/obj/item/stack/material/plastic/random,\
				/obj/item/stack/material/wood/random,\
				/obj/item/stack/material/cardboard/random,\
				/obj/item/stack/rods/random,\
				/obj/item/stack/material/plasteel/random)

/obj/random/material/low_chance
	name = "low chance random building material"
	icon_state = "material-grey-low"
	spawn_nothing_percentage = 60

/obj/random/material_resources
	name = "random resource material"
	icon_state = "material-green"
	spawn_nothing_percentage = 20

/obj/random/material_resources/item_to_spawn()
	return pickweight(list(/obj/item/stack/material/steel/random = 5,\
				/obj/item/stack/material/glass/random = 4,\
				/obj/item/stack/material/glass/plasmaglass/random = 3,\
				/obj/item/stack/material/iron/random = 2,\
				/obj/item/stack/material/diamond/random = 0.5,\
				/obj/item/stack/material/plasma/random = 3,\
				/obj/item/stack/material/gold/random = 2,\
				/obj/item/stack/material/uranium/random = 1,\
				/obj/item/stack/material/silver/random = 2))

/obj/random/material_resources/low_chance
	name = "low chance random resource material"
	icon_state = "material-green-low"
	spawn_nothing_percentage = 60

/obj/random/material_rare
	name = "random rare material"
	icon_state = "material-orange"
	spawn_nothing_percentage = 20

/obj/random/material_rare/item_to_spawn()
	return pickweight(list(/obj/item/stack/material/diamond/random = 1,\
				/obj/item/stack/material/gold/random = 2,\
				/obj/item/stack/material/uranium/random = 1,\
				/obj/item/stack/material/silver/random = 2,\
				/obj/item/stack/material/glass/plasmaglass/random = 2))

/obj/random/material_rare/always_spawn
	name = "random always spawn rare material"
	icon_state = "material-orange"
	spawn_nothing_percentage = 0

/obj/random/material_rare/low_chance
	name = "low chance random rare material"
	icon_state = "material-orange-low"
	spawn_nothing_percentage = 60

/obj/random/material_ore
	name = "random ore"
	icon_state = "material-black"
	spawn_nothing_percentage = 20

/obj/random/material_handyman
	spawn_nothing_percentage = 0

/obj/random/material_handyman/item_to_spawn()
	return pickweight(list(/obj/item/stack/material/diamond/random = 1,\
				/obj/item/stack/material/gold/random = 2,\
				/obj/item/stack/material/uranium/random = 1,\
				/obj/item/stack/material/silver/random = 2,\
				/obj/item/stack/material/platinum/random = 2,\
				/obj/item/stack/material/plasteel/random = 2))

/obj/random/material_ore/item_to_spawn()
	return pickweight(list(/obj/item/stack/ore/coal = 4,\
				/obj/item/stack/ore/glass = 5,\
				/obj/item/stack/ore/gold = 3,\
				/obj/item/stack/ore/hydrogen = 0.1,\
				/obj/item/stack/ore/iron = 4,\
				/obj/item/stack/ore/osmium = 1,\
				/obj/item/stack/ore/plasma = 2,\
				/obj/item/stack/ore/silver = 3,\
				/obj/item/stack/ore/uranium = 1,\
				/obj/item/stack/ore/diamond = 0.1))


/obj/random/material_ore/low_chance
	name = "low chance random ore"
	icon_state = "material-black-low"
	spawn_nothing_percentage = 60

/obj/random/material_ore_small
	name = "random small ore"
	icon_state = "material-black"
	spawn_nothing_percentage = 0

/obj/random/material_ore_small/item_to_spawn()
	return pickweight(list(/obj/item/stack/ore/coal/small = 2,\
				/obj/item/stack/ore/glass = 12,\
				/obj/item/stack/ore/gold/small = 2,\
				/obj/item/stack/ore/hydrogen/small = 1,\
				/obj/item/stack/ore/iron/small = 2,\
				/obj/item/stack/ore/osmium/small = 2,\
				/obj/item/stack/ore/plasma/small = 1,\
				/obj/item/stack/ore/silver/small = 2,\
				/obj/item/stack/ore/uranium/small = 1,\
				/obj/item/stack/ore/diamond/small = 1))
