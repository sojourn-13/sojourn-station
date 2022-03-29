/obj/random/flora
	name = "random flora"
	icon_state = "nature-purple"
	alpha = 128

//More will be added later, for now just shrooms
/obj/random/flora/item_to_spawn()
	return /obj/effect/spawner/maintshroom/delayed

/obj/random/flora/low_chance
	name = "low chance random flora"
	icon_state = "nature-purple-low"
	spawn_nothing_percentage = 83

/obj/random/flora/blocker
	name = "random fallen tree (50%)"
	spawn_nothing_percentage = 50

/obj/random/flora/blocker/high
	name = "random fallen tree (75%)"
	spawn_nothing_percentage = 25

/obj/random/flora/blocker/low
	name = "random fallen tree (25%)"
	spawn_nothing_percentage = 75

/obj/random/flora/blocker/reallylow
	name = "random fallen tree (5%)"
	spawn_nothing_percentage = 95

/obj/random/flora/blocker/reallyreallylow
	name = "random fallen tree (1%)"
	spawn_nothing_percentage = 99

/obj/random/flora/blocker/item_to_spawn()
	return /obj/structure/flora/tree/jungle/baracade

/obj/random/flora/small_jungle_tree
	name = "random small jungle tree (100%)"
	spawn_nothing_percentage = 0

/obj/random/flora/small_jungle_tree/low
	name = "random small jungle tree (90%)"
	spawn_nothing_percentage = 10

/obj/random/flora/small_jungle_tree/item_to_spawn()
	return pick(/obj/structure/flora/tree/jungle_small,\
				/obj/structure/flora/tree/jungle_small/variant1,\
				/obj/structure/flora/tree/jungle_small/variant2,\
				/obj/structure/flora/tree/jungle_small/variant3,\
				/obj/structure/flora/tree/jungle_small/variant4,\
				/obj/structure/flora/tree/jungle_small/variant5)

/obj/random/flora/jungle_tree
	name = "random jungle tree (100%)"
	spawn_nothing_percentage = 0

/obj/random/flora/jungle_tree/low
	name = "random jungle tree (90%)"
	spawn_nothing_percentage = 10

/obj/random/flora/jungle_tree/item_to_spawn()
	return pick(/obj/structure/flora/tree/jungle,\
				/obj/structure/flora/tree/jungle/variant1,\
				/obj/structure/flora/tree/jungle/variant2,\
				/obj/structure/flora/tree/jungle/variant3,\
				/obj/structure/flora/tree/jungle/variant4,\
				/obj/structure/flora/tree/jungle/variant5)


