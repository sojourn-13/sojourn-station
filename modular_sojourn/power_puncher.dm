//The Pow! Uses damage taken to make power, can be moved around and store damage untill wired down
//Drains power at a % so that higher values drain faster well low trickles stay, greate for setting up in low power areas or when you got a ton of ammo to spare


/obj/machinery/power/puncher
	name = "P.O.W"
	desc = "An odd power generator designed to effectively turn any kinetic force it back into power at an increased rate due to trickery with its complex internals."

	circuit = /obj/item/circuitboard/puncher

	icon = 'icons/obj/power.dmi'
	icon_state = "pow"
	density = 1
	anchored = 0
	use_power = NO_POWER_USE

	var/power_gen = 0
	var/power_loss = 5

	var/scale_one = 5
	var/scale_two = 20
	var/scale_three = 50
	var/scale_four = 75
	var/scale_five = 100

	var/emp_scale_one = 75
	var/emp_scale_two = 25

	var/bomb_scale_one = 30
	var/bomb_scale_two = 150
	var/bomb_scale_three = 15
	var/bomb_scale_four = 125
	var/bomb_scale_five = 10
	var/bomb_scale_six = 100


/obj/item/circuitboard/puncher
	build_name = "P.O.W"
	board_type = "machine"
	build_path = /obj/machinery/power/puncher
	origin_tech = list(TECH_BLUESPACE = 3, TECH_MAGNET = 3, TECH_ILLEGAL = 2)
	req_components = list(
		/obj/item/stock_parts/subspace/transmitter = 5,
		/obj/item/stock_parts/subspace/crystal = 3,
		/obj/item/stock_parts/subspace/amplifier = 2,
		/obj/item/stock_parts/capacitor = 1,
		/obj/item/device/psionic_catalyst = 1,
		/obj/item/stack/cable_coil = 30
	)

/obj/machinery/power/puncher/RefreshParts()
	power_loss = initial(power_loss)
	for(var/obj/item/stock_parts/capacitor/SP in component_parts)
		if(istype(SP, /obj/item/stock_parts/capacitor))
			power_loss = (power_loss - (SP.rating * 0.1))

/obj/machinery/power/puncher/Process()
	if(anchored && powernet && power_gen >= 1)
		add_avail(power_gen)
		var/temp_power_loss = power_gen * 0.01
		power_gen -= (power_loss * temp_power_loss)

	update_icon()


/obj/machinery/power/puncher/proc/take_damage(amount, type)
	//log_debug("take_damage: amount = [amount] | type = [type]")
	if(type == BRUTE || type == HALLOSS)
		power_gen += amount * scale_one
	if(type == BURN || type == ELECTROCUTE)
		power_gen += amount * scale_two
	if(type == OXY || type == TOX)
		power_gen += amount * scale_three
	if(type == CLONE || type == PSY)
		power_gen += amount * scale_four
	if(type == BLAST || type == IRRADIATE)
		power_gen += amount * scale_five

/obj/machinery/power/puncher/emp_act(severity)
	switch(severity)
		if(1)
			take_damage(emp_scale_one, ELECTROCUTE)
		if(2)
			take_damage(emp_scale_two, ELECTROCUTE)

/obj/machinery/power/puncher/ex_act(severity)
	switch(severity)
		if(1)
			take_damage(bomb_scale_one, BLAST)
			take_damage(bomb_scale_two, BRUTE)
		if(2)
			take_damage(bomb_scale_three, BLAST)
			take_damage(bomb_scale_four, BRUTE)
		if(3)
			take_damage(bomb_scale_five, BLAST)
			take_damage(bomb_scale_six, BRUTE)
	return

/obj/machinery/power/puncher/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
	if(istype(user))
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
		user.do_attack_animation(src)
		visible_message(SPAN_DANGER("[user] smashes into [src]!"))
		take_damage(damage, BRUTE)
		return 1

/obj/machinery/power/puncher/bullet_act(obj/item/projectile/P, def_zone)
	. = ..()
	if (!(P.testing))
		for(var/dmg_type in P.damage_types)
			var/dmg = P.damage_types[dmg_type]
			take_damage(dmg, dmg_type)
		if(P.agony)
			take_damage(P.agony, HALLOSS)
		if(P.armor_divisor)
			take_damage(P.armor_divisor * 10, HALLOSS)

/obj/machinery/power/puncher/Destroy()
	return ..()

/obj/machinery/power/puncher/RefreshParts()
	return

/obj/machinery/power/puncher/examine(mob/user)
	..(user)
	to_chat(user, "\The [src] appears to be producing [power_gen] W.")

/obj/machinery/power/puncher/attackby(var/obj/item/I, var/mob/user)

	if(default_part_replacement(I, user))
		return

	var/list/usable_qualities = list(QUALITY_BOLT_TURNING, QUALITY_SCREW_DRIVING)

	if(panel_open && circuit)
		usable_qualities += QUALITY_PRYING

	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	switch(tool_type)

		if(QUALITY_BOLT_TURNING)
			if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_BOLT_TURNING, FAILCHANCE_EASY,  required_stat = STAT_MEC))
				playsound(src.loc, 'sound/items/Ratchet.ogg', 75, 1)
				if(anchored)
					to_chat(user, SPAN_NOTICE("You unsecure the [src] from the floor!"))
					anchored = FALSE
				else
					if(istype(get_turf(src), /turf/space)) return //No wrenching these in space!
					to_chat(user, SPAN_NOTICE("You secure the [src] to the floor!"))
					anchored = TRUE

				if(anchored)
					connect_to_network()
				else
					disconnect_from_network()

				return

		if(QUALITY_PRYING)
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_HARD, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You remove the components of \the [src] with [I]."))
				dismantle()
			return TRUE

		if(QUALITY_SCREW_DRIVING)
			var/used_sound = panel_open ? 'sound/machines/Custom_screwdriveropen.ogg' :  'sound/machines/Custom_screwdriverclose.ogg'
			if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC, instant_finish_tier = 30, forced_sound = used_sound))
				panel_open = !panel_open
				to_chat(user, SPAN_NOTICE("You [panel_open ? "open" : "close"] the maintenance hatch of \the [src] with [I]."))
			return TRUE

		if(ABORT_CHECK)
			return

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.do_attack_animation(src)
	take_damage(I.force, BRUTE)


/obj/machinery/power/puncher/attack_hand(mob/user)
	..()
	if (!anchored)
		return
