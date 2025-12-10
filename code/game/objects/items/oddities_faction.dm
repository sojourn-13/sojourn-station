//Oddities which are specific to factions or certain jobs.
/obj/item/biosyphon
	name = "Biosiphon Anomaly"
	desc = "An exceedingly rare bluespace anomaly discovered by a survey team outside the colony. After weeks of study it was determined its only purpose was duplicating boxes of donuts. Soteria's disappointment was so great they gave the item to security for safe keeping. Months after its discovery it began to create refined cases of incredibly tasty donuts filled with long-lasting effective stimulants every two hours."
	icon = 'icons/obj/device.dmi'
	icon_state = "biosyphon"
	item_state = "biosyphon"
	w_class = ITEM_SIZE_BULKY
	flags = CONDUCT
	throwforce = WEAPON_FORCE_PAINFUL
	throw_speed = 1
	throw_range = 2
	price_tag = 20000
	origin_tech = list(TECH_MATERIAL = 4, TECH_BIO = 13, TECH_POWER = 7) //high bio as it works on making donuts!
	matter = list(MATERIAL_PLASTIC = 6, MATERIAL_GLASS = 7)
	var/last_produce = 0
	var/cooldown = 30 MINUTES

/obj/item/biosyphon/New()
	..()
	GLOB.all_faction_items[src] = GLOB.department_security
	START_PROCESSING(SSobj, src)

/obj/item/biosyphon/Destroy()
	STOP_PROCESSING(SSobj, src)
	for(var/mob/living/carbon/human/H in viewers(get_turf(src)))
		LEGACY_SEND_SIGNAL(H, COMSIG_OBJ_FACTION_ITEM_DESTROY, src)
	GLOB.all_faction_items -= src
	GLOB.ironhammer_faction_item_loss++
	. = ..()

/obj/item/biosyphon/Process()
	if(world.time >= (last_produce + cooldown))
		var/obj/item/storage/case/donut/D = new /obj/item/storage/case/donut(get_turf(src))
		visible_message(SPAN_NOTICE("[name] drop [D]."))
		last_produce = world.time

/obj/item/biosyphon/attackby(obj/item/I, mob/living/user, params)
	if(nt_sword_attack(I, user))
		return
	..()

/obj/item/device/von_krabin
	name = "Von-Krabin Stimulator"
	desc = "A strange anomalous item given to the research directors of Soteria as its latent effects enhance the mind. Some say this is an unfinished prototype of the technology the church of the absolute uses to enhance the abilities of others."
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

	var/buff_power = 15 //Makes it viable to have around

	var/stats_buff = list(STAT_BIO, STAT_COG, STAT_MEC)
	var/list/mob/living/carbon/human/currently_affected = list()

/obj/item/device/von_krabin/New()
	..()
	GLOB.all_faction_items[src] = GLOB.department_moebius

/obj/item/device/von_krabin/Destroy()
	STOP_PROCESSING(SSobj, src)
	check_for_faithful(list())
	for(var/mob/living/carbon/human/H in viewers(get_turf(src)))
		LEGACY_SEND_SIGNAL(H, COMSIG_OBJ_FACTION_ITEM_DESTROY, src)
	GLOB.all_faction_items -= src
	GLOB.moebius_faction_item_loss++
	..()

/obj/item/device/von_krabin/attackby(obj/item/I, mob/user, params)
	if(nt_sword_attack(I, user))
		return FALSE
	..()

/obj/item/device/von_krabin/attack_self()
	if(active)
		STOP_PROCESSING(SSobj, src)
		check_for_faithful(list())
	else
		START_PROCESSING(SSobj, src)
	active = !active
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


/obj/item/reagent_containers/enricher
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

/obj/item/reagent_containers/enricher/New()
	..()
	GLOB.all_faction_items[src] = GLOB.department_moebius

/obj/item/reagent_containers/enricher/Destroy()
	for(var/mob/living/carbon/human/H in viewers(get_turf(src)))
		LEGACY_SEND_SIGNAL(H, COMSIG_OBJ_FACTION_ITEM_DESTROY, src)
	GLOB.all_faction_items -= src
	GLOB.moebius_faction_item_loss++
	..()

/obj/item/reagent_containers/enricher/attackby(obj/item/I, mob/living/user, params)
	if(nt_sword_attack(I, user))
		return FALSE
	..()

/obj/item/reagent_containers/enricher/attack_self()
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
			// Convert nutriment into nanoblood at a 2:1 ratio
			var/obj/item/reagent_containers/blood/empty/blood_pack = new /obj/item/reagent_containers/blood/empty(get_turf(src))
			var/nano_units = blood_amount / 2 //2:1 ratio to make it a bit more efficient
			// Add nanoblood reagent (drug)
			blood_pack.reagents.add_reagent("nanoblood", nano_units)
			blood_amount = 0
			visible_message(SPAN_NOTICE("[src] drop [blood_pack]."))
		else
			visible_message("\The [src] beeps, \"Not enough nutriment to produce blood.\".")
	else
		visible_message("\The [src] beeps, \"Insufficient reagents to produce blood.\".")

/obj/item/reagent_containers/enricher/pre_attack(atom/A, mob/user, params)
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

/obj/item/reagent_containers/enricher/afterattack(obj/target, mob/user, flag)
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
	var/list/oddity_stats = list(STAT_MEC = 0, STAT_COG = 0, STAT_BIO = 0, STAT_ROB = 0, STAT_TGH = 0, STAT_VIG = 0, STAT_VIV = 0, STAT_ANA = 0)
	var/last_produce = -30 MINUTES
	var/items_count = 0
/*
Z:/FloppyDisk/TRILBYMOD: //It had to be done.
Z:/FloppyDisk/TRILBYMOD: var/max_count = 5
Z:/FloppyDisk/TRILBYMOD: DEPLOY CUBE NERF
*/
	var/max_count = 3
/*
Trilby... Did you?
You tampered with my cube
You thought it too powerful no doubt. But Please...
No more of that.
*/
	var/cooldown = 30 MINUTES

/obj/item/device/techno_tribalism/New()
	..()
	GLOB.all_faction_items[src] = GLOB.department_engineering

/obj/item/device/techno_tribalism/Destroy()
	for(var/mob/living/carbon/human/H in viewers(get_turf(src)))
		LEGACY_SEND_SIGNAL(H, COMSIG_OBJ_FACTION_ITEM_DESTROY, src)
	GLOB.all_faction_items -= src
	GLOB.technomancer_faction_item_loss++
	..()

/obj/item/device/techno_tribalism/attackby(obj/item/W, mob/user, params)
	if(nt_sword_attack(W, user))
		return FALSE
	if(items_count < max_count)
		if(W in GLOB.all_faction_items)
			if(GLOB.all_faction_items[W] == GLOB.department_moebius)
				oddity_stats[STAT_COG] += 3
				oddity_stats[STAT_BIO] += 3
				oddity_stats[STAT_MEC] += 3
				oddity_stats[STAT_ANA] += 1
				oddity_stats[STAT_VIV] += 1
			else if(GLOB.all_faction_items[W] == GLOB.department_security)
				oddity_stats[STAT_VIG] += 3
				oddity_stats[STAT_TGH] += 3
				oddity_stats[STAT_ROB] += 3
				oddity_stats[STAT_ANA] += 1
				oddity_stats[STAT_VIV] += 1
			else if(GLOB.all_faction_items[W] == GLOB.department_church)
				oddity_stats[STAT_BIO] += 3
				oddity_stats[STAT_COG] += 2
				oddity_stats[STAT_VIG] += 2
				oddity_stats[STAT_TGH] += 2
				oddity_stats[STAT_ANA] += 1
				oddity_stats[STAT_VIV] += 1
			else if(GLOB.all_faction_items[W] == GLOB.department_guild)
				oddity_stats[STAT_COG] += 3
				oddity_stats[STAT_MEC] += 3
				oddity_stats[STAT_ROB] += 1
				oddity_stats[STAT_VIG] += 2
				oddity_stats[STAT_ANA] += 1
				oddity_stats[STAT_VIV] += 1
			else if(GLOB.all_faction_items[W] == GLOB.department_engineering)
				oddity_stats[STAT_MEC] += 5
				oddity_stats[STAT_COG] += 2
				oddity_stats[STAT_TGH] += 1
				oddity_stats[STAT_VIG] += 1
				oddity_stats[STAT_ANA] += 1
				oddity_stats[STAT_VIV] += 1
			else if(GLOB.all_faction_items[W] == GLOB.department_command)
				oddity_stats[STAT_ROB] += 2
				oddity_stats[STAT_TGH] += 1
				oddity_stats[STAT_BIO] += 1
				oddity_stats[STAT_MEC] += 1
				oddity_stats[STAT_VIG] += 3
				oddity_stats[STAT_COG] += 1
				oddity_stats[STAT_ANA] += 1
				oddity_stats[STAT_VIV] += 1
			else
				CRASH("[W], incompatible department")

		else if(istype(W, /obj/item/tool) && !istype(W, /obj/item/tool/psionic_omnitool))
			var/useful = FALSE
			if(W.tool_qualities)

				for(var/quality in W.tool_qualities)

					if(W.tool_qualities[quality] >= 35)
						var/stat_cost = round(W.tool_qualities[quality] / 15)
						if(quality == QUALITY_BOLT_TURNING || quality == QUALITY_SCREW_DRIVING || quality == QUALITY_CUTTING)
							oddity_stats[STAT_COG] += stat_cost
							useful = TRUE

						else if (quality == QUALITY_PULSING || quality == QUALITY_ADHESIVE || quality == QUALITY_SEALING)
							oddity_stats[STAT_MEC] += stat_cost
							useful = TRUE

						else if (quality == QUALITY_PRYING || quality == QUALITY_HAMMERING || quality == QUALITY_DIGGING)
							oddity_stats[STAT_ROB] += stat_cost
							useful = TRUE

						else if (quality == QUALITY_WELDING || quality == QUALITY_WIRE_CUTTING || quality == QUALITY_SAWING || quality == QUALITY_LASER_CUTTING)
							oddity_stats[STAT_VIG] += stat_cost
							useful = TRUE

						else if (quality == QUALITY_CLAMPING || quality == QUALITY_CAUTERIZING || quality == QUALITY_RETRACTING || quality == QUALITY_BONE_SETTING)
							oddity_stats[STAT_BIO] += stat_cost
							useful = TRUE

						else if (quality == QUALITY_DRILLING || quality == QUALITY_SHOVELING || quality == QUALITY_EXCAVATION)
							oddity_stats[STAT_TGH] += stat_cost
							useful = TRUE

				if(!useful)
					to_chat(user, SPAN_WARNING("The [W] is not suitable for [src]!"))
					return
			else
				to_chat(user, SPAN_WARNING("The [W] is not suitable for [src]!"))
				return


		else if(istype(W, /obj/item/tool_upgrade))

			var/obj/item/tool_upgrade/T = W

			if(istype(T, /obj/item/tool_upgrade/reinforcement))
				oddity_stats[STAT_TGH] += 3

			else if(istype(T, /obj/item/tool_upgrade/productivity))
				oddity_stats[STAT_COG] += 3

			else if(istype(T, /obj/item/tool_upgrade/refinement))
				oddity_stats[STAT_VIG] += 3

			else if(istype(T, /obj/item/tool_upgrade/augment))
				oddity_stats[STAT_BIO] += 3


		else if(istype(W, /obj/item/cell))
			if(istype(W, /obj/item/cell/small/moebius/nuclear))
				oddity_stats[STAT_ROB] += 2

			else if(istype(W, /obj/item/cell/medium/moebius/nuclear))
				oddity_stats[STAT_ROB] += 3

			else if(istype(W, /obj/item/cell/large/moebius/nuclear))
				oddity_stats[STAT_ROB] += 4

			else
				oddity_stats[STAT_ROB] += 1

		else if(istype(W, /obj/item/gun))
			oddity_stats[STAT_ROB] += 2
			oddity_stats[STAT_VIG] += 2

		else
			to_chat(user, SPAN_WARNING("The [W] is not suitable for [src]!"))
			return
		to_chat(user, SPAN_NOTICE("You feed [W] to [src]."))
		LEGACY_SEND_SIGNAL(user, COMSIG_OBJ_TECHNO_TRIBALISM, W)
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
				var/obj/item/oddity/techno/T = new /obj/item/oddity/techno(src)
				T.oddity_stats = src.oddity_stats
				T.AddComponent(/datum/component/inspiration, T.oddity_stats)
				items_count = 0
				oddity_stats = list(STAT_MEC = 0, STAT_COG = 0, STAT_BIO = 0, STAT_ROB = 0, STAT_TGH = 0, STAT_VIG = 0)
				last_produce = world.time
				user.put_in_hands(T)
			else
				to_chat(src.loc, SPAN_WARNING("The [src] is too complicated to use!"))
		else
			visible_message("\icon The [src] beeps, \"The [src] is not full enough to produce.\".")
	else
		visible_message("\icon The [src] beeps, \"The [src] need time to cooldown.\".")

/obj/item/device/techno_tribalism/examine(user)
	..()
	to_chat(user, SPAN_NOTICE("The [src] is fed by [items_count]/[max_count]."))

/obj/item/maneki_neko
	name = "Ancient Maneki Neko"
	icon = 'icons/obj/device.dmi'
	icon_state = "maneki_neko"
	item_state = "maneki_neko"
	desc = "An oddity that costs quite a lot of money, it feels like its watching you. Creepy."
	flags = CONDUCT
	force = WEAPON_FORCE_WEAK
	w_class = ITEM_SIZE_SMALL
	throwforce = WEAPON_FORCE_WEAK
	throw_speed = 3
	throw_range = 15
	price_tag = 20000
	origin_tech = list(TECH_MATERIAL = 10)
	var/affect_radius = 7
	matter = list(MATERIAL_GLASS = 5, MATERIAL_GOLD = 7, MATERIAL_SILVER = 5, MATERIAL_DIAMOND = 1)
	var/list/mob/living/carbon/human/followers = list()

/obj/item/maneki_neko/Destroy()
	STOP_PROCESSING(SSobj, src)
	for(var/mob/living/carbon/human/H in viewers(get_turf(src)))
		LEGACY_SEND_SIGNAL(H, COMSIG_OBJ_FACTION_ITEM_DESTROY, src)
	GLOB.all_faction_items -= src
	GLOB.guild_faction_item_loss++
	..()

/obj/item/maneki_neko/New()
	GLOB.all_faction_items[src] = GLOB.department_guild
	START_PROCESSING(SSobj, src)
	..()

/obj/item/maneki_neko/Process()
	..()
	for(var/list/mob/living/carbon/human/affected in oviewers(affect_radius, src))
		followers |= affected

/obj/item/maneki_neko/attackby(obj/item/W, mob/user, params)
	if(nt_sword_attack(W, user))
		return FALSE

	if(QUALITY_HAMMERING in W.tool_qualities)
		if(W.use_tool(user, src, WORKTIME_INSTANT, QUALITY_HAMMERING, FAILCHANCE_EASY, required_stat = STAT_ROB))
			playsound(src, "shatter", 70, 1)
			new /obj/item/clothing/head/costume/animal/kitty(get_turf(src))
			qdel(src)

/obj/item/maneki_neko/afterattack(obj/target, mob/user, var/flag)
	if(user.a_intent == I_HURT)
		playsound(src, "shatter", 70, 1)
		new /obj/item/clothing/head/costume/animal/kitty(get_turf(src))
		qdel(src)

/obj/item/maneki_neko/throw_impact(atom/hit_atom)
	..()
	playsound(src, "shatter", 70, 1)
	new /obj/item/clothing/head/costume/animal/kitty(get_turf(src))
	qdel(src)

/obj/item/maneki_neko/proc/destroy_lifes()
	for(var/mob/living/carbon/human/H in followers)

		for(var/stat in ALL_STATS_FOR_LEVEL_UP)
			H.stats.changeStat(stat, -10)
		var/neko = uppertext(src.name)
		to_chat(H, SPAN_DANGER(pick("LIFE IS RUINED FOR ME! I CANNOT FIND [neko]!", "WHO STOLE MY [neko]!", "WHERE IS [neko]?!", "WHY I CANNOT FIND [neko]?!")))

/obj/item/tool/sword/crusader/nt_sword_truth
	name = "Joyeuse"
	desc = "A sword made out of an unknown alloy, humming from an unknown power source."
	icon = 'icons/obj/device.dmi'
	icon_state = "nt_sword_truth"
	item_state = "nt_sword_truth"
	slot_flags = FALSE
	origin_tech = list(TECH_COMBAT = 9, TECH_POWER = 9, TECH_MATERIAL = 9)
	price_tag = 20000
	degradation = 0
	var/flash_cooldown = 1 MINUTES
	var/last_use = 0

/obj/item/tool/sword/crusader/nt_sword_truth/wield(mob/living/user)
	..()
	set_light(l_range = 4, l_power = 3)

/obj/item/tool/sword/crusader/nt_sword_truth/unwield(mob/living/user)
	..()
	set_light(l_range = 0, l_power = 0)

/obj/item/tool/sword/nt_sword/New()
	..()
	GLOB.all_faction_items[src] = GLOB.department_church

/obj/item/tool/sword/nt_sword/Destroy()
	for(var/mob/living/carbon/human/H in viewers(get_turf(src)))
		LEGACY_SEND_SIGNAL(H, COMSIG_OBJ_FACTION_ITEM_DESTROY, src)
	GLOB.all_faction_items -= src
	GLOB.neotheology_faction_item_loss++
	..()

/obj/item/tool/sword/nt_sword/attackby(obj/item/I, mob/user, params)
	if(nt_sword_attack(I, user))
		return FALSE
	..()

/obj/item/tool/sword/crusader/nt_sword_truth/attack_self(mob/user)
	if(!wielded)
		to_chat(user, SPAN_WARNING("You cannot use [src] special ability with one hand!"))
		return
	if(world.time <= last_use + flash_cooldown)
		to_chat(user, SPAN_WARNING("[src] still charging!"))
		return
	if(!do_after(user, 2.5 SECONDS))
		to_chat(src, SPAN_DANGER("You were interrupted!"))
		return

	var/bang_text = pick("HOLY LIGHT!", "GOD HAVE MERCY!", "HOLY HAVEN!", "YOU SEE THE LIGHT!")

	for(var/obj/structure/closet/L in hear(7, get_turf(src)))
		if(locate(/mob/living/carbon/, L))
			for(var/mob/living/carbon/M in L)
				var/obj/item/implant/core_implant/I = M.get_core_implant(/obj/item/implant/core_implant/cruciform)
				if(I && I.active && I.wearer)
					continue
				M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_ADEPT, 45 SECONDS)
				M.stats.addTempStat(STAT_VIG, -STAT_LEVEL_ADEPT, 45 SECONDS)
				M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_ADEPT, 45 SECONDS)
				M.stats.addTempStat(STAT_BIO, -STAT_LEVEL_ADEPT, 45 SECONDS)
				M.stats.addTempStat(STAT_COG, -STAT_LEVEL_ADEPT, 45 SECONDS)
				M.stats.addTempStat(STAT_MEC, -STAT_LEVEL_ADEPT, 45 SECONDS)
				flashbang_bang(get_turf(src), M, bang_text)

	for(var/mob/living/carbon/M in hear(7, get_turf(src)))
		var/obj/item/implant/core_implant/I = M.get_core_implant(/obj/item/implant/core_implant/cruciform)
		if(I && I.active && I.wearer)
			continue
		M.stats.addTempStat(STAT_TGH, -STAT_LEVEL_ADEPT, 45 SECONDS)
		M.stats.addTempStat(STAT_VIG, -STAT_LEVEL_ADEPT, 45 SECONDS)
		M.stats.addTempStat(STAT_ROB, -STAT_LEVEL_ADEPT, 45 SECONDS)
		M.stats.addTempStat(STAT_BIO, -STAT_LEVEL_ADEPT, 45 SECONDS)
		M.stats.addTempStat(STAT_COG, -STAT_LEVEL_ADEPT, 45 SECONDS)
		M.stats.addTempStat(STAT_MEC, -STAT_LEVEL_ADEPT, 45 SECONDS)
		flashbang_bang(get_turf(src), M, bang_text)

	for(var/obj/effect/blob/B in hear(8,get_turf(src)))       		//Blob damage here
		var/damage = round(30/(get_dist(B,get_turf(src))+1))
		B.take_damage(damage)
		B.update_icon()

	new/obj/effect/sparks(loc)
	new/obj/effect/effect/smoke/illumination(loc, brightness=15)
	last_use = world.time
	return

/obj/item/tool/sword/crusader/nt_sword_truth/equipped(mob/living/M)
	. = ..()
	if(is_held() && is_neotheology_disciple(M))
		embed_mult = 0.1
	else
		embed_mult = initial(embed_mult)

/obj/structure/nt_pedestal
	name = "Pedestal of the Joyeuse"
	desc = "Pedestal of the glorious weapon named: \"Joyeuse\"."
	icon = 'icons/obj/device.dmi'
	icon_state = "nt_pedestal0"
	anchored = TRUE
	density = TRUE
	breakable = FALSE
	var/obj/item/tool/sword/crusader/nt_sword_truth/sword

/obj/structure/nt_pedestal/New(var/loc, var/turf/anchor)
	..()
	sword = new /obj/item/tool/sword/crusader/nt_sword_truth(src)
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
	if(istype(I, /obj/item/tool/sword/crusader/nt_sword_truth))
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
		var/obj/item/implant/core_implant/I = H.get_core_implant(/obj/item/implant/core_implant/cruciform)
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

/obj/item/storage/sheath/joyeuse
	name = "\improper Joyeuse sheath"
	desc = "A specially designed sheathe for the joyeuse, which is the only object that shall fit in it."
	can_hold = list(
		/obj/item/tool/sword/crusader/nt_sword_truth
		)

/obj/item/reagent_containers/atomic_distillery
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

/obj/item/reagent_containers/atomic_distillery/New()
	..()
	GLOB.all_faction_items[src] = GLOB.department_command
	START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/atomic_distillery/Destroy()
	STOP_PROCESSING(SSobj, src)
	for(var/mob/living/carbon/human/H in viewers(get_turf(src)))
		LEGACY_SEND_SIGNAL(H, COMSIG_OBJ_FACTION_ITEM_DESTROY, src)
	GLOB.all_faction_items -= src
	. = ..()

/obj/item/reagent_containers/atomic_distillery/Process()
	reagents.add_reagent("atomvodka", 1)

/obj/item/reagent_containers/atomic_distillery/attackby(obj/item/I, mob/user, params)
	if(nt_sword_attack(I, user))
		return FALSE
	..()

/obj/item/reagent_containers/atomic_distillery/pre_attack(atom/A, mob/user, params)
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

/obj/item/reagent_containers/atomic_distillery/afterattack(var/obj/target, var/mob/user, var/flag)
	if(!flag)
		return
	if(standard_pour_into(user, target))
		return TRUE
	if(standard_dispenser_refill(user, target))
		return TRUE

/** Special plant coded in but not added as a map object yet. Not entirely sure what I want to do with it, might make it a weird strange seed/fruit producer oddity for science. -Kaz
	Every 10 seconds, checks if it has 10+ units of any alcohol.
		If it does, removes said alcohol, and spawns a random base fruit or vegetable.
		Ratio, 10 alcohol: 1 produce.
**/

/obj/item/reagent_containers/bonsai
	name = "Laurelin bonsai"
	desc = "A small tree, gifted to the bar by a previous patron. It subsists off of numerous alcohols, and produces fruits and vegetables in return."

	icon = 'icons/obj/plants.dmi'
	icon_state = "plant-21" //Placeholder until we can get a proper sprite for them.

	volume = 100 //Average bottle volume
	reagent_flags = OPENCONTAINER

	price_tag = 4000

	matter = list(MATERIAL_BIOMATTER = 50)
	var/ticks

/obj/item/reagent_containers/bonsai/Process()
	if(++ticks % 10 == 0 && reagents.total_volume)
		var/reagent_count = 0
		for(var/datum/reagent/R in reagents.reagent_list)
			if(istype(R, /datum/reagent/ethanol))
				reagent_count += R.volume
				R.remove_self(R.volume)
		if(reagent_count > 10)
			var/amount_to_spawn = round(reagent_count/10)
			for(var/i = 0 to amount_to_spawn)
				var/datum/seed/S = plant_controller.seeds[pick(
					"tomato",
					"carrot",
					"corn",
					"eggplant",
					"chili",
					"chanterelle",
					"wheat",
					"potato",
					"rice")]
				S.harvest(get_turf(src),0,0,1)



/obj/item/direct_line
	name = "direct phone line"
	desc = "A powerful direct hotline to local ships in the area, as well as having a slot to charge the phone with cashcards to directly fund a station of the CEO's choice."
	icon = 'icons/obj/items.dmi'
	icon_state = "phone"
	flags = CONDUCT
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_SMALL
	price_tag = 4000
	attack_verb = list("liquidates", "divests", "outsources", "lays off", "downsizes")
	hitsound = 'sound/weapons/ring.ogg'
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 4)
	preloaded_reagents = list("plasticide" = 20, "copper" = 6, "silicon" = 10)
	var/unlocks_left = 1
	var/credits_to_fund = 0
	var/favours_to_call = 0
	var/anti_cheat = FALSE

/obj/item/direct_line/examine(mob/user)
	..()
	to_chat(user, "<span class='info'>The little tracker on the said that lists of transferable funds reads as: [credits_to_fund]</span>")

//This code is a mess

/obj/item/direct_line/attack_self(mob/user as mob)

	if(anti_cheat)
		to_chat(user, "The line is busy with other deals, wait your turn.")
		return

	var/choice = input(user, "What do you want to call in?") as null|anything in list("Funding Operations","Aggressive Sales Market") //,"Call in a Favour"

	if(anti_cheat)
		to_chat(user, "The line is busy with other deals, wait your turn.")
		return

	switch(choice)

		if("Funding Operations")
			if(credits_to_fund)
				var/list/stations_list_for_fund = list()
				for(var/stations_to_fund in SStrade.discovered_stations)
					var/datum/trade_station/O = stations_to_fund
					stations_list_for_fund += O

				if(!stations_list_for_fund)
					to_chat(user, SPAN_NOTICE("When you ring the line, you hear an annoyed voice say \"I'm prepared to close this deal quickly\", followed by a silent dial tone. Seems like there are no stations willing to trade with the colony."))
					return

				var/datum/trade_station/station_choice = input(user, "What Station do you want to force sales with?") as null|anything in stations_list_for_fund
				if(!station_choice)	// user can cancel
					to_chat(user, SPAN_NOTICE("You quickly hang up the phone."))
					return
				station_choice.wealth += credits_to_fund
				to_chat(user, SPAN_NOTICE("Before you work out a deal to transfer the funding you hear ''[pick("You rang?","I was planning on running into you.","This caller always collects.","I'm one smooth operator.","I always make my calls direct.")]'' and then the line goes silent, as the counter on the side for funding slowly ticks down..."))
				credits_to_fund = 0
			else
				to_chat(user, SPAN_NOTICE("When you ring the line, you hear an annoyed voice say \"Sorry, we cannot give credit. Call back when you're a little mmm.... richer.\" followed by a silent dial tone. It's likely due to the phone not having enough money to directly fund a station."))
/*
		if("Call in a Favour")
			if(credits_to_fund >= 1000) //Random number 1k seems fair?
				var/list/stations_list_for_favour = list()
				for(var/stations_to_favour in list_of_stations)
					var/datum/trade_station/O = stations_to_fund
					stations_list_for_favour += O

				if(!stations_list_for_favour)
					to_chat(user, SPAN_NOTICE("When you ring the line, you hear an annoyed voice say ''I'm prepared to close this deal quickly.'' and then the line goes silent. Seems like their is no stations willing to trade with the colony."))
					return

				var/datum/trade_station/station_choice = input(user, "What Station do you want to force sales with you?") as null|anything in stations_list_for_favour
				if(!station_choice)	// user can cancel
					to_chat(user, SPAN_NOTICE("You quickly hang up the phone."))
					return
				station_choice.offer_tick() //Forcefully refreshes trade deals
				to_chat(user, SPAN_NOTICE("Before you work out a deal to transfer the funding you hear ''[pick("You rang?","I was planning on running into you.","This caller always collects.","I'm one smooth operator.","I always make my calls direct.")]'' and then the line goes silent, as the counter on the side for funding slowly ticks down..."))
				credits_to_fund -= 1000
			else
				to_chat(user, SPAN_NOTICE("When you ring the line, you hear an annoyed voice say ''I'm prepared to close this deal quickly.'' and then the line goes silent. You likely need more funds to ensentives the station request your goods."))
*/


		if("Aggressive Sales Market")
			if(unlocks_left)
				anti_cheat = TRUE
				var/list/stations_list_for_phone = list()
				for(var/stations_to_unlock in SStrade.all_stations)
					if(stations_to_unlock in SStrade.discovered_stations)
						continue
					var/datum/trade_station/O = stations_to_unlock
					stations_list_for_phone += O

				if(!stations_list_for_phone)
					to_chat(user, SPAN_NOTICE("When you ring the line, you hear an annoyed voice say \"I'm prepared to close this deal quickly.\" followed by a silent dial tone. Looks like they are not in any mood to do more Aggressive Sales Market."))
					return

				if(!unlocks_left)
					to_chat(user, SPAN_NOTICE("When you ring the line, you hear an annoyed voice say \"I'm prepared to close this deal quickly.\" followed by a silent dial tone. Looks like they are not in any mood to do more Aggressive Sales Market."))
					return

				var/station_choice = input(user, "What Station do you want to force sales with you?") as null|anything in stations_list_for_phone
				if(!station_choice)	// user can cancel
					anti_cheat = FALSE
					to_chat(user, SPAN_NOTICE("You quickly hang up the phone."))
					return
				SStrade.discovered_stations |= station_choice
				unlocks_left -= 1
				anti_cheat = FALSE
			else
				to_chat(user, SPAN_NOTICE("When you ring the line, you hear an annoyed voice say \"I'm prepared to close this deal quickly.\" followed by a silent dial tone. Looks like they are not in any mood to do more Aggressive Sales Market."))


		else
			return


/obj/item/direct_line/attackby(obj/item/I, mob/living/user, params)
	if(istype(I, /obj/item/spacecash/ewallet))
		var/obj/item/spacecash/ewallet/C = I
		if(C.worth <= 0)
			to_chat(user, SPAN_NOTICE("When you try to transfer the e-wallet funds to the line, you hear \"Sorry, we cannot give credit. Call back when you're a little mmm.... richer.\" followed by a silent dial tone. It's likely due to not having enough funds on it..."))
		else
			to_chat(user, SPAN_NOTICE("When you try to transfer the ewallet you hear on the line ''[pick("Surprised to hear from me?","I was planning on running into you.","I have some costly items for you today.","I'm one smooth operator.","I'm going to cause a ringing sensation.")]'' and then the line goes silent, as the counter on the side for funding slowly ticks up..."))
			credits_to_fund += C.worth
			C.worth = 0
			C.update_icon() //Incase

	..()
