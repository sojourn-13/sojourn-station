// The powers here are centered around creating a Nanobot and upgrading it.
/*
List of powers in this page :
- Create Nanobot : Self-explanatory, this allow the user to create & name a nanobot. It is underwhelming at first, but keep in mind it is meant to be upgraded.
- Upgrade Damage : Upgrade the nanobot's lower & upper damage by whatever the 'damage_boost' var is set to (currently 20).
- Upgrade Health : Upgrade the nanobot's both max health and currently health by the 'health_boost' var (200). Doesn't actually heal the bot as any damage it got will still stay. It is just so that upgrading the health doesn't reduce the bot to 50% HP.
- Upgrade Armor : Upgrade the nanobot's armor up to a specified value, unlike the two other upgrade armor, it doesn't add to its initial value, but replace it.
- Enable Self-Repair : This make the nanobot constantly heal itself, with the rate of healing determined by the 'repair_rate' variable (5).
- Enable Radio Mode : Allow the nanobot to recognize the 'Toggle Radio' voice command, which enable or disable the broadcasting of a built-in radio.
- Enable Autodoc Mode : Allow the nanobot to recognize the 'Toggle Autodoc' voice command, which basically turn it into a medibot.
- Enable Food Mode : Opifex-Only, this one allow the nanobot to spawn rations toxic to non-opifex.
- Remote Control : Allow the user to transfer his mind into his nanobot at will. If the nanobot die while being controlled, the user get shunted back and get some brain damage.
*/

// Create the nanobot everything else on this page is centered around.
/obj/item/organ/internal/nanogate/proc/create_nanobot()
	set category = "Nanogate Powers"
	set name = "Create Nanobot (2)"
	set desc = "Spend some of your nanites to create a loyal robot you have an extensive amount of control over."
	nano_point_cost = 2

	if(!Stand) // Do they already have the bot?
		var/bot_name = input(owner, "Choose your nanobot's name : ", "Nanobot Name", "Nanobot") as text
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to form a nanobot.")
			Stand = new /mob/living/carbon/superior_animal/nanobot(owner.loc)
			Stand.name = bot_name
			Stand.creator += owner
			Stand.friends += owner
			Stand.icon_state = input(owner, "Choose your nanobot's model : ", "Nanobot Model") in list("nanobot", "wide", "squats", "heavy", "blitz")
			Stand.icon_living = Stand.icon_state
			Stand.icon_dead = "[Stand.icon_state]_dead"
			verbs -= /obj/item/organ/internal/nanogate/proc/create_nanobot
	else
		to_chat(owner, "Your nanogate is already as its limit controlling one Nanobot. Making more would end badly.")

// Boost the nanobot's damage
/obj/item/organ/internal/nanogate/proc/stand_damage()
	set category = "Nanogate Powers"
	set name = "Upgrade Nanobot - Damage (1)"
	set desc = "Spend some of your nanites to upgrade your nanobot with greater offensive power."
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
	set desc = "Spend some of your nanites to upgrade your nanobot to endure far more punishment."
	nano_point_cost = 1
	var/health_boost = 150 // How much bonus health does the nanobot get?

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
	set desc = "Spend some of your nanites to upgrade your nanobots armor to better reduce and mitigate incoming damage."
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
	set desc = "Spend some of your nanites to upgrade your nanobot to enable self repair diagnostics."
	nano_point_cost = 1
	var/repair_rate = 5 // How fast does the nanobot repair itself?

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to diagnose and repair any damage your nanobot takes.")
			Stand.repair_rate += repair_rate
			verbs -= /obj/item/organ/internal/nanogate/proc/stand_repair
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

// Powers that activate various modes for the bot.
/obj/item/organ/internal/nanogate/proc/autodoc_mode()
	set category = "Nanogate Powers"
	set name = "Activate Nanobot Protocol - Medibot (4)"
	set desc = "Spend some of your nanites to activate a medical protocol in your nanobot."
	nano_point_cost = 4

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to have your nanobot act as a medibot.")
			Stand.ai_flag |= AUTODOC_MODE
			verbs -= /obj/item/organ/internal/nanogate/proc/autodoc_mode
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

/obj/item/organ/internal/nanogate/proc/radio_mode()
	set category = "Nanogate Powers"
	set name = "Activate Nanobot Protocol - Radio (1)"
	set desc = "Spend some of your nanites to activate a protocol in your bot."
	nano_point_cost = 1

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to shape into a ham radio for communication.")
			Stand.ai_flag |= RADIO_MODE
			verbs -= /obj/item/organ/internal/nanogate/proc/radio_mode
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

/obj/item/organ/internal/nanogate/proc/console_mode()
	set category = "Nanogate Powers"
	set name = "Activate Nanobot Protocol - Console (1)"
	set desc = "Spend some of your nanites to activate convert your nanobots into a modular console capable of functioning as a portable computer."
	nano_point_cost = 1

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites function as a modular console.")
			Stand.ai_flag |= CONSOLE_MODE
			verbs -= /obj/item/organ/internal/nanogate/proc/console_mode
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

/obj/item/organ/internal/nanogate/proc/food_mode()
	set category = "Nanogate Powers"
	set name = "Activate Nanobot Protocol - Food (1)"
	set desc = "Spend some of your nanites to activate a protocol in your bot, allowing you to generate safe and stimulant laced food."
	nano_point_cost = 1

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to activate the food dispencer system in your nanobot.")
			Stand.ai_flag |= FOOD_MODE
			verbs -= /obj/item/organ/internal/nanogate/proc/food_mode
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

/obj/item/organ/internal/nanogate/proc/control_bot()
	set category = "Nanogate Powers"
	set name = "Activate Nanobot Remote Control (1)"
	set desc = "Spend some of your nanites to remotely control your nanobot at will."
	nano_point_cost = 1

	if(Stand) // Do they have the bot?
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You permanently assign some of your nanites to create a remote control setup in your bot.")
			verbs -= /obj/item/organ/internal/nanogate/proc/control_bot
			verbs += /obj/item/organ/internal/nanogate/proc/control
	else
		to_chat(owner, "You do not have a nanobot to upgrade!")

/obj/item/organ/internal/nanogate/proc/control()
	set category = "Nanogate Powers"
	set name = "Remote Control"
	set desc = "Remotely control your nanobot. Don't die while controlling it though!"
	nano_point_cost = 0

	if(Stand) // Do they have the bot?
		if(Stand.stat == DEAD)
			to_chat(owner, SPAN_WARNING("Your nanobot is destroyed and unable to be controlled!"))
			return
		if(pay_power_cost(nano_point_cost))
			to_chat(owner, "You remotely control your bot.")
			Stand.controller = owner
			owner.mind.transfer_to(Stand)
	else
		to_chat(owner, "You do not have a nanobot to control!")
