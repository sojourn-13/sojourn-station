
//Psionic powers that intract with the oldification system

/mob/living/carbon/human/proc/rust()
	set category = "Psionic powers"
	set name = "Rust (1)"
	set desc = "Expend a single psi point to wither an object, making it rust away and weaken."
	var/psi_point_cost = 1
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(PT && PT.pay_power_cost(psi_point_cost) && PT.check_possibility())
		if(user.get_active_hand())
			var/obj/A = user.get_active_hand()
			A.make_old()
		else
			to_chat(user, "You must hold an item in your active hand to wither it.")

/mob/living/carbon/human/proc/decay()
	set category = "Psionic powers"
	set name = "Decay (2)"
	set desc = "Expend two psi points to wither and rust every object a person you are grabbing is holding or wearing, rendering each object worse and weaker."
	var/psi_point_cost = 2
	var/mob/living/carbon/human/user = src
	var/obj/item/organ/internal/psionic_tumor/PT = user.first_organ_by_process(BP_PSION)

	if(get_grabbed_mob(user))
		if(PT && PT.pay_power_cost(psi_point_cost))
			var/mob/living/L
			L = get_grabbed_mob(user)
			if(istype(L, /mob/living/carbon/human))
				var/mob/living/carbon/human/H = L
				if(PT.check_possibility(TRUE, L))
					for(var/obj/objects in H.contents)
						if(istype(objects, /obj/item/organ))
							continue
						if(istype(objects, /obj/parallax))
							continue
						if(istype(objects, /obj/item/grab))
							continue
						else
							objects.make_old()
							visible_message(
							SPAN_DANGER("[objects] rusts and decays!"),
							)
	else
		to_chat(src, "You must grab your target!")
