
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
	name = "Biosiphon Anomaly"
	desc = "An exceedingly rare bluespace anomaly discovered by a marshal ranger outside the colony. After weeks of study it was discovered its only purpose was duplicating boxes of donuts. \
	Soteria's disappointment was so great they gave the item to security for safe keeping."
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
	var/cooldown = 30 MINUTES

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
	desc = "A strange anomalous item given to the research directors of the soteria as its latent effects enhance the mind. Some say this is an unfinished prototype of the technology the church of \
	absolute uses to enhance the abilities of others."
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

	var/buff_power = 5

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

/obj/item/device/techno_tribalism
	name = "Artificer Perfection Cube"
	desc = "An anomalous item found by the artificer guild and repurposed for use as an oddity creator. Strange, not quite understood, and extremely valuable. Feeding tools, tool mods, and certain \
	tech items to it will repurpose them."
	icon = 'icons/obj/device.dmi'
	icon_state = "techno_tribalism"
	item_state = "techno_tribalism"
	origin_tech = list(TECH_MATERIAL = 8, TECH_ENGINEERING = 7, TECH_POWER = 2)
	price_tag = 20000
	var/list/oddity_stats = list(STAT_MEC = 0, STAT_COG = 0, STAT_BIO = 0, STAT_ROB = 0, STAT_TGH = 0, STAT_VIG = 0)
	var/last_produce = -30 MINUTES
	var/items_count = 0
	var/max_count = 5
	var/cooldown = 30 MINUTES

/obj/item/device/techno_tribalism/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(items_count < max_count)
		if(istype(W, /obj/item/weapon/tool))

			if(W.tool_qualities)

				for(var/quality in W.tool_qualities)

					if(W.tool_qualities[quality] >= 35)
						var/stat_cost = round(W.tool_qualities[quality] / 15)

						if(quality == QUALITY_BOLT_TURNING)
							oddity_stats[STAT_COG] += stat_cost

						else if (quality == QUALITY_PULSING)
							oddity_stats[STAT_MEC] += stat_cost

						else if (quality == QUALITY_PRYING)
							oddity_stats[STAT_ROB] += stat_cost

						else if (quality == QUALITY_WELDING)
							oddity_stats[STAT_VIG] += stat_cost

						else if (quality == QUALITY_SCREW_DRIVING)
							oddity_stats[STAT_COG] += stat_cost

						else if (quality == QUALITY_WIRE_CUTTING)
							oddity_stats[STAT_VIG] += stat_cost

						else if (quality == QUALITY_CLAMPING)
							oddity_stats[STAT_BIO] += stat_cost

						else if (quality == QUALITY_CAUTERIZING)
							oddity_stats[STAT_BIO] += stat_cost

						else if (quality == QUALITY_RETRACTING)
							oddity_stats[STAT_BIO] += stat_cost

						else if (quality == QUALITY_DRILLING)
							oddity_stats[STAT_TGH] += stat_cost

						else if (quality == QUALITY_HAMMERING)
							oddity_stats[STAT_ROB] += stat_cost

						else if (quality == QUALITY_SAWING)
							oddity_stats[STAT_VIG] += stat_cost

						else if (quality == QUALITY_BONE_SETTING)
							oddity_stats[STAT_BIO] += stat_cost

						else if (quality == QUALITY_SHOVELING)
							oddity_stats[STAT_TGH] += stat_cost

						else if (quality == QUALITY_DIGGING)
							oddity_stats[STAT_ROB] += stat_cost

						else if (quality == QUALITY_EXCAVATION)
							oddity_stats[STAT_TGH] += stat_cost

						else if (quality == QUALITY_CUTTING)
							oddity_stats[STAT_COG] += stat_cost

						else if (quality == QUALITY_LASER_CUTTING)
							oddity_stats[STAT_VIG] += stat_cost

						else if (quality == QUALITY_ADHESIVE)
							oddity_stats[STAT_MEC] += stat_cost

						else if (quality == QUALITY_SEALING)
							oddity_stats[STAT_MEC] += stat_cost

					else
						to_chat(user, SPAN_WARNING("The [W] is not suitable for [src]!"))
						return


		else if(istype(W, /obj/item/weapon/tool_upgrade))

			var/obj/item/weapon/tool_upgrade/T = W

			if(istype(T, /obj/item/weapon/tool_upgrade/reinforcement))
				oddity_stats[STAT_TGH] += 3

			else if(istype(T, /obj/item/weapon/tool_upgrade/productivity))
				oddity_stats[STAT_COG] += 3

			else if(istype(T, /obj/item/weapon/tool_upgrade/refinement))
				oddity_stats[STAT_VIG] += 3

			else if(istype(T, /obj/item/weapon/tool_upgrade/augment))
				oddity_stats[STAT_BIO] += 3


		else if(istype(W, /obj/item/weapon/cell))
			if(istype(W, /obj/item/weapon/cell/small/moebius/nuclear))
				oddity_stats[STAT_ROB] += 2

			else if(istype(W, /obj/item/weapon/cell/medium/moebius/nuclear))
				oddity_stats[STAT_ROB] += 3

			else if(istype(W, /obj/item/weapon/cell/large/moebius/nuclear))
				oddity_stats[STAT_ROB] += 4

			else
				oddity_stats[STAT_ROB] += 1

		else if(istype(W, /obj/item/weapon/gun))
			oddity_stats[STAT_ROB] += 2
			oddity_stats[STAT_VIG] += 2

		else
			to_chat(user, SPAN_WARNING("The [W] is not suitable for [src]!"))
			return

		to_chat(user, SPAN_NOTICE("You feed [W] to [src]."))
		items_count += 1
		qdel(W)

	else
		to_chat(user, SPAN_WARNING("The [src] is full!"))
		return

/obj/item/device/techno_tribalism/attack_self()
	if(world.time >= (last_produce + cooldown))
		if(items_count >= max_count)
			if(istype(src.loc, /mob/living/carbon/human))
				var/mob/living/carbon/human/user = src.loc
				var/obj/item/weapon/oddity/techno/T = new /obj/item/weapon/oddity/techno(src)
				T.oddity_stats = src.oddity_stats
				T.AddComponent(/datum/component/inspiration, T.oddity_stats)
				items_count = 0
				oddity_stats = list(STAT_MEC = 0, STAT_COG = 0, STAT_BIO = 0, STAT_ROB = 0, STAT_TGH = 0, STAT_VIG = 0)
				last_produce = world.time
				user.put_in_hands(T)
			else
				to_chat(src.loc, SPAN_WARNING("The [src] is too complicated to use!"))
		else
			visible_message("\The [src] beeps, \"The [src] is not full enough to produce.\".")
	else
		visible_message("\The [src] beeps, \"The [src] need time to cooldown.\".")

/obj/item/device/techno_tribalism/examine(user)
	..()
	to_chat(user, SPAN_NOTICE("The [src] is feeded by [items_count]/[max_count]."))

/obj/item/weapon/maneki_neko
	name = "Ancient Maneki Neko"
	icon = 'icons/obj/device.dmi'
	icon_state = "maneki_neko"
	item_state = "maneki_neko"
	desc = "An oddity that costs quite alot of money, it feels like its watching you. Creepy."
	flags = CONDUCT
	force = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_SMALL
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 3
	throw_range = 15
	price_tag = 20000
	origin_tech = list(TECH_MATERIAL = 10)
	matter = list(MATERIAL_GLASS = 5, MATERIAL_GOLD = 7, MATERIAL_SILVER = 5, MATERIAL_DIAMOND = 1)
	var/list/mob/living/carbon/human/followers = list()

/obj/item/weapon/maneki_neko/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(!istype(src.loc, /obj/item/weapon/storage/bsdm))
		destroy_lifes()
	..()
/obj/item/weapon/maneki_neko/New()
	START_PROCESSING(SSobj, src)
	..()

/obj/item/weapon/maneki_neko/Process()
	..()
	var/list/mob/living/carbon/human/affected = oviewers(src)
	followers |= affected

/obj/item/weapon/maneki_neko/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(QUALITY_HAMMERING in W.tool_qualities)
		if(W.use_tool(user, src, WORKTIME_INSTANT, QUALITY_HAMMERING, FAILCHANCE_EASY, required_stat = STAT_ROB))
			playsound(src, "shatter", 70, 1)
			new /obj/item/clothing/head/costume/animal/kitty(get_turf(src))
			qdel(src)

/obj/item/weapon/reagent_containers/enricher/afterattack(var/obj/target, var/mob/user, var/flag)
	if(user.a_intent == I_HURT)
		playsound(src, "shatter", 70, 1)
		new /obj/item/clothing/head/costume/animal/kitty(get_turf(src))
		qdel(src)

/obj/item/weapon/maneki_neko/throw_impact(atom/hit_atom)
	..()
	playsound(src, "shatter", 70, 1)
	new /obj/item/clothing/head/costume/animal/kitty(get_turf(src))
	qdel(src)

/obj/item/weapon/maneki_neko/proc/destroy_lifes()
	for(var/mob/living/carbon/human/H in followers)

		for(var/stat in ALL_STATS)
			H.stats.changeStat(stat, -10)
		var/neko = uppertext(src.name)
		to_chat(H, SPAN_DANGER(pick("LIFE IS RUINED FOR ME! I CANNOT FIND [neko]!", "WHO STOLE MY [neko]!", "WHERE IS [neko]?!", "WHY I CANNOT FIND [neko]?!")))

/obj/item/weapon/tool/sword/crusader/nt_sword
	name = "Joyeuse"
	desc = "A sword made out of an unknown alloy, humming from an unknown power source."
	icon = 'icons/obj/device.dmi'
	icon_state = "nt_sword"
	item_state = "nt_sword"
	slot_flags = FALSE
	origin_tech = list(TECH_COMBAT = 9, TECH_POWER = 9, TECH_MATERIAL = 9)
	price_tag = 20000
	var/flash_cooldown = 1 MINUTES
	var/last_use = 0

/obj/item/weapon/tool/sword/crusader/nt_sword/wield(mob/living/user)
	..()
	set_light(l_range = 4, l_power = 3)

/obj/item/weapon/tool/sword/crusader/nt_sword/unwield(mob/living/user)
	..()
	set_light(l_range = 0, l_power = 0)

/obj/item/weapon/tool/sword/crusader/nt_sword/attack_self(mob/user)
	if(isBroken)
		to_chat(user, SPAN_WARNING("\The [src] is broken."))
		return
	if(!wielded)
		to_chat(user, SPAN_WARNING("You cannot use [src] special ability with one hand!"))
		return
	if(world.time <= last_use + flash_cooldown)
		to_chat(user, SPAN_WARNING("[src] still charging!"))
		return
	if(!do_after(user, 2.5 SECONDS))
		to_chat(src, SPAN_DANGER("You was interrupted!"))
		return

	for(var/obj/structure/closet/L in hear(7, get_turf(src)))
		if(locate(/mob/living/carbon/, L))
			for(var/mob/living/carbon/M in L)
				var/obj/item/weapon/implant/core_implant/I = M.get_core_implant(/obj/item/weapon/implant/core_implant/cruciform)
				if(I && I.active && I.wearer)
					continue
				bang(get_turf(src), M)


	for(var/mob/living/carbon/M in hear(7, get_turf(src)))
		var/obj/item/weapon/implant/core_implant/I = M.get_core_implant(/obj/item/weapon/implant/core_implant/cruciform)
		if(I && I.active && I.wearer)
			continue
		bang(get_turf(src), M)

	for(var/obj/effect/blob/B in hear(8,get_turf(src)))       		//Blob damage here
		var/damage = round(30/(get_dist(B,get_turf(src))+1))
		B.health -= damage
		B.update_icon()

	new/obj/effect/sparks(loc)
	new/obj/effect/effect/smoke/illumination(loc, brightness=15)
	last_use = world.time
	return

/obj/item/weapon/tool/sword/crusader/nt_sword/proc/bang(var/turf/T , var/mob/living/carbon/M)					// Added a new proc called 'bang' that takes a location and a person to be banged.
	to_chat(M, SPAN_DANGER(pick("HOLY LIGHT!", "GOD HAVE MERCY!", "HOLY HAVEN!", "YOU SEE THE LIGHT!")))								// Called during the loop that bangs people in lockers/containers and when banging
	playsound(loc, 'sound/effects/bang.ogg', 50, 1, 5)		// people in normal view.  Could theroetically be called during other explosions.
																// -- Polymorph

//Checking for protections
	var/eye_safety = 0
	var/ear_safety = 0
	if(iscarbon(M))
		eye_safety = M.eyecheck()
		if(ishuman(M))
			if(istype(M:l_ear, /obj/item/clothing/ears/earmuffs) || istype(M:r_ear, /obj/item/clothing/ears/earmuffs))
				ear_safety += 2
			if(HULK in M.mutations)
				ear_safety += 1
			if(istype(M:head, /obj/item/clothing/head/helmet))
				ear_safety += 1

//Flashing everyone
	if(eye_safety < FLASH_PROTECTION_MODERATE)
		if (M.HUDtech.Find("flash"))
			flick("e_flash", M.HUDtech["flash"])
		M.Stun(2)
		M.Weaken(10)



//Now applying sound
	if((get_dist(M, T) <= 2 || loc == M.loc || loc == M))
		if(ear_safety > 0)
			M.Stun(2)
			M.Weaken(1)
		else
			M.Stun(10)
			M.Weaken(3)
			if ((prob(14) || (M == loc && prob(70))))
				M.ear_damage += rand(1, 10)
			else
				M.ear_damage += rand(0, 5)
				M.ear_deaf = max(M.ear_deaf,15)

	else if(get_dist(M, T) <= 5)
		if(!ear_safety)
			M.Stun(8)
			M.ear_damage += rand(0, 3)
			M.ear_deaf = max(M.ear_deaf,10)

	else if(!ear_safety)
		M.Stun(4)
		M.ear_damage += rand(0, 1)
		M.ear_deaf = max(M.ear_deaf,5)

	//This really should be in mob not every check
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		var/obj/item/organ/internal/eyes/E = H.internal_organs_by_name[BP_EYES]
		if (E && E.damage >= E.min_bruised_damage)
			to_chat(M, SPAN_DANGER("Your eyes start to burn badly!"))
	if (M.ear_damage >= 15)
		to_chat(M, SPAN_DANGER("Your ears start to ring badly!"))
	else
		if (M.ear_damage >= 5)
			to_chat(M, SPAN_DANGER("Your ears start to ring!"))
	M.update_icons()

/obj/structure/nt_pedestal
	name = "Pedestal of the Joyeuse"
	desc = "Pedestal of the glorious weapon named: \"Joyeuse\"."
	icon = 'icons/obj/device.dmi'
	icon_state = "nt_pedestal0"
	anchored = TRUE
	density = TRUE
	breakable = FALSE
	var/obj/item/weapon/tool/sword/crusader/nt_sword/sword = null

/obj/structure/nt_pedestal/New(var/loc, var/turf/anchor)
	..()
	sword = new /obj/item/weapon/tool/sword/crusader/nt_sword(src)
	update_icon()

/obj/structure/nt_pedestal/attackby(obj/item/I, mob/user)
	if(I.has_quality(QUALITY_BOLT_TURNING))
		if(!anchored)
			if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You've secured the [src] assembly!"))
				anchored = TRUE
		else if(anchored)
			if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, QUALITY_BOLT_TURNING, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You've unsecured the [src] assembly!"))
				anchored = FALSE
	if(istype(I, /obj/item/weapon/tool/sword/crusader/nt_sword))
		if(sword)
			to_chat(user, SPAN_WARNING("[src] already has a sword in it!"))
		insert_item(I, user)
		sword = I
		update_icon()
		visible_message(SPAN_NOTICE("[user] placed [sword] into [src]."))

/obj/structure/nt_pedestal/attack_hand(mob/user)
	..()
	if(sword && istype(user, /mob/living/carbon))
		var/mob/living/carbon/H = user
		var/obj/item/weapon/implant/core_implant/I = H.get_core_implant(/obj/item/weapon/implant/core_implant/cruciform)
		if(I && I.active && I.wearer)
			H.put_in_hands(sword)
			visible_message(SPAN_NOTICE("[user] removed [sword] from the [src]."))
			sword = null
			update_icon()
			return

		visible_message(SPAN_WARNING("[user] is trying to remove [sword] from the [src]!"))
		if(!do_after(user, 30 SECONDS))
			to_chat(src, SPAN_DANGER("You were interrupted!"))
			return
		if(H.stats.getStat(STAT_ROB) >= 60)
			H.put_in_hands(sword)
			visible_message(SPAN_DANGER("[user] succsesufully removed [sword] from the [src]!"))
			sword = null
			update_icon()
		else
			visible_message(SPAN_WARNING("[user] failed to remove [sword] from the [src]"))

/obj/structure/nt_pedestal/update_icon()
	icon_state = "nt_pedestal[sword?"1":"0"]"

/obj/item/weapon/storage/pouch/nt_sheath
	name = "Joyeuse sheath"
	desc = "Can hold a Sword of Truth."
	icon = 'icons/obj/device.dmi'
	icon_state = "nt_sheath0"
	item_state = "nt_sheath0"
	slot_flags = SLOT_BELT
	price_tag = 1000
	storage_slots = 1
	max_w_class = ITEM_SIZE_BULKY

	can_hold = list(
		/obj/item/weapon/tool/sword/crusader/nt_sword
		)

	sliding_behavior = TRUE

/obj/item/weapon/storage/pouch/nt_sheath/update_icon()
	icon_state = "nt_sheath[contents.len?"1":"0"]"
	item_state = "nt_sheath[contents.len?"1":"0"]"
	..()

/obj/item/weapon/reagent_containers/atomic_distillery
	name = "Atomic Distillery"
	desc = "An anomalous item supposedly powered by radiation, it produces the most powerful booze on the colony!"
	icon = 'icons/obj/device.dmi'
	icon_state = "atomic_distillery"
	item_state = "atomic_distillery"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30,60,120,200,250,300,400,500)
	volume = 500
	w_class = ITEM_SIZE_HUGE
	reagent_flags = OPENCONTAINER
	slot_flags = SLOT_BELT
	price_tag = 20000
	origin_tech = list(TECH_BIO = 9, TECH_MATERIAL = 9, TECH_PLASMA = 3)
	unacidable = TRUE

/obj/item/weapon/reagent_containers/atomic_distillery/New()
	..()
	START_PROCESSING(SSobj, src)

/obj/item/weapon/reagent_containers/atomic_distillery/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()

/obj/item/weapon/reagent_containers/atomic_distillery/Process()
	reagents.add_reagent("atomvodka", 1)

/obj/item/weapon/reagent_containers/atomic_distillery/pre_attack(atom/A, mob/user, params)
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

/obj/item/weapon/reagent_containers/atomic_distillery/afterattack(var/obj/target, var/mob/user, var/flag)
	if(!flag)
		return
	if(standard_pour_into(user, target))
		return TRUE
	if(standard_dispenser_refill(user, target))
		return TRUE