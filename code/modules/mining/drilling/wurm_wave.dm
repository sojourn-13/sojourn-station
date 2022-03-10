#define SEISMIC_MIN 1
#define SEISMIC_MAX 6
GLOBAL_LIST_INIT(wurm_waves, list(/datum/wurm_wave/dormant,
                                   /datum/wurm_wave/negligible,
                                   /datum/wurm_wave/typical,
                                   /datum/wurm_wave/substantial,
                                   /datum/wurm_wave/major,
                                   /datum/wurm_wave/abnormal))

/datum/wurm_wave
	var/burrow_count  // Total number of burrows spawned over the course of drilling
	var/burrow_interval  // Number of seconds that pass between each new burrow spawns
	var/wurm_spawn  // Number of wurms spawned by each burrow on spawn event
	var/spawn_interval  // Number of seconds that pass between spawn events of burrows
	var/special_probability  // Probability of a wurm being a special one instead of a normal one
	var/mineral_multiplier  // A multiplier of materials excavated by the drill

/datum/wurm_wave/dormant
	burrow_count = 2
	burrow_interval = 15 SECONDS
	wurm_spawn = 2
	spawn_interval = 12 SECONDS
	special_probability = 0
	mineral_multiplier = 1.0

/datum/wurm_wave/negligible
	burrow_count = 3
	burrow_interval = 15 SECONDS
	wurm_spawn = 2
	spawn_interval = 12 SECONDS
	special_probability = 4
	mineral_multiplier = 1.1

/datum/wurm_wave/typical
	burrow_count = 3
	burrow_interval = 12 SECONDS
	wurm_spawn = 3
	spawn_interval = 9 SECONDS
	special_probability = 3
	mineral_multiplier = 1.2

/datum/wurm_wave/substantial
	burrow_count = 4
	burrow_interval = 12 SECONDS
	wurm_spawn = 3
	spawn_interval = 9 SECONDS
	special_probability = 3
	mineral_multiplier = 1.35

/datum/wurm_wave/major
	burrow_count = 5
	burrow_interval = 10 SECONDS
	wurm_spawn = 4
	spawn_interval = 7 SECONDS
	special_probability = 3
	mineral_multiplier = 1.5

/datum/wurm_wave/abnormal
	burrow_count = 7
	burrow_interval = 9 SECONDS
	wurm_spawn = 4
	spawn_interval = 6 SECONDS
	special_probability = 2
	mineral_multiplier = 2.0