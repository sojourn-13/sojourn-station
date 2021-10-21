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

	alurane
		name = "Alraune Body"
		icon_state = "alurane"
		body_parts = list(BP_L_FOOT,BP_R_FOOT,BP_L_LEG,BP_R_LEG,BP_L_ARM,BP_R_ARM,BP_L_HAND,BP_R_HAND,BP_GROIN,BP_TORSO,BP_HEAD)


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
		name = "Blank Round Face (Use With Monster Mouth)"
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
		name = "Monster Mouth"
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