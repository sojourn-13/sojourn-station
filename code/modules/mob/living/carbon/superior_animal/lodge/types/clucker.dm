var/const/MAX_CLUCKERS = 10
var/global/clucker_count = 0

//clucker
//Basically a mutant chicken that produces feathers, meat, and a single bit of bones if butchered by a hunter. Credit to scar#1579 for the sprite.
/mob/living/carbon/superior_animal/lodge/clucker
	name = "\improper clucker"
	desc = "A clucker, the affectionately nick named chickens that escaped the colony and somehow survived in the wild before mutating. While mostly without feathers, a single blood engorged one \
	hangs from the birds tail that produces a decent painkiller if treated properly. Prefers to eat poppies over the usual wheat regular chickens favor."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "clucker"
	speak_emote = list("cluck!","BWAAAAARK BWAK BWAK BWAK!","bwaak bwak.")
	emote_see = list("pecks at the ground","flaps its wings viciously")
	speak_chance = 2
	turns_per_move = 3
	meat_type = /obj/item/reagent_containers/food/snacks/chickenbreast //So hunters can eat mor chikin
	meat_amount = 4
	health = 10
	var/eggsleft = 0
	pass_flags = PASSTABLE
	mob_size = MOB_SMALL
	leather_amount = 0 //The amount of leather sheets dropped.
	bones_amount = 4 //The amount of bone sheets dropped.
	has_special_parts = TRUE //var for checking during the butcher process.
	special_parts = list(/obj/item/animal_part/clucker_feather)
	colony_friend = TRUE

/mob/living/carbon/superior_animal/lodge/clucker/New()
	..()
	pixel_x = rand(-6, 6)
	pixel_y = rand(0, 10)
	clucker_count += 1

/mob/living/carbon/superior_animal/lodge/clucker/death()
	..()
	clucker_count -= 1

/mob/living/carbon/superior_animal/lodge/clucker/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/reagent_containers/food/snacks/grown)) //feedin' dem chickens
		var/obj/item/reagent_containers/food/snacks/grown/G = O
		if(G.seed && G.seed.kitchen_tag == "poppy")
			if(!stat && eggsleft < 8)
				user.visible_message("\blue [user] feeds [O] to [name]! It clucks happily.","\blue You feed [O] to [name]! It clucks happily.")
				user.drop_item()
				qdel(O)
				eggsleft += rand(1, 4)
			else
				to_chat(user, "\blue [name] doesn't seem hungry!")
		else
			to_chat(user, "[name] doesn't seem interested in that.")
	else
		..()

/mob/living/carbon/superior_animal/lodge/clucker/Life()
	. =..()
	if(!.)
		return
	if(!stat && prob(3) && eggsleft > 0)
		visible_message("[src] [pick("lays an egg.","squats down and croons.","begins making a huge racket.","begins clucking raucously.")]")
		eggsleft--
		var/obj/item/reagent_containers/food/snacks/egg/clucker/E = new(get_turf(src))
		E.pixel_x = rand(-6,6)
		E.pixel_y = rand(-6,6)
		if(clucker_count < MAX_CLUCKERS && prob(34)) //Statistically, one out of four eggs will be capable of hatching //A little over one in three, so as not to cuck the Lodge, but not make them OP either
			START_PROCESSING(SSobj, E)


/obj/item/reagent_containers/food/snacks/egg/clucker/amount_grown = 0
/obj/item/reagent_containers/food/snacks/egg/clucker/Process()
	if(isturf(loc))
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			visible_message("[src] hatches with a quiet cracking sound.")
			new /mob/living/carbon/superior_animal/lodge/chick_clucker(get_turf(src))
			STOP_PROCESSING(SSobj, src)
			qdel(src)
	else
		STOP_PROCESSING(SSobj, src)

//Baby Clucker
//Looks nearly the same as a regular chick. Credit to scar#1579 for the sprite.
/mob/living/carbon/superior_animal/lodge/chick_clucker
	name = "\improper clucker chick"
	desc = "Adorable! They make such a racket though."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "chick_clucker"
	speak_emote = list("cheeps")
	emote_see = list("pecks at the ground.","flaps its tiny wings.","cheeps.")
	speak_chance = 2
	turns_per_move = 2
	meat_amount = 1
	health = 1
	var/amount_grown = 0
	pass_flags = PASSTABLE
	mob_size = MOB_MINISCULE

/mob/living/carbon/superior_animal/lodge/chick_clucker/New()
	..()
	pixel_x = rand(-6, 6)
	pixel_y = rand(0, 10)

/mob/living/carbon/superior_animal/lodge/chick_clucker/Life()
	. =..()
	if(!.)
		return
	if(!stat)
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			new /mob/living/carbon/superior_animal/lodge/clucker(src.loc)
			qdel(src)