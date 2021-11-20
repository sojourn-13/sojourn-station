// The powers here are centered around upgrading the user.
/*
List of powers in this page :
- Regeneration : Give the user a perk that constantly heal himself at a very slow rate defined in the perk itself.
- Speed Booster : Give the user a perk that make him move faster, the speed increase being defined in the perk itself.
- Armor Upgrade : Give the user a perk that reduce damage, again the precise number is defined in the perk given.
- Chemical Injection : Allow the user to choose a type of nanite chem to inject himself, then give him a perk that will do the injection when the user want.
- Tool/Gun Mods : Give the user a modification that they chose from a list. The only reusable power.
- Nanite Ammo : Give the user a perk that can spawn an ammo box of a specified type every 30 minutes. Delay defined in the perk itself.
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
	set name = "Nanite Augment - Nanofiber Muscles (3)"
	set desc = "Spend some of your nanites to create nanite muscle to allow you to move faster."
	nano_point_cost = 3 // Install two augments on both legs

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
	set name = "Nanite Augment - Nanite Skin-Weave (3)"
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
	set name = "Nanite Augment - Nanite Refabrication (1)"
	set desc = "Convert some of your nanites into more specialized nanites. Only works for biological entities."
	nano_point_cost = 1

	var/list/choices_perk = typesof(PERK_NANITE_CHEM)
	choices_perk -= PERK_NANITE_CHEM

	var/datum/perk/nanite_chem/choice = input(owner, "Which nanite chem do you want?", "Chem Choice", null) as null|anything in choices_perk

	if(choice && owner.species?.reagent_tag != IS_SYNTHETIC && pay_power_cost(nano_point_cost)) // Check if the user actually made a choice, and if they did, check if they have the points.
		owner.stats.addPerk(choice)
		to_chat(owner, "You permanently convert some of your nanites into specialized variants.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_chem

// Give the user a tool or gun mod
/obj/item/organ/internal/nanogate/proc/nanite_mod()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Modification Fabrication (1)"
	set desc = "Spend some of your nanites to create a tool or gun mod."
	nano_point_cost = 1
	var/list/choices_mods = typesof(/obj/item/tool_upgrade) // Get every tool mod
	// Remove the parents of the toolmods
	choices_mods -= list(/obj/item/tool_upgrade,
						/obj/item/tool_upgrade/reinforcement,
						/obj/item/tool_upgrade/productivity,
						/obj/item/tool_upgrade/refinement,
						/obj/item/tool_upgrade/augment,
						/obj/item/tool_upgrade/armor
						)

	choices_mods += typesof(/obj/item/gun_upgrade) // Get every gun mod

	// Remove the parents of the gunmods
	choices_mods -= list(/obj/item/gun_upgrade,
						/obj/item/gun_upgrade/barrel,
						/obj/item/gun_upgrade/muzzle,
						/obj/item/gun_upgrade/mechanism,
						/obj/item/gun_upgrade/trigger,
						/obj/item/gun_upgrade/magwell,
						/obj/item/gun_upgrade/scope
						)

	// Removing the mods that shouldn't be available : AKA Bluespace, Greyson and AI stuff
	choices_mods -= list(/obj/item/tool_upgrade/augment/holding_tank,
						/obj/item/tool_upgrade/augment/ai_tool,
						/obj/item/tool_upgrade/augment/ai_tool_excelsior,
						/obj/item/tool_upgrade/augment/repair_nano,
						/obj/item/tool_upgrade/augment/randomizer,
						/obj/item/tool_upgrade/artwork_tool_mod,
						/obj/item/gun_upgrade/mechanism/glass_widow,
						/obj/item/gun_upgrade/mechanism/greyson_master_catalyst,
						/obj/item/gun_upgrade/mechanism/brass_kit,
						/obj/item/gun_upgrade/trigger/honker,
						/obj/item/gun_upgrade/mechanism/bikehorn,
						/obj/item/gun_upgrade/mechanism/faulty_trapped,
						/obj/item/gun_upgrade/trigger/faulty,
						/obj/item/gun_upgrade/barrel/faulty,
						/obj/item/gun_upgrade/muzzle/faulty,
						/obj/item/gun_upgrade/mechanism/faulty,
						/obj/item/gun_upgrade/scope/faulty
						)

	var/obj/item/choice = input(owner, "Which modification do you want?", "Mod Choice", null) as null|anything in choices_mods

	if(choice && pay_power_cost(nano_point_cost))
		to_chat(owner, "You permanently assign some of your nanites to create a modification.")
		owner.put_in_hands(new choice(owner.loc))

// Give the user a perk that allow them to create an ammo box every 30 minutes
/obj/item/organ/internal/nanogate/proc/nanite_ammo()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Munition Fabrication (1)"
	set desc = "Spend some of your nanites to create an ammo."
	nano_point_cost = 1

	if(!owner.stats.getPerk(PERK_NANITE_AMMO)) // Do they already have the perk?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to create ammunition boxes.")
			owner.stats.addPerk(PERK_NANITE_AMMO)
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_ammo
