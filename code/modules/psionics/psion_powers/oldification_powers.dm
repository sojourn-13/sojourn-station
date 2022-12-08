
//Psionic powers that intract with the oldification system

/obj/item/organ/internal/psionic_tumor/proc/rust()
	set category = "Psionic powers"
	set name = "Rust (1)"
	set desc = "Expend a single psi point to wither an object, making it rust away and weaken."
	psi_point_cost = 1

	if(pay_power_cost(psi_point_cost))
		if(owner.get_active_hand())
			var/obj/A = owner.get_active_hand()
			A.make_old()
		else
			to_chat(owner, "You must hold an item in your active hand to wither it.")

/obj/item/organ/internal/psionic_tumor/proc/decay()
	set category = "Psionic powers"
	set name = "Decay (2)"
	set desc = "Expend two psi points to wither and rust every object a person you are grabbing is holding or wearing, rendering each object worse and weaker."
	psi_point_cost = 2

	if(get_grabbed_mob(owner))
		if(pay_power_cost(psi_point_cost))
			var/mob/living/L
			L = get_grabbed_mob(owner)
			if(istype(L, /mob/living/carbon/human))
				var/mob/living/carbon/human/H = L

				if(H.psi_blocking >= 10)
					owner.stun_effect_act(0, H.psi_blocking * 5, BP_HEAD)
					owner.weakened = H.psi_blocking
					usr.show_message(SPAN_DANGER("Your head pulsates with pain as your mind bashes against an unbreakable barrier!"))
					return

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
