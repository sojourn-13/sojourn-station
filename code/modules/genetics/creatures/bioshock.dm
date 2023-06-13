//Oh by glob
//An Admin-only creature for acquiring and testing mutations.
/mob/living/simple_animal/hostile/bioshock
	name = "Bioshock"
	desc = "Has a ton of mutations in it!"
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
		MUTATION_GIGANTISM,
		MUTATION_DWARFISM,
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
		MUTATION_GREATER_CLOAKING,
		MUTATION_GOLD_ROACH,
		MUTATION_BAROTRAUMA,
		MUTATION_THICK_FUR,
		MUTATION_BOTTOMLESS_BELLY,
		MUTATION_TOXIN_RESISTANCE,
		MUTATION_ECHOLOCATION,
		MUTATION_CAT_EYES,
		MUTATION_BLOOD_BANK,
		MUTATION_BOMB_RESIST,
		MUTATION_TERMITE_FRIEND,
		MUTATION_WURM_CRY,
		MUTATION_FLAME_RETARDANT,
		MUTATION_SPARK_BREATH,
		MUTATION_PHASE,
		MUTATION_FRIENDLY)
	clone_difficulty = CLONE_EASY

/mob/living/simple_animal/hostile/bioshock/organs
	name = "Organshock"
	desc = "Has a ton of organs in it!"
	inherent_mutations = list(
		MUTATION_HEART,
		MUTATION_B_HEART,
		MUTATION_LUNG,
		MUTATION_G_LUNG,
		MUTATION_LIVER,
		MUTATION_G_LIVER,
		MUTATION_BLOOD_VESSEL,
		MUTATION_E_BLOOD_VESSEL,
		MUTATION_MUSCLES,
		MUTATION_S_MUSCLES,
		MUTATION_NERVES,
		MUTATION_S_NERVES,
		MUTATION_SAC,
		MUTATION_G_SAC,
		MUTATION_HYPERION,
		MUTATION_MARQUA_EYES,
		MUTATION_EYES,
		MUTATION_SLIME_BONE)

/mob/living/simple_animal/hostile/bioshock/disabled
	name = "disabledshock"
	desc = "This poor little bastard."
	inherent_mutations = list(
		MUTATION_IMBECILE,
		MUTATION_MOO,
		MUTATION_RAND_UNSTABLE,
		MUTATION_EPILEPSY,
		MUTATION_COUGHING,
		MUTATION_CLUMSY,
		MUTATION_TOURETTES,
		MUTATION_NERVOUSNESS,
		MUTATION_BLINDNESS,
		MUTATION_DEAF,
		MUTATION_NEARSIGHTED,
		MUTATION_MKNEWAIFUHAIR,
		MUTATION_UNBALANCED,
		MUTATION_HONK,
		MUTATION_SCREAMING,
		MUTATION_NO_PRINTS,
		MUTATION_NO_BREATHE,
		MUTATION_HULK)
