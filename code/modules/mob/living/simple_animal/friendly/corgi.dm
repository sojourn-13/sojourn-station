//Corgi
/mob/living/simple_animal/corgi
	name = "\improper corgi"
	real_name = "corgi"
	desc = "It's a corgi."
	icon_state = "corgi"
	item_state = "corgi"
	speak_emote = list("barks", "woofs")
	emote_see = list("shakes its head", "shivers")
	speak_chance = 1
	turns_per_move = 10
	meat_type = /obj/item/reagent_containers/food/snacks/meat/corgi
	meat_amount = 3
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	see_in_dark = 5
	mob_size = MOB_SMALL
	max_nutrition = 250//Dogs are insatiable eating monsters. This scales with their mob size too
	stomach_size_mult = 30
	seek_speed = 6
	possession_candidate = 1
	holder_type = /obj/item/holder/corgi
	var/obj/item/inventory_head
	var/obj/item/inventory_back
	colony_friend = TRUE
	inherent_mutations = list(MUTATION_BOTTOMLESS_BELLY, MUTATION_IMBECILE, MUTATION_CLUMSY, MUTATION_THICK_FUR)

/mob/living/simple_animal/corgi/New()
	..()
	nutrition = max_nutrition * 0.3//Ian doesn't start with a full belly so will be hungry at roundstart

//IAN! SQUEEEEEEEEE~
/mob/living/simple_animal/corgi/Ian
	name = "Ian"
	real_name = "Ian"	//Intended to hold the name without altering it.
	gender = MALE
	desc = "It's a corgi."
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/simple_animal/corgi/Life()
	..()

	if(!stat && !resting && !buckled)
		if(prob(1))
			var/msg2 = (pick("dances around","chases [get_gender() == MALE ? "his" : get_gender() == FEMALE ? "her" : "their"] tail"))
			src.visible_message("<span class='name'>[src]</span> [msg2].")
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2,4,8,4,2,1,2,4,8,4,2))
					set_dir(i)
					sleep(1)

/mob/living/simple_animal/corgi/beg(var/atom/thing, var/atom/holder)
	visible_emote("stares at the [thing] that [holder] has with sad puppy eyes.")

/obj/item/reagent_containers/food/snacks/meat/corgi
	name = "Corgi meat"
	desc = "Tastes like... well you know..."

/mob/living/simple_animal/corgi/attackby(var/obj/item/O as obj, var/mob/user as mob)  //Marker -Agouri
	if(istype(O, /obj/item/newspaper))
		if(!stat)
			visible_message(SPAN_NOTICE("[user] baps [name] on the nose with the rolled up [O.name]."))
			scan_interval = max_scan_interval//discipline your dog to make it stop stealing food for a while
			movement_target = null
			foodtarget = 0
			stop_automated_movement = 0
			turns_since_scan = 0
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2))
					set_dir(i)
					sleep(1)
	else
		..()

/mob/living/simple_animal/corgi/regenerate_icons()
	cut_overlays()

	if(inventory_head)
		var/head_icon_state = inventory_head.icon_state
		if(health <= 0)
			head_icon_state += "2"

		var/icon/head_icon = image('icons/mob/corgi_head.dmi',head_icon_state)
		if(head_icon)
			add_overlay(head_icon)

	if(inventory_back)
		var/back_icon_state = inventory_back.icon_state
		if(health <= 0)
			back_icon_state += "2"

		var/icon/back_icon = image('icons/mob/corgi_back.dmi',back_icon_state)
		if(back_icon)
			add_overlay(back_icon)
	return


/mob/living/simple_animal/corgi/puppy
	name = "\improper corgi puppy"
	real_name = "corgi"
	desc = "It's a corgi puppy."
	icon_state = "puppy"

//pupplies cannot wear anything.
/mob/living/simple_animal/corgi/puppy/Topic(href, href_list)
	if(href_list["remove_inv"] || href_list["add_inv"])
		to_chat(usr, "\red You can't fit this on [src]")
		return
	..()


//LISA! SQUEEEEEEEEE~
/mob/living/simple_animal/corgi/Lisa
	name = "Lisa"
	real_name = "Lisa"
	gender = FEMALE
	desc = "It's a corgi with a cute pink bow."
	icon_state = "lisa"
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	var/puppies = 0
	colony_friend = TRUE
	friendly_to_colony = TRUE

//Lisa already has a cute bow!
/mob/living/simple_animal/corgi/Lisa/Topic(href, href_list)
	if(href_list["remove_inv"] || href_list["add_inv"])
		to_chat(usr, "\red [src] already has a cute bow!")
		return
	..()

/mob/living/simple_animal/corgi/Lisa/Life()
	..()

	if(!stat && !resting && !buckled)
		turns_since_scan++
		if(turns_since_scan > 15)
			turns_since_scan = 0
			var/alone = 1
			var/ian = 0
			for(var/mob/M in oviewers(7, src))
				if(istype(M, /mob/living/simple_animal/corgi/Ian))
					if(M.client)
						alone = 0
						break
					else
						ian = M
				else
					alone = 0
					break
			if(alone && ian && puppies < 4)
				if(near_camera(src) || near_camera(ian))
					return
				new /mob/living/simple_animal/corgi/puppy(loc)


		if(prob(1))
			var/msg3 = (pick("dances around","chases her tail"))
			src.visible_message("<span class='name'>[src]</span> [msg3].")
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2,4,8,4,2,1,2,4,8,4,2))
					set_dir(i)
					sleep(1)

/mob/living/simple_animal/corgi/E_N
	name = "E-N"
	real_name = "E-N"
	gender = FEMALE
	desc = "It's a robot corgi."
	icon_state = "E-N"
	response_help  = "pets"
	response_disarm = "bops"
	response_harm   = "kicks"
	autoseek_food = FALSE  //To seek food is to seek meals, we do not have such cares
	beg_for_food = FALSE   //A good hunting dog never begs
	hunger_enabled = FALSE //We are made of metal not meals
	mob_classification = CLASSIFICATION_SYNTHETIC
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/simple_animal/corgi/E_N/death()
	..()
	visible_message("<b>[src]</b> blows apart!")
	new /obj/effect/decal/cleanable/blood/gibs/robot(src.loc)
	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	qdel(src)
	return

// For repairing damage to the synths.
/mob/living/simple_animal/corgi/E_N/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/tool))
			T = W

		if(QUALITY_WELDING in T?.tool_qualities)
			if(health < maxHealth)
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					health = maxHealth
					to_chat(user, "You repair the damage to [src].")
					return
				return
			to_chat(user, "[src] doesn't need repairs.")
			return
	// If nothing was ever triggered, continue as normal
	..()
