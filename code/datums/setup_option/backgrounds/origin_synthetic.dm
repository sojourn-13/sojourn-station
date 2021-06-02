/datum/category_item/setup_option/background/ethnicity/sot_synth_medical
	name = "Medical Positronic"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. Your specific model was designed with \
	in-house medical imaging, surgical support systems, and a suite of data stored biological reference documents fed to the brain within through a real-time artificial intelligence system. The entire \
	system works on a subconscious level, allowing the existing machinery to work with instead of for the user. This model comes with a surgical omnitool implanted in the right arm."

	restricted_to_species = list(FORM_SOTSYNTH)
	racial_implants = (/obj/item/organ_module/active/simple/surgical)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 30,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/sot_synth_engineer
	name = "Engineering Positronic"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. Your specific model was designed with \
	sturdy reinforced chassis functions and augmented tool support to further enhance your innate skills. Due to an often times self tinkering habit, engineering FBP's are made sturdy and equipped \
	with a repository of schematics and tool tips fed directly to the user on a subconscious level, allowing the existing machinery to work with instead of for the user. This model comes with an \
	engineering omnitool implanted in the right arm."

	restricted_to_species = list(FORM_SOTSYNTH)
	racial_implants = (/obj/item/organ_module/active/simple/engineer)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 15,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 15,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/sot_synth_combat
	name = "Combat Positronic"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. Combat positronics are built specifically \
	for the protection of colony interests but allowed to retain their free will, unlike other cyborgs. Combat positronics have the sturdiest physical designs and enhanced hydraulic systems to \
	further enhance their physical strength. In-built armor plating and AI-fed combat techniques given on a subconscious level allow for robust and study combatants. This model comes with an armblade \
	module implanted in the right arm."

	restricted_to_species = list(FORM_SOTSYNTH)
	racial_implants = (/obj/item/organ_module/active/simple/armblade)

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
		STAT_BIO = 0,
		STAT_MEC = -5,
		STAT_COG = -5
	)

/datum/category_item/setup_option/background/ethnicity/ag_synth_mech_adept
	name = "Mechanical Adept"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. Your specific model was designed with \
	a suite of integrated repair AI modules and augmented tool support to further enhance your innate skills. While not as sturdy as some other models of FBP's such as the Soteria designs the \
	artificer guild positronics come with a far more advanced mechanical support subsystem, allowing for superior designs, methods, and implementations. This design come with an engineering \
	omni-tool built in your right arm."

	restricted_to_species = list(FORM_AGSYNTH)
	racial_implants = (/obj/item/organ_module/active/simple/engineer)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 30,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/ag_synth_sturdy
	name = "\"Long-Haul\" Body Chassis"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. This particular model is the work of Tacitus \
	O'Conner himself, artificer guild grand master. Unlike the mechanical adept model this chassis is built to last, being far more sturdy and capable of performing alone or with teams of engineers cut \
	off from the colony for extended periods. While not as capable in combat as a Soteria combat chassis this model boasts equal parts sturdiness and improved cogitation computers. This design come \
	with an engineering omni-tool built in your right arm."

	restricted_to_species = list(FORM_AGSYNTH)
	racial_implants = (/obj/item/organ_module/active/simple/engineer)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 20,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 15
	)

/datum/category_item/setup_option/background/ethnicity/ag_synth_mine
	name = "\"Depts-Class\" Body Chassis"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. This particular model is made with mining in \
	mind. Unlike the mechanical adept model this chassis is built work long hard hours in the darkness, being far more able to smash down rock veins and dig out tunnels rich with both soft \
	and hard materials alike. While not as capable in combat as a Soteria combat chassis this model boasts equal parts sturdiness and pre-programmed assistants in maintaining tools and one's ownself. \
	This design comes with a mining omnitool, which boasts a munchkin 3000 multitool, a greyson power drill, advanced ore scanner, and emergency radio."

	restricted_to_species = list(FORM_AGSYNTH)
	racial_implants = (/obj/item/organ_module/active/multitool/miner)

//Idea for this is that you were made with being a miner, thus giving you everything you need as one
//The main boon being you get a bit of evey skill you /need/ to mine out faster and maintain tools / set up the big drills.
//-0Loss Stats +15Gained Stat

	stat_modifiers = list(
		STAT_ROB = 20,
		STAT_TGH = 10,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 10,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/blackshield_security
	name = "Non-Lethal Model"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. This particular model is designed for \
	non-lethal engagements, meant to capture people alive and with minimal harm. Thanks to a wide variety of scenarios catching targets can present, be it bounty hunting, criminal arrest, or just \
	calming unruly people, your chassis is designed with a wide variety of physical augmentations and comes with an inbuilt taser."

	restricted_to_species = list(FORM_BSSYNTH)
	racial_implants = (/obj/item/organ_module/active/simple/taser/blackshield)

	stat_modifiers = list(
		STAT_ROB = 15,
		STAT_TGH = 15,
		STAT_VIG = 15,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/blackshield_melee
	name = "Close-Quarters Combat Model"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. This model is designed for melee conflict. \
	CQC positronics have the sturdiest physical designs and enhanced hydraulic systems to further enhance their physical strength. In-built armor plating and AI-fed combat techniques given \
	on a subconscious level allow for robust and study combatants. This model comes with an energy blade in the right arm."

	restricted_to_species = list(FORM_BSSYNTH)
	racial_implants = (/obj/item/organ_module/active/simple/armblade/energy_blade)

	stat_modifiers = list(
		STAT_ROB = 20,
		STAT_TGH = 20,
		STAT_VIG = 0,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/blackshield_ranged
	name = "Ballistic Model"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. This model is designed for ranged engagements. \
	Ballistic positronics are slightly less sturdy than their CQC and non-lethal counterparts, but still have a sturdy chassis and AI-guided targeting systems to aid in shooting. \
	In-built armor plating and AI-fed combat techniques given on a subconscious level allow for robust and sturdy combatants. This model comes with an implanted .35 smg in the right arm and a shield in the left."

	restricted_to_species = list(FORM_BSSYNTH)
	racial_implants = (/obj/item/organ_module/active/simple/armsmg/blackshield)
	racial_implants_l = (/obj/item/organ_module/active/simple/armshield)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 20,
		STAT_VIG = 20,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/church_agrolyte
	name = "Agrolyte Model"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. This model comes with the express purpose of \
	farming and cultivating life and crops. While comparitively weaker than other models, the agrolyte is exceptional at all things biological be it raising and maintaining crops or tending to animals \
	and even people. Custom AI-fed medical systems allow for exceptional skill when performing biological work, extending to anything organic."

	restricted_to_species = list(FORM_CHURCHSYNTH)
	racial_implants = (/obj/item/organ_module/active/multitool/farmer)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 0,
		STAT_BIO = 30,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/church_combat
	name = "Knight Model"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. This one was designed for combat. \
	While not nearly as armored as a soteria or blackshield synthetic, the knight comes with a built in shortsword and many wire-jack tendons capable of allowing it to punch through armor \
	in melee. Use of an AI-supported targeting system allows them to make more precise armor penetrating shots."

	restricted_to_species = list(FORM_CHURCHSYNTH)
	racial_implants = (/obj/item/organ_module/active/simple/armblade/longsword)

	//Compared to the soteria combat model and blackshield synths you get 20 armor across the body vs. 30/35 respectively, so what you lack in natural defense is made up in offense. -Kaz
	stat_modifiers = list(
		STAT_ROB = 20,
		STAT_TGH = 20,
		STAT_VIG = 20,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = 0
	)

/datum/category_item/setup_option/background/ethnicity/church_religion
	name = "Ceremony Model"
	desc = "Synthetics are often times built with a specific purpose in mind to augment the qualities most appropriate to the purpose they're intended for. This one is the most common form of synthetic \
	utilized by the church. Ceremonial models come with a built in ritual knife and bible, allowing them to always access their litanies. Additionally, they have a wide array of skills, allowing them \
	to fulfill multiple roles."

	restricted_to_species = list(FORM_CHURCHSYNTH)
	racial_implants = (/obj/item/organ_module/active/simple/bible)
	racial_implants_l = (/obj/item/organ_module/active/simple/armblade/ritual)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 10,
		STAT_VIG = 10,
		STAT_BIO = 0, //Given 10 bio racially.
		STAT_MEC = 10,
		STAT_COG = 10
	)