/mob/living/carbon/human/proc/get_unarmed_attack(var/mob/living/carbon/human/target, var/hit_zone)
	if(src.default_attack && src.default_attack.is_usable(src, target, hit_zone))
		if(holding_back)
			var/datum/unarmed_attack/soft_type = src.default_attack.get_sparring_variant()
			if(soft_type)
				return soft_type
		return src.default_attack
	for(var/datum/unarmed_attack/u_attack in species.unarmed_attacks)
		if(u_attack.is_usable(src, target, hit_zone))
			if(holding_back)
				var/datum/unarmed_attack/soft_variant = u_attack.get_sparring_variant()
				if(soft_variant)
					return soft_variant
			return u_attack
	return null

/mob/living/carbon/human/attack_hand(mob/living/carbon/M as mob)

	var/mob/living/carbon/human/H = M
	if(istype(H))
		var/obj/item/organ/external/temp = H.organs_by_name[BP_R_ARM]
		if(H.hand)
			temp = H.organs_by_name[BP_L_ARM]
		if(!temp || !temp.is_usable())
			to_chat(H, "\red You can't use your hand.")
			return
		H.stop_blocking()

	..()

	// Should this all be in Touch()?
	if(istype(H))
		if(H != src && check_shields(0, null, H, H.targeted_organ, H.name))
			H.do_attack_animation(src)
			return 0

		if(istype(H.gloves, /obj/item/clothing/gloves/boxing/hologlove))
			H.do_attack_animation(src)
			var/damage = rand(0, 9)
			if(!damage)
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
				visible_message("\red <B>[H] has attempted to punch [src]!</B>")
				return 0
			var/obj/item/organ/external/affecting = get_organ(ran_zone(H.targeted_organ))

			if(HULK in H.mutations)
				damage += 5

			playsound(loc, "punch", 25, 1, -1)

			visible_message("\red <B>[H] has punched [src]!</B>")

			damage_through_armor(damage, HALLOSS, affecting, ARMOR_MELEE)
			if(damage >= 9)
				visible_message("\red <B>[H] has weakened [src]!</B>")
				apply_effect(4, WEAKEN, getarmor(affecting, ARMOR_MELEE))

			return

	switch(M.a_intent)
		if(I_HELP)
			if(can_operate(src, M) && do_surgery(src, M, null))
				return 1
			if(istype(H) && health < HEALTH_THRESHOLD_CRIT && health > HEALTH_THRESHOLD_DEAD)
				if(!H.check_has_mouth())
					to_chat(H, SPAN_DANGER("You don't have a mouth, you cannot perform CPR!"))
					return
				if(!check_has_mouth())
					to_chat(H, SPAN_DANGER("They don't have a mouth, you cannot perform CPR!"))
					return
				if((H.head && (H.head.body_parts_covered & FACE)) || (H.wear_mask && (H.wear_mask.body_parts_covered & FACE)))
					to_chat(H, SPAN_NOTICE("Remove your mask!"))
					return 0
				if((head && (head.body_parts_covered & FACE)) || (wear_mask && (wear_mask.body_parts_covered & FACE)))
					to_chat(H, SPAN_NOTICE("Remove [src]'s mask!"))
					return 0

				if (!cpr_time)
					return 0

				cpr_time = 0
				spawn(30)
					cpr_time = 1

				H.visible_message(SPAN_DANGER("\The [H] is trying perform CPR on \the [src]!"))

				if(!do_after(H, 30, src))
					return

				var/cpr_efficiency = 3 + max(0, 2 * (H.stats.getStat(STAT_BIO) / 10))
				adjustOxyLoss(-(min(getOxyLoss(), cpr_efficiency)))
				updatehealth()
				H.visible_message(SPAN_DANGER("\The [H] performs CPR on \the [src]!"))
				to_chat(src, SPAN_NOTICE("You feel a breath of fresh air enter your lungs. It feels good."))
				to_chat(H, SPAN_WARNING("Repeat at least every 7 seconds."))

			else
				help_shake_act(M)
			return 1

		if(I_GRAB)
			if(M == src || anchored)
				return 0
			for(var/obj/item/grab/G in src.grabbed_by)
				if(G.assailant == M)
					to_chat(M, SPAN_NOTICE("You already grabbed [src]."))
					return
			if(w_uniform)
				w_uniform.add_fingerprint(M)


			for(var/obj/item/grab/g in get_both_hands(src)) //countering a grab

				if(g.counter_timer>0 && g.affecting == M) //were we grabbed by src in a span of 3 seconds?
					if(prob(max(30 + H.stats.getStat(STAT_ROB) - stats.getStat(STAT_ROB) ** 0.7, 1))) // Harder between low rob, easier between high rob wrestlers
						var/obj/item/grab/G = new /obj/item/grab(M, src)
						if(!G)	//the grab will delete itself in New if affecting is anchored
							return
						G.state = GRAB_AGGRESSIVE
						G.counter_timer = 0
						M.put_in_active_hand(G)
						G.synch()
						LAssailant_weakref = M
						//H.regen_slickness() //sick skills!

						break_all_grabs(H)

						H.do_attack_animation(src)
						playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
						visible_message(SPAN_DANGER("With a quick grapple, [M] reversed [src]'s grab!"))
						src.attack_log += "\[[time_stamp()]\] <font color='orange'>Counter-grabbed by [M.name] ([M.ckey])</font>"
						M.attack_log += "\[[time_stamp()]\] <font color='red'>Counter-grabbed [src.name] ([src.ckey])</font>"
						msg_admin_attack("[M] countered [src]'s grab.")
						return 1

					else //uh oh! our resist is now also on cooldown(we are dead)
						setClickCooldown(40)
						visible_message(SPAN_WARNING("[M] tried to counter [src]'s grab, but failed!"))

				return
			//usual grabs

			var/obj/item/grab/G = new /obj/item/grab(M, src)
			if(buckled)
				to_chat(M, SPAN_NOTICE("You cannot grab [src], \he is buckled in!"))
			if(!G)	//the grab will delete itself in New if affecting is anchored
				return
			M.put_in_active_hand(G)
			G.synch()
			LAssailant_weakref = WEAKREF(M)

			H.do_attack_animation(src)
			playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
			visible_message(SPAN_WARNING("[M] has grabbed [src] passively!"))
			//our blocking was compromised!
			if(blocking)
				visible_message(SPAN_WARNING("[src]'s guard has been broken!"), SPAN_DANGER("Your blocking stance has been pushed through!"))
				stop_blocking()
				setClickCooldown(2 SECONDS)
			src.attack_log += "\[[time_stamp()]\] <font color='orange'>Has been grabbed passively by [M.name] ([M.ckey])</font>"
			M.attack_log += "\[[time_stamp()]\] <font color='red'>Grabbed passively [src.name] ([src.ckey])</font>"
			msg_admin_attack("[M] grabbed passively a [src].")
			return 1

		if(I_HURT)
			if(M.targeted_organ == BP_MOUTH && wear_mask && istype(wear_mask, /obj/item/grenade))
				var/obj/item/grenade/G = wear_mask
				if(!G.active)
					visible_message(SPAN_DANGER("\The [M] pulls the pin from \the [src]'s [G.name]!"))
					G.activate(M)
					update_inv_wear_mask()
				else
					to_chat(M, SPAN_WARNING("\The [G] is already primed! Run!"))
				return

			if(!istype(H))
				attack_generic(H,rand(1,3),"punched")
				return

			//adds a soft cap of 80 robustness. Deminishing returns by taking robustness/10 + 72
			var/stat_damage = 3 // declared with a value of 3 before normal calculations for safty.
			if (H.stats.getStat(STAT_ROB) >= 80)
				var softcap = H.stats.getStat(STAT_ROB) / 10
				var newrob = (72 + softcap) / 10
				stat_damage = 3 + max(0, newrob)
			else
				stat_damage = 3 + max(0, (H.stats.getStat(STAT_ROB) / 10))
			var/limb_efficiency_multiplier = 1
			var/hit_zone = H.targeted_organ
			var/obj/item/organ/external/affecting = get_organ(hit_zone)
			var/obj/item/organ/external/current_hand = H.organs_by_name[H.hand ? BP_L_ARM : BP_R_ARM]

			if(current_hand)
				limb_efficiency_multiplier = 1 * (current_hand.limb_efficiency / 100)

			if(!affecting || affecting.is_stump())
				to_chat(M, SPAN_DANGER("They are missing that limb!"))
				return 1

			if (M.grabbed_by.len)
				// Someone got a good grip on them, they won't be able to do much damage
				stat_damage = max(1, stat_damage - 2)

			if(src.grabbed_by.len || src.buckled || !src.canmove || src==H)
				stat_damage = stat_damage + 2

			stat_damage *= limb_efficiency_multiplier
			// See what attack they use
			var/datum/unarmed_attack/attack = H.get_unarmed_attack(src, hit_zone)
			if(!attack)
				return 0

			H.do_attack_animation(src)
			attack.show_attack(H, src, hit_zone, stat_damage)

			//The stronger you are, the louder you strike!
			var/attack_volume = 25 + H.stats.getStat(STAT_ROB)
			playsound(loc, attack.attack_sound, attack_volume, 1, -1)
			H.attack_log += text("\[[time_stamp()]\] <font color='red'>[LAZYPICK(attack.attack_verb) || "attacked"] [src.name] ([src.ckey])</font>")
			src.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been [LAZYPICK(attack.attack_verb) || "attacked"] by [H.name] ([H.ckey])</font>")
			msg_admin_attack("[key_name(H)] has [LAZYPICK(attack.attack_verb) || "attacked"] [key_name(src)]")

			var/real_damage = stat_damage
			real_damage += attack.get_unarmed_damage(H)
			real_damage *= damage_multiplier
			real_damage += H.punch_damage_increase
			stat_damage *= damage_multiplier

			if(HULK in H.mutations)
				real_damage *= 2 // Hulks do twice the damage
				stat_damage *= 2
			real_damage = max(1, real_damage)

			//Try to reduce damage by blocking
			if(blocking)
				if(istype(get_active_hand(), /obj/item/grab))//we are blocking with a human shield! We redirect the attack. You know, because grab doesn't exist as an item.
					var/obj/item/grab/G = get_active_hand()
					grab_redirect_attack(M, G)
					return
				else
					stop_blocking()
					real_damage = handle_blocking(real_damage)
					//Tell everyone about blocking
					src.attack_log += text("\[[time_stamp()]\] <font color='orange'>Blocked attack of [H.name] ([H.ckey])</font>")
					H.attack_log += text("\[[time_stamp()]\] <font color='orange'>Attack has been blocked by [src.name] ([src.ckey])</font>")
					visible_message(SPAN_WARNING("[src] blocks the blow!"), SPAN_DANGER("You block the blow!"))
					//They farked up
					if(real_damage == 0)
						visible_message(SPAN_DANGER("The attack has been completely negated!"))
						return
			// Apply additional unarmed effects.
			attack.apply_effects(H, src, getarmor(affecting, ARMOR_MELEE), stat_damage, hit_zone)

			// Finally, apply damage to target
			damage_through_armor(real_damage, (attack.deal_halloss ? HALLOSS : BRUTE), affecting, ARMOR_MELEE, sharp = attack.sharp, edge = attack.edge)
			hit_impact(real_damage, get_step(H, src))

		if(I_DISARM)
			M.attack_log += text("\[[time_stamp()]\] <font color='red'>Disarmed [src.name] ([src.ckey])</font>")
			src.attack_log += text("\[[time_stamp()]\] <font color='orange'>Has been disarmed by [M.name] ([M.ckey])</font>")

			msg_admin_attack("[key_name(M)] disarmed [src.name] ([src.ckey])")
			M.do_attack_animation(src)

			if(w_uniform)
				w_uniform.add_fingerprint(M)

			var/list/holding = list(get_active_hand() = 40, get_inactive_hand = 20)

			//See if they have any guns that might go off
			for(var/obj/item/gun/W in holding)
				if(W && prob(holding[W]))
					var/list/turfs = list()
					for(var/turf/T in view())
						turfs += T
					if(turfs.len)
						var/turf/target = pick(turfs)
						visible_message(SPAN_DANGER("[src]'s [W] goes off during the struggle!"))
						W.afterattack(target,src)

			//Actually disarm them
			var/rob_attacker = (50 / (1 + 150 / max(1, H.stats.getStat(STAT_ROB))) + 40) //soft capped amount of recoil that attacker deals
			var/rob_target = max(0, min(400,stats.getStat(STAT_ROB))) //hard capped amount of recoil the target negates upon disarming
			var/recoil_damage = (rob_attacker * (1 - (rob_target / 400))) //recoil itself
			for(var/obj/item/I in holding)
				external_recoil(recoil_damage)
				if(recoil >= 60) //disarming
					if(istype(I, /obj/item/grab)) //did M grab someone?
						break_all_grabs(M) //See about breaking grips or pulls
						playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
						return
					if(I.wielded) //is the held item wielded?
						if(!recoil >= 80) //if yes, we need more recoil to disarm
							playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
							visible_message(SPAN_WARNING("[M] attempted to disarm [src]"))
							return
					if(istype(I, /obj/item/twohanded/offhand)) //did someone dare to switch to offhand to not get disarmed?
						unEquip(src.get_inactive_hand())
						visible_message(SPAN_DANGER("[M] has disarmed [src]!"))
						playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
						return
					else
						unEquip(I)

			playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
			visible_message(SPAN_WARNING("[M] attempted to disarm [src]"))
	return

/mob/living/carbon/human/proc/afterattack(atom/target as mob|obj|turf|area, mob/living/user as mob|obj, inrange, params)
	return

/mob/living/carbon/human/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)

	if(!damage || !istype(user))
		return

	var/penetration = 1
	if(istype(user, /mob/living))
		var/mob/living/L = user
		penetration = L.armor_divisor

	user.attack_log += text("\[[time_stamp()]\] <font color='red'>attacked [src.name] ([src.ckey])</font>")
	src.attack_log += text("\[[time_stamp()]\] <font color='orange'>was attacked by [user.name] ([user.ckey])</font>")
	src.visible_message(SPAN_DANGER("[user] has [attack_message] [src]!"))

	user.do_attack_animation(src)

	//reduced damage
	var/RD = unique_armor_check(null, user, damage)
	if(RD)
		damage = RD

	var/dam_zone = pick(organs_by_name)
	var/obj/item/organ/external/affecting = get_organ(ran_zone(dam_zone))
	var/dam = damage_through_armor(damage = damage, damagetype = damagetype, def_zone = affecting, attack_flag = ARMOR_MELEE, armor_divisor = penetration, sharp = sharp, edge = sharp)

	// ran_zone might pick a zone that we don't actually have an organ in
	if(dam > 0 && affecting)
		affecting.add_autopsy_data("[attack_message] by \a [user]", dam)
	updatehealth()
	hit_impact(damage, get_step(user, src))
	return TRUE

//Used to attack a joint's nerve through grabbing, 10 seconds of crippling(depression)
/mob/living/carbon/human/proc/grab_joint(mob/living/user, def_zone)
	var/has_grab = 0
	var/obj/item/grab/G
	for(G in list(user.l_hand, user.r_hand))//we do not check for grab level
		if(G.affecting == src)
			has_grab = TRUE
			break

	if(!has_grab)
		return FALSE

	if(!def_zone) def_zone = user.targeted_organ
	var/target_zone = check_zone(def_zone)
	if(!target_zone)
		return FALSE
	var/obj/item/organ/external/organ = get_organ(check_zone(target_zone))
	if(!organ || organ.is_nerve_struck() || organ.nerve_struck == -1)
		return FALSE

	user.visible_message(SPAN_WARNING("[user] hits [src]'s [organ.joint] right in the nerve!")) //everyone knows where it is, obviously

	organ.nerve_strike_add(1)
	visible_message(SPAN_DANGER("[src]'s [organ.joint] [pick("jitters","convulses","stirs","shakes")] and dangles about!"), (SPAN_DANGER("As [user]'s hit connects with your [organ.joint], you feel it painfully tingle before going numb!")))
	playsound(user, 'sound/weapons/throwtap.ogg', 50, 1)
	damage_through_armor(rand(35,40), HALLOSS, target_zone, ARMOR_MELEE)

	//kill the grab
	user.drop_from_inventory(G)
	G.loc = null
	qdel(G)

	//admin messaging
	user.attack_log += text("\[[time_stamp()]\] <font color='red'>Nervestruck [name] ([ckey])</font>")
	attack_log += text("\[[time_stamp()]\] <font color='orange'>Nervestruck by [user.name] ([user.ckey])</font>")
	msg_admin_attack("[key_name(user)] nervestruck [key_name(src)] in [organ.joint]")

	return TRUE

//Breaks all grips and pulls that the mob currently has.
/mob/living/carbon/human/proc/break_all_grabs(mob/living/carbon/user)
	var/success = 0
	if(pulling)
		visible_message(SPAN_DANGER("[user] has broken [src]'s grip on [pulling]!"))
		success = 1
		stop_pulling()

	if(istype(l_hand, /obj/item/grab))
		var/obj/item/grab/lgrab = l_hand
		if(lgrab.affecting)
			visible_message(SPAN_DANGER("[user] has broken [src]'s grip on [lgrab.affecting]!"))
			success = 1
		spawn(1)
			qdel(lgrab)
	if(istype(r_hand, /obj/item/grab))
		var/obj/item/grab/rgrab = r_hand
		if(rgrab.affecting)
			visible_message(SPAN_DANGER("[user] has broken [src]'s grip on [rgrab.affecting]!"))
			success = 1
		spawn(1)
			qdel(rgrab)
	return success

/mob/living/carbon/human
	var/datum/unarmed_attack/default_attack

/mob/living/carbon/human/verb/check_attacks()
	set name = "Check Attacks"
	set category = "IC"
	set src = usr

	var/dat = "<b><font size = 5>Known Attacks</font></b><br/><br/>"

	for(var/datum/unarmed_attack/u_attack in species.unarmed_attacks)
		dat += "<b>Primarily [u_attack.attack_name] </b><br/><br/><br/>"

	src << browse(dat, "window=checkattack")
	return

/mob/living/carbon/human/check_attacks()
	var/dat = "<b><font size = 5>Known Attacks</font></b><br/><br/>"

	if(default_attack)
		dat += "Current default attack: [default_attack.attack_name] - <a href='byond://?src=\ref[src];default_attk=reset_attk'>reset</a><br/><br/>"

	for(var/datum/unarmed_attack/u_attack in species.unarmed_attacks)
		if(u_attack == default_attack)
			dat += "<b>Primarily [u_attack.attack_name]</b> - default - <a href='byond://?src=\ref[src];default_attk=reset_attk'>reset</a><br/><br/><br/>"
		else
			dat += "<b>Primarily [u_attack.attack_name]</b> - <a href='byond://?src=\ref[src];default_attk=\ref[u_attack]'>set default</a><br/><br/><br/>"

	src << browse(dat, "window=checkattack")

/mob/living/carbon/human/Topic(href, href_list)
	if(href_list["default_attk"])
		if(href_list["default_attk"] == "reset_attk")
			set_default_attack(null)
		else
			var/datum/unarmed_attack/u_attack = locate(href_list["default_attk"])
			if(u_attack && (u_attack in species.unarmed_attacks))
				set_default_attack(u_attack)
		check_attacks()
		return 1
	else
		return ..()

/mob/living/carbon/human/proc/set_default_attack(var/datum/unarmed_attack/u_attack)
	default_attack = u_attack

/datum/unarmed_attack
	var/attack_name = "fist"

/datum/unarmed_attack
	bite/attack_name = "bite"
	bite/sharp/attack_name = "sharp bite"
	bite/strong/attack_name = "strong bite"
	punch/attack_name = "punch"
	kick/attack_name = "kick"
	stomp/attack_name = "stomp"
	stomp/weak/attack_name = "weak stomp"
	claws/attack_name = "claws"
	claws/strong/attack_name = "strong claws"
	horns/attack_name = "horns"
	tail/attack_name = "tail strike"
