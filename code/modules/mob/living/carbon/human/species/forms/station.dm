/datum/species_form/human
	name = FORM_HUMAN
//	name_plural = "Humans"
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR | DEFAULT_APPEARANCE_FLAGS
	playable = TRUE

	//No changes.

/*
#define FORM_EXALT_HUMAN		"Exalt Human"
#define FORM_HUMAN				"Human"
#define FORM_CANINE				"Canine"
#define FORM_SHARK				"Shark"
#define FORM_LIZARD				"Lizard"
#define FORM_VULPINE			"Vulpine"
#define FORM_FENNEC				"Fennec"
#define FORM_NARAMAD			"Naramad"
#define FORM_SLIME				"Aulvae"
#define FORM_AVIAN				"Avian"
#define FORM_SPIDER				"Arachnoid"
#define FORM_MARQUA				"Mar'Qua"*/

/*/datum/species_form/template
	name
	base
	deform
	face
	damage_overlays
	damage_mask
	blood_mask*/
/datum/species_form/exalt
	name = FORM_EXALT_HUMAN
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR | DEFAULT_APPEARANCE_FLAGS
	playable = TRUE

/datum/species_form/canine
	playable = TRUE
	name = FORM_CANINE
	base = 'icons/mob/human_races/r_vulpkanin.dmi'
	deform = null	//TODO: White vulp deformed sprites. There aren't even regular ones here.
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS
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
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/shark
	playable = TRUE
	name = FORM_SHARK
	base = 'icons/mob/human_races/r_akula.dmi'
	deform = 'icons/mob/human_races/r_def_akula.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/lizard
	playable = TRUE
	name = FORM_LIZARD
	variantof = FORM_LIZARD
	base = 'icons/mob/human_races/r_lizard_white.dmi'
	deform = 'icons/mob/human_races/r_def_lizard_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

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
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/fennec
	playable = TRUE
	name = FORM_FENNEC
	base = 'icons/mob/human_races/r_fennec_white.dmi'
	deform = null //'icons/mob/human_races/r_def_fennec_white.dmi' //TODO: White fennec deformed sprites.
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/avian
	playable = FALSE
	name = FORM_AVIAN
	base = 'icons/mob/human_races/r_nevrean.dmi'
	deform = 'icons/mob/human_races/r_def_nevrean.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS


/datum/species_form/spider
	playable = TRUE
	name = FORM_SPIDER
	base = 'icons/mob/human_races/r_spider.dmi'
	deform = 'icons/mob/human_races/r_def_spider.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/moth
	playable = TRUE
	name = FORM_MOTH
	base = 'icons/mob/human_races/r_moth.dmi'
	deform = null
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_EYE_COLOR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/moth_white
	playable = TRUE
	name = FORM_MOTH_WHITE
	base = 'icons/mob/human_races/r_moth_white.dmi'
	deform = null
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/stationxeno
	playable = FALSE
	name = FORM_STATIONXENO
	base = 'icons/mob/human_races/xenos/r_xenos_drone.dmi'
	deform =  'icons/mob/human_races/xenos/r_xenos_drone.dmi'
	variantof = FORM_STATIONXENO
	appearance_flags = HAS_EYE_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS
	playable = FALSE

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

/datum/species_form/sablekyne
	playable = FALSE
	name = FORM_SABLEKYNE
	base = 'icons/mob/human_races/r_sablekyne_white.dmi'
	deform = 'icons/mob/human_races/r_def_sablekyne_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/marqua
	playable = FALSE
	name = FORM_MARQUA
	base = 'icons/mob/human_races/r_marqua_vr.dmi'
	deform = 'icons/mob/human_races/r_def_marqua.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/kriosan
	playable = FALSE
	name = FORM_KRIOSAN
	base = 'icons/mob/human_races/r_vulpkanin.dmi'
	deform = null	//TODO: White vulp deformed sprites. There aren't even regular ones here.
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/akula
	playable = FALSE
	name = FORM_AKULA
	base = 'icons/mob/human_races/r_akula.dmi'
	deform = 'icons/mob/human_races/r_def_akula.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/naramad
	playable = FALSE
	name = FORM_NARAMAD
	base = 'icons/mob/human_races/r_sergal.dmi'
	deform = 'icons/mob/human_races/r_def_sergal.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/chtmant
	playable = FALSE
	name = FORM_CHTMANT
	base = 'icons/mob/human_races/r_spider.dmi'
	deform = 'icons/mob/human_races/r_def_spider.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/cindarite
	playable = FALSE
	name = FORM_CINDAR
	base = 'icons/mob/human_races/r_lizard_white.dmi'
	deform = 'icons/mob/human_races/r_def_lizard_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/sojvox
	playable = FALSE
	name = FORM_OPIFEX
	base = 'icons/mob/human_races/r_nevrean.dmi'
	deform = 'icons/mob/human_races/r_def_nevrean.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/soteria_synthetic
	playable = FALSE
	name = FORM_SOTSYNTH
	blood_color = "#191919"
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS
	death_sound = 'sound/machines/shutdown.ogg'
	death_message = "falls over crashing to the ground as their electronic eyes fade off."
	knockout_message = "has been knocked offline!"

/datum/species_form/artificer_guild_synthetic
	playable = FALSE
	name = FORM_AGSYNTH
	blood_color = "#191919"
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS
	death_sound = 'sound/machines/shutdown.ogg'
	death_message = "falls over crashing to the ground as their electronic eyes fade off."
	knockout_message = "has been knocked offline!"

/datum/species_form/blackshield_synthetic
	playable = FALSE
	name = FORM_BSSYNTH
	blood_color = "#191919"
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS
	death_sound = 'sound/machines/shutdown.ogg'
	death_message = "falls over crashing to the ground as their electronic eyes fade off."
	knockout_message = "has been knocked offline!"

/datum/species_form/church_synthetic
	playable = FALSE
	name = FORM_CHURCHSYNTH
	blood_color = "#191919"
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS
	death_sound = 'sound/machines/shutdown.ogg'
	death_message = "falls over crashing to the ground as their electronic eyes fade off."
	knockout_message = "has been knocked offline!"

/datum/species_form/nashef_synthetic
	playable = FALSE
	name = FORM_NASHEF
	blood_color = "#191919"
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS
	death_sound = 'sound/machines/shutdown.ogg'
	death_message = "falls over crashing to the ground as their electronic eyes fade off."
	knockout_message = "has been knocked offline!"

/datum/species_form/full_body_prosthetic
	playable = FALSE
	name = FORM_FBP
	blood_color = "#191919"
	colorable = TRUE
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | HAS_SKIN_TONE | DEFAULT_APPEARANCE_FLAGS
	death_sound = 'sound/machines/shutdown.ogg'
	death_message = "falls over crashing to the ground as their electronic eyes fade off."
	knockout_message = "has been knocked offline!"

/datum/species_form/unbranded_synth
	playable = FALSE
	name = FORM_UNBRANDED
	blood_color = "#191919"
	colorable = TRUE
	base = 'icons/mob/human_races/r_human_white.dmi'
	deform = 'icons/mob/human_races/r_def_human_white.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | HAS_SKIN_TONE | DEFAULT_APPEARANCE_FLAGS
	death_sound = 'sound/machines/shutdown.ogg'
	death_message = "falls over crashing to the ground as their electronic eyes fade off."
	knockout_message = "has been knocked offline!"

/datum/species_form/folken
	playable = FALSE
	name = FORM_FOLKEN
	base = 'icons/mob/human_races/r_folken.dmi'
	deform = null
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/mycus
	playable = FALSE
	name = FORM_MYCUS
	base = 'icons/mob/human_races/r_mycus.dmi'
	deform = null
	appearance_flags = HAS_HAIR_COLOR | HAS_UNDERWEAR | HAS_SKIN_COLOR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/axolotl
	playable = TRUE
	name = FORM_AXOLOTL
	base = 'icons/mob/human_races/r_axolotl_white.dmi'
	deform = null
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS

/datum/species_form/slime
	name = FORM_SLIME
	base = 'icons/mob/human_races/r_slime.dmi'
	deform = 'icons/mob/human_races/r_slime.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR | DEFAULT_APPEARANCE_FLAGS
	playable = FALSE

	blood_color = "#05FF9B"
	flesh_color = "#05FFFB"

	remains_type = /obj/effect/decal/cleanable/slimecorpse // Snowflake remains done, sorry carrions!
	death_message = "rapidly loses cohesion, splattering across the ground..."

/datum/species_form/sudak
	playable = TRUE
	name = FORM_SUDAK
	base = 'icons/mob/human_races/r_sudak.dmi'
	deform = 'icons/mob/human_races/r_def_sudak.dmi'
	appearance_flags = HAS_HAIR_COLOR | HAS_EYE_COLOR | HAS_SKIN_COLOR | HAS_UNDERWEAR | DEFAULT_APPEARANCE_FLAGS
