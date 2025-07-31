/mob/living/simple/hostile/retaliate/clown
	name = "Clown"
	desc = "A denizen of clown planet."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "clown"
	icon_living = "clown"
	turns_per_move = 20
	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	speak = list("HONK!", "Honk!", "Isn't it beautiful?", "Is it just me, or is it getting crazier out there?", "There is no punchline. It's not a joke.", "You don't listen, do you?", "You get what you fucking deserve.", "I had a bad day.", "Everyone is awful these days.", "Remember, that's life!")
	emote_see = list("honks", "squeaks")
	speak_chance = 10
	a_intent = I_HURT
	maxHealth = 175
	health = 175
	speed = -1
	move_to_delay = 1
	turns_per_move = 15
	vision_range = 12
	harm_intent_damage = 8
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_sound = 'sound/items/bikehorn.ogg'
	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 270
	maxbodytemp = 370
	heat_damage_per_tick = 15	//amount of damage applied if animal's body temperature is higher than maxbodytemp
	cold_damage_per_tick = 10	//same as heat_damage_per_tick, only if the bodytemperature it's lower than minbodytemp
	unsuitable_atoms_damage = 10
	leather_amount = 0
	bones_amount = 0

	var/banana_time = 0 // If there's no time set it won't spawn.
	var/banana_type = /obj/item/bananapeel
	var/attack_reagent
	research_value = 400

/mob/living/simple/hostile/retaliate/clown/Life()
	. = ..()
//	if(banana_time && banana_time < world.time)
//		var/turf/T = get_turf(src)
//		var/list/adjacent =  T.GetAtmosAdjacentTurfs(1)
//		new banana_type(pick(adjacent))
//		banana_time = world.time + rand(30,60)

/mob/living/simple/hostile/retaliate/clown/AttackingTarget()
	var/mob/living/targetted_mob = (target_mob?.resolve())

	. = ..()
	if(attack_reagent && . && isliving(targetted_mob))
		var/mob/living/L = targetted_mob
		if(L.reagents)
			L.reagents.add_reagent(attack_reagent, rand(1,5))

/mob/living/simple/hostile/retaliate/clown/death()
	..()
	visible_message("<b>[src]</b> explodes in a shower of banana guts!")
	new /obj/effect/gibspawner/clown(src.loc)
	new /obj/item/bananapeel(src.loc)
	qdel(src)
	return


/mob/living/simple/hostile/retaliate/clown/lube
	name = "Living Lube"
	desc = "A puddle of lube brought to life by the honkmother."
	icon_state = "lube"
	icon_living = "lube"
	turns_per_move = 1
	response_help = "dips a finger into"
	response_disarm = "dip a finger into"
	response_harm = "splats"
	emote_see = list("bubbles.", "oozes.")
	attack_reagent = "arectine"
	research_value = 300

/mob/living/simple/hostile/retaliate/clown/giggles
	name = "Giggles"
	desc = "Why?"
	icon_state = "giggles"
	icon_living = "giggles"
	research_value = 500

/mob/living/simple/hostile/retaliate/clown/banana
	name = "Clownana"
	desc = "A fusion of clown and banana DNA birthed from a botany experiment gone wrong."
	icon_state = "banana tree"
	icon_living = "banana tree"
	response_help = "peels"
	response_disarm = "peels"
	response_harm = "peels"
	turns_per_move = 1
	speak = list("HONK", "Honk!", "YA-HONK!!!")
	emote_see = list("honks.", "bites into the banana.", "plucks a banana off its head.", "photosynthesizes.")
	maxHealth = 250
	health = 250
	speed = -10
	banana_time = 20
	research_value = 600

/mob/living/simple/hostile/retaliate/clown/pie
	name = "Pie spewer"
	desc = "He loves giving out creampies."
	icon_state = "pie spewer"
	icon_living = "pie spewer"
	turns_per_move = 1
	speak = list("HONK", "Honk!", "YA-HONK!!!")
	emote_see = list("honks.", "sticks his fingers in a pie.", "smears pie on his face.", "creams.")
	maxHealth = 250
	health = 250
	speed = -10
	banana_time = 40
	banana_type = /obj/item/reagent_containers/snacks/pie
	research_value = 600

/mob/living/simple/hostile/retaliate/clown/honkling
	name = "Honkling"
	desc = "A divine being sent by the Honkmother to spread joy. It's not dangerous, but it's a bit of a nuisance."
	icon_state = "honkling"
	icon_living = "honkling"
	turns_per_move = 1
	speed = -10
	maxHealth = 1000
	health = 1000
	harm_intent_damage = 1
	melee_damage_lower = 1
	melee_damage_upper = 1
	attacktext = "cheers up"
	research_value = 1500

/mob/living/simple/hostile/retaliate/clown/stacked
	name = "Clowns"
	desc = "You can hear them humming circus music."
	icon_state = "clowns"
	icon_living = "clowns"
	turns_per_move = 1
	speed = -10
	maxHealth = 125
	health = 125
	harm_intent_damage = 10
	melee_damage_lower = 10
	melee_damage_upper = 10
	attacktext = "punches in unison"
	pixel_x = -20
	research_value = 700

/mob/living/simple/hostile/retaliate/clown/fleshclown
	name = "Fleshclown"
	desc = "A being forged out of the pure essence of pranking, cursed into existence by a cruel maker."
	icon_state = "fleshclown"
	icon_living = "fleshclown"
	response_help = "reluctantly pokes"
	response_disarm = "reluctantly pokes"
	response_harm = "cleanse the world of"
	speak = list("HONK", "Honk!", "I didn't ask for this", "I feel constant and horrible pain", "YA-HONK!!!", "this body is a merciless and unforgiving prison", "I was born out of mirthful pranking but I live in suffering")
	emote_see = list("honks.", "sweats.", "jiggles.", "contemplates its existence.")
	speak_chance = 15
	maxHealth = 300
	health = 300
	speed = -5
	melee_damage_upper = 15
	attacktext = "limply slaps"
	research_value = 800

/mob/living/simple/hostile/retaliate/clown/longface
	name = "Longface"
	desc = "Often found walking into the bar."
	icon_state = "long face"
	icon_living = "long face"
	turns_per_move = 10
	response_help = "tries to awkwardly hug"
	response_disarm = "pushes the unwieldy frame of"
	response_harm = "tries to shut up"
	speak = list("YA-HONK!!!")
	emote_see = list("honks.", "squeaks.")
	speak_chance = 60
	maxHealth = 400
	health = 400
	pixel_x = -16
	speed = 10
	harm_intent_damage = 5
	melee_damage_lower = 5
	attacktext = "YA-HONKs"
	research_value = 900

/mob/living/simple/hostile/retaliate/clown/scary
	name = "Copyright Infringement"
	desc = "Somebody is going to get fucking sued. Oh and this clown is stupidly deadly."
	icon_state = "scary_clown"
	icon_living = "scary_clown"
	turns_per_move = 10
	response_help = "tries to meme"
	response_disarm = "hates"
	response_harm = "tries to cover up"
	speak = list("Hiya Georgie!", "Nobody tell Stephen I'm here!", "Well all float down here...", "I'm contractually obligated to tell you that I'm not a reference to any existing clowns.")
	emote_see = list("honks", "squeaks")
	speak_chance = 60
	maxHealth = 50
	health = 50
	speed = 10
	harm_intent_damage = 30
	melee_damage_lower = 40
	attacktext = "copyright claims"
	research_value = 1000

/mob/living/simple/hostile/retaliate/clown/clownhulk
	name = "Honk Hulk"
	desc = "A cruel and fearsome clown. Don't make him angry."
	icon_state = "honkhulk"
	icon_living = "honkhulk"
	response_help = "tries desperately to appease"
	response_disarm = "foolishly pushes"
	response_harm = "angers"
	speak = list("HONK", "Honk!", "HAUAUANK!!!", "GUUURRRRAAAHHH!!!")
	emote_see = list("honks.", "sweats.", "grunts.")
	speak_chance = 5
	maxHealth = 900
	health = 900
	pixel_x = -16
	speed = 2
	melee_damage_lower = 40
	melee_damage_upper = 50
	attacktext = "pummels"
	research_value = 2000

/mob/living/simple/hostile/retaliate/clown/clownhulk/chlown
	name = "Chlown"
	desc = "A real lunkhead who somehow gets all the girls."
	icon_state = "chlown"
	icon_living = "chlown"
	response_help = "submits to"
	response_disarm = "tries to assert dominance over"
	response_harm = "makes a weak beta attack at"
	speak = list("HONK", "Honk!", "Bruh", "cheeaaaahhh?")
	emote_see = list("asserts his dominance.", "emasculates everyone implicitly.")
	maxHealth = 2000
	health = 2000
	speed = -2
	melee_damage_lower = 20
	melee_damage_upper = 25
	attacktext = "steals the girlfriend of"
	attack_sound = 'sound/items/Airhorn.ogg'
	research_value = 3000

/mob/living/simple/hostile/retaliate/clown/clownhulk/honcmunculus
	name = "Honkmunculus"
	desc = "A slender wiry figure of alchemical origin."
	icon_state = "honkmunculus"
	icon_living = "honkmunculus"
	response_help = "skeptically pokes"
	response_disarm = "pushes the unwieldy frame of"
	speak = list("honk")
	emote_see = list("squirms.", "writhes.")
	speak_chance = 1
	maxHealth = 300
	health = 300
	speed = -5
	melee_damage_lower = 15
	melee_damage_upper = 20
	attacktext = "ferociously mauls"
	attack_reagent = "mindbreaker"
	research_value = 2200

/mob/living/simple/hostile/retaliate/clown/clownhulk/destroyer
	name = "The Destroyer"
	desc = "An ancient being born of arcane honking."
	icon_state = "destroyer"
	icon_living = "destroyer"
	response_disarm = "bounces off of"
	response_harm = "bounces off of"
	speak = list("HONK!!!", "The Honkmother is merciful, so I must act out her wrath.", "parce mihi ad beatus honkmother placet mihi ut peccata committere.", "DIE!!!")
	maxHealth = 1200
	health = 1200
	speed = 5
	melee_damage_lower = 20
	melee_damage_upper = 40
	attacktext = "acts out divine vengeance on"
	research_value = 4000

/mob/living/simple/hostile/retaliate/clown/mutant
	name = "Unknown"
	desc = "Kill it for its own sake."
	icon_state = "mutant"
	icon_living = "mutant"
	turns_per_move = 10
	response_help = "reluctantly sinks a finger into"
	response_disarm = "squishes into"
	response_harm = "squishes into"
	speak = list("aaaaaahhhhuuhhhuhhhaaaaa", "AAAaaauuuaaAAAaauuhhh", "huuuuuh... hhhhuuuooooonnnnkk", "HuaUAAAnKKKK")
	emote_see = list("squirms.", "writhes.", "pulsates.", "froths.", "oozes.")
	speak_chance = 10
	maxHealth = 200
	health = 200
	pixel_x = -16
	speed = -5
	melee_damage_lower = 10
	melee_damage_upper = 20
	attacktext = "awkwardly flails at"
	research_value = 1200

/mob/living/simple/hostile/retaliate/clown/mutant/blob
	name = "Something that was once a clown"
	desc = "A grotesque bulging figure far mutated from it's original state."
	icon_state = "blob"
	icon_living = "blob"
	speak = list("hey, buddy", "HONK!!!", "H-h-h-H-HOOOOONK!!!!", "HONKHONKHONK!!!", "HEY, BUCKO, GET BACK HERE!!!", "HOOOOOOOONK!!!")
	emote_see = list("jiggles.", "wobbles.")
	maxHealth = 400
	health = 400
	mob_size = MOB_LARGE
	speed = 20
	attacktext = "bounces off of"
	attack_reagent = "mindbreaker"
	research_value = 1800

