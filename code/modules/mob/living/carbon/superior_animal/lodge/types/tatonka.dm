//tatonka
//Two headed cow that produces milk+ Credit to scar#1579 for the sprite.
/mob/living/carbon/superior_animal/lodge/tatonka
	name = "tatonka"
	desc = "When cows brought by the colony escape into the wilds they tend to mutate rapidly, the most stable strain growing a second head and losing much of its coloration. Useful for the \
	absurdly regenerative vitality contained in its body, if you know how to utilize it. Despite its dimorphic ancestry tatonkas are capable of asexual reproduction when fed on a proper diet, \
	usually with raw wheat."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "brahmin"
	speak_emote = list("moos","moos hauntingly")
	emote_see = list("shakes its heads.","snuffles.","clacks its horns together.")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_amount = 6
	health = 100
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
	randpixel = 0
	leather_amount = 6 //The amount of leather sheets dropped.
	bones_amount = 8 //The amount of bone sheets dropped.
	has_special_parts = TRUE //var for checking during the butcher process.
	special_parts = list(/obj/item/animal_part/tatonka_tongue,
		/obj/item/animal_part/tatonka_tongue,
		/obj/item/animal_part/tatonka_horn,
		/obj/item/animal_part/tatonka_horn,
		/obj/item/animal_part/tatonka_horn,
		/obj/item/animal_part/tatonka_horn) //Any special body parts.
	var/datum/reagents/udder = null
	var/offspring_left = 0
	var/milk_type = "tatonka_milk"

/mob/living/carbon/superior_animal/lodge/tatonka/New()
	udder = new(50)
	udder.my_atom = src
	..()

/mob/living/carbon/superior_animal/lodge/tatonka/attackby(var/obj/item/O as obj, var/mob/user as mob)
	var/obj/item/reagent_containers/G = O
	if(stat == CONSCIOUS && istype(G) && G.is_refillable())
		user.visible_message(SPAN_NOTICE("[user] milks [src] using \the [O]."))
		var/transfered = udder.trans_to(G, rand(5,10))
		if(G.reagents.total_volume >= G.volume)
			to_chat(user, "\red The [O] is full.")
		if(!transfered)
			to_chat(user, "\red The udder is dry. Wait a bit longer...")
	else
		..()

/mob/living/carbon/superior_animal/lodge/tatonka/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/reagent_containers/food/snacks/grown)) //feedin' dem chickens
		var/obj/item/reagent_containers/food/snacks/grown/G = O
		if(G.seed && G.seed.kitchen_tag == "wheat")
			if(!stat && offspring_left < 1)
				user.visible_message("\blue [user] feeds [O] to [name]! It moos happily.","\blue You feed [O] to [name]! It moos happily.")
				user.drop_item()
				qdel(O)
				offspring_left += 1
			else
				to_chat(user, "\blue [name] doesn't seem hungry!")
		else
			to_chat(user, "[name] doesn't seem interested in that.")
	else
		..()

/mob/living/carbon/superior_animal/lodge/tatonka/attack_hand(mob/living/carbon/M as mob)
	if(!stat && M.a_intent == I_DISARM && icon_state != icon_dead)
		M.visible_message(SPAN_WARNING("[M] tips over [src]."),SPAN_NOTICE("You tip over [src]."))
		Weaken(30)
		icon_state = icon_dead
		spawn(rand(20,50))
			if(!stat && M)
				icon_state = icon_living
				var/list/responses = list(	"[src] looks at you imploringly.",
											"[src] looks at you pleadingly",
											"[src] looks at you with a resigned expression.",
											"[src] seems resigned to its fate.")
				to_chat(M, pick(responses))
	else
		..()

/mob/living/carbon/superior_animal/lodge/tatonka/Life()
	. = ..()
	if(!.)
		return
	if(stat == CONSCIOUS)
		if(udder && prob(5))
			var/amount_add = rand(5, 10)
			if(unnatural_mutations.getMutation("MUTATION_ROBUST_MILK", TRUE))
				amount_add = 20

			if(unnatural_mutations.getMutation("MUTATION_CHOC_MILK", TRUE))
				udder.add_reagent("chocolatemilk", amount_add)
			else if(unnatural_mutations.getMutation("MUTATION_PROT_MILK", TRUE))
				udder.add_reagent("protein", amount_add)
			else
				udder.add_reagent(milk_type, amount_add)
	if(!stat && prob(3) && offspring_left > 0)
		visible_message("[src] [pick("squats down and moos.","begins making a huge racket.","begins mooing raucously.")]")
		offspring_left--
		var/mob/living/carbon/superior_animal/lodge/baby_tatonka/E = new(get_turf(src))
		START_PROCESSING(SSmobs, E)
	default_pixel_x = -16
	pixel_x = -16

//Baby Tatonka
//Grows into a tatonka or a tangu. Credit to scar#1579 for the sprite.
/mob/living/carbon/superior_animal/lodge/baby_tatonka
	name = "\improper tatonka calf"
	desc = "Adorable! Four sets of big brown eyes and cute little horns."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "brahmin"
	speak_emote = list("moos","moos hauntingly")
	emote_see = list("shakes its heads.","snuffles.","clacks its horns together.")
	speak_chance = 2
	turns_per_move = 2
	meat_amount = 1
	health = 10
	var/amount_grown = 0
	mob_size = MOB_SMALL
	default_pixel_x = -16
	pixel_x = -16
	randpixel = 0

/mob/living/carbon/superior_animal/lodge/baby_tatonka/Initialize(mapload)
	pixel_x = -16
	. = ..()

/mob/living/carbon/superior_animal/lodge/baby_tatonka/add_initial_transforms()
	. = ..()

	add_new_transformation(/datum/transform_type/modular, list(0.5, 0.5, flag = BABY_TANTONKA_INITIAL_SCALE_TRANSFORM, priority = BABY_TANTONKA_INITIAL_SCALE_TRANSFORM_PRIORITY))

/mob/living/carbon/superior_animal/lodge/baby_tatonka/Life()
	. =..()
	if(!.)
		return
	if(!stat)
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			if(prob(10))
				new /mob/living/carbon/superior_animal/lodge/tatonka/tangu(src.loc)
			else
				new /mob/living/carbon/superior_animal/lodge/tatonka(src.loc)
			qdel(src)
	default_pixel_x = -16
	pixel_x = -16

//Tangu, the improved version of tatonka and thus rarer to produce. Credit to scar#1579 for the sprite.
/mob/living/carbon/superior_animal/lodge/tatonka/tangu
	name = "tangu"
	desc = "Tangu are a mutant strand of tatonka who have grown larger with thick shaggy coats. While rarer than tatonka they are highly prized for their more robust milk and for their horns, \
	which can be ground into powder and mixed with bone marrow to create powerful universal healing medicine."
	icon_state = "brahmiluff"
	health = 150
	leather_amount = 10
	bones_amount = 12
	has_special_parts = TRUE
	milk_type = "tangu_milk"
	special_parts = list(/obj/item/animal_part/tatonka_tongue,
		/obj/item/animal_part/tatonka_tongue,
		/obj/item/animal_part/tangu_horn,
		/obj/item/animal_part/tangu_horn,
		/obj/item/animal_part/tangu_horn,
		/obj/item/animal_part/tangu_horn)
