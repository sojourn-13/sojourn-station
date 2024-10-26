/obj/item/gun/energy
	name = "energy gun"
	desc = "A basic energy-based gun."
	icon = 'icons/obj/guns/energy/energy.dmi'
	icon_state = "energy"
	fire_sound = 'sound/weapons/energy/Taser.ogg'
	fire_sound_text = "laser blast"
	gun_parts = null //No disassembling these by default, SOMEONE failed to give them any actual parts.

	init_recoil = HANDGUN_RECOIL(0.1)


	var/charge_cost = 100 //How much energy is needed to fire.
	cell = null
	suitable_cell = /obj/item/cell/medium
	var/cell_type = /obj/item/cell/medium/high
	var/projectile_type = /obj/item/projectile/beam/practice
	var/modifystate
	var/charge_meter = TRUE //if set, the icon state will be chosen based on the current charge
	var/item_modifystate
	var/item_charge_meter = FALSE //same as above for item state

	//self-recharging
	var/self_recharge = 0	//if set, the weapon will recharge itself
	var/disposable = FALSE
	var/use_external_power = 0 //if set, the weapon will look for an external power source to draw from, otherwise it recharges magically
	var/recharge_time = 4
	var/recharge_amount = null //If set, the gun will recharge this many units per recharge_time, rather than restoring exactly enough for one shot
	var/charge_tick = 0
	gun_tags = list(GUN_ENERGY)

	wield_delay = 0.4 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/loadAmmoBestGuess()
	var/obj/item/cell/chosenCell = null

	if(cell == null)
		for(var/potentialCell in typesof(suitable_cell))
			var/obj/item/cell/potential = potentialCell

			if(!chosenCell)
				chosenCell = potential
			else if (initial(potential.maxcharge) > initial(chosenCell.maxcharge))
				chosenCell = potential

		if(chosenCell)
			cell = new chosenCell
			cell.loc = src


/obj/item/gun/energy/switch_firemodes()
	. = ..()
	if(.)
		update_icon()

/obj/item/gun/energy/emp_act(severity)
	..()
	update_icon()

/obj/item/gun/energy/Initialize()
	. = ..()
	if(self_recharge)
		cell = new cell_type(src)
		START_PROCESSING(SSobj, src)
	update_icon()
	if(disposable)
		cell = new cell_type(src)
		START_PROCESSING(SSobj, src)
	update_icon()

/obj/item/gun/energy/Destroy()
	QDEL_NULL(cell)
	return ..()

/obj/item/gun/energy/Process()
	if(self_recharge) //Every [recharge_time] ticks, recharge a shot for the cyborg
		charge_tick++
		if(charge_tick < recharge_time) return 0
		charge_tick = 0

		if(!cell || cell.charge >= cell.maxcharge)
			return 0 // check if we actually need to recharge

		if(use_external_power)
			var/obj/item/cell/large/external = get_external_cell()
			if(!external || !external.use(charge_cost)) //Take power from the borg...
				return 0

		if(recharge_amount)
			cell.give(recharge_amount)
		else
			cell.give(charge_cost) //... to recharge the shot
		update_icon()
	return 1

/obj/item/gun/energy/get_cell()
	return cell

/obj/item/gun/energy/handle_atom_del(atom/A)
	..()
	if(A == cell)
		cell = null
		update_icon()

/obj/item/gun/energy/consume_next_projectile()
	if(!cell) return null
	if(!ispath(projectile_type)) return null
	if(!cell.checked_use(charge_cost)) return null
	return new projectile_type(src)

/obj/item/gun/energy/proc/get_external_cell()
	if(isrobot(src.loc))
		var/mob/living/silicon/robot/R = src.loc
		return R.cell
	if(istype(src.loc, /obj/item/rig_module))
		var/obj/item/rig_module/module = src.loc
		if(module.holder && module.holder.wearer)
			var/mob/living/carbon/human/H = module.holder.wearer
			if(istype(H) && H.back)
				var/obj/item/rig/suit = H.back
				if(istype(suit))
					return suit.cell
	return null

/obj/item/gun/energy/examine(mob/user)
	..(user)
	if(!cell)
		to_chat(user, SPAN_NOTICE("Has no battery cell inserted."))
		return
	var/shots_remaining = round(cell.charge / charge_cost)
	to_chat(user, "Has [shots_remaining] shot\s remaining.")
	return

/obj/item/gun/energy/update_icon(var/ignore_inhands)
	if(charge_meter)
		var/ratio = 0

		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(cell && cell.charge >= charge_cost)
			ratio = cell.charge / cell.maxcharge
			ratio = min(max(round(ratio, 0.25) * 100, 25), 100)

		if(modifystate)
			icon_state = "[modifystate][ratio]"
		else
			icon_state = "[initial(icon_state)][ratio]"

		if(item_charge_meter)
			set_item_state("-[item_modifystate][ratio]")

		if(wielded)
			item_state_slots[slot_l_hand_str] = "lefthand"  + wielded_item_state + "-[ratio]"
			item_state_slots[slot_r_hand_str] = "righthand" + wielded_item_state + "-[ratio]"
		else
			item_state_slots[slot_l_hand_str] = "lefthand" + "-[ratio]"
			item_state_slots[slot_r_hand_str] = "righthand" + "-[ratio]"

	if(!item_charge_meter && item_modifystate)
		set_item_state("-[item_modifystate]")
	if(!ignore_inhands)
		update_wear_icon()


/obj/item/gun/energy/MouseDrop(over_object)
	if(!self_recharge && !disposable)
		if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(cell, usr))
			cell = null
			update_icon()
	if(self_recharge)
		to_chat(usr, SPAN_WARNING("[src] is a self-charging gun, its batteries cannot be removed!."))
	if(disposable)
		to_chat(usr, SPAN_WARNING("[src] is a disposable gun, its batteries cannot be removed!."))

/obj/item/gun/energy/attackby(obj/item/C, mob/living/user)
	..()
	if(self_recharge)
		to_chat(usr, SPAN_WARNING("[src] is a self-charging gun, it doesn't need more batteries."))
		return
	if(disposable)
		to_chat(usr, SPAN_WARNING("[src] is a disposable gun, it doesn't need more batteries."))
		return
	if(istype(C, suitable_cell))
		if(cell)
			if(replace_item(cell, C, user))
				cell = C
				update_icon()
		else if(insert_item(C, user))
			cell = C
			update_icon()

	if(istype(C, suitable_cell) && insert_item(C, user))
		cell = C
		update_icon()

/obj/item/gun/energy/attack_self(mob/user)
	if(!self_recharge && cell && cell.charge < charge_cost && eject_item(cell, user))
		cell = null
		update_icon()
		return
	..()

/obj/item/gun/energy/ui_data(mob/user)
	var/list/data = ..()

	var/list/stats = data["stats"]
	
	var/list/cell_stats = list()

	cell_stats += list(list("name" = "Power Usage", "type" = "AnimatedNumber", "value" = charge_cost))

	var/obj/item/cell/cell = get_cell()
	if(cell)
		cell_stats += list(list(
			"name" = "Cell Charge",
			"type" = "ProgressBar",
			"value" = cell.percent(),
			"unit" = "%",
			"max" = 100,
			"ranges" = list(
				"good" = list(100, 100),
				"average" = list(25, 100),
				"bad" = list(0, 24.99)
			)
		))
		var/shots_remaining = round(cell.charge / charge_cost)
		cell_stats += list(list("name" = "Shots Remaining", "type" = "ProgressBar", "value" = shots_remaining, "unit" = shots_remaining == 1 ? " shot" : " shots", "max" = round(cell.maxcharge / charge_cost)))
	else
		cell_stats += list(list("name" = "Cell Charge", "type" = "String", "value" = "No Cell Installed"))

	stats["Cell Stats"] = cell_stats

	return data

/obj/item/gun/energy/get_dud_projectile()
	return new projectile_type

/obj/item/gun/energy/refresh_upgrades()
	//refresh our unique variables before applying upgrades too
	charge_cost = initial(charge_cost)
	overcharge_max = initial(overcharge_max)
	overcharge_rate = initial(overcharge_rate)
	..()

/obj/item/gun/energy/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/smg_cock.ogg',20,4)

/obj/item/gun/energy/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/lmg_magin.ogg',20,4)
