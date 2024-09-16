/mob/living/carbon/superior_animal/xenomorph/warrior
	name = "warrior"
	desc = "A xenomorph warrior, the sturdier and more lethal step up from the sentinal."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "warrior"
	icon_living = "warrior"
	icon_dead = "warrior_dead"
	icon_rest = "warrior_stunned"

	maxHealth = 60
	health = 60
	flash_resistances = 8 //Weak xeno dies to like 3 hits of most things, lets not make it to easy
	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/carbon/superior_animal/xenomorph/defender
	name = "defender"
	desc = "A xenomorph defender, while not as lethal as a warrior it makes up for it in being hellishly sturdy."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "defender"
	icon_living = "defender"
	icon_dead = "defender_dead"
	icon_rest = "defender_stunned"
	flash_resistances = 3 //Meant to be a weaker tank let them weakly tank
	maxHealth = 140
	health = 140

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike
	name = "shrike"
	desc = "A xenomorph shrike, what it loses in defense and power it makes up for in its power shriek."
	icon_state = "shrike"
	icon_living = "shrike"
	icon_dead = "shrike_dead"
	icon_rest = "shrike_stunned"

	maxHealth = 40
	health = 40
	flash_resistances = 1 //Not really an issue to be flashing now is it?
	melee_damage_lower = 10
	melee_damage_upper = 15
	var/cooldown_time = 30 SECONDS
	var/cooldown = 0

var/datum/xenomorph/xeno_morph_ai

/datum/xenomorph
	var/list/global_abilities_cooldown = list()

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/Life()
	if((stat != CONSCIOUS)||!canmove||resting||lying||stasis||AI_inactive)
		return // Shrikes don't get to scream when passed out or dead
	.=..()
	if (world.time - cooldown_time < cooldown)
		return

	var/can_scream = FALSE
	for(var/mob/living/target in targets_in_range(in_hear_range = TRUE))
		if(target.stat == CONSCIOUS && target.faction != "xenomorph")
			if(isdeaf(target))
				continue
			if(ishuman(target))
				var/mob/living/carbon/human/H = target
				if(istype(H.l_ear, /obj/item/clothing/ears/earmuffs) && istype(H.r_ear, /obj/item/clothing/ears/earmuffs))
					continue
				use_ability(target)
				can_scream = TRUE
	if(can_scream)
		flick("[icon_state]_shriek", src)
		playsound(src, 'sound/xenomorph/4_xeno_roars.ogg', 200, 1)
		cooldown = world.time

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/proc/use_ability(mob/living/target)

	var/mob/living/carbon/human/H = target
	if(istype(H))
		if(prob(100 - H.stats.getStat(STAT_VIG)))
			H.Weaken(4)
			to_chat(H, SPAN_WARNING("A horrifying roar of primal soul-less terror sears through your mind!"))
		else
			to_chat(H, SPAN_NOTICE("You hear the horrifying roar of a soul-less monster but block out any fear!"))
	else
		target.Weaken(4)
		to_chat(target, SPAN_WARNING("A horrifying roar of primal soul-less terror sears through your mind!"))

/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/proc/targets_in_range(var/range = world.view, var/in_hear_range = FALSE)
	var/list/range_list = list()
	var/list/target_list = list()
	if(in_hear_range)
		range_list = hearers(range, src)
	else
		range_list = range(range, src)
	for(var/atom/movable/M in range_list)
		var/mob/target = M.get_mob()
		if(target)
			target_list += target
	return target_list

/mob/living/carbon/superior_animal/xenomorph/warrior/bull
	name = "bull"
	desc = "A xenomorph bull, while it has horns the real threat is the weight behind the strike, likely to knock someone down."
	icon_state = "bull"
	icon_living = "bull"
	icon_dead = "bull_dead"
	icon_rest = "bull_stunned"

	maxHealth = 100
	health = 100
	attack_sound = list('sound/xenomorph/alien_bite1.ogg', 'sound/xenomorph/alien_bite2.ogg')
	melee_damage_lower = 20
	melee_damage_upper = 25

/mob/living/carbon/superior_animal/xenomorph/spitter/boiler
	name = "boiler"
	desc = "A xenomorph boiler, the more evolved spitter, with far more toxic chemicals leaking from its maw and with an annoying habit of exploding on death."
	icon = 'icons/mob/Xenos_2x2.dmi'
	icon_state = "boiler"
	icon_living = "boiler"
	icon_dead = "boiler_dead"
	icon_rest = "boiler_stunned"
	deathmessage = "explodes violently as it dies!"

	maxHealth = 50
	health = 50
	melee_damage_lower = 15
	melee_damage_upper = 20
	flash_resistances = 0

	move_to_delay = 6
	turns_per_move = 18
