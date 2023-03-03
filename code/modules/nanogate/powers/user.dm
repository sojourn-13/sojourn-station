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
	set name = "Nanite Regeneration (7)"
	set desc = "Spend a large portion of your nanites to restore and repair your body by enhancing your natural healing."
	nano_point_cost = 7

	if(owner.species.reagent_tag == IS_SYNTHETIC)
		to_chat(owner, "a small beep of your nanogate tells you \"ERROR, REFUNDING NANITES: ASSIGNMENT IMPOSSIBLE FOR SYNTHETICS!\"")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_regen
		return

	if(!owner.stats.getPerk(PERK_NANITE_REGEN)) // Do they already have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to repairing your body.")
			owner.stats.addPerk(PERK_NANITE_REGEN)
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_regen
			perk_list += PERK_NANITE_REGEN
	else
		to_chat(owner, "Assigning more nanites to repairing your body wouldn't give you a boost in regeneration rate.")

// Give the user a perk that make him move faster
/obj/item/organ/internal/nanogate/proc/nanite_muscle()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Nanofiber Muscles (5)"
	set desc = "Spend some of your nanites to create nanite muscle to allow you to move faster."
	nano_point_cost = 5 // Install two augments on both legs

	if(!owner.stats.getPerk(PERK_NANITE_MUSCLE)) // Do they already have the perk?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to enhancing your physical movement.")
			owner.stats.addPerk(PERK_NANITE_MUSCLE)
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_muscle
			perk_list += PERK_NANITE_MUSCLE
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
			perk_list += PERK_NANITE_ARMOR
	else
		to_chat(owner, "Your nanites are already providing as much armor as they can.")

// Allow the user to inject themselves with a chosen nanite.
/obj/item/organ/internal/nanogate/proc/nanite_chem()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Nanite Refabrication (1)"
	set desc = "Convert some of your nanites into more specialized nanites. Only works for biological entities."
	nano_point_cost = 1

	if(owner.species.reagent_tag == IS_SYNTHETIC)
		to_chat(owner, "a small beep of your nanogate tells you \"ERROR, REFUNDING NANITES: ASSIGNMENT IMPOSSIBLE FOR SYNTHETICS!\"")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_chem
		return

	var/list/choices_perk = list(	"Implantoids" = PERK_NANITE_CHEM_IMPLANT,
									"Trauma Control System" = PERK_NANITE_CHEM_TCS,
									"Control Booster Utility" = PERK_NANITE_CHEM_CBU,
									"Control Booster Combat" = PERK_NANITE_CHEM_CBC,
									"Purgers" = PERK_NANITE_CHEM_PURGER,
									"Oxyrush" = PERK_NANITE_CHEM_OXYRUSH,
									"Nantidotes" = PERK_NANITE_CHEM_NANTIDOTE)

	var/datum/perk/nanite_chem/choice = choices_perk[input(owner, "Which nanite chem do you want?", "Chem Choice", null) as null|anything in choices_perk]

	if(choice && pay_power_cost(nano_point_cost)) // Check if the user actually made a choice, and if they did, check if they have the points.
		owner.stats.addPerk(choice)
		perk_list += choice
		to_chat(owner, "You permanently convert some of your nanites into specialized variants.")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_chem

// Give the user a tool or gun mod
/obj/item/organ/internal/nanogate/proc/nanite_mod()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Modification Fabrication (1)"
	set desc = "Spend some of your nanites to create a tool or gun mod."
	nano_point_cost = 1
		// Add illegal shit here
	var/list/blacklisted_types = list(	/obj/item/tool_upgrade/reinforcement,
						/obj/item/tool_upgrade/productivity,
						/obj/item/tool_upgrade/refinement,
						/obj/item/tool_upgrade/augment,
						/obj/item/tool_upgrade/armor,
						/obj/item/tool_upgrade/augment/holding_tank,
						/obj/item/tool_upgrade/augment/ai_tool,
						/obj/item/tool_upgrade/augment/ai_tool_excelsior,
						/obj/item/tool_upgrade/augment/repair_nano,
						/obj/item/tool_upgrade/augment/randomizer,
						/obj/item/tool_upgrade/augment/holy_oils,
						/obj/item/tool_upgrade/augment/crusader_seal,
						/obj/item/tool_upgrade/artwork_tool_mod,
						/obj/item/tool_upgrade/augment/sanctifier,	//Has biomatter, sadly nanites are not able to use that
						/obj/item/tool_upgrade/armor/melee,
						/obj/item/tool_upgrade/armor/bullet,
						/obj/item/tool_upgrade/armor/energy,
						/obj/item/tool_upgrade/armor/bomb,
						/obj/item/tool_upgrade/productivity/waxcoat, //Biomatter
						/obj/item/gun_upgrade/barrel,
						/obj/item/gun_upgrade/muzzle,
						/obj/item/gun_upgrade/mechanism,
						/obj/item/gun_upgrade/trigger,
						/obj/item/gun_upgrade/magwell,
						/obj/item/gun_upgrade/scope,
						/obj/item/gun_upgrade/underbarrel,
						/obj/item/gun_upgrade/barrel/forged,
						/obj/item/gun_upgrade/barrel/bore,
						/obj/item/gun_upgrade/barrel/excruciator,	//Sadly has biomatter
						/obj/item/gun_upgrade/mechanism/upgrade_kit,
						/obj/item/gun_upgrade/mechanism/clock_block,//Brass and unknown tech
						/obj/item/gun_upgrade/trigger/boom,			//Illegal
						/obj/item/gun_upgrade/scope/watchman,
						/obj/item/gun_upgrade/mechanism/glass_widow,
						/obj/item/gun_upgrade/mechanism/greyson_master_catalyst,
						/obj/item/gun_upgrade/mechanism/brass_kit,
						/obj/item/gun_upgrade/trigger/honker,
						/obj/item/gun_upgrade/mechanism/bikehorn,
						/obj/item/gun_upgrade/mechanism/faulty_trapped,
						/obj/item/gun_upgrade/trigger/faulty,
						/obj/item/gun_upgrade/barrel/faulty,
						/obj/item/gun_upgrade/muzzle/faulty,
						/obj/item/gun_upgrade/muzzle/pain_maker,
						/obj/item/gun_upgrade/mechanism/faulty,
						/obj/item/gun_upgrade/scope/faulty
	)

	var/list/choice_mods = list()
	// add new paths into the format of + subtypesof(XXX)
	var/list/types = subtypesof(/obj/item/tool_upgrade) + subtypesof(/obj/item/gun_upgrade)
	for (var/mod in types)
		if (mod in blacklisted_types)
			continue
		var/obj/O = mod
		choice_mods[initial(O.name)] = mod

	var/obj/item/choice = input(usr, "Which modification do you want?", "Mod Choice", null) as null|anything in choice_mods

	if(choice && pay_power_cost(nano_point_cost))
		to_chat(owner, "You permanently assign some of your nanites to create a modification.")
		choice = choice_mods[choice]
		usr.put_in_hands(new choice(get_turf(usr)))

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
			perk_list += PERK_NANITE_AMMO
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_ammo

// Spends points for stats
/obj/item/organ/internal/nanogate/proc/nanite_stats()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Mindbanking (2)"
	set desc = "Spend some of your nanites to increase your knowledge."
	nano_point_cost = 2

	var/list/choices_stats = list(	"Mechanical" = STAT_MEC,
									"Cognition" = STAT_COG,
									"Biology" = STAT_BIO,
									"Robustness" = STAT_ROB,
									"Toughness" = STAT_TGH,
									"Vigilance" = STAT_VIG
									)

	var/stat = choices_stats[input(owner, "Which nanite chem do you want?", "Stats Choice", null) as null|anything in choices_stats]

	if(stat && pay_power_cost(nano_point_cost))
		to_chat(owner, "You permanently assign some of your nanites to be databanks.")
		owner.stats.changeStat(stat, 5)

// Spends points for increased food storage
/obj/item/organ/internal/nanogate/proc/nanite_food_storage()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Food Banking (1)"
	set desc = "Spend some of your nanites to allow the storage of additional nutrition on your body."
	nano_point_cost = 1

	if(owner.species.reagent_tag == IS_SYNTHETIC)
		to_chat(owner, "a small beep of your nanogate tells you \"ERROR, REFUNDING NANITES: ASSIGNMENT IMPOSSIBLE FOR SYNTHETICS!\"")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_food_storage
		return

	if(pay_power_cost(nano_point_cost))
		to_chat(owner, "You permanently assign some of your nanites to store additional nutrition.")
		owner.max_nutrition += 25 //Base is 400

// Allows you to drink metals for food
/obj/item/organ/internal/nanogate/proc/nanite_metal_drinker()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Metal-Eater (2)"
	set desc = "Spend some of your nanites to allow you to drink basic metals for nutrition. Does not nullifies any harmful effects of drinking said metal."
	nano_point_cost = 2

	if(owner.species.reagent_tag == IS_SYNTHETIC)
		to_chat(owner, "a small beep of your nanogate tells you \"ERROR, REFUNDING NANITES: ASSIGNMENT IMPOSSIBLE FOR SYNTHETICS!\"")
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_metal_drinker
		return

	if(!owner.stats.getPerk(PERK_NANITE_METAL_EATER)) // Do they already have the perk?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to break down metals in your guts for nutrition.")
			owner.stats.addPerk(PERK_NANITE_METAL_EATER)
			perk_list += PERK_NANITE_METAL_EATER
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_metal_drinker



