/obj/item/modification/organ/internal/stromal
	name = "stromal organoid"
	icon = 'icons/obj/organ_mods.dmi'
	price_tag = 200

/obj/item/modification/organ/internal/stromal/update_icon()
	return

// Improvement mods add a beneficial multiplier or additive modifier to organ stats.
/obj/item/modification/organ/internal/stromal/improvement
	name = "improvement organoid"

/obj/item/modification/organ/internal/stromal/improvement/requirements
	name = "improved capillaries"
	desc = "Modified capillaries that improve substance transfer within an organ."
	icon_state = "capillary"

/obj/item/modification/organ/internal/stromal/improvement/requirements/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.blood_req_multiplier = 0.10
	M.nutriment_req_multiplier = 0.10
	M.oxygen_req_multiplier = 0.10
	M.prefix = "efficient"
	..()

/obj/item/modification/organ/internal/stromal/improvement/durability
	name = "durable membrane"
	desc = "A stronger membrane that allows an organ to sustain greater injury before its functions are diminished."
	icon_state = "mucous_membrane"

/obj/item/modification/organ/internal/stromal/improvement/durability/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.specific_organ_size_mod = 0.25
	M.min_bruised_damage_multiplier = 0.20
	M.min_broken_damage_multiplier = 0.20
	M.max_damage_multiplier = 0.20
	M.prefix = "durable"
	..()

/obj/item/modification/organ/internal/stromal/improvement/efficiency
	name = "stem cell application"
	desc = "A clump of stem cells that increases the functional efficiency of an organ when applied to parenchymal tissue."
	icon_state = "stem_cells"

/obj/item/modification/organ/internal/stromal/improvement/efficiency/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.organ_efficiency_multiplier = 0.10
	M.removable = FALSE		// Stem cells don't go back to being undifferentiated
	M.prefix = "enhanced"
	..()

// Augments modify non-stat properties or greatly improve a stat at the cost of another.
/obj/item/modification/organ/internal/stromal/augment
	name = "augment organoid"
	desc = ""

/obj/item/modification/organ/internal/stromal/augment/overclock
	name = "visceral symbiont"
	desc = "A leech-like creature that attaches itself to the viscera of an orgnanism. It mimics the function of the parent organ in exchange for blood, oxygen, and nutrients."
	icon_state = "symbiont"

/obj/item/modification/organ/internal/stromal/augment/overclock/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.organ_efficiency_multiplier = 0.20
	M.blood_req_multiplier = -0.20
	M.nutriment_req_multiplier = -0.20
	M.oxygen_req_multiplier = -0.20
	M.prefix = "symbiotic"
	..()

/obj/item/modification/organ/internal/stromal/augment/underclock
	name = "bypass tubules"
	desc = "A series of tubules that siphon blood away from an organ, reducing its effectiveness, to be used elsewhere in the body."
	icon_state = "tubules"

/obj/item/modification/organ/internal/stromal/augment/underclock/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.organ_efficiency_multiplier = -0.20		// Brings a standard organ just above the efficiency where the body is negatively impacted
	M.blood_req_multiplier = 0.20
	M.nutriment_req_multiplier = 0.20
	M.oxygen_req_multiplier = 0.20
	M.prefix = "bypassed"
	..()

/obj/item/modification/organ/internal/stromal/augment/expander
	name = "biostructure gel"
	desc = "A gel that will solidify as structural tissue of the organ it is applied to."
	icon_state = "advanced_collagen"

/obj/item/modification/organ/internal/stromal/augment/expander/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.specific_organ_size_mod = 0.25
	M.max_upgrade_mod = 2
	M.removable = FALSE		// Not feasible to remove
	M.prefix = "expanded"
	..()

/obj/item/modification/organ/internal/stromal/augment/silencer
	name = "masked membrane"
	desc = "An outer membrane that absorbs typical medical scanning wavelengths. Slightly impedes organ functions."
	icon_state = "stealth_composites"

/obj/item/modification/organ/internal/stromal/augment/silencer/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.organ_efficiency_multiplier = -0.10
	M.scanner_hidden = TRUE
	M.prefix = "scanner-masked"
	..()

/obj/item/modification/organ/internal/parenchymal
	name = "pygmy parenchymal membrane"
	desc = "A graftable membrane for organ tissues. Contains functional tissue from one or more organs."
	description_info = "Adds/increases organ efficiencies. Size, blood, oxygen, and nutrition requirements are based on the added efficiencies."
	icon_state = "membrane"
	var/organ_eff_mod = 0.2

/obj/item/modification/organ/internal/parenchymal/New(loc, generate_organ_stats = TRUE, predefined_modifier = organ_eff_mod)
	var/datum/component/modification/organ/parenchymal/M = AddComponent(/datum/component/modification/organ/parenchymal)

	M.prefix = "multi-functional"
	..()

/obj/item/modification/organ/internal/parenchymal/large
	name = "parenchymal membrane"
	organ_eff_mod = 0.4

// Junk loot or craftables
/obj/item/modification/organ/internal/electromechanical

/obj/item/modification/organ/internal/electromechanical/bone_braces
	name = "bone braces"
	desc = "Little metal bits that bones can be reinforced with."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "bone_braces"
	matter = list(MATERIAL_PLASTEEL = 3)
	price_tag = 90

/obj/item/modification/organ/internal/electromechanical/bone_braces/update_icon()
	return

/obj/item/modification/organ/internal/electromechanical/bone_braces/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.apply_to_types = list(/obj/item/organ/internal/bone)
	M.examine_msg = "Can be attached to bones."
	M.examine_difficulty = STAT_LEVEL_BASIC
	M.prefix = "reinforced"

	M.organ_efficiency_mod = list(OP_BONE = 0.33)
	..()

/obj/item/modification/organ/internal/electromechanical/wire_weaves
	name = "wire weaving"
	desc = "Complex mesh that interweaves wires to help make them more sturdy."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "wire_weavers"
	matter = list(MATERIAL_PLASTIC = 3)
	price_tag = 12 //4 credits per sheet! Whata deal!

/obj/item/modification/organ/internal/electromechanical/wire_weaves/update_icon()
	return

/obj/item/modification/organ/internal/electromechanical/wire_weaves/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.apply_to_types = list(/obj/item/organ/internal/nerve)
	M.examine_msg = "Can be attached to nerves. Only works on Silicon type."
	M.examine_difficulty = STAT_LEVEL_BASIC
	M.prefix = "woven"
	M.resticted_to_nature = "ROBOTIC"
	M.max_damage_mod = 4
	..()

/obj/item/modification/organ/internal/electromechanical/steel_bands
	name = "steel bands"
	desc = "A set of steel bands that wrap around mechanical muscles to keep them from fraying."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "bands"
	matter = list(MATERIAL_STEEL = 3)
	price_tag = 12 //4 credits per sheet! Whata deal!

/obj/item/modification/organ/internal/electromechanical/steel_bands/update_icon()
	return

/obj/item/modification/organ/internal/electromechanical/steel_bands/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.apply_to_types = list(/obj/item/organ/internal/muscle)
	M.examine_msg = "Can be attached to muscle. Only works on Silicon type."
	M.examine_difficulty = STAT_LEVEL_BASIC
	M.prefix = "bundled"
	M.resticted_to_nature = "ROBOTIC"
	M.max_damage_mod = 4
	..()

/obj/item/modification/organ/internal/electromechanical/microbattery_case
	name = "Microbattery Case"
	desc = "Plasteel case with steel rods to give extra support to a microbattery allowing it to take more damage before shutting down."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "case"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_PLASTEEL = 3)
	price_tag = 12 //4 credits per sheet! Whata deal!

/obj/item/modification/organ/internal/electromechanical/microbattery_case/update_icon()
	return

/obj/item/modification/organ/internal/electromechanical/microbattery_case/New()
	var/datum/component/modification/organ/stromal/M = AddComponent(/datum/component/modification/organ/stromal)

	M.apply_to_types = list(/obj/item/organ/internal/cell)
	M.examine_msg = "Can be attached to microbatteries. Only works on Silicon type." //Duh
	M.examine_difficulty = STAT_LEVEL_BASIC
	M.prefix = "caged"
	M.resticted_to_nature = "ROBOTIC"
	M.max_damage_mod = 12 //Basically we want a larger health pool for this
	..()
