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
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be covered in armor."
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
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be covered in excelsior equipment."
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

/obj/effect/mob_spawn/human/exl_civ/special(mob/living/H)
	var/obj/item/implant/excelsior/E = new /obj/item/implant/excelsior(H)
	E.install(H, BP_HEAD, H)
	H.faction = "excelsior"

/obj/effect/mob_spawn/human/exl_civ/armored
	outfit = /decl/hierarchy/outfit/antagonist/mercenary/excelsior/equipped
	stat_modifiers = list( //Should be beefy, they're antags who are supposed to face fully awakened Blackshield
		STAT_ROB = 50,
		STAT_TGH = 50,
		STAT_BIO = 25,
		STAT_MEC = 25,
		STAT_VIG = 50,
		STAT_COG = 10
	)

/obj/effect/mob_spawn/human/void_wolf
	name = "storage sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be covered in void wolf equipment."
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

//colony 'ert' spawners.

/obj/effect/mob_spawn/human/si_medical_ert
	name = "deployment sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be covered in SI medical equipment."
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
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be a Nadezhda Colonial Marshal"
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/marshal_ert
	ghost_role_perks = list(PERK_ASS_OF_CONCRETE, PERK_SMARTLINK, PERK_CODESPEAK, PERK_CHEM_CONTRABAND, PERK_TRUE_NAME)
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
		STAT_COG = 20 //twice as smarter as the shieldie
	)

/obj/effect/mob_spawn/human/blackshield_ert
	name = "deployment sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be a Nadezhda Blackshield Specialist"
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/blackshield_ert
	ghost_role_perks = list(PERK_ASS_OF_CONCRETE, PERK_BOLT_REFLECT, PERK_CODESPEAK, PERK_BLACKSHIELD_CONDITIONING, PERK_TRUE_NAME)
	short_desc = "You are a Blackshield Agent."
	flavour_text = "Something has happend to the upper colony to warrant your deployment. Assess the situation and resolve it swiftly."
	assignedrole = "Blackshield Specialist"
	title = "Blackshield Specialist"
	stat_modifiers = list(
		STAT_ROB = 35,
		STAT_TGH = 50,
		STAT_BIO = 15,
		STAT_MEC = 0,
		STAT_VIG = 50,
		STAT_COG = 10
	)

/obj/effect/mob_spawn/human/engineering_ert
	name = "deployment sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be covered in advanced Guild equipment."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/engi_ert
	ghost_role_perks = list(PERK_INSPIRATION, PERK_HANDYMAN, PERK_SURE_STEP, PERK_TRUE_NAME)
	short_desc = "You are Engineering Emergency Personnel."
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

/obj/effect/mob_spawn/human/lonestar_ert
	name = "deployment sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be a Lonestar IA Agent."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/lss_ert
	ghost_role_perks = list(PERK_NO_OBFUSCATION, PERK_MARKET_PROF, PERK_TRUE_NAME)
	short_desc = "You are an Internal Affairs Agent."
	flavour_text = "Lonestar's surface operations have run into some troubles, and your job is to handle them. Speak to those involved, make decisions, keep the profits flowing."
	assignedrole = "Lonestar Internal Affairs Agent"
	title = "Lonestar Internal Affairs Agent"
	stat_modifiers = list(
		STAT_ROB = 45,
		STAT_TGH = 45,
		STAT_BIO = 45,
		STAT_MEC = 45,
		STAT_VIG = 45,
		STAT_COG = 65
	)

/obj/effect/mob_spawn/human/church_ert
	name = "deployment sleeper"
	desc = "An sleeper, with an unconscious body inside. The occupant seems to be an Inquisitor."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/church_ert
	ghost_role_perks = list(PERK_NEAT, PERK_GREENTHUMB, PERK_CHANNELING, PERK_TRUE_NAME)
	short_desc = "You are an Inquisitor."
	flavour_text = "A member of the clergy on duty, most likely the Prime, has done something that requires investigation and possibly disciplinary action. \
	Your job is to uphold the doctrine of the Church, and you are empowered to Reduce or Separate even a Prime. \
	You are not a cop, but you may assist the Marshals in tracking down a renegade clergy member if necessary."
	assignedrole = "Church Inquisitor"
	title = "Church Inquisitor"
	stat_modifiers = list( //Literally just Marshal agent stats, I'm lazy
		STAT_ROB = 50,
		STAT_TGH = 45,
		STAT_BIO = 10,
		STAT_MEC = 5,
		STAT_VIG = 45,
		STAT_COG = 20
	)

/obj/effect/mob_spawn/human/church_ert/special(mob/living/H)
	var/obj/item/implant/core_implant/cruciform/C = new /obj/item/implant/core_implant/cruciform(H)

	C.install(H)
	C.activate()
	C.make_inquisitor()

/obj/effect/mob_spawn/human/sri_ert
	name = "deployment sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be a member of the SRI Ethics committee."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/sri_ert
	ghost_role_perks = list(PERK_SURGICAL_MASTER, PERK_ROBOTICS_EXPERT, PERK_SI_SCI, PERK_CHEMIST, PERK_TRUE_NAME)
	short_desc = "You are a member of the Soteria Ethics Committee."
	flavour_text = "An accusation has been made against the Soteria Research Institute that besmirches our good name and committment to progress and the betterment of science. \
	Identify the source of the issue and recommend resolutions if a member of Soteria is found to not acted in the best interests of the institutes mission."
	assignedrole = "SRI Ethics Committee investigator"
	title = "SRI Ethics Committee investigator"
	stat_modifiers = list(
		STAT_ROB = 20,
		STAT_TGH = 15,
		STAT_BIO = 40,
		STAT_MEC = 50,
		STAT_VIG = 20,
		STAT_COG = 75
	)

/obj/effect/mob_spawn/human/prospector_ert
	name = "deployment sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be a Prospector."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/prospector_ert
	ghost_role_perks = list(PERK_STALKER, PERK_PROSPECTOR_CONDITIONING, PERK_SURE_STEP, PERK_TRUE_NAME)
	short_desc = "You are an Underboss."
	flavour_text = "The big boss has sent you to the upper levels to sort something out. Get it handled and be fast. Avoid drawing unnecessary attention to your presence \
	or mission."
	assignedrole = "Prospector Underboss"
	title = "Prospector Underboss"
	stat_modifiers = list(
		STAT_ROB = 45,
		STAT_TGH = 45,
		STAT_BIO = 15,
		STAT_MEC = 15,
		STAT_VIG = 45,
		STAT_COG = 5 //Hoggs smartest prospector
	)

/obj/effect/mob_spawn/human/kriosan_trooper
	name = "deployment sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be a Kriosan trooper."
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

//Solfed shit


/obj/effect/mob_spawn/human/solfed_survivor //very OP. Fluff wise, this is some kinda recon/vanguard. Lightly armed and armored by the standards of SolFed but still dangerous via their special gear.
	name = "deployment sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be some kind of soldier."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/solfed_survivor
	ghost_role_perks = list(PERK_ASS_OF_CONCRETE, PERK_PARKOUR, PERK_PROSPECTOR_CONDITIONING, PERK_SURE_STEP, PERK_TRUE_NAME)
	short_desc = "You are a Solarian reconnoiterer, and a survival of the fall."
	flavour_text = "Nearly seven years since the fall of the Federation, the Bluespace crash - your informal termination, what a fucking joke.\
	You shake the dust off, that familiar awful taste fills your mouth as your body realizes that the long-sleep is over and you wake once more. \
	You feel the weight of you trusty issue equipment...Far from a marine assualt-suit, still a fierce advantage against the barbarous masses now running roughshod over the galaxy."
	assignedrole = "SFF Recon"
	title = "Solarian Vanguard"
	stat_modifiers = list(
		STAT_ROB = 45,
		STAT_TGH = 45,
		STAT_BIO = 20,
		STAT_MEC = 5,
		STAT_VIG = 45,
		STAT_COG = 20
	)

/obj/effect/mob_spawn/human/solfed_survivor_medic
	name = "deployment sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be some kind of soldier."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/solfed_survivor_medic
	ghost_role_perks = list(PERK_MEDICAL_EXPERT, PERK_ADVANCED_MEDICAL, PERK_PROSPECTOR_CONDITIONING, PERK_SURE_STEP, PERK_TRUE_NAME)
	short_desc = "You are a Solarian Corpsman, and a survival of the fall."
	flavour_text = "Seven years and how many hundreds of trillions of miles from the Core, or what's left of it. You carefuly extricate yourself from the sleeper, \
	Dehydrated, Hungry, tired - a standard cryosleep revival. In your bodies still weakened state the weight of your bag threatens to pull you to the ground loaded with \
	a veritable cornucopia of cure-alls - If your fellows are awake and returning to their usual frothing state, you'll need every drop."
	assignedrole = "SFF Medic"
	title = "Solarian Vanguard"
	stat_modifiers = list(
		STAT_ROB = 25,
		STAT_TGH = 45,
		STAT_BIO = 40,
		STAT_MEC = 5,
		STAT_VIG = 25,
		STAT_COG = 20
	)

/obj/effect/mob_spawn/human/solfed_survivor_auxilliary //Bit less OP. No fucked up suit, no crazy stuff. Just some normal high end gear.
	name = "deployment sleeper"
	desc = "A sleeper, with an unconscious body inside. The occupant seems to be some kind of soldier."
	mob_name = "a human"
	icon = 'icons/obj/Cryogenic2.dmi'
	icon_state = "sleeper_1"
	outfit = /decl/hierarchy/outfit/solfed_survivor_aux
	ghost_role_perks = list(PERK_PROSPECTOR_CONDITIONING, PERK_SURE_STEP, PERK_TRUE_NAME)
	short_desc = "You are a Solarian reconnoiterer, and a survival of the fall."
	flavour_text = "Seven years they've been waiting for word from Sol - Feels like they're waiting for nothing, hardly your problem now. 'Three hots and a cot', cliched tripe \
	But when the Crash happened and the entire milky way went to hellthat offer suddenly seemed a lot more tempting. What other choice is there? Become a fucking void-wolf? \
	Yea right, at least here you can make a difference keeping order with the remains of the Federation, putting down insurrections and reminding everyone that the Federation \
	may be in a transitionary period - but her loyal hands will be here, waitiing for the word"
	assignedrole = "SFF Auxilliary"
	title = "Solarian Vanguard"
	stat_modifiers = list(
		STAT_ROB = 30,
		STAT_TGH = 30,
		STAT_BIO = 20,
		STAT_MEC = 5,
		STAT_VIG = 35,
		STAT_COG = 20
	)
