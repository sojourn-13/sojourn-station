/*
///////////////////////////////////
/  =---------------------------=  /
/  == Facial Hair Definitions ==  /
/  =---------------------------=  /
///////////////////////////////////
*/

/datum/sprite_accessory/facial_hair
	icon = 'icons/mob/human_races/species/human/facial.dmi'
	gender = MALE // barf (unless you're a dorf, dorfs dig chix /w beards :P)
	species_allowed = list(
		SPECIES_HUMAN,
		SPECIES_EXALT_HUMAN,
		FORM_MARQUA,
		FORM_SABLEKYNE,
		FORM_KRIOSAN,
		FORM_AKULA,
		FORM_CHTMANT,
		FORM_CINDAR,
		FORM_NARAMAD,
		FORM_OPIFEX,
		FORM_SLIME,
		FORM_MYCUS,
		FORM_FBP
		)

/datum/sprite_accessory/facial_hair/shaved
	name = "Shaved"
	icon_state = "shaved"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/hogan
	name = "Hulk Hogan Mustache"
	icon_state = "hogan" //-Neek

/datum/sprite_accessory/facial_hair/selleck
	name = "Selleck Mustache"
	icon_state = "selleck"

/datum/sprite_accessory/facial_hair/chaplin
	name = "Square Mustache"
	icon_state = "chaplin"

/datum/sprite_accessory/facial_hair/vandyke
	name = "Van Dyke Mustache"
	icon_state = "vandyke"

/datum/sprite_accessory/facial_hair/walrus
	name = "Walrus Moustache"
	icon_state = "walrus"

/datum/sprite_accessory/facial_hair/watson
	name = "Watson Mustache"
	icon_state = "watson"

/datum/sprite_accessory/facial_hair/abe
	name = "Abraham Lincoln Beard"
	icon_state = "abe"

/datum/sprite_accessory/facial_hair/braid
	name = "Braided Beard"
	icon_state = "braided"

/datum/sprite_accessory/facial_hair/brokenman
	name = "Broken Man"
	icon_state = "facial_brokenman"

/datum/sprite_accessory/facial_hair/gt
	name = "Circle Beard" // Its true name, this is not a goatee.
	icon_state = "gt"

/datum/sprite_accessory/facial_hair/chinless
	name = "Chinless Beard"
	icon_state = "chinlessbeard"

/datum/sprite_accessory/facial_hair/chinstrap
	name = "Chinstrap"
	icon_state = "chin"

/datum/sprite_accessory/facial_hair/dali
	name = "Dali Moustache"
	icon_state = "dali"

/datum/sprite_accessory/facial_hair/dwarf
	name = "Dwarf Beard"
	icon_state = "dwarf"

/datum/sprite_accessory/facial_hair/elvis
	name = "Elvis Sideburns"
	icon_state = "elvis"

/datum/sprite_accessory/facial_hair/gp
	name = "Goatee"
	icon_state = "gp" // Goat patch, a true goatee

/datum/sprite_accessory/facial_hair/guyfawkes
	name = "Guy Fawkes"
	icon_state = "vendetta"

/datum/sprite_accessory/facial_hair/fullbeard
	name = "Full Beard"
	icon_state = "fullbeard"

/datum/sprite_accessory/facial_hair/fb_ml
	name = "Full Beard (Moustacheless)"
	icon_state = "fullbeard_ml"

/datum/sprite_accessory/facial_hair/croppedbeard
	name = "Full Cropped Beard"
	icon_state = "croppedfullbeard"

/datum/sprite_accessory/facial_hair/hip
	name = "Hipster Beard"
	icon_state = "hip"

/datum/sprite_accessory/facial_hair/jensen
	name = "Jensen Beard"
	icon_state = "jensen"

/datum/sprite_accessory/facial_hair/longbeard
	name = "Long Beard"
	icon_state = "longbeard"

/datum/sprite_accessory/facial_hair/lb_ml
	name = "Long Beard (Moustacheless)"
	icon_state = "longbeard_ml"

/datum/sprite_accessory/facial_hair/lumberjack
	name = "Lumberjack Beard"
	icon_state = "lumberjack"

/datum/sprite_accessory/facial_hair/martial
	name = "Martial Artist Beard"
	icon_state = "martialartist"

/datum/sprite_accessory/facial_hair/moonshiner
	name = "Moonshiner Beard"
	icon_state = "moonshiner"

/datum/sprite_accessory/facial_hair/mutton
	name = "Mutton Chops"
	icon_state = "mutton"

/datum/sprite_accessory/facial_hair/muttonmu
	name = "Mutton Chops and Moustache"
	icon_state = "muttonmu"

/datum/sprite_accessory/facial_hair/neckbeard
	name = "Neckbeard"
	icon_state = "neckbeard"

/datum/sprite_accessory/facial_hair/robotnik // PRRRRRRRROMOTION!
	name = "Robotnik Moustache"
	icon_state = "mostachon"

/datum/sprite_accessory/facial_hair/seadog
	name = "Sea Dog Beard"
	icon_state = "seadog"

/datum/sprite_accessory/facial_hair/shaggy
	name = "Shaggy"
	icon_state = "shag"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/tribeard
	name = "Tribeard"
	icon_state = "tribeard"

/datum/sprite_accessory/facial_hair/vlongbeard
	name = "Very Long Beard"
	icon_state = "wise"

/datum/sprite_accessory/facial_hair/volaju
	name = "Volaju Beard"
	icon_state = "volaju"

/datum/sprite_accessory/facial_hair/threeOclock
	name = "3 O'Clock Shadow"
	icon_state = "3oclock"

/datum/sprite_accessory/facial_hair/threeOclockstache
	name = "3 O'Clock Shadow and Moustache"
	icon_state = "3oclockmoustache"

/datum/sprite_accessory/facial_hair/fiveOclock
	name = "5 O'Clock Shadow"
	icon_state = "5oclock"

/datum/sprite_accessory/facial_hair/fiveOclockstache
	name = "5 O'Clock Shadow and Moustache"
	icon_state = "5oclockmoustache"

/datum/sprite_accessory/facial_hair/sevenOclock
	name = "7 O'Clock Shadow"
	icon_state = "7oclock"

/datum/sprite_accessory/facial_hair/sevenOclockstache
	name = "7 O'clock Shadow and Moustache"
	icon_state = "7oclockmoustache"
/*
/datum/sprite_accessory/facial_hair/teshari_beard
	name = "Teshari Beard"
	icon_state = "teshari_chin"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/teshari_scraggly
	name = "Teshari Scraggly"
	icon_state = "teshari_scraggly"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/teshari_chops
	name = "Teshari Chops"
	icon_state = "teshari_gap"
	gender = NEUTER
*/
/datum/sprite_accessory/facial_hair/una_chinhorn
	name = "Cindarite Chin Horn"
	icon_state = "facial_chinhorns_s"
	gender = NEUTER
/* Does not properly work. Probably broken icon state or something. Commented out due to being worthless. -Intense Skies
/datum/sprite_accessory/facial_hair/una_hornadorns
	name = "Cindarite Horn Adorns"
	icon_state = "facial_hornadorns_s"
	gender = NEUTER
*/
/datum/sprite_accessory/facial_hair/una_spinespikes
	name = "Cindarite Spine Spikes"
	icon_state = "facial_spikes_s"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/una_dorsalfrill
	name = "Cindarite Dorsal Frill"
	icon_state = "facial_dorsalfrill_s"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/neck_fluff
	name = "Neck Fluff"
	icon_state = "neckfluff"
	gender = NEUTER

/datum/sprite_accessory/facial_hair/neck_fluffie
	name = "Neck Fluff 2"
	icon_state = "neck_fluffies"
	gender = NEUTER
/*
///////////////////////////////////
/  =---------------------------=  /
/  == Facial Hair Definitions ==  /
/  =---------------------------=  /
///////////////////////////////////


/datum/sprite_accessory/facial_hair

	icon = 'icons/mob/Human_face.dmi'

	shaved
		name = "Shaved"
		icon_state = "bald"
		gender = NEUTER
		species_allowed = list(SPECIES_HUMAN,SPECIES_HUMAN_VATBORN,SPECIES_UNATHI,SPECIES_TAJ,SPECIES_SKRELL, "Machine", SPECIES_TESHARI, SPECIES_TESHARI,SPECIES_PROMETHEAN)

	watson
		name = "Watson Mustache"
		icon_state = "facial_watson"

	hogan
		name = "Hulk Hogan Mustache"
		icon_state = "facial_hogan" //-Neek

	vandyke
		name = "Van Dyke Mustache"
		icon_state = "facial_vandyke"

	chaplin
		name = "Square Mustache"
		icon_state = "facial_chaplin"

	selleck
		name = "Selleck Mustache"
		icon_state = "facial_selleck"

	neckbeard
		name = "Neckbeard"
		icon_state = "facial_neckbeard"

	fullbeard
		name = "Full Beard"
		icon_state = "facial_fullbeard"

	longbeard
		name = "Long Beard"
		icon_state = "facial_longbeard"

	vlongbeard
		name = "Very Long Beard"
		icon_state = "facial_wise"

	elvis
		name = "Elvis Sideburns"
		icon_state = "facial_elvis"
		species_allowed = list(SPECIES_HUMAN,SPECIES_PROMETHEAN,SPECIES_HUMAN_VATBORN,SPECIES_UNATHI)

	abe
		name = "Abraham Lincoln Beard"
		icon_state = "facial_abe"

	chinstrap
		name = "Chinstrap"
		icon_state = "facial_chin"

	hip
		name = "Hipster Beard"
		icon_state = "facial_hip"

	gt
		name = "Goatee"
		icon_state = "facial_gt"

	jensen
		name = "Adam Jensen Beard"
		icon_state = "facial_jensen"

	volaju
		name = "Volaju"
		icon_state = "facial_volaju"

	dwarf
		name = "Dwarf Beard"
		icon_state = "facial_dwarf"

	threeOclock
		name = "3 O'clock Shadow"
		icon_state = "facial_3oclock"

	threeOclockstache
		name = "3 O'clock Shadow and Moustache"
		icon_state = "facial_3oclockmoustache"

	fiveOclock
		name = "5 O'clock Shadow"
		icon_state = "facial_5oclock"

	fiveOclockstache
		name = "5 O'clock Shadow and Moustache"
		icon_state = "facial_5oclockmoustache"

	sevenOclock
		name = "7 O'clock Shadow"
		icon_state = "facial_7oclock"

	sevenOclockstache
		name = "7 O'clock Shadow and Moustache"
		icon_state = "facial_7oclockmoustache"

	mutton
		name = "Mutton Chops"
		icon_state = "facial_mutton"

	muttonstache
		name = "Mutton Chops and Moustache"
		icon_state = "facial_muttonmus"

	walrus
		name = "Walrus Moustache"
		icon_state = "facial_walrus"

	croppedbeard
		name = "Full Cropped Beard"
		icon_state = "facial_croppedfullbeard"

	chinless
		name = "Chinless Beard"
		icon_state = "facial_chinlessbeard"

	tribeard
		name = "Tribeard"
		icon_state = "facial_tribeard"

	moonshiner
		name = "Moonshiner"
		icon_state = "facial_moonshiner"

	martial
		name = "Martial Artist"
		icon_state = "facial_martialartist"
*/

/*
///////////////////////////////////
/  =---------------------------=  /
/  == Alien Style Definitions ==  /
/  =---------------------------=  /
///////////////////////////////////
Not in use currently.

/datum/sprite_accessory/hair
	una_spines_long
		name = "Long Unathi Spines"
		icon_state = "soghun_longspines"
		species_allowed = list(SPECIES_UNATHI)

	una_spines_short
		name = "Short Unathi Spines"
		icon_state = "soghun_shortspines"
		species_allowed = list(SPECIES_UNATHI)

	una_frills_long
		name = "Long Unathi Frills"
		icon_state = "soghun_longfrills"
		species_allowed = list(SPECIES_UNATHI)

	una_frills_short
		name = "Short Unathi Frills"
		icon_state = "soghun_shortfrills"
		species_allowed = list(SPECIES_UNATHI)

	una_horns
		name = "Unathi Horns"
		icon_state = "soghun_horns"
		species_allowed = list(SPECIES_UNATHI)

	una_bighorns
		name = "Unathi Big Horns"
		icon_state = "unathi_bighorn"
		species_allowed = list(SPECIES_UNATHI)

	una_smallhorns
		name = "Unathi Small Horns"
		icon_state = "unathi_smallhorn"
		species_allowed = list(SPECIES_UNATHI)

	una_ramhorns
		name = "Unathi Ram Horns"
		icon_state = "unathi_ramhorn"
		species_allowed = list(SPECIES_UNATHI)

	una_sidefrills
		name = "Unathi Side Frills"
		icon_state = "unathi_sidefrills"
		species_allowed = list(SPECIES_UNATHI)

//Skrell 'hairstyles'
	skr_tentacle_veryshort
		name = "Skrell Very Short Tentacles"
		icon_state = "skrell_hair_veryshort"
		species_allowed = list(SPECIES_SKRELL)
		gender = MALE

	skr_tentacle_short
		name = "Skrell Short Tentacles"
		icon_state = "skrell_hair_short"
		species_allowed = list(SPECIES_SKRELL)

	skr_tentacle_average
		name = "Skrell Average Tentacles"
		icon_state = "skrell_hair_average"
		species_allowed = list(SPECIES_SKRELL)

	skr_tentacle_verylong
		name = "Skrell Long Tentacles"
		icon_state = "skrell_hair_verylong"
		species_allowed = list(SPECIES_SKRELL)
		gender = FEMALE

//Tajaran hairstyles
	taj_ears
		name = "Tajaran Ears"
		icon_state = "ears_plain"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_clean
		name = "Tajaran Clean"
		icon_state = "hair_clean"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_bangs
		name = "Tajaran Bangs"
		icon_state = "hair_bangs"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_braid
		name = "Tajaran Braid"
		icon_state = "hair_tbraid"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_shaggy
		name = "Tajaran Shaggy"
		icon_state = "hair_shaggy"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_mohawk
		name = "Tajaran Mohawk"
		icon_state = "hair_mohawk"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_plait
		name = "Tajaran Plait"
		icon_state = "hair_plait"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_straight
		name = "Tajaran Straight"
		icon_state = "hair_straight"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_long
		name = "Tajaran Long"
		icon_state = "hair_long"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_rattail
		name = "Tajaran Rat Tail"
		icon_state = "hair_rattail"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_spiky
		name = "Tajaran Spiky"
		icon_state = "hair_tajspiky"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_messy
		name = "Tajaran Messy"
		icon_state = "hair_messy"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_curls
		name = "Tajaran Curly"
		icon_state = "hair_curly"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_wife
		name = "Tajaran Housewife"
		icon_state = "hair_wife"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_victory
		name = "Tajaran Victory Curls"
		icon_state = "hair_victory"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_bob
		name = "Tajaran Bob"
		icon_state = "hair_tbob"
		species_allowed = list(SPECIES_TAJ)

	taj_ears_fingercurl
		name = "Tajaran Finger Curls"
		icon_state = "hair_fingerwave"
		species_allowed = list(SPECIES_TAJ)

//Teshari things
	teshari
		name = "Teshari Default"
		icon_state = "teshari_default"
		species_allowed = list(SPECIES_TESHARI)

	teshari_altdefault
		name = "Teshari Alt. Default"
		icon_state = "teshari_ears"
		species_allowed = list(SPECIES_TESHARI)

	teshari_tight
		name = "Teshari Tight"
		icon_state = "teshari_tight"
		species_allowed = list(SPECIES_TESHARI)

	teshari_excited
		name = "Teshari Spiky"
		icon_state = "teshari_spiky"
		species_allowed = list(SPECIES_TESHARI)

	teshari_spike
		name = "Teshari Spike"
		icon_state = "teshari_spike"
		species_allowed = list(SPECIES_TESHARI)

	teshari_long
		name = "Teshari Overgrown"
		icon_state = "teshari_long"
		species_allowed = list(SPECIES_TESHARI)

	teshari_burst
		name = "Teshari Starburst"
		icon_state = "teshari_burst"
		species_allowed = list(SPECIES_TESHARI)

	teshari_shortburst
		name = "Teshari Short Starburst"
		icon_state = "teshari_burst_short"
		species_allowed = list(SPECIES_TESHARI)

	teshari_mohawk
		name = "Teshari Mohawk"
		icon_state = "teshari_mohawk"
		species_allowed = list(SPECIES_TESHARI)

	teshari_pointy
		name = "Teshari Pointy"
		icon_state = "teshari_pointy"
		species_allowed = list(SPECIES_TESHARI)

	teshari_upright
		name = "Teshari Upright"
		icon_state = "teshari_upright"
		species_allowed = list(SPECIES_TESHARI)

	teshari_mane
		name = "Teshari Mane"
		icon_state = "teshari_mane"
		species_allowed = list(SPECIES_TESHARI)

	teshari_droopy
		name = "Teshari Droopy"
		icon_state = "teshari_droopy"
		species_allowed = list(SPECIES_TESHARI)

	teshari_mushroom
		name = "Teshari Mushroom"
		icon_state = "teshari_mushroom"
		species_allowed = list(SPECIES_TESHARI)

// Vox things
	vox_braid_long
		name = "Long Vox braid"
		icon_state = "vox_longbraid"
		species_allowed = list(SPECIES_VOX)

	vox_braid_short
		name = "Short Vox Braid"
		icon_state = "vox_shortbraid"
		species_allowed = list(SPECIES_VOX)

	vox_quills_short
		name = "Short Vox Quills"
		icon_state = "vox_shortquills"
		species_allowed = list(SPECIES_VOX)

	vox_quills_kingly
		name = "Kingly Vox Quills"
		icon_state = "vox_kingly"
		species_allowed = list(SPECIES_VOX)

	vox_quills_mohawk
		name = "Quill Mohawk"
		icon_state = "vox_mohawk"
		species_allowed = list(SPECIES_VOX)
*/

/* More of these, still need confirmation and sprite porting.
/datum/sprite_accessory/facial_hair

	taj_sideburns
		name = "Tajaran Sideburns"
		icon_state = "facial_sideburns"
		species_allowed = list(SPECIES_TAJ)

	taj_mutton
		name = "Tajaran Mutton"
		icon_state = "facial_mutton"
		species_allowed = list(SPECIES_TAJ)

	taj_pencilstache
		name = "Tajaran Pencilstache"
		icon_state = "facial_pencilstache"
		species_allowed = list(SPECIES_TAJ)

	taj_moustache
		name = "Tajaran Moustache"
		icon_state = "facial_moustache"
		species_allowed = list(SPECIES_TAJ)

	taj_goatee
		name = "Tajaran Goatee"
		icon_state = "facial_goatee"
		species_allowed = list(SPECIES_TAJ)

	taj_smallstache
		name = "Tajaran Smallsatche"
		icon_state = "facial_smallstache"
		species_allowed = list(SPECIES_TAJ)
*/

/* VORE unconfirmed facial hair
/datum/sprite_accessory/facial_hair
	icon = 'icons/mob/human_face_or_vr.dmi'
	var/color_blend_mode = ICON_MULTIPLY
	species_allowed = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_TESHARI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_FLAT, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE) //This lets all races use the facial hair styles.

	shaved
		name = "Shaved"
		icon_state = "bald"
		gender = NEUTER
		species_allowed = list(SPECIES_HUMAN, SPECIES_SKRELL, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_TESHARI, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_SERGAL, SPECIES_ZORREN_FLAT, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE) //This needed to be manually defined, apparantly.


	vulp_none
		name = "None"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "none"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_blaze
		name = "Blaze"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_blaze"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_vulpine
		name = "Vulpine"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_vulpine"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_earfluff
		name = "Earfluff"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_earfluff"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_mask
		name = "Mask"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_mask"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_patch
		name = "Patch"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_patch"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_ruff
		name = "Ruff"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_ruff"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_kita
		name = "Kita"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_kita"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

	vulp_swift
		name = "Swift"
		icon = 'icons/mob/human_face_vr.dmi'
		icon_state = "vulp_facial_swift"
		species_allowed = list(SPECIES_VULPKANIN)
		gender = NEUTER

//Special hairstyles
/datum/sprite_accessory/ears/inkling
	name = "colorable mature inkling hair"
	desc = ""
	icon = 'icons/mob/human_face_vr.dmi'
	icon_state = "inkling-colorable"
	color_blend_mode = ICON_MULTIPLY
	do_colouration = 1*/
