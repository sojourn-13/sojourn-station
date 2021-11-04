/*
Boss of this maints.
Has ability of every roach.
*/

/mob/living/carbon/superior_animal/wasonce
	name = "Was Once"
	desc = "A burbling mass of bones, flesh, and regret. Its strength is matched only by the maddened suffering it endures."
	icon = 'icons/mob/genetics/wasonce.dmi'
	icon_state = "wasonce"
	density = TRUE

	//The poor bastard stuck inside this thing
	var/mob/living/akira

	//Other bastards stuck inside this thing

	//Fucking Mega Chonker
	maxHealth = 2000
	health = 2000
	contaminant_immunity = TRUE

	viewRange = 16

	armor = list(melee = 40, bullet = 30, energy = 0, bomb = 20, bio = 50, rad = 100, agony = 100)

	var/knockdown_odds = 30 //Maybe stay away from it

	can_burrow = FALSE
	melee_damage_lower = 15
	melee_damage_upper = 20
	move_to_delay = 3
	mob_size =  3  // The same as Hivemind Tyrant
	status_flags = 0
	mouse_opacity = MOUSE_OPACITY_OPAQUE // Easier to click on in melee, they're giant targets anyway

	//When something is knocked over, this creature devours it and grows.
	var/list/captives

	flash_resistances = 100 // Too Thick to care about flash...

	sanity_damage = 3

	ranged = 1 // RUN, COWARD!
	ranged_cooldown = 5 //Takes awhile
	ranged_middlemouse_cooldown = 0
	projectiletype = /obj/item/projectile/flamer_lob //To make things falling over easier
	fire_verb = "spits a flaming glob of phlegm"

	stance=HOSTILE_STANCE_IDLE

/mob/living/carbon/superior_animal/wasonce/New(var/mob/living/victim)
	..()

	//kill victim
	if(istype(victim, /mob/living))
		victim.damage_through_armor(201, BRUTE, BP_CHEST)
		akira = victim

		name = "What was once [victim]"
		if ((istype(victim, /mob/living/carbon/human)))
			var/mob/living/carbon/human/h_victim = victim
			var/obj/item/implant/core_implant/cruciform/CI = h_victim.get_core_implant(/obj/item/implant/core_implant/cruciform, FALSE)
			if (CI)
				var/mob/N = CI.wearer
				CI.name = "[N]'s Cruciform"
				CI.uninstall()

		victim.forceMove(src)

	pixel_x = -16  // For some reason it doesn't work when I overload them in class definition, so here it is.
	pixel_y = -16

	//Start swinging right out the gate.
	handle_ai()
	playsound(src.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)

// NOM
/mob/living/carbon/superior_animal/wasonce/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		var/mob/living/carbon/human/H
		if(ishuman(L))
			H = L
		if(H)
			if (H.paralysis || H.sleeping || H.resting || H.lying || H.weakened)
				//EAT! EEEEAAAT!
				if(do_after(src, 20, H))
					H.visible_message(SPAN_DANGER("\the [src] absorbs \the [L] into its mass!"))
					H.forceMove(src)
					maxHealth += 500
					health += 500
					captives += H

		if(istype(L) && !L.weakened && prob(knockdown_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(3)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
	. = ..()


/mob/living/carbon/superior_animal/wasonce/findTarget()
	var/atom/best_target = null
	var/distance_weighting = 0

	for(var/atom/O in getPotentialTargets())
		var/priority = isValidAttackTarget(O)
		if (priority)
			var/temp_weighting = priority * get_dist(src, O)
			if(!distance_weighting || distance_weighting < temp_weighting)
				distance_weighting = temp_weighting
				best_target = O
	return best_target

/mob/living/carbon/superior_animal/wasonce/isValidAttackTarget(var/atom/O)
	if (isliving(O))
		var/mob/living/L = O
		if((L.health <= (ishuman(L) ? HEALTH_THRESHOLD_CRIT : 0)) || (!attack_same && (L.faction == src.faction)) || (L in friends))
			return
		if(L.friendly_to_colony && src.friendly_to_colony) //If are target and areselfs have the friendly to colony tag, used for chtmant protection
			return

		//Prioritize things that are weak & close
		var/mob/living/carbon/human/H
		if(ishuman(L))
			H = L
		if (H.paralysis || H.sleeping || H.resting || H.lying || H.weakened)
			return 1

		return 4

	//Mecha's are big enough to help distract these things.
	if (istype(O, /obj/mecha))
		var/obj/mecha/M = O
		return isValidAttackTarget(M.occupant) / 4

/mob/living/carbon/superior_animal/wasonce/slip(var/slipped_on)
	return FALSE