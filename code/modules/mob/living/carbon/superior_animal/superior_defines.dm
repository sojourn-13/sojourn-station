/mob/living/carbon/superior
	name = "superior animal"
	desc = "You should not see this."

	mob_bump_flag = SIMPLE_ANIMAL
	mob_swap_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	mob_push_flags = MONKEY|SLIME|SIMPLE_ANIMAL
	mob_size = MOB_SMALL //MOB_MINISCULE MOB_TINY MOB_SMALL MOB_MEDIUM MOB_LARGE
	a_intent = I_HURT
	icon = 'icons/mob/mobs-monster.dmi'
	icon_state = "tomato"

	// AI activation for players is handled in sanity , if it has sanity damage it activates AI.
	sanity_damage = 0.5

	var/eating_time = 900

	/// Does this mob advance if they can't see their target?
	var/advance_if_cant_see = FALSE
	/// Chance to fire a projectile if it would hit a friendly.
	var/do_friendly_fire_chance = 10

	/// Do we randomly retarget?
	var/retarget = TRUE
	/// How many ticks we will wait before trying to retarget randomly. When it hits 0, we retarget and reset the timer to retarget_timer_initial.
	var/retarget_timer = 6
	/// Value that retarget_timer will be reset to.
	var/retarget_timer_initial = 6
	/// The targetting prioritization type used by this mob. See mobs.dm in _DEFINES for the defines.
	var/prioritization_type = CLOSEST
	/// Do we prioritize dummies?
	var/prioritize_dummies = TRUE
	/// Should we prioritize our current target if we randomly retarget?
	var/retarget_prioritize_current = TRUE
	/// Percentage chance that we will keep targetting our current target if we retarget.
	var/retarget_chance = 50 //arbitrary value

	/// Do we always send a message to our target when we telegraph, or only in proximity?
	var/always_telegraph_to_target = TRUE

	/// Do we advance?
	var/advance = TRUE
	/// Stored var of calculation ran within [/mob/living/carbon/superior/proc/advance_towards]
	var/advance_steps = 0
	/// How many tiles we will advance forward from our current position if we can't hit our current target.
	var/advancement = 1
	/// Increments advancement_timer by itself whenever a ranged mob decides to advance.
	var/advancement_increment = 5
	/// Will be incremented advancement_increment ticks whenever a ranged mob decides to advance. If more than world.time, targetting walks will be ignored, to not end the advancement.
	var/advancement_timer = 0
	/// Do we wander if we can't see our target?
	var/wander_if_lost_sight = TRUE

	/// Has this mob lost sight of their target? This is how we make sure mobs don't constantly go to the position of the target they've lost sight of.
	var/lost_sight = FALSE

	/// Flags for AI.
	var/ai_flags = 0

	///How delayed are our ranged attacks, in ticks. Reduces DPS.
	var/fire_delay = 0
	/// Value used when resetting fire_delay. initial() works but breaks vareditting.
	var/fire_delay_initial = 0

	///How delayed are our melee attacks, in ticks. Reduces DPS.
	var/melee_delay = 0
	/// Value used when resetting melee_delay. initial() works but breaks vareditting.
	var/melee_delay_initial = 0
	/// Do we charge our melee attacks if we aren't adjacent?
	var/do_melee_if_not_adjacent = TRUE


	/// Number of delayed AI ticks, used for delaying ranged attacks. At 1, ranged mobs will be delayed by one tick after target.
	var/delayed = 1
	/// Value that delayed will be reset to.
	var/delayed_initial = 1
	/// If this is more than the world timer, and we retarget, we will immediately attack.
	var/retarget_rush_timer = 0
	/// For this amount of time after a retarget, any retargets will cause a instant attack.
	var/retarget_rush_timer_increment = 10 SECONDS //arbitrary value for now

	/// Can this mob see it's current targets through walls and will never act like it can't?
	var/see_through_walls = FALSE
	/// Will this mob continue to fire at it's targets through walls? Ideally used with see_through_walls
	var/fire_through_walls = FALSE

	var/see_past_viewRange = FALSE
	/// How many ticks are we willing to wait before untargetting a mob that we can't see?
	var/patience = 5
	/// What patience will be reset to whenever it's reset.
	var/patience_initial = 5

	/// Telegraph message base for mobs that are range
	var/range_telegraph = "aims their weapon at"
	/// Telegraph message base for mobs that are melee
	var/melee_telegraph = "readies to strike"

	/// Telegraph message base for mobs that are targetting
	var/target_telegraph = "prepares to fire at"
	/// Telegraph message base for mobs that are retargetting shortly after losing target
	var/rush_target_telegraph = "shifts its attention to"

	/// Telegraph messages for when a mob is ticking down it's attack delays
	var/range_charge_telegraph = "steadies their aim apon"
	var/melee_charge_telegraph = "gathers their strength to attack"

	/// What color is our telegraph beam?
	var/telegraph_beam_color = COLOR_YELLOW

	/// Alpha value of our telegraph beam.
	var/telegraph_beam_alpha = 50

	var/moved = FALSE
	var/move_attack_mult = 0.6
	var/move_and_attack = FALSE
	universal_understand = TRUE //QoL to admins controling mobs
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
	/// comfy_range - comfy_distance = how far away mobs will try to be from their targets. Not how far they fire from.
	var/comfy_distance = 1

	var/grabbed_by_friend = FALSE //is this superior_animal being wrangled?

	var/turns_per_move = 3 //number of life ticks per random movement
	var/turns_since_move = 0 //number of life ticks since last random movement
	var/wander = 1 //perform automated random movement when idle
	var/stop_automated_movement = 0 //use this to temporarely stop random movement
	var/stop_automated_movement_when_pulled = 0

	var/flash_resistances = 0 //Normal flash done by a hand held is 10, 10+ is for bombs

	var/toxin_immune = FALSE
	var/reagent_immune = FALSE
	//var/never_stimulate_air = FALSE  moved to \code\modules\mob\living\living_defines.dm

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

	/*
	var/min_air_pressure = 50 //below this, brute damage is dealt
	var/max_air_pressure = 300 //above this, brute damage is dealt
	var/min_bodytemperature = 200 //below this, burn damage is dealt
	var/max_bodytemperature = 360 //above this, burn damage is dealt  moved to \code\modules\mob\living\living_defines.dm
	*/

	var/deathmessage = "dies."
	var/attacktext = "bitten"
	var/list/attack_sound = 'sound/weapons/spiderlunge.ogg'
	var/attack_sound_chance = 100
	var/attack_sound_volume = 90

	var/meat_type = /obj/item/reagent_containers/snacks/meat/roachmeat
	var/meat_amount = 3
	//Lodge related products
	var/leather_amount = 0 //The amount of leather sheets dropped.
	var/bones_amount = 0 //The amount of bone sheets dropped.
	var/has_special_parts = FALSE //var for checking during the butcher process.
	var/special_parts = list() //Any special body parts.

	melee_damage_lower = 0
	melee_damage_upper = 10

	//Type of damage, atm only brute
	var/melee_damage_type = BRUTE
	//If are melee attacks are sharp, used for delimming
	var/melee_sharp = FALSE
	//Used for what type of armor were fighting against
	var/attacking_armor_type = ARMOR_MELEE

	/// Determines if the mob will target whoever attacked them in the absence of an existing target. Ignores view range.
	var/react_to_attack = TRUE
	/// Determines what the mob will fire at if reacting to an attack they can't see. DO NOT MERGE IF NIKO DOES NOT REMOVE THIS COMMENT
	var/retaliation_type = NO_RETALIATION
	/// Determines what the mob will do if they are reacting to an attack and they can't see their target.
	var/target_out_of_sight_mode = GUESS_LOCATION_WITH_END_OF_LINE
	/// If true, turfs that have no LOS on the target out of viewrange will be ignored when finding a location in an aura/line that's out of viewrange.
	var/out_of_sight_turf_LOS_check = TRUE
	/// If target_out_of_sight_mode == GUESS_LOCATION_WITH_LINE, distance from src and target will be multiplied by this, then set as the limit for the line search.
	var/out_of_viewrange_line_distance_mult = 2

	var/list/objectsInView //memoization for getObjectsInView()
	var/viewRange = 7 //how far the mob AI can see
	var/acceptableTargetDistance = 1 //consider all targets within this range equally

	var/stance = HOSTILE_STANCE_IDLE //current mob AI state
	/**
	 * Currently chased target, in weakref form.
	 *
	 * IF YOU EVER ACCESS THIS VAR, OR ASSIGN A VALUE TO IT, you NEED to use target_mob.Resolve() to access it,
	 * or wrap whatever youre assigning it as with WEAKREF()
	 *
	 * Otherwise, you will access the pointer in memory to the actual target, instead of the target itself.
	 */
	var/datum/weakref/target_mob
	/// Stored value of our current target's location, in weakref form. Only updates if we can see them. Use resolve() to find the proper value.
	var/datum/weakref/target_location
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

	var/ticks_processed = 0

	var/fleshcolor = "#DB0000"
	var/bloodcolor = "#DB0000"
	//Armor values for the mob. Works like normal armor values.

	var/prefex = "bugged"

	var/list/armor = list(
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
	var/rapid = FALSE   //Do we shoot in groups?
	var/rapid_fire_shooting_amount = 1 // Has to be one so stat modifiers can work.
	var/obj/item/projectile/projectiletype  //What are we shooting?
	var/projectilesound //What sound do we make when firing
	/// How loud will our projectile firing sound be?
	var/projectilevolume = 100
	var/casingtype      //Do we leave casings after shooting?
	var/ranged_cooldown //What is are modular cooldown, in seconds.
	var/ranged_middlemouse_cooldown = 0 //For when people are controling them and firing, do we have a cooldown? Modular for admins to tweak.
	var/fire_verb = "fires"      //what does it do when it shoots?
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
	/// The last mob this mob has followed, nulled on the first tick the mob is not following anymore. Make sure to assign this to the same value as following.
	var/mob/last_followed = null // Who did we follow last?
	var/follow_distance = 2 // How close do we stay?
	var/follow_message = "nods and starts following you." // Message that the mob emote when they start following. Include the name of the one who follow at the end
	var/stop_message = "nods and stops in place." // Message that the mob emote when they stop following. Include the name of the one who follow at the end

	var/list/known_languages = list() // The languages that the superior mob know.

	//Simple delays for mobs, only for super mobs at this time, simple can stay much more deadly.
	//This makes it so they wait in seconds seconds before doing their attack
	delay_for_range = 1.5 SECONDS
	delay_for_rapid_range = 0.75 SECONDS
	delay_for_melee = 0 SECONDS
	delay_for_all = 0.5 SECONDS

	/// Used in proc/shoot to determine the inaccuracy of the projectile. Initial value.
	var/initial_firing_offset = 2 // By default, two degrees of inaccuracy.
	/**
	 * Used in proc/shoot to determine the inaccuracy of the projectile. Used value.
	 * A value between this and the sign-inverted (5 becomes -5) version of itself will be picked at random when the mob fires a projectile, and THAT will be the
	 * final offset of the projectile. Make sure to sync with initial_firing_offset.
	**/
	var/current_firing_offset = 2

	/// Used to dictate if the critter is poisonous or not
	var/poison_per_bite = 0
	var/poison_type

	var/list/zone_hit_rates = list(BP_HEAD = 10, BP_CHEST = 50, BP_GROIN = 35, BP_R_ARM = 30, BP_L_ARM = 30, BP_R_LEG = 20, BP_L_LEG = 20)

	var/fancy_attack_overlay //Overlay icon for when we attack something
	var/fancy_attack_shading = "#C4A484" //When a new attack animation is spawned we use this colour -whitescale
	var/randomize_attack_effect_location = TRUE //Used for fancy_attack_overlay shifting of pixels

//SoJ edit
/obj/effect/effect/melee/mob_melee_animation
	icon = 'modular_sojourn/attacks.dmi'
	anchored = TRUE
	layer = ABOVE_ALL_MOB_LAYER

/obj/effect/effect/melee/mob_melee_animation/New(fancy_colour)
	..()
	if(fancy_colour)
		color = fancy_colour