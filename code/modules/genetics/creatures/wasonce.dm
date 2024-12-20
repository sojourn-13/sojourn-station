/*
Boss of this maints.
Has ability of every roach.
*/

/mob/living/carbon/superior_animal/psi_monster/wasonce
	name = "Was Once"
	desc = "A burbling mass of bones, flesh, and regret. Its strength is matched only by the maddened suffering it endures."
	icon = 'icons/mob/genetics/wasonce.dmi'
	icon_state = "wasonce"
	icon_living = "wasonce"
	density = TRUE

	//The poor bastard stuck inside this thing
	var/mob/living/akira

	//Other bastards stuck inside this thing

	//Fucking Mega Chonker
	maxHealth = 1800
	health = 1800

	//Psi_monster stuff.
	chameleon_skill = 255 // Psionics not developed, can't turn invisible.
	healing_factor = 25
	size_pixel_offset_x = -16
	momento_mori = /obj/effect/gibspawner

	faction= "psi_monster"
	friendly_to_colony = FALSE

	viewRange = 12
	randpixel = 0
	pixel_x = -16
	pixel_y = 0
	default_pixel_x = -16
	default_pixel_y = 0

	attacktext = "delivered a crushing blow to"

	armor = list(melee = 15, bullet = 7, energy = 0, bomb = 20, bio = 50, rad = 100, agony = 100)

	var/knockdown_odds = 60 //Maybe stay away from it

	can_burrow = FALSE
	melee_damage_lower = 30
	melee_damage_upper = 35
	attack_sound = 'sound/xenomorph/alien_footstep_charge1.ogg'
	move_to_delay = 6
	mob_size =  MOB_LARGE  // The same as Hivemind Tyrant
	status_flags = 0
	mouse_opacity = MOUSE_OPACITY_OPAQUE // Easier to click on in melee, they're giant targets anyway
	phaser = TRUE //WERE REALLLLL

	life_cycles_before_sleep = 3000 //Keep this awake for longer than the regular mob.

	var/datum/genetics/genetics_holder/injector


	//When something is knocked over, this creature devours it and grows.
	var/list/captives = list()

	flash_resistances = 100 // Too Thick to care about flash...

	sanity_damage = 3

	//ranged = 1 // RUN, COWARD!
	//ranged_cooldown = 5 //Takes awhile
	//ranged_middlemouse_cooldown = 0
	//projectiletype = /obj/item/projectile/flamer_lob //To make things falling over easier
	//fire_verb = "spits a flaming glob of phlegm"

	stance=HOSTILE_STANCE_IDLE

	var/lethal_to_captive = FALSE
	var/real_mutator = TRUE

/mob/living/carbon/superior_animal/psi_monster/wasonce/New(var/mob/living/victim)
	..()

	injector = new(src)

	loc = get_turf(victim)
	//kill the victim
	if(istype(victim, /mob/living))
		akira = victim
		//Kill them properly. - 300 damage to bypass most health mods, this should kill anyone even power gamers with best stats, best perks.
		akira.adjustBruteLoss(80)
		akira.adjustCloneLoss(100)

		name = "Was once [akira]"
		if ((istype(akira, /mob/living/carbon/human)))
			var/mob/living/carbon/human/h_victim = akira
			var/obj/item/implant/core_implant/cruciform/CI = h_victim.get_core_implant(/obj/item/implant/core_implant/cruciform, FALSE)
			if (CI)
				var/mob/N = CI.wearer
				CI.name = "[N]'s Cruciform"
				CI.uninstall()

		akira.loc = src

	//Start swinging right out the gate.
	handle_ai()
	playsound(src.loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)

// NOM
/mob/living/carbon/superior_animal/psi_monster/wasonce/UnarmedAttack(atom/A, proximity)
	if(isliving(A))
		var/mob/living/L = A
		var/mob/living/carbon/human/H
		if(ishuman(L))
			H = L
		if(H)
			if (H.paralysis || H.sleeping || H.resting || H.lying || H.weakened)
				H.visible_message(SPAN_DANGER("\the [src] absorbs \the [L] into its mass!"))
				H.loc = src
				maxHealth += 250
				health += 250
				captives += H
				return

		if(istype(L) && prob(knockdown_odds))
			if(L.stats.getPerk(PERK_ASS_OF_CONCRETE) || L.stats.getPerk(PERK_BRAWN))
				return
			else
				L.Weaken(3)
				L.visible_message(SPAN_DANGER("\the [src] uses its mass to knock over \the [L]!"))
	. = ..()

/mob/living/carbon/superior_animal/psi_monster/wasonce/death(gibbed, deathmessage = "shrieks in its death as it violently bursts into a shower of gibs!")
	for(var/mob/living/drop_victim in captives)
		drop_victim.loc = get_turf(src)
	captives = list()

	if(akira)
		akira.loc = get_turf(src)
		akira.gib()
	//So we dont nullspace are akira'ed or victims
	..()
	qdel(src) //Delete you!

/mob/living/carbon/superior_animal/psi_monster/wasonce/Life()

	if(captives.len)
		for(var/mob/living/carbon/human/captive in captives)
			if(captive.loc != src)
				captives.Remove(captive)

	if(captives.len && prob(15) && real_mutator)
		var/fail_mutation_path = pick(injector.getFailList())
		var/datum/genetics/mutation/injecting_mutation = new fail_mutation_path()
		injector.addMutation(injecting_mutation)
		for(var/mob/living/carbon/human/captive in captives)

			if(captive.species.reagent_tag == IS_SYNTHETIC && (captive.getBruteLoss() < 300))
				to_chat(captive, SPAN_DANGER(pick("The immense strength of the creature is crushing. Wasn't... Flesh supposed to be weak?")))
				captive.adjustBruteLossByPart(15, pick(captive.organs))
			else
				to_chat(captive, SPAN_DANGER(pick(
					"The mass changes you...", "Veins slip into your flesh and merge with your own", "Parts of yourself fuse to the roiling flesh surrounding you.",
					"You feel yourself breathing through multiple lungs.", "You feel yourself assimilating with the whole.")))
				injector.inject_mutations(captive, TRUE)
		injector.removeAllMutations()
	if(lethal_to_captive && captives.len && prob(15))
		for(var/mob/living/captive in captives)
			captive.adjustBruteLoss(5)
			captive.adjustFireLoss(5)
	..()

/mob/living/carbon/superior_animal/psi_monster/wasonce/return_air_for_internal_lifeform()
	//assume that the cryo cell has some kind of breath mask or something that
	//draws from the cryo tube's environment, instead of the cold internal air.
	if(loc)
		return loc.return_air()
	else
		return null

/mob/living/carbon/superior_animal/psi_monster/wasonce/findTarget()
	var/atom/best_target = null
	var/distance_weighting = 0

	var/turf/our_turf = get_turf(src)
	if (our_turf) //If we're not in anything, continue
		for(var/mob/living/O in hearers(src, viewRange))
			var/priority = isValidAttackTarget(O)
			if (priority)
				var/temp_weighting = priority * get_dist(src, O)
				if(!distance_weighting || distance_weighting < temp_weighting)
					distance_weighting = temp_weighting
					best_target = O
		return best_target

/mob/living/carbon/superior_animal/psi_monster/wasonce/isValidAttackTarget(var/atom/O)
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
		if (H && (H.paralysis || H.sleeping || H.resting || H.lying || H.weakened))
			return 1

		return 4

	//Mecha's are big enough to help distract these things.
	if (istype(O, /obj/mecha))
		var/obj/mecha/M = O
		return isValidAttackTarget(M.occupant) / 4

/mob/living/carbon/superior_animal/psi_monster/wasonce/slip(var/slipped_on)
	return FALSE
