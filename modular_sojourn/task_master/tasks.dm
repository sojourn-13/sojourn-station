

//Heavily inspired by Proto23 created by Croc
//Power creep but for random tasks and unsorted things to help push players into doing activities for miner gains
//Code is HEAVILLY reused and stolen from Hex's Genetics with miner tweaks

/datum/task_master/task

	//Reference to the containing labourer
	var/datum/task_master/labourer/worker

	//Pulled up from worker for easier refencing and debugging
	var/mob/living/forwards_refence


	//Name of the Task
	var/name = "Unknown Task"

	var/desc = "A task unable to be known."

	//The key of the object, used to search for it easily. Often matches the Macro text.
	var/key = "DEFAULT"


	//Used for some tasks to gain levels for said task
	var/value = 0

	//Weather or not the first level is gives you its activation affects
	var/unlocked = FALSE

	//Current level has has to do with value
	var/level = 0

	//For weather we level up this task or not
	var/level_thresholds = 10

	//For when we want to scale are level_thresholds at a different rate
	var/alt_scaling_number = 0

	//The text displayed to a player when they gain a learnt task.
	var/gain_text


/datum/task_master/task/self_value
	name = "Self Motivation"
	key = "MASTER_QUEST_COMPLETER"
	desc = "Completing your own set goals inspires you to continue your self improvement."
	gain_text = "Setting your own missions is rewarding."
	level_thresholds = 5 //Rewarding people that do their personal objectives with some reason to do this

/datum/task_master/task/self_value/activate_affect()
	//log_debug("[forwards_refence] Has gained additonal insight.")
	if(ishuman(forwards_refence))
		var/mob/living/carbon/human/forward_human = forwards_refence
		forward_human.sanity.give_insight(level + 3)
		forward_human.sanity.give_insight_rest(level + 3)
//	forwards_refence.sanity.resting += level //This was to powerful


/datum/task_master/task/clay_thumb
	name = "Potted Plant Maintainer"
	key = "CLAY_THUMB_CONISOUR"
	desc = "Thanks to regularly maintaining small potted plants, your knowledge of biodiversity grows."
	gain_text = "Keeping potted plants alive sure is rewarding labour."
	level_thresholds = 10 //What looks like a low value is rather high, as this only gains bio on the second+ level up i.e first 10 points are wasted

/datum/task_master/task/clay_thumb/activate_affect()
	forwards_refence.stats.changeStat(STAT_BIO, 2) //so its actually valueable

/datum/task_master/task/vendor_e_shopper
	name = "Vendor Point Shopper"
	key = "VENDOR_E_SHOPPER"
	desc = "Paper bills? Coins? They all suck! Shopping with an E-Wallet is certainly the way to go."
	gain_text = "Shopping with an Ecard sure is the future."
	level_thresholds = 10 //So people dont game this as easy

/datum/task_master/task/vendor_e_shopper/activate_affect()
	forwards_refence.stats.changeStat(STAT_COG, 2) //so its actually valueable

//Restlessness... gnawing hunger...
/datum/task_master/task/return_to_sender
	name = "Return To Sender"
	key = "RETURN_TO_SENDER"
	desc = "Pulled out of the dark, into the light."
	gain_text = "Walking again?"
	level_thresholds = 1
	unlocked = TRUE //Morality

/datum/task_master/task/return_to_sender/activate_affect()
	forwards_refence.max_nutrition += (level * 15) //415 level 1 -> 445 level 2 -> 490 level 3 ect ect
	forwards_refence.stats.changeStat(STAT_VIV, (level + 2)) //Extremely minor: 3 level 1 -> 7 level 2 -> 13 level 3 ect ect

//Huskification
/datum/task_master/task/rebound_case
	name = "Rebound Case"
	key = "REBOUND_CASE"
	desc = "Back from the dead, you are but a shell of your former self."
	gain_text = "Back again."
	level_thresholds = 2
	unlocked = TRUE //Immortality

/datum/task_master/task/rebound_case/activate_affect()
	forwards_refence.stats.changeStat(STAT_COG, -5) //Yes this is infact a bad thing
	forwards_refence.maxHealth += 5 //Scars and battle wounds heal back stronger.
	forwards_refence.health += 5 //Scars and battle wounds heal back stronger.

	if(ishuman(forwards_refence))
		var/mob/living/carbon/human/forward_human = forwards_refence
		forward_human.vessel.maximum_volume  += 10 //Increases maxium blood  due to your shock/recovering body panicing or something like that

//Gym buff
/datum/task_master/task/gym_goer
	name = "Body Builder"
	key = "GYM_GOER"
	desc = "Nothing beats hitting the gym."
	gain_text = "Feels great to be fit."
	level_thresholds = 3 //Gym has long cooldowns and costs a bit

/datum/task_master/task/gym_goer/activate_affect()
	forwards_refence.stats.changeStat(STAT_VIV, (level + 2))
	forwards_refence.max_nutrition += (level * 5) //405 level 1 -> 415 level 2 -> 430 level 3 ect ect
	if(ishuman(forwards_refence))
		var/mob/living/carbon/human/forward_human = forwards_refence
		forward_human.vessel.maximum_volume  += 10 //Blood flow is being aided

//Floor/Wallet Pill buff
/datum/task_master/task/dr_floor
	name = "Dr. Floor"
	key = "DR_FLOOR"
	desc = "Either due to drug abuse or hope, maybe this will make you more resistant."
	gain_text = "Self prescription..."
	level_thresholds = 5 //Tons of wallet/floor pills

/datum/task_master/task/dr_floor/activate_affect()
	forwards_refence.stats.changeStat(STAT_VIV, (level + 2))

//For Shoveling AND THEN welding/hammering a crack
/datum/task_master/task/proper_sealer
	name = "Proper Sealer"
	key = "PROPER_SEALER"
	desc = "Closing burrows with manual labour does more than giving you calloused hands - it makes you more knowledgeable with tools."
	gain_text = "Making the colony a safer place sure is fulfilling work."
	level_thresholds = 5 //Theirs so many borrows...

/datum/task_master/task/proper_sealer/activate_affect()
	forwards_refence.stats.changeStat(STAT_MEC, (level + 1))
	forwards_refence.stats.changeStat(STAT_TGH, (level + 1))

//This happens every time a tool breaks on someone
/datum/task_master/task/tool_breaker
	name = "Tool Consumer"
	key = "TOOL_BREAKER"
	desc = "Things will break eventually. At least its a good learning experience..."
	gain_text = "Oops."
	level_thresholds = 2 //This unlike most stat is meant to be leveled up a bit to shine

/datum/task_master/task/tool_breaker/activate_affect()
	forwards_refence.stats.changeStat(STAT_MEC, (level + 1))

/datum/task_master/task/proper_area_smoker
	name = "Smoking Area"
	key = "PROPER_AREA_SMOKER"
	desc = "Smoking in the proper area is very considerate of you."
	gain_text = "Smoking in a proper area is rather considerate."
	level_thresholds = 10

/datum/task_master/task/proper_area_smoker/activate_affect()
	if(ishuman(forwards_refence))
		var/mob/living/carbon/human/forward_human = forwards_refence
		forward_human.sanity.change_max_level(level)

//Taking bad perks should not be all bad!
/datum/task_master/task/pours
	name = "When it rains..."
	key = "POURS"
	desc = "Just bad luck with getting the right items..."
	gain_text = "Unlucky day huh..."
	level_thresholds = 1
	alt_scaling_number = 2 // 1 2 4 8 ect,
	unlocked = TRUE

/datum/task_master/task/poors/activate_affect()
	forwards_refence.stats.addPerk(PERK_FORCEFUL_REJECTION)

//This affect is in diving code directly
/datum/task_master/task/parcours
	name = "Acrobatics"
	key = "PARCOURS"
	desc = "No obstacle is too big for you."
	gain_text = "Duck n Cover!"
	level_thresholds = 10
	alt_scaling_number = 2 // You can dive whenever
	unlocked = TRUE

//This affect is in plating directly
/datum/task_master/task/slip_n_die
	name = "Face planting trips"
	key = "SLIP_N_DIE"
	desc = "Tripping sucks, gotta be more careful..."
	gain_text = "Ouch, my toe"
	level_thresholds = 1 //You fall down a lot
	alt_scaling_number = 2 //But it does hurt
	unlocked = TRUE

//Digging and Mining gets +1 ore per level
/datum/task_master/task/slab_clearer
	name = "Mining Skill"
	key = "SLAB_CLEARER"
	desc = "Fully mining an ore deposit lets you better visualize the most mineral-effective ways to break and dig rocks."
	gain_text = "A fully cleared deposit allows insight into maximizing mineral gains."
	level_thresholds = 1 // 1->2->3
	unlocked = TRUE

/datum/task_master/task/sheath_arts
	name = "Learned Style"
	key = "SHEATH_ARTS"
	desc = "Quickly unsheathing and attacking. With training it should be possible to get a bit more range."
	gain_text = "With endless training it should be possible...."
	level_thresholds = 10 // 10->100->1k-> 10k (This is  due to the first 2 levels being useless)
	alt_scaling_number = 10
	unlocked = FALSE

/datum/task_master/task/sheath_arts/activate_affect()
	//We skip over level 1  due to some check stuff with how sheaths work
	if(level == 1)
		level = 2

/datum/task_master/task/map_crafting
	name = "Map Crafting"
	key = "MAP_CRAFTING"
	desc = "The way of map making is complex, but with constant work you can do a better job."
	gain_text = "Little bit better than last time..."
	level_thresholds = 1 //1 -> 1.5 -> 2.25 -> 3.75 ect ect
	alt_scaling_number = 1.5
	unlocked = FALSE
