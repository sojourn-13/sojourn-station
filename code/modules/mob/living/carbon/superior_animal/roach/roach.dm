/mob/living/carbon/superior/roach
	name = "Kampfer Roach"
	desc = "A monstrous, dog-sized cockroach. These huge mutants can be everywhere where humans are, on ships, planets and stations."
	icon = 'icons/mob/mobs-roach.dmi'
	icon_state = "roach"

	mob_size = MOB_SMALL

	density = 0 //Swarming roaches! They also more robust that way.

	attack_sound = 'sound/voice/insect_battle_bite.ogg'
	emote_see = list("chirps loudly.", "cleans its whiskers with forelegs.")
	turns_per_move = 4
	turns_since_move = 0

	get_stat_modifier = FALSE//NNNNNOPE, having hoard enemies get these has caused massive issues for balance. These should be limited to actual serious mobs from here on out.

	armor = list(melee = 2, bullet = 0, energy = 0, bomb = 5, bio = 20, rad = 0, agony = 0)

	allowed_stat_modifiers = list(
		/datum/stat_modifier/mob/living/carbon/superior/biosilicified = 26,
		/datum/stat_modifier/mob/living/carbon/superior/lambertian = 16,
		/datum/stat_modifier/mob/living/carbon/superior/durable = 42,
		/datum/stat_modifier/mob/living/speed/flat/positive/low = 9,
	)

	meat_type = /obj/item/reagent_containers/snacks/meat/roachmeat
	meat_amount = 2
	leather_amount = 0
	bones_amount = 0

	maxHealth = 15 * ROACH_HEALTH_MOD
	health = 15 * ROACH_HEALTH_MOD

	var/blattedin_revives_left = 3 // how many times blattedin can get us back to life (as num for adminbus fun).
	//The common roach, gets to live 4 times, same as a roachling. They have so much to live for.
	melee_damage_lower = 3
	melee_damage_upper = 4
	var/knockdown_odds = 1 //1% KO odds

	min_breath_required_type = 3
	min_air_pressure = 15 //below this, brute damage is dealt

	faction = "roach"
	pass_flags = PASSTABLE
	acceptableTargetDistance = 3 //consider all targets within this range equally
	randpixel = 12
	overkill_gib = 16

	sanity_damage = 0.5

	fleshcolor = "#666600"
	bloodcolor = "#666600"

	var/taming_window = 30 //How long you have to tame this roach, once it's pacified.
	eating_time = 2 MINUTES // how long it will take to eat/lay egg
	var/busy_start_time // when it started eating/laying egg

	var/atom/eat_target // target that the roach wants to eat
	var/fed = 0 // roach gets fed after eating a corpse
	var/probability_egg_laying = 75 // probability to lay an egg

	var/snacker = FALSE

	do_friendly_fire_chance = 100

	colony_friend = FALSE
	friendly_to_colony = FALSE

	known_languages = list(LANGUAGE_CHTMANT)

	inherent_mutations = list(MUTATION_ROACH_BLOOD, MUTATION_DEAF, MUTATION_TOURETTES, MUTATION_EPILEPSY)
	fancy_attack_overlay = "roach_attack_flick"

/mob/living/carbon/superior/roach/New()
	..()

/mob/living/carbon/superior/roach/isValidAttackTarget(var/atom/O)
	if (isliving(O))
		var/mob/living/L = O
		if(L.faction=="sproachder")
			return
	return ..(O)

//When roaches die near a leader, the leader may call for reinforcements
/mob/living/carbon/superior/roach/death()
	.=..()
	if (.)
		for (var/mob/living/carbon/superior/roach/fuhrer/F in range(src,8))
			F.distress_call()

/mob/living/carbon/superior/roach/Destroy()
	eat_target = null //should fix the support roach GC fail

	. = ..()

/mob/living/carbon/superior/roach/doTargetMessage()
	. = ..()

	playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
