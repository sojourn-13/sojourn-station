///////////////////////////////////// Sablekyne Based Perks
/datum/perk/lastbreath
	name = "Last Stand"
	desc = "You learned that your body is a tank, through will and biology you can ignore pain entirely for a short amount of time."
	active = FALSE
	passivePerk = FALSE

/datum/perk/lastbreath/activate()
	var/mob/living/carbon/human/user = usr
	if(!istype(user))
		return ..()
	if(world.time < cooldown_time)
		to_chat(usr, SPAN_NOTICE("Your nerves are shot, you'll need to recover before you can withstand greater pain again."))
		return FALSE
	cooldown_time = world.time + 20 MINUTES
	user.visible_message("<b><font color='red'>[user] begins growling as their muscles tighten!</font><b>", "<b><font color='red'>You feel a comfortable warmth as your body steels itself against all pain.</font><b>", "<b><font color='red'>You hear something growling!</font><b>")
	log_and_message_admins("used their [src] perk.")
	user.reagents.add_reagent("latkadone", 10)
	return ..()

/datum/reagent/medicine/latkadone
	name = "Latkadone"
	id = "latkadone"
	description = "A very effective and immensely powerful painkiller naturally produced by several species when under severe stress."
	taste_description = "bitterness"
	reagent_state = LIQUID
	color = "#800080"
	nerve_system_accumulations = 20
	appear_in_default_catalog = FALSE
	constant_metabolism = TRUE
	scannable = TRUE

/datum/reagent/medicine/latkadone/affect_blood(mob/living/carbon/M, alien, effect_multiplier)
	M.add_chemical_effect(CE_PAINKILLER, 75, TRUE)
	M.apply_effect(-25, AGONY, 0)
