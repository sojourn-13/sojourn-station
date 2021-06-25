/mob/living/carbon/superior_animal/fungi/hear_say(var/message, var/verb = "says", var/datum/language/language = null, var/alt_name = "", var/italics = 0, var/mob/speaker = null, var/sound/speech_sound, var/sound_vol, speech_volume)
	..()
	if(speaker in friends) // Is the one talking a friend?
		if(message == "Follow.") // Is he telling us to follow?
			following = speaker
			visible_emote("says, \"I follow friend-[speaker.name].\"")

		if(message == "Stop.") // Else, is he telling us to stop?
			following = null
			visible_emote("says, \"I stop follow friend.\"")

/mob/living/carbon/superior_animal/fungi/proc/beg(var/atom/thing, var/atom/holder)
	visible_emote("gazes longingly at [holder]'s [thing]")

//Code to handle finding and nomming nearby food items <=== Shamelessly stolen from simple_animal.dm - R4d6/Aerith Aether ===>
/mob/living/carbon/superior_animal/fungi/proc/handle_foodscanning()
	if (client || !hunger_enabled || !autoseek_food)
		return 0

	//Feeding, chasing food, FOOOOODDDD
	if(!incapacitated())

		turns_since_scan++
		if(turns_since_scan >= scan_interval)
			turns_since_scan = 0
			if(movement_target && (!(isturf(movement_target.loc) || ishuman(movement_target.loc)) || (foodtarget && !can_eat()) ))
				movement_target = null
				foodtarget = 0
				stop_automated_movement = 0
			if( !movement_target || !(movement_target.loc in oview(src, 7)) )
				walk_to(src,0)
				movement_target = null
				foodtarget = 0
				stop_automated_movement = 0
				if (can_eat())
					for(var/obj/item/weapon/reagent_containers/food/snacks/S in oview(src,7))
						if(isturf(S.loc) || ishuman(S.loc))
							movement_target = S
							foodtarget = 1
							break

					//Look for food in people's hand
					if (!movement_target && beg_for_food)
						var/obj/item/weapon/reagent_containers/food/snacks/F = null
						for(var/mob/living/carbon/human/H in oview(src,scan_range))
							if(istype(H.l_hand, /obj/item/weapon/reagent_containers/food/snacks))
								F = H.l_hand

							if(istype(H.r_hand, /obj/item/weapon/reagent_containers/food/snacks))
								F = H.r_hand

							if (F)
								movement_target = F
								foodtarget = 1
								break

			if(movement_target)
				scan_interval = min_scan_interval
				stop_automated_movement = 1

				if (istype(movement_target.loc, /turf))
					walk_to(src,movement_target,0, seek_move_delay)//Stand ontop of food
				else
					walk_to(src,movement_target.loc,1, seek_move_delay)//Don't stand ontop of people

				if(movement_target)		//Not redundant due to sleeps, Item can be gone in 6 decisecomds
					if (movement_target.loc.x < src.x)
						set_dir(WEST)
					else if (movement_target.loc.x > src.x)
						set_dir(EAST)
					else if (movement_target.loc.y < src.y)
						set_dir(SOUTH)
					else if (movement_target.loc.y > src.y)
						set_dir(NORTH)
					else
						set_dir(SOUTH)

					if(isturf(movement_target.loc) && Adjacent(get_turf(movement_target), src))
						UnarmedAttack(movement_target)
						if (get_turf(movement_target) == loc)
							set_dir(pick(1,2,4,8,1,1))//Face a random direction when eating, but mostly upwards
					else if(ishuman(movement_target.loc) && Adjacent(src, get_turf(movement_target)) && prob(15))
						beg(movement_target, movement_target.loc)
			else
				scan_interval = max(min_scan_interval, min(scan_interval+1, max_scan_interval))//If nothing is happening, ian's scanning frequency slows down to save processing
