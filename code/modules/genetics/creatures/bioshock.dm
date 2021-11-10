//Oh by glob
//An Admin-only creature for acquiring and testing mutations. 
/mob/living/simple_animal/hostile/bioshock
	name = "Bioshock"
	desc = "Has every mutation in it. Every one Hex hadn't tested yet, at least"
	faction = "diyaab"
	icon_state = "diyaab"
	icon_living = "diyaab"
	icon_dead = "diyaab_dead"
	move_to_delay = 2
	maxHealth = 25
	health = 25
	colony_friend = 1;
	friendly_to_colony = 1;
	speed = 1
	melee_damage_lower = 1
	melee_damage_upper = 5
	attacktext = "gouged"
	cold_damage_per_tick = 0
	speak_chance = 5
	speak = list("Awrr?","Aowrl!","Worrl")
	emote_see = list("sniffs the air cautiously","looks around")
	emote_hear = list("snuffles")
	pass_flags = PASSTABLE
	density = 0
	mob_size = 3
	meat_amount = 10
	inherent_mutations = list(
		MUTATION_COW_SKIN,
		MUTATION_IMBECILE,
		MUTATION_MOO,
		MUTATION_GIGANTISM,
		MUTATION_RAND_UNSTABLE,
		MUTATION_EPILEPSY,
		MUTATION_COUGHING,
		MUTATION_CLUMSY,
		MUTATION_TOURETTES,
		MUTATION_NERVOUSNESS,
		MUTATION_BLINDNESS,
		MUTATION_DEAF,
		MUTATION_NEARSIGHTED,
		MUTATION_EMP,
		MUTATION_ROACH_BLOOD,
		MUTATION_CHOC_MILK,
		MUTATION_PROT_MILK,
		MUTATION_ROBUST_MILK,
		MUTATION_NO_PAIN,
		MUTATION_ROACH_FRIEND,
		MUTATION_SPIDER_FRIEND,
		MUTATION_SPROACHDER_FRIEND,
		MUTATION_PSN_BREATH,
		MUTATION_CLOAKING,
		MUTATION_GREATER_CLOAKING)
	clone_difficulty = CLONE_EASY