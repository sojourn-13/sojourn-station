//Cerberus, a domesticated hell diver that can be bred for hunting. Credit to BigBimmer#2319 for the sprite.
/mob/living/carbon/superior_animal/lodge/cerberus
	name = "cerberus"
	desc = "A domesticated hell diver kept fat, happy, and loyal by the local hunting lodge that breed them as hunting allies and guard animals. Favored especially for their asexual \
	reproduction after being fed various mushrooms, a fact that baffles some soteria scientists. Unlike a standard hell diver the cerberus isn't as \
	obsessed with food but gladly lets itself get pulled along. Special training allows for them to follow anyone who states 'Cerberus Follow', while 'Cerberus Stop' will make them halt."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "pigrat"
	icon_living = "pigrat"
	icon_dead = "pigrat_dead"
	meat_type = /obj/item/reagent_containers/food/snacks/meat/pork
	meat_amount = 3
	leather_amount = 4 //The amount of leather sheets dropped.
	bones_amount = 4 //The amount of bone sheets dropped.
	has_special_parts = TRUE //var for checking during the butcher process.
	special_parts = list(/obj/item/animal_part/cerberus_snout)
	var/offspring_left = 0
	colony_friend = TRUE
	friendly_to_colony = TRUE
	randpixel = 0

/mob/living/carbon/superior_animal/lodge/cerberus/Life()
	. = ..()
	if(!.)
		return
	if(!stat && prob(3) && offspring_left > 0)
		visible_message("[src] [pick("squats down and grunts.","begins making a huge racket.","begins snuffling raucously.")]")
		offspring_left--
		var/mob/living/carbon/superior_animal/lodge/baby_cerberus/E = new(get_turf(src))
		START_PROCESSING(SSmobs, E)

/mob/living/carbon/superior_animal/lodge/cerberus/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/reagent_containers/food/snacks/grown)) //feedin' dem chickens
		var/obj/item/reagent_containers/food/snacks/grown/G = O
		if(G.seed && G.seed.kitchen_tag == "mushroom")
			if(!stat && offspring_left < 1)
				user.visible_message("\blue [user] feeds [O] to [name]! It moos happily.","\blue You feed [O] to [name]! It snuffles happily.")
				user.drop_item()
				qdel(O)
				offspring_left += 1
			else
				to_chat(user, "\blue [name] doesn't seem hungry!")
		else
			to_chat(user, "[name] doesn't seem interested in that.")
	else
		..()

//Chimera, a rare spawn beast of a cerberus. Credit to scar#1579 for the sprite.
/mob/living/carbon/superior_animal/lodge/cerberus/chimera
	name = "chimera"
	desc = "A mutated strain of a domesticated cerberus, rarely appearing and much sleeker than their lesser cousins. Chimera are faster, better armored, and much more lethal than a cerberus \
	thanks to its maw containing a huge singular fang, making them prized companions by all hunters. Special training allows for them to follow anyone who states 'Chimera Follow', while 'Chimera Stop' will make them halt."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "nightstalker"
	icon_living = "nightstalker"
	icon_dead = "nightstalker_dead"
	attack_sound = 'sound/xenomorph/alien_bite2.ogg'
	move_to_delay = 3
	maxHealth = 300
	health = 300
	melee_damage_lower = 30
	melee_damage_upper = 35
	leather_amount = 6 //The amount of leather sheets dropped.
	bones_amount = 6 //The amount of bone sheets dropped.
	has_special_parts = TRUE //var for checking during the butcher process.
	special_parts = list(/obj/item/animal_part/chimera_fang)
	default_pixel_x = -16
	pixel_x = -16
	randpixel = 0

/mob/living/carbon/superior_animal/lodge/cerberus/chimera/Life()
	. =..()
	default_pixel_x = -16
	pixel_x = -16

/mob/living/carbon/superior_animal/lodge/cerberus/chimera/moon
	name = "Luna"
	desc = "A special chimera that evolved even further, Luna is one of two twins that act as companions to the Lodge Master and the Matriach."
	gender = "female" // Luna's a girl

	// Faster than her brother, but less durable.
	move_to_delay = 2
	maxHealth = 400
	health = 400
	melee_damage_lower = 40
	melee_damage_upper = 45
	armor = list(melee = 7, bullet = 7, energy = 5, bomb = 5, bio = 10, rad = 25)

/mob/living/carbon/superior_animal/lodge/cerberus/chimera/sun
	name = "Solis"
	desc = "A special chimera that evolved even further, Solis is one of two twins that act as companions to the Lodge Master and the Matriach."
	gender = "male" // Solis' a guy.

	// More tanky than his sister, but slightly slower
	maxHealth = 500
	health = 500
	melee_damage_lower = 50
	melee_damage_upper = 55
	armor = list(melee = 10, bullet = 10, energy = 7, bomb = 10, bio = 15, rad = 25)

//Baby cerberus
//Grows into a cerberus or chimera. Credit to BigBimmer#2319 for the sprite.
/mob/living/carbon/superior_animal/lodge/baby_cerberus
	name = "\improper cerberus gruntling"
	desc = "Adorable! A chubby little pig rat thing, largely defenseless until it finally grows up."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "pigrat"
	icon_living = "pigrat"
	icon_dead = "pigrat_dead"
	speak_chance = 5
	speak_emote = list("chitters!","chitter")
	emote_see = list("scratches at the ground.","gives a small snuffle.","hops back and forth.")
	turns_per_move = 2
	meat_type = /obj/item/reagent_containers/food/snacks/meat/pork
	meat_amount = 1
	health = 30
	var/amount_grown = 0
	mob_size = MOB_SMALL
	colony_friend = TRUE
	friendly_to_colony = TRUE
	randpixel = 0

/mob/living/carbon/superior_animal/lodge/baby_cerberus/add_initial_transforms()
	. = ..()

	add_new_transformation(/datum/transform_type/modular, list(0.5, 0.5, flag = BABY_CERBERUS_INITIAL_SCALE_TRANSFORM, priority = BABY_CERBERUS_INITIAL_SCALE_TRANSFORM_PRIORITY))

/mob/living/carbon/superior_animal/lodge/baby_cerberus/Life()
	. =..()
	if(!.)
		return
	if(!stat)
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			if(prob(10))
				new /mob/living/carbon/superior_animal/lodge/cerberus/chimera(src.loc)
			else
				new /mob/living/carbon/superior_animal/lodge/cerberus(src.loc)
			qdel(src)
