
//Powers that give armor, cloathing or other such ablities

/mob/living/carbon/human/proc/psionic_armor()
	set category = "Psionic powers"
	set name = "Psionic armor (4)"
	set desc = "Creates a set of armor from somewhere that does not exist. Any part disappears once removed from your body. Your current suit, headgear, gloves, and shoes will be discarded on the floor."
	var/psi_point_cost = 4
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/list/affected_slots = list(slot_shoes, slot_wear_suit, slot_gloves, slot_head)	//This code lists slots for equipping armor, so we can drop their clothing.
		playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
		user.visible_message(
			SPAN_DANGER("[src]'s clothes fall away as their flesh contorts and shimmers, reforming into flowing, black and bronze robes!"),
			SPAN_DANGER("Your clothing falls away as your flesh shimmers painfully, easing as it is replaced by a set of armored robes!")
			)
		var/obj/item/suitequipment = get_equipped_item(slot_s_store)	//If they hav esomething in the suit storage slot we want to reequip it afterwards.
		for(var/location in affected_slots)								//Loading the clothing that they're wearing so we can drop it.
			var/I = get_equipped_item(location)
			unEquip(I)													//Drop the equipment.
		user.replace_in_slot(new /obj/item/clothing/shoes/occultgreaves, slot_shoes, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/suit/space/occultist, slot_wear_suit, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/gloves/occultgloves, slot_gloves, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/head/helmet/space/occulthood, slot_head, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		if(suitequipment)												//If they had something on their back previously, this will be true. Otherwise, nope.
			user.equip_to_slot_if_possible(suitequipment, slot_s_store)

/mob/living/carbon/human/proc/Hpsi_armor()
	set category = "Psionic powers"
	set name = "Durable shell (8)"
	set desc = "Creates a set of very strong armor, using your mind and the environment as the material. your clothes wil be discarded on the floor. Each piece of armor provides additional strength to your body, in exchange for your psionic abilities."
	var/psi_point_cost = 8
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)
	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/list/affected_slots = list(slot_shoes, slot_wear_suit, slot_gloves, slot_head)
		playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
		user.visible_message(
			SPAN_DANGER("[src]'s clothes fall away as a shimmering aura surrounds them for a moment, fading to reveal a shiny, black suit of solid obsidian armor!"),
			SPAN_DANGER("Your clothing falls away as a shimmering aura surrounds your body, solidifying into a slick, black suit of obsidian armor!")
			)
		var/obj/item/suitequipment = get_equipped_item(slot_s_store)
		for(var/location in affected_slots)
			var/I = get_equipped_item(location)
			unEquip(I)
		user.replace_in_slot(new /obj/item/clothing/shoes/occultHgreaves, slot_shoes, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/gloves/occultHgloves, slot_gloves, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/suit/space/occulHtist, slot_wear_suit, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/head/helmet/space/occultHhood, slot_head, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		if(suitequipment)
			user.equip_to_slot_if_possible(suitequipment, slot_s_store)

/mob/living/carbon/human/proc/Light_psi_armor()
	set category = "Psionic powers"
	set name = "Void robe (6)"
	set desc = "When applied, it creates an ultra-light protected cloak, spurring the wearer to new adventures in the kingdom of the king of dreams! Each part of the kit enhances the psion's thinking abilities and accelerates his step. your current clothing will be discarded on the floor."
	var/psi_point_cost = 6
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)
	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		var/list/affected_slots = list(slot_shoes, slot_wear_suit, slot_gloves, slot_head)
		playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/hallucinations/i_see_you2.ogg','sound/effects/phasein.ogg'), 50, 1, 1, -3)
		user.visible_message(
			SPAN_DANGER("[src]'s clothes fall away as a shimmering aura surrounds them for a moment, fading to reveal a shimmering cloak of psionic metamaterial!"),
			SPAN_DANGER("Your clothing falls away as a shimmering aura surrounds your body, solidifying into a shimmering cloak of psionic metamaterial!")
			)
		var/obj/item/suitequipment = get_equipped_item(slot_s_store)
		for(var/location in affected_slots)
			var/I = get_equipped_item(location)
			unEquip(I)
		user.replace_in_slot(new /obj/item/clothing/shoes/occultLgreaves, slot_shoes, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/gloves/occultLgloves, slot_gloves, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/suit/space/occulLtist, slot_wear_suit, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/head/helmet/space/occultLhood, slot_head, drop_if_unable_to_store = TRUE, skip_covering_check = TRUE)
		if(suitequipment)
			user.equip_to_slot_if_possible(suitequipment, slot_s_store)
