/obj/item/oddity/roundstart
	icon = 'modular_sojourn/general/oddity.dmi'
	prob_perk = 0 // No perk due to being a roundstart item.
	price_tag = 100
	min_stats = 1
	random_stats = FALSE

/obj/item/oddity/roundstart/knife
	name = "skinning knife"
	desc = "This knife might be older than you, but you know that the stories you have to share is gigantic. Or being your ancestors or being yourself."
	icon_state = "rounstart_oddity_3"
	item_state = "knife"
	structure_damage_factor = STRUCTURE_DAMAGE_BLADE
	tool_qualities = list(QUALITY_CUTTING = 30,  QUALITY_WIRE_CUTTING = 1, QUALITY_SCREW_DRIVING = 1)
	force = WEAPON_FORCE_WEAK //It is a SKINNING knife. Not meant to do damage.
	attack_verb = list("slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	hitsound = 'sound/weapons/bladeslice.ogg'
	slot_flags = SLOT_BELT
	sharp = TRUE
	edge = TRUE

	oddity_stats = list(
		STAT_ROB = 1,
		STAT_TGH = 1,
		STAT_VIG = 1
	)

/obj/item/oddity/roundstart/book
	name = "story book"
	desc = "A familiar book depicting a strange and alien exo-planet, telling its stories by images and strange-looking words. Maybe your ancestry came from here... Or maybe you found this world.... many possibilities."
	icon_state = "rounstart_oddity_1"

	oddity_stats = list(
		STAT_MEC = 1,
		STAT_BIO = 1,
		STAT_COG = 1,
	)

/obj/item/oddity/roundstart/book_2
	name = "old book"
	desc = "A book depicting a specific type of story , by using narratives and images. Theres alot of general informations that teach the reader about old and ancient traditions and tales."
	icon_state = "rounstart_oddity_2"

	oddity_stats = list(
		STAT_MEC = 1,
		STAT_BIO = 1,
		STAT_COG = 1
	)

/obj/item/oddity/roundstart/lighter
	name = "old zippo lighter"
	desc = "A non-functional zippo lighter... and looking even rusted. Something about it might tell many tales."
	icon_state = "rounstart_oddity_4"

	oddity_stats = list(
		STAT_MEC = 1,
		STAT_TGH = 1,
		STAT_VIG = 1
	)
