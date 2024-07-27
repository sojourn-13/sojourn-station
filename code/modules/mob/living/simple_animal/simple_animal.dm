/mob/living/simple_animal
	name = "animal"
	icon = 'icons/mob/mobs-domestic.dmi'
	health = 20
	maxHealth = 20

	mob_bump_flag = SIMPLE_ANIMAL
	mob_swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	mob_push_flags = MONKEY|SLIME|SIMPLE_ANIMAL

	var/datum/weakref/target_mob
	var/datum/component/spawner/nest
	universal_understand = TRUE //QoL to admins controling mobs
	var/show_stat_health = TRUE	//does the percentage health show in the stat panel for the mob

	var/icon_living = ""
	var/icon_dead = ""
	var/icon_gib = null	//We only try to show a gibbing animation if this exists.
	can_burrow = FALSE

	var/ranged_cooldown = 2 //What the current cooldown on ranged attacks is, generally world.time + ranged_cooldown_time

	//Napping
	var/can_nap = FALSE
	var/icon_rest = null

	var/list/speak = list()
	var/speak_chance = 0
	var/list/emote_hear = list()	//Hearable emotes
	var/list/emote_see = list()		//Unlike speak_emote, the list of things in this variable only show by themselves with no spoken text. IE: Ian barks, Ian yaps
	var/turns_per_move = 1
	var/turns_since_move = 0
	universal_speak = 0		//No, just no.

	//Meat/harvest vars
	var/meat_amount = 1
	var/meat_type = /obj/item/reagent_containers/food/snacks/meat //all mobs now can be butchered into meat
	var/blood_from_harvest = /obj/effect/decal/cleanable/blood/splatter
	//Lodge related products
	var/leather_amount = 1 //The amount of leather sheets dropped.
	var/bones_amount = 1 //The amount of bone sheets dropped.
	var/has_special_parts = FALSE //var for checking during the butcher process.
	var/has_rare_parts = FALSE //For when we want a chance for the mob to drop a different set on a coinflip.
	var/list/special_parts = list()//Any special body parts.
	var/list/rare_parts = list() //Rare body parts we want. Offered as an alternate for some critters. Will only drop special OR rare parts, but not both.

	var/stop_automated_movement = FALSE //Use this to temporarely stop random movement or to if you write special movement code for animals.
	var/wander = TRUE	// Does the mob wander around when idle?
	var/stop_automated_movement_when_pulled = TRUE //When set to 1 this stops the animal from moving when someone is pulling it.
	var/atom/movement_target = null//Thing we're moving towards
	var/turns_since_scan = 0

	//Interaction
	var/response_help   = "tries to help"
	var/response_disarm = "tries to disarm"
	var/response_harm   = "tries to hurt"
	var/harm_intent_damage = 3
	var/cleaning = FALSE //we do clean prase us!

	//Temperature effect
	var/minbodytemp = 250
	var/maxbodytemp = 350
	var/heat_damage_per_tick = 3	//amount of damage applied if animal's body temperature is higher than maxbodytemp
	var/cold_damage_per_tick = 2	//same as heat_damage_per_tick, only if the bodytemperature it's lower than minbodytemp
	var/fire_alert = 0

	//Atmos effect - Yes, you can make creatures that require plasma or co2 to survive. N2O is a trace gas and handled separately, hence why it isn't here. It'd be hard to add it. Hard and me don't mix (Yes, yes make all the dick jokes you want with that.) - Errorage
	var/needs_environment = TRUE
	var/min_oxy = 5
	var/max_oxy = 0					//Leaving something at 0 means it's off - has no maximum
	var/min_tox = 0
	var/max_tox = 1
	var/min_co2 = 0
	var/max_co2 = 5
	var/min_n2 = 0
	var/max_n2 = 0
	var/unsuitable_atoms_damage = 2	//This damage is taken when atmos doesn't fit all the requirements above
	var/speed = 2 //LETS SEE IF I CAN SET SPEEDS FOR SIMPLE MOBS WITHOUT DESTROYING EVERYTHING. Higher speed is slower, negative speed is faster

	var/attacktext = "attacked"
	var/attack_sound = null
	var/friendly = "nuzzles"
	var/environment_smash = 0
	var/resistance		  = 0	// Damage reduction

	//Null rod stuff
	var/supernatural = 0
	var/purge = 0

	//Hunger/feeding vars
	var/hunger_enabled = 1//If set to 0, a creature ignores hunger
	max_nutrition = 50
	var/metabolic_factor = 1//A multiplier on how fast nutrition is lost. used to tweak the rates on a per-animal basis
	var/nutrition_step = 0.2 //nutrition lost per tick and per step, calculated from mob_size, 0.2 is a fallback
	var/bite_factor = 0.4
	var/digest_factor = 0.2 //A multiplier on how quickly reagents are digested
	var/stomach_size_mult = 5

	//Food behaviour vars
	var/autoseek_food = 1//If 0. this animal will not automatically eat
	var/beg_for_food = 1//If 0, this animal will not show interest in food held by a person
	var/min_scan_interval = 1//Minimum and maximum number of procs between a foodscan. Animals will slow down if there's no food around for a while
	var/max_scan_interval = 30
	var/scan_interval = 5//current scan interval, clamped between min and max
	//It gradually increases up to max when its left alone, to save performance
	//It will drop back to 1 if it spies any food.
		//This short time makes animals more responsive to interactions and more fun to play with

	var/seek_speed = 2//How many tiles per second the animal will move towards food
	var/seek_move_delay
	var/scan_range = 6//How far around the animal will look for food
	var/foodtarget = 0
	//Used to control how often ian scans for nearby food
	//Armor values for the mob. Works like normal armor values.
	var/armor = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0,
		agony = 0
	)

	mob_classification = CLASSIFICATION_ORGANIC

/mob/living/simple_animal/proc/beg(atom/thing, atom/holder)
	visible_emote("gazes longingly at [holder]'s [thing]")

/mob/living/simple_animal/New()
	..()
	if(!icon_living)
		icon_living = icon_state
	if(!icon_dead)
		icon_dead = "[icon_state]_dead"

	seek_move_delay = (1 / seek_speed) / (world.tick_lag / 10)//number of ticks between moves
	turns_since_scan = rand(min_scan_interval, max_scan_interval)//Randomise this at the start so animals don't sync up

	remove_verb(src, /mob/verb/observe)

	if(mob_size)
		nutrition_step = mob_size * 0.03 * metabolic_factor
		bite_factor = mob_size * 0.1
		max_nutrition *= 1 + (nutrition_step*4)//Max nutrition scales faster than costs, so bigger creatures eat less often
		create_reagents(stomach_size_mult*mob_size)
	else
		create_reagents(20)

/mob/living/simple_animal/Move(NewLoc, direct)
	. = ..()
	if(.)
		if(src.nutrition && src.stat != DEAD)
			src.nutrition -= nutrition_step

	//Yes this is two of the same proc back to back.
/mob/living/simple_animal/Move(NewLoc, Dir = 0, step_x = 0, step_y = 0, glide_size_override = 0) //WE CLEAN!
	. = ..()
	if(cleaning)
		var/turf/tile = loc
		if(isturf(tile))
			tile.clean_blood()
			for(var/A in tile)
				if(istype(A, /obj/effect))
					if(istype(A, /obj/effect/decal/cleanable) || istype(A, /obj/effect/overlay) && !istype(A, /obj/effect/overlay/water))
						qdel(A)
				else if(istype(A, /obj/item))
					var/obj/item/cleaned_item = A
					cleaned_item.clean_blood()
				else if(ishuman(A))
					var/mob/living/carbon/human/cleaned_human = A
					if(cleaned_human.lying)
						if(cleaned_human.head)
							cleaned_human.head.clean_blood()
							cleaned_human.update_inv_head(0)
						if(cleaned_human.wear_suit)
							cleaned_human.wear_suit.clean_blood()
							cleaned_human.update_inv_wear_suit(0)
						else if(cleaned_human.w_uniform)
							cleaned_human.w_uniform.clean_blood()
							cleaned_human.update_inv_w_uniform(0)
						if(cleaned_human.shoes)
							cleaned_human.shoes.clean_blood()
							cleaned_human.update_inv_shoes(0)
						cleaned_human.clean_blood(1)
						to_chat(cleaned_human, SPAN_DANGER("[src] cleans your face!"))

/mob/living/simple_animal/Released()
	//These will cause mobs to immediately do things when released.
	scan_interval = min_scan_interval
	turns_since_move = turns_per_move
	..()

/*
/mob/living/simple_animal/Initialize(var/mapload)
	.=..()
	if (mapload && can_burrow)
		find_or_create_burrow(get_turf(src))
*/

/mob/living/simple_animal/Login()
	if(src && src.client)
		src.client.screen = null
	..()


/mob/living/simple_animal/updatehealth()
	..()
	activate_ai()
	if (health <= death_threshold && stat != DEAD)
		death()

/mob/living/simple_animal/examine(mob/user)
	..()
	if(hunger_enabled)
		if (!nutrition)
			to_chat(user, SPAN_DANGER("It looks starving!"))
		else if (nutrition < max_nutrition *0.5)
			to_chat(user, SPAN_NOTICE("It looks hungry."))
		else if ((reagents.total_volume > 0 && nutrition > max_nutrition *0.75) || nutrition > max_nutrition *0.9)
			to_chat(user, "It looks full and contented.")
	if (health < maxHealth * 0.10)
		to_chat(user, SPAN_DANGER("It looks like they are on their last legs!"))
	else if (health < maxHealth * 0.20)
		to_chat(user, SPAN_DANGER("It's grievously wounded!"))
	else if (health < maxHealth * 0.30)
		to_chat(user, SPAN_DANGER("It's badly wounded!"))
	else if (health < maxHealth * 0.40)
		to_chat(user, SPAN_WARNING("Its wounds are mounting."))
	else if (health < maxHealth * 0.50)
		to_chat(user, SPAN_WARNING("It looks half dead."))
	else if (health < maxHealth * 0.60)
		to_chat(user, SPAN_WARNING("It looks like its been beaten up quite badly"))
	else if (health < maxHealth * 0.70)
		to_chat(user, SPAN_WARNING("It has accrued some lasting injuries."))
	else if (health < maxHealth * 0.80)
		to_chat(user, SPAN_WARNING("It has had minor damage done to it."))
	else if (health < maxHealth)
		to_chat(user, SPAN_WARNING("It has a few cuts and bruses."))

/mob/living/simple_animal/Life()
	.=..()

	if(!stasis)

		if(!.)
			return FALSE

		if(health <= death_threshold && stat != DEAD) //So we dont loop every tick
			death()
			return FALSE

		if(health > maxHealth)
			health = maxHealth

		handle_stunned()
		handle_weakened()
		handle_paralysed()
		handle_supernatural()

		if(hunger_enabled)
			process_food()
			handle_foodscanning()

		//Atmos
		var/atmos_suitable = TRUE

		var/atom/A = loc

		if(istype(A,/turf) && needs_environment)
			var/turf/T = A

			var/datum/gas_mixture/Environment = T.return_air()

			if(Environment && needs_environment)

				if( abs(Environment.temperature - bodytemperature) > 40 )
					bodytemperature += ((Environment.temperature - bodytemperature) / 5)

				if(min_oxy)
					if(Environment.gas["oxygen"] < min_oxy)
						atmos_suitable = FALSE
				if(max_oxy)
					if(Environment.gas["oxygen"] > max_oxy)
						atmos_suitable = FALSE
				if(min_tox)
					if(Environment.gas["plasma"] < min_tox)
						atmos_suitable = FALSE
				if(max_tox)
					if(Environment.gas["plasma"] > max_tox)
						atmos_suitable = FALSE
				if(min_n2)
					if(Environment.gas["nitrogen"] < min_n2)
						atmos_suitable = FALSE
				if(max_n2)
					if(Environment.gas["nitrogen"] > max_n2)
						atmos_suitable = FALSE
				if(min_co2)
					if(Environment.gas["carbon_dioxide"] < min_co2)
						atmos_suitable = FALSE
				if(max_co2)
					if(Environment.gas["carbon_dioxide"] > max_co2)
						atmos_suitable = FALSE

				//Atmos effect

				if(bodytemperature < minbodytemp)
					fire_alert = 2
					adjustBruteLoss(cold_damage_per_tick)
				else if(bodytemperature > maxbodytemp)
					fire_alert = 1
					adjustBruteLoss(heat_damage_per_tick)
				else
					fire_alert = 0

				if(!atmos_suitable)
					adjustBruteLoss(unsuitable_atoms_damage)

		if(!AI_inactive)
			//Speaking
			if(!client && speak_chance)
				if(rand(0,200) < speak_chance)
					visible_emote(emote_see)
					speak_audio()

			if(incapacitated())
				return TRUE

			//Movement
			turns_since_move++
			if(!client && !stop_automated_movement && wander && !anchored)
				if(isturf(loc) && !incapacitated() && canmove)		//This is so it only moves if it's not inside a closet, gentics machine, etc.
					if(turns_since_move >= turns_per_move)
						if(!(stop_automated_movement_when_pulled && pulledby)) //Soma animals don't move when pulled
							var/moving_to = 0 // otherwise it always picks 4, fuck if I know.   Did I mention fuck BYOND
							moving_to = pick(cardinal)
							set_dir(moving_to)			//How about we turn them the direction they are moving, yay.
							step_glide(src, moving_to, DELAY2GLIDESIZE(0.5 SECONDS))
							turns_since_move = 0

	return TRUE

/mob/living/simple_animal/proc/visible_emote(message)
	if(islist(message))
		message = safepick(message)
	if(message)
		visible_message("<span class='name'>[src]</span> [message]")

/mob/living/simple_animal/proc/handle_supernatural()
	if(purge)
		purge -= 1

//Simple reagent processing for simple animals
//This allows animals to digest food, and only food
//Most drugs, poisons etc, are designed to work on carbons and affect many values a simple animal doesnt have
/mob/living/simple_animal/proc/process_food()
	if (hunger_enabled)
		if (nutrition)
			nutrition -= nutrition_step//Bigger animals get hungry faster
			nutrition = max(0,min(nutrition, max_nutrition))//clamp the value
		else
			if (prob(3))
				to_chat(src, "You feel hungry...")

		if (!reagents || !reagents.total_volume)
			return

		for(var/datum/reagent/current in reagents.reagent_list)
			var/removed = min(current.metabolism*digest_factor, current.volume)
			if (istype(current, /datum/reagent/organic/nutriment))//If its food, it feeds us
				var/datum/reagent/organic/nutriment/N = current
				adjustMobNutrition(removed*N.nutriment_factor)
				var/heal_amount = removed*N.regen_factor
				if (bruteloss > 0)
					var/n = min(heal_amount, bruteloss)
					adjustBruteLoss(-n)
					heal_amount -= n
				if (fireloss && heal_amount)
					var/n = min(heal_amount, fireloss)
					adjustFireLoss(-n)
					heal_amount -= n
				updatehealth()
			current.remove_self(removed)//If its not food, it just does nothing. no fancy effects

/mob/living/simple_animal/proc/adjustMobNutrition(amount)
	nutrition += amount
	nutrition = max(0,min(nutrition, max_nutrition))	//clamp the value

/mob/living/simple_animal/can_eat()
	if (!hunger_enabled || nutrition > max_nutrition * 0.9)
		return 0//full

	else if (nutrition > max_nutrition * 0.8)
		return 1//content

	else return 2//hungry

/mob/living/simple_animal/gib()
	..(icon_gib,1)

/mob/living/simple_animal/bullet_act(obj/item/projectile/Proj, def_zone = null)
	if(!Proj)
		return

	if(Proj.nodamage)
		if(istype(Proj, /obj/item/projectile/ion))
			Proj.on_hit(loc)

	for(var/damage_type in Proj.damage_types)
		var/damage = Proj.damage_types[damage_type]
		var/dmult = 1
		if(faction in Proj.effective_faction)
			dmult += Proj.damage_mult
		if(is_type_in_list(src, Proj.supereffective_types, TRUE))
			dmult += Proj.supereffective_mult
		damage *= dmult
		if (!(Proj.testing))
			return damage_through_armor(damage, def_zone, attack_flag = Proj.check_armour, armor_divisor = Proj.armor_divisor, used_weapon = Proj, sharp = is_sharp(Proj), edge = has_edge(Proj), wounding_multiplier = Proj.wounding_mult, dmg_types = Proj.damage_types, return_continuation = TRUE)
	return FALSE

/mob/living/simple_animal/rejuvenate()
	..()
	activate_ai()
	health = maxHealth
	density = initial(density)
	update_icons()

/mob/living/simple_animal/attack_hand(mob/living/carbon/human/M as mob)
	..()

	switch(M.a_intent)

		if(I_HELP)
			if (health > 0)
				M.visible_message("\blue [M] [response_help] \the [src]")

		if(I_DISARM)
			M.visible_message("\blue [M] [response_disarm] \the [src]")
			M.do_attack_animation(src)
			//TODO: Push the mob away or something

/* //Couldn't seem to get this working, at some point I will revisit and fix this, but everytime you disarm a mob it ignores the weaken and doesn't fall over. -Kaz
		if (I_DISARM)
			if (!weakened && (prob(30) + (M.stats.getStat(STAT_ROB) * 0.1)))
				M.visible_message("\red [M] has knocked \the [src] over!")
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				Weaken(3)
			else
				M.visible_message("\red [M] failed to shove \the [src]")
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

			M.do_attack_animation(src)
*/
		if(I_GRAB)
			if (M == src)
				return
			if (!(status_flags & CANPUSH))
				return

			var/obj/item/grab/G = new /obj/item/grab(M, src)

			M.put_in_active_hand(G)

			G.synch()
			G.affecting = src
			LAssailant_weakref = WEAKREF(M)

			M.visible_message("\red [M] has grabbed [src] passively!")
			M.do_attack_animation(src)

		if (I_HURT) //TODOKAZ: Make it so it checks your racial unarmed attacks and modified the damage based on it + changes the attack text and sound played. -Kaz
			var/damage = 3
			if ((stat == CONSCIOUS) && prob(10))
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
				M.visible_message("\red [M] missed \the [src]")
			else
				if (istype(M))
					damage += max(0, (M.stats.getStat(STAT_ROB) / 10))
					if (HULK in M.mutations)
						damage *= 2

				playsound(loc, "punch", 25, 1, -1)
				M.visible_message("\red [M] punched \the [src]")

				adjustBruteLoss(damage)
				updatehealth()
				M.do_attack_animation(src)

	return

/mob/living/simple_animal/attackby(obj/item/O, mob/user)
	if(istype(O, /obj/item/gripper))
		return ..(O, user)

	else if(istype(O, /obj/item/reagent_containers) || istype(O, /obj/item/stack/medical))
		..()

	else if(meat_type && (stat == DEAD))	//if the animal has a meat, and if it is dead.
		if((QUALITY_CUTTING in O.tool_qualities) && user.a_intent ==  I_HELP)
			if(O.use_tool(user, src, WORKTIME_NORMAL, QUALITY_CUTTING, FAILCHANCE_NORMAL, required_stat = STAT_BIO))
				harvest(user)
	else
		O.attack(src, user, user.targeted_organ)

/mob/living/simple_animal/hit_with_weapon(obj/item/O, mob/living/user, effective_force, hit_zone)

	if(effective_force <= resistance)
		to_chat(user, SPAN_DANGER("This weapon is ineffective, it does no damage."))
		return 2
	effective_force -= resistance
	.=..(O, user, effective_force, hit_zone)

/mob/living/simple_animal/movement_delay()
	var/tally = MOVE_DELAY_BASE //Incase I need to add stuff other than "speed" later

	tally += speed
	if(purge)//Purged creatures will move more slowly. The more time before their purge stops, the slower they'll move.
		if(tally <= 0)
			tally = 1
		tally *= purge

	if (!nutrition)
		tally += 4

	return tally

/mob/living/simple_animal/get_status_tab_items()
	. = ..()

	if(show_stat_health)
		. += "Health: [round((health / maxHealth) * 100)]%"

/mob/living/simple_animal/death(gibbed, deathmessage = "dies!")
	SSmove_manager.stop_looping(src)
	movement_target = null
	icon_state = icon_dead
	density = FALSE
	AI_inactive = TRUE //Were dead
	target_mob = null
	return ..(gibbed,deathmessage)

/mob/living/simple_animal/ex_act(severity)
	flash(0, FALSE,FALSE,FALSE)
	switch (severity)
		if (1)
			adjustBruteLoss(500)
			gib()
			return

		if (2)
			adjustBruteLoss(60)

		if(3)
			adjustBruteLoss(30)

/mob/living/simple_animal/proc/SA_attackable(target_mob)
	if (isliving(target_mob))
		var/mob/living/L = target_mob
		if(!L.stat || L.health >= (ishuman(L) ? HEALTH_THRESHOLD_CRIT : 0))
			return (FALSE)
	if (istype(target_mob,/obj/mecha))
		var/obj/mecha/M = target_mob
		if (M.occupant)
			return FALSE
	if (istype(target_mob,/obj/machinery/bot))
		var/obj/machinery/bot/B = target_mob
		if(B.health > 0)
			return FALSE
	if (istype(target_mob,/obj/machinery/porta_turret))
		var/obj/machinery/porta_turret/P = target_mob
		if(P.health > 0)
			return FALSE
	return TRUE

/mob/living/simple_animal/get_speech_ending(verb, ending)
	return verb

/mob/living/simple_animal/put_in_hands(obj/item/W) // No hands.
	W.loc = get_turf(src)
	return TRUE

// Harvest an animal's delicious byproducts
/mob/living/simple_animal/proc/harvest(mob/user)
	var/actual_meat_amount = max(1,(meat_amount/2))
	drop_embedded()
	if(ishuman(user))
		if(user.stats.getPerk(PERK_BUTCHER))
			var/actual_leather_amount = max(0,(leather_amount/2))
			if(actual_leather_amount > 0 && (stat == DEAD))
				for(var/i=0;i<actual_leather_amount;i++)
					new /obj/item/stack/material/leather(get_turf(src))

			var/actual_bones_amount = max(0,(bones_amount/2))
			if(actual_bones_amount > 0 && (stat == DEAD))
				for(var/i=0;i<actual_bones_amount;i++)
					new /obj/item/stack/material/bone(get_turf(src))

			if(has_special_parts && has_rare_parts && prob(50))
				for(var/animal_part in rare_parts)
					new animal_part(get_turf(src))
			else
				for(var/animal_part in special_parts)
					new animal_part(get_turf(src))

	if(meat_type && actual_meat_amount > 0 && (stat == DEAD))
		for(var/i=0;i<actual_meat_amount;i++)
			if(ispath(src.meat_type, /obj/item/reagent_containers/food/snacks/meat))
				var/obj/item/reagent_containers/food/snacks/meat/butchered_meat = new meat_type(get_turf(src))
				butchered_meat.name = "[src.name] [butchered_meat.name]"
				butchered_meat.initialize_genetics(src)
			else
				var/obj/item/non_meat = new meat_type(get_turf(src))
				non_meat.name = "[src.name] [non_meat.name]"
		if(issmall(src))
			if(user != src)
				user.visible_message(SPAN_DANGER("[user] chops up \the [src]!"))
			new blood_from_harvest(get_turf(src))
			qdel(src)
		else
			if(ishuman(user))
				if(user.stats.getPerk(PERK_BUTCHER))
					if(user != src)
						user.visible_message(SPAN_DANGER("[user] butchers \the [src] cleanly!"))
					new blood_from_harvest(get_turf(src))
				qdel(src)
			else
				gib()

//Code to handle finding and nomming nearby food items
/mob/living/simple_animal/proc/handle_foodscanning()
	if (client || !autoseek_food)
		return FALSE

	//Feeding, chasing food, FOOOOODDDD
	if(!incapacitated())

		turns_since_scan++
		if(turns_since_scan >= scan_interval)
			turns_since_scan = FALSE
			if(movement_target && (!(isturf(movement_target.loc) || ishuman(movement_target.loc)) || (foodtarget && !can_eat()) ))
				movement_target = null
				foodtarget = FALSE
				stop_automated_movement = FALSE
			if(!movement_target || !(movement_target.loc in oview(src, 7)) )
				if (stat != DEAD)
					SSmove_manager.move_to(src,0)
				movement_target = null
				foodtarget = FALSE
				stop_automated_movement = FALSE
				if (can_eat())
					for(var/obj/item/reagent_containers/food/snacks/S in oview(src,7))
						if(isturf(S.loc) || ishuman(S.loc))
							movement_target = S
							foodtarget = TRUE
							break

					//Look for food in people's hand
					if (!movement_target && beg_for_food)
						var/obj/item/reagent_containers/food/snacks/F = null
						for(var/mob/living/carbon/human/H in oview(src,scan_range))
							if(istype(H.l_hand, /obj/item/reagent_containers/food/snacks))
								F = H.l_hand

							if(istype(H.r_hand, /obj/item/reagent_containers/food/snacks))
								F = H.r_hand

							if (F)
								movement_target = F
								foodtarget = TRUE
								break

			if(movement_target)
				scan_interval = min_scan_interval
				stop_automated_movement = TRUE

				if (istype(movement_target.loc, /turf))
					if (stat != DEAD)
						SSmove_manager.move_to(src, movement_target, 0, seek_move_delay)//Stand ontop of food
				else if (stat != DEAD)
					SSmove_manager.move_to(src,movement_target.loc,1, seek_move_delay)//Don't stand ontop of people



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

//For picking up small animals
/mob/living/simple_animal/MouseDrop(atom/over_object)
	if (holder_type)//we need a defined holder type in order for picking up to work
		var/mob/living/carbon/H = over_object
		if(!istype(H) || !Adjacent(H))
			return ..()

		get_scooped(H, usr)
		return
	return ..()

/*
/mob/living/simple_animal/handle_fire()
	return

/mob/living/simple_animal/update_fire()
	return
/mob/living/simple_animal/IgniteMob()
	return
/mob/living/simple_animal/ExtinguishMob()		no simplmobs made of abestos anymore
	return
*/

//I wanted to call this proc alert but it already exists.
//Basically makes the mob pay attention to the world, resets sleep timers, awakens it from a sleeping state sometimes
/mob/living/simple_animal/proc/poke(force_wake = 0)
	if (stat != DEAD)
		if (force_wake || (!client && prob(30)))
			wake_up()

//Puts the mob to sleep
/mob/living/simple_animal/proc/fall_asleep()
	if (stat != DEAD)
		resting = TRUE
		stat = UNCONSCIOUS
		canmove = FALSE
		wander = FALSE
		walk_to(src,0)
		update_icons()

//Wakes the mob up from sleeping
/mob/living/simple_animal/proc/wake_up()
	if (stat != DEAD)
		stat = CONSCIOUS
		resting = FALSE
		canmove = TRUE
		wander = TRUE
		update_icons()

/mob/living/simple_animal/update_icons()
	if (stat == DEAD)
		icon_state = icon_dead
	else if ((stat == UNCONSCIOUS || resting) && icon_rest)
		icon_state = icon_rest
	else if (icon_living)
		icon_state = icon_living

/mob/living/simple_animal/lay_down()
	set name = "Rest"
	set category = "Abilities"
	if(resting)
		wake_up()
	else if (!resting)
		fall_asleep()
	to_chat(src, span("notice","You are now [resting ? "resting" : "getting up"]"))
	update_icons()

//This is called when an animal 'speaks'. It does nothing here, but descendants should override it to add audio
/mob/living/simple_animal/proc/speak_audio()
	return

//Animals are generally good at falling, small ones are immune
/mob/living/simple_animal/get_fall_damage()
	return mob_size - 1

/mob/living/simple_animal/electrocute_act(shock_damage, obj/source, siemens_coeff = 1, def_zone = null)
	shock_damage *= siemens_coeff
	if (shock_damage<1)
		return FALSE

	src.apply_damage(shock_damage, BURN, def_zone, used_weapon="Electrocution")
	playsound(loc, "sparks", 50, 1, -1)
	if (shock_damage > 15)
		src.visible_message(
			"\red [src] was shocked by the [source]!", \
			"\red <B>You feel a powerful shock course through your body!</B>", \
			"\red You hear a heavy electrical crack." \
		)
		Stun(10)//This should work for now, more is really silly and makes you lay there forever
		Weaken(10)
	else
		src.visible_message(
			"\red [src] was mildly shocked by the [source].", \
			"\red You feel a mild shock course through your body.", \
			"\red You hear a light zapping." \
		)

	var/datum/effect/effect/system/spark_spread/s = new /datum/effect/effect/system/spark_spread
	s.set_up(5, 1, loc)
	s.start()

	return shock_damage

//Putting this here do to no idea were it would fit other then here
/mob/living/simple_animal/verb/toggle_AI()
	set name = "Toggle AI"
	set desc = "Toggles on/off the mobs AI."
	set category = "Mob verbs"

	if (AI_inactive)
		activate_ai()
		to_chat(src, SPAN_NOTICE("You toggle the mobs default AI to ON."))
		return
	else
		AI_inactive = TRUE
		to_chat(src, SPAN_NOTICE("You toggle the mobs default AI to OFF."))
