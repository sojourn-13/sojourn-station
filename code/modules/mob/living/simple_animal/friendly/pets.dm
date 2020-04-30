/mob/living/simple_animal/hostile/commanded/pet
	name = "small dog"
	desc = "A small cute dog."
	icon_state = "corgi"
	item_state = "corgi"
	short_name = "dog"

	health = 75
	maxHealth = 75

	melee_damage_lower = 5
	melee_damage_upper = 5

	min_oxy = 5
	max_co2 = 5
	max_tox = 2 //We tuff bear
	mob_size = MOB_SMALL
	response_help = "pets"
	response_harm = "bites"
	response_disarm = "pushes"
	var/name_changed = 0
	holder_type
	var/obj/item/inventory_head
	var/obj/item/inventory_back
	var/iconheadpath = 'icons/mob/corgi_head.dmi'
	var/iconbackpath = 'icons/mob/corgi_back.dmi'

	speak_emote = list("barks", "woofs")
	emote_see = list("shakes its head", "shivers")
	var/friendsaylog = "Bark!"
	speak_chance = 1
	turns_per_move = 10
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat/corgi
	meat_amount = 3

	max_nutrition = 250//Dogs are insatiable eating monsters. This scales with their mob size too
	stomach_size_mult = 30
	seek_speed = 6

	known_commands = list("stay", "stop", "attack", "follow")

/mob/living/simple_animal/hostile/commanded/pet/New()
	..()
	nutrition = max_nutrition * 0.3//Pet doesn't start with a full belly so will be hungry at roundstart

/mob/living/simple_animal/hostile/commanded/pet/Life()
	..()

	if(!stat && !resting && !buckled)
		if(prob(1))
			var/msg2 = (pick("dances around","chases their tail"))
			src.visible_message("<span class='name'>[src]</span> [msg2].")
			spawn(0)
				for(var/i in list(1,2,4,8,4,2,1,2,4,8,4,2,1,2,4,8,4,2))
					set_dir(i)
					sleep(1)

/mob/living/simple_animal/hostile/commanded/pet/beg(var/atom/thing, var/atom/holder)
	visible_emote("stares at the [thing] that [holder] has with sad puppy eyes.")

/mob/living/simple_animal/hostile/commanded/pet/hit_with_weapon(obj/item/O, mob/living/user, var/effective_force, var/hit_zone)
	. = ..()
	if(!.)
		src.emote("roars in rage!")

/mob/living/simple_animal/hostile/commanded/pet/attack_hand(mob/living/carbon/human/M as mob)
	..()
	if(M.a_intent == I_HURT)
		src.emote("roars in rage!")

/mob/living/simple_animal/hostile/commanded/pet/verb/befriend()
	set name = "Befriend Pet"
	set category = "IC"
	set src in view(1)

	if(!master)
		var/mob/living/carbon/human/H = usr
		if(istype(H))
			master = usr
			say(friendsaylog)
//			playsound(src,'sound/effects/creatures/dog_bark.ogg',100, 1)
			. = 1
	else if(usr == master)
		. = 1 //already friends, but show success anyways

	else
		to_chat(usr, "<span class='notice'>[src] ignores you.</span>")

	return

/mob/living/simple_animal/hostile/commanded/pet/verb/change_name()
	set name = "Name Pet"
	set category = "IC"
	set src in view(1)

	var/mob/M = usr
	if(!M.mind)	return 0

	if(!name_changed)

		var/input = sanitizeSafe(input("What do you want to name the dog?", ,""), MAX_NAME_LEN)

		if(src && input && !M.stat && in_range(M,src))
			name = input
			real_name = input
			name_changed = 1
			return 1

	else
		to_chat(usr, "<span class='notice'>[src] already has a name!</span>")
		return
/mob/living/simple_animal/hostile/commanded/pet/corgi
	name = "small corgi"
	holder_type = /obj/item/weapon/holder/corgi

/mob/living/simple_animal/hostile/commanded/pet/corgipuppy
	name = "\improper corgi puppy"
	real_name = "corgi"
	desc = "It's a corgi puppy."
	icon_state = "puppy"

/mob/living/simple_animal/hostile/commanded/pet/corgi/regenerate_icons()
	cut_overlays()

	if(inventory_head)
		var/head_icon_state = inventory_head.icon_state
		if(health <= 0)
			head_icon_state += "2"

		var/icon/head_icon = image(iconheadpath,head_icon_state)
		if(head_icon)
			add_overlay(head_icon)

	if(inventory_back)
		var/back_icon_state = inventory_back.icon_state
		if(health <= 0)
			back_icon_state += "2"

		var/icon/back_icon = image(iconbackpath,back_icon_state)
		if(back_icon)
			add_overlay(back_icon)
	return

/mob/living/simple_animal/hostile/commanded/pet/cat
	name = "cat"
	desc = "A domesticated, feline pet. Has a tendency to adopt crewmembers."
	icon_state = "cat2"
	item_state = "cat2"
	speak_emote = list("purrs", "meows")
	emote_see = list("shakes their head", "shivers")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	friendsaylog = "Meow!"
	var/mob/flee_target
	holder_type = /obj/item/weapon/holder/cat

	var/mob/living/simple_animal/mouse/mousetarget = null

/mob/living/simple_animal/hostile/commanded/pet/cat/Life()
	..()

	spawn(2)
		attack_mice()

/mob/living/simple_animal/hostile/commanded/pet/cat/proc/attack_mice()
	if((loc) && isturf(loc))
		if(!incapacitated())
			for(var/mob/living/simple_animal/hostile/commanded/pet/mouse/M  in oview(src,1))
				if(M.stat != DEAD)
					M.splat()
					visible_emote(pick("bites \the [M]!","toys with \the [M].","chomps on \the [M]!"))
					movement_target = null
					stop_automated_movement = 0
					if (prob(75))
						break//usually only kill one mouse per proc

//Cats always land on their feet
/mob/living/simple_animal/hostile/commanded/pet/cat/get_fall_damage()
	return 0

/mob/living/simple_animal/hostile/commanded/pet/cat/blackcat
	name = "black cat"
	desc = "Her fur has the look and feel of velvet, and her tail quivers occasionally."
	icon_state = "cat"
	item_state = "cat"

/mob/living/simple_animal/hostile/commanded/pet/cat/kitten
	name = "kitten"
	desc = "D'aaawwww"
	icon_state = "kitten"
	item_state = "kitten"
///MOUSEPETS WTF HE HAVE A REAL MOUSE PET?!
/mob/living/simple_animal/hostile/commanded/pet/mouse
	name = "brown mouse"
	desc = "It's a fuzzy little critter."
	icon = 'icons/mob/mobs-mouse.dmi'
	icon_state = "mouse_brown"
	item_state = "mouse_brown"
	speak_emote = list("squeeks","squeeks","squiks")
	emote_see = list("squeeks","squeaks","squiks")
	speak_chance = 5
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	meat_amount = 1
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps on"
	friendsaylog = "squeeks!"
	var/mob/flee_target
	var/body_color = "brown"
	holder_type = /obj/item/weapon/holder/mouse/brown

	var/mob/living/simple_animal/mouse/mousetarget = null

/mob/living/simple_animal/hostile/commanded/pet/mouse/proc/splat()
	src.health = 0
	src.death()
	src.icon_dead = "mouse_[body_color]_splat"
	src.icon_state = "mouse_[body_color]_splat"

/mob/living/simple_animal/hostile/commanded/pet/mouse/white
	icon_state = "mouse_white"
	icon_rest = "mouse_white_sleep"
	body_color = "white"
	holder_type = /obj/item/weapon/holder/mouse/white

/mob/living/simple_animal/hostile/commanded/pet/mouse/gray
	icon_state = "mouse_gray"
	icon_rest = "mouse_gray_sleep"
	body_color = "white"
	holder_type = /obj/item/weapon/holder/mouse/gray