// This is where you write the powers for the nanogate implant/organ. Keep in mind that the points it use are only regenerated as the beginning of the shift.

/*
You get a point pool of 10 points at shift start, you cannot restore or get more points. You may use this point pool to do 2 things.
You build a robot which follows you at all times which you can spend further points to unlock abilities.

Abilities include:
-Self repair (regeneration)
-Higher damage
-Higher health
-Autodoc mode (voice command makes it diagnose then inject chemicals based on your current damage)
-Service mode (bot spawns ration food and drinks toxic to anyone but an opifex)
-Radio mode (voice commands turn on and off a station bounced radio)
The other use is for self augmentation in ways beyond what robotics does. Giving you augments that can't be taken out and are quite powerful, but they take from the same resource point pool as your robot augmenting.
Self augments include:
-Speed boosters
-Razor nails
-Stat effecting nanite injections
-Armor upgrades
-Opifex specialized omnitools
*/

// Nanobot powers and upgrades.
/obj/item/organ/internal/nanogate/proc/create_nanobot()
	set category = "Nanogate Powers"
	set name = "Create Nanobot (2)"
	set desc = "Spend some of your nanites to create a loyal companion."
	nano_point_cost = 2

	if(!Stand) // Do they already have the bot?
		var/bot_name = input(owner, "Choose your nanobot's name : ", "Nanobot Name", "Nanobot") as null|text
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to creating a nanobot.")
			Stand = new /mob/living/carbon/superior_animal/nanobot(owner.loc)
			Stand.name = bot_name
			Stand.creator += owner
			verbs -= /obj/item/organ/internal/nanogate/proc/create_nanobot
	else
		to_chat(owner, "Your nanogate is already as its limit controlling one Nanobot. Making more would end badly.")

// Boost the nanobot's damage
/obj/item/organ/internal/nanogate/proc/stand_damage()
	set category = "Nanogate Powers"
	set name = "Upgrade Nanobot - Damage (1)"
	set desc = "Spend some of your nanites to upgrade your nanobot."
	nano_point_cost = 1
	var/damage_boost = 20 // How much bonus damage does the nanobot get?

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to boost your nanobot's damage output.")
			Stand.melee_damage_lower += damage_boost
			Stand.melee_damage_upper += damage_boost
			verbs -= /obj/item/organ/internal/nanogate/proc/stand_damage
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

// Boost the nanobot's health
/obj/item/organ/internal/nanogate/proc/stand_health()
	set category = "Nanogate Powers"
	set name = "Upgrade Nanobot - Health (1)"
	set desc = "Spend some of your nanites to upgrade your nanobot."
	nano_point_cost = 1
	var/health_boost = 200 // How much bonus health does the nanobot get?

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to reinforce your nanobot's durability.")
			Stand.health += health_boost
			Stand.maxHealth += health_boost
			verbs -= /obj/item/organ/internal/nanogate/proc/stand_health
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

// Boost the nanobot's armor
/obj/item/organ/internal/nanogate/proc/stand_armor()
	set category = "Nanogate Powers"
	set name = "Upgrade Nanobot - Armor (1)"
	set desc = "Spend some of your nanites to upgrade your nanobot."
	nano_point_cost = 1
	var/armor_boost = list(melee = 60, bullet = 60, energy = 60, bomb = 75, bio = 100, rad = 100) // How much armor does the nanobot get?

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to reinforce your nanobot's armor.")
			Stand.armor = armor_boost
			verbs -= /obj/item/organ/internal/nanogate/proc/stand_armor
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

// Boost the nanobot's armor
/obj/item/organ/internal/nanogate/proc/stand_repair()
	set category = "Nanogate Powers"
	set name = "Upgrade Nanobot - Self-Repair (1)"
	set desc = "Spend some of your nanites to upgrade your nanobot."
	nano_point_cost = 1
	var/repair_rate = 5 // How fast does the nanobot repair itself?

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to reinforce your nanobot's armor.")
			Stand.repair_rate += repair_rate
			verbs -= /obj/item/organ/internal/nanogate/proc/stand_repair
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

// Powers that activate various modes for the bot.
/obj/item/organ/internal/nanogate/proc/autodoc_mode()
	set category = "Nanogate Powers"
	set name = "Activate Nanobot Protocol - Autodoc (1)"
	set desc = "Spend some of your nanites to activate a protocol in your bot.."
	nano_point_cost = 1

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to activate a mode in your bot.")
			Stand.hearing_flag |= AUTODOC_MODE
			verbs -= /obj/item/organ/internal/nanogate/proc/autodoc_mode
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

// Powers that activate various modes for the bot.
/obj/item/organ/internal/nanogate/proc/radio_mode()
	set category = "Nanogate Powers"
	set name = "Activate Nanobot Protocol - Radio (1)"
	set desc = "Spend some of your nanites to activate a protocol in your bot."
	nano_point_cost = 1

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to activate a mode in your bot.")
			Stand.hearing_flag |= RADIO_MODE
			verbs -= /obj/item/organ/internal/nanogate/proc/radio_mode
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

// Powers that activate various modes for the bot.
/obj/item/organ/internal/nanogate/proc/food_mode()
	set category = "Nanogate Powers"
	set name = "Activate Nanobot Protocol - Food (1)"
	set desc = "Spend some of your nanites to activate a protocol in your bot."
	nano_point_cost = 1

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to activate a mode in your bot.")
			Stand.hearing_flag |= FOOD_MODE
			verbs -= /obj/item/organ/internal/nanogate/proc/food_mode
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

// Personnal powers
/obj/item/organ/internal/nanogate/proc/nanite_regen()
	set category = "Nanogate Powers"
	set name = "Nanite Regeneration (1)"
	set desc = "Spend some of your nanites to constantly repair your body."
	nano_point_cost = 1

	if(!owner.stats.getPerk(PERK_NANITE_REGEN)) // Do they already have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to repairing your body.")
			owner.stats.addPerk(PERK_NANITE_REGEN)
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_regen
	else
		to_chat(owner, "Assigning more nanites to repairing your body wouldn't give you a boost in regeneration rate.")

// Personnal Augment Powers.
/obj/item/organ/internal/nanogate/proc/nanite_muscle()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Muscle (1)"
	set desc = "Spend some of your nanites to create nanites muscle to allow you to walk faster."
	nano_point_cost = 2 // Install two augments on both legs

	if(!owner.stats.getPerk(PERK_NANITE_REGEN)) // Do they already have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to repairing your body.")
			owner.stats.addPerk(PERK_NANITE_REGEN)
			verbs -= /obj/item/organ/internal/nanogate/proc/nanite_regen
	else
		to_chat(owner, "Assigning more nanites to repairing your body wouldn't give you a boost in regeneration rate.")

/obj/item/organ/internal/nanogate/proc/nanite_armor()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Armor (1)"
	set desc = "Spend some of your nanites to create nanite armor to protect your body."
	nano_point_cost = 4 // Cover the entire body in armor

	if(pay_power_cost(nano_point_cost))
		to_chat(owner, "You permanently assign some of your nanites to protecting your body.")
		var/obj/item/organ_module/armor/nanite/Aug = new(src, owner) // The type of augment to install
		for(var/body_part in Aug.allowed_organs) // Install the augment everywhere it can.
			var/obj/item/organ/external/limb = owner.get_organ(body_part)
			if(limb)
				Aug = new(src, owner)
				Aug.install(owner.organs_by_name[limb])
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_armor
	else
		to_chat(owner, "There is no more space for more armor.")

/obj/item/organ/internal/nanogate/proc/nanite_blade()
	set category = "Nanogate Powers"
	set name = "Nanite Augment - Blade (2)"
	set desc = "Spend some of your nanites to create nanites blades to harm your foes."
	nano_point_cost = 2 // Create two blades.

	if(pay_power_cost(nano_point_cost))
		to_chat(owner, "You permanently assign some of your nanites to create blades.")
		var/obj/item/organ_module/active/simple/nanite/Aug = new(src, owner) // The type of augment to install
		for(var/body_part in Aug.allowed_organs) // Install the augment everywhere it can.
			var/obj/item/organ/external/limb = owner.get_organ(body_part)
			if(limb)
				Aug = new(src, owner)
				Aug.install(owner.organs_by_name[limb])
		verbs -= /obj/item/organ/internal/nanogate/proc/nanite_blade
	else
		to_chat(owner, "There is no more space for more armor.")
