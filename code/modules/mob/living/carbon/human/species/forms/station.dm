/datum/species_form/human
	name = FORM_HUMAN
//	name_plural = "Humans"
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR
	playable = TRUE

	//No changes.

/*#define FORM_HUMAN				"Human"
#define FORM_CANINE				"Canine"
#define FORM_SHARK				"Shark"
#define FORM_LIZARD				"Lizard"
#define FORM_VULPINE			"Vulpine"
#define FORM_FENNEC				"Fennec"
#define FORM_SERGALINE			"Sergal"
#define FORM_SLIME				"Slime"
#define FORM_AVIAN				"Avian"
#define FORM_SPIDER				"Arachnoid"*/

/*/datum/species_form/template
	name
	base
	deform
	face
	damage_overlays
	damage_mask
	blood_mask*/

/datum/species_form/canine
	playable = TRUE
	name = FORM_CANINE
	base = 'icons/mob/human_races/r_vulpkanin.dmi'
	deform = null	//TODO: White vulp deformed sprites. There aren't even regular ones here.
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR
/*	deform = 'icons/mob/human_races/r_def_vulpkanin.dmi'
	face
	damage_overlays
	damage_mask
	blood_mask*/

/datum/species_form/feline
	playable = TRUE
	name = FORM_FELINE
	base = 'icons/mob/human_races/r_tajaran_white.dmi'
	deform = 'icons/mob/human_races/r_def_tajaran_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR

/datum/species_form/shark
	playable = TRUE
	name = FORM_SHARK
	base = 'icons/mob/human_races/r_akula.dmi'
	deform = 'icons/mob/human_races/r_def_akula.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR

/datum/species_form/lizard
	playable = TRUE
	name = FORM_LIZARD
	variantof = FORM_LIZARD
	base = 'icons/mob/human_races/r_lizard_white.dmi'
	deform = 'icons/mob/human_races/r_def_lizard_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR

/datum/species_form/lizard/tgsmooth
	name = FORM_LIZARD_TGSMOOTH
	base = 'icons/mob/human_races/r_tgsmooth_white.dmi'
	deform = 'icons/mob/human_races/r_def_tgsmooth_white.dmi'

/datum/species_form/lizard/tgsharp
	name = FORM_LIZARD_TGSHARP
	base = 'icons/mob/human_races/r_tgsharp_white.dmi'
	deform = 'icons/mob/human_races/r_def_tgsharp_white.dmi'

/datum/species_form/vulpine
	playable = TRUE
	name = FORM_VULPINE
	base = 'icons/mob/human_races/r_fox_white.dmi'
	deform = 'icons/mob/human_races/r_def_fox.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR

/datum/species_form/fennec
	playable = TRUE
	name = FORM_FENNEC
	base = 'icons/mob/human_races/r_fennec_white.dmi'
	deform = null //'icons/mob/human_races/r_def_fennec_white.dmi' //TODO: White fennec deformed sprites.
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR

/datum/species_form/sergal
	playable = TRUE
	name = FORM_SERGALINE
	base = 'icons/mob/human_races/r_sergal.dmi'
	deform = 'icons/mob/human_races/r_def_sergal.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR

/datum/species_form/avian
	playable = TRUE
	name = FORM_AVIAN
	base = 'icons/mob/human_races/r_nevrean.dmi'
	deform = 'icons/mob/human_races/r_def_nevrean.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR

/datum/species_form/spider
	playable = TRUE
	name = FORM_SPIDER
	base = 'icons/mob/human_races/r_spider.dmi'
	deform = 'icons/mob/human_races/r_def_spider.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR

/datum/species_form/stationxeno
	playable = TRUE
	name = FORM_STATIONXENO
	base = 'icons/mob/human_races/xenos/r_xenos_drone.dmi'
	deform =  'icons/mob/human_races/xenos/r_xenos_drone.dmi'
	variantof = FORM_STATIONXENO
	appearance_flags = HAS_EYE_COLOR | HAS_UNDERWEAR

/datum/species_form/stationxeno/hunter
	name = FORM_STATIONXENO_HUNTER
	base = 'icons/mob/human_races/xenos/r_xenos_hunter.dmi'
	deform = 'icons/mob/human_races/xenos/r_xenos_hunter.dmi'

/datum/species_form/stationxeno/queen
	name = FORM_STATIONXENO_QUEEN
	base = 'icons/mob/human_races/xenos/r_xenos_queen.dmi'
	deform = 'icons/mob/human_races/xenos/r_xenos_queen.dmi'

/datum/species_form/stationxeno/sentinel
	name = FORM_STATIONXENO_SENTI
	base = 'icons/mob/human_races/xenos/r_xenos_sentinel.dmi'
	deform = 'icons/mob/human_races/xenos/r_xenos_sentinel.dmi'
