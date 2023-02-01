/obj/item/oddity/secdocs
	name = "classified research"
	desc = "A folder containing some papers with important scientific data."
	icon = 'icons/obj/oddities.dmi'
	price_tag = 2500
	prob_perk = 0 //The data is quite clear...
	oddity_stats = list(
		STAT_MEC = 7,
		STAT_COG = 7,
		STAT_BIO = 7,
	)

	//var/static/inv_spawn_count = 3

/obj/item/oddity/secdocs/Initialize()
	icon_state = "reports[rand(1,6)]"
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
				"It's labelled 'Human Enhancement Test Results'.",
				"It's labelled 'New Uses Of Soild Plasma'.",
				"It's labelled 'Prototype: Liquid Fuels For Generators'.",
				"It's labelled 'Eletric Welders And Cold Welding'.",
				"It's labelled 'Improvements On Cryogenic Technologies'.",
				"It's labelled 'The Future of the Soteria Institute'.",
				"It's labelled 'Mining Advancements using Thermal Dentation'.",
				"It's labelled 'Bluespace Connection Lines'.",
				"It's labelled 'Psionic Advancements'.",
				"It's labelled 'Psionic's and the health affects'.",
				"It's labelled 'DNA Theory, what cant be done'.",
				"It's labelled 'Genetics long term health affects'.",
				"It's labelled 'Genetic case Bio-92'.",
				"It's labelled 'Genetic Weapons Theory - A Rebuttal'.",
				"It's labelled 'Weaponization of Blood'.",
				"It's labelled 'Weaponization of DNA'.",
				"It's labelled 'Deep Tunnels evaluation meta-data'.",
				"It's labelled 'Deep Tunnels Anomalies'.",
				"It's labelled 'Possible new Terms and Conditions'.",
				"It's labelled 'Unknown Threats from Bluespace'.",
				"It's labelled 'Possable New neuromod'.",
				"It's about Bluespace and possable new ways to gain endless power from the ''Void''.",
				"The label has been censored with permanent marker. Mysterious.",
				"The label has been torn off. Maybe it's best not to pry.")
	. = ..()
	var/mob/living/carbon/human/owner = loc
	if(istype(owner))
		to_chat(owner, SPAN_NOTICE("You have valuable scientific data on your person. Do not let it fall into the wrong hands."))

