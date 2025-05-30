//Cat
/mob/living/simple/cat
	name = "cat"
	desc = "A domesticated, feline pet. Has a tendency to adopt crewmembers."
	icon_state = "cat2"
	item_state = "cat2"
	speak_emote = list("purrs", "meows")
	emote_see = list("shakes their head", "shivers", "flicks their tail sideways")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/reagent_containers/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	var/mob/flee_target
	min_oxy = 16 //Require atleast 16kPA oxygen
	minbodytemp = 223		//Below -50 Degrees Celcius
	maxbodytemp = 323	//Above 50 Degrees Celcius
	holder_type = /obj/item/holder/cat
	mob_size = MOB_SMALL
	possession_candidate = 1
	colony_friend = TRUE
	inherent_mutations = list(MUTATION_CAT_EYES, MUTATION_RAND_UNSTABLE, MUTATION_NERVOUSNESS)

	scan_range = 3//less aggressive about stealing food
	metabolic_factor = 0.75
	sanity_damage = -1
	var/mob/living/simple/mouse/mousetarget = null
	seek_speed = 5
	pass_flags = PASSTABLE

/mob/living/simple/cat/Life()
	..()
	if (stat == DEAD)
		return
	if (turns_since_move > 5 || (flee_target || mousetarget))
		SSmove_manager.move_to(src,0)
		turns_since_move = 0

		if (flee_target) //fleeing takes precendence
			handle_flee_target()
		else
			handle_movement_target()

	if (!movement_target)
		SSmove_manager.move_to(src,0)

	spawn(2)
		attack_mice()

	if(prob(2)) //spooky
		var/mob/observer/ghost/spook = locate() in range(src,5)
		if(spook)
			var/turf/T = spook.loc
			var/list/visible = list()
			for(var/obj/O in T.contents)
				if(!O.invisibility && O.name)
					visible += O
			if(visible.len)
				var/atom/A = pick(visible)
				visible_emote("suddenly stops and stares at something unseen[istype(A) ? " near [A]":""].")
				visible_emote("hisses as their fur stands on edge!") // GHOST DETECTED. CATTO NO LIKE.
				playsound(loc, 'sound/effects/creatures/cat_hiss.ogg', 50, 1, -1)

/mob/living/simple/cat/proc/handle_movement_target()
	//if our target is neither inside a turf or inside a human(???), stop
	if((movement_target) && !(isturf(movement_target.loc) || ishuman(movement_target.loc) ))
		movement_target = null
		stop_automated_movement = 0
	//if we have no target or our current one is out of sight/too far away
	if( !movement_target || !(movement_target.loc in oview(src, 4)) )
		movement_target = null
		stop_automated_movement = 0

	if(movement_target)
		stop_automated_movement = 1
		SSmove_manager.move_to(src,movement_target,0,seek_move_delay)

/mob/living/simple/cat/proc/attack_mice()
	if((loc) && isturf(loc))
		if(!incapacitated())
			for(var/mob/living/simple/mouse/M in oview(src,1))
				if(M.stat != DEAD)
					M.splat()
					visible_emote(pick("bites \the [M]!","toys with \the [M].","chomps on \the [M]!"))
					movement_target = null
					stop_automated_movement = 0
					if (prob(75))
						break//usually only kill one mouse per proc

/mob/living/simple/cat/beg(var/atom/thing, var/atom/holder)
	visible_emote("licks [get_gender() == MALE ? "his" : get_gender() == FEMALE ? "her" : "their"] lips and hungrily glares at [holder]'s [thing.name]")

/mob/living/simple/cat/Released()
	//A thrown cat will immediately attack mice near where it lands
	handle_movement_target()
	spawn(3)
		attack_mice()
	..()

/mob/living/simple/cat/proc/handle_flee_target()
	//see if we should stop fleeing
	if (stat == DEAD)
		flee_target = null

	if (flee_target && !(flee_target.loc in view(src)))
		flee_target = null
		stop_automated_movement = 0

	if (flee_target && stat != DEAD)
		if(prob(25)) say("HSSSSS")
		playsound(loc, 'sound/effects/creatures/cat_hiss.ogg', 50, 1, -1)
		stop_automated_movement = 1
		SSmove_manager.move_away(src, flee_target, 7, 2)

/mob/living/simple/cat/proc/set_flee_target(atom/A)
	if(A && stat != DEAD)
		flee_target = A
		turns_since_move = 5

/mob/living/simple/cat/attackby(var/obj/item/O, var/mob/user)
	. = ..()
	if(O.force)
		set_flee_target(user? user : src.loc)

/mob/living/simple/cat/attack_hand(mob/living/carbon/human/M as mob)
	. = ..()
	if(M.a_intent == I_HURT)
		set_flee_target(M)

/mob/living/simple/cat/ex_act()
	. = ..()
	set_flee_target(src.loc)

/mob/living/simple/cat/bullet_act(var/obj/item/projectile/proj)
	. = ..()
	if (!(proj.testing))
		set_flee_target(proj.firer? proj.firer : src.loc)

/mob/living/simple/cat/hitby(atom/movable/AM)
	. = ..()
	set_flee_target(AM.thrower? AM.thrower : src.loc)

/mob/living/simple/cat/MouseDrop(atom/over_object)

	var/mob/living/carbon/H = over_object
	if(!istype(H) || !Adjacent(H)) return ..()

	if(H.a_intent == I_HELP)
		get_scooped(H)
		return
	else
		return ..()

//Cats always land on their feet
/mob/living/simple/cat/get_fall_damage()
	return 0

//Basic friend AI
/mob/living/simple/cat/fluff
	var/mob/living/carbon/human/friend
	var/befriend_job = null

/mob/living/simple/cat/fluff/handle_movement_target()
	if (friend)
		var/follow_dist = 5
		if (friend.stat >= DEAD || friend.health <= HEALTH_THRESHOLD_SOFTCRIT) //danger
			follow_dist = 1
		else if (friend.stat || friend.health <= 50) //danger or just sleeping
			follow_dist = 2
		var/near_dist = max(follow_dist - 2, 1)
		var/current_dist = get_dist(src, friend)

		if (movement_target != friend)
			if (current_dist > follow_dist && !ismouse(movement_target) && (friend in oview(src)))
				//stop existing movement
				SSmove_manager.move_to(src,0)
				turns_since_scan = 0

				//walk to friend
				stop_automated_movement = 1
				movement_target = friend
				SSmove_manager.move_to(src, movement_target, near_dist, seek_move_delay)

		//already following and close enough, stop
		else if (current_dist <= near_dist)
			SSmove_manager.move_to(src,0)
			movement_target = null
			stop_automated_movement = 0
			if (prob(10))
				say("Meow!")
				playsound(loc, 'sound/voice/meow1.ogg', 50, 1)

	if (!friend || movement_target != friend)
		..()

/mob/living/simple/cat/fluff/Life()
	..()
	if (stat || !friend)
		return
	if (get_dist(src, friend) <= 1)
		if (friend.stat >= DEAD || friend.health <= HEALTH_THRESHOLD_SOFTCRIT)
			if (prob((friend.stat < DEAD)? 50 : 15))
				var/verb = pick("meows", "mews", "mrowls")
				visible_emote(pick("[verb] in distress.", "[verb] anxiously."))
				playsound(loc, 'sound/voice/meow1.ogg', 50, 1)

		else
			if (prob(5))
				var/msg5 = (pick("nuzzles [friend]",
								   "brushes against [friend]",
								   "rubs against [friend]",
								   "purrs"))
				src.visible_message("<span class='name'>[src]</span> [msg5].")
				playsound(loc, 'sound/voice/purr.ogg', 50, 1, -1)
	else if (friend.health <= 50)
		if (prob(10))
			var/verb = pick("meows", "mews", "mrowls")
			visible_emote("[verb] anxiously.")
			playsound(loc, 'sound/voice/meow1.ogg', 50, 1)

/mob/living/simple/cat/fluff/verb/friend()
	set name = "Become Friends"
	set category = "IC"
	set src in view(1)

	if(friend && usr == friend)
		set_dir(get_dir(src, friend))
		say("Meow!")
		playsound(loc, 'sound/voice/meow1.ogg', 50, 1)
		return

	if (ishuman(usr))
		var/mob/living/carbon/human/H = usr
		if(H.job == befriend_job)
			friend = usr
			set_dir(get_dir(src, friend))
			say("Meow!")
			playsound(loc, 'sound/voice/meow1.ogg', 50, 1)
			return

	to_chat(usr, SPAN_NOTICE("[src] ignores you."))
	return


//RUNTIME IS ALIVE! SQUEEEEEEEE~
/mob/living/simple/cat/fluff/Runtime
	name = "Runtime"
	desc = "Her fur has the look and feel of velvet, and her tail quivers occasionally."
	gender = FEMALE
	icon_state = "cat"
	item_state =  "cat"
	befriend_job = "Chief Biolab Overseer"
	colony_friend = TRUE
	friendly_to_colony = TRUE

/mob/living/simple/cat/kitten
	name = "kitten"
	desc = "D'aaawwww"
	icon_state = "kitten"
	item_state = "kitten"
	gender = NEUTER

// Leaving this here for now.
/obj/item/holder/cat/fluff/bones
	name = "Bones"
	desc = "It's Bones! Meow."
	gender = MALE
	icon_state = "cat3"
	item_state = "cat3"

/mob/living/simple/cat/fluff/bones
	name = "Bones"
	desc = "That's Bones the cat. He's a laid back, black cat. Meow."
	gender = MALE
	icon_state = "cat3"
	item_state = "cat3"
	holder_type = /obj/item/holder/cat/fluff/bones
	sanity_damage = -2
	var/friend_name = "Erstatz Vryroxes"

/mob/living/simple/cat/kitten/New()
	gender = pick(MALE, FEMALE)
	..()

//Trilby

/mob/living/simple/cat/runtime
	name = "Trilby"
	real_name = "Trilby"
	desc = "A bluespace denizen that purrs its way into our dimension when the very fabric of reality is teared apart."
	icon_state = "runtimecat"
	item_state = "runtimecat"
	density = 0

	status_flags = GODMODE // Bluespace cat
	min_oxy = 0
	minbodytemp = 0
	maxbodytemp = INFINITY
	autoseek_food = 0
	metabolic_factor = 0.0
	harm_intent_damage = 0
	melee_damage_lower = 0
	melee_damage_upper = 0
	attacktext = "slashed"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	colony_friend = TRUE
	friendly_to_colony = TRUE
	sanity_damage = 5

/mob/living/simple/cat/runtime/New(loc)
	..(loc)
	stats.addPerk(PERK_TERRIBLE_FATE)
	playsound(loc, 'sound/effects/teleport.ogg', 50, 1)

/mob/living/simple/cat/runtime/attackby(var/obj/item/O, var/mob/user)
	visible_message(SPAN_DANGER("[user]'s [O.name] harmlessly passes through \the [src]."))

/*	// Commenting out so we can put the catto in the box
/mob/living/simple/cat/runtime/MouseDrop(atom/over_object)
	return
*/

/mob/living/simple/cat/runtime/attack_hand(mob/living/carbon/human/M as mob)

	switch(M.a_intent)

		if(I_HELP)  // Pet the cat
			M.visible_message(SPAN_NOTICE("[M] pets \the [src]."))

		if(I_DISARM)
			M.visible_message(SPAN_NOTICE("[M]'s hand passes through \the [src]."))
			M.do_attack_animation(src)

		if(I_GRAB)
			if (M == src)
				return
			if (!(status_flags & CANPUSH))
				return
			M.visible_message(SPAN_NOTICE("[M]'s hand passes through \the [src]."))
			M.do_attack_animation(src)

		if(I_HURT)
			M.visible_message(SPAN_WARNING("[M] tries to kick \the [src] but passes through."))
			M.do_attack_animation(src)
			visible_message(SPAN_WARNING("\The [src] hisses."))
			playsound(loc, 'sound/effects/creatures/cat_hiss.ogg', 50, 1, -1) // NO HURT CATTO!

	return

/mob/living/simple/cat/runtime/set_flee_target(atom/A)
	return

/mob/living/simple/cat/runtime/bullet_act(var/obj/item/projectile/proj)
	return PROJECTILE_FORCE_MISS

/mob/living/simple/cat/runtime/ex_act(severity)
	return

/mob/living/simple/cat/runtime/singularity_act()
	return

/*	This is commented out for the sake of the cardboard box, and also parading the catto around
/mob/living/simple/cat/runtime/start_pulling(var/atom/movable/AM)
	to_chat(src, SPAN_WARNING("Your hand passes through \the [src]."))
	return
*/
