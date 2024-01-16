GLOBAL_VAR_INIT(miracle_points, 0)
var/global/obj/machinery/power/eotp/eotp

/obj/machinery/power/eotp
	name = "Will of the Protector"
	desc = "A specialized obelisk designed to supply the surface church with absolutist design disks and blessings from the lower temples. By making offerings of supplies or materials readily produced \
	by the church, disciples can obtain disks and other goods. The obelisk also provides various blessings and monitors areas protected by obelisks for potential threats to the colony, marked by its \
	observation level, letting it warn primes and vectors ahead of time. Additionally, it passively gains power before unleashing various blessings to followers."
	icon = 'icons/obj/eotp.dmi'
	icon_state = "wotp"

	density = TRUE
	anchored = TRUE
	layer = 5

	use_power = IDLE_POWER_USE
	idle_power_usage = 30
	active_power_usage = 2500

	var/list/rewards = list(ALERT, INSPIRATION, STAT_BUFF, ENERGY_REWARD)
	var/list/current_rewards

	var/list/materials = list(/obj/item/stack/material/gold = 20,
							/obj/item/stack/material/uranium = 10,
							/obj/item/stack/material/plasma = 10,
							/obj/item/stack/material/diamond = 5,
							/obj/item/stack/material/plasteel = 30,
							/obj/item/stack/material/silver = 20)


	var/list/mob/living/carbon/human/scanned = list()
	var/max_power = 100
	var/power = 0
	var/power_gaine = 5
	var/max_observation = 800
	var/observation = 0
	var/min_observation = -100

	var/stat_buff_power = 10

	var/power_cooldown = 1 MINUTES
	var/last_power_update = 0
	var/rescan_cooldown = 10 MINUTES
	var/last_rescan = 0
	var/list/armaments = list()
	var/armaments_points = 0
	var/max_armaments_points = 100
	var/armaments_rate = 10
	var/static/list/unneeded_armaments = list(/datum/armament/item, /datum/armament/item/disk)

/obj/machinery/power/eotp/New()
	..()
	eotp = src
	var/list/arm_paths = subtypesof(/datum/armament) - unneeded_armaments
	for(var/arm in arm_paths)
		armaments += new arm



/obj/machinery/power/eotp/examine(user)
	..()

	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		var/obj/item/implant/core_implant/I = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
		if(I && I.active && I.wearer)
			var/comment = "Power level: [power]/[max_power]."
			comment += "\nObservation level: [observation]/[max_observation]."
			comment += "\nArmament level: [armaments_points]/[max_armaments_points]"
			to_chat(user, SPAN_NOTICE(comment))

/obj/machinery/power/eotp/Process()
	..()
	if(stat)
		return

	updateObservation()

	if(world.time >= (last_rescan + rescan_cooldown) && length(scanned))
		var/mob/living/carbon/human/H = pick(scanned)
		if(!H)
			scanned.Remove(H)
			eotp.removeObservation(10)
			last_rescan = world.time
			updatePower()
			return
		var/obj/item/implant/core_implant/I = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
		if(I && I.active && I.wearer)
			eotp.removeObservation(20)
		else if(is_carrion(H))
			eotp.addObservation(20)
		else
			eotp.removeObservation(10)

		scanned.Remove(H)
		last_rescan = world.time

	updatePower()

/obj/machinery/power/eotp/proc/addObservation(var/number)
	observation += number
	return observation

/obj/machinery/power/eotp/proc/removeObservation(var/number)
	observation -= number
	return observation

/obj/machinery/power/eotp/proc/updateObservation()
	if(observation > max_observation)
		observation = max_observation

	if(observation < min_observation)
		observation = min_observation

/obj/machinery/power/eotp/proc/updatePower()
	power_gaine = initial(power_gaine) + (observation / 100)

	if(world.time >= (last_power_update + power_cooldown))
		power += power_gaine
		last_power_update = world.time

	if(power >= max_power)
		power -= max_power
		power_release()

/obj/machinery/power/eotp/proc/power_release()
	var/type_release
	if(current_rewards)
		type_release = pick(current_rewards)
		current_rewards = null
	else
		type_release = pick(rewards)


	armaments_points = min(armaments_points + armaments_rate, max_armaments_points)


	if(type_release == ALERT)

		var/area/antagonist_area
		var/preacher

		for(var/datum/antagonist/A in GLOB.current_antags)
			if((A.id == ROLE_CARRION) ||(A.id == ROLE_BLITZ) || (A.id == ROLE_BORER))
				var/mob/living/L = A.owner.current
				if(!isghost(L))
					antagonist_area = get_area(L)
					break

		if(!antagonist_area)
			for(var/mob/living/carbon/human/H in disciples) //Gives less sanity but more damage heal than Inspiration, with a different message to make it distinct, so disciples know that the Will just did a scan and found nothing.
				if(H.sanity && prob(50))
					H.sanity.changeLevel(20)
					H.adjustOxyLoss(-50)
					H.adjustBruteLoss(-15)
					H.adjustFireLoss(-15)
					to_chat(H, SPAN_NOTICE("You feel a wave of certainty pass over you. Though things may seem grim, the darkness is not overwhelming. Your cruciform does some minor maintenance, patching any potential minor wounds across your body."))

		else
			for(var/mob/living/carbon/human/H in disciples)
				if(H.mind && istype(H.mind.assigned_job, /datum/job/chaplain))
					preacher = H

			if(!preacher && length(disciples))
				preacher = pick(disciples)

			if(preacher)
				to_chat(preacher, SPAN_DANGER("You feel a strange presence lurking in [antagonist_area].")) // will say 'you feel an evil presence lurking in the Kitchen' or whatever

	else if(type_release == INSPIRATION)
		for(var/mob/living/carbon/human/H in disciples)
			if(H.sanity && prob(50))
				H.sanity.breakdown(TRUE)
				H.adjustOxyLoss(-50)
				H.adjustBruteLoss(-10)
				H.adjustFireLoss(-10)
				to_chat(H, SPAN_NOTICE("You feel a wave of calm pass over you. The Absolute is watching over you. Your cruciform does a quick routine maintenance, patching some wounds across your body."))
/*
	else if(type_release == ODDITY)
		var/oddity_reward = pick(subtypesof(/obj/item/oddity/nt))
		var/obj/item/_item = new oddity_reward(get_turf(src))
		visible_message(SPAN_NOTICE("The [_item.name] appears out of bluespace near the [src]!"))
		rewards -= ODDITY
*/
	else if(type_release == STAT_BUFF)
		var/random_stat = pick(ALL_STATS_FOR_LEVEL_UP)
		for(var/mob/living/carbon/human/H in disciples)
			if(H.stats)
				to_chat(H, SPAN_NOTICE("You feel the blessing of the church upon you. You are enlightened, and gain deeper knowledge in [random_stat]; however, you can already feel this new-found knowledge is temporary."))
				H.stats.addTempStat(random_stat, stat_buff_power, 20 MINUTES, "Eye_of_the_Protector")
/*
	else if(type_release == MATERIAL_REWARD)
		var/materials_reward = pick(materials)
		//var/reward_min_amount = materials[materials_reward] - Soj Edit we use a pick system
		var/obj/item/stack/material/_item = new materials_reward(get_turf(src))
		//4 10s, 5 15s, 2 20s, were likely to get get lower then higher
		_item.amount = pick(10, 10, 10, 10, 15, 15, 15, 15, 15, 20, 20)
		visible_message(SPAN_NOTICE("The [_item.name] appears out of the base of the  [src]!"))
*/
	else if(type_release == ENERGY_REWARD)
		for(var/mob/living/carbon/human/H in disciples)
			var/obj/item/implant/core_implant/cruciform/C = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
			C.power_regen += initial(C.power_regen)
			to_chat(H, SPAN_NOTICE("Your cruciform vibrates, its power regeneration enhancing temporarily."))

	//for(var/disciple in disciples)
	//	to_chat(disciple, SPAN_NOTICE("A miracle has occured at the [src]! May the Angels live forever!"))

	GLOB.miracle_points++
