//Random mob spawners unique to sojourn, these should primarily be ones for the colony and surrounding areas.
//renders
/obj/random/mob/render
	name = "random render"
	icon_state = "hostilemob-brown"
	alpha = 128

/obj/random/mob/render/item_to_spawn()
	return /mob/living/simple_animal/hostile/render

/obj/random/mob/render/low_chance
	name = "low chance render"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 90

//Genetic Ambusher
/*
/obj/random/mob/ambusher
	name = "random ambusher"
	icon_state = "hostilemob-brown-low"
	alpha = 128

/obj/random/mob/ambusher/item_to_spawn()
	return pickweight(list(/mob/living/carbon/superior_animal/shadow))

/obj/random/mob/ambusher/low_chance
	name = "low chance ambusher"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 95 // These things should not be escaping from science often.
*/
//Carps

/obj/random/mob/carp
	name = "random carp"
	icon_state = "hostilemob-purple"
	alpha = 128
	mobs = list(/mob/living/simple_animal/hostile/carp = 9,
		/mob/living/simple_animal/hostile/carp/baby = 7,
		/mob/living/simple_animal/hostile/carp/pike = 6,
		/mob/living/simple_animal/hostile/carp/shark = 2,
		/mob/living/simple_animal/hostile/carp/greatwhite = 0.5
		)

/obj/random/mob/carp/item_to_spawn()
	return pickweight(mobs)

/obj/random/mob/carp/low_chance
	name = "low chance random carp"
	icon_state = "hostilemob-purple-low"
	spawn_nothing_percentage = 60

//croakers
/obj/random/mob/croaker
	name = "random croaker"
	icon_state = "hostilemob-brown"
	alpha = 128

/obj/random/mob/croaker/item_to_spawn()
	return /mob/living/simple_animal/hostile/retaliate/croakerlord

/obj/random/mob/croaker/low_chance
	name = "low chance croaker"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 90

//humanoids
/obj/random/mob/voidwolf
	name = "random void wolf"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/human/voidwolf = 9,
		/mob/living/carbon/superior_animal/human/voidwolf/fieldtech = 2,
		/mob/living/carbon/superior_animal/human/voidwolf/ranged = 4,
		/mob/living/carbon/superior_animal/human/voidwolf/fieldtech/ranged = 4,
		/mob/living/carbon/superior_animal/human/voidwolf/captain = 0.5
		)

/obj/random/mob/voidwolf/item_to_spawn()
	return pickweight(mobs)

/obj/random/mob/voidwolf/low_chance
	name = "low chance random void wolf"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

/obj/random/mob/excelsior
	name = "random excelsior" //about a 50/50 chance to have a corpse, or an excel agent
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/obj/landmark/corpse/excelsior = 10,
		/mob/living/carbon/superior_animal/human/excelsior = 2,
		/mob/living/carbon/superior_animal/human/excelsior/excel_ppsh = 2,
		/mob/living/carbon/superior_animal/human/excelsior/excel_ak = 2,
		/mob/living/carbon/superior_animal/human/excelsior/excel_vintorez = 2,
		/mob/living/carbon/superior_animal/human/excelsior/excel_drozd = 2,
		/mob/living/carbon/superior_animal/human/excelsior/excel_hammer_shield = 2,
		/mob/living/carbon/superior_animal/human/excelsior/excel_hammer_shield/batton = 2
		)

/obj/random/mob/excelsior/item_to_spawn()
	return pickweight()

/obj/random/mob/excelsior/low_chance
	name = "low chance random excelsior"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

//psionic monsters
/obj/random/mob/psi_monster
	name = "random psi_monster"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/psi_monster = 9,
				//trash
				/mob/living/carbon/superior_animal/psi_monster/memory_eater = 8,
				/mob/living/carbon/superior_animal/psi_monster/thought_melter = 8,
				/mob/living/carbon/superior_animal/psi_monster/pus_maggot = 8,
				//robust
				/mob/living/carbon/superior_animal/psi_monster/ponderous = 6,
				/mob/living/carbon/superior_animal/psi_monster/hovering_nightmare = 6,
				/mob/living/carbon/superior_animal/psi_monster/licker = 6,
				/mob/living/carbon/superior_animal/psi_monster/memory = 6,
				/mob/living/carbon/superior_animal/psi_monster/flesh_tower = 6,
				//impressive
				/mob/living/carbon/superior_animal/psi_monster/flesh_behemoth = 2,
				/mob/living/carbon/superior_animal/psi_monster/mind_gazer = 3,
				/mob/living/carbon/superior_animal/psi_monster/pus_maggot/ash_wendigo = 4,
				/mob/living/carbon/superior_animal/psi_monster/cerebral_crusher = 4
				)

//At higher levels we throw in CRAZY NOT CONNECTED TO THE REAL CULT daskvey TYPE MOBS, they are harder to fight with less
/obj/random/mob/psi_monster/item_to_spawn()
	if(GLOB.chaos_level > 0)
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/wasonce/crimson_jelly = (2 * GLOB.chaos_level))

	if(GLOB.chaos_level > 1)
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/wasonce/crimson_jelly/pitch_horror = (0.5 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/weakling/deepmaints_bound = (0.5 * GLOB.chaos_level))

	if(GLOB.chaos_level > 2)
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/deepmaints_bound = (0.5 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/cleaver/deepmaints_bound = (0.3 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/laser/deepmaints_bound = (0.2 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/shield/deepmaints_bound = (0.2 * GLOB.chaos_level))

	if(GLOB.chaos_level > 3)
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/plasma/deepmaints_bound = (0.2 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/smg/deepmaints_bound = (0.2 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/rifle/deepmaints_bound = (0.1 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/halberd/deepmaints_bound = (0.2 * GLOB.chaos_level))

	if(GLOB.chaos_level > 4)
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/orb_shooter/deepmaints_bound = (0.2 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/daskvey_follower/orb_master/deepmaints_bound = (0.2 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/psi_monster/ploge = (0.1 * GLOB.chaos_level)) //Once admin only

	return pickweight(mobs)

/obj/random/mob/psi_monster_mega_fauna
	name = "random mega psi monster"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/psi_monster/dreaming_king = 1,
				/mob/living/carbon/superior_animal/psi_monster/dreaming_king/hound_crown =1,
				)

/obj/random/mob/psi_monster_mega_fauna/item_to_spawn()
	return pickweight(mobs)

/obj/random/mob/psi_monster/low_chance
	name = "low chance random psi_monster"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/psi_monster
	name = "cluster of psi_monsters"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 3
	max_amount = 6
	spread_range = 0

/obj/random/cluster/psi_monster/item_to_spawn()
	return /obj/random/mob/psi_monster

/obj/random/cluster/psi_monster/low_chance
	name = "low chance cluster of psi_monsters"
	icon_state = "hostilemob-brown-cluster-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/psi_monster/lower_chance
	name = "lower chance cluster of psi_monsters"
	icon_state = "hostilemob-brown-cluster-low"
	spawn_nothing_percentage = 80

/obj/random/cluster/psi_monster/maggot_death_gasp
	name = "3 to 6 pus maggots"
	icon_state = "hostilemob-brown"
	alpha = 128

/obj/random/cluster/psi_monster/maggot_death_gasp/item_to_spawn()
	return /mob/living/carbon/superior_animal/psi_monster/pus_maggot/summoned

//xenomorphs
/obj/random/mob/xenomorphs
	name = "random xenomorph"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/xenomorph = 9,
				//trash
				/mob/living/carbon/superior_animal/xenomorph/sentinel = 8,
				/mob/living/carbon/superior_animal/xenomorph/hunter = 8,
				/mob/living/carbon/superior_animal/xenomorph/runner = 8,
				/mob/living/carbon/superior_animal/xenomorph/runner/panther = 8,
				/mob/living/carbon/superior_animal/xenomorph/spitter = 8,
				//robust
				/mob/living/carbon/superior_animal/xenomorph/warrior = 6,
				/mob/living/carbon/superior_animal/xenomorph/defender = 6,
				/mob/living/carbon/superior_animal/xenomorph/warrior/shrike = 6,
				/mob/living/carbon/superior_animal/xenomorph/warrior/bull = 6,
				/mob/living/carbon/superior_animal/xenomorph/spitter/boiler = 6,
				//impressive
				/mob/living/carbon/superior_animal/xenomorph/warrior/bull/crusher = 4,
				/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/screecher = 4,
				/mob/living/carbon/superior_animal/xenomorph/runner/ravager = 4,
				/mob/living/carbon/superior_animal/xenomorph/warrior/defiler = 4,
				/mob/living/carbon/superior_animal/xenomorph/warrior/hivelord = 4)

/obj/random/mob/xenomorphs/item_to_spawn()
	if(GLOB.chaos_level > 0)
		mobs += list(/mob/living/carbon/superior_animal/xenomorph/warrior/praetorian = (0.5 * GLOB.chaos_level))
		mobs += list(/mob/living/carbon/superior_animal/xenomorph/warrior/shrike/praetorian/queen = (0.1 * GLOB.chaos_level))

	return pickweight(mobs)

/obj/random/mob/xenomorphs/low_chance
	name = "low chance random xenomorph"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/xenomorphs
	name = "cluster of xenomorphs"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 3
	max_amount = 9
	spread_range = 0
	var/list/mobs = list()

/obj/random/cluster/xenomorphs/screacher_removed_and_megafuna
	name = "random xenomorph without megafana and screecher"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/xenomorph = 9,
				//trash
				/mob/living/carbon/superior_animal/xenomorph/sentinel = 8,
				/mob/living/carbon/superior_animal/xenomorph/hunter = 8,
				/mob/living/carbon/superior_animal/xenomorph/runner = 8,
				/mob/living/carbon/superior_animal/xenomorph/runner/panther = 8,
				/mob/living/carbon/superior_animal/xenomorph/spitter = 8,
				//robust
				/mob/living/carbon/superior_animal/xenomorph/warrior = 6,
				/mob/living/carbon/superior_animal/xenomorph/defender = 6,
				/mob/living/carbon/superior_animal/xenomorph/warrior/bull = 6,
				/mob/living/carbon/superior_animal/xenomorph/spitter/boiler = 6,
				//impressive
				/mob/living/carbon/superior_animal/xenomorph/warrior/bull/crusher = 4,
				/mob/living/carbon/superior_animal/xenomorph/runner/ravager = 4,
				/mob/living/carbon/superior_animal/xenomorph/warrior/defiler = 4,
				/mob/living/carbon/superior_animal/xenomorph/warrior/hivelord = 4)

/obj/random/cluster/xenomorphs/screacher_removed_and_megafuna/item_to_spawn()
	return pickweight(mobs)

/obj/random/cluster/xenomorphs/item_to_spawn()
	return /obj/random/mob/xenomorphs

/obj/random/cluster/xenomorphs/low_chance
	name = "low chance cluster of xenomorphs"
	icon_state = "hostilemob-brown-cluster-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/xenomorphs/lower_chance
	name = "lower chance cluster of xenomorphs"
	icon_state = "hostilemob-brown-cluster-low"
	spawn_nothing_percentage = 80

//Preppers
/obj/random/mob/prepper
	name = "random prepper base mob"
	icon_state = "hostilemob-cyan"
	alpha = 128
	mobs = list(/mob/living/simple_animal/hostile/hivebot = 16,
		/mob/living/simple_animal/hostile/hivebot/range = 12,
		/mob/living/simple_animal/hostile/republicon = 16,
		/mob/living/simple_animal/hostile/republicon/range = 8,
		)

//This is made out of a 100 fo easyer math
/obj/random/mob/prepper/item_to_spawn()
	if(GLOB.chaos_level > 2)
		mobs += list(/mob/living/carbon/superior_animal/sentinal_seeker = (0.1 * GLOB.chaos_level))

	return pickweight(mobs)

/obj/random/mob/prepper_boss_lowchance
	name = "low chance sentinel seeker"
	icon_state = "hostilemob-red"
	alpha = 128
	spawn_nothing_percentage = 90 // Same HP and stats as a Render while being as fast as an Emperor.

/obj/random/mob/prepper_boss_lowchance/item_to_spawn()
	return /mob/living/carbon/superior_animal/sentinal_seeker

/obj/random/mob/prepper_ranged
	name = "random prepper base mob (range only)"
	icon_state = "hostilemob-blue"
	alpha = 128
	mobs = list(/mob/living/simple_animal/hostile/hivebot/range = 3,
		/mob/living/simple_animal/hostile/republicon/range = 1
		)

/obj/random/mob/prepper_ranged/item_to_spawn()
	return pickweight(mobs)


//local fauna - surface
/obj/random/mob/tengolo
	name = "random tengolo"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/simple_animal/hostile/tengbrute = 20,
		/mob/living/simple_animal/hostile/tengstalker = 10,
		/mob/living/simple_animal/hostile/tengcharge = 20,
		/mob/living/simple_animal/hostile/hell_pig = 2,
		/mob/living/simple_animal/hostile/hell_pig/slepnir = 2,
		/mob/living/simple_animal/hostile/hell_pig/wendigo = 2
		)

/obj/random/mob/tengolo/item_to_spawn()
	return pickweight(mobs)

/obj/random/mob/tengolo/low_chance
	name = "low chance random tengolo"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

/obj/random/cluster/tengolo
	name = "cluster of tengolos"
	icon_state = "hostilemob-brown-cluster"
	alpha = 128
	min_amount = 2
	max_amount = 4
	spread_range = 0

/obj/random/cluster/tengolo/item_to_spawn()
	return /obj/random/mob/tengolo

/obj/random/mob/tahca
	name = "random tahca"
	icon_state = "hostilemob-brown"
	alpha = 128

/obj/random/mob/tahca/item_to_spawn()
	return /mob/living/simple_animal/hostile/retaliate/tahca

/obj/random/mob/tahca/low_chance
	name = "low chance tahca"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

/obj/random/mob/mukwah
	name = "random mukwah"
	icon_state = "hostilemob-brown"
	alpha = 128

/obj/random/mob/mukwah/item_to_spawn()
	return /mob/living/simple_animal/hostile/bear/mukwah

/obj/random/mob/mukwah/low_chance
	name = "low chance mukwah"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

//hakhma beetle - seperate due to hakhma being roach aligned
/obj/random/mob/hakhma
	name = "random hakhma"
	icon_state = "hostilemob-brown"
	alpha = 128

/obj/random/mob/hakhma/item_to_spawn()
	return /mob/living/simple_animal/hostile/retaliate/hakhma

/obj/random/mob/hakhma/low_chance
	name = "low chance hakhma"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

//Underground Mobs
//local fauna - random
/obj/random/mob/undergroundmob
	name = "random underground mob"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/wurm = 20,
		/mob/living/carbon/superior_animal/wurm/silver = 15,
		/mob/living/carbon/superior_animal/wurm/osmium = 10,
		/mob/living/simple_animal/hostile/sargoyle = 20,
		/mob/living/simple_animal/hostile/helldiver = 10,
		/obj/random/mob/nightmare = 1
		)

/obj/random/mob/undergroundmob/item_to_spawn()
	return pickweight(mobs)

/obj/random/mob/undergroundmob/low_chance
	name = "low chance random underground mob"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 60

//nightmares - Used for their potential or dedicated spawns since their more prolific
/obj/random/mob/nightmare
	name = "random nightmare"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/simple_animal/hostile/nightmare = 99,
			/mob/living/simple_animal/hostile/nightmare/dream_daemon = 1)

/obj/random/mob/nightmare/item_to_spawn()
	return pickweight(mobs) //If you get this spawn your unlucky

/obj/random/mob/nightmare/low_chance
	name = "low chance nightmare"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 90


//Voxy
/obj/random/mob/vox
	name = "random vox"
	icon_state = "hostilemob-brown"
	alpha = 128
	mobs = list(/mob/living/carbon/superior_animal/vox = 8,
		/mob/living/carbon/superior_animal/vox/posin_thrower = 3,
		/mob/living/carbon/superior_animal/vox/thrower_spear = 4,
		/mob/living/carbon/superior_animal/vox/armord = 6,
		/mob/living/carbon/superior_animal/vox/hider = 4,
		/mob/living/carbon/superior_animal/vox/ashen = 6,
		/mob/living/carbon/superior_animal/vox/weak = 10,
		/mob/living/carbon/superior_animal/vox/rage = 4
		)

/obj/random/mob/vox/item_to_spawn()
	return pickweight(mobs)

/obj/random/mob/vox/low_chance
	name = "low chance vox"
	icon_state = "hostilemob-brown-low"
	spawn_nothing_percentage = 50 //Coin flip


#define LUNA	/mob/living/carbon/superior_animal/lodge/cerberus/chimera/moon
#define SOLIS	/mob/living/carbon/superior_animal/lodge/cerberus/chimera/sun

// Bit flags to check which twins has spawned
#define LUNA_FLAG 1
#define SOLIS_FLAG 2

/obj/random/mob/luna_solis
	name = "random Luna and Solis"
	alpha = 128
	has_postspawn = TRUE

	// I use those vars to prevent duplicates when trying to spawn the two of them.
	var/spawned_twin = 0
	var/twin_chance = 5 // The chance, in percentages, that we get both Luna and Solis instead of one of the two

	item_to_spawn() // Spawn one of the two chimera twins
		. = pick(LUNA, SOLIS) // '.' is the default return value, we're using it instead of directly using 'return' because we want to check what we got.
		switch(.)
			if(LUNA)
				spawned_twin |= LUNA_FLAG
			if(SOLIS)
				spawned_twin |= SOLIS_FLAG

	post_spawn()
		if(prob(twin_chance))
			if(!(spawned_twin & LUNA_FLAG))
				new LUNA(src.loc)
			if(!(spawned_twin & SOLIS_FLAG))
				new SOLIS(src.loc)

#undef LUNA
#undef SOLIS
#undef LUNA_FLAG
#undef SOLIS_FLAG
