#define SEISMIC_MIN 1
#define SEISMIC_MAX 6
GLOBAL_LIST_INIT(termite_waves, list(/datum/termite_wave/dormant,
                                  	 /datum/termite_wave/negligible,
                                  	 /datum/termite_wave/typical,
                                  	 /datum/termite_wave/substantial,
                                  	 /datum/termite_wave/major,
                                  	 /datum/termite_wave/abnormal))

/datum/termite_wave
	var/burrow_count  // Total number of burrows spawned over the course of drilling
	var/burrow_interval  // Number of seconds that pass between each new burrow spawns
	var/termite_spawn  // Number of termites spawned by each burrow on spawn event
	var/spawn_interval  // Number of seconds that pass between spawn events of burrows
	var/special_probability  // Probability of a termite being a special one instead of a normal one
	var/mineral_multiplier  // A multiplier of materials excavated by the drill

/datum/termite_wave/dormant
	burrow_count = 2
	burrow_interval = 120 SECONDS
	termite_spawn = 2
	spawn_interval = 120 SECONDS
	special_probability = 5
	mineral_multiplier = 1.0

/datum/termite_wave/negligible
	burrow_count = 3
	burrow_interval = 100 SECONDS
	termite_spawn = 2
	spawn_interval = 100 SECONDS
	special_probability = 10
	mineral_multiplier = 1.4

/datum/termite_wave/typical
	burrow_count = 3
	burrow_interval = 80 SECONDS
	termite_spawn = 3
	spawn_interval = 80 SECONDS
	special_probability = 15
	mineral_multiplier = 1.7

/datum/termite_wave/substantial
	burrow_count = 4
	burrow_interval = 70 SECONDS
	termite_spawn = 3
	spawn_interval = 70 SECONDS
	special_probability = 4
	mineral_multiplier = 20

/datum/termite_wave/major
	burrow_count = 5
	burrow_interval = 60 SECONDS
	termite_spawn = 4
	spawn_interval = 60 SECONDS
	special_probability = 35
	mineral_multiplier = 2.3

/datum/termite_wave/abnormal
	burrow_count = 7
	burrow_interval = 45 SECONDS
	termite_spawn = 4
	spawn_interval = 45 SECONDS
	special_probability = 30
	mineral_multiplier = 3.0
