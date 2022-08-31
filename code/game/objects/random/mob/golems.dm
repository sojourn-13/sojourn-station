/obj/random/mob/golem
	name = "random golem"
	icon_state = "hostilemob-brown"
	alpha = 128

/obj/random/mob/golem/item_to_spawn()
	return pickweight(list(/mob/living/carbon/superior_animal/ameridian_golem = 24,
				/mob/living/carbon/superior_animal/ameridian_golem/runtling = 32,
				/mob/living/carbon/superior_animal/ameridian_golem/ameridian_shooter = 16,
				/mob/living/carbon/superior_animal/ameridian_golem/behemoth = 1 //1 in 73 so should be rare...
				))

/obj/random/mob/golem/low_chance
	name = "low chance random golem"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

/obj/random/mob/golem/high_chance
	name = "high chance random golem"
	icon_state = "hostilemob-brown"
	spawn_nothing_percentage = 30

/obj/random/cluster/golem
	name = "cluster of golem (2-3)"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 2
	max_amount = 3
	spread_range = 0

/obj/random/cluster/golem/item_to_spawn()
	return /obj/random/mob/golem

/obj/random/cluster/golem_hoard
	name = "hoard of golem (4-5)"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	//This is still a lot
	min_amount = 4
	max_amount = 5
	spread_range = 0

/obj/random/cluster/golem_hoard/item_to_spawn()
	return /obj/random/mob/golem

/obj/random/cluster/golem/low_chance
	name = "low chance cluster of golem"
	icon_state = "hostilemob-brown-cluster-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/golem/lower_chance
	name = "lower chance cluster of golem"
	icon_state = "hostilemob-brown-cluster-low"
	spawn_nothing_percentage = 80
