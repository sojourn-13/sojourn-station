
/obj/item/device/ano_scanner
	name = "Alden-Saraspova counter"
	desc = "Aids in triangulation of exotic particles."
	icon = 'icons/obj/device.dmi'
	icon_state = "ano_scanner"
	item_state = "lampgreen"
	w_class = ITEM_SIZE_SMALL
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_STEEL = 5, MATERIAL_GLASS = 5)
	var/nearest_artifact_id = "unknown"
	var/nearest_artifact_distance = -1
	var/last_scan_time = 0
	var/scan_delay = 25
	matter = list(MATERIAL_STEEL = 1, MATERIAL_GLASS = 1)

/obj/item/device/ano_scanner/Initialize()
	. = ..()
	scan()

/obj/item/device/ano_scanner/afterattack(var/atom/target, mob/user as mob)
	if (istype(target, /obj/effect/portal))
		var/obj/effect/portal/P = target
		if (P.failchance)
			to_chat(user, SPAN_NOTICE("This aperture has approximately [100-P.failchance]% stability."))
		else
			to_chat(user, SPAN_NOTICE("This aperture appears to be stable and safe."))

		var/time_existed = world.time - P.birthtime
		var/time_remaining = P.lifetime - time_existed
		to_chat(user, SPAN_NOTICE("It should remain open for approximately another [time2text(time_remaining, "hh hours and mm minutes")]"))

/obj/item/device/ano_scanner/attack_self(var/mob/user as mob)
	return src.interact(user)

/obj/item/device/ano_scanner/interact(var/mob/user as mob)
	if(world.time - last_scan_time >= scan_delay)
		spawn(0)
			icon_state = "ano_scanner2"
			scan()

			if(!user) return

			if(nearest_artifact_distance >= 0)
				to_chat(user, "Exotic energy detected on wavelength '[nearest_artifact_id]' in a radius of [nearest_artifact_distance]m")
			else
				to_chat(user, "Background radiation levels detected.")
	else
		to_chat(user, "Scanning array is recharging.")
	spawn(25)
		icon_state = "ano_scanner"

/obj/item/device/ano_scanner/proc/scan()
	set background = 1

	nearest_artifact_distance = -1

	var/turf/cur_turf = get_turf(src)
	if(!cur_turf)
		return

	last_scan_time = world.time

	for(var/turf/simulated/mineral/T in SSxenoarch.artifact_spawning_turfs)
		if(T.artifact_find)
			if(T.z == cur_turf.z)
				var/cur_dist = get_dist(cur_turf, T) * 2
				if( (nearest_artifact_distance < 0 || cur_dist < nearest_artifact_distance) && cur_dist <= T.artifact_find.artifact_detect_range )
					nearest_artifact_distance = cur_dist + rand() * 2 - 1
					nearest_artifact_id = T.artifact_find.artifact_id
		else
			SSxenoarch.artifact_spawning_turfs.Remove(T)
	cur_turf.visible_message("<span class='info'>[src] clicks.</span>")


//Putting these here because they an be found through digging in anomalies later on. Plus I can't be arsed to make new files for single devices.
/obj/item/biosyphon
	name = "Bluespace Biosyphon"
	desc = "A bluespace object duplicator. I wonder what it makes?"
	icon = 'icons/obj/device.dmi'
	icon_state = "biosyphon"
	item_state = "biosyphon"
	w_class = ITEM_SIZE_BULKY
	flags = CONDUCT
	throwforce = WEAPON_FORCE_PAINFUL
	throw_speed = 1
	throw_range = 2
	price_tag = 20000
	origin_tech = list(TECH_MATERIAL = 4, TECH_BLUESPACE = 9, TECH_POWER = 7)
	matter = list(MATERIAL_PLASTIC = 6, MATERIAL_GLASS = 7)
	var/last_produce = 0
	var/cooldown = 15 MINUTES

/obj/item/biosyphon/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/biosyphon/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/biosyphon/Process()
	if(world.time >= (last_produce + cooldown))
		var/obj/item/weapon/storage/box/donut/D = new /obj/item/weapon/storage/box/donut(get_turf(src))
		visible_message(SPAN_NOTICE("[name] drop [D]."))
		last_produce = world.time


/obj/item/device/von_krabin
	name = "Von-Krabin Stimulator"
	desc = "Some kind of anomaly that can be awkwardly worn."
	icon = 'icons/obj/device.dmi'
	icon_state = "von-krabin"
	item_state = "von-krabin"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 1
	throw_range = 5
	price_tag = 20000
	w_class = ITEM_SIZE_NORMAL
	origin_tech = list(TECH_BIO = 9, TECH_MAGNET = 9)

	var/active = FALSE
	var/area_radius = 7

	var/buff_power = 25

	var/stats_buff = list(STAT_BIO, STAT_COG, STAT_MEC)
	var/list/mob/living/carbon/human/currently_affected = list()

/obj/item/device/von_krabin/Destroy()
	STOP_PROCESSING(SSobj, src)
	check_for_faithful(list())
	..()

/obj/item/device/von_krabin/attack_self()
	if(active)
		active = FALSE
		STOP_PROCESSING(SSobj, src)
		check_for_faithful(list())
	else
		active = TRUE
		START_PROCESSING(SSobj, src)
	return

/obj/item/device/von_krabin/Process()
	..()
	if(!active)
		return
	var/list/mob/living/carbon/human/affected = range(area_radius, src)
	check_for_faithful(affected)
	update_icon()

/obj/item/device/von_krabin/proc/check_for_faithful(list/affected)
	var/got_follower = FALSE
	var/list/mob/living/carbon/human/no_longer_affected = currently_affected - affected
	currently_affected -= no_longer_affected
	for(var/mob/living/carbon/human/H in no_longer_affected)
		for(var/stat in stats_buff)
			H.stats.removeTempStat(stat, "von_krabin")
			to_chat(H, SPAN_NOTICE("Your knowledge of [stat] slightly decreases once you leave the von krabin's influence."))
	for(var/mob/living/carbon/human/mob in affected)
		if(stats_buff)
			var/message
			for(var/stat in stats_buff)
				var/datum/stat_mod/SM = mob.stats.getTempStat(stat, "von_krabin")
				if(!SM)
					message = "A wave of dizziness washes over you, and your mind is filled with a sudden insight into [stat]."
					mob.stats.addTempStat(stat, buff_power, 20 MINUTES, "von_krabin")
				else if(SM.time < world.time + 10 MINUTES) // less than 10 minutes of buff duration left
					message = "Your knowledge of [stat] feels renewed."
					mob.stats.removeTempStat(stat, "von_krabin")
					mob.stats.addTempStat(stat, buff_power, 20 MINUTES, "von_krabin")
				if(message)
					to_chat(mob, SPAN_NOTICE(message))
		got_follower = TRUE
	currently_affected = affected
	return got_follower


/obj/item/weapon/reagent_containers/enricher
	name = "Molitor-Riedel Enricher"
	desc = "An extremely rare technology often said to be an anomaly in nature. It can create synthetic blood using nutriment."
	icon = 'icons/obj/device.dmi'
	icon_state = "enricher"
	item_state = "enricher"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30,60,120,200)
	volume = 200
	w_class = ITEM_SIZE_HUGE
	reagent_flags = OPENCONTAINER
	price_tag = 20000
	origin_tech = list(TECH_BIO = 9, TECH_MATERIAL = 9, TECH_PLASMA = 3)
	unacidable = TRUE //glass doesn't dissolve in acid
	matter = list(MATERIAL_GLASS = 3, MATERIAL_STEEL = 2, MATERIAL_PLASMA = 5, MATERIAL_BIOMATTER = 50)
	var/blood_amount = 0

/obj/item/weapon/reagent_containers/enricher/attack_self()
	if(reagents.total_volume)
		for(var/datum/reagent/reagent in reagents.reagent_list)
			var/reagent_amount = 0
			if(istype(reagent, /datum/reagent/organic/nutriment))
				var/datum/reagent/organic/nutriment/N = reagent
				reagent_amount = N.volume
				N.remove_self(reagent_amount)
				blood_amount += reagent_amount
			else
				reagent_amount = reagent.volume
				reagent.remove_self(reagent_amount) //Purge useless reagents out

		if(blood_amount)
			var/obj/item/weapon/reagent_containers/blood/empty/blood_pack = new /obj/item/weapon/reagent_containers/blood/empty(get_turf(src))
			blood_pack.reagents.add_reagent("blood", blood_amount, list("donor"=null,"viruses"=null,"blood_DNA"=null,"blood_type"="O-","resistances"=null,"trace_chem"=null))
			blood_amount = 0
			visible_message(SPAN_NOTICE("[src] drop [blood_pack]."))
		else
			visible_message("\The [src] beeps, \"Not enough nutriment to produce blood.\".")
	else
		visible_message("\The [src] beeps, \"Insufficient reagents to produce blood.\".")

/obj/item/weapon/reagent_containers/enricher/pre_attack(atom/A, mob/user, params)
	if(user.a_intent == I_HURT)
		if(standard_splash_mob(user, A))
			return TRUE
		if(is_drainable() && reagents.total_volume)
			if(istype(A, /obj/structure/sink))
				to_chat(user, SPAN_NOTICE("You pour the solution into [A]."))
				reagents.remove_any(reagents.total_volume)
			else
				playsound(src,'sound/effects/Splash_Small_01_mono.ogg',50,1)
				to_chat(user, SPAN_NOTICE("You splash the solution onto [A]."))
				reagents.splash(A, reagents.total_volume)
			return TRUE
	return ..()

/obj/item/weapon/reagent_containers/enricher/afterattack(var/obj/target, var/mob/user, var/flag)
	if(!flag)
		return
	if(standard_pour_into(user, target))
		return TRUE
	if(standard_dispenser_refill(user, target))
		return TRUE