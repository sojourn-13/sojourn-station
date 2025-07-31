//Space bears!
/mob/living/simple/hostile/bear
	name = "black bear"
	desc = "A bear of the common black bear variety."
	icon = 'icons/mob/mobs-bear.dmi'
	icon_state = "bearfloor"
	icon_gib = "bear_gib"
	icon_dead = "bear_dead"
	speak_emote = list("growls", "roars")
	emote_see = list("stares ferociously", "stomps")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/reagent_containers/snacks/meat/bearmeat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	stop_automated_movement_when_pulled = 0
	maxHealth = 60
	health = 60
	melee_damage_lower = 20
	melee_damage_upper = 30
	attack_sound = 'sound/effects/creatures/maul.ogg'
	leather_amount = 6
	bones_amount = 4
	special_parts = list(/obj/item/animal_part/wolf_tooth)
	faction = "russian"
	inherent_mutations = list(MUTATION_EPILEPSY, MUTATION_THICK_FUR, MUTATION_IMBECILE, MUTATION_NERVOUSNESS)
	var/horror_modifer = TRUE // For-admins to turn this off
	var/rawr_cooldown = FALSE
	research_value = 200

/mob/living/simple/hostile/bear/FindTarget()
	. = ..()
	if(.)
		playsound(src, 'sound/effects/creatures/bear.ogg', 100, 1, -3)

/mob/living/simple/hostile/bear/proc/rawr_xd()
	if(health >= 15) //to weak to rawr if less then 15 health
		visible_message(SPAN_DANGER("[src] stands up and roars!"))
		playsound(src, 'sound/effects/creatures/bear.ogg', 100, 1, -3)
		for(var/mob/living/carbon/human/H in range(5,src))
			if(istype(H))
				if(prob(100 - H.stats.getStat(STAT_VIG))) //Kinda a hard check-ish but cant stack
					H.stats.addTempStat(STAT_VIG, -STAT_LEVEL_ADEPT, 30 SECONDS, "fear_of_bear")
					H.stats.addTempStat(STAT_COG, -STAT_LEVEL_ADEPT, 30 SECONDS, "fear_of_bear")
					H.stats.addTempStat(STAT_BIO, -STAT_LEVEL_ADEPT, 30 SECONDS, "fear_of_bear")
					H.stats.addTempStat(STAT_MEC, -STAT_LEVEL_ADEPT, 30 SECONDS, "fear_of_bear")
					H.stats.addTempStat(STAT_ROB, STAT_LEVEL_ADEPT, 30 SECONDS, "fear_of_bear")
					H.stats.addTempStat(STAT_TGH, STAT_LEVEL_ADEPT, 30 SECONDS, "fear_of_bear")
					H.added_movedelay -= 0.1
					addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, clear_movement_delay), -0.1), 60)
					to_chat(H, SPAN_WARNING("\The [src] 's roar triggers the familiar feeling of flight or fight in you!"))
				else
					to_chat(H, SPAN_NOTICE("The natural insticts of fear become apparent, but you ignore such things."))
					H.stats.addTempStat(STAT_VIG, STAT_LEVEL_ADEPT, 30 SECONDS, "fear_of_bear")
					H.stats.addTempStat(STAT_TGH, STAT_LEVEL_ADEPT, 30 SECONDS, "fear_of_bear")
					H.stats.addTempStat(STAT_ROB, STAT_LEVEL_ADEPT, 30 SECONDS, "fear_of_bear")
					H.added_movedelay -= 0.1
					addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, clear_movement_delay), -0.1), 60) //Needs to be a negative as it subtracts meaning its - - 0.1 (aka doble negitive so it adds)

		anchored = TRUE
		addtimer(CALLBACK(src, PROC_REF(unanchor)), 10)


/mob/living/simple/hostile/bear/proc/unanchor()
	anchored = FALSE
	addtimer(CALLBACK(src, PROC_REF(rawr_xd_recharge)), 120) //should be tolds of time for people to kill the bear

/mob/living/simple/hostile/bear/proc/rawr_xd_recharge()
	rawr_cooldown = FALSE

//Copy pasted for hostile.dm more complicated verson
/mob/living/simple/hostile/bear/MoveToTarget()
	var/mob/living/targetted_mob = (target_mob?.resolve())

	stop_automated_movement = TRUE
	if(!targetted_mob || SA_attackable(targetted_mob))
		stance = HOSTILE_STANCE_IDLE
	if(targetted_mob in ListTargets(10))
		if(!anchored)
			if(ranged)
				if(prob(45))
					stance = HOSTILE_STANCE_ATTACKING
					set_glide_size(DELAY2GLIDESIZE(move_to_delay))
					SSmove_manager.move_to(src, targetted_mob, 1, move_to_delay)
				else
					OpenFire(targetted_mob)
			else
				stance = HOSTILE_STANCE_ATTACKING
				set_glide_size(DELAY2GLIDESIZE(move_to_delay))
				SSmove_manager.move_to(src, targetted_mob, 1, move_to_delay)

	if(horror_modifer && !rawr_cooldown)
		rawr_xd()
		rawr_cooldown = TRUE
	return FALSE

/mob/living/simple/hostile/bear/hudson
	name = "Hudson"
	desc = "A legendary black space bear. It's quite sparkly."
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "space_bear"
	icon_gib = "bear_gib"
	icon_dead = "space_bear_dead"
	maxHealth = 120
	health = 120
	melee_damage_lower = 30
	melee_damage_upper = 40
	research_value = 350

/mob/living/simple/hostile/bear/brown
	name = "brown bear"
	desc = "A bear of the common brown bear variety."
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "brownbear"
	icon_gib = "brownbear_gib"
	icon_dead = "brownbear_dead"
	research_value = 220

/mob/living/simple/hostile/bear/polar
	name = "polar bear"
	desc = "A bear of the uncommon polar bear variety."
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "polarbear"
	icon_gib = "brownbear_gib"
	icon_dead = "polarbear_dead"
	research_value = 250

/mob/living/simple/hostile/bear/excelsior
	name = "excelsior armored bear"
	desc = "A huge bear outfitted with armor and trained by the excelsior judging from the markings on his armor. Who comes up with this shit?"
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "pokes"
	icon_state = "combatbear"
	icon_gib = "brownbear_gib"
	icon_dead = "combatbear_dead"
	faction = "excelsior"
	armor = list(melee = 5, bullet = 3, energy = 1, bomb = 10, bio = 100, rad = 100, agony = 0) // It's an ARMORED bear
	maxHealth = 300 * EXCELSIOR_HEALTH_MOD
	health = 300 * EXCELSIOR_HEALTH_MOD
	melee_damage_lower = 30
	melee_damage_upper = 40
	special_parts = list(/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth)
	research_value = 600

// Credit to scar#1579 for the sprite.
/mob/living/simple/hostile/bear/mukwah
	name = "mukwah"
	desc = "A bear that escaped from the abandoned zoo labs before mutating into a creature known as a mukwah. Unlike a standard bear, a mukwah is much more powerful, a heavy hitter that is \
	slow but with a strength that exceeds even other powerful fauna."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "yaoguai"
	icon_dead = "yaoguai_dead"
	maxHealth = 300 * MEGAFAUNA_HEALTH_MOD
	health = 300 * MEGAFAUNA_HEALTH_MOD
	melee_damage_lower = 40 //Low health but an extremely powerful hitter
	melee_damage_upper = 50 //You call 400 HP LOW HEALTH?! - Seb //I got you Seb...little better now.
	leather_amount = 10
	bones_amount = 10
	pixel_x = -16
	special_parts = list(/obj/item/animal_part/wolf_tooth,/obj/item/animal_part/wolf_tooth)
	research_value = 1500
