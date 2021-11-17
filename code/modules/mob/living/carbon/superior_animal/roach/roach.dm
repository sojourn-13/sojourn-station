/mob/living/carbon/superior_animal/roach
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

	give_randomized_armor = TRUE //We get randomized addition armor

	armor = list(melee = 10, bullet = 5, energy = 0, bomb = 5, bio = 20, rad = 0, agony = 0)

	meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat
	meat_amount = 2
	leather_amount = 0
	bones_amount = 0

	maxHealth = 15
	health = 15

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

	colony_friend = FALSE
	friendly_to_colony = FALSE

	known_languages = list(LANGUAGE_CHTMANT)

	inherent_mutations = list(MUTATION_ROACH_BLOOD, MUTATION_DEAF, MUTATION_TOURETTES, MUTATION_EPILEPSY)

/mob/living/carbon/superior_animal/roach/New()
	..()

/mob/living/carbon/superior_animal/roach/isValidAttackTarget(var/atom/O)
	if (isliving(O))
		var/mob/living/L = O
		if(L.faction=="sproachder")
			return
	return ..(O)

//When roaches die near a leader, the leader may call for reinforcements
/mob/living/carbon/superior_animal/roach/death()
	.=..()
	if (.)
		for (var/mob/living/carbon/superior_animal/roach/fuhrer/F in range(src,8))
			F.distress_call()
