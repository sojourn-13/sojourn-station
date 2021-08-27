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

/datum/perk/nanite_creation/nanite_knife/activate()
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
