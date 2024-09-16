/obj/item/organ/internal/cell
	name = "microbattery"
	desc = "A small, powerful cell for use in fully prosthetic bodies. Takes a medium cell and normally comes with a nuclear self charging cell."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "cortical_stack"
	parent_organ_base = BP_CHEST
	nature = MODIFICATION_SILICON
	vital = TRUE
	var/open
	cell = /obj/item/cell/medium/moebius/nuclear
	//at 0.8 completely depleted after 60ish minutes of constant walking or 130 minutes of standing still
	var/servo_cost = 0.5 // this will probably require tweaking
	w_class = ITEM_SIZE_SMALL

/obj/item/organ/internal/cell/Initialize(mapload, ...)
	. = ..()
	if(ispath(cell))
		cell = new cell(src)

/obj/item/organ/internal/cell/proc/percent()
	if(!cell)
		return 0
	return get_charge()/cell.maxcharge * 100

/obj/item/organ/internal/cell/proc/get_charge()
	if(!cell)
		return 0
	if(status & ORGAN_DEAD)
		return 0
	return round(cell.charge*(1 - damage/max_damage))

/obj/item/organ/internal/cell/proc/check_charge(var/amount)
	return get_charge() >= amount

/obj/item/organ/internal/cell/proc/use(var/amount)
	if(check_charge(amount))
		cell.use(amount)
		return 1

/obj/item/organ/internal/cell/proc/get_servo_cost()
	var/damage_factor = 1 + 10 * damage/max_damage
	return servo_cost * damage_factor

/obj/item/organ/internal/cell/Process()
	..()
	if(!owner)
		return
	if(owner.stat == DEAD)	//not a drain anymore
		return
	if(!is_usable())
		owner.Paralyse(3)
		return
	var/cost = get_servo_cost()
	if(world.time - owner.l_move_time < 15)
		cost *= 2
	/*
	if(!use(cost))
		if(!owner.lying && !owner.buckled)
			to_chat(owner, SPAN_WARNING("You don't have enough energy to function!"))
		owner.Paralyse(3)
	*/ // Since atom cells don't recharge, this will keep triggering over and over, paralizing the user and knocking them over every minute or so.
/obj/item/organ/internal/cell/emp_act(severity)
	..()
	if(cell)
		cell.emp_act(severity)

/obj/item/organ/internal/cell/attackby(obj/item/W, mob/user)
	if(QUALITY_SCREW_DRIVING in W.tool_qualities)
		if(open)
			open = FALSE
			to_chat(user, SPAN_NOTICE("You screw the battery panel in place."))
		else
			open = TRUE
			to_chat(user, SPAN_NOTICE("You unscrew the battery panel."))

	if(QUALITY_PRYING in W.tool_qualities)
		if(open)
			if(cell)
				user.put_in_hands(cell)
				to_chat(user, SPAN_NOTICE("You remove \the [cell] from \the [src]."))
				cell = null

	if (istype(W, /obj/item/cell))
		if(open)
			if(cell)
				to_chat(user, SPAN_WARNING("There is a power cell already installed."))
			else if(user.unEquip(W, src))
				cell = W
				to_chat(user, SPAN_NOTICE("You insert \the [cell]."))

/obj/item/organ/internal/cell/replaced_mob(mob/living/carbon/human/target)
	..()
	// This is very ghetto way of rebooting an IPC. TODO better way.
	if(owner.stat == DEAD)
		/* Code stolen from 'modules/mob/living/living.dm' after line 428. We can't directly call the revive() proc, because that heal everything, but we can take some parts of it.
		 * Even if certain parts doesn't apply to synthetics, the synths fucky enough that I think it is better if they stays, just in case. -R4d6 */
		if (owner.reagents)
			owner.reagents.clear_reagents()

		// shut down various types of badness
		owner.setToxLoss(0)
		owner.setOxyLoss(0)
		owner.setCloneLoss(0)
		owner.setBrainLoss(0)
		owner.SetParalysis(0)
		owner.SetStunned(0)
		owner.SetWeakened(0)
		owner.setHalLoss(0)

		// shut down ongoing problems
		owner.radiation = 0
		owner.bodytemperature = T20C
		owner.sdisabilities = 0
		owner.disabilities = 0

		// fix blindness and deafness
		owner.blinded = 0
		owner.eye_blind = 0
		owner.eye_blurry = 0
		owner.ear_deaf = 0
		owner.ear_damage = 0

		// remove the character from the list of the dead
		if(owner.stat == DEAD)
			GLOB.dead_mob_list -= owner
			GLOB.living_mob_list += owner
			owner.tod = null
			owner.timeofdeath = 0
			owner.set_stat(CONSCIOUS)

		// make the icons look correct
		owner.regenerate_icons()
		BITSET(owner.hud_updateflag, HEALTH_HUD)
		BITSET(owner.hud_updateflag, STATUS_HUD)
		BITSET(owner.hud_updateflag, LIFE_HUD)

		owner.visible_message(SPAN_DANGER("\The [owner] twitches visibly!"))


/obj/item/organ/internal/optical_sensor
	name = "optical sensor"
	organ_tag = "optics"
	parent_organ_base = BP_HEAD
	nature = MODIFICATION_SILICON
	icon = 'icons/obj/robot_component.dmi'
	icon_state = "camera"
	dead_icon = "camera_broken"

// Used for an MMI or posibrain being installed into a human.
/obj/item/organ/internal/mmi_holder
	name = "brain"
	organ_tag = BP_BRAIN
	parent_organ_base = BP_CHEST
	vital = 1
	var/obj/item/device/mmi/stored_mmi

/obj/item/organ/internal/mmi_holder/proc/update_from_mmi()
	if(!stored_mmi)
		return
	name = stored_mmi.name
	desc = stored_mmi.desc
	icon = stored_mmi.icon
	icon_state = stored_mmi.icon_state

/obj/item/organ/internal/mmi_holder/removed(var/mob/living/user)

	if(stored_mmi)
		stored_mmi.forceMove(get_turf(src))
	..()

	var/mob/living/holder_mob = loc
	if(istype(holder_mob))
		holder_mob.drop_from_inventory(src)
	qdel(src)

/obj/item/organ/internal/mmi_holder/removed_mob(mob/living/user)
	if(owner.mind && stored_mmi)
		owner.mind.transfer_to(stored_mmi.brainmob)
	..()

/obj/item/organ/internal/mmi_holder/New()
	..()
	// This is very ghetto way of rebooting an IPC. TODO better way.
	spawn(1)
		if(owner && owner.stat == DEAD)
			owner.stat = 0
			owner.visible_message(SPAN_DANGER("\The [owner] twitches visibly!"))

/obj/item/organ/internal/mmi_holder/posibrain
	nature = MODIFICATION_SILICON

/obj/item/organ/internal/mmi_holder/posibrain/New()
	stored_mmi = new /obj/item/device/mmi/digital/posibrain(src)
	..()
	spawn(30)
		if(owner)
			stored_mmi.name = "positronic brain ([owner.name])"
			stored_mmi.brainmob.real_name = owner.name
			stored_mmi.brainmob.name = stored_mmi.brainmob.real_name
			stored_mmi.icon_state = "posibrain-occupied"
			update_from_mmi()
		else
			stored_mmi.loc = get_turf(src)
			qdel(src)
