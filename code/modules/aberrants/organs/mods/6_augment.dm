//Has intractions, perks and other checks, its own grouping to keep it clean and simple
/obj/item/modification/organ/internal/agument
	var/perk = null
	var/mob/living/carbon/human/linked_person = null
	var/cares_about_life = FALSE
	var/cares_about_psion = TRUE

/obj/item/modification/organ/internal/agument/proc/sync_remove()
	if(linked_person)
		if(perk)
			linked_person.stats.removePerk(perk)
	linked_person = null

/obj/item/modification/organ/internal/agument/proc/sync_add(mob/living/L)
	linked_person = L
	if(linked_person)
		if(perk)
			linked_person.stats.addPerk(perk)


/obj/item/modification/organ/internal/agument/update_icon()
	return

//Synth chips

/obj/item/modification/organ/internal/agument/brain_bank_bio
	name = "Synthic Brain Data Chip: Type B"
	desc = "A small chip with files on it only readable by a synthic brain. Useful for uploading general biological information."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "type_b"
	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_GLASS = 3, MATERIAL_GOLD = 0.1, MATERIAL_SILVER = 0.1, MATERIAL_DIAMOND = 0.1) //not much
	price_tag = 250

/obj/item/modification/organ/internal/agument/brain_bank_bio/sync_add(mob/living/L)
	..()
	if(linked_person)
		linked_person.stats.add_Stat_cap(STAT_BIO, 15)
		linked_person.stats.changeStat(STAT_BIO, 10)


/obj/item/modification/organ/internal/agument/brain_bank_bio/sync_remove()
	if(linked_person)
		linked_person.stats.add_Stat_cap(STAT_BIO, -15)
		linked_person.stats.changeStat(STAT_BIO, 10)
	..()

/obj/item/modification/organ/internal/agument/brain_bank_bio/New()
	var/datum/component/modification/organ/stromal/agument/M = AddComponent(/datum/component/modification/organ/stromal/agument)

	M.apply_to_types = list(/obj/item/organ/internal/vital/brain/synthetic) //FPB's stay losing
	M.examine_msg = "Can be attached to a Synthic Brain. Only works on Silicon type." //Duh
	M.examine_difficulty = STAT_LEVEL_BASIC
	M.prefix = "Chipped Type B"
	M.resticted_to_nature = "ROBOTIC"
	..()

/obj/item/modification/organ/internal/agument/brain_bank_cog
	name = "Synthic Brain Data Chip: Type C"
	desc = "A small chip with files on it only readable by a synthic brain. Useful for optimizing general information unrelated to any biological or mechanical."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "type_c"
	matter = list(MATERIAL_PLASTIC = 3, MATERIAL_GLASS = 3, MATERIAL_GOLD = 0.1, MATERIAL_SILVER = 0.1, MATERIAL_DIAMOND = 0.1) //not much
	price_tag = 250

/obj/item/modification/organ/internal/agument/brain_bank_cog/sync_add(mob/living/L)
	..()
	if(linked_person)
		linked_person.stats.add_Stat_cap(STAT_COG, 15)
		linked_person.stats.changeStat(STAT_COG, 15)


/obj/item/modification/organ/internal/agument/brain_bank_cog/sync_remove()
	if(linked_person)
		linked_person.stats.add_Stat_cap(STAT_COG, -15)
		linked_person.stats.changeStat(STAT_COG, 15)
	..()

/obj/item/modification/organ/internal/agument/brain_bank_cog/New()
	var/datum/component/modification/organ/stromal/agument/M = AddComponent(/datum/component/modification/organ/stromal/agument)

	M.apply_to_types = list(/obj/item/organ/internal/vital/brain/synthetic) //FPB's stay losing
	M.examine_msg = "Can be attached to a Synthic Brain. Only works on Silicon type." //Duh
	M.examine_difficulty = STAT_LEVEL_BASIC
	M.prefix = "Chipped Type C"
	M.resticted_to_nature = "ROBOTIC"
	..()

/obj/item/modification/organ/internal/agument/eye_lens
	name = "AutoTint(TM) Lens MK.IX"
	desc = "A mechanical lens that holds a small sheet of plasma able to reflect some light. Does not reduce vision in dark enviroments."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "eye_lens_agu"
	matter = list(MATERIAL_PLASTIC = 0.1, MATERIAL_GLASS = 0.5, MATERIAL_PLASMA = 0.1, MATERIAL_SILVER = 0.1, MATERIAL_DIAMOND = 0.1) //not much
	price_tag = 250

/obj/item/modification/organ/internal/agument/eye_lens/sync_add(mob/living/L)
	..()
	if(linked_person)
		var/obj/item/organ/internal/eyes/E = linked_person.random_organ_by_process(OP_EYES)
		if(E)
			E.flash_protection += FLASH_PROTECTION_MINOR

/obj/item/modification/organ/internal/agument/eye_lens/sync_remove()
	if(linked_person)
		var/obj/item/organ/internal/eyes/E = linked_person.random_organ_by_process(OP_EYES)
		if(E)
			E.flash_protection -= FLASH_PROTECTION_MINOR
	..()

/obj/item/modification/organ/internal/agument/eye_lens/New()
	var/datum/component/modification/organ/stromal/agument/M = AddComponent(/datum/component/modification/organ/stromal/agument)

	M.apply_to_types = list(/obj/item/organ/internal/eyes) //FPB's stay losing
	M.examine_msg = "Can be attached to a prosthetic set of eyes. Only works on Silicon type." //Duh
	M.examine_difficulty = STAT_LEVEL_BASIC
	M.prefix = "AutoTint(TM)"
	M.resticted_to_nature = "ROBOTIC"
	..()

/obj/item/modification/organ/internal/agument/liver_buffer
	name = "Liver Delay System Agumentation"
	desc = "A wirey plastic set of tubes that are covered in small scales that slows toxins and other impurities in blood."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "wiremesh"
	matter = list(MATERIAL_PLASTIC = 0.3, MATERIAL_GLASS = 0.1, MATERIAL_GOLD = 0.1, MATERIAL_SILVER = 0.1, MATERIAL_DIAMOND = 0.1) //Carbon filtering clearly!
	price_tag = 120

/obj/item/modification/organ/internal/agument/liver_buffer/sync_add(mob/living/L)
	..()
	if(linked_person)
		var/obj/item/organ/internal/liver/E = linked_person.random_organ_by_process(OP_EYES)
		if(E)
			E.toxin_handling_multy -= 0.25

/obj/item/modification/organ/internal/agument/liver_buffer/sync_remove()
	if(linked_person)
		var/obj/item/organ/internal/liver/E = linked_person.random_organ_by_process(OP_EYES)
		if(E)
			E.toxin_handling_multy += 0.25
	..()

/obj/item/modification/organ/internal/agument/liver_buffer/New()
	var/datum/component/modification/organ/stromal/agument/M = AddComponent(/datum/component/modification/organ/stromal/agument)

	M.apply_to_types = list(/obj/item/organ/internal/liver)
	M.examine_msg = "Can be attached to livers. Most useful in living tissue." //Duh
	M.examine_difficulty = STAT_LEVEL_BASIC
	M.prefix = "Delay System Agumentated"
	..()

/obj/item/modification/organ/internal/agument/nerve_sync
	name = "Nerve SYNC type class CQC Agumentation"
	desc = "A complex pattern of small thin plasteel wires and pins that allows the nerve to more effectively tighten grips on weapons or balled hands increasing impact power, if only slightly."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "sync"
	matter = list(MATERIAL_PLASTIC = 0.8, MATERIAL_GOLD = 0.1, MATERIAL_SILVER = 0.1, MATERIAL_PLASTEEL = 0.1)
	price_tag = 250

/obj/item/modification/organ/internal/agument/nerve_sync/sync_add(mob/living/L)
	..()
	if(linked_person)
		linked_person.cqc_damage_multiplier += 0.01


/obj/item/modification/organ/internal/agument/nerve_sync/sync_remove()
	if(linked_person)
		linked_person.cqc_damage_multiplier -= 0.01
	..()

/obj/item/modification/organ/internal/agument/nerve_sync/New()
	var/datum/component/modification/organ/stromal/agument/M = AddComponent(/datum/component/modification/organ/stromal/agument)

	M.apply_to_types = list(/obj/item/organ/internal/nerve)
	M.examine_msg = "Can be attached to nerves. Increases damage delt via melee and hand to hand by around 1%" //Duh
	M.examine_difficulty = STAT_LEVEL_BASIC
	M.prefix = "SYNC Type CQC"
	..()

/obj/item/modification/organ/internal/agument/oxy_armor_blood
	name = "Blood-Coil-Monitor Type XI Processor"
	desc = "A strange wrapper that goes around major blood vessels and arterys with the goal of aiding in statis when cells are suffering from asphyxia. \
	Does not prevent organ failer or other side affects of asphyxia."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "blood_vine"
	matter = list(MATERIAL_GOLD = 0.1, MATERIAL_SILVER = 0.1, MATERIAL_STEEL = 0.1)
	price_tag = 50

/obj/item/modification/organ/internal/agument/oxy_armor_blood/sync_add(mob/living/L)
	..()
	if(linked_person)
		linked_person.oxy_armor += 0.5


/obj/item/modification/organ/internal/agument/oxy_armor_blood/sync_remove()
	if(linked_person)
		linked_person.oxy_armor -= 0.5
	..()

/obj/item/modification/organ/internal/agument/oxy_armor_blood/New()
	var/datum/component/modification/organ/stromal/agument/M = AddComponent(/datum/component/modification/organ/stromal/agument)

	M.apply_to_types = list(/obj/item/organ/internal/blood_vessel)
	M.examine_msg = "Can be attached to blood vessels. Decreases harm from lack of internals or means of breath. These implants are unable to provide complete protection from asphyxia."
	M.examine_difficulty = STAT_LEVEL_BASIC
	M.prefix = "Coiled"
	..()