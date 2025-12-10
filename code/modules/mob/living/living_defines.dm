/mob/living
	see_in_dark = 7 //Makes it easier for most mobs
	see_invisible = SEE_INVISIBLE_LIVING

	//Health and life related vars
	maxHealth = 100 //Maximum health that should be possible.
	health = 100 	//A mob's health

	var/hud_updateflag = 0

	var/death_threshold = HEALTH_THRESHOLD_SOFTCRIT

	var/life_cycles_before_sleep = 60
	var/life_cycles_before_scan = 360

	var/stasis = FALSE
	var/AI_inactive = FALSE

	var/inventory_shown = 1

	var/melee_damage_lower = 0
	var/melee_damage_upper = 0

	var/list/projectile_damage_increment = list()
	var/list/projectile_damage_mult = list()
	var/inherent_projectile_mult = 1
	var/inherent_projectile_increment = 0

	var/projectile_speed_increment = 0
	var/projectile_speed_mult = 1

	/// The mob groups, defined in admin.dm, this mob is in. Stored as keys.
	var/list/groups_in = list()
	/// The buildmode holders this mob is currently selected by.
	var/list/obj/effect/bmode/buildholder/selected_by = list()

	var/armor_divisor = 1 //Used for generic attacks
	var/projectile_armor_divisor_adjustment = 0
	var/projectile_armor_divisor_mult = 1

	//Damage related vars, NOTE: THESE SHOULD ONLY BE MODIFIED BY PROCS
	var/bruteloss = 0.0	//Brutal damage caused by brute force (punching, being clubbed by a toolbox ect... this also accounts for pressure damage)
	var/oxyloss = 0.0	//Oxygen depravation damage (no air in lungs)
	var/toxloss = 0.0	//Toxic damage caused by being poisoned or radiated
	var/fireloss = 0.0	//Burn damage caused by being way too hot, too cold or burnt.
	var/cloneloss = 0	//Damage caused by being cloned or ejected from the cloner early. slimes also deal cloneloss damage to victims
	var/brainloss = 0	//'Retardation' damage caused by someone hitting you in the head with a bible or being infected with brainrot.
	var/halloss = 0		//Hallucination damage. 'Fake' damage obtained through hallucinating or the holodeck. Sleeping should cause it to wear off.

	var/injury_type = INJURY_TYPE_LIVING //Humanmob uses species instead

	var/last_special = 0 //Used by the resist verb, likely used to prevent players from bypassing next_move by logging in/out.

	var/t_plasma = null
	var/t_oxygen = null
	var/t_sl_gas = null
	var/t_n2 = null

	var/now_pushing = null
	var/mob_bump_flag = 0
	var/mob_swap_flags = 0
	var/mob_push_flags = 0
	var/mob_always_swap = 0
	var/move_to_delay = 4 //delay for the automated movement.
	var/livmomentum = 0 //Used for advanced movement options.
	var/can_burrow = FALSE //If true, this mob can travel around using the burrow network.
	//When this mob spawns at roundstart, a burrow will be created near it if it can't find one

	var/mob/living/cameraFollow = null
	var/step_count = 0

	var/tod = null // Time of death
	var/update_slimes = 0
	var/is_busy = FALSE // Prevents stacking of certain actions, like resting and diving
	var/silent = 0 		// Can't talk. Value goes down every life proc.

	var/failed_last_breath = 0 //This is used to determine if the mob failed a breath. If they did fail a brath, they will attempt to breathe each tick, otherwise just once per 4 ticks.
	var/possession_candidate // Can be possessed by ghosts if unplayed.

	var/eye_blind = 0	//Carbon
	var/eye_blurry = 0	//Carbon
	var/ear_damage = 0	//Carbon
	var/stuttering = 0	//Carbon
	var/flash_mod = 0	//Carbon
	var/slurring = 0	//Carbon
	var/slowdown = 0
	var/job = null//Living

	var/additional_darksight = 0	//Added to darksight

	var/image/static_overlay // For static over-lays on living mobs
	mob_classification = CLASSIFICATION_ORGANIC

	var/list/chem_effects = list()

	//Inactive Mutations populated at spawn, meant to reflect integral parts of this creature's DNA
	var/list/inherent_mutations = list()

	//Mutations populated through horrendous genetic tampering.
	var/datum/genetics/genetics_holder/unnatural_mutations

	//Task-Mastery - Gained by doing completely random tasks
	var/datum/task_master/labourer/learnt_tasks


	//How much material is used by the cloning process
	var/clone_difficulty = CLONE_MEDIUM

	var/is_watching = TRUE  //used for remote viewing of multiz structures
	var/can_multiz_pb = FALSE // used for point-blanking people that camp ladders.

	//Used in living/recoil.dm
	var/recoil = 0 //What our current recoil level is
	var/recoil_reduction_timer
	var/falls_mod = 1
	var/mob_bomb_defense = 0	// protection from explosives
	var/mod_climb_delay = 1 // delay for climb
	var/noise_coeff = 1 //noise coefficient
	var/brute_mod_perk = 1 //this and the ones below adjust various damages via perks
	var/burn_mod_perk = 1 //Please make any and all adjustments multiplicative only for all damage mods
	var/toxin_mod_perk = 1
	var/oxy_mod_perk = 1

	var/list/drop_items = list() //Held items a creature can drop when they die. Accessed through drop_death_loot()

	var/target_dummy = FALSE // Simple yes no if we are when spotted targeted over **everything** esle, used for simple and super mobs.

	//Redays to make mobs faster or slower on attacking
	var/delay_for_range = 0 SECONDS
	var/delay_for_rapid_range = 0 SECONDS
	var/delay_for_melee = 0 SECONDS
	var/delay_for_all = 0 SECONDS

	//vars pertaining to the mob's relation to atmos and if they are on fire
	var/never_stimulate_air = FALSE
	var/min_air_pressure = 50 //below this, brute damage is dealt
	var/max_air_pressure = 300 //above this, brute damage is dealt
	var/min_bodytemperature = 200 //below this, burn damage is dealt
	var/max_bodytemperature = 360 //above this, burn damage is dealt
	var/on_fire = 0 //The "Are we on fire?" var
	var/fire_stacks
	var/next_onfire_brn = 0 //burn
	var/waterproof = FALSE
	var/tmp/current_fluid_depth = 0
	var/tmp/last_drown_tick = 0

	/// Icon used for speechbubbles
	var/bubble_icon = "default"

	var/mob_ablative_armor = 0
	var/ablative_retaining = ABLATION_SKIN
