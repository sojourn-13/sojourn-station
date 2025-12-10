#define DEFIB_TIME_LIMIT (30 MINUTES) //past this many seconds, defib is useless.
#define DEFIB_TIME_LOSS  (15 MINUTES) //past this many seconds, brain damage occurs.

//backpack item
/obj/item/device/defib_kit
	name = "auto-resuscitator"
	desc = "A device that delivers powerful shocks to detachable paddles that resuscitate incapacitated patients."
	icon = 'icons/obj/defibrillator.dmi'
	icon_state = "defibunit"
	item_state = "defibunit"
	slot_flags = SLOT_BACK
	force = 5
	throwforce = 6
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5, MATERIAL_GLASS = 1, MATERIAL_GOLD = 3.25, MATERIAL_SILVER = 4.25) //Glass for the lights
	origin_tech = list(TECH_BIO = 4, TECH_POWER = 2)
	action_button_name = "Remove/Replace Paddles"

	var/chargecost = 500 //Charge drain level
	var/oxygain = 50 //How much oxyloss should this thing heal?

	suitable_cell = /obj/item/cell/large
	var/obj/item/cell/cell_type = null
	cell = null
	var/paddle_type = /obj/item/shockpaddles/linked
	var/obj/item/shockpaddles/linked/paddles

/obj/item/device/defib_kit/New() //starts without a cell for rnd
	..()

	paddles = new paddle_type(src, src)

	if(ispath(cell_type, suitable_cell))
		cell = new cell_type(src)


/obj/item/device/defib_kit/Initialize(mapload) //updates mapped items
	..()
	sleep(10)
	update_icon()

/obj/item/device/defib_kit/Destroy()
	. = ..()
	QDEL_NULL(paddles)
	QDEL_NULL(cell)

/obj/item/device/defib_kit/loaded //starts with a cell
	cell_type = /obj/item/cell/large


/obj/item/device/defib_kit/update_icon()
	var/list/new_overlays = list()

	if(paddles && paddles.loc == src) //in case paddles got destroyed somehow.
		new_overlays += "[initial(icon_state)]-paddles"
	if(cell && paddles)
		if(cell.check_charge(chargecost))
			if(paddles.combat)
				new_overlays += "[initial(icon_state)]-combat"
			else if(!paddles.safety)
				new_overlays += "[initial(icon_state)]-emagged"
			else
				new_overlays += "[initial(icon_state)]-powered"

		var/ratio = CEILING(cell.percent()/25, 1) * 25
		new_overlays += "[initial(icon_state)]-charge[ratio]"
	else
		new_overlays += "[initial(icon_state)]-nocell"

	cut_overlays()
	add_overlay(new_overlays)

/obj/item/device/defib_kit/ui_action_click()
	toggle_paddles()

/obj/item/device/defib_kit/attack_hand(mob/user)
	if(loc == user)
		toggle_paddles()
	else
		..()

/obj/item/device/defib_kit/MouseDrop()
	if(ismob(src.loc))
		if(!CanMouseDrop(src))
			return
		var/mob/M = src.loc
		if(!M.unEquip(src))
			return
		src.add_fingerprint(usr)
		M.put_in_hands(src)


/obj/item/device/defib_kit/attackby(obj/item/W, mob/user, params)
	if(W == paddles)
		reattach_paddles(user)
	else if(istype(W, suitable_cell))
		if(cell)
			to_chat(user, "<span class='notice'>\the [src] already has a cell.</span>")
		else
			if(!user.unEquip(W))
				return
			W.forceMove(src)
			cell = W
			to_chat(user, "<span class='notice'>You install a cell in \the [src].</span>")
			update_icon()

	else if(W.has_quality(QUALITY_SCREW_DRIVING))
		if(cell)
			cell.update_icon()
			cell.forceMove(get_turf(src.loc))
			cell = null
			to_chat(user, "<span class='notice'>You remove the cell from \the [src].</span>")
			update_icon()
	else
		return ..()

/obj/item/device/defib_kit/emag_act(var/remaining_charges, var/mob/user)
	if(paddles)
		. = paddles.emag_act(user)
		update_icon()
	return

//Paddle stuff

/obj/item/device/defib_kit/verb/toggle_paddles()
	set name = "Toggle Paddles"
	set category = "Object"

	var/mob/living/carbon/human/user = usr
	if(!paddles)
		to_chat(user, "<span class='warning'>The paddles are missing!</span>")
		return

	if(paddles.loc != src)
		reattach_paddles(user) //Remove from their hands and back onto the defib unit
		return

	if(!slot_check())
		to_chat(user, "<span class='warning'>You need to equip [src] before taking out [paddles].</span>")
	else
		if(!usr.put_in_hands(paddles)) //Detach the paddles into the user's hands
			to_chat(user, "<span class='warning'>You need a free hand to hold the paddles!</span>")
		update_icon() //success

//checks that the base unit is in the correct slot to be used
/obj/item/device/defib_kit/proc/slot_check()
	var/mob/M = loc
	if(!istype(M))
		return 0 //not equipped

	if((slot_flags & SLOT_BACK) && M.get_equipped_item(slot_back) == src)
		return 1
	if((slot_flags & SLOT_BELT) && M.get_equipped_item(slot_belt) == src)
		return 1

	return 0

/obj/item/device/defib_kit/dropped(mob/user)
	..()
	reattach_paddles(user) //paddles attached to a base unit should never exist outside of their base unit or the mob equipping the base unit

/obj/item/device/defib_kit/proc/reattach_paddles(mob/user)
	if(!paddles) return

	if(ismob(paddles.loc))
		var/mob/M = paddles.loc
		if(M.drop_from_inventory(paddles, src))
			to_chat(user, "<span class='notice'>\The [paddles] snap back into the main unit.</span>")
	else
		paddles.forceMove(src)

	update_icon()

/*
	Base Unit Subtypes
*/

/obj/item/device/defib_kit/compact
	name = "compact auto-resuscitator"
	desc = "A belt-equipped auto-resuscitator that can be rapidly deployed."
	icon_state = "defibcompact"
	item_state = "defibcompact"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	matter = list(MATERIAL_STEEL = 5, MATERIAL_PLASTIC = 7, MATERIAL_GLASS = 2, MATERIAL_GOLD = 7.75, MATERIAL_SILVER = 12.75) //Glass for the lights
	origin_tech = list(TECH_BIO = 5, TECH_POWER = 3)
	suitable_cell = /obj/item/cell/medium
	oxygain = 20

/obj/item/device/defib_kit/compact/loaded
	cell_type = /obj/item/cell/medium

/obj/item/device/defib_kit/compact/combat
	name = "combat auto-resuscitator"
	desc = "A belt-equipped blood-red auto-resuscitator that can be rapidly deployed. Does not have the restrictions or safeties of conventional auto-resuscitators and can revive through space suits."
	paddle_type = /obj/item/shockpaddles/linked/combat

	oxygain = 40

/obj/item/device/defib_kit/compact/combat/loaded
	cell_type = /obj/item/cell/medium


/obj/item/device/defib_kit/compact/combat/adv
	name = "advanced auto-resuscitator"
	desc = "A belt-equipped SI branded auto-resuscitator that can be rapidly deployed. Does not have the restrictions or safeties of conventional auto-resuscitators and can revive through space suits."
	paddle_type = /obj/item/shockpaddles/linked/combat/advanced
	icon_state = "advdefibcompact"

	oxygain = 40

/obj/item/device/defib_kit/compact/combat/adv/loaded
	cell_type = /obj/item/cell/medium/moebius/high

/obj/item/device/defib_kit/compact/combat/adv/loaded/cbo
	cell_type = /obj/item/cell/medium/moebius/omega

/obj/item/shockpaddles/linked/combat
	combat = 1
	safety = 0
	chargetime = (1 SECONDS)

/obj/item/shockpaddles/linked/combat/advanced
	name = "advanced auto-resuscitator paddles"
	desc = "A pair of ploymore-gripped paddles with flat metals surfaces that are used to deliver powerful controled electric shocks."
	si_only = TRUE
	advanced_pads = TRUE

//paddles

/obj/item/shockpaddles
	name = "auto-resuscitator paddles"
	desc = "A pair of plastic-gripped paddles with flat metal surfaces that are used to deliver powerful electric shocks."
	icon = 'icons/obj/defibrillator.dmi'
	icon_state = "defibpaddles"
	item_state = "defibpaddles"
	gender = PLURAL
	force = 2
	throwforce = 6
	tool_qualities = list(QUALITY_ELECTROCUTION = 30, QUALITY_PULSING = 10)
	w_class = ITEM_SIZE_BULKY

	var/safety = 1 //if you can zap people with the paddles on harm mode
	var/combat = 0 //If it can be used to revive people wearing thick clothing (e.g. spacesuits)
	var/cooldowntime = (6 SECONDS) // How long in deciseconds until the defib is ready again after use.
	var/chargetime = (2 SECONDS)
	var/chargecost = 500 //units of charge per zap	//With the default APC level cell, this allows 4 shocks
	var/burn_damage_amt = 5
	var/use_on_synthetic = 0 //If 1, this is only useful on FBPs, if 0, this is only useful on fleshies

	var/advanced_pads = FALSE
	var/si_only = FALSE


	var/wieldedm = 0
	var/cooldown = 0
	var/busy = 0
	// If paddles are linked to a base defib unit, this will hold that unit.
	var/obj/item/device/defib_kit/base_unit = null

/obj/item/shockpaddles/proc/set_cooldown(var/delay)
	cooldown = 1
	update_icon()

	spawn(delay)
		if(cooldown)
			cooldown = 0
			update_icon()

			make_announcement("beeps, \"Unit is re-energized.\"", "notice")
			playsound(src, 'sound/machines/defib_ready.ogg', 50, 0)

/obj/item/shockpaddles/update_wear_icon()
	var/mob/living/M = loc
	if(istype(M) && M.is_holding(src) && !M.hands_are_full())
		wieldedm = 1
		name = "[initial(name)] (wielded)"
	else
		wieldedm = 0
		name = initial(name)
	update_icon()
	..()

/obj/item/shockpaddles/update_icon()
	icon_state = "defibpaddles[wielded]"
	item_state = "defibpaddles[wielded]"
	if(cooldown)
		icon_state = "defibpaddles[wielded]_cooldown"

/obj/item/shockpaddles/proc/can_use(mob/user, mob/M)
	if(si_only)
		if(!user.stats?.getPerk(PERK_ADVANCED_MEDICAL) && !user.stats?.getStat(STAT_BIO, 80))
			to_chat(user, "<span class='warning'>\The [src] is so complex your need training to use this.</span>")
			return 0
	if(busy)
		return 0
	if(!check_charge(chargecost()))
		to_chat(user, "<span class='warning'>\The [src] doesn't have enough charge left to do that.</span>")
		return 0
	if(!wieldedm && !isrobot(user))
		to_chat(user, "<span class='warning'>You need to wield the paddles with both hands before you can use them on someone!</span>")
		return 0
	if(cooldown)
		to_chat(user, "<span class='warning'>\The [src] are re-energizing!</span>")
		return 0
	return 1

//Checks for various conditions to see if the mob is revivable
/obj/item/shockpaddles/proc/can_defib(mob/living/carbon/human/H) //This is checked before doing the defib operation
	if((H.species.flags & NO_SCAN))
		return "buzzes: \"Unrecogized physiology. Operation aborted.\""
	else if(H.isSynthetic() && !use_on_synthetic)
		return "buzzes: \"Synthetic Body. Operation aborted.\""
	else if(!H.isSynthetic() && use_on_synthetic)
		return "buzzes: \"Organic Body. Operation aborted.\""

	if(H.stat != DEAD)
		return "buzzes: \"Patient is not in a valid state. Operation aborted.\""

	if(!check_contact(H))
		return "buzzes: \"Patient's chest is obstructed. Operation aborted.\""

	return null

/obj/item/shockpaddles/proc/can_revive(mob/living/carbon/human/H) //This is checked right before attempting to revive

	var/deadtime = world.time - H.timeofdeath
	if (deadtime > DEFIB_TIME_LIMIT && !H.isSynthetic())
		return "buzzes: \"Resuscitation failed - Excessive neural degeneration. Begin neural regeneration before further attempts.\""
/* commenting this out for now due to it seeming to be a bit *too* sensitive.
	if(H.getBrainLoss() >= 200)
		return "buzzes: \"Resuscitation failed - Massive neural damage. Further attempts futile.\""
*/
	H.updatehealth()

	if(H.isSynthetic())
		if(H.health + H.getOxyLoss() + H.getToxLoss() <= HEALTH_THRESHOLD_DEAD)
			return "buzzes: \"Resuscitation failed - Severe bodily damage makes recovery of patient impossible via jumper cables. Begin manual repair before further attempts.\""

	else if(H.health + H.getOxyLoss() <= HEALTH_THRESHOLD_DEAD || (HUSK in H.mutations) || can_defib(H))
		return "buzzes: \"Resuscitation failed - Severe bodily damage makes recovery of patient impossible via auto-resuscitator. Begin medical intervention before further attempts.\""

	var/bad_vital_organ = check_vital_organs(H)
	if(bad_vital_organ)
		return bad_vital_organ

	//this needs to be last since if any of the 'other conditions are met their messages take precedence
	if(!H.client && !H.teleop)
		return "buzzes: \"Resuscitation failed - Mental interface error. Further attempts may be successful.\""

	return null

/obj/item/shockpaddles/proc/check_contact(mob/living/carbon/human/H)
	if(!combat)
		for(var/obj/item/clothing/cloth in list(H.wear_suit, H.w_uniform))
			if((cloth.body_parts_covered & UPPER_TORSO) && (cloth.item_flags & THICKMATERIAL))
				return FALSE
	return TRUE

/obj/item/shockpaddles/proc/check_vital_organs(mob/living/carbon/human/H)
	for(var/organ_tag in H.species.has_process)
		var/obj/item/organ/O = H.species.has_process[organ_tag]
		var/name = initial(O.name)
		var/vital = initial(O.vital) //check for vital organs
		if(vital)
			var/list/organs = H.internal_organs_by_efficiency[organ_tag]
			if(!organs && !organs.len)
				return "buzzes: \"Resuscitation failed - Patient is missing vital organ ([name]). Further attempts futile.\""
			var/working_organ = FALSE
			for(var/obj/item/organ/org in organs)
				if(org.damage <= org.max_damage)
					working_organ = TRUE
					break
			if(!working_organ)
				return "buzzes: \"Resuscitation failed - Excessive damage to vital organ ([name]). Further attempts futile.\""
	return null

/obj/item/shockpaddles/proc/check_blood_level(mob/living/carbon/human/H)
	if(!H.should_have_process(OP_HEART))
		return FALSE

	var/obj/item/organ/internal/vital/heart/heart = H.random_organ_by_process(OP_HEART)
	if(!heart)
		return TRUE

	var/blood_volume = round((H.vessel.get_reagent_amount("blood")/H.species.blood_volume)*100)
	if(!heart || heart.is_broken())
		blood_volume *= 0.3
	else if(heart.is_bruised())
		blood_volume *= 0.7
	else if(heart.damage > 1)
		blood_volume *= 0.8
	return blood_volume < BLOOD_VOLUME_OKAY_MODIFIER

/obj/item/shockpaddles/proc/check_charge(var/charge_amt)
	return 0

/obj/item/shockpaddles/proc/checked_use(var/charge_amt)
	return 0

/obj/item/shockpaddles/proc/chargecost()
	return chargecost

/obj/item/shockpaddles/proc/defib_oxygain()
	return 10

/obj/item/shockpaddles/attack(mob/living/M, mob/living/user, var/target_zone)
	var/mob/living/carbon/human/H = M
	if(!istype(H) || user.a_intent == I_HURT)
		return ..() //Do a regular attack. Harm intent shocking happens as a hit effect

	if(can_use(user, H))
		busy = 1
		update_icon()

		do_revive(H, user)

		busy = 0
		update_icon()

	return 1

//Since harm-intent now skips the delay for deliberate placement, you have to be able to hit them in combat in order to shock people.
/obj/item/shockpaddles/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(ishuman(target) && can_use(user, target))
		busy = 1
		update_icon()

		do_electrocute(target, user, hit_zone)

		busy = 0
		update_icon()

		return 1

	return ..()

// This proc is used so that we can return out of the revive process while ensuring that busy and update_icon() are handled
/obj/item/shockpaddles/proc/do_revive(mob/living/carbon/human/H, mob/user)
	if(!H.client && !H.teleop)
		for(var/mob/observer/ghost/ghost in GLOB.player_list)
			if(ghost.mind == H.mind)
				to_chat(ghost, "<b><font color = #ff2d00><font size = 6>Someone is attempting to resuscitate you. Re-enter your body if you want to be revived!</b> (Verbs -> Ghost -> Re-enter corpse)</font></font>")
				break

	//beginning to place the paddles on patient's chest to allow some time for people to move away to stop the process
	user.visible_message("<span class='warning'>\The [user] begins to place [src] on [H]'s chest.</span>", "<span class='warning'>You begin to place [src] on [H]'s chest...</span>")
	if(!do_after(user, 30, H))
		return
	user.visible_message("<span class='notice'>\The [user] places [src] on [H]'s chest.</span>", "<span class='warning'>You place [src] on [H]'s chest.</span>")
	playsound(get_turf(src), 'sound/machines/defib_charge.ogg', 50, 0)

	var/error = can_defib(H)
	if(error)
		make_announcement(error, "warning")
		playsound(get_turf(src), 'sound/machines/defib_failed.ogg', 50, 0)
		return

	if(check_blood_level(H))
		make_announcement("buzzes: \"Warning - Patient is in hypovolemic shock.\"", "warning") //also includes heart damage

	//placed on chest and short delay to shock for dramatic effect, revive time is 5sec total
	if(!do_after(user, chargetime, H))
		return

	//deduct charge here, in case the base unit was EMPed or something during the delay time
	if(!checked_use(chargecost))
		make_announcement("buzzes: \"Insufficient charge.\"", "warning")
		playsound(get_turf(src), 'sound/machines/defib_failed.ogg', 50, 0)
		return

	H.visible_message("<span class='warning'>\The [H]'s body convulses a bit.</span>")
	playsound(get_turf(src), "bodyfall", 50, 1)
	playsound(get_turf(src), 'sound/machines/defib_zap.ogg', 50, 1, -1)
	set_cooldown(cooldowntime)

	//set oxyloss based on defib strength
	H.adjustOxyLoss(-defib_oxygain())

	if(H.isSynthetic())
		H.setToxLoss(0)

	H.apply_damage(burn_damage_amt, BURN, BP_TORSO)

	error = can_revive(H)
	if(error)
		make_announcement(error, "warning")
		playsound(get_turf(src), 'sound/machines/defib_failed.ogg', 50, 0)
		return

	make_alive(H)

	make_announcement("pings, \"Resuscitation successful.\"", "notice")
	playsound(get_turf(src), 'sound/machines/defib_success.ogg', 50, 0)

	H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/return_to_sender, "RETURN_TO_SENDER", skill_gained = 1, learner = H)


	log_and_message_admins("used \a [src] to revive [key_name(H)].")


/obj/item/shockpaddles/proc/do_electrocute(mob/living/carbon/human/H, mob/user, var/target_zone)
	var/obj/item/organ/external/affecting = H.get_organ(target_zone)
	if(!affecting)
		to_chat(user, "<span class='warning'>They are missing that body part!</span>")
		return

	//no need to spend time carefully placing the paddles, we're just trying to shock them
	user.visible_message("<span class='danger'>\The [user] slaps [src] onto [H]'s [affecting.name].</span>", "<span class='danger'>You overcharge [src] and slap them onto [H]'s [affecting.name].</span>")

	//Just stop at awkwardly slapping electrodes on people if the safety is enabled
	if(safety)
		to_chat(user, "<span class='warning'>You can't do that while the safety is enabled.</span>")
		return

	playsound(get_turf(src), 'sound/machines/defib_charge.ogg', 50, 0)
	audible_message("<span class='warning'>\The [src] lets out a steadily rising hum...</span>")

	if(!do_after(user, chargetime, H))
		return

	//deduct charge here, in case the base unit was EMPed or something during the delay time
	if(!checked_use(chargecost))
		make_announcement("buzzes: \"Insufficient charge.\"", "warning")
		playsound(get_turf(src), 'sound/machines/defib_failed.ogg', 50, 0)
		return

	user.visible_message("<span class='danger'><i>\The [user] shocks [H] with \the [src]!</i></span>", "<span class='warning'>You shock [H] with \the [src]!</span>")
	playsound(get_turf(src), 'sound/machines/defib_zap.ogg', 100, 1, -1)
	playsound(loc, 'sound/weapons/Egloves.ogg', 100, 1, -1)
	set_cooldown(cooldowntime)

	H.stun_effect_act(2, 120, target_zone)
	var/burn_damage = H.electrocute_act(burn_damage_amt*2, src, def_zone = target_zone)
	if(burn_damage > 15 && H.can_feel_pain())
		H.emote("painscream")

	log_attack("[user.name]/([user.ckey]) shocked [H.name] ([H.ckey]) using [name]")

/obj/item/shockpaddles/proc/make_alive(mob/living/carbon/human/M) //This revives the mob
	var/deadtime = world.time - M.timeofdeath

	GLOB.dead_mob_list.Remove(M)
	if((M in GLOB.living_mob_list) || (M in GLOB.dead_mob_list))
		WARNING("Mob [M] was defibbed but already in the living or dead list still!")
	GLOB.living_mob_list += M

	M.timeofdeath = 0
	M.stat = UNCONSCIOUS //Life() can bring them back to consciousness if it needs to.
	M.failed_last_breath = 0 //So mobs that died of oxyloss don't revive and have perpetual out of breath.
	//M.reload_fullscreen() //TODO: This doesn't work on Eris :)

	M.emote("gasp")
	M.Weaken(rand(10,25))
	M.updatehealth()
	apply_brain_damage(M, deadtime)

	if(M.stats.getPerk(PERK_REZ_SICKNESS) || M.stats.getPerk(PERK_REZ_SICKNESS_SEVERE) || M.stats.getPerk(PERK_REZ_SICKNESS_FATAL))
		log_and_message_admins("[M] already had revival sickness! Medical Malpractice or Deathwish?")
		return

	if(!advanced_pads)
		stat_changes(M)
	else
		M.stats.addPerk(PERK_REZ_SICKNESS_MILD)
		log_and_message_admins("Added mild revival sickness to [M] due to an advanced defib.")
		return
/obj/item/shockpaddles/proc/stat_changes(mob/living/carbon/human/M) //This revives the mob
	// Apply revival sickness depending on the type of defibrillator used.
	// Priority: compact/combat -> severe, compact -> mild, base unit (box) -> fatal.
	// If paddles are standalone or no base_unit is present, treat as compact (mild).
	if(!M.stats.getPerk(PERK_REZ_SICKNESS) && !M.stats.getPerk(PERK_REZ_SICKNESS_SEVERE) && !M.stats.getPerk(PERK_REZ_SICKNESS_FATAL))
		var/obj/item/device/defib_kit/unit = null
		// linked paddles reference their base unit via base_unit
		if(istype(src, /obj/item/shockpaddles/linked) && src.base_unit)
			unit = src.base_unit
		// some paddles may be standalone or robot paddles; treat standalone as compact
		else if(istype(src, /obj/item/shockpaddles/standalone) || istype(src, /obj/item/shockpaddles/robot))
			unit = null

		if(unit)
			if(istype(unit, /obj/item/device/defib_kit/compact/combat))
				M.stats.addPerk(PERK_REZ_SICKNESS_SEVERE)
				log_and_message_admins("Added severe revival sickness to [M] due to a combat defib.")
			else if(istype(unit, /obj/item/device/defib_kit/compact))
				M.stats.addPerk(PERK_REZ_SICKNESS)
				log_and_message_admins("Added standard revival sickness to [M] due to a compact defib.")
			else if(istype(unit, /obj/item/device/defib_kit))
				M.stats.addPerk(PERK_REZ_SICKNESS_FATAL)
				log_and_message_admins("Added fatal revival sickness to [M] due to a standard box defib.")
		else
			// fallback: standalone/robot paddles are treated like compact defibs
			M.stats.addPerk(PERK_REZ_SICKNESS_SEVERE)
			log_and_message_admins("Added severe revival sickness to [M] due to an unknown defib.")

	// remove permanent stat loss as it's cringe
	/* for(var/stat_to_change in ALL_STATS_FOR_DEFIBS)
		var/rngStatRemoved
		switch(M.stats.getStat(stat_to_change))
			if(0 to 40)
				rngStatRemoved = rand(1,8)
			if(40 to 60)
				rngStatRemoved = rand(8,12)
			if(60 to INFINITY)
				rngStatRemoved = rand(12,20)

		M.stats.changeStat(stat_to_change, -rngStatRemoved)
		log_and_message_admins("Removed [-rngStatRemoved] to the [stat_to_change] stat of [M.real_name]")

	if(!M.stats.getPerk(PERK_REZ_SICKNESS) && !M.stats.getPerk(PERK_REZ_SICKNESS_SEVERE) && !M.stats.getPerk(PERK_REZ_SICKNESS_FATAL))
		switch(M.stats.getStat(STAT_TGH))
			if(-1200 to 40)
				M.stats.addPerk(PERK_REZ_SICKNESS_FATAL)
				log_and_message_admins("Added fatal revival sickness to [M].")
			if(40 to 60)
				M.stats.addPerk(PERK_REZ_SICKNESS_SEVERE)
				log_and_message_admins("Added severe revival sickness to [M].")
			if(60 to INFINITY)
				M.stats.addPerk(PERK_REZ_SICKNESS)
				log_and_message_admins("Added mild revival sickness to [M].")
	*/
/obj/item/shockpaddles/proc/apply_brain_damage(mob/living/carbon/human/H, var/deadtime)
	if(!H.should_have_process(BP_BRAIN)) return //no brain

	var/obj/item/organ/internal/vital/brain/brain = H.random_organ_by_process(BP_BRAIN)
	if(!brain) return //no brain

	// Defibrillation process: first remove all brain damage, then apply 80 brain damage
	// This represents the trauma of electrical shock to restart the heart
	H.setBrainLoss(0) // Clear all existing brain damage
	H.adjustBrainLoss(80) // Apply 80 brain damage as revival penalty

/obj/item/shockpaddles/proc/make_announcement(var/message, var/msg_class)
	audible_message("<b>\The [src]</b> [message]", "\The [src] vibrates slightly.")

/obj/item/shockpaddles/emag_act(mob/user)
	if(safety)
		safety = 0
		to_chat(user, "<span class='warning'>You silently disable \the [src]'s safety protocols with the cryptographic sequencer.</span>")
		update_icon()
		return 1
	else
		safety = 1
		to_chat(user, "<span class='notice'>You silently enable \the [src]'s safety protocols with the cryptographic sequencer.</span>")
		update_icon()
		return 1

/obj/item/shockpaddles/emp_act(severity)
	var/new_safety = rand(0, 1)
	if(safety != new_safety)
		safety = new_safety
		if(safety)
			make_announcement("beeps, \"Safety protocols enabled!\"", "notice")
			playsound(get_turf(src), 'sound/machines/defib_safetyon.ogg', 50, 0)
		else
			make_announcement("beeps, \"Safety protocols disabled!\"", "warning")
			playsound(get_turf(src), 'sound/machines/defib_safetyoff.ogg', 50, 0)
		update_icon()
	..()

/obj/item/shockpaddles/robot
	name = "auto-resuscitator paddles"
	desc = "A pair of advanced resuscitator paddles powered by a robot's internal power cell, able to penetrate thick clothing."
	chargecost = 50
	combat = 1
	use_on_synthetic = 0
	icon_state = "defibpaddles0"
	item_state = "defibpaddles0"
	cooldowntime = (3 SECONDS)
	advanced_pads = TRUE

/obj/item/shockpaddles/robot/check_charge(var/charge_amt)
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		return (R.cell && R.cell.check_charge(charge_amt))

/obj/item/shockpaddles/robot/checked_use(var/charge_amt)
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		return (R.cell && R.cell.checked_use(charge_amt))

/obj/item/shockpaddles/robot/combat
	name = "combat auto-resuscitator paddles"
	desc = "A pair of advanced resuscitator paddles powered by a robot's internal power cell, able to penetrate thick clothing.  This version \
	appears to be optimized for combat situations, foregoing the safety inhabitors in favor of a faster charging time."
	safety = 0
	chargetime = (1 SECONDS)

/*
	Shockpaddles that are linked to a base unit
*/
/obj/item/shockpaddles/linked
	base_unit = null

/obj/item/shockpaddles/linked/New(newloc, obj/item/device/defib_kit/defib)
	base_unit = defib
	..(newloc)

/obj/item/shockpaddles/linked/Destroy()
	if(base_unit)
		//ensure the base unit's icon updates
		if(base_unit.paddles == src)
			base_unit.paddles = null
			base_unit.update_icon()
		base_unit = null
	return ..()

/obj/item/shockpaddles/linked/dropped(mob/user)
	..() //update twohanding
	if(base_unit)
		base_unit.reattach_paddles(user) //paddles attached to a base unit should never exist outside of their base unit or the mob equipping the base unit

/obj/item/shockpaddles/linked/check_charge(var/charge_amt)
	return (base_unit.cell && base_unit.cell.check_charge(charge_amt))

/obj/item/shockpaddles/linked/checked_use(var/charge_amt)
	return (base_unit.cell && base_unit.cell.checked_use(charge_amt))

/obj/item/shockpaddles/linked/chargecost()
	if(base_unit)
		return base_unit.chargecost
	. = ..()

/obj/item/shockpaddles/linked/defib_oxygain()
	if(base_unit)
		return base_unit.oxygain
	. = ..()

/obj/item/shockpaddles/linked/make_announcement(var/message, var/msg_class)
	base_unit.audible_message("<b>\The [base_unit]</b> [message]", "\The [base_unit] vibrates slightly.")

/*
	Standalone Shockpaddles
*/



/obj/item/shockpaddles/standalone
	desc = "A pair of resuscitator paddles powered by a small battery."

	chargecost = 20

	suitable_cell = /obj/item/cell/small
	var/obj/item/cell/cell_type = null
	cell = null

/obj/item/shockpaddles/standalone/New()
	..()

	if(ispath(cell_type, suitable_cell))
		cell = new cell_type(src)
	sleep(5)
	update_icon()

/obj/item/device/defib_kit/attackby(obj/item/W, mob/user, params)
	if(istype(W, suitable_cell))
		if(cell)
			to_chat(user, "<span class='notice'>\the [src] already has a cell.</span>")
		else
			if(!user.unEquip(W))
				return
			W.forceMove(src)
			cell = W
			to_chat(user, "<span class='notice'>You install a cell in \the [src].</span>")
			update_icon()
	else if(W.has_quality(QUALITY_SCREW_DRIVING))
		if(cell)
			cell.update_icon()
			cell.forceMove(get_turf(src.loc))
			cell = null
			to_chat(user, "<span class='notice'>You remove the cell from \the [src].</span>")
			update_icon()
	else
		return ..()

/obj/item/shockpaddles/standalone/Destroy()
	. = ..()

/obj/item/shockpaddles/standalone/check_charge(var/charge_amt)
	return (cell && cell.check_charge(charge_amt))

/obj/item/shockpaddles/standalone/checked_use(var/charge_amt)
	return (cell && cell.check_charge(charge_amt))

/obj/item/shockpaddles/standalone/emp_act(severity)
	. = ..()

/obj/item/shockpaddles/robot
	name = "auto-resuscitator paddles"
	desc = "A pair of advanced resuscitator paddles powered by a robot's internal power cell, able to penetrate thick clothing."
	chargecost = 50
	combat = 1
	icon_state = "defibpaddles0"
	item_state = "defibpaddles0"
	cooldowntime = (30)

/obj/item/shockpaddles/robot/check_charge(var/charge_amt)
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		return (R.cell && R.cell.check_charge(charge_amt))

/obj/item/shockpaddles/robot/checked_use(var/charge_amt)
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		return (R.cell && R.cell.checked_use(charge_amt))

/obj/item/shockpaddles/robot/combat
	name = "combat auto-resuscitator paddles"
	desc = "A pair of advanced resuscitation paddles powered by a robot's internal power cell, able to penetrate thick clothing.  This version \
	appears to be optimized for combat situations, foregoing the safety inhabitors in favor of a faster charging time."
	safety = 0
	chargetime = (10)

/* From the Bay port, this doesn't seem to have a sprite.
/obj/item/shockpaddles/standalone/contractor
	name = "auto-resuscitator paddles"
	desc = "A pair of unusual looking paddles powered by an experimental miniaturized reactor. It possesses both the ability to penetrate armor and to deliver powerful shocks."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "defibpaddles0"
	item_state = "defibpaddles0"
	combat = 1
	safety = 0
	chargetime = (1 SECONDS)
*/

//FBP Auto-resuscitators
/obj/item/device/defib_kit/jumper_kit
	name = "jumper cable kit"
	desc = "A device that delivers powerful shocks to detachable jumper cables that are capable of reviving prosthetics chests."
	icon_state = "jumperunit"
	item_state = "defibunit"
//	item_state = "jumperunit"
	paddle_type = /obj/item/shockpaddles/linked/jumper

/obj/item/device/defib_kit/jumper_kit/loaded
	cell_type = /obj/item/cell/large

/obj/item/shockpaddles/linked/jumper
	name = "jumper cables"
	icon_state = "jumperpaddles"
	item_state = "jumperpaddles"
	use_on_synthetic = 1

/obj/item/shockpaddles/robot/jumper
	name = "jumper cables"
	desc = "A pair of advanced resuscitator paddles powered by a robot's internal power cell, able to penetrate thick clothing."
	icon_state = "jumperpaddles0"
	item_state = "jumperpaddles0"
	use_on_synthetic = 1

#undef DEFIB_TIME_LOSS
