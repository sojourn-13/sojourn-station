/*
Boss of this maints.
Has ability of every roach.
*/

/mob/living/carbon/superior/roach/kaiser
	name = "Kaiser Roach"
	desc = "A glorious emperor of roaches."
	icon = 'icons/mob/64x64.dmi'
	icon_state = "kaiser_roach"
	icon_dead = "kaiser_roach_dead"
	density = TRUE

	turns_per_move = 6
	maxHealth = 1000 * LEVIATHAN_HEALTH_MOD
	health = 1000 * LEVIATHAN_HEALTH_MOD
	contaminant_immunity = TRUE
	get_stat_modifier = TRUE

	var/datum/reagents/gas_sac

	armor = list(melee = 10, bullet = 8, energy = 6, bomb = 50, bio = 20, rad = 100, agony = 0)

	knockdown_odds = 10
	melee_damage_lower = 20
	melee_damage_upper = 35
	move_to_delay = 4.5 //we're fast despite our size, many legs move us quick! otherwise, it's too easy to kite us.
	mob_size = MOB_LARGE  // The same as Hivemind Tyrant
	status_flags = 0
	mouse_opacity = MOUSE_OPACITY_OPAQUE // Easier to click on in melee, they're giant targets anyway

	flash_resistances = 9.9 // were not fully flash proof but almost...
	armor_divisor = 4

	var/distress_call_stage = 3

	var/health_marker_1 = 900
	var/health_marker_2 = 500
	var/health_marker_3 = 250

	move_and_attack = TRUE //When we move forwards we also want to attack around us

	blattedin_revives_left = 0

	meat_type = /obj/item/reagent_containers/snacks/meat/roachmeat/kaiser
	meat_amount = 15
	sanity_damage = 3
	has_special_parts = TRUE
	special_parts = list(/obj/item/animal_part/kingly_pheromone_gland)
	ranged = TRUE // RUN, COWARD!
	limited_ammo = TRUE //Do we run out of ammo?
	mags_left = 0
	rounds_left = 2 //We get 2 shots then go for melee, this makes us a threat Nnnnope.
	projectiletype = /obj/item/projectile/roach_spit/large
	fire_verb = "spits glowing bile"

	inherent_mutations = list(MUTATION_GIGANTISM, MUTATION_RAND_UNSTABLE, MUTATION_RAND_UNSTABLE, MUTATION_RAND_UNSTABLE)
	fancy_attack_overlay = "kaiser_attack_flick"
	fancy_attack_shading = "#7C919A"
	//randomize_attack_effect_location = FALSE Accually quite cool
	research_value = 3500
	hierarchy = 10

/mob/living/carbon/superior/roach/kaiser/getTargets()
	. = ..()

	rounds_left = 2 //Reload us, after all we are now targeting someone new
	ranged = TRUE //Were reloaded we can be ranged once more

/mob/living/carbon/superior/roach/kaiser/New()
	. = ..()
	gas_sac = new /datum/reagents(100, src)
	pixel_x = -16  // For some reason it doesn't work when I overload them in class definition, so here it is.
	pixel_y = -16

	stats.addPerk(PERK_KAISER_ARMOR)

/mob/living/carbon/superior/roach/kaiser/handle_ai()
	. = ..()

	if(can_call_reinforcements())
		distress_call()

	gas_sac.add_reagent("blattedin", 1)
	if(prob(7))
		gas_attack()


// TOXIC ABILITIES
/mob/living/carbon/superior/roach/kaiser/UnarmedAttack(atom/A, proximity)
	. = ..()

	if(isliving(A))
		var/mob/living/L = A
		if(prob(10))
			var/damage = rand(melee_damage_lower, melee_damage_upper)
			L.apply_effect(200, IRRADIATE) // Looks like a lot but its really not // Because for players it cap at 100. -R4d6
			L.damage_through_armor(damage, TOX, attack_flag = ARMOR_BIO)
			playsound(src, 'sound/voice/insect_battle_screeching.ogg', 30, 1, -3)
			L.visible_message(SPAN_DANGER("\the [src] globs up some glowing bile all over \the [L]!"))
		var/datum/perk/cooldown/a_kaisers_decisive_strike/DS = L.stats.getPerk(PERK_A_KAISERS_DECISIVE_STRIKE)
		if(DS)
			var/obj/effect/effect/melee/swing/S = new(get_turf(L))
			var/_dir = get_dir(src, L)
			if(src == get_turf(L))
				_dir = src.dir
			S.dir = _dir
			DS.strikes += 1
			flick("kaisers_swing[DS.strikes]", S)
			QDEL_IN(S, 2 SECONDS)
			L.damage_through_armor(DS.strikes * 5, BRUTE, attack_flag = ARMOR_MELEE) //10->15->20 no AD
			if(DS.strikes > 3)
				//Ketch are breath
				adjustOxyLoss(-100)
				//The swings dose flames and sooths burns
				adjustFireLoss(-10)
				//The contraction of sinew closes bleeding wounds
				adjustBruteLoss(-30)
				//The rush of movement removes toxic build up in key joints
				adjustToxLoss(-5)
				updatehealth()
				L.stats.removePerk(PERK_A_KAISERS_DECISIVE_STRIKE)
		else
			L.stats.addPerk(PERK_A_KAISERS_DECISIVE_STRIKE)

// SUPPORT ABILITIES
/mob/living/carbon/superior/roach/kaiser/proc/gas_attack()
	if (!gas_sac.has_reagent("blattedin", 20) || stat != CONSCIOUS)
		return

	var/location = get_turf(src)
	var/datum/effect/effect/system/smoke_spread/chem/S = new

	S.attach(location)
	S.set_up(gas_sac, gas_sac.total_volume, 0, location)
	visible_message(SPAN_DANGER("\the [src] secretes strange vapors!"))

	spawn(0)
		S.start()

	gas_sac.clear_reagents()
	return TRUE

// FUHRER ABILITIES
/mob/living/carbon/superior/roach/kaiser/proc/distress_call()
	if (!distress_call_stage)
		return

	for (var/mob/living/carbon/human/H in view())
		if (H.stat != DEAD && H.client)
			break

	if (distress_call_stage)
		distress_call_stage--
		playsound(loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
		spawn(2)
			playsound(loc, 'sound/voice/shriek1.ogg', 100, 1, 8, 8)
		visible_message(SPAN_DANGER("[src] emits a horrifying wail as nearby burrows stir to life!"))
		for (var/obj/structure/burrow/B in find_nearby_burrows(src))
			B.distress(TRUE)


/mob/living/carbon/superior/roach/kaiser/proc/can_call_reinforcements()
	if(health_marker_1 >= health && health > health_marker_2 && distress_call_stage == 3)
		return TRUE
	if(health_marker_2 >= health && health > health_marker_3 && distress_call_stage == 2)
		return TRUE
	if(health_marker_3 >= health && health > 0 && distress_call_stage == 1)
		return TRUE
	return FALSE

/mob/living/carbon/superior/roach/kaiser/updatehealth()
	..()
	speed_cycle()

/mob/living/carbon/superior/roach/kaiser/proc/speed_cycle()
	if(health_marker_1 >= health)
		move_to_delay = 4
		fancy_glide = 2
	if(health_marker_2 >= health)
		move_to_delay = 3.5
		fancy_glide = 4
	if(health_marker_3 >= health)
		move_to_delay = 2.5
		fancy_glide = 6

/mob/living/carbon/superior/roach/kaiser/slip(slipped_on)
	return FALSE

//RIDING
/mob/living/carbon/superior/roach/kaiser/try_tame(mob/living/carbon/user, obj/item/reagent_containers/snacks/grown/thefood)
	if(!istype(thefood))
		return FALSE
	if(prob(40))
		// TODO: Make Kaiser bite user's arm off here.
		visible_message("[src] hesitates for a moment... and then charges at [user]!")
		return TRUE //Setting this to true because the only current usage is attack, and it says it hesitates.
	//fruits and veggies are not there own type, they are all the grown type and contain certain reagents. This is why it didnt work before
	if(isnull(thefood.seed.chems["singulo"])) // You need something injected with the 'Singulo' drink to tame this.
		return FALSE
	visible_message("[src] scuttles towards [user], examining the [thefood] they have in their hand.")
	can_buckle = TRUE
	if(do_after(src, taming_window, src)) //Here's your window to climb onto it.
		if(!buckled_mob || user != buckled_mob) //They need to be riding us
			can_buckle = FALSE
			visible_message("[src] snaps out of its trance and rushes at [user]!")
			return FALSE
		visible_message("[src] bucks around wildly, trying to shake [user] off!") //YEEEHAW
		if(prob(60))
			visible_message("[src] thrashes around and, throws [user] clean off!")
			user.throw_at(get_edge_target_turf(src,pick(alldirs)),rand(1,3),30)
			unbuckle_mob()
			can_buckle = FALSE
			return FALSE
		friends += user
		colony_friend = TRUE
		friendly_to_colony = TRUE
		buckle_movable = TRUE //THIS SHOW IS JUST STARTING KID
		visible_message("[src] reluctantly stops thrashing around...")
		return TRUE
	visible_message("[src] snaps out of its trance and rushes at [user]!")
	return FALSE

/mob/living/carbon/superior/roach/kaiser/movement_tech()
	moved = TRUE
	if(!weakened && stat == CONSCIOUS)
		attemptAttackOnTarget()

//Armor stuff below

/mob/living/carbon/superior/roach/kaiser/getarmor(def_zone, type)
	if(stats.getPerk(PERK_KAISER_ARMOR))
		var/datum/perk/adaptive_exoskeleton/KA = stats.getPerk(PERK_KAISER_ARMOR)
		var/return_type = KA.armor[type] //Are we sure this is are strongest armor?
		if(KA.armor[type] < armor[type] && KA.armor[type] > 0) //If are armor is below zero then use that, as we are weakened by the Dawn Branch or Saints Of Wax Branch
			return_type = armor[type]  //Seems are base armoe is better, use that.
		KA.cap_check()
		return return_type
	return armor[type]

/mob/living/carbon/superior/roach/kaiser/bullet_act(obj/item/projectile/proj)

	if(stats.getPerk(PERK_KAISER_ARMOR))
		var/datum/perk/adaptive_exoskeleton/KA = stats.getPerk(PERK_KAISER_ARMOR)
		if(istype(proj,/obj/item/projectile/beam) || istype(proj,/obj/item/projectile/ion) || istype(proj,/obj/item/projectile/plasma))
			if (!proj.testing)
				KA.armor[ARMOR_ENERGY] += proj.force * 0.001
		else
			if (!proj.testing)
				KA.armor[ARMOR_BULLET] += proj.force * 0.001

		if(istype(proj,/obj/item/projectile/plasma/super_light))
			var/obj/item/projectile/plasma/super_light/seal = proj
			if(findtext(seal.shot_from, "waxworks rapier")) //Most arcana tag type to ever exists
				//Aim for the heart!
				KA.armor[ARMOR_ENERGY] -= 5 + (proj.force * 0.001)
	..()

/mob/living/carbon/superior/roach/kaiser/standard_weapon_hit_effects(obj/item/I, mob/living/user, var/effective_force, var/hit_zone)
	if(..())
		if(stats.getPerk(PERK_KAISER_ARMOR))
			var/datum/perk/adaptive_exoskeleton/KA = stats.getPerk(PERK_KAISER_ARMOR)
			KA.armor[ARMOR_MELEE] += effective_force * 0.01
			//Weapons designed to fight the night untill dawn breaks
			if(istype(I, /obj/item/gun/matter/seal) \
			|| istype(I, /obj/item/tool/sword/midday) \
			|| istype(I, /obj/item/tool/sword/sun_set) \
			|| istype(I, /obj/item/tool/sword/dawn))
				KA.armor[ARMOR_MELEE] -= 0.5 + (effective_force * 0.01) //Undo what we added and then subtract a further amount

/mob/living/carbon/superior/roach/kaiser/react_to_attack(var/mob/living/carbon/superior/source = src, var/obj/item/attacked_with, var/atom/attacker, params)
	..()
	if(attacked_with && (isprojectile(attacked_with)))
		var/obj/item/projectile/Proj = attacked_with
		if(!Proj.testing)
			if(Proj.silenced && prob(80)) //Gives silenced weapons more use
				return
			if(isliving(attacker))
				var/mob/living/L = attacker
				if(L.faction == faction || L.faction=="sproachder")
					if(!L.stats.getPerk(PERK_ROACH_ADHERENCE))
						say(pick(",o Misstake?", ",o Adherence, Propriety?", ",o Traitor?"))
						L.stats.addPerk(PERK_ROACH_ADHERENCE)
						return
					var/datum/perk/cooldown/roach_adherence/RA = L.stats.getPerk(PERK_ROACH_ADHERENCE)
					RA.warnings += 1
					if(RA.warnings <= 2)
						say(pick(",o Stop, Before, To, Late.", ",o Warning.", ",o Begone, Flee."))
					if(RA.warnings == 3)
						say(pick(",o Scour every corner, swarm every height, and take flight for [L.real_name] is a traitor! Feast. Indulgence. Rend Their Flesh!"))

	if(isliving(attacker))
		var/mob/living/L = attacker
		if(L.faction == faction || L.faction=="sproachder")
			if(!L.stats.getPerk(PERK_ROACH_ADHERENCE))
				say(pick(",o Misstake?", ",o Adherence, Propriety?", ",o Traitor?"))
				L.stats.addPerk(PERK_ROACH_ADHERENCE)
				return
			var/datum/perk/cooldown/roach_adherence/RA = L.stats.getPerk(PERK_ROACH_ADHERENCE)
			RA.warnings += 1
			if(RA.warnings <= 2)
				say(pick(",o Stop, Before, To, Late.", ",o Warning.", ",o Begone, Flee."))
			if(RA.warnings == 3)
				say(pick(",o Scour every corner, swarm every height, and take flight for [L.real_name] is a traitor! Feast. Indulgence. Rend Their Flesh!"))
	return


