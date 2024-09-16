/datum/category_item/setup_option/background/ethnicity/akulaganger
	name = "Former Ganger"
	desc = "Akula are a brutal people and some take this to another level. The fondness they possess for motor cycles and hover bikes have given way to a rise in gang-like culture. \
			While the common akula is strong, most gangers train themselves in the 'honorable' way of fighting, favoring melee. Fixing up their bikes so often has also given them some mechanical knack.  \
			Days and weeks of patching themselves up after a bar fight or gang-land style shooting have made most pretty self reliant but, sadly even the clever gangers eventually get caught. \
			While criminal backgrounds are often overlooked, yours is one of public record and far more brutal than most, made known by either your boasting, tattoos, or records. \
			Security is still willing to hire you, but your records should note your history."

	restricted_to_species = list(FORM_AKULA)

	perks = list(PERK_CHEM_CONTRABAND)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = 0,
		STAT_VIG = -6,
		STAT_BIO = 4,
		STAT_MEC = 7,
		STAT_COG = -15
	)


/datum/category_item/setup_option/background/ethnicity/akulacommander
	name = "Former Commander"
	desc = "Military service for an akula is considered one of the most honorable professions one can take. Many become commanders within the Solarian Federation military, often leading small squads \
			of Naramadi in ship to ship breaching squads or strike teams in ground assaults. Akula commanders are better trained with guns than most and adapt well to new things.  \
			Service in the military, however, has its draw backs. Much of an akula's training is steeped solely in marksmanship as they cannot keep pace with the faster naramads and must take \
			great care not to cause a friendly fire incident."

	restricted_to_species = list(FORM_AKULA)

	stat_modifiers = list(
		STAT_ROB = 0,
		STAT_TGH = 0,
		STAT_VIG = 9,
		STAT_BIO = 0,
		STAT_MEC = -5,
		STAT_COG = 4
	)

/datum/category_item/setup_option/background/ethnicity/akulabreacher
	name = "Former Breacher"
	desc = "Military service for an akula is considered one of the most honorable professions one can take. Those who lack the skill and cunning for a command position are often designated as breachers. \
			Akula breachers serve a single purpose, being the first person into a conflict that serves as a meat shield for those behind them in a stack.  \
			While impressive, this position strains even the well known toughness of most akula and leaves them with lasting injuries. \
			The training breachers get is also exclusive, focused entirely on melee assisted by large shields as a hulking charging akula rushing a position attracts more concentrated \
			fire, thus freeing up the soldiers in the back to make clear picked shots."

	restricted_to_species = list(FORM_AKULA)

	stat_modifiers = list(
		STAT_ROB = 10,
		STAT_TGH = -10,
		STAT_VIG = 5,
		STAT_BIO = 0,
		STAT_MEC = 0,
		STAT_COG = -5
	)