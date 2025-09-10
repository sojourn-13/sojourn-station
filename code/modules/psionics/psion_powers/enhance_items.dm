/mob/living/carbon/human/psionic_tumor/proc/candle_enhancer()
	set category = "Psionic powers.Transform"
	set name = "Forever Candle (1)"
	set desc = "Spend a single psi point make a candle burn brighter and forever."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if(user.get_active_hand())
			var/obj/A = user.get_active_hand()
			if(istype(A, /obj/item/flame/candle))
				var/obj/item/flame/candle/C = A
				if(!C.endless_burn)
					C.attack_self(user)
					C.endless_burn = TRUE
					// Increase candle light by calling set_light with additional range and color
					C.lit_sanity_damage += 0.5
					C.light_color = COLOR_LIGHTING_PURPLE_BRIGHT
					C.set_light(CANDLE_LUM + 5, 1, C.light_color)
					C.light(flavor_text = SPAN_NOTICE("\The [user] lights up the candle without a flame."))
				else
					user.show_message(SPAN_DANGER("This candle is already touched by a power greater then itself."))
			else
				user.show_message(SPAN_DANGER("You have to hold a candle to enhance it."))
		else
			user.show_message(SPAN_DANGER("You have to hold a candle to enhance it."))

/mob/living/carbon/human/psionic_tumor/proc/psi_injector_enhancer()
	set category = "Psionic powers.Transform"
	set name = "Psionic Breath (1)"
	set desc = "Spend a single psi point make a psionic inhaler be able to bypass masks, as well as increases its affectiveness."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if(user.get_active_hand())
			var/obj/A = user.get_active_hand()
			if(istype(A, /obj/item/psi_injector))
				var/obj/item/psi_injector/pi = A
				if(!pi.bypass_block)
					pi.bypass_block = TRUE
					pi.point_per_use += 1
				else
					user.show_message(SPAN_DANGER("This [pi] has already been enhanced."))
			else
				user.show_message(SPAN_DANGER("You have to hold an inhaler to enhance it."))
		else
			user.show_message(SPAN_DANGER("You have to hold an inhaler to enhance it."))

