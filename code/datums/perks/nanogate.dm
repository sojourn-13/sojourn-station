// Perks given by the nanogate organ

/datum/perk/nanogate
	name = "Spinal Nanite Implant"
	desc = "You have a nanogate implant in your spine."
	gain_text = "Your spine hurt for a bit."

/datum/perk/nanite_regen
	name = "Nanite Regeneration"
	desc = "You set the nanites in your body to the task of repairing your body of any damage it got."
	gain_text = "Your spine hurt for a bit as the nanites start repairing the damage."
	var/regen_rate = 1

/datum/perk/nanite_muscle
	name = "Nanite Muscles"
	desc = "You set the nanites in your body to the task of making you move fast."
	gain_text = "Your spine hurt for a bit as the nanites start make you faster."

/datum/perk/nanite_armor
	name = "Nanite Armor"
	desc = "You set the nanites in your body to the task of making you more resilient."
	gain_text = "Your spine hurt for a bit as the nanites reinforce your body."
	var/armor_mod = 0.3

/datum/perk/nanite_armor/assign(mob/living/carbon/human/H)
	..()
	holder.brute_mod_perk -= armor_mod

/datum/perk/nanite_armor/remove()
	..()
	holder.brute_mod_perk += armor_mod

/datum/perk/nanite_knife
	name = "Nanite Knife"
	desc = "You set the nanites in your body to the task of making you more resilient."
	gain_text = "Your spine hurt for a bit as the nanites reinforce your body."
	active = FALSE
	passivePerk = FALSE

/datum/perk/nanite_knife/activate()
	..()
	var/obj/item/tool/knife/nanite_blade/knife = new /obj/item/tool/knife/nanite_blade(src, holder)
	holder.visible_message(
		"[holder] clenches their fist, electricity crackling before a psionic blade forms in their hand!",
		"You feel the rush of electric essence shocking your hand lightly before a psychic blade forms!"
		)
	playsound(holder.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	holder.put_in_active_hand(knife)

/datum/perk/nanite_tool
	name = "Nanite Omnitool"
	desc = "You set the nanites in your body to the task of making you more resilient."
	gain_text = "Your spine hurt for a bit as the nanites reinforce your body."
	active = FALSE
	passivePerk = FALSE

/datum/perk/nanite_tool/activate()
	..()
	var/obj/item/tool/nanite_omnitool/tool = new /obj/item/tool/nanite_omnitool(src, holder)
	holder.visible_message(
		"[holder] clenches their fist, electricity crackling before a psionic blade forms in their hand!",
		"You feel the rush of electric essence shocking your hand lightly before a psychic blade forms!"
		)
	playsound(holder.loc, pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg'), 50, 1, -3)
	holder.put_in_active_hand(tool)

/datum/perk/nanite_chem
	name = "Nanite Chemical"
	desc = "You can send the prepared nanites into your bloodstream at a moment's notice, but only once."
	gain_text = "Your spine hurt for a bit as the nanites convert themselves."
	active = FALSE
	passivePerk = FALSE
	var/chem_id = "nanites"
	var/chem_amount = 15

/datum/perk/nanite_chem/activate()
	..()
	to_chat(holder, "Your spine hurt as the converted nanites enter your bloodstream.")
	holder.reagents.add_reagent(chem_id, chem_amount)
	spawn(5) holder.stats.removePerk(src.type) // Delete the perk

/datum/perk/nanite_chem/implantoids
	name = "Implantoids Nanites"
	chem_id = "implant nanites"

/datum/perk/nanite_chem/trauma_control_system
	name = "Trauma Control System Nanites"
	chem_id = "trauma_control_system"

/datum/perk/nanite_chem/control_booster_utility
	name = "Control Booster Utility Nanites"
	chem_id = "cbu"

/datum/perk/nanite_chem/control_booster_combat
	name = "Control Booster Combat Nanites"
	chem_id = "cbc"

/datum/perk/nanite_chem/purgers
	name = "Purgers Nanites"
	chem_id = "nanopurgers"

/datum/perk/nanite_chem/oxyrush
	name = "Oxyrush Nanites"
	chem_id = "oxyrush"

/datum/perk/nanite_chem/nantidotes
	name = "Nantidotes Nanites"
	chem_id = "nantidotes"
