
//Powers that give armor, cloathing or other such ablities

/mob/living/carbon/human/proc/psionic_armor()
	set category = "Psionic powers.Armor"
	set name = "Psionic Armor (4)"
	set desc = "Spend four psi points to don a set of armor from somewhere that does not exist. Anything taken off disappears and whatever clothing you are wearing when this power is used is destroyed."
	var/psi_point_cost = 4
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
		user.visible_message(
			SPAN_DANGER("[src]'s flesh and clothing contort and shimmer, reforming into flowing, black and bronze robes!"),
			SPAN_DANGER("Your flesh and clothing meld painfully, shimmering out of this reality as they are replaced with a set of armored robes!")
			)
		user.replace_in_slot(new /obj/item/clothing/shoes/occultgreaves, slot_shoes, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/suit/space/occultist, slot_wear_suit, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/gloves/occultgloves, slot_gloves, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/head/helmet/space/occulthood, slot_head, skip_covering_check = TRUE)

/mob/living/carbon/human/proc/Hpsi_armor()
	set category = "Psionic powers.Armor"
	set name = "Durable Shell (8)"
	set desc = "Spend eight psi points to don a set of very strong armor, using your mind and the environment as the materials. Each piece of armor replaces the clothes you are already wearing, and provides additional strength to your body, in exchange for your psionic abilities."
	var/psi_point_cost = 8
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)
	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/effects/phasein.ogg'), 50, 1, -3)
		user.visible_message(
			SPAN_DANGER("[src]'s Flesh and clothing merge together, tiny crumbs, small objects, streams of thoughts and ideas are pulled together to them, forming on their body a solid armor woven from matter itself, held together by only one will of the psion!"),
			SPAN_DANGER("Your flesh and clothes, the surrounding space and the thoughts of others are put together, forming a massive obsidian armor on your body!")
			)
		user.replace_in_slot(new /obj/item/clothing/shoes/occultHgreaves, slot_shoes, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/gloves/occultHgloves, slot_gloves, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/suit/space/occulHtist, slot_wear_suit, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/head/helmet/space/occultHhood, slot_head, skip_covering_check = TRUE)

/mob/living/carbon/human/proc/Light_psi_armor()
	set category = "Psionic powers.Armor"
	set name = "Void Robe (6)"
	set desc = "Spend six psi points to don an ultra-light protective cloak, spurring the wearer to new adventures in the kingdom of the king of dreams! Each part of the kit enhances the psion's thinking abilities and accelerates his step."
	var/psi_point_cost = 6
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)
	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/hallucinations/i_see_you2.ogg','sound/effects/phasein.ogg'), 50, 1, 1, -3)
		user.visible_message(
			SPAN_DANGER("[src]'s Flesh and clothing merge together, tiny crumbs, small objects, streams of thoughts and ideas are pulled together to them, forming on their body a solid armor woven from matter itself, held together by only one will of the psion!"),
			SPAN_DANGER("Your flesh and clothes, the surrounding space and the thoughts of others are put together, forming a massive obsidian armor on your body!")
			)
		user.replace_in_slot(new /obj/item/clothing/shoes/occultLgreaves, slot_shoes, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/gloves/occultLgloves, slot_gloves, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/suit/space/occulLtist, slot_wear_suit, skip_covering_check = TRUE)
		user.replace_in_slot(new /obj/item/clothing/head/helmet/space/occultLhood, slot_head, skip_covering_check = TRUE)


/mob/living/carbon/human/psionic_tumor/proc/psion_gas_mask()
	set category = "Psionic powers.Armor"
	set name = "Psionic Mask (1)"
	set desc = "Spend one psi points to don a mask that on removal will heal your mind and enhance your skills when waring."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)
	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		playsound(usr.loc, pick('sound/mecha/lowpower.ogg','sound/effects/magic/Blind.ogg','sound/hallucinations/i_see_you2.ogg','sound/effects/phasein.ogg'), 50, 1, 1, -3)
		user.visible_message(
			SPAN_DANGER("[src]'s breaths become shallow for a second..."),
			SPAN_DANGER("A mask forms around your mouth, clamping on the sides")
			)
		var/psionic_mask = pick(typesof(/obj/item/clothing/mask/deepmaints_buff))
		if(psionic_mask)
			user.replace_in_slot(new psionic_mask, slot_wear_mask, skip_covering_check = TRUE)

