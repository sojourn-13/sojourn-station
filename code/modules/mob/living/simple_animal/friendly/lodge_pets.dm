//tatonka
//Two headed cow that produces milk+
/mob/living/simple_animal/tatonka
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
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	meat_amount = 6
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	health = 100
	autoseek_food = 0
	beg_for_food = 0
	old_x = -16
	old_y = 0
	default_pixel_x = -16
	pixel_x = -16
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
	colony_friend = TRUE

/mob/living/simple_animal/tatonka/New()
	udder = new(50)
	udder.my_atom = src
	..()

/mob/living/simple_animal/tatonka/attackby(var/obj/item/O as obj, var/mob/user as mob)
	var/obj/item/weapon/reagent_containers/G = O
	if(stat == CONSCIOUS && istype(G) && G.is_refillable())
		user.visible_message(SPAN_NOTICE("[user] milks [src] using \the [O]."))
		var/transfered = udder.trans_id_to(G, milk_type, rand(5,10))
		if(G.reagents.total_volume >= G.volume)
			to_chat(user, "\red The [O] is full.")
		if(!transfered)
			to_chat(user, "\red The udder is dry. Wait a bit longer...")
	else
		..()

/mob/living/simple_animal/tatonka/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/weapon/reagent_containers/food/snacks/grown)) //feedin' dem chickens
		var/obj/item/weapon/reagent_containers/food/snacks/grown/G = O
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

/mob/living/simple_animal/tatonka/attack_hand(mob/living/carbon/M as mob)
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

/mob/living/simple_animal/tatonka/Life()
	. = ..()
	if(!.)
		return
	if(stat == CONSCIOUS)
		if(udder && prob(5))
			udder.add_reagent(milk_type, rand(5, 10))
	if(!stat && prob(3) && offspring_left > 0)
		visible_message("[src] [pick("squats down and moos.","begins making a huge racket.","begins mooing raucously.")]")
		offspring_left--
		var/mob/living/simple_animal/baby_tatonka/E = new(get_turf(src))
		START_PROCESSING(SSobj, E)
	default_pixel_x = -16
	pixel_x = -16

//Baby Tatonka
//Grows into a tatonka or a tangu
/mob/living/simple_animal/baby_tatonka
	name = "\improper tatonka calf"
	desc = "Adorable! Four sets of big brown eyes and cute little horns."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "brahmin"
	speak_emote = list("moos","moos hauntingly")
	emote_see = list("shakes its heads.","snuffles.","clacks its horns together.")
	speak_chance = 2
	turns_per_move = 2
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	meat_amount = 1
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	health = 10
	var/amount_grown = 0
	mob_size = MOB_SMALL
	autoseek_food = 0
	beg_for_food = 0
	hunger_enabled = FALSE
	default_pixel_x = -16
	pixel_x = -16
	colony_friend = TRUE

/mob/living/simple_animal/baby_tatonka/New()
	..()
	pixel_x = -16
	src.transform *= 0.5

/mob/living/simple_animal/baby_tatonka/Life()
	. =..()
	if(!.)
		return
	if(!stat)
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			if(prob(10))
				new /mob/living/simple_animal/tatonka/tangu(src.loc)
			else
				new /mob/living/simple_animal/tatonka(src.loc)
			qdel(src)
	default_pixel_x = -16
	pixel_x = -16

//Tangu, the improved version of tatonka and thus rarer to produce.
/mob/living/simple_animal/tatonka/tangu
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
	colony_friend = TRUE

//Baby Clucker
//Looks nearly the same as a regular chick.
/mob/living/simple_animal/chick_clucker
	name = "\improper clucker chick"
	desc = "Adorable! They make such a racket though."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "chick_clucker"
	speak_emote = list("cheeps")
	emote_see = list("pecks at the ground.","flaps its tiny wings.","cheeps.")
	speak_chance = 2
	turns_per_move = 2
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	meat_amount = 1
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	health = 1
	var/amount_grown = 0
	pass_flags = PASSTABLE
	mob_size = MOB_MINISCULE
	autoseek_food = 0
	beg_for_food = 0
	hunger_enabled = FALSE
	colony_friend = TRUE

/mob/living/simple_animal/chick_clucker/New()
	..()
	pixel_x = rand(-6, 6)
	pixel_y = rand(0, 10)

/mob/living/simple_animal/chick_clucker/Life()
	. =..()
	if(!.)
		return
	if(!stat)
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			new /mob/living/simple_animal/clucker(src.loc)
			qdel(src)

//clucker
//Basically a mutant chicken that produces feathers, meat, and a single bit of bones if butchered by a hunter.
/mob/living/simple_animal/clucker
	name = "\improper clucker"
	desc = "A clucker, the affectionately nick named chickens that escaped the colony and somehow survived in the wild before mutating. While mostly without feathers, a single blood engorged one \
	hangs from the birds tail that produces a decent painkiller if treated properly. Prefers to eat poppies over the usual wheat regular chickens favor."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "clucker"
	speak = list("cluck!","BWAAAAARK BWAK BWAK BWAK!","bwaak bwak.")
	emote_see = list("pecks at the ground","flaps its wings viciously")
	speak_chance = 2
	turns_per_move = 3
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	meat_amount = 4
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	health = 10
	var/eggsleft = 0
	pass_flags = PASSTABLE
	mob_size = MOB_SMALL
	autoseek_food = 0
	beg_for_food = 0
	hunger_enabled = FALSE
	leather_amount = 0 //The amount of leather sheets dropped.
	bones_amount = 4 //The amount of bone sheets dropped.
	has_special_parts = TRUE //var for checking during the butcher process.
	special_parts = list(/obj/item/animal_part/clucker_feather)
	colony_friend = TRUE

/mob/living/simple_animal/clucker/New()
	..()
	pixel_x = rand(-6, 6)
	pixel_y = rand(0, 10)

/mob/living/simple_animal/clucker/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/weapon/reagent_containers/food/snacks/grown)) //feedin' dem chickens
		var/obj/item/weapon/reagent_containers/food/snacks/grown/G = O
		if(G.seed && G.seed.kitchen_tag == "poppy")
			if(!stat && eggsleft < 2)
				user.visible_message("\blue [user] feeds [O] to [name]! It clucks happily.","\blue You feed [O] to [name]! It clucks happily.")
				user.drop_item()
				qdel(O)
				eggsleft += rand(1, 2)
			else
				to_chat(user, "\blue [name] doesn't seem hungry!")
		else
			to_chat(user, "[name] doesn't seem interested in that.")
	else
		..()

/mob/living/simple_animal/clucker/Life()
	. =..()
	if(!.)
		return
	if(!stat && prob(3) && eggsleft > 0)
		visible_message("[src] [pick("lays an egg.","squats down and croons.","begins making a huge racket.","begins clucking raucously.")]")
		eggsleft--
		var/obj/item/weapon/reagent_containers/food/snacks/egg/clucker/E = new(get_turf(src))
		E.pixel_x = rand(-6,6)
		E.pixel_y = rand(-6,6)
		START_PROCESSING(SSobj, E)


/obj/item/weapon/reagent_containers/food/snacks/egg/clucker/amount_grown = 0
/obj/item/weapon/reagent_containers/food/snacks/egg/clucker/Process()
	if(isturf(loc))
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			visible_message("[src] hatches with a quiet cracking sound.")
			new /mob/living/simple_animal/chick_clucker(get_turf(src))
			STOP_PROCESSING(SSobj, src)
			qdel(src)
	else
		STOP_PROCESSING(SSobj, src)

//Cerberus, a domesticated hell diver that can be bred for hunting.
/mob/living/simple_animal/hostile/helldiver/cerberus
	name = "cerberus"
	desc = "A domesticated hell diver kept fat, happy, and loyal by the local hunting lodge that breed them as hunting allies and guard animals. Favored especially for their asexual \
	reproduction after being fed various mushrooms, a fact that baffles some soteria scientists. Unlike a standard hell diver the cerberus isn't as \
	obsessed with food but gladly lets itself get pulled along. Hunters beware, however, as the instinct to attack insectile creatures makes even these attempt to maul cht'mants to death, a trait \
	that hasn't been bred out of them yet. Turrets from the colony will also detect these creatures as hostile life, shooting them on sight."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "pigrat"
	icon_living = "pigrat"
	icon_dead = "pigrat_dead"
	hunger_enabled = 0
	metabolic_factor = 0
	nutrition_step = 0
	leather_amount = 4 //The amount of leather sheets dropped.
	bones_amount = 4 //The amount of bone sheets dropped.
	has_special_parts = TRUE //var for checking during the butcher process.
	special_parts = list(/obj/item/animal_part/cerberus_snout)
	var/offspring_left = 0

/mob/living/simple_animal/hostile/helldiver/cerberus/Life()
	. = ..()
	if(!.)
		return
	if(!stat && prob(3) && offspring_left > 0)
		visible_message("[src] [pick("squats down and grunts.","begins making a huge racket.","begins snuffling raucously.")]")
		offspring_left--
		var/mob/living/simple_animal/baby_cerberus/E = new(get_turf(src))
		START_PROCESSING(SSobj, E)

/mob/living/simple_animal/hostile/helldiver/cerberus/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O, /obj/item/weapon/reagent_containers/food/snacks/grown)) //feedin' dem chickens
		var/obj/item/weapon/reagent_containers/food/snacks/grown/G = O
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

//Chimera, a rare spawn beast of a cerberus
/mob/living/simple_animal/hostile/helldiver/cerberus/chimera
	name = "chimera"
	desc = "A mutated strain of a domesticated cerberus, rarely appearing and much sleeker than their lesser cousins. Chimera are faster, better armored, and much more lethal than a cerberus \
	thanks to its maw containing a huge singular fang, making them prized companions by all hunters. While strong, they carry the same problems a regular cerberus does, in that they attack \
	cht'mants on sight and are viewed as hostile life forms \
	most automated combat systems."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "nightstalker"
	icon_living = "nightstalker"
	icon_dead = "nightstalker_dead"
	speed = 5
	maxHealth = 300
	health = 300
	melee_damage_lower = 30
	melee_damage_upper = 35
	resistance = 20
	leather_amount = 6 //The amount of leather sheets dropped.
	bones_amount = 6 //The amount of bone sheets dropped.
	has_special_parts = TRUE //var for checking during the butcher process.
	special_parts = list(/obj/item/animal_part/chimera_fang)
	default_pixel_x = -16
	pixel_x = -16

/mob/living/simple_animal/hostile/helldiver/cerberus/chimera/Life()
	. =..()
	default_pixel_x = -16
	pixel_x = -16

//Baby cerberus
//Grows into a cerberus or chimera
/mob/living/simple_animal/baby_cerberus
	name = "\improper cerberus gruntling"
	desc = "Adorable! A chubby little pig rat thing, largely defenseless until it finally grows up."
	icon = 'icons/mob/mobs-domestic.dmi'
	icon_state = "pigrat"
	icon_living = "pigrat"
	icon_dead = "pigrat_dead"
	speak_chance = 5
	speak = list("chitters!","chitter")
	emote_see = list("scratches at the ground.","gives a small snuffle.","hops back and forth.")
	emote_hear = list("chitters.")
	turns_per_move = 2
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	meat_amount = 1
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	health = 30
	var/amount_grown = 0
	mob_size = MOB_SMALL
	autoseek_food = 0
	beg_for_food = 0
	hunger_enabled = FALSE

/mob/living/simple_animal/baby_cerberus/New()
	..()
	src.transform *= 0.5

/mob/living/simple_animal/baby_cerberus/Life()
	. =..()
	if(!.)
		return
	if(!stat)
		amount_grown += rand(1,2)
		if(amount_grown >= 100)
			if(prob(10))
				new /mob/living/simple_animal/hostile/helldiver/cerberus/chimera(src.loc)
			else
				new /mob/living/simple_animal/hostile/helldiver/cerberus(src.loc)
			qdel(src)