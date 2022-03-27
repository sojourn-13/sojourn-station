// Ameridian Spire, an indestructible building that constantly refill missing ameridian around it.
/obj/structure/ameridian_crystal/spire
	name = "ameridian spire"
	desc = "A strange crystal formation that seems to grow on its own..."
	icon = 'icons/obj/ameridian.dmi'
	icon_state = "ameridian_crystal_purple"
	anchored = TRUE
	density = TRUE
	light_range = 7 // Glow in the dark
	light_color = COLOR_LIGHTING_PURPLE_BRIGHT
	growth = 6 // Bigger than other crystals
	growth_prob = 5 // Spread crystals faster
	golem_timer = 100
	spread_range = 2
	rad_damage = 1
	rad_range = 3

/obj/structure/ameridian_crystal/spire/update_icon()
	transform = initial(transform)
	transform *= 1.5 // 50% bigger

/obj/structure/ameridian_crystal/spire/examine(mob/user)
	..()
	if(user.stats?.getPerk(PERK_PSION)) // Are we a psion and is there something to see?
		to_chat(user, "<b><font color='purple'> You have the feeling this spire goes deep. Very deep...")

/obj/structure/ameridian_crystal/spire/attackby(obj/item/I, mob/user)
	src.visible_message(SPAN_NOTICE("[user] cannot make a dent into [src]."), SPAN_NOTICE("You cannot make a dent into [src]."))
	return // Can't destroy it

/obj/structure/ameridian_crystal/spire/ex_act(severitiy)
	return

// Spires always spawn a golem each
/obj/structure/ameridian_crystal/spire/handle_golems()
	if(golem)
		return FALSE

	if(++golem_timer >= initial(golem_timer))
		golem_timer = 0
		// Psions get an early warning
		var/sound/S = sound('sound/synthesized_instruments/chromatic/vibraphone1/c5.ogg')
		for(var/mob/living/carbon/human/H in view(src))
			if(H.stats.getPerk(PERK_PSION))
				to_chat(H, "<b><font color='purple'>[src] chimes.")
				H.playsound_local(get_turf(src), S, 50) // Only psionics can hear that

		sleep((S.len + 1) SECONDS) // Wait until the sound is done, we're using S.len in case the sound change for another with a different duration. We add a second to give a slightly longer warning time.

		golem = new /mob/living/carbon/superior_animal/ameridian_golem/strong(get_turf(src)) // Spawn a golem
		golem.node = src
		src.visible_message("[src] create a crystal golem to defend itself.")
		return TRUE

// Probably will cause a lag-spike if called.
/obj/structure/ameridian_crystal/spire/proc/mass_crystal_process_toggle()
	var/possible_answer = list("Yes", "No")
	var/choice = input(usr, "Are you sure you want to do this?", "Toggle All Processing", "No") as anything in possible_answer
	if(choice == "Yes")
		for(var/obj/structure/ameridian_crystal/AC in world) // Loop through every single crystal in the world, probably will freeze the server for a moment or two
			AC.toggle_processing()
		return TRUE
	return FALSE
