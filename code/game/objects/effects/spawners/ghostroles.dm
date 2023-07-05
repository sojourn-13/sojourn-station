//Prisoner containment sleeper: Ghosts become escaped prisoners and are advised to find a way out of the mess they've gotten themselves into.
/obj/effect/mob_spawn/human/prisoner_transport
	name = "prisoner containment sleeper"
	desc = "A sleeper designed to put its occupant into a deep coma, unbreakable until the sleeper turns off. This one's glass is cracked and you can see a pale, sleeping face staring out."
	mob_name = "an escaped prisoner"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/escapedprisoner
	ghost_role_perks = list(PERK_FAST_FINGERS, PERK_QUIET_AS_MOUSE, PERK_TRUE_NAME)
	short_desc = "You're a prisoner, sentenced to hard work in one of Kriosan's labor camps, but it seems as \
	though fate has other plans for you."
	flavour_text = "Good. It seems as though your ship crashed. You remember that you were convicted of "
	assignedrole = "Escaped Prisoner"
	stat_modifiers = list(
		STAT_ROB = 16,
		STAT_TGH = 16,
		STAT_BIO = 8,
		STAT_MEC = 8,
		STAT_VIG = 8,
		STAT_COG = 8
	)

/obj/effect/mob_spawn/human/prisoner_transport/special(mob/living/L)
	L.fully_replace_character_name(null,"KP #PH-0[rand(111,999)]") //Kriosan Prisoner #Prison Hulk-(numbers)

/obj/effect/mob_spawn/human/prisoner_transport/Initialize(mapload)
	. = ..()
	var/list/crimes = list("murder", "larceny", "embezzlement", "unionization", "dereliction of duty", "kidnapping", "gross incompetence", "grand theft", "mutiny")
	flavour_text += "[pick(crimes)]. but regardless of that, it seems like your crime doesn't matter now. You don't know where you are, but you know that it's out to kill you, and you're not going \
	to lose this opportunity. Find a way to get out of this mess and back to where you rightfully belong - your [pick("house", "apartment", "spaceship", "station")]. There should be a teleporter somewhere, if it's still intact."

/obj/effect/mob_spawn/human/scavenger
	name = "storage sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be covered in armor."
	mob_name = "a scavenger"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/scavenger
	ghost_role_perks = list(PERK_STALKER, PERK_LUNGS_OF_IRON, PERK_SURE_STEP, PERK_TRUE_NAME)
	short_desc = "You're a scavenger, who barely even owns the clothes on your back and the rifle in your hands."
	flavour_text = "It seems you've arrived. You're here to get the good stuff and skedaddle with your life intact. \
	There may be others to cooperate with, but don't count on it. There shouldn't be many if any cops this far out, and laws don't carry much truck around here."
	assignedrole = "Comissioned Scavenger"
	title = "Prospector Comission Scavenger"

/obj/effect/mob_spawn/human/exl_civ
	name = "storage sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be covered in excelsior equipment."
	mob_name = "a scavenger"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	ghost_role_perks = list(PERK_BOLT_REFLECT, PERK_LUNGS_OF_IRON, PERK_SURE_STEP, PERK_TRUE_NAME)
	outfit = /decl/hierarchy/outfit/antagonist/mercenary/excelsior
	short_desc = "You are a excelsior, move ever upwards."
	flavour_text = "It seems you've arrived. You're here to get the good stuff and skedaddle with your life intact. \
	There may be others to cooperate with, but don't count on it."
	assignedrole = "Excelsior Slave"
	title = "Excelsior Agent"
	stat_modifiers = list(
		STAT_ROB = 26,
		STAT_TGH = 26,
		STAT_BIO = 18,
		STAT_MEC = 18,
		STAT_VIG = 18,
		STAT_COG = 10
	)

/obj/effect/mob_spawn/human/exl_armored
	outfit = /decl/hierarchy/outfit/antagonist/mercenary/excelsior/equipped

/obj/effect/mob_spawn/human/void_wolf
	name = "storage sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be covered in void wolf equipment."
	mob_name = "a scavenger"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/antagonist/mercenary/void_wolf
	ghost_role_perks = list(PERK_SECOND_SKIN, PERK_LUNGS_OF_IRON, PERK_SURE_STEP, PERK_TRUE_NAME)
	short_desc = "You are a Void wolf."
	flavour_text = "It seems you've arrived. You're here to get the good stuff and skedaddle with your life intact. \
	There may be others to cooperate with, but don't count on it."
	assignedrole = "Void Wolf"
	title = "Void Wolf"
	stat_modifiers = list(
		STAT_ROB = 35,
		STAT_TGH = 35,
		STAT_BIO = 25,
		STAT_MEC = 25,
		STAT_VIG = 18,
		STAT_COG = 10
	)

/obj/effect/mob_spawn/human/si_medical_ert
	name = "deployment sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be covered in SI medical equipment."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/si_medical_ert
	ghost_role_perks = list(PERK_MEDICAL_EXPERT, PERK_ADVANCED_MEDICAL, PERK_SI_SCI, PERK_CHEMIST, PERK_SURE_STEP, PERK_TRUE_NAME)
	short_desc = "You are a Medical Emergency Personnel."
	flavour_text = "Something has happend to the upper colony to warrent your deployment, you are a doctor first, save as many lives as possable with your healing gear not gun."
	assignedrole = "Medical Emergency Personnel"
	title = "Medical Emergency Personnel"
	stat_modifiers = list(
		STAT_ROB = 5,
		STAT_TGH = 5,
		STAT_BIO = 65,
		STAT_MEC = 35,
		STAT_VIG = 10,
		STAT_COG = 35
	)

/obj/effect/mob_spawn/human/marshal_ert
	name = "deployment sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be a Nadezhda Colonial Marshal"
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/marshal_ert
	ghost_role_perks = list(PERK_ASS_OF_CONCRETE, PERK_BOLT_REFLECT, PERK_CODESPEAK, PERK_CHEM_CONTRABAND, PERK_TRUE_NAME)
	short_desc = "You are a Marshal agent."
	flavour_text = "Something has happend to the upper colony to warrant your deployment. Uphold the word of law and ensure peace is upkept in Nadezhda."
	assignedrole = "Marshal Agent"
	title = "Marshal Agent"
	stat_modifiers = list(
		STAT_ROB = 50,
		STAT_TGH = 45,
		STAT_BIO = 10,
		STAT_MEC = 5,
		STAT_VIG = 45,
		STAT_COG = 10
	)

/obj/effect/mob_spawn/human/engi_ert
	name = "deployment sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be covered in advanced Guild equipment."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/engi_ert
	ghost_role_perks = list(PERK_INSPIRATION, PERK_HANDYMAN, PERK_SURE_STEP, PERK_TRUE_NAME)
	short_desc = "You are a Medical Emergency Personnel."
	flavour_text = "Something has happend to the upper colony to warrent your deployment, you are a engineer first, repair the problem, law breakers are not in your juristiction."
	assignedrole = "Guild Emergency Personnel"
	title = "Guild Emergency Personnel"
	stat_modifiers = list(
		STAT_ROB = 35,
		STAT_TGH = 35,
		STAT_BIO = 35,
		STAT_MEC = 100,
		STAT_VIG = 5,
		STAT_COG = 65
	)

/obj/effect/mob_spawn/human/lss_ert
	name = "deployment sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be an Auditor."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/lss_ert
	ghost_role_perks = list(PERK_SI_SCI, PERK_CHEMIST, PERK_SURE_STEP, PERK_TRUE_NAME)
	short_desc = "You are an Auditor."
	flavour_text = "The upper colony has done something thats not upto code, weather it be LSS, SI or any other department your job is to look into any matter that HC tells you about. \
	Your not a cop, your not a medical personal your here to correct some papers not criminals."
	assignedrole = "Guild Emergency Personnel"
	title = "Guild Emergency Personnel"
	stat_modifiers = list(
		STAT_ROB = 45,
		STAT_TGH = 45,
		STAT_BIO = 45,
		STAT_MEC = 45,
		STAT_VIG = 45,
		STAT_COG = 65
	)


/obj/effect/mob_spawn/human/kriosan_trooper
	name = "deployment sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be a Kriosan trooper."
	mob_name = "a scavenger"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/doggo
	ghost_role_perks = list(PERK_PERFECT_SHOT, PERK_ENHANCEDSENSES, PERK_TRUE_NAME)
	short_desc = "You are a kriosan trooper."
	flavour_text = "*bark."
	assignedrole = "Kriosan Trooper"
	title = "Kriosan Trooper"
	stat_modifiers = list(
		STAT_ROB = 28,
		STAT_TGH = 32,
		STAT_BIO = 27,
		STAT_MEC = 16,
		STAT_VIG = 46,
		STAT_COG = 18
	)

