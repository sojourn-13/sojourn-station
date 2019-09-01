/*
////////////////////////////
/  =--------------------=  /
/  ==  Body Markings   ==  /
/  =--------------------=  /
////////////////////////////
*/
/datum/sprite_accessory/marking
	icon = 'icons/mob/human_races/markings.dmi'
	colored_layers = 1 //Almost all of them have it, COLOR_ADD

	//Empty list is unrestricted. Should only restrict the ones that make NO SENSE on other species,
	//like Tajaran inner-ear coloring overlay stuff.
	species_allowed = list()

	var/body_parts = list() //A list of bodyparts this covers, in organ_tag defines
	//Reminder: BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN,BP_HEAD

	tat_heart
		name = "Tattoo (Heart, Torso)"
		icon_state = "tat_heart"
		body_parts = list(BP_TORSO)

	tat_hive
		name = "Tattoo (Hive, Back)"
		icon_state = "tat_hive"
		body_parts = list(BP_TORSO)

	tat_nightling
		name = "Tattoo (Nightling, Back)"
		icon_state = "tat_nightling"
		body_parts = list(BP_TORSO)

	tat_campbell
		name = "Tattoo (Campbell, R.Arm)"
		icon_state = "tat_campbell"
		body_parts = list(BP_R_ARM)

		left
			name = "Tattoo (Campbell, L.Arm)"
			body_parts = list(BP_L_ARM)

		rightleg
			name = "Tattoo (Campbell, R.Leg)"
			body_parts = list(BP_R_LEG)

		leftleg
			name = "Tattoo (Campbell, L.Leg)"
			body_parts = list (BP_L_LEG)

	tat_silverburgh
		name = "Tattoo (Silverburgh, R.Leg)"
		icon_state = "tat_silverburgh"
		body_parts = list (BP_R_LEG)

		left
			name = "Tattoo (Silverburgh, L.Leg)"
			icon_state = "tat_silverburgh"
			body_parts = list (BP_L_LEG)

	tat_tiger
		name = "Tattoo (Tiger Stripes, Body)"
		icon_state = "tat_tiger"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN)

	taj_paw_socks
		name = "Socks Coloration (Taj)"
		icon_state = "taj_pawsocks"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
		species_allowed = list(SPECIES_TAJ)

	una_paw_socks
		name = "Socks Coloration (Una)"
		icon_state = "una_pawsocks"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
		species_allowed = list(SPECIES_UNATHI)

	paw_socks
		name = "Socks Coloration (Generic)"
		icon_state = "pawsocks"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)
		species_allowed = list(SPECIES_TAJ, SPECIES_UNATHI)

	paw_socks_belly
		name = "Socks,Belly Coloration (Generic)"
		icon_state = "pawsocksbelly"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
		species_allowed = list(SPECIES_TAJ, SPECIES_UNATHI)

	belly_hands_feet
		name = "Hands,Feet,Belly Color (Minor)"
		icon_state = "bellyhandsfeetsmall"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
		species_allowed = list(SPECIES_TAJ, SPECIES_UNATHI)

	hands_feet_belly_full
		name = "Hands,Feet,Belly Color (Major)"
		icon_state = "bellyhandsfeet"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
		species_allowed = list(SPECIES_TAJ, SPECIES_UNATHI)

	hands_feet_belly_full_female
		name = "Hands,Feet,Belly Color (Major, Female)"
		icon_state = "bellyhandsfeet_female"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
		species_allowed = list(SPECIES_TAJ)

	patches
		name = "Color Patches"
		icon_state = "patches"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN)
		species_allowed = list(SPECIES_TAJ)

	patchesface
		name = "Color Patches (Face)"
		icon_state = "patchesface"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	bands
		name = "Color Bands"
		icon_state = "bands"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN)

	bandsface
		name = "Color Bands (Face)"
		icon_state = "bandsface"
		body_parts = list(BP_HEAD)

	tiger_stripes
		name = "Tiger Stripes"
		icon_state = "tiger"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_TORSO,BP_GROIN)
		species_allowed = list(SPECIES_TAJ) //There's a tattoo for non-cats

	tigerhead
		name = "Tiger Stripes (Head, Minor)"
		icon_state = "tigerhead"
		body_parts = list(BP_HEAD)

	tigerface
		name = "Tiger Stripes (Head, Major)"
		icon_state = "tigerface"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ) //There's a tattoo for non-cats

	backstripe
		name = "Back Stripe"
		icon_state = "backstripe"
		body_parts = list(BP_TORSO)

	//Taj specific stuff
	taj_belly
		name = "Belly Fur (Taj)"
		icon_state = "taj_belly"
		body_parts = list(BP_TORSO)
		species_allowed = list(SPECIES_TAJ)

	taj_bellyfull
		name = "Belly Fur Wide (Taj)"
		icon_state = "taj_bellyfull"
		body_parts = list(BP_TORSO)
		species_allowed = list(SPECIES_TAJ)

	taj_earsout
		name = "Outer Ear (Taj)"
		icon_state = "taj_earsout"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	taj_earsin
		name = "Inner Ear (Taj)"
		icon_state = "taj_earsin"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	taj_nose
		name = "Nose Color (Taj)"
		icon_state = "taj_nose"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	taj_crest
		name = "Chest Fur Crest (Taj)"
		icon_state = "taj_crest"
		body_parts = list(BP_TORSO)
		species_allowed = list(SPECIES_TAJ)

	taj_muzzle
		name = "Muzzle Color (Taj)"
		icon_state = "taj_muzzle"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	taj_face
		name = "Cheeks Color (Taj)"
		icon_state = "taj_face"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	taj_all
		name = "All Taj Head (Taj)"
		icon_state = "taj_all"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	//Una specific stuff
	una_face
		name = "Face Color (Una)"
		icon_state = "una_face"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_UNATHI)

	una_facelow
		name = "Face Color Low (Una)"
		icon_state = "una_facelow"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_UNATHI)

	una_scutes
		name = "Scutes (Una)"
		icon_state = "una_scutes"
		body_parts = list(BP_TORSO)
		species_allowed = list(SPECIES_UNATHI)

// VORE markings
//VOREStation Body Markings and Overrides
//Reminder: BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN,BP_HEAD

	vulp_belly
		name = "belly fur (Vulp)"
		icon_state = "vulp_belly"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	vulp_fullbelly
		name = "full belly fur (Vulp)"
		icon_state = "vulp_fullbelly"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	vulp_crest
		name = "belly crest (Vulp)"
		icon_state = "vulp_crest"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	vulp_nose
		name = "nose (Vulp)"
		icon_state = "vulp_nose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	snoutstripe
		name = "snout stripe (Vulp)"
		icon_state = "snoutstripe"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_face
		name = "face (Vulp)"
		icon_state = "vulp_face"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_earsface
		name = "ears and face (Vulp)"
		icon_state = "vulp_earsface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_all
		name = "all head highlights (Vulp)"
		icon_state = "vulp_all"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	sergal_full
		name = "Sergal Markings"
		icon_state = "sergal_full"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)
		species_allowed = list("Sergal")

	sergal_full_female
		name = "Sergal Markings (Female)"
		icon_state = "sergal_full_female"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)
		species_allowed = list("Sergal")

	monoeye
		name = "Monoeye"
		icon_state = "monoeye"
		body_parts = list(BP_HEAD)

	spidereyes
		name = "Spider Eyes"
		icon_state = "spidereyes"
		body_parts = list(BP_HEAD)

	sergaleyes
		name = "Sergal Eyes"
		icon_state = "eyes_sergal"
		body_parts = list(BP_HEAD)

	brows
		name = "Eyebrows"
		icon_state = "brows"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	nevrean_female
		name = "Female Nevrean beak"
		icon_state = "nevrean_f"
		body_parts = list(BP_HEAD)
		blend = ICON_MULTIPLY
		gender = FEMALE

	nevrean_male
		name = "Male Nevrean beak"
		icon_state = "nevrean_m"
		body_parts = list(BP_HEAD)
		blend = ICON_MULTIPLY
		gender = MALE

	spots
		name = "Spots"
		icon_state = "spots"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

	shaggy_mane
		name = "Shaggy mane/feathers"
		icon_state = "shaggy"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO)

	jagged_teeth
		name = "Jagged teeth"
		icon_state = "jagged"
		body_parts = list(BP_HEAD)

	blank_face
		name = "Blank round face (use with monster mouth)"
		icon_state = "blankface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	monster_mouth
		name = "Monster mouth"
		icon_state = "monster"
		body_parts = list(BP_HEAD)

	saber_teeth
		name = "Saber teeth"
		icon_state = "saber"
		body_parts = list(BP_HEAD)

	fangs
		name = "Fangs"
		icon_state = "fangs"
		body_parts = list(BP_HEAD)

	tusks
		name = "Tusks"
		icon_state = "tusks"
		body_parts = list(BP_HEAD)

	otie_face
		name = "Otie face"
		icon_state = "otieface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otie_nose
		name = "Otie nose"
		icon_state = "otie_nose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otienose_lite
		name = "Short otie nose"
		icon_state = "otienose_lite"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	backstripes
		name = "Back stripes"
		icon_state = "otiestripes"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_HEAD)

	belly_butt
		name = "Belly and butt"
		icon_state = "bellyandbutt"
		blend = ICON_MULTIPLY
		body_parts = list(BP_GROIN,BP_TORSO)

	fingers_toes
		name = "Fingers and toes"
		icon_state = "fingerstoes"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND)

	otie_socks
		name = "Fingerless socks"
		icon_state = "otiesocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)

	corvid_beak
		name = "Corvid beak"
		icon_state = "corvidbeak"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	corvid_belly
		name = "Corvid belly"
		icon_state = "corvidbelly"
		blend = ICON_MULTIPLY
		body_parts = list(BP_GROIN,BP_TORSO,BP_HEAD)

	cow_body
		name = "Cow markings"
		icon_state = "cowbody"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	cow_nose
		name = "Cow nose"
		icon_state = "cownose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	zmask
		name = "Eye mask"
		icon_state = "zmask"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	zbody
		name = "Thick jagged stripes"
		icon_state = "zbody"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_GROIN,BP_TORSO)

	znose
		name = "Jagged snout"
		icon_state = "znose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otter_nose
		name = "Otter nose"
		icon_state = "otternose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otter_face
		name = "Otter face"
		icon_state = "otterface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	deer_face
		name = "Deer face"
		icon_state = "deerface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	sharkface
		name = "Akula snout"
		icon_state = "sharkface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	sheppy_face
		name = "Shepherd snout"
		icon_state = "shepface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	sheppy_back
		name = "Shepherd back"
		icon_state = "shepback"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	zorren_belly_male
		name = "Zorren Male Torso"
		icon_state = "zorren_belly"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	zorren_belly_female
		name = "Zorren Female Torso"
		icon_state = "zorren_belly_female"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	zorren_back_patch
		name = "Zorren Back Patch"
		icon_state = "zorren_backpatch"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO)

	zorren_face_male
		name = "Zorren Male Face"
		icon_state = "zorren_face"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		gender = MALE

	zorren_face_female
		name = "Zorren Female Face"
		icon_state = "zorren_face_female"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		gender = FEMALE

	zorren_muzzle_male
		name = "Zorren Male Muzzle"
		icon_state = "zorren_muzzle"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		gender = MALE

	zorren_muzzle_female
		name = "Zorren Female Muzzle"
		icon_state = "zorren_muzzle_female"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)
		gender = FEMALE

	zorren_socks
		name = "Zorren Socks"
		icon_state = "zorren_socks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)

	zorren_longsocks
		name = "Zorren Longsocks"
		icon_state = "zorren_longsocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)

	tesh_feathers
		name = "Teshari Feathers"
		icon_state = "tesh-feathers"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND)

	harpy_feathers
		name = "Rapala leg Feather"
		icon_state = "harpy-feathers"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG)

	harpy_legs
		name = "Rapala leg coloring"
		icon_state = "harpy-leg"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)

	chooves
		name = "Cloven hooves"
		icon_state = "chooves"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT)

	alurane
		name = "Alraune Body"
		icon_state = "alurane"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	body_tone
		name = "Body toning (for emergency contrast loss)"
		icon_state = "btone"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

	gloss
		name = "Full body gloss"
		icon_state = "gloss"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	eboop_panels
		name = "Eggnerd FBP panels"
		icon_state = "eboop"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	osocks_rarm
		name = "Modular Longsock (right arm)"
		icon_state = "osocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM,BP_R_HAND)

	osocks_larm
		name = "Modular Longsock (left arm)"
		icon_state = "osocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM,BP_L_HAND)

	osocks_rleg
		name = "Modular Longsock (right leg)"
		icon_state = "osocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_FOOT,BP_R_LEG)

	osocks_lleg
		name = "Modular Longsock (left leg)"
		icon_state = "osocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_L_LEG)

	animeeyesinner
		name = "Anime Eyes Inner"
		icon_state = "animeeyesinner"
		body_parts = list(BP_HEAD)

	animeeyesouter
		name = "Anime Eyes Outer"
		icon_state = "animeeyesouter"
		body_parts = list(BP_HEAD)

	panda_eye_marks
		name = "Panda Eye Markings"
		icon_state = "eyes_panda"
		body_parts = list(BP_HEAD)
		species_allowed = list("Human")

	catwomantorso
		name = "Catwoman chest stripes"
		icon_state = "catwomanchest"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO)

	catwomangroin
		name = "Catwoman groin stripes"
		icon_state = "catwomangroin"
		blend = ICON_MULTIPLY
		body_parts = list(BP_GROIN)

	catwoman_rleg
		name = "Catwoman right leg stripes"
		icon_state = "catwomanright"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG)

	catwoman_lleg
		name = "Catwoman left leg stripes"
		icon_state = "catwomanleft"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG)

	teshi_fluff
		name = "Teshari underfluff"
		icon_state = "teshi_fluff"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_GROIN,BP_TORSO,BP_HEAD)

	teshi_small_feathers
		name = "Teshari small wingfeathers"
		icon_state = "teshi_sf"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND,BP_TORSO)

	spirit_lights
		name = "Ward - Spirit FBP Lights"
		icon_state = "lights"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_HEAD)

	spirit_lights_body
		name = "Ward - Spirit FBP Lights (body)"
		icon_state = "lights"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO)

	spirit_lights_head
		name = "Ward - Spirit FBP Lights (head)"
		icon_state = "lights"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	spirit_panels
		name = "Ward - Spirit FBP Panels"
		icon_state = "panels"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	spirit_panels_body
		name = "Ward - Spirit FBP Panels (body)"
		icon_state = "panels"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

	spirit_panels_head
		name = "Ward - Spirit FBP Panels (head)"
		icon_state = "panels"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	heterochromia
		name = "Heterochromia"
		icon_state = "heterochromia"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_ZORREN_FLAT, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_XENOCHIMERA, SPECIES_XENOHYBRID, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_PROTEAN, SPECIES_ALRAUNE) //This lets all races use the default hairstyles.

	demon_horns2
		name = "demon horns(outward)"
		icon_state = "demon-horns2"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	dragon_horns
		name = "Dragon Horns"
		icon_state = "dragon-horns"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)