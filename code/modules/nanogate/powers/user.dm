// The powers here are centered around upgrading the user.
/*
List of powers in this page :
- Regeneration : Give the user a perk that constantly heal himself at a very slow rate based on the amount of points spent
- Speed Booster : Give the user a perk that make him move faster, the speed increase based on the amount of points spent
- Armor Upgrade : Give the user a perk that increases max hp, again the precise number is defined in the perk given.
- Chemical Injection : Allow the user to choose a type of nanite chem to inject himself, then give him a perk that will do the injection when the user want.
- Tool/Gun Mods : Give the user a modification that they chose from a list. The only reusable power.
- Nanite Ammo : Give the user a perk that can spawn an ammo box of a specified type every 30 minutes. Delay defined in the perk itself.
*/

// Give the user a perk that constantly heal a tiny bit of damage.
/mob/living/carbon/human/proc/nanite_regen()
	set category = "Nanogate Powers"
	set name = "Nanite Regeneration" //0.1hp/tick per nanite point
	set desc = "Spend a variable portion of your nanites to restore and repair your body by enhancing your natural healing."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!stats.getPerk(PERK_NANITE_REGEN)) // Do they already have the perk?
		var/variable_cost = input("How many points would you like to spend on nanite regeneration? (0.1hp/tick per point, max of 10)", "Assign nanites") as null|num
		if((variable_cost > 10) || (variable_cost < 1))
			to_chat(src, "Invalid nanite amount!")
			return
		if(organ.pay_power_cost(variable_cost))
			to_chat(src, "You permanently assign some of your nanites to repairing your body.")
			stats.addPerk(PERK_NANITE_REGEN)
			var/datum/perk/nanite_power/nanite_regen/NR = stats.getPerk(PERK_NANITE_REGEN)
			NR.regen_rate = variable_cost * 0.1
			organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_regen)
	else
		to_chat(src, "Assigning more nanites to repairing your body wouldn't give you a boost in regeneration rate.")

// Give the user a perk that make him move faster
/mob/living/carbon/human/proc/nanite_muscle()
	set category = "Nanogate Powers"
	set name = "Nanofiber Muscles" //0.06speedup per nanite point
	set desc = "Spend a variable amount of your nanites to create nanite muscle to allow you to move faster."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!stats.getPerk(PERK_NANITE_MUSCLE)) // Do they already have the perk?
		var/variable_cost = input("How many points would you like to spend on nanofiber musculuature? (0.06 speedup per point, max of 10)", "Assign nanites") as null|num
		if((variable_cost > 10) || (variable_cost < 1))
			to_chat(src, "Invalid nanite amount!")
			return
		if(organ.pay_power_cost(variable_cost))
			to_chat(src, "You permanently assign some of your nanites to enhancing your physical movement.")
			stats.addPerk(PERK_NANITE_MUSCLE)
			var/datum/perk/nanite_power/nanite_muscle/NM = stats.getPerk(PERK_NANITE_MUSCLE)
			NM.speedup = variable_cost * 0.06
			organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_muscle)
	else
		to_chat(src, "Assigning more nanites to enhance your muscles wouldn't offer any benefit.")

// Give the user a perk that reduce incoming damage
/mob/living/carbon/human/proc/nanite_armor()
	set category = "Nanogate Powers"
	set name = "Nanite Skin-Weave"
	set desc = "Spend a variable amount of your nanites to create subdermal nanite weave to protect your body."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!stats.getPerk(PERK_NANITE_ARMOR)) // Do they already have the perk?
		var/variable_cost = input("How many points would you like to spend on subdermal nanoweave? (10 maximum health per point, max of 5)", "Assign nanites") as null|num
		if((variable_cost > 5) || (variable_cost < 1))
			to_chat(src, "Invalid nanite amount!")
			return
		if(organ.pay_power_cost(variable_cost))
			to_chat(src, "You permanently assign some of your nanites to act as a reactive nano-weave armor, allowing you to resist physical brute damage.")
			stats.addPerk(PERK_NANITE_ARMOR)
			var/datum/perk/nanite_power/nanite_armor/NA = stats.getPerk(PERK_NANITE_ARMOR)
			NA.max_health_adjust = variable_cost * 10
			NA.adjustMaxHP()
			organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_armor)
	else
		to_chat(src, "Your nanites are already providing as much armor as they can.")

// Allow the user to inject themselves with a chosen nanite.
/mob/living/carbon/human/proc/nanite_chem()
	set category = "Nanogate Powers"
	set name = "Nanite Refabrication"
	set desc = "Convert some of your nanites into more specialized nanites, which slowly accumulate over time. Only works for organics."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(species.reagent_tag == IS_SYNTHETIC)
		to_chat(src, "a small beep of your nanogate tells you \"ERROR, REFUNDING NANITES: ASSIGNMENT IMPOSSIBLE FOR SYNTHETICS!\"")
		organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_chem)
		return

	var/list/choices_perk = list(	//"Implantoids" = PERK_NANITE_CHEM_IMPLANT, yeah so these don't exist
									"Nanosymbiotes" = PERK_NANITE_SYMBIOTES,
									"Trauma Control System" = PERK_NANITE_CHEM_TCS,
									"Control Booster Utility" = PERK_NANITE_CHEM_CBU,
									"Control Booster Combat" = PERK_NANITE_CHEM_CBC,
									"Purgers" = PERK_NANITE_CHEM_PURGER,
									"Oxyrush" = PERK_NANITE_CHEM_OXYRUSH,
									"Nantidotes" = PERK_NANITE_CHEM_NANTIDOTE)

	var/datum/perk/nanite_power/nanite_chem/choice = choices_perk[input(src, "Which nanite chem do you want?", "Chem Choice", null) as null|anything in choices_perk]
	var/variable_cost = input("How many points would you like to spend on nanochem generation? (15 minutes cooldown, decreased by 5 for every point above 1, cap of 3)", "Assign nanites") as null|num

	if(choice && organ.pay_power_cost(variable_cost)) // Check if the user actually made a choice, and if they did, check if they have the points.
		stats.addPerk(choice)
		var/datum/perk/nanite_power/nanite_chem/NC = stats.getPerk(choice)
		NC.cooldown_time = NC.cooldown_time / variable_cost
		to_chat(src, "You permanently convert some of your nanites into specialized variants.")
		organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_chem)

// Give the user a tool or gun mod
/mob/living/carbon/human/proc/nanite_mod()
	set category = "Nanogate Powers"
	set name = "Modification Fabricator"
	set desc = "Spend some of your nanites to create a modification fabricator, which can construct tool and gun mods over a long period of time."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!stats.getPerk(PERK_NANITE_MODS)) // Do they already have the perk?
		var/variable_cost = input("How many points would you like to spend on a modification nanoforge? (60 minutes cooldown, decreased by 10 for every point above 2, cap of 3)", "Assign nanites") as null|num
		if((variable_cost > 3) || (variable_cost < 2))
			to_chat(src, "Invalid nanite amount!")
			return
		if(organ.pay_power_cost(variable_cost))
			to_chat(src, "You permanently assign some of your nanites to create tool and gun mods.")
			stats.addPerk(PERK_NANITE_MODS)
			var/datum/perk/nanite_power/nanite_mods/NA = stats.getPerk(PERK_NANITE_MODS)
			if(variable_cost == 3)
				NA.cooldown = NA.cooldown - 10 MINUTES
			organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_mod)



// Give the user a perk that allow them to create an ammo box every 30 minutes
/mob/living/carbon/human/proc/nanite_ammo()
	set category = "Nanogate Powers"
	set name = "Munition Fabrication"
	set desc = "Spend some of your nanites to create an ammunition forge. More nanite assignment means faster recharge time."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!stats.getPerk(PERK_NANITE_AMMO)) // Do they already have the perk?
		var/variable_cost = input("How many points would you like to spend on an ammunition nanoforge? (15 minutes cooldown, decreased by 5 for every point above 1, cap of 3)", "Assign nanites") as null|num
		if((variable_cost > 3) || (variable_cost < 1))
			to_chat(src, "Invalid nanite amount!")
			return
		if(organ.pay_power_cost(variable_cost))
			to_chat(src, "You permanently assign some of your nanites to create ammunition boxes.")
			stats.addPerk(PERK_NANITE_AMMO)
			var/datum/perk/nanite_power/nanite_ammo/NA = stats.getPerk(PERK_NANITE_AMMO)
			NA.cooldown = NA.cooldown/variable_cost
			organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_ammo)

// Spends points for stats
/mob/living/carbon/human/proc/nanite_stats()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Mindbanking"
	set desc = "Spend some of your nanites to increase your knowledge."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	var/list/choices_stats = list(	"Mechanical" = STAT_MEC,
									"Cognition" = STAT_COG,
									"Biology" = STAT_BIO,
									"Robustness" = STAT_ROB,
									"Toughness" = STAT_TGH,
									"Vigilance" = STAT_VIG
									)

	var/stat = choices_stats[input(src, "Which aspect of your knowledge would you like to enhance??", "Stats Choice", null) as null|anything in choices_stats]
	var/variable_cost = input("How many points would you like to spend on [stat]? (10 per point)", "Assign nanites") as null|num
	if(stat && organ.pay_power_cost(variable_cost))
		to_chat(src, "You permanently assign some of your nanites to be databanks.")
		stats.changeStat(stat, (variable_cost * 10))

// Spends points for increased food storage
/mob/living/carbon/human/proc/nanite_food_storage()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Foodbanking (1)"
	set desc = "Spend some of your nanites to allow the storage of additional nutrition on your body."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(species.reagent_tag == IS_SYNTHETIC)
		to_chat(src, "a small beep of your nanogate tells you \"ERROR, REFUNDING NANITES: ASSIGNMENT IMPOSSIBLE FOR SYNTHETICS!\"")
		organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_food_storage)
		return

	if(organ.pay_power_cost(1))
		to_chat(src, "You permanently assign some of your nanites to store additional nutrition.")
		max_nutrition += 25 //Base is 400

// Allows you to drink metals for food
/mob/living/carbon/human/proc/nanite_metal_drinker()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Metal-Eater (1)"
	set desc = "Spend some of your nanites to allow you to drink basic metals for nutrition. Does not nullifies any harmful effects of drinking said metal."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(species.reagent_tag == IS_SYNTHETIC)
		to_chat(src, "a small beep of your nanogate tells you \"ERROR, REFUNDING NANITES: ASSIGNMENT IMPOSSIBLE FOR SYNTHETICS!\"")
		organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_metal_drinker)
		return

	if(!stats.getPerk(PERK_NANITE_METAL_EATER)) // Do they already have the perk?
		if(organ.pay_power_cost(1))
			to_chat(src, "You permanently assign some of your nanites to break down metals in your guts for nutrition.")
			stats.addPerk(PERK_NANITE_METAL_EATER)
			organ.organ_remove_verb(/mob/living/carbon/human/proc/nanite_metal_drinker)



