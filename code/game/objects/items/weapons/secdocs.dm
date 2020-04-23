/obj/item/weapon/oddity/secdocs
	name = "classified research"
	desc = "This folder contains highly confidential scientific research."
	icon = 'icons/obj/oddities.dmi'
	price_tag = 5000

	oddity_stats = list(
		STAT_MEC = 8,
		STAT_COG = 8,
		STAT_BIO = 8,
	)

	//var/static/inv_spawn_count = 3

/obj/item/weapon/oddity/secdocs/Initialize()
	icon_state = "paper_[pick("omega","psi","theta")]"
	desc = pick("It's labelled 'Attractor Fields Theory'.",
				"It's labelled 'World Lines Theory'.",
				"It's labelled 'The Door Phenomenon'.",
				"It's labelled 'FTL Related Mutations'.",
				"It's labelled 'Mass Hallucinations or Timeline Convergence?'.",
				"It's labelled 'The Existence of Alternate Realities'.",
				"It's labelled 'Humane Applications of Mind Fryers'.",
				"It's labelled 'Summary of Faction Capabilities'.",
				"It's labelled 'The Technology Behind Absolutism'.",
				"It's labelled 'Sol Federation Research Ethics'.",
				"It's labelled 'The Collapse of Greyson Positronics'.",
				"It's labelled 'Wanderer - A Dossier'.",
				"It's labelled 'Ironhammer's Legacy: Our Potential Gain'.",
				"It's labelled 'Evaluation of Nadezhda Council Efficiency'.",
				"It's labelled 'The Truth Behind the Bluespace Crash'.",
				"It's labelled 'Dead Colonies - What Can Be Learnt?'.",
				"It's labelled 'Analysis of Recovered Anomalies'.",
				"It's labelled 'Collated Evidence of Anomaly Origins'.",
				"It's labelled 'Anomalies In Warfare - Recommendations'.",
				"It's labelled 'Surviving Test Candidate Interview'.",
				"It's labelled 'Subject Elimination Report'.",
				"It's labelled 'Minimizing Research Casualties'.",
				"It's labelled 'Alternatives to Traditional Warheads'.",
				"It's labelled 'Proposals For New Ammunition Types'.",
				"It's labelled 'Mech Prototype Designs - Awaiting Approval'.",
				"It's labelled 'Optimizing Nanomachine Production'.",
				"It's labelled 'Usage of Self-Learning Administrative AI'.",
				"It's labelled 'Specifications of Project X'.",
				"It's labelled 'Virus Monitoring Team Update'.",
				"It's labelled 'The Weaponization of Plague'.",
				"It's labelled 'Acquisition of Restricted Materials'.",
				"It's labelled 'Quarterly Overseer Meeting Minutes'.",
				"It's labelled 'Unabridged Expense Report - Do Not Publish'.",
				"It's labelled 'For The Attention of Director Mkne'.",
				"It's labelled 'The Future of the Soteria Institute'.",
				"The label has been censored with permanent marker. Mysterious.",
				"The label has been torn off. Maybe it's best not to pry.")
	. = ..()
	var/mob/living/carbon/human/owner = loc
	if(istype(owner))
		to_chat(owner, SPAN_NOTICE("The Soteria Institute has entrusted you with valuable research data. It is essential that you do not let it fall into the wrong hands."))

/hook/roundstart/proc/place_docs()
	var/list/obj/landmark/storyevent/midgame_stash_spawn/L = list()
	for(var/obj/landmark/storyevent/midgame_stash_spawn/S in landmarks_list)
		L.Add(S)

	L = shuffle(L)

	if(L.len < 3)
		warning("Failed to place secret documents: not enough landmarks.")
		return FALSE

	for(var/i in 1 to 3)
		new /obj/item/weapon/oddity/secdocs(L[i].get_loc())

	return TRUE
