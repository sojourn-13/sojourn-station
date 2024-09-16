/obj/random/mob/termite_no_despawn
	name = "random termite that dosnt despawn"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/termite_no_despawn/iron = 9,
				/mob/living/carbon/superior_animal/termite_no_despawn/silver = 5,
				/mob/living/carbon/superior_animal/termite_no_despawn/plasma = 2,
				/mob/living/carbon/superior_animal/termite_no_despawn/uranium = 4,
				/mob/living/carbon/superior_animal/termite_no_despawn/diamond = 1,
				/mob/living/carbon/superior_animal/termite_no_despawn/osmium = 0.5)

/obj/random/mob/termite_no_despawn/item_to_spawn()
	return pickweight(mobs)

/obj/random/mob/termite_no_despawn/low_chance
	name = "low chance random roach"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/termite_no_despawn
	name = "cluster of termites that dosnt despawn"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 3
	max_amount = 9
	spread_range = 0

/obj/random/cluster/termite_no_despawn/item_to_spawn()
	return /obj/random/mob/termite_no_despawn

/obj/random/cluster/termite_no_despawn_swarm
	name = "cluster of termites that dosnt despawn"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 12
	max_amount = 15

/obj/random/cluster/termite_no_despawn_swarm/item_to_spawn()
	return /obj/random/mob/termite_no_despawn

/obj/random/cluster/termite_no_despawn_hoard
	name = "cluster of termites that dosnt despawn"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 20
	max_amount = 40

/obj/random/cluster/termite_no_despawn_hoard/item_to_spawn()
	return /obj/random/mob/termite_no_despawn

/obj/random/cluster/termite_no_despawn/low_chance
	name = "low chance cluster of termite that dosnt despawn"
	icon_state = "hostilemob-brown-cluster-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/termite_no_despawn/lower_chance
	name = "lower chance cluster of termite that dosnt despawn"
	icon_state = "hostilemob-brown-cluster-low"
	spawn_nothing_percentage = 80
