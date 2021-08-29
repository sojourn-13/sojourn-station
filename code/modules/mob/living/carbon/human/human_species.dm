/mob/living/carbon/human/dummy
	real_name = "Test Dummy"
	status_flags = GODMODE|CANPUSH

/mob/living/carbon/human/monkey
	icon_state = "monkey"

/mob/living/carbon/human/monkey/New(var/new_loc)
	..(new_loc, "Monkey")
	dna.SetSEValue(MONKEYBLOCK,0xFFF)
	dna.b_type = RANDOM_BLOOD_TYPE
	sync_organ_dna()
	var/datum/dna/gene/G = new /datum/dna/gene/basic/monkey
	active_genes |= G.type
	update_icon = 1

/mob/living/carbon/human/dummy/mannequin
	is_mannequin = TRUE

/mob/living/carbon/human/dummy/mannequin/Initialize()
	. = ..()
	STOP_PROCESSING(SSmobs, src) //We dont process anything lag reduction
	GLOB.human_mob_list -= src //Were not a human mob we want in any list
	GLOB.dead_mob_list -= src  //We are not a dead mob
	GLOB.living_mob_list -= src //we are not alive
	GLOB.mob_list -= src //were not a mob to touch
	delete_inventory()

/mob/living/carbon/human/dummy/mannequin/fully_replace_character_name(var/oldname, var/newname)
	..(newname = "[newname] (mannequin)")
