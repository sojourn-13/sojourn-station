// The powers here are centered around upgrading the user.
/*
List of powers in this page :
- Regeneration : Give the user a perk that constantly heal himself at a very slow rate defined in the perk itself.
- Speed Booster : Give the user a perk that make him move faster, the speed increase being defined in the perk itself.
- Armor Upgrade : Give the user a perk that reduce damage, again the precise number is defined in the perk given.
- Chemical Injection : Allow the user to choose a type of nanite chem to inject himself, then give him a perk that will do the injection when the user want.
*/

// Give the user a perk that constantly heal a tiny bit of damage.
/obj/item/organ/internal/nanogate/proc/nanite_regen()
	set category = "Nanogate Powers"
	set name = "Nanite Regeneration (8)"
	set desc = "Spend a large portion of your nanites to restore and repair your body by enhancing your natural healing."
	nano_point_cost = 8

	if(!owner.stats.getPerk(PERK_NANITE_REGEN)) // Do they already have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to repairing your body.")
			owner.stats.addPerk(PERK_NANITE_REGEN)
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_regen
	else
		to_chat(owner, "Assigning more nanites to repairing your body wouldn't give you a boost in regeneration rate.")

// Give the user a perk that make him move faster
/obj/item/organ/internal/nanogate/proc/nanite_muscle()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Muscle (2)"
	set desc = "Spend some of your nanites to create nanite muscle to allow you to move faster."
	nano_point_cost = 2 // Install two augments on both legs

	if(!owner.stats.getPerk(PERK_NANITE_MUSCLE)) // Do they already have the perk?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to enhancing your physical movement.")
			owner.stats.addPerk(PERK_NANITE_MUSCLE)
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_muscle
	else
		to_chat(owner, "Assigning more nanites to enhance your muscles wouldn't offer any benefit.")

// Give the user a perk that reduce incoming damage
/obj/item/organ/internal/nanogate/proc/nanite_armor()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Armor (3)"
	set desc = "Spend some of your nanites to create nanite weave mesh to protect your body."
	nano_point_cost = 3

	if(!owner.stats.getPerk(PERK_NANITE_ARMOR)) // Do they already have the perk?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to act as a reactive nano-weave armor, allowing you to resist physical brute damage.")
			owner.stats.addPerk(PERK_NANITE_ARMOR)
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_armor
	else
		to_chat(owner, "Your nanites are already providing as much armor as they can.")

// Allow the user to inject themselves with a chosen nanite.
/obj/item/organ/internal/nanogate/proc/nanite_chem()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Chemical (1)"
	set desc = "Convert some of your nanites into more specialized nanites."
	nano_point_cost = 1

	var/list/choices_perk = typesof(PERK_NANITE_CHEM)
	choices_perk -= PERK_NANITE_CHEM

	var/datum/perk/nanite_chem/choice = input(owner, "Which nanite chem do you want?", "Chem Choice", null) as null|anything in choices_perk

	if(choice && pay_power_cost(nano_point_cost)) // Check if the user actually made a choice, and if they did, check if they have the points.
		owner.stats.addPerk(choice)
		to_chat(owner, "You permanently convert some of your nanites into specialized variants.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_chem
