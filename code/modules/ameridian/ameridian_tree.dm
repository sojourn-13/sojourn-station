// Ameridian Tree, an tree-like crystal that spawn 3 runner golems when fell
/obj/structure/ameridian_crystal/tree
	name = "ameridian tree"
	desc = "A strange crystal formation that seems to grow on its own..."
	icon_state = "ameridian_tree"
	anchored = TRUE
	density = TRUE
	light_range = 5 // Glow in the dark
	growth = 6 // Bigger than other crystals
	growth_prob = 2.5 // Spread crystals faster
	spread_range = 2
	rad_damage = 0.75
	rad_range = 2
	var/amount_runner = 3 // Amount of runners spawned on destruction

// The tree doesn't spawn golems on its own.
/obj/structure/ameridian_crystal/tree/handle_golems()
	return

/obj/structure/ameridian_crystal/tree/attackby(obj/item/I, mob/user)
	if(user.a_intent == I_HELP && user.Adjacent(src) && (I.has_quality(QUALITY_EXCAVATION) || I.has_quality(QUALITY_DIGGING) || I.has_quality(QUALITY_SHOVELING)))
		src.visible_message(SPAN_NOTICE("[user] starts start digging [src] up."), SPAN_NOTICE("You start digging [src] up."))
		if(do_after(user, WORKTIME_SLOW, src))
			visible_message("[src] crumbles into a pile of crystals...")
			spawn_runner(amount_runner)
			activate_mobs_in_range(src, 15) // Wake up the nearby golems
			qdel(src)
		else
			to_chat(user, SPAN_WARNING("You must stay still to finish excavation."))
	else
		..()

/obj/structure/ameridian_crystal/tree/proc/spawn_runner(var/runner_amt = 1)
	var/list/turf_list = list()
	for(var/turf/T in view(1, src))
		if(istype(T, /turf/simulated/open) || istype(T, /turf/space))
			continue // Ignore turfs that are actually air
		if(T.Enter(src)) // If we can "enter" on the tile then we can spread to it.
			turf_list += T

	var/sound/S = sound('sound/effects/screech.ogg')
	for(var/mob/living/carbon/human/H in viewers(src))
		if(H.stats.getPerk(PERK_PSION))
			to_chat(H, "<b><font color='purple'>[src] whistles...</b></font>")
			H.playsound_local(get_turf(src), S, 50) // Only psionics can hear that

	sleep((S.len + 4) SECONDS) // 5 Seconds before the golems spawn

	visible_message(SPAN_DANGER("[src] reforms into multiple golems!"))
	for(var/I = 0, I < runner_amt, I++)
		new /mob/living/carbon/superior_animal/ameridian_golem/runner(pick(turf_list))
