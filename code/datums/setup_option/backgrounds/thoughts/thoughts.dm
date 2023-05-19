/datum/category_item/setup_option/background/thoughts/electrochemisty
	name = "Ethanol-Based Lifeform"
	desc = "While most humans rely on such basic things as water and carbon, you have simply evolved past such needs. \
	Your body is capable of sustaining itself perhaps even flourishing under the effects of new era substitute - alcohol. \
	What you became can only be described as ethanol-based organism, an evolution of standard carbon-based humanoid far more capable than it's predecesor. \
	That is as long as you have alcohol flowing throught you veins, take that away and a mere breeze can uproot your newfound strength."

	perks = list(PERK_ALCOHOLIC)

	stat_modifiers = list(STAT_COG = -10)

/datum/category_item/setup_option/background/thoughts/composure
	name = "Survivor Mindset"
	desc = "You were always a survivor from the day you were born, while others cowered you faced your fears head on, even if it cost you few teeth. \
	Never did you lose your composure in front of others, uttered a singular tear in your entire life, you are the definition of a hard-ass. \
	But this left you emotionally stunted, unable to feel any empathy for others or being able to relate to simplest emotions besides your own will to survive. \
	It's understandable a person like you would find problems in socilizing as life has shown that relying on others shortens your lifespan."

	perks = list(PERK_SURVIVOR)

/datum/category_item/setup_option/background/thoughts/encyclopedia
	name = "Living Computer"
	desc = "Calling you a nerdy type is plain insult to your intelligence, gray matter sitting inside your cranial complex is more wrinkly than face of an elder. \
	Processing information at inhuman speeds isn't always to one's benefit either, even if it helps you understand the most complex equations in span of an afternoon. \
	What most call 'horrors beyond their imagination' is something you have grasp of on, unable to get them out of your brain even during your sleep. \
	Sometimes there is nothing better for you then just let it all out at once, such is the reality of your mind."

	perks = list(PERK_REJECTED_GENIUS)

	stat_modifiers = list(STAT_COG = 10, STAT_ROB = -5, STAT_VIG = -5, STAT_TGH = -5)

/datum/category_item/setup_option/background/thoughts/authority
	name = "Baron of Conscience"
	desc = "Majority of your peers only look out for themselves but not you, you are there for the little man, the poor and downtrodden always believing good times are coming. \
	Merely standing in presence of such unfortunate individuals lifts their spirit right back up allowing them to go on throught with another day.\
	This idea is rarity among the many disillusioned spacefarers making your idealist stance on life even more refreshing to see.\
	Keep in mind however that even the most resillient people can snap and that it's not possible to help everyone."

	perks = list(PERK_IDEALIST)

/datum/category_item/setup_option/background/thoughts/volition
	name = "Wasteland of the Mind"
	desc = "Nothing brings you true joy in life never experienced happiness either, about the only thing that only ever got near to that feeling was finding a penny lying on the street. \
	Everything is bleak in your eyes, colourless and without purpose wishing for it all to go down into dust. \
	On the flipside you never get to feel the immesurable dissapointment most individuals go through if you didn't even ever have any expectations in the first place. \
	Bitterness shields you against the horrors of this world, in face of death you merely smirk without care in the world."

	perks = list(PERK_NIHILIST)

/datum/category_item/setup_option/background/thoughts/hand_eye_coordination
	name = "Malfunctioning Motorics"
	desc = "Your entire life can be sumarized up as series of accidents, from your conception all the way to where we are now.\
	Basic tasks like tying your shoes or opening doors cause you tremedous distress at which way can you fail them next.\
	Simply walking over uneven surfaces could result in you recieving a grevious injury on both your body and pride.\
	But every time you fail you become stronger, determined to prove to everyone that despite all of this you are still better than them."

	perks = list(PERK_KLUTZ)

	stat_modifiers = list(STAT_VIG = -10, STAT_TGH = 10)

/datum/category_item/setup_option/background/thoughts/interfacing
	name = "RATional Isolation"
	desc = "You're a slimy being in more ways than one, as far as your feeble mind can remember always have been, but can anyone truly blame you ? \
	The ugly mug you wear covered in grease and dirt never attracted the right sort of attention neither from your peers nor your parents. \
	Isolation does things to the mind, twisting it in ways not imaginable even to professionals but you harnessed this power to your advantage. \
	Learning to embrace your identity is essential in this day and age otherwise survival cannot be guaranteed but you managed it.\
	Your feet dance over most surfaces barely letting out a noise and on the off chance restraints try to wring around them, they will find it hard to stick to you."

	perks = list(PERK_RAT)

	stat_modifiers = list(STAT_VIG = 10, STAT_ROB = -10, STAT_WIL = -5)

/datum/category_item/setup_option/background/thoughts/reality_not
	name = "Reality Rejector"
	desc = "Reality itself can be rejected, you didn't get this far without learning it! When ever you have just a bad day or harsh time you \
	reject it completely, rewrighting your history to have little to no hardships. Do to this you have learned to pick up on things and handle mental issues better \
	at the cost of your body never seeking to improve."
	perks = list(PERK_FORCEFUL_REJECTION)

	stat_modifiers = list(STAT_VIG = 5, STAT_WIL = 5, STAT_TGH = -5, STAT_ROB = -5)


/* - Psionics can't be started with currently. Until Psionics are reworked this will be disabled.
/datum/category_item/setup_option/background/thoughts/inland_empire
	name = "Empire of Nothingness"
	desc = "You achieved what most couldn't, true peace of mind with no stress or violence hampering such state for a very long time. \
	What once was just a tumor is now inseparable part of you, guiding your thoughts towards harmony between it and your body. \
	The vast ranges of your thoughts occupy you on quiet days, as shallow as they might be there is never a dull moment. \
	You are the only ruler of the empire that doesn't exist, of a kingdom never came to be, of a tribe never seen.\
	Maintaining such balance allows the tumor to work past normal capacities leaving you to reap the benefits."

	perks = list(PERK_PSI_HARMONY)

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)

	stat_modifiers = list(STAT_COG = 10)


/datum/category_item/setup_option/background/thoughts/half_light
	name = "Dead Man's Hand"
	desc = "There is no peace to be found for you, entire lifetime of chaos and destruction scarred your brain beyond recognition. \
	Denied sweet embrace of death so many times by your fellow partner in crime changed you permanently. \
	From random ramblings to outbursts of aggression for no apparent reason, there is only one thing keeping you from succumbing to the madness fully, your last bits of empathy. \
	As long as the tumor occupies your cranial complex you will find no true peace even in death, however this does have it's benefits. \
	Your psychosis allowed the tumor to expand it's capabilities, making your unmatched in combat and your fading mind can take just as much more beating."

	perks = list(PERK_PSI_MANIA)

	restricted_to_species = list(FORM_HUMAN, FORM_KRIOSAN, FORM_SABLEKYNE, FORM_AKULA, FORM_MARQUA, FORM_NARAMAD, FORM_OPIFEX, FORM_CHTMANT, FORM_CINDAR, FORM_SLIME)

	stat_modifiers = list(STAT_ROB = 10)
*/
