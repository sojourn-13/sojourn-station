/mob/living/carbon/
	gender = MALE
	var/datum/species/species //Contains icon generation and language information, set during New().
	var/datum/species_form/form //Steals the icon generation info from above.
	var/species_aan = ""
	var/species_color_key = "#000000"
	var/species_name = "Carbon Lifeform"

	var/life_tick = 0      // The amount of life ticks that have processed on this mob.
	var/analgesic = 0 // when this is set, the mob isn't affected by shock or pain
					  // life should decrease this by 1 every tick
	// total amount of wounds on mob, used to spread out healing and the like over all wounds
	var/obj/item/handcuffed = null //Whether or not the mob is handcuffed
	var/obj/item/legcuffed = null  //Same as handcuffs but for legs. Bear traps use this.

	//Active emote/pose
	var/pose = null

	//Values from all base organs should add up to this
	var/total_blood_req = 40
	var/effective_blood_volume = 1 //affected by OP_HEART efficency
	var/total_oxygen_req = 50
	var/total_nutriment_req = DEFAULT_HUNGER_FACTOR

	var/datum/reagents/metabolism/bloodstr = null
	var/datum/reagents/metabolism/ingested = null
	var/datum/reagents/metabolism/touching = null
	var/datum/metabolism_effects/metabolism_effects = null
	var/losebreath = 0 //if we failed to breathe last tick

	var/always_blood = FALSE //Do we always process reagents as though we have blood?
	var/always_ingest = FALSE //Do we always process reagents as though we have a stomach?

	var/coughedtime = null
	var/lastpuke = 0

	var/cpr_time = 1.0
	var/cpr_successes = 0  // Track consecutive successful CPR attempts for heart restart
	var/last_cpr_time = 0  // Track when last CPR was performed
	nutrition = 400.0//Carbon

	var/flesh_color = "#A10808"

	var/obj/item/tank/internal = null//Human/Monkey
	colony_friend = TRUE //For mobs to make sure if they are also friendly dont attack humans
	friendly_to_colony = TRUE //So we dont attack monkeys/BST/People if we allied

	var/movement_hunger_factors = 1
	//TODO: move to brain
