/mob/living/simple/mouse
	name = "mouse"
	real_name = "mouse"
	desc = "It's a small, disgusting rodent, often found being annoying, and aiding in the spread of disease."
	icon = 'icons/mob/mobs-mouse.dmi'
	icon_state = "mouse_gray"
	item_state = "mouse_gray"
	icon_living = "mouse_gray"
	icon_dead = "mouse_gray_dead"
	icon_rest = "mouse_gray_sleep"
	can_nap = TRUE
	speak = list("Squeek!","SQUEEK!","Squeek?")
	speak_emote = list("squeeks","squeeks","squiks")
	emote_hear = list("squeeks","squeaks","squiks")
	emote_see = list("runs in a circle", "shakes", "scritches at something")
	eat_sounds = list('sound/effects/creatures/nibble1.ogg','sound/effects/creatures/nibble2.ogg')
	pass_flags = PASSTABLE
	speak_chance = 5
	turns_per_move = 5
	see_in_dark = 6
	maxHealth = 5
	health = 5
	melee_damage_upper = 0
	melee_damage_lower = 0
	attacktext = "bitten"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "stomps on"
	density = 0
	layer = MOB_LAYER
	mob_size = MOB_MINISCULE
	min_oxy = 16					// Require atleast 16kPA oxygen
	minbodytemp = 223				// Below -50 Degrees Celcius
	maxbodytemp = 323				// Above 50 Degrees Celcius
	universal_speak = FALSE
	universal_understand = TRUE
	holder_type = /obj/item/holder/mouse
	digest_factor = 0.05
	min_scan_interval = 2
	max_scan_interval = 20
	seek_speed = 1
	speed = 1
	can_pull_size = ITEM_SIZE_TINY
	can_pull_mobs = MOB_PULL_NONE
	meat_type = /obj/item/reagent_containers/snacks/meat
	meat_amount = 1
	can_burrow = TRUE
	//kitchen_tag = "rodent"		// #TODO-CLASSIC - This is part of cooking overhaul, not yet ported

	var/decompose_time = 30 MINUTES
	var/body_color					// Brown, gray and white, leave blank for random
	var/soft_squeaks = list('sound/effects/creatures/mouse_squeaks_1.ogg',
	'sound/effects/creatures/mouse_squeaks_2.ogg',
	'sound/effects/creatures/mouse_squeaks_3.ogg',
	'sound/effects/creatures/mouse_squeaks_4.ogg')
	var/last_softsqueak = null		// Prevents the same soft squeak twice in a row
	var/squeals = 5					// Spam prevention
	var/maxSqueals = 5				// Spam prevention
	var/last_squealgain = 0			// #TODO-CLASSIC - Remove from life() once something else is created
	var/squeakcooldown = 0

/mob/living/simple/mouse/New()
	..()
	nutrition = rand(max_nutrition*0.25, max_nutrition*0.75)

/mob/living/simple/mouse/Life()
	if(..())

		if(client)
			walk_to(src,0)

			// Allows player-controlled mice to do random squeaks (less often than NPC mice)
			if (stat == CONSCIOUS && prob(speak_chance*0.05))
				squeak_soft(0)

			if (squeals < maxSqueals)
				var/diff = world.time - last_squealgain
				if (diff > 600)
					squeals++
					last_squealgain = world.time

//Pixel offsetting while moving
/mob/living/simple/mouse/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, var/glide_size_override = 0)
	if((. = ..()))
		if (prob(50))
			var/new_pixelx = pixel_x
			new_pixelx += rand(-2,2)
			new_pixelx = CLAMP(new_pixelx, -10, 10)
			animate(src, pixel_x = new_pixelx, time = 1)
		else
			var/new_pixely = pixel_y
			new_pixely += rand(-2,2)
			new_pixely = CLAMP(new_pixely, -4, 14)
			animate(src, pixel_y = new_pixely, time = 1)

/mob/living/simple/mouse/Initialize()
	. = ..()
	add_verb(src, /mob/living/proc/ventcrawl)
	add_verb(src, /mob/living/proc/hide)

	if(name == initial(name))
		name = "[name] ([rand(1, 1000)])"
	real_name = name

	if(!body_color)
		body_color = pick( list("brown","gray","white","hooded","irish") )
	icon_state = "mouse_[body_color]"
	item_state = "mouse_[body_color]"
	icon_living = "mouse_[body_color]"
	icon_rest = "mouse_[body_color]_sleep"
	icon_dead = "mouse_[body_color]_dead"
	if (body_color == "brown")
		holder_type = /obj/item/holder/mouse/brown
	if (body_color == "gray")
		holder_type = /obj/item/holder/mouse/gray
	if (body_color == "white")
		holder_type = /obj/item/holder/mouse/white
	if (body_color == "hooded")
		holder_type = /obj/item/holder/mouse/hooded
	if (body_color == "irish")
		holder_type = /obj/item/holder/mouse/irish

/mob/living/simple/mouse/speak_audio()
	squeak_soft(0)

/mob/living/simple/mouse/beg(var/atom/thing, var/atom/holder)
	squeak_soft(0)
	visible_emote("squeaks timidly, sniffs the air and gazes longingly up at \the [thing.name].",0)

/mob/living/simple/mouse/attack_hand(mob/living/carbon/human/M as mob)
	if (src.stat == DEAD)			// If the mouse is dead, we don't pet it, we just pickup the corpse on click
		get_scooped(M, usr)
		return
	else
		..()

/mob/living/simple/mouse/proc/splat()
	src.health = 0
	src.death()
	src.icon_dead = "mouse_[body_color]_splat"
	src.icon_state = "mouse_[body_color]_splat"

// Plays a sound when a mob steps on a mouse
/mob/living/simple/mouse/proc/squeak(var/manual = 1)
	if (stat == CONSCIOUS)
		playsound(src, 'sound/effects/mousesqueek.ogg', 70, 1)
		if (manual)
			log_say("[key_name(src)] squeaks! ")

// Periodically plays one of four sounds randomly, at a low volume
/mob/living/simple/mouse/proc/squeak_soft(var/manual = 1)
	if (stat != DEAD)				// Soft squeaks are allowed while sleeping
		var/list/new_squeaks = last_softsqueak ? soft_squeaks - last_softsqueak : soft_squeaks
		var/sound = pick(new_squeaks)

		last_softsqueak = sound
		playsound(src, sound, 5, 1, -4.6)

		if (manual)
			log_say("[key_name(src)] squeaks softly! ")

// Plays a loud sound manually, upon death or sometimes when stepped on
/mob/living/simple/mouse/proc/squeak_loud(var/manual = 0)
	if (stat == CONSCIOUS)

		if (squeals > 0 || !manual)
			playsound(src, 'sound/effects/creatures/mouse_squeak_loud.ogg', 40, 1)
			squeals --
			log_say("[key_name(src)] squeals! ")
		else
			to_chat(src, "<span class='warning'>Your hoarse mousey throat can't squeal just now, stop and take a breath!</span>")

// Ability - Squeal!
/mob/living/simple/mouse/verb/squeak_loud_verb()
	set name = "Squeal!"
	set category = "Abilities"
	set desc = "Squeal loudly."

	if (usr.client.prefs.muted & MUTE_IC)
		to_chat(usr, "<span class='danger'>You are muted from IC emotes.</span>")
		return

	squeak_loud(1)

// Ability - Soft Squeak
/mob/living/simple/mouse/verb/squeak_soft_verb()
	set name = "Soft Squeak"
	set category = "Abilities"
	set desc = "Squeak softly."

	if (usr.client.prefs.muted & MUTE_IC)
		to_chat(usr, "<span class='danger'>You are muted from IC emotes.</span>")
		return

	squeak_soft(1)

// Ability - Squeak
/mob/living/simple/mouse/verb/squeak_verb()
	set name = "Squeak"
	set category = "Abilities"
	set desc = "Squeak."

	if (usr.client.prefs.muted & MUTE_IC)
		to_chat(usr, "<span class='danger'>You are muted from IC emotes.</span>")
		return

	squeak(1)

// When stepped on
/mob/living/simple/mouse/Crossed(AM as mob|obj)
	if( ishuman(AM) )
		if(!stat)
			var/mob/M = AM
			to_chat(M, "<span class='notice'>\icon[src] Squeek!</span>")
			poke(1)					// Wake up if stepped on
			if (prob(95))
				squeak(0)
			else
				squeak_loud(0)		// You trod on its tail (Squeals)

	if(!health)
		return

	..()

// Upon death
/mob/living/simple/mouse/death()
	layer = MOB_LAYER
	if(ckey || prob(35))
		squeak_loud(0)				// Squeals loudly upon death

	addtimer(CALLBACK(src, PROC_REF(dust)), decompose_time)

	..()

/mob/living/simple/mouse/dust()
	..(anim = "dust_[body_color]", remains = /obj/item/remains/mouse, iconfile = icon)

// Bite Attack - Deals 1 damage and stuns the mouse for a second (#TODO-ISKHOD - Find a better way to do this)
/mob/living/simple/mouse/AltClickOn(A)
	if (!can_click()) 								// Here because only normal leftclicks use a click cooldown. Easy to fix, but there may be unintended consequences
		return
	melee_damage_upper = melee_damage_lower			// Sets the damage to 1
	attack_sound = pick(list('sound/effects/creatures/nibble1.ogg', 'sound/effects/creatures/nibble2.ogg'))
	UnarmedAttack(A, Adjacent(A))
	melee_damage_upper = 0							// Set it back to zero so we're not biting with every normal click
	setClickCooldown(DEFAULT_ATTACK_COOLDOWN*2)		// Doubles the default attack cooldown

// Mouse Types
/mob/living/simple/mouse/white
	body_color = "white"
	icon_state = "mouse_white"
	icon_rest = "mouse_white_sleep"
	holder_type = /obj/item/holder/mouse/white

/mob/living/simple/mouse/gray
	body_color = "gray"
	icon_state = "mouse_gray"
	icon_rest = "mouse_gray_sleep"
	holder_type = /obj/item/holder/mouse/gray

/mob/living/simple/mouse/brown
	body_color = "brown"
	icon_state = "mouse_brown"
	icon_rest = "mouse_brown_sleep"
	holder_type = /obj/item/holder/mouse/brown

/mob/living/simple/mouse/hooded
	body_color = "hooded"
	icon_state = "mouse_hooded"
	icon_rest = "mouse_hooded_sleep"
	holder_type = /obj/item/holder/mouse/hooded

/mob/living/simple/mouse/irish
	body_color = "irish"
	icon_state = "mouse_irish"
	icon_rest = "mouse_irish_sleep"
	holder_type = /obj/item/holder/mouse/irish

/mob/living/simple/mouse/cannot_use_vents()
	return
