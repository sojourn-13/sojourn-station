/mob/living/carbon/superior_animal
	name = "superior animal"
	desc = "You should not see this."

	mob_bump_flag = SIMPLE_ANIMAL
	mob_swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	mob_push_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	mob_size = MOB_SMALL //MOB_MINISCULE MOB_TINY MOB_SMALL MOB_MEDIUM MOB_LARGE
	a_intent = I_HURT
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "tomato"

	var/eating_time = 900

	var/moved = FALSE
	var/move_attack_mult = 0.6

	var/do_gibs = TRUE //Do we gib?
	var/gibspawner_type = /obj/effect/gibspawner/generic //what we use as are gib spawner
	//Not to be confused with - gibspawner
	var/icon_living
	var/icon_dead
	var/icon_rest //resting/unconscious animation
	var/icon_gib //gibbing animation
	var/icon_dust //dusting animation
	var/dust_remains = /obj/effect/decal/cleanable/ash //what remains if mob turns to dust
	var/randpixel = 9 //Mob may be offset randomly on both axes by this much

	var/overkill_gib = 17 //0 to disable, gib when at maxHealth*2 brute loss and hit with at least overkill_gib brute damage
	var/overkill_dust = 20 //0 to disable, dust when at maxHealth*2 fire loss and hit with at least overkill_dust fire damage, or from 2*max_bodytemperature

	var/emote_see = list() //chat emotes
	var/speak_chance = 2 //percentage chance of speaking a line from 'emote_see'

	var/comfy_range = 6 //How far we like to be form are targets when we fire!

	var/grabbed_by_friend = FALSE //is this superior_animal being wrangled?

	var/turns_per_move = 3 //number of life ticks per random movement
	var/turns_since_move = 0 //number of life ticks since last random movement
	var/wander = 1 //perform automated random movement when idle
	var/stop_automated_movement = 0 //use this to temporarely stop random movement
	var/stop_automated_movement_when_pulled = 0

	var/flash_resistances = 0 //Normal flash done by a hand held is 10, 10+ is for bombs

	var/toxin_immune = FALSE

	var/contaminant_immunity = FALSE //if TRUE, mob is immune to harmful contaminants in air (plasma), skin contact, does not relate to breathing
	var/cold_protection = 0 //0 to 1 value, which corresponds to the percentage of protection, affects only bodytemperature
	var/heat_protection = 0
	var/breath_required_type = "oxygen" //0 to disable, oxyloss if absent in sufficient quantity
	var/breath_poison_type = "plasma" //0 to disable, toxloss if present in sufficient quantity
	var/min_breath_required_type = 16 //minimum portion of gas in a single breath
	var/min_breath_poison_type = 0.2 //minimum portion of gas in a single breath
	var/light_dam = 0 //0 to disable, minimum amount of lums to cause damage, otherwise heals in darkness
	var/hunger_factor = 0 //0 to disable, how much nutrition is consumed per life tick

	colony_friend = FALSE


	var/min_air_pressure = 50 //below this, brute damage is dealt
	var/max_air_pressure = 300 //above this, brute damage is dealt
	var/min_bodytemperature = 200 //below this, burn damage is dealt
	var/max_bodytemperature = 360 //above this, burn damage is dealt

	var/deathmessage = "dies."
	var/attacktext = "bitten"
	var/list/attack_sound = 'sound/weapons/spiderlunge.ogg'
	var/attack_sound_chance = 100
	var/attack_sound_volume = 90

	var/meat_type = /obj/item/reagent_containers/food/snacks/meat/roachmeat
	var/meat_amount = 3
	//Lodge related products
	var/leather_amount = 0 //The amount of leather sheets dropped.
	var/bones_amount = 0 //The amount of bone sheets dropped.
	var/has_special_parts = FALSE //var for checking during the butcher process.
	var/special_parts = list() //Any special body parts.

	var/melee_damage_lower = 0
	var/melee_damage_upper = 10

	var/list/objectsInView //memoization for getObjectsInView()
	var/viewRange = 7 //how far the mob AI can see
	var/acceptableTargetDistance = 1 //consider all targets within this range equally

	var/stance = HOSTILE_STANCE_IDLE //current mob AI state
	var/atom/target_mob //currently chased target
	var/attack_same = 0 //whether mob AI should target own faction members for attacks
	var/list/friends = list() //list of mobs to consider friends, not types
	var/environment_smash = 1
	var/destroy_surroundings = 1
	var/break_stuff_probability = 100
	can_burrow = TRUE
	var/extra_burrow_chance = 0 //The chance that this animal will spawn another burrow in its vicinity
	//This is in addition to the single guaranteed burrow that always exists in sight of any burrowing mob

	var/bad_environment = FALSE //Briefly set true whenever anything in the atmosphere damages this mob
	//When this is true, mobs will attempt to evacuate via the nearest burrow

	var/busy = 0 // status of the animal, if it is doing a special task (eating, spinning web) we still want it
	// in HOSTILE_STANCE_IDLE to react to threat but we don't want stop_automated_movement set back to 0 in Life()

	var/fleshcolor = "#DB0000"
	var/bloodcolor = "#DB0000"
	//Armor values for the mob. Works like normal armor values.
	var/give_randomized_armor = FALSE
	var/gives_prefex = FALSE
	var/prefex = "bugged"

	var/armor = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0,
		agony = 0
	)

	var/add_armor = list(
		melee = 0,
		bullet = 0,
		energy = 0,
		bomb = 0,
		bio = 0,
		rad = 0,
		agony = 0
	)

	var/ranged = FALSE  //Do we have a range based attack?
	var/rapid = FALSE   //Do we shoot in 3s?
	var/projectiletype  //What are we shooting?
	var/projectilesound //What sound do we make when firing
	var/casingtype      //Do we leave casings after shooting?
	var/ranged_cooldown //What is are modular cooldown, in seconds.
	var/ranged_middlemouse_cooldown = 0 //For when people are controling them and firing, do we have a cooldown? Modular for admins to tweak.
	var/fire_verb       //what does it do when it shoots?
	//ammo stuff
	var/limited_ammo = FALSE //Do we run out of ammo?
	var/mag_drop = FALSE //Do we drop are mags?
	var/rounds_left = 5 //Debug number
	var/mag_type = /obj/item/ammo_magazine/pistol_35/empty//What is are mag/cell used?
	var/mags_left = 3 //How many mags do we have?
	var/rounds_per_fire = 1 //how many bullets do we eat per shot, NOTE: rapid fire will use rounds_per_fire * 3
	var/reload_message = "performs a tactical reload!" //Are reload message.
	var/full_reload_message = "" //name + reload message above

	// Variables for the following AI
	var/obey_friends = TRUE // Do we obey only friends ?
	var/mob/following = null // Who are we following?
	var/follow_distance = 2 // How close do we stay?
	var/follow_message = "nods and start following." // Message that the mob emote when they start following. Include the name of the one who follow at the end
	var/stop_message = "nods and stop following." // Message that the mob emote when they stop following. Include the name of the one who follow at the end

	var/list/known_languages = list() // The languages that the superior mob know.

/mob/living/carbon/superior_animal/New()
	..()
	if(!icon_living)
		icon_living = icon_state
	if(!icon_dead)
		icon_dead = "[icon_state]_dead"

	objectsInView = new

	full_reload_message  = "[reload_message]"
	reload_message = "[name] [full_reload_message]"

	verbs -= /mob/verb/observe
	pixel_x = RAND_DECIMAL(-randpixel, randpixel)
	pixel_y = RAND_DECIMAL(-randpixel, randpixel)

	GLOB.superior_animal_list += src

	for(var/language in known_languages)
		add_language(language)

/mob/living/carbon/superior_animal/Initialize(var/mapload)
	.=..()
	if (mapload && can_burrow)
		find_or_create_burrow(get_turf(src))
		if (prob(extra_burrow_chance))
			create_burrow(get_turf(src))

/mob/living/carbon/superior_animal/Destroy()
	GLOB.superior_animal_list -= src
	. = ..()

/mob/living/carbon/superior_animal/u_equip(obj/item/W as obj)
	return

/mob/living/carbon/superior_animal/proc/visible_emote(message)
	if(islist(message))
		message = safepick(message)
	if(message)
		visible_message("<span class='name'>[src]</span> [message]")

/mob/living/carbon/superior_animal/update_icons()
	. = ..()
	transform = null
	if (stat == DEAD)
		icon_state = icon_dead
	else if ((stat == UNCONSCIOUS) || resting || lying)
		if (icon_rest)
			icon_state = icon_rest
		else
			if (icon_living)
				icon_state = icon_living
			var/matrix/M = matrix()
			M.Turn(180)
			//M.Translate(1,-6)
			transform = M
	else if (icon_living)
		icon_state = icon_living


/mob/living/carbon/superior_animal/regenerate_icons()
	. = ..()
	update_icons()

/mob/living/carbon/superior_animal/updateicon()
	. = ..()

/mob/living/carbon/superior_animal/examine(mob/user)
	..()
	if (health < maxHealth * 0.25)
		to_chat(user, SPAN_DANGER("It's grievously wounded!"))
	else if (health < maxHealth * 0.50)
		to_chat(user, SPAN_DANGER("It's badly wounded!"))
	else if (health < maxHealth * 0.75)
		to_chat(user, SPAN_WARNING("It's wounded."))
	else if (health < maxHealth)
		to_chat(user, SPAN_WARNING("It's a bit wounded."))