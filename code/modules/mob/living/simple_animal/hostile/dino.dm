/mob/living/simple/hostile/dino
	name = "primal render yearling"
	desc = "A younger primal render, one that has yet to harden its scales, shed the baby fat, \
	and grow its usual horns and claws. Unlike older ones it has yet to become as fantastically violent to everything, \
	a trait that often gets it hunted by older renders to kill potential developing rivals."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "biglizard"
	icon_dead = "biglizard_dead"
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	speed = 4
	faction = "pond"
	health = 400
	maxHealth = 400
	melee_damage_lower = 20
	melee_damage_upper = 25
	attacktext = "bitten"
	attack_sound = 'sound/weapons/bite.ogg'
	minbodytemp = 200
	maxbodytemp = 370
	heat_damage_per_tick = 15
	cold_damage_per_tick = 10
	unsuitable_atoms_damage = 10
	min_oxy = 0
	max_oxy = 0
	min_tox = 0
	max_tox = 0
	min_co2 = 0
	max_co2 = 0
	min_n2 = 0
	max_n2 = 0
	leather_amount = 6 //The amount of leather sheets dropped.
	bones_amount = 6 //The amount of bone sheets dropped.
	mob_size = MOB_LARGE
	sanity_damage = 1
	research_value = 600

/mob/living/simple/hostile/dino/tagilla
	faction = "neutral"
	name = "Tagilla"
	desc = "A younger primal render, one that has yet to harden its scales, \
	shed the baby fat, and grow its usual horns and claws. Unlike older ones it has yet to become as fantastically violent to everything, \
	a trait that often gets it hunted by older renders to kill potential developing rivals. His older brother, Killa, is said to be a legendary render. \
	Something tells you he absolutely hates Blackshield."
	colony_friend = TRUE
	speed = 1
	health = 1200
	maxHealth = 1200
	melee_damage_lower = 40
	melee_damage_upper = 45
	friendly_to_colony = TRUE
	sanity_damage = -1
	research_value = 1200

/mob/living/simple/hostile/dino/tagilla/FindTarget()
	var/atom/T = null
	stop_automated_movement = 0
	for(var/atom/A in ListTargets(vision_range))

		if(A == src)
			continue

		var/atom/F = Found(A)
		if(F)
			T = F
			break

		if(isliving(A))
			var/mob/living/L = A
			if(istype(L,/mob/living/carbon/human))
				var/mob/living/carbon/human/thetarget = L
				if(thetarget.mind?.assigned_job?.department_flag == BLACKSHIELD)
					if(istype(L.lastarea,/area/nadezhda/pros/prep) || istype(L.lastarea,/area/nadezhda/pros/foreman))
						if(!SA_attackable(thetarget))
							stance = HOSTILE_STANCE_ATTACK
							T = L
							break
			if(L.faction == src.faction && !attack_same)
				continue
			if(L.colony_friend && src.colony_friend)
				continue
			else if(L in friends)
				continue
			else
				if(!SA_attackable(L))
					stance = HOSTILE_STANCE_ATTACK
					T = L
					break

		else if(istype(A, /obj/mecha) && !friendly_to_colony) // Our line of sight stuff was already done in ListTargets().
			var/obj/mecha/M = A
			if (M.occupant)
				stance = HOSTILE_STANCE_ATTACK
				T = M
				break

		if(istype(A, /obj/machinery/bot) && !friendly_to_colony)
			var/obj/machinery/bot/B = A
			if (B.health > 0)
				stance = HOSTILE_STANCE_ATTACK
				T = B
				break

		if(istype(A, /obj/machinery/porta_turret) && !friendly_to_colony)
			var/obj/machinery/porta_turret/P = A
			if (P.health > 0)
				stance = HOSTILE_STANCE_ATTACK
				T = P
				break

	return T
