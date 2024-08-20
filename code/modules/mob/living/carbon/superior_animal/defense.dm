/mob/living/carbon/superior_animal/proc/harvest(mob/user)
	drop_embedded()
	var/actual_meat_amount = max(1,(meat_amount/2))
	var/actual_leather_amount = max(0,(leather_amount/2))
	var/actual_bones_amount = max(0,(bones_amount/2))

	if(ishuman(user))
		if(user.stats.getPerk(PERK_BUTCHER)) // Master Butcher will now give full amounts defined in the creature's variables. Otherwise, it's only half, and no special items.
			actual_leather_amount = max(0,(leather_amount))
			actual_meat_amount = max(1,(meat_amount))
			actual_bones_amount = max(0,(bones_amount))
			if(has_special_parts)
				for(var/animal_part in special_parts)
					new animal_part(get_turf(src))

	if(actual_leather_amount > 0 && (stat == DEAD))
		for(var/i=0;i<actual_leather_amount;i++)
			new /obj/item/stack/material/leather(get_turf(src))

	if(actual_bones_amount > 0 && (stat == DEAD))
		for(var/i=0;i<actual_bones_amount;i++)
			new /obj/item/stack/material/bone(get_turf(src))

	if(meat_type && actual_meat_amount > 0 && (stat == DEAD))
		for(var/i=0;i<actual_meat_amount;i++)
			if(ispath(src.meat_type, /obj/item/reagent_containers/food/snacks/meat))
				var/obj/item/reagent_containers/food/snacks/meat/butchered_meat = new meat_type(get_turf(src))
				butchered_meat.name = "[src.name] [butchered_meat.name]"
				butchered_meat.initialize_genetics(src)
			else
				var/obj/item/non_meat = new meat_type(get_turf(src))
				non_meat.name = "[src.name] [non_meat.name]"
		if(issmall(src))
			if(user != src)
				user.visible_message(SPAN_DANGER("[user] chops up \the [src]!"))
			var/obj/effect/decal/cleanable/blood/blood_effect = new/obj/effect/decal/cleanable/blood/splatter(get_turf(src))
			blood_effect.basecolor = bloodcolor
			blood_effect.update_icon()
			qdel(src)
		else
			if(ishuman(user))
				if(user.stats.getPerk(PERK_BUTCHER))
					if(user != src)
						user.visible_message(SPAN_DANGER("[user] butchers \the [src] cleanly!"))
					var/obj/effect/decal/cleanable/blood/blood_effect = new/obj/effect/decal/cleanable/blood/splatter(get_turf(src))
					blood_effect.basecolor = bloodcolor
					blood_effect.update_icon()
				qdel(src)
			else
				if(user != src)
					user.visible_message(SPAN_DANGER("[user] butchers \the [src] messily!"))
				gib()

/mob/living/carbon/superior_animal/update_lying_buckled_and_verb_status()
	lying_prev = lying

	. = ..()

	check_AI_act()

/mob/living/carbon/superior_animal/bullet_act(obj/item/projectile/P, def_zone)
	. = ..()

	if (!(P.testing))
		if(stance == HOSTILE_STANCE_ATTACK)
			if(destroy_surroundings)
				destroySurroundings()

		updatehealth()
		SEND_SIGNAL(src, COMSIG_ATTACKED, P, P.original_firer)

/mob/living/carbon/superior_animal/attackby(obj/item/I, mob/living/user, params)
	activate_ai() //If were attacked by something and havent woken up yet. Were awake now >:T
	if (meat_type && (stat == DEAD) && (QUALITY_CUTTING in I.tool_qualities) && user.a_intent ==  I_HELP)
		if (I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_CUTTING, FAILCHANCE_NORMAL, required_stat = STAT_BIO))
			harvest(user)
	else

		if(stance == HOSTILE_STANCE_ATTACK && stat == CONSCIOUS )
			if(destroy_surroundings)
				destroySurroundings()
		. = ..()

		updatehealth()
		SEND_SIGNAL(src, COMSIG_ATTACKED, I, user, params)

/mob/living/carbon/superior_animal/resolve_item_attack(obj/item/I, mob/living/user, hit_zone)
	//mob.attackby -> item.attack -> mob.resolve_item_attack -> item.apply_hit_effect
	return TRUE

/mob/living/carbon/superior_animal/attack_hand(mob/living/carbon/M as mob)
	. = ..()
	var/mob/living/carbon/human/H = M

	switch(M.a_intent)
		if (I_HELP)
			help_shake_act(M)

		if (I_GRAB)
			if(M == src || anchored)
				return FALSE
			for(var/obj/item/grab/G in src.grabbed_by)
				if(G.assailant == M)
					to_chat(M, SPAN_NOTICE("You already grabbed [src]."))
					return

			var/obj/item/grab/G = new /obj/item/grab(M, src)
			if(buckled)
				to_chat(M, SPAN_NOTICE("You cannot grab [src], \he is buckled in!"))
			if(!G) //the grab will delete itself in New if affecting is anchored
				return

			if (M in friends)
				grabbed_by_friend = TRUE // disables AI for easier wrangling

			M.put_in_active_hand(G)
			G.synch()
			LAssailant_weakref = WEAKREF(M)

			M.do_attack_animation(src)
			playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
			visible_message(SPAN_WARNING("[M] has grabbed [src] passively!"))
			SEND_SIGNAL(src, COMSIG_ATTACKED, null, M)
			return TRUE

		if (I_DISARM)
			if (!weakened && (prob(30 + (H.stats.getStat(STAT_ROB) * 0.1))))
				M.visible_message("\red [M] has knocked \the [src] over!")
				playsound(loc, 'sound/weapons/thudswoosh.ogg', 50, 1, -1)
				Weaken(3)

				return TRUE
			else
				M.visible_message("\red [M] failed to shove \the [src]")
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)

			M.do_attack_animation(src)
			SEND_SIGNAL(src, COMSIG_ATTACKED, null, M)

		if (I_HURT)
			var/damage = 3
			if ((stat == CONSCIOUS) && prob(10))
				playsound(loc, 'sound/weapons/punchmiss.ogg', 25, 1, -1)
				M.visible_message("\red [M] missed \the [src]")
			else
				if (istype(H))
					damage += max(0, (H.stats.getStat(STAT_ROB) / 10))
					if (HULK in H.mutations)
						damage *= 2

				playsound(loc, "punch", 25, 1, -1)
				M.visible_message("\red [M] has punched \the [src]")

				adjustBruteLoss(damage)
				updatehealth()
				M.do_attack_animation(src)

				SEND_SIGNAL(src, COMSIG_ATTACKED, null, M)
				return TRUE

/mob/living/carbon/superior_animal/ex_act(severity)
	..()
	flash(5, FALSE ,FALSE ,FALSE)

	var/b_loss = null
	var/f_loss = null
	switch (severity)
		if (1)
			gib()
			return

		if (2)
			b_loss += 60
			f_loss += 60
			ear_damage += 30
			ear_deaf += 120

		if (3)
			b_loss += 30
			if (prob(50))
				Paralyse(1)
			ear_damage += 15
			ear_deaf += 60

	adjustBruteLoss(b_loss)
	adjustFireLoss(f_loss)

	updatehealth()

/mob/living/carbon/superior_animal/handle_regular_status_updates()
	..()
	if(status_flags & GODMODE)
		return

	if(stat == DEAD)
		blinded = TRUE
		silent = FALSE
	else
		updatehealth()
		handle_stunned()
		handle_weakened()
		if(health <= death_threshold)
			blinded = TRUE
			silent = FALSE
			return TRUE

		if(paralysis)
			handle_paralysed()
			blinded = TRUE
			stat = UNCONSCIOUS
			if(halloss > 0)
				adjustHalLoss(-3)

		if(sleeping)
			adjustHalLoss(-3)
			sleeping = max(sleeping-1, 0)
			blinded = TRUE
			stat = UNCONSCIOUS

		if(!sleeping && !paralysis)
			stat = CONSCIOUS
			if(halloss > 0)
				adjustHalLoss(-1)

		update_icons()

	return TRUE

/mob/living/carbon/superior_animal/adjustBruteLoss(amount)
	. = ..()
	if (overkill_gib && (amount >= overkill_gib) && (getBruteLoss() >= maxHealth*2))
		if (bodytemperature > T0C)
			gib()

/mob/living/carbon/superior_animal/adjustFireLoss(amount)
	. = ..()
	if (overkill_dust && (amount >= overkill_dust) && (getFireLoss() >= maxHealth*2))
		dust()

/mob/living/carbon/superior_animal/adjustToxLoss(amount)
	if (toxin_immune)
		return
	. = ..()

/mob/living/carbon/superior_animal/updatehealth()
	. = ..() //health = maxHealth - getOxyLoss() - getToxLoss() - getFireLoss() - getBruteLoss() - getCloneLoss() - halloss
	activate_ai()
	if (health <= death_threshold && stat != DEAD) //stops constantly procing death
		death()

/mob/living/carbon/superior_animal/gib(anim = icon_gib)
	if (!anim)
		anim = 0

	for(var/obj/item/I in src)
		drop_from_inventory(I)
		I.throw_at(get_edge_target_turf(src,pick(alldirs)), rand(1,3), round(30/I.w_class))

	AI_inactive = TRUE //Optimation, were dead
	playsound(src.loc, 'sound/effects/splat.ogg', max(10,min(50,maxHealth)), 1)
	if (do_gibs)
		gibs(src.loc, null, gibspawner_type, fleshcolor, bloodcolor)
	. = ..(anim,FALSE)

/mob/living/carbon/superior_animal/dust(anim = icon_dust, remains = dust_remains)
	if (!anim)
		anim = 0

	playsound(src.loc, 'sound/effects/Custom_flare.ogg', max(10,min(50,maxHealth)), 1)
	AI_inactive = TRUE //Optimation, were dead
	. = ..(anim,remains)

/mob/living/carbon/superior_animal/death(gibbed,message = deathmessage)

	if (is_dead(src))
		return FALSE

	target_mob = null
	lost_sight = FALSE
	target_location = null
	stance = initial(stance)
	stop_automated_movement = initial(stop_automated_movement)
	following = null
	last_followed = null

	density = FALSE
	layer = LYING_MOB_LAYER

	AI_inactive = TRUE //Optimation, were dead
	density = FALSE //In death were no longer blocking.
	target_mob = null
	. = ..()

/mob/living/carbon/superior_animal/rejuvenate()
	if(AI_inactive)
		activate_ai() //I LIVE AGAIN
	density = initial(density)
	layer = initial(layer)

	. = ..()

/mob/living/carbon/superior_animal/pl_effects()
	. = ..()
	adjustToxLoss(2)

/mob/living/carbon/superior_animal/get_cold_protection(temperature)
	return cold_protection

/mob/living/carbon/superior_animal/get_heat_protection(temperature)
	return heat_protection

/*/mob/living/carbon/superior_animal/handle_breath(datum/gas_mixture/breath)
	if(status_flags & GODMODE)
		return

	if (is_dead(src))

	failed_last_breath = FALSE

	if (!(breath_required_type || breath_poison_type))
		return

	if(breath_required_type && (!breath || (breath.total_moles == 0)))
		failed_last_breath = TRUE
		adjustOxyLoss(2)
		return

	var/breath_pressure = (breath.total_moles*R_IDEAL_GAS_EQUATION*breath.temperature)/BREATH_VOLUME

	if (breath_required_type)
		var/inhaling = breath.gas[breath_required_type]
		var/inhale_pp = (inhaling/breath.total_moles)*breath_pressure
		if(inhale_pp < min_breath_required_type)
			adjustOxyLoss(2)
			failed_last_breath = TRUE

	if (breath_poison_type)
		var/poison = breath.gas[breath_poison_type]
		var/toxins_pp = (poison/breath.total_moles)*breath_pressure
		if(toxins_pp > min_breath_poison_type)
			adjustToxLoss(2)

	return TRUE */

//Disables roaches/spiders/xenos ect form mess with atmo to prevent lag of that kind
/mob/living/carbon/superior_animal/handle_post_breath(datum/gas_mixture/breath)
	return
	//if(breath)
	//	loc.assume_air(breath) //by default, exhale

/* this is now handled upwards in living_defense
/mob/living/carbon/superior_animal/handle_fire()
	if(never_stimulate_air)
		if (fire_stacks > 0)
			ExtinguishMob() //We dont simulate air thus we dont simulate fire
		return

	// if its lower than 0 , just bring it back to 0
	fire_stacks = fire_stacks > 0 ? min(0, ++fire_stacks) : fire_stacks
	// branchless programming , faster than conventional the more we avoid if checks
	var/handling_needed = on_fire && (fire_stacks < 0 || flammable_gas < 1)
	if(handling_needed)
		ExtinguishMob() //Fire's been put out.
		return TRUE
	if(!on_fire)
		return FALSE
	adjustFireLoss(2 * bodytemperature / max_bodytemperature) // scaling with how much you are over your body temp
	bodytemperature += fire_stacks * 5 // 5 degrees per firestack
	if(isturf(location))
		location.hotspot_expose( FIRESTACKS_TEMP_CONV(fire_stacks), 50, 1)

/mob/living/carbon/superior_animal/update_fire()
	cut_overlay(image("icon"='icons/mob/OnFire.dmi', "icon_state"="Standing"))
	if(on_fire)
		add_overlay(image("icon"='icons/mob/OnFire.dmi', "icon_state"="Standing"))
*/

//The most common cause of an airflow stun is a sudden breach. Evac conditions generally
/mob/living/carbon/superior_animal/airflow_stun()
	.=..()
	if (can_burrow && !stat)
		evacuate()


//Called when the environment becomes unlivable, maybe in other situations
//The mobs will request the nearby burrow to take them away somewhere else
/mob/living/carbon/superior_animal/proc/evacuate()
	var/obj/structure/burrow/B = find_visible_burrow(src)
	if (B)
		B.evacuate()


/mob/living/carbon/superior_animal/proc/pick_armor()
	return

/mob/living/carbon/superior_animal/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)

	if(!damage || !istype(user))
		return

	var/penetration = 1
	if(istype(user, /mob/living))
		var/mob/living/L = user
		penetration = L.armor_divisor

	damage_through_armor(damage, BRUTE, attack_flag=ARMOR_MELEE, armor_divisor=penetration)
	user.attack_log += text("\[[time_stamp()]\] <font color='red'>attacked [src.name] ([src.ckey])</font>")
	src.attack_log += text("\[[time_stamp()]\] <font color='orange'>was attacked by [user.name] ([user.ckey])</font>")
	src.visible_message(SPAN_DANGER("[user] has [attack_message] [src]!"))
	user.do_attack_animation(src)
	spawn(1) updatehealth()
	return TRUE
