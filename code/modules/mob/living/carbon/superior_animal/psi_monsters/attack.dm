/mob/living/carbon/superior_animal/psi_monster/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A

		if(poison_per_bite > 0)
			if(istype(L) && L.reagents)
				var/zone_armor =  L.getarmor(targeted_organ, ARMOR_MELEE)
				var/poison_injected = zone_armor ? poison_per_bite * (-0.01 * zone_armor + 1) : poison_per_bite
				L.reagents.add_reagent(poison_type, poison_injected)

		alpha = 255

		if(!is_leaching && can_leach && ishuman(L))
			if(prob(leach_on_odds))
				Wrap(A)


/mob/living/carbon/superior_animal/psi_monster/pus_maggot/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L) && prob(75))
			var/damage = rand(melee_damage_lower, melee_damage_upper)
			L.damage_through_armor(damage, BURN)
			playsound(src, burn_attack_sound, 50, 1, -3)
			L.visible_message(SPAN_DANGER(burn_attack_text))


/mob/living/carbon/superior_animal/psi_monster/dreaming_king/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(istype(L))
			shake_camera(L, 3, 1)


/mob/living/carbon/superior_animal/psi_monster/proc/Wrap(var/mob/living/M) // This is a proc for the clicks
	if (Victim == M || src == M)
		Feedstop()
		return

	if (Victim)
		to_chat(src, "I am already draining...")
		return

	var t = invalidFeedTarget(M)
	if (t)
		to_chat(src, t)
		return

	Feedon(M)

/mob/living/carbon/superior_animal/psi_monster/proc/invalidFeedTarget(mob/living/carbon/human/M)
	if (!M || !ishuman(M))
		return "This subject is incomparable..."
	if (!Adjacent(M))
		return "This subject is too far away..."
	if (iscarbon(M) && M.getFireLoss() >= M.maxHealth * 1.5 || isanimal(M) && M.stat == DEAD)
		return "This subject does not have an edible life energy..."
	return 0

/mob/living/carbon/superior_animal/psi_monster/proc/Feedon(mob/living/carbon/human/M)
	Victim = M
	loc = M.loc
	canmove = 0
	anchored = 1
	is_leaching = TRUE

	regenerate_icons()

	while(Victim && !invalidFeedTarget(M) && stat != 2)
		canmove = 0

		if(Adjacent(M))
			UpdateFeed(M)

			if(ishuman(M))
				Victim.adjustFireLoss(rand(5,6))
				Victim.adjustCloneLoss(rand(1,2))
				if(Victim.health <= 0)
					Victim.adjustCloneLoss(rand(1,2))
				if(prob(steal_odds))
					Victim.stats.changeStat(stat_to_steal, steal_amount)
					var/health_addition_mod = steal_amount * -1 //So we became non-negtive
					maxHealth += (30 * health_addition_mod)
					health += (30 * health_addition_mod)


			else
				to_chat(src, "<span class='warning'>[pick("This subject is incompatable", "This subject does not have a life energy", "This subject is empty", "I am not satisified", "I can not feed from this subject", "I do not feel nourished", "This subject is not food")]...</span>")
				Feedstop()
				break

			if(prob(15) && M.client)
				var/painMes = pick("You can feel your body becoming weak!", "You feel like you're about to die!", "You feel every part of your body screaming in agony!", "A low, rolling pain passes through your body!", "Your body feels as if it's falling apart!", "You feel extremely weak!", "A sharp, deep pain bathes every inch of your body!")
				M.custom_pain(painMes)

			adjustBruteLoss(-16)
			adjustFireLoss(-16)
			updatehealth()
			if(Victim)
				Victim.updatehealth()

			sleep(30) // Deal damage every 3 seconds
		else
			break

	canmove = 1
	anchored = 0

	Victim = null
	is_leaching = FALSE

/mob/living/carbon/superior_animal/psi_monster/proc/Feedstop()
	if(Victim)
		if(Victim.client) Victim << "[src] has let go of you!"
		Victim = null

	is_leaching = FALSE

/mob/living/carbon/superior_animal/psi_monster/proc/UpdateFeed(var/mob/M)
	if(Victim)
		if(Victim == M)
			loc = M.loc // simple "attach to head" effect!


//Fancy Chaos level attack upgrades

//Memory: the shadow fella, when they attack teleport behind the person, regardless of whats in are way, (like walls n stuff)
/mob/living/carbon/superior_animal/psi_monster/memory/UnarmedAttack(atom/A, proximity)
	. = ..()

	if(ismob(A))
		var/mob/M = A
		var/RD = reverse_direction(M.dir)
		dir = M.dir

		if(GLOB.chaos_level >= 2) //Unlocks early as these smucks are trash
			var/turf/T = get_step(M, RD)
			if(T && !QDELETED(src)) //Safty so we dont teleport out of quedel
				forceMove(T)

//thought and memory police! These two work together at chaos level 2 making them quite tricky
/mob/living/carbon/superior_animal/psi_monster/thought_melter/UnarmedAttack(atom/A, proximity)
	if(GLOB.chaos_level >= 2)
		if(ishuman(A))
			var/mob/living/carbon/human/H = A
			if(!H.psi_blocking > 0)
				if(istype(H.head, /obj/item/clothing)) //We only knock off hats
					var/obj/item/clothing/hat = H.head
					if(hat.canremove || hat.psi_blocking <= 0)
						H.drop_from_inventory(hat)
						visible_message(SPAN_DANGER("[src] steals [H.name]'s [hat]!"))
	. = ..()

/mob/living/carbon/superior_animal/psi_monster/memory_eater/UnarmedAttack(atom/A, proximity, repeat_attack = FALSE)
	if(GLOB.chaos_level >= 2)
		if(ishuman(A))
			var/mob/living/carbon/human/H = A
			if(!H.psi_blocking > 0)
				if(!istype(H.head, /obj/item/clothing) && !repeat_attack) //if we dont have a hat we attack again!
					UnarmedAttack(A,proximity,TRUE)
	. = ..()

//The masked horror!!!!
/mob/living/carbon/superior_animal/psi_monster/hovering_nightmare/UnarmedAttack(atom/A, proximity)
	if(GLOB.chaos_level >= 2)
		if(ishuman(A))
			var/mob/living/carbon/human/H = A

			if(!H.psi_blocking > 0)
				if(!H.wear_mask)
					var/psionic_mask = pick(typesof(/obj/item/clothing/mask/deepmaints_debuff))
					if(psionic_mask)
						H.replace_in_slot(new psionic_mask, slot_wear_mask, skip_covering_check = TRUE)

				else //Small note IS_OPIFEX **will** die without their n2, so they do not have this risk at all.
					if(istype(H.wear_mask, /obj/item/clothing) && !istype(H.wear_mask, /obj/item/clothing/mask/deepmaints_debuff) && H.species.reagent_tag != IS_OPIFEX) //Saved by a masked item!
						var/obj/item/clothing/mask = H.wear_mask
						if(mask.canremove || mask.psi_blocking <= 0)
							H.drop_from_inventory(mask)
							visible_message(SPAN_DANGER("[src] peals off [H.name]'s [mask]!"))
	. = ..()

//The Cerebral crusher gets by far the most complex and silly fancy attacks.
//If we have a shield, then we deal direct damage to it, trying to kill the shield as fast as possable!
//If we are wielding an item? Unwield it
//If we dont have any of the above, but still hold an item, drop it (respects can drop)
/mob/living/carbon/superior_animal/psi_monster/cerebral_crusher/UnarmedAttack(atom/A, proximity)
	if(GLOB.chaos_level >= 2)
		if(ishuman(A))
			var/mob/living/carbon/human/H = A
			var/knock_out_of_hand = TRUE
			if(!H.psi_blocking > 0)
				if(H.has_shield())
					var/obj/item/shield/shield = H.has_shield()
					visible_message(SPAN_DANGER("[src] render, and tears into [H.name]'s [shield]!"))
					shield.adjustShieldDurability(-50, H)
					knock_out_of_hand = FALSE

				//Lots of checks for a seemingly simple task, unwielding a persons wielded weapon
				var/right_hand_found = FALSE
				var/left_hand_found = FALSE
				if(H.l_hand)
					left_hand_found = TRUE
				if(H.r_hand)
					right_hand_found = TRUE
				if(right_hand_found && left_hand_found)
					var/obj/item/wielded_r = H.r_hand
					var/obj/item/wielded_l = H.l_hand
					knock_out_of_hand = FALSE
					if(GLOB.chaos_level >= 3) //At level 3 it knocks items from a wielded state out of it!
						if(!wielded_r.is_held_twohanded(wielded_r))
							visible_message(SPAN_DANGER("[src] batters [H.name]'s [wielded_r], making [H.name] unwield [wielded_r]!"))
							wielded_r.unwield(H)
						if(!wielded_l.is_held_twohanded(wielded_l))
							visible_message(SPAN_DANGER("[src] batters [H.name]'s [wielded_l], making [H.name] unwield [wielded_l]!"))
							wielded_l.unwield(H)
				//This is insainl powerful and shuld not just happend without choas level being exstreamly high
				if(GLOB.chaos_level >= 5)
					if(knock_out_of_hand) //When not wielding an item we knock it out of your grasp!
						if(H.get_active_hand())
							var/obj/fumble = H.get_active_hand()
							H.drop_from_inventory(fumble)
							visible_message(SPAN_DANGER("[src] knocks [fumble] out of [H.name]'s grasp!"))
	. = ..()

//To see full affects go to the ai.dm for psi_monsters
/mob/living/carbon/superior_animal/psi_monster/pus_maggot/ash_wendigo/UnarmedAttack(atom/A, proximity)
	if(ishuman(A))
		var/mob/living/carbon/human/H = A
		dir = reverse_direction(H.dir) //face to face comferation (required for how we handle being attacked)
	..()