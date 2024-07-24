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
	//like feline inner-ear coloring overlay stuff.
	species_allowed = list()

	var/body_parts = list() //A list of bodyparts this covers, in organ_tag defines
	//Reminder: BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN,BP_HEAD

	alraune
		name = "Alraune Body"
		icon_state = "alraune"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	mooscles
		name = "Toned Muscles (Male)"
		icon_state = "poomp_male"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO, BP_GROIN, BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM) // I don't know if the arms and legs are THAT affected but let's not skip biceps and leg day. - Seb

	mooscles_f
		name = "Toned Muscles (Female)"
		icon_state = "poomp_female"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO, BP_GROIN, BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM)

/*Anime Eyes*/

	animeeyesinner
		name = "Anime Eyes Inner"
		icon_state = "animeeyesinner"
		body_parts = list(BP_HEAD)

	animeeyesouter
		name = "Anime Eyes Outer"
		icon_state = "animeeyesouter"
		body_parts = list(BP_HEAD)

	bugeyeleft
		name = "Bug Eye (Left)"
		icon_state = "bugeyeleft"
		body_parts = list(BP_HEAD)

	bugeyeright
		name = "Bug Eye (right)"
		icon_state = "bugeyeright"
		body_parts = list(BP_HEAD)

	oneye
		name = "Cyclops monoeye"
		icon_state = "cyclops"
		body_parts = list(BP_HEAD)

	bigeye
		name = "Cyclops monoeye (big) - Use with Blank Round Face"
		icon_state = "cyclops_big"
		body_parts = list(BP_HEAD)

/*Back Stripe*/

	backstripe
		name = "Back Stripe"
		icon_state = "backstripe"
		body_parts = list(BP_TORSO)

	backstripes
		name = "Back Stripes"
		icon_state = "otiestripes"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_HEAD)

/*Belly Hands Feet*/

	belly_butt
		name = "Belly And Butt"
		icon_state = "bellyandbutt"
		blend = ICON_MULTIPLY
		body_parts = list(BP_GROIN,BP_TORSO)

	belly_hands_feet
		name = "Belly, Hands, Feet Color (Minor)"
		icon_state = "bellyhandsfeetsmall"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
		species_allowed = list(SPECIES_TAJ, SPECIES_UNATHI)

	hands_feet_belly_full
		name = "Belly, Hands, Feet Color (Major)"
		icon_state = "bellyhandsfeet"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
		species_allowed = list(SPECIES_TAJ, SPECIES_UNATHI)

	hands_feet_belly_full_female
		name = "Belly, Hands, Feet Color (Major, Female)"
		icon_state = "bellyhandsfeet_female"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)
		species_allowed = list(SPECIES_TAJ)

	blank_face
		name = "Blank Round Face"
		icon_state = "blankface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	body_tone
		name = "Body Toning (For Emergency Contrast Loss)"
		icon_state = "btone"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

/*Catwoman*/

	catwomantorso
		name = "Catwoman Chest Stripes"
		icon_state = "catwomanchest"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO)

	catwomangroin
		name = "Catwoman Groin Stripes"
		icon_state = "catwomangroin"
		blend = ICON_MULTIPLY
		body_parts = list(BP_GROIN)

	catwoman_rleg
		name = "Catwoman Right Leg Stripes"
		icon_state = "catwomanright"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG)

	catwoman_lleg
		name = "Catwoman Left Leg Stripes"
		icon_state = "catwomanleft"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG)

	chooves
		name = "Cloven Hooves"
		icon_state = "chooves"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT)

/*Makeup + Lipstick*/

	lipstick
		name = "Lipstick (Human/Regular)"
		icon_state = "lipstick"
		body_parts = list(BP_HEAD)

	lipstickkriosan
		name = "Lipstick (Kriosan/Vulpkanin)"
		icon_state = "lipstickkriosan"
		body_parts = list(BP_HEAD)

	lipsticknaramad
		name = "Lipstick (Naramad)"
		icon_state = "lipsticknaramad"
		body_parts = list(BP_HEAD)

	lipstickakula
		name = "Lipstick (Akula)"
		icon_state = "lipstickakula"
		body_parts = list(BP_HEAD)

/*Color Bands + Patches*/

	bands
		name = "Color Bands"
		icon_state = "bands"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_GROIN)

	bandsface
		name = "Color Bands (Face)"
		icon_state = "bandsface"
		body_parts = list(BP_HEAD)

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

	corvid_beak
		name = "Corvid Beak"
		icon_state = "corvidbeak"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	corvid_belly
		name = "Corvid Belly"
		icon_state = "corvidbelly"
		blend = ICON_MULTIPLY
		body_parts = list(BP_GROIN,BP_TORSO,BP_HEAD)

	cow_body
		name = "Cow Markings"
		icon_state = "cowbody"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	cow_nose
		name = "Cow Nose"
		icon_state = "cownose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	deer_face
		name = "Deer Face"
		icon_state = "deerface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	ram_horns
		name = "Ram Horns"
		icon_state = "ram-horns"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	demon_horns2
		name = "Demon Horns"
		icon_state = "demon-horns2"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	dragon_horns
		name = "Dragon Horns"
		icon_state = "dragon-horns"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	uni_horn
		name = "Unicorn Horn"
		icon_state = "unicorn_horn"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	elven_ears
		name = "Elven Ears"
		icon_state = "elfs"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	brows
		name = "Eyebrows"
		icon_state = "brows"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	zmask
		name = "Eye Mask"
		icon_state = "zmask"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	fangs
		name = "Fangs"
		icon_state = "fangs"
		body_parts = list(BP_HEAD)

	fangskriosan
		name = "Fangs (Kriosan/Vulpkanin)"
		icon_state = "fangskriosan"
		body_parts = list(BP_HEAD)

	eboop_panels
		name = "FBP panels"
		icon_state = "eboop"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	fingers_toes
		name = "Fingers And Toes"
		icon_state = "fingerstoes"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND)

	otie_socks
		name = "Fingerless Socks"
		icon_state = "otiesocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND)

	gloss
		name = "Full Body Gloss"
		icon_state = "gloss"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	heterochromia
		name = "Heterochromia"
		icon_state = "heterochromia"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_HUMAN, SPECIES_UNATHI, SPECIES_TAJ, SPECIES_NEVREAN, SPECIES_AKULA, SPECIES_ZORREN_FLAT, SPECIES_ZORREN_HIGH, SPECIES_VULPKANIN, SPECIES_VASILISSAN, SPECIES_RAPALA, SPECIES_ALRAUNE) //This lets all races use the default hairstyles.

	otie_face
		name = "Hound Face"
		icon_state = "otieface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otienose_lite
		name = "Hound Nose"
		icon_state = "otienose_lite"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	znose
		name = "Jagged Snout"
		icon_state = "znose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	jagged_teeth
		name = "Jagged Teeth"
		icon_state = "jagged"
		body_parts = list(BP_HEAD)

/*Handlebars*/
	handlebars
		name = "Handlebars"
		icon_state = "handlebars"
		body_parts = list(BP_HEAD)

/*FBP 'chasis' markings*/
	athena_body
		name = "FBP-Athena chassis"
		icon_state ="athena"
		body_parts = list(BP_GROIN,BP_TORSO)

	athena_head
		name = "FBP-Athena head"
		icon_state ="athena"
		body_parts = list(BP_HEAD)

	ward_body
		name = "FBP-Ward Takehashi chassis"
		icon_state ="ward"
		body_parts = list(BP_GROIN,BP_TORSO)

	ward_head
		name = "FBP-Ward Takehashi head"
		icon_state ="ward"
		body_parts = list(BP_HEAD)

	hesphaistos_body
		name = "FBP-Hesphaistos chassis"
		icon_state ="hesphaistos"
		body_parts = list(BP_GROIN,BP_TORSO)

	hesphaistos_head
		name = "FBP-Hesphaistos head"
		icon_state ="hesphaistos"
		body_parts = list(BP_HEAD)

	bishop_body
		name = "FBP-Bishop chassis"
		icon_state ="bishop"
		body_parts = list(BP_GROIN,BP_TORSO)

	bishop_head
		name = "FBP-Bishop head"
		icon_state ="bishop"
		body_parts = list(BP_HEAD)

	xion_body
		name = "FBP-Xion chassis"
		icon_state ="xion"
		body_parts = list(BP_GROIN,BP_TORSO)

	xion_head
		name = "FBP-Xion head"
		icon_state ="xion"
		body_parts = list(BP_HEAD)

	spirit_body
		name = "FBP-Ward Spirit chassis"
		icon_state ="spirit"
		body_parts = list(BP_GROIN,BP_TORSO)

	spirit_head
		name = "FBP-Ward Spirit head"
		icon_state ="spirit"
		body_parts = list(BP_HEAD)

	warmonger_body
		name = "FBP-Warmonger chassis"
		icon_state ="warmonger"
		body_parts = list(BP_GROIN,BP_TORSO)

	warmonger_head
		name = "FBP-Warmonger head"
		icon_state ="warmonger"
		body_parts = list(BP_HEAD)

	bishop_alt_optics
		name = "FBP-Bishop Alt. Optics (IPC)"
		icon_state = "bishop_alt_optics"
		body_parts = list(BP_HEAD)

	ward_alt_optics
		name = "FBP-Ward Takahashi Alt. Optics (IPC)"
		icon_state = "wardtakahashi_alt_optics"
		body_parts = list(BP_HEAD)

	xion_alt_optics
		name = "FBP-Xion Alt. Optics (IPC)"
		icon_state = "xion_alt_optics"
		body_parts = list(BP_HEAD)

	hesphaistos_alt_optics
		name = "FBP-Hesphaistos Alt. Optics (IPC)"
		icon_state = "hephaestus_alt_optics"
		body_parts = list(BP_HEAD)

	morpheus_alt_optics
		name = "FBP-Morpheus Optics (IPC)"
		icon_state = "morpheus_optics"
		body_parts = list(BP_HEAD)

	synth_eyes_l
		name = "FBP-Synthflesh eye (left)"
		icon_state = "synth_eye_l"
		body_parts = list(BP_HEAD)

	synth_eyes_r
		name = "FBP-Synthflesh eye (right)"
		icon_state = "synth_eye_r"
		body_parts = list(BP_HEAD)

	synthskin_human
		name = "FBP-Human synthskin"
		icon_state = "synthskinhuman"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	synthskin_humanf
		name = "FBP-Human Female synthskin"
		icon_state = "synthskinhumanf"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	synthskin_canine
		name = "FBP-Canine synthskin"
		icon_state = "synthskincanine"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	synthskin_feline
		name = "FBP-Feline synthskin"
		icon_state = "synthskinfeline"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	synthskin_shark
		name = "FBP-Shark synthskin"
		icon_state = "synthskinshark"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	synthskin_lizard
		name = "FBP-Lizard synthskin"
		icon_state = "synthskinlizard"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)


/*Modular Longsock*/

	osocks_rarm
		name = "Modular Longsock (Right Arm)"
		icon_state = "osocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM,BP_R_HAND)

	osocks_larm
		name = "Modular Longsock (Left Arm)"
		icon_state = "osocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM,BP_L_HAND)

	osocks_rleg
		name = "Modular Longsock (Right Leg)"
		icon_state = "osocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_FOOT,BP_R_LEG)

	osocks_lleg
		name = "Modular Longsock (Left Leg)"
		icon_state = "osocks"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_L_LEG)

	monoeye
		name = "Monoeye"
		icon_state = "monoeye"
		body_parts = list(BP_HEAD)

	monster_mouth
		name = "Monster Mouth (Use With Blank Round Face)"
		icon_state = "monster"
		body_parts = list(BP_HEAD)

/*Nev*/

	nevrean_female
		name = "Nevrean Female beak"
		icon_state = "nevrean_f"
		body_parts = list(BP_HEAD)
		blend = ICON_MULTIPLY
		gender = FEMALE

	nevrean_male
		name = "Nevrean Male Beak"
		icon_state = "nevrean_m"
		body_parts = list(BP_HEAD)
		blend = ICON_MULTIPLY
		gender = MALE

/*Otter*/

	otter_face
		name = "Otter Face"
		icon_state = "otterface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otter_nose
		name = "Otter Nose"
		icon_state = "otternose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	otie_nose
		name = "Hound Nose"
		icon_state = "otie_nose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	panda_eye_marks
		name = "Panda Eye Markings"
		icon_state = "eyes_panda"
		body_parts = list(BP_HEAD)
		species_allowed = list("Human")

/*Rapala*/

	harpy_feathers
		name = "Rapala Leg Feather"
		icon_state = "harpy-feathers"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG)

	harpy_legs
		name = "Rapala Leg Coloring"
		icon_state = "harpy-leg"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG)

	saber_teeth
		name = "Saber Teeth"
		icon_state = "saber"
		body_parts = list(BP_HEAD)

	sharkface
		name = "Shark Snout"
		icon_state = "sharkface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	sheppy_back
		name = "Shepherd Back"
		icon_state = "shepback"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	sheppy_face
		name = "Shepherd Snout"
		icon_state = "shepface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

/*Sergal*/

	sergaleyes
		name = "Naramad Eyes"
		icon_state = "eyes_sergal"
		body_parts = list(BP_HEAD)

	sergal_full
		name = "Naramad Markings"
		icon_state = "sergal_full"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)
		species_allowed = list("Naramad")

	sergal_full_female
		name = "Naramad Markings (Female)"
		icon_state = "sergal_full_female"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)
		species_allowed = list("Naramad")

	shaggy_mane
		name = "Shaggy Mane/Feathers"
		icon_state = "shaggy"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO)

	spidereyes
		name = "Spider Eyes"
		icon_state = "spidereyes"
		body_parts = list(BP_HEAD)

	spots
		name = "Spots"
		icon_state = "spots"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

/*Socks*/

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

/*Taj*/

	taj_belly
		name = "Feline Belly Fur"
		icon_state = "taj_belly"
		body_parts = list(BP_TORSO)
		species_allowed = list(SPECIES_TAJ)

	taj_bellyfull
		name = "Feline Belly Fur Wide"
		icon_state = "taj_bellyfull"
		body_parts = list(BP_TORSO)
		species_allowed = list(SPECIES_TAJ)

	taj_earsout
		name = "Feline Outer Ear"
		icon_state = "taj_earsout"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	taj_earsin
		name = "Feline Inner Ear"
		icon_state = "taj_earsin"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	taj_nose
		name = "Feline Nose Color"
		icon_state = "taj_nose"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	taj_crest
		name = "Feline Chest Fur Crest"
		icon_state = "taj_crest"
		body_parts = list(BP_TORSO)
		species_allowed = list(SPECIES_TAJ)

	taj_muzzle
		name = "Feline Muzzle Color"
		icon_state = "taj_muzzle"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	taj_face
		name = "Feline Cheeks Color"
		icon_state = "taj_face"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

	taj_all
		name = "Feline All Head"
		icon_state = "taj_all"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_TAJ)

/*Tattoo*/

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

/*Tesh*/
/*
	tesh_feathers
		name = "Teshari Feathers"
		icon_state = "tesh-feathers"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND)

	teshi_fluff
		name = "Teshari Underfluff"
		icon_state = "teshi_fluff"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_GROIN,BP_TORSO,BP_HEAD)

	teshi_small_feathers
		name = "Teshari Small Wingfeathers"
		icon_state = "teshi_sf"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_HAND,BP_R_HAND,BP_TORSO)

	zbody
		name = "Thick Jagged Stripes"
		icon_state = "zbody"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_GROIN,BP_TORSO)
*/
/*Tiger*/

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

	tusks
		name = "Tusks"
		icon_state = "tusks"
		body_parts = list(BP_HEAD)

/*Una*/

	una_face
		name = "Una Face Color"
		icon_state = "una_face"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_UNATHI)

	una_facelow
		name = "Una Face Color Low"
		icon_state = "una_facelow"
		body_parts = list(BP_HEAD)
		species_allowed = list(SPECIES_UNATHI)

	una_scutes
		name = "Una Scutes"
		icon_state = "una_scutes"
		body_parts = list(BP_TORSO)
		species_allowed = list(SPECIES_UNATHI)

/*Vulp*/

	vulp_belly
		name = "Vulp Belly Fur"
		icon_state = "vulp_belly"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	vulp_fullbelly
		name = "Vulp Full Belly Fur"
		icon_state = "vulp_fullbelly"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	vulp_crest
		name = "Vulp Berry Crest"
		icon_state = "vulp_crest"
		blend = ICON_MULTIPLY
		body_parts = list(BP_TORSO,BP_GROIN)

	vulp_nose
		name = "Vulp Nose"
		icon_state = "vulp_nose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	bat_nose
		name = "Bat Nose"
		icon_state = "bat_nose"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	snoutstripe
		name = "Vulp Snout Stripe"
		icon_state = "snoutstripe"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_face
		name = "Vulp Face"
		icon_state = "vulp_face"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_earsface
		name = "Vulp Ears And Face"
		icon_state = "vulp_earsface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	vulp_all
		name = "Vulp All Head Highlights"
		icon_state = "vulp_all"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

/*Wards*/

	spirit_lights
		name = "Ward - Spirit FBP Lights"
		icon_state = "lights"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO,BP_HEAD)

	spirit_lights_body
		name = "Ward - Spirit FBP Lights (Body)"
		icon_state = "lights"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_TORSO)

	spirit_lights_head
		name = "Ward - Spirit FBP Lights (Head)"
		icon_state = "lights"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	spirit_panels
		name = "Ward - Spirit FBP Panels"
		icon_state = "panels"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)

	spirit_panels_body
		name = "Ward - Spirit FBP Panels (Body)"
		icon_state = "panels"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO)

	spirit_panels_head
		name = "Ward - Spirit FBP Panels (Head)"
		icon_state = "panels"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

/*Zorren*/

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

/*Bone*/

	sbone
		name = "Sablekyne (Bone, R.Arm)"
		icon_state = "sbone"
		body_parts = list(BP_R_ARM)

		left
			name = "Sablekyne (Bone, L.Arm)"
			body_parts = list(BP_L_ARM)

		rightleg
			name = "Sablekyne (Bone, R.Leg)"
			body_parts = list(BP_R_LEG)

		leftleg
			name = "Sablekyne (Bone, L.Leg)"
			body_parts = list (BP_L_LEG)

/*Marqua*/

	frogeyes
		name = "Marqua Eyes"
		icon_state = "frogeyes"
		body_parts = list(BP_HEAD)

/*Horse*/

	horseface
		name = "Horse Face"
		icon_state = "horseface"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

	horsemuzzle
		name = "Horse Muzzle"
		icon_state = "horsemuzzle"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

/*Bandages*/

	bandage_head
		name = "Bandage - Head"
		icon_state = "bandage"
		blend = ICON_MULTIPLY
		body_parts = list(BP_HEAD)

//Left Arm

	bandage_l_arm
		name = "Bandage - Left Arm"
		icon_state = "bandage"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM)

//Left Hand

	bandage_l_hand
		name = "Bandage - Left Hand"
		icon_state = "bandage"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_HAND)

//Left Leg

	bandage_l_leg
		name = "Bandage - Left Leg"
		icon_state = "bandage"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG)

//Left Foot

	bandage_l_foot
		name = "Bandage - Left Foot"
		icon_state = "bandage"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_FOOT)

//Right Arm

	bandage_r_arm
		name = "Bandage - Right Arm"
		icon_state = "bandage"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM)

//Right Hand

	bandage_r_hand
		name = "Bandage - Right Hand"
		icon_state = "bandage"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_HAND)

//Right Leg

	bandage_r_leg
		name = "Bandage - Right Leg"
		icon_state = "bandage"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG)

//Right Foot

	bandage_r_foot
		name = "Bandage - Right Foot"
		icon_state = "bandage"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_FOOT)

/*Jackal*/

	jackal_bare
		name = "Jackal Back"
		icon_state = "jackal_bareback"
		body_parts = list(BP_CHEST, BP_GROIN, BP_L_ARM, BP_R_ARM)
		blend = ICON_MULTIPLY

	jackal_spotted
		name = "Jackal Markings"
		icon_state = "jackal_backpattern"
		body_parts = list(BP_CHEST, BP_L_ARM, BP_R_ARM)
		blend = ICON_MULTIPLY

/*Prosthetic Markings*/

//church

	church_arm_right_male
		name = "Absolute Prosthetic Right Arm, Male"
		icon_state = "church_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	chuch_arm_left_male
		name = "Absolute Prosthetic Left Arm, Male"
		icon_state = "church_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	church_leg_right_male
		name = "Absolute Prosthetic Right Leg, Male"
		icon_state = "church_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	church_leg_left_male
		name = "Absolute Prosthetic Left Leg, Male"
		icon_state = "church_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	church_arm_right_female
		name = "Absolute Prosthetic Right Arm, Female"
		icon_state = "church_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	chuch_arm_left_female
		name = "Absolute Prosthetic Left Arm, Female"
		icon_state = "church_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	church_leg_right_female
		name = "Absolute Prosthetic Right Leg, Female"
		icon_state = "church_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	church_leg_left_female
		name = "Absolute Prosthetic Left Leg, Female"
		icon_state = "church_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//junktech/ghetto

	ghetto_arm_right_male
		name = "Junktech Prosthetic Right Arm, Male"
		icon_state = "ghetto_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	ghetto_arm_left_male
		name = "Junktech Prosthetic Left Arm, Male"
		icon_state = "ghetto_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	ghetto_leg_right_male
		name = "Junktech Prosthetic Right Leg, Male"
		icon_state = "ghetto_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	ghetto_leg_left_male
		name = "Junktech Prosthetic Left Leg, Male"
		icon_state = "ghetto_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	ghetto_arm_right_female
		name = "Junktech Prosthetic Right Arm, Female"
		icon_state = "ghetto_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	ghetto_arm_left_female
		name = "Junktech Prosthetic Left Arm, Female"
		icon_state = "ghetto_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	ghetto_leg_right_female
		name = "Junktech Prosthetic Right Leg, Female"
		icon_state = "ghetto_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	ghetto_leg_left_female
		name = "Junktech Prosthetic Left Leg, Female"
		icon_state = "ghetto_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Lonestar Movement Lock

	lonestar_arm_right_male
		name = "Lonestar Prosthetic Right Arm, Male"
		icon_state = "lonestar_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	lonestar_arm_left_male
		name = "Lonestar Prosthetic Left Arm, Male"
		icon_state = "lonestar_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	lonestar_leg_right_male
		name = "Lonestar Prosthetic Right Leg, Male"
		icon_state = "lonestar_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	lonestar_leg_left_male
		name = "Lonestar Prosthetic Left Leg, Male"
		icon_state = "lonestar_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	lonestar_arm_right_female
		name = "Lonestar Prosthetic Right Arm, Female"
		icon_state = "lonestar_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	lonestar_arm_left_female
		name = "Lonestar Prosthetic Left Arm, Female"
		icon_state = "lonestar_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	lonestar_leg_right_female
		name = "Lonestar Prosthetic Right Leg, Female"
		icon_state = "lonestar_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	lonestar_leg_left_female
		name = "Lonestar Prosthetic Left Leg, Female"
		icon_state = "lonestar_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Bishop

	bishop_arm_right_male
		name = "Bishop Prosthetic Right Arm, Male"
		icon_state = "bishop_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	bishop_arm_left_male
		name = "Bishop Prosthetic Left Arm, Male"
		icon_state = "bishop_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	bishop_leg_right_male
		name = "Bishop Prosthetic Right Leg, Male"
		icon_state = "bishop_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	bishop_leg_left_male
		name = "Bishop Prosthetic Left Leg, Male"
		icon_state = "bishop_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	bishop_arm_right_female
		name = "Bishop Prosthetic Right Arm, Female"
		icon_state = "bishop_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	bishop_arm_left_female
		name = "Bishop Prosthetic Left Arm, Female"
		icon_state = "bishop_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	bishop_leg_right_female
		name = "Bishop Prosthetic Right Leg, Female"
		icon_state = "bishop_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	bishop_leg_left_female
		name = "Bishop Prosthetic Left Leg, Female"
		icon_state = "bishop_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Blackshield

	blackshield_arm_right_male
		name = "Blackshield Prosthetic Right Arm, Male"
		icon_state = "bs_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	blackshield_arm_left_male
		name = "Blackshield Prosthetic Left Arm, Male"
		icon_state = "bs_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	blackshield_leg_right_male
		name = "Blackshield Prosthetic Right Leg, Male"
		icon_state = "bs_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	blackshield_leg_left_male
		name = "Blackshield Prosthetic Left Leg, Male"
		icon_state = "bs_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	blackshield_arm_right_female
		name = "Blackshield Prosthetic Right Arm, Female"
		icon_state = "bs_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	blackshield_arm_left_female
		name = "Blackshield Prosthetic Left Arm, Female"
		icon_state = "bs_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	blackshield_leg_right_female
		name = "Blackshield Prosthetic Right Leg, Female"
		icon_state = "bs_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	blackshield_leg_left_female
		name = "Blackshield Prosthetic Left Leg, Female"
		icon_state = "bs_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Soteria

	soteria_arm_right_male
		name = "Soteria Prosthetic Right Arm, Male"
		icon_state = "soteria_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	soteria_arm_left_male
		name = "Soteria Prosthetic Left Arm, Male"
		icon_state = "soteria_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	soteria_leg_right_male
		name = "Soteria Prosthetic Right Leg, Male"
		icon_state = "soteria_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	soteria_leg_left_male
		name = "Soteria Prosthetic Left Leg, Male"
		icon_state = "soteria_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	soteria_arm_right_female
		name = "Soteria Prosthetic Right Arm, Female"
		icon_state = "soteria_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	soteria_arm_left_female
		name = "Soteria Prosthetic Left Arm, Female"
		icon_state = "soteria_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	soteria_leg_right_female
		name = "Soteria Prosthetic Right Leg, Female"
		icon_state = "soteria_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	soteria_leg_left_female
		name = "Soteria Prosthetic Left Leg, Female"
		icon_state = "soteria_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//FBP blank

	fbp_arm_right_male
		name = "FBP Prosthetic Right Arm, Male"
		icon_state = "fbp_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	fbp_arm_left_male
		name = "FBP Prosthetic Left Arm, Male"
		icon_state = "fbp_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	fbp_leg_right_male
		name = "FBP Prosthetic Right Leg, Male"
		icon_state = "fbp_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	fbp_leg_left_male
		name = "FBP Prosthetic Left Leg, Male"
		icon_state = "fbp_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	fbp_arm_right_female
		name = "FBP Prosthetic Right Arm, Female"
		icon_state = "fbp_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	fbp_arm_left_female
		name = "FBP Prosthetic Left Arm, Female"
		icon_state = "fbp_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	fbp_leg_right_female
		name = "FBP Prosthetic Right Leg, Female"
		icon_state = "fbp_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	fbp_leg_left_female
		name = "FBP Prosthetic Left Leg, Female"
		icon_state = "fbp_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Generic / Robotic

	generic_arm_right_male
		name = "Generic Prosthetic Right Arm, Male"
		icon_state = "generic_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	generic_arm_left_male
		name = "Generic Prosthetic Left Arm, Male"
		icon_state = "generic_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	generic_leg_right_male
		name = "Generic Prosthetic Right Leg, Male"
		icon_state = "generic_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	generic_leg_left_male
		name = "Generic Prosthetic Left Leg, Male"
		icon_state = "generic_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	generic_arm_right_female
		name = "Generic Prosthetic Right Arm, Female"
		icon_state = "generic_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	generic_arm_left_female
		name = "Generic Prosthetic Left Arm, Female"
		icon_state = "generic_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	generic_leg_right_female
		name = "Generic Prosthetic Right Leg, Female"
		icon_state = "generic_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	generic_leg_left_female
		name = "Generic Prosthetic Left Leg, Female"
		icon_state = "generic_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Hephaistos Default

	heph_arm_right_male
		name = "Hephaistos Prosthetic Right Arm, Male"
		icon_state = "heph_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	heph_arm_left_male
		name = "Hephaistos Prosthetic Left Arm, Male"
		icon_state = "heph_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	heph_leg_right_male
		name = "Hephaistos Prosthetic Right Leg, Male"
		icon_state = "heph_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	heph_leg_left_male
		name = "Hephaistos Prosthetic Left Leg, Male"
		icon_state = "heph_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	heph_arm_right_female
		name = "Hephaistos Prosthetic Right Arm, Female"
		icon_state = "heph_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	heph_arm_left_female
		name = "Hephaistos Prosthetic Left Arm, Female"
		icon_state = "heph_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	heph_leg_right_female
		name = "Hephaistos Prosthetic Right Leg, Female"
		icon_state = "heph_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	heph_leg_left_female
		name = "Hephaistos Prosthetic Left Leg, Female"
		icon_state = "heph_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Hephaistos Athena

	athena_arm_right_male
		name = "Hephaistos Prosthetic Right Arm, Male"
		icon_state = "athena_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	athena_arm_left_male
		name = "Hephaistos Prosthetic Left Arm, Male"
		icon_state = "athena_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	athena_leg_right_male
		name = "Hephaistos Prosthetic Right Leg, Male"
		icon_state = "athena_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	athena_leg_left_male
		name = "Hephaistos Prosthetic Left Leg, Male"
		icon_state = "athena_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	athena_arm_right_female
		name = "Hephaistos Prosthetic Right Arm, Female"
		icon_state = "athena_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	athena_arm_left_female
		name = "Hephaistos Prosthetic Left Arm, Female"
		icon_state = "athena_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	athena_leg_right_female
		name = "Hephaistos Prosthetic Right Leg, Female"
		icon_state = "athena_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	athena_leg_left_female
		name = "Hephaistos Prosthetic Left Leg, Female"
		icon_state = "athena_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Serbian / Void Wolf

	serbian_arm_right_male
		name = "Void Wolf Prosthetic Right Arm, Male"
		icon_state = "serbian_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	serbian_arm_left_male
		name = "Void Wolf Prosthetic Left Arm, Male"
		icon_state = "serbian_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	serbian_leg_right_male
		name = "Void Wolf Prosthetic Right Leg, Male"
		icon_state = "serbian_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	serbian_leg_left_male
		name = "Void Wolf Prosthetic Left Leg, Male"
		icon_state = "serbian_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	serbian_arm_right_female
		name = "Void Wolf Prosthetic Right Arm, Female"
		icon_state = "serbian_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	serbian_arm_left_female
		name = "Void Wolf Prosthetic Left Arm, Female"
		icon_state = "serbian_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	serbian_leg_right_female
		name = "Void Wolf Prosthetic Right Leg, Female"
		icon_state = "serbian_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	serbian_leg_left_female
		name = "Void Wolf Prosthetic Left Leg, Female"
		icon_state = "serbian_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Ward Spirit

	spirit_arm_right_male
		name = "Spirit Prosthetic Right Arm, Male"
		icon_state = "spirit_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	spirit_arm_left_male
		name = "Spirit Prosthetic Left Arm, Male"
		icon_state = "spirit_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	spirit_leg_right_male
		name = "Spirit Prosthetic Right Leg, Male"
		icon_state = "spirit_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	spirit_leg_left_male
		name = "Spirit Prosthetic Left Leg, Male"
		icon_state = "spirit_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	spirit_arm_right_female
		name = "Spirit Prosthetic Right Arm, Female"
		icon_state = "spirit_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	spirit_arm_left_female
		name = "Spirit Prosthetic Left Arm, Female"
		icon_state = "spirit_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	spirit_leg_right_female
		name = "Spirit Prosthetic Right Leg, Female"
		icon_state = "spirit_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	spirit_leg_left_female
		name = "Spirit Prosthetic Left Leg, Female"
		icon_state = "spirit_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Technomancer / Guild

	techno_arm_right_male
		name = "Artificer Prosthetic Right Arm, Male"
		icon_state = "techno_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	techno_arm_left_male
		name = "Artificer Prosthetic Left Arm, Male"
		icon_state = "techno_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	techno_leg_right_male
		name = "Artificer Prosthetic Right Leg, Male"
		icon_state = "techno_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	techno_leg_left_male
		name = "Artificer Prosthetic Left Leg, Male"
		icon_state = "techno_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	techno_arm_right_female
		name = "Artificer Prosthetic Right Arm, Female"
		icon_state = "techno_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	techno_arm_left_female
		name = "Artificer Prosthetic Left Arm, Female"
		icon_state = "techno_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	techno_leg_right_female
		name = "Artificer Prosthetic Right Leg, Female"
		icon_state = "techno_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	techno_leg_left_female
		name = "Artificer Prosthetic Left Leg, Female"
		icon_state = "techno_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Ward-Takahashi

	ward_arm_right_male
		name = "Ward-Takehashi Prosthetic Right Arm, Male"
		icon_state = "ward_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	ward_arm_left_male
		name = "Ward-Takehashi Prosthetic Left Arm, Male"
		icon_state = "ward_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	ward_leg_right_male
		name = "Ward-Takehashi Prosthetic Right Leg, Male"
		icon_state = "ward_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	ward_leg_left_male
		name = "Ward-Takehashi Prosthetic Left Leg, Male"
		icon_state = "ward_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	ward_arm_right_female
		name = "Ward-Takehashi Prosthetic Right Arm, Female"
		icon_state = "ward_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	ward_arm_left_female
		name = "Ward-Takehashi Prosthetic Left Arm, Female"
		icon_state = "ward_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	ward_leg_right_female
		name = "Ward-Takehashi Prosthetic Right Leg, Female"
		icon_state = "ward_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	ward_leg_left_female
		name = "Ward-Takehashi Prosthetic Left Leg, Female"
		icon_state = "ward_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Xion

	xion_arm_right_male
		name = "Xion Prosthetic Right Arm, Male"
		icon_state = "xion_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	xion_arm_left_male
		name = "Xion Prosthetic Left Arm, Male"
		icon_state = "xion_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	xion_leg_right_male
		name = "Xion Prosthetic Right Leg, Male"
		icon_state = "xion_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	xion_leg_left_male
		name = "Xion Prosthetic Left Leg, Male"
		icon_state = "xion_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	xion_arm_right_female
		name = "Xion Prosthetic Right Arm, Female"
		icon_state = "xion_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	xion_arm_left_female
		name = "Xion Prosthetic Left Arm, Female"
		icon_state = "xion_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	xion_leg_right_female
		name = "Xion Prosthetic Right Leg, Female"
		icon_state = "xion_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	xion_leg_left_female
		name = "Xion Prosthetic Left Leg, Female"
		icon_state = "xion_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

//Zeng-Hu

	zeng_arm_right_male
		name = "Zeng-Hu Prosthetic Right Arm, Male"
		icon_state = "zeng_r_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	zeng_arm_left_male
		name = "Zeng-Hu Prosthetic Left Arm, Male"
		icon_state = "zeng_l_arm_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	zeng_leg_right_male
		name = "Zeng-Hu Prosthetic Right Leg, Male"
		icon_state = "zeng_r_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	zeng_leg_left_male
		name = "Zeng-Hu Prosthetic Left Leg, Male"
		icon_state = "zeng_l_leg_m"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)

	zeng_arm_right_female
		name = "Zeng-Hu Prosthetic Right Arm, Female"
		icon_state = "zeng_r_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_ARM, BP_R_HAND)

	zeng_arm_left_female
		name = "Zeng-Hu Prosthetic Left Arm, Female"
		icon_state = "zeng_l_arm_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_ARM, BP_L_HAND)

	zeng_leg_right_female
		name = "Zeng-Hu Prosthetic Right Leg, Female"
		icon_state = "zeng_r_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_R_LEG, BP_R_FOOT)

	zeng_leg_left_female
		name = "Zeng-Hu Prosthetic Left Leg, Female"
		icon_state = "zeng_l_leg_f"
		blend = ICON_MULTIPLY
		body_parts = list(BP_L_LEG, BP_L_FOOT)