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
/mob/living/carbon/human/proc/create_nanobot()
	set category = "Nanogate Powers"
	set name = "Create Nanobot (2)"
	set desc = "Spend some of your nanites to create a loyal robot you have an extensive amount of control over."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(!organ.Stand) // Do they already have the bot?
		var/bot_name = input(src, "Choose your nanobot's name : ", "Nanobot Name", "Nanobot") as text
		if(organ.pay_power_cost(2))
			to_chat(src, "You permanently assign some of your nanites to form a nanobot.")
			organ.Stand = new /mob/living/carbon/superior_animal/nanobot(loc)
			organ.Stand.name = bot_name
			organ.Stand.creator += src
			organ.Stand.friends += src
			organ.Stand.icon_state = input(src, "Choose your nanobot's model : ", "Nanobot Model") in list("nanobot", "wide", "squats", "heavy", "blitz")
			organ.Stand.icon_living = organ.Stand.icon_state
			organ.Stand.icon_dead = "[organ.Stand.icon_state]_dead"

			//Add Nanobot verbs here, at activation
			organ.organ_add_verb(/mob/living/carbon/human/proc/stand_damage)
			organ.organ_add_verb(/mob/living/carbon/human/proc/stand_health)
			organ.organ_add_verb(/mob/living/carbon/human/proc/stand_armor)
			organ.organ_add_verb(/mob/living/carbon/human/proc/stand_repair)
			organ.organ_add_verb(/mob/living/carbon/human/proc/autodoc_mode)
			organ.organ_add_verb(/mob/living/carbon/human/proc/radio_mode)
			organ.organ_add_verb(/mob/living/carbon/human/proc/console_mode)
			organ.organ_add_verb(/mob/living/carbon/human/proc/control_bot)

			//Add in the Opifex specific procs
			if(istype(organ, /obj/item/organ/internal/nanogate/opifex))
				organ.organ_add_verb(/mob/living/carbon/human/proc/food_mode)

			organ.organ_remove_verb(/mob/living/carbon/human/proc/create_nanobot)
	else
		to_chat(src, "Your nanogate is already as its limit controlling one Nanobot. Making more would end badly.")

// Boost the nanobot's damage
/mob/living/carbon/human/proc/stand_damage()
	set category = "Nanogate Powers.Robot"
	set name = "Upgrade Nanobot - Damage (1)"
	set desc = "Spend some of your nanites to upgrade your nanobot with greater offensive power."
	var/damage_boost = 20 // How much bonus damage does the nanobot get?

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(organ.Stand) // Do they have the bot?
		if(organ.pay_power_cost(1))
			to_chat(src, "You permanently assign some of your nanites to boost your nanobot's damage output.")
			organ.Stand.melee_damage_lower += damage_boost
			organ.Stand.melee_damage_upper += damage_boost
			organ.organ_remove_verb(/mob/living/carbon/human/proc/stand_damage)
	else
		to_chat(src, "You do not have a nanobot to upgrade!")

// Boost the nanobot's health
/mob/living/carbon/human/proc/stand_health()
	set category = "Nanogate Powers.Robot"
	set name = "Upgrade Nanobot - Health (1)"
	set desc = "Spend some of your nanites to upgrade your nanobot to endure far more punishment."
	var/health_boost = 150 // How much bonus health does the nanobot get?

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(organ.Stand) // Do they have the bot?
		if(organ.pay_power_cost(1))
			to_chat(src, "You permanently assign some of your nanites to reinforce your nanobot's durability.")
			organ.Stand.health += health_boost
			organ.Stand.maxHealth += health_boost
			organ.organ_remove_verb(/mob/living/carbon/human/proc/stand_health)
	else
		to_chat(src, "You do not have a nanobot to upgrade!")

// Boost the nanobot's armor
/mob/living/carbon/human/proc/stand_armor()
	set category = "Nanogate Powers.Robot"
	set name = "Upgrade Nanobot - Armor (1)"
	set desc = "Spend some of your nanites to upgrade your nanobots armor to better reduce and mitigate incoming damage."
	var/armor_boost = list(melee = 15, bullet = 15, energy = 3, bomb = 75, bio = 100, rad = 100) // How much armor does the nanobot get?

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(organ.Stand) // Do they have the bot?
		if(organ.pay_power_cost(1))
			to_chat(src, "You permanently assign some of your nanites to reinforce your nanobot's armor.")
			organ.Stand.armor = armor_boost
			organ.organ_remove_verb(/mob/living/carbon/human/proc/stand_armor)
	else
		to_chat(src, "You do not have a nanobot to upgrade!")

// Boost the nanobot's armor
/mob/living/carbon/human/proc/stand_repair()
	set category = "Nanogate Powers.Robot"
	set name = "Upgrade Nanobot - Self-Repair (1)"
	set desc = "Spend some of your nanites to upgrade your nanobot to enable self repair diagnostics."
	var/repair_rate = 5 // How fast does the nanobot repair itself?

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(organ.Stand) // Do they have the bot?
		if(organ.pay_power_cost(1))
			to_chat(src, "You permanently assign some of your nanites to diagnose and repair any damage your nanobot takes.")
			organ.Stand.repair_rate += repair_rate
			organ.organ_remove_verb(/mob/living/carbon/human/proc/stand_repair)
	else
		to_chat(src, "You do not have a nanobot to upgrade!")

// Powers that activate various modes for the bot.
/mob/living/carbon/human/proc/autodoc_mode()
	set category = "Nanogate Powers.Robot"
	set name = "Activate Nanobot Protocol - Medibot (4)"
	set desc = "Spend some of your nanites to activate a medical protocol in your nanobot."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(organ.Stand) // Do they have the bot?
		if(organ.pay_power_cost(4))
			to_chat(src, "You permanently assign some of your nanites to have your nanobot act as a medibot.")
			organ.Stand.ai_flag |= AUTODOC_MODE
			organ.organ_remove_verb(/mob/living/carbon/human/proc/autodoc_mode)
			organ.Stand.updateDialog()
	else
		to_chat(src, "You do not have a nanobot to upgrade!")

/mob/living/carbon/human/proc/radio_mode()
	set category = "Nanogate Powers.Robot"
	set name = "Activate Nanobot Protocol - Radio (1)"
	set desc = "Spend some of your nanites to activate a protocol in your bot."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(organ.Stand) // Do they have the bot?
		if(organ.pay_power_cost(1))
			to_chat(src, "You permanently assign some of your nanites to shape into a ham radio for communication.")
			organ.Stand.ai_flag |= RADIO_MODE
			organ.organ_remove_verb(/mob/living/carbon/human/proc/radio_mode)
			organ.Stand.updateDialog()
	else
		to_chat(src, "You do not have a nanobot to upgrade!")

/mob/living/carbon/human/proc/console_mode()
	set category = "Nanogate Powers.Robot"
	set name = "Activate Nanobot Protocol - Console (1)"
	set desc = "Spend some of your nanites to activate convert your nanobots into a modular console capable of functioning as a portable computer."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(organ.Stand) // Do they have the bot?
		if(organ.pay_power_cost(1))
			to_chat(src, "You permanently assign some of your nanites function as a modular console.")
			organ.Stand.ai_flag |= CONSOLE_MODE
			organ.organ_remove_verb(/mob/living/carbon/human/proc/console_mode)
			organ.Stand.updateDialog()
	else
		to_chat(src, "You do not have a nanobot to upgrade!")

/mob/living/carbon/human/proc/food_mode()
	set category = "Nanogate Powers.Robot"
	set name = "Activate Nanobot Protocol - Food (1)"
	set desc = "Spend some of your nanites to activate a protocol in your bot, allowing you to generate safe and stimulant laced food."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(organ.Stand) // Do they have the bot?
		if(organ.pay_power_cost(1))
			to_chat(src, "You permanently assign some of your nanites to activate the food dispencer system in your nanobot.")
			organ.Stand.ai_flag |= FOOD_MODE
			organ.organ_remove_verb(/mob/living/carbon/human/proc/food_mode)
			organ.Stand.updateDialog()
	else
		to_chat(src, "You do not have a nanobot to upgrade!")

/mob/living/carbon/human/proc/control_bot()
	set category = "Nanogate Powers.Robot"
	set name = "Activate Nanobot Remote Control (1)"
	set desc = "Spend some of your nanites to remotely control your nanobot at will."

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(organ.Stand) // Do they have the bot?
		if(organ.pay_power_cost(1))
			to_chat(src, "You permanently assign some of your nanites to create a remote control setup in your bot.")
			organ.organ_remove_verb(/mob/living/carbon/human/proc/control_bot)
			organ.organ_add_verb(/mob/living/carbon/human/proc/control)
	else
		to_chat(src, "You do not have a nanobot to upgrade!")

/mob/living/carbon/human/proc/control()
	set category = "Nanogate Powers.Robot"
	set name = "Remote Control"
	set desc = "Remotely control your nanobot. Don't die while controlling it though!"

	var/obj/item/organ/internal/nanogate/organ = first_organ_by_type(/obj/item/organ/internal/nanogate)
	if(!organ)
		return

	if(organ.Stand) // Do they have the bot?
		if(organ.Stand.stat == DEAD)
			to_chat(src, SPAN_WARNING("Your nanobot is destroyed and unable to be controlled!"))
			return
		if(organ.pay_power_cost(0))
			to_chat(src, "You remotely control your bot.")
			organ.Stand.controller = src
			mind.transfer_to(organ.Stand)
	else
		to_chat(src, "You do not have a nanobot to control!")
