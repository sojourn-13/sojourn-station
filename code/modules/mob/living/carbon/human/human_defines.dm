/mob/living/carbon/human
	//Hair colour and style
	var/hair_color = "#000000"
	var/h_style = "Bald"

	death_threshold = HEALTH_THRESHOLD_DEAD

	//Facial hair colour and style
	var/facial_color = "#000000"
	var/f_style = "Shaved"

	//Hair gradiants
	var/grad_style = "none"
	var/grad_color = "#000000"

	//Eye colour
	var/eyes_color = "#000000"

	var/s_tone = 0	//Skin tone

	//Skin colour
	var/skin_color = "#FFE0D0"

	var/size_multiplier = 1 //multiplier for the mob's icon size
	var/scale_effect = 0	//new multiplier. The one above is obsolete
	var/damage_multiplier = 1 //multiplies melee combat damage
	var/icon_update = 1 //whether icon updating shall take place

	var/lip_style = null	//no lipstick by default- arguably misleading, as it could be used for general makeup

	//Ears, Tail and Wings
	var/datum/sprite_accessory/ears/ears	=  null
	var/list/ears_colors					= list()
	var/datum/sprite_accessory/tail/tail	=  null
	var/list/tail_colors					= list()
	var/datum/sprite_accessory/wings/wings	=  null
	var/list/wings_colors					= list()
	var/tail_over = 0 //If the tail's on the alt layer or not.

	var/list/body_markings						= list()

	var/age = 30		//Player's age (pure fluff)
	var/b_type = "A+"	//Player's bloodtype

	var/list/worn_underwear = list()

	var/datum/backpack_setup/backpack_setup

	//Equipment slots
	var/obj/item/wear_suit = null
	var/obj/item/w_uniform = null
	var/obj/item/shoes = null
	var/obj/item/belt = null
	var/obj/item/gloves = null
	var/obj/item/glasses = null
	var/obj/item/head = null
	var/obj/item/l_ear = null
	var/obj/item/r_ear = null
	var/obj/item/wear_id = null
	var/obj/item/r_store = null
	var/obj/item/l_store = null
	var/obj/item/s_store = null

	var/icon/stand_icon = null
	var/icon/lying_icon = null

	var/voice = ""	//Instead of new say code calling GetVoice() over and over and over, we're just going to ask this variable, which gets updated in Life()

	var/speech_problem_flag = 0

	var/miming = null //Toggle for the mime's abilities.
	var/special_voice = "" // For changing our voice. Used by a symptom.

	var/last_dam = -1	//Used for determining if we need to process all organs or just some or even none.
	var/list/bad_external_organs = list()// organs we check until they are good.

	var/xylophone = 0 //For the spoooooooky xylophone cooldown

	var/mob/remoteview_target = null
	var/remoteviewer = FALSE //for Glassification breakdown
	var/hand_blood_color

	var/gunshot_residue
	var/holding_back // Are you trying not to hurt your opponent?
	var/blocking = FALSE //ready to block melee attacks?
	var/dodging = TRUE // are you dodging those shots?

	mob_bump_flag = HUMAN
	mob_push_flags = ~HEAVY
	mob_swap_flags = ~HEAVY

	var/flash_protection = 0				// Total level of flash protection
	var/psi_blocking = 0					// Total level of psi protection
	var/psi_blocking_additive = 0			// Added level of psi protection, form things like perks or other such things.
	var/equipment_tint_total = 0			// Total level of visualy impairing items
	var/equipment_darkness_modifier			// Darkvision modifier from equipped items
	var/equipment_vision_flags				// Extra vision flags from equipped items
	var/equipment_see_invis					// Max see invibility level granted by equipped items
	var/equipment_prescription				// Eye prescription granted by equipped items
	var/list/equipment_overlays = list()	// Extra over-lays from equipped items

	var/med_record = ""
	var/sec_record = ""
	var/gen_record = ""
	var/exploit_record = ""

	var/stance_damage = 0 //Whether this mob's ability to stand has been affected

	var/identifying_gender = null // In case the human identifies as another gender than it's biological
	mob_classification = CLASSIFICATION_ORGANIC | CLASSIFICATION_HUMANOID


	var/datum/sanity/sanity = null
	var/rest_points = 0

	var/shock_resist = 0 // Resistance to paincrit

	var/punch_damage_increase = 0 // increases... punch damage... can be affected by clothing or implants.

	var/language_blackout = 0
	var/suppress_communication = 0

	var/momentum_speed = 0 // The amount of run-up
	var/momentum_dir = 0 // Direction of run-up
	var/momentum_reduction_timer


	var/added_movedelay = 0 //Used for humans only

	//Lib edits
	var/frost = 0
	var/frost_emote
	var/frost_emote_cooldown = 49
	var/frost_warnings
	var/frost_warnings_cooldown = 49
	var/max_frost = 1200 //were out of 1.2k so are values are a bit inflated
