/obj/item/mecha_parts/mecha_equipment/melee_weapon
	name = "mecha melee weapon"
	range = MECHA_MELEE
	origin_tech = list(TECH_MATERIAL = 3, TECH_COMBAT = 3)
	matter = list(MATERIAL_STEEL = 15)
	equip_cooldown = 15
	energy_drain = 10
	var/dam_force = 20
	required_type = /obj/mecha

/obj/item/mecha_parts/mecha_equipment/melee_weapon/action(atom/target)
	if(!action_checks(target)) return

	if(isliving(target))
		var/mob/living/M = target
		if(M.stat > 1)
			return
		if(chassis.occupant.a_intent != I_HELP) // So that the help intent act as a kind of safety
			M.take_overall_damage(dam_force)
			M.updatehealth()
			occupant_message(SPAN_WARNING("You attack [target] with [src.name]. Something cracks."))
			chassis.visible_message(SPAN_WARNING("[chassis] attacked [target]."))
			log_message("Attacked [target.name] with [name]")
		else
			step_away(M,chassis)
			occupant_message("You push [target] out of the way.")
			chassis.visible_message("[chassis] pushes [target] out of the way.")
		set_ready_state(0)
		chassis.use_power(energy_drain)
		do_after_cooldown()
		return 1


/obj/item/mecha_parts/mecha_equipment/melee_weapon/sword
	name = "mech sword"
	desc = "A huge sword designed to be wielded by an exosuit. Somehow can't hit walls."
	icon_state = "mech_sword"
	var/icon/melee_overlay
	dam_force = 40 // Big sword make big boo boo - R4d6


/obj/item/mecha_parts/mecha_equipment/melee_weapon/sword/action(atom/target)
	if(!action_checks(target)) return

	if(isliving(target))
		var/mob/living/M = target
		if(M.stat > 1)
			return
		if(chassis.occupant.a_intent != I_HELP) // So that the help intent act as a kind of safety
			M.take_overall_damage(dam_force)
			M.updatehealth()
			occupant_message(SPAN_WARNING("You swing at [target] with [src.name], slicing their flesh."))
			chassis.visible_message(SPAN_WARNING("[chassis] attacked [target]."))
			log_message("Attacked [target.name] with [name]")
		else
			step_away(M,chassis)
			occupant_message("You push [target] out of the way.")
			chassis.visible_message("[chassis] pushes [target] out of the way.")
		set_ready_state(0)
		chassis.use_power(energy_drain)
		do_after_cooldown()

	else // For attacking non living targets
		if(isobj(target)) 
			var/obj/target_obj = target
			if(!target_obj.vars.Find("unacidable") || target_obj.unacidable)	return
			var/C = chassis.loc
			var/T = target.loc
			if(T == chassis.loc && src == chassis.selected)
				if istype(target, /turf/simulated/wall)
				chassis.visible_message(SPAN_DANGER("\The [chassis] starts to cut into \the [target]"), SPAN_WARNING("You hear loud slashing."))
				occupant_message(SPAN_DANGER("You start to cut through \the [target]"))
					set_ready_state(0)
					chassis.use_power(energy_drain)
					do_after_cooldown()
					var/turf/simulated/wall/W = target
					if(W.reinf_material)
						occupant_message(SPAN_WARNING("\The [target] is too durable to cut apart."))
						chassis.visible_message("\The [name] lightly dents \the [target]")
						W.take_overall_damage(dam_force)
					else
						chassis.visible_message("Slashed through \the [target]")
						target.ex_act(2)
				if istype(target, /obj/machinery/door/airlock)
					chassis.visible_message(SPAN_DANGER("\The [chassis] starts to cut into \the [target]"), SPAN_WARNING("You hear loud slashing."))
					occupant_message(SPAN_DANGER("You start to cut through \the [target]"))
					var/obj/machinery/door/airlock/A = target
					set_ready_state(0)
					chassis.use_power(energy_drain)
					do_after_cooldown()
					A.take_overall_damage(dam_force)
				else if istype(target, /obj/effect/blob) // Blob combat
					var/obj/effect/blob/B = target
					if(istype(target, /obj/effect/blob/core) // Solely for flavor
						B.take_overall_damage(dam_force)
						occupant_message(SPAN_WARNING("The [chassis] starts to cut apart the [target]."))
						chassis.visible_message("The [chassis] strikes \the [target] with \the [name], causing golden ichor to spray out of it!")
					else
						B.take_overall_damage(dam_force)
						occupant_message(SPAN_WARNING("The [chassis] starts to cut apart the [target]."))
						chassis.visible_message("The [chassis] strikes \the [target] with \the [name]")
					set_ready_state(0)
					chassis.use_power(energy_drain)
					do_after_cooldown()
				else if(target.loc == C)
					log_message("Cut through \the [target]")
					target.ex_act(2)
	return 1


/obj/item/mecha_parts/mecha_equipment/melee_weapon/shockmaul
	name = "mech shock maul"
	desc = "A massive, plasteel maul designed to be wielded by an exosuit"
	icon_state = "mech_maul"
	var/icon/melee_overlay


/obj/item/mecha_parts/mecha_equipment/melee_weapon/shockmaul/action(atom/target)
	if(!action_checks(target)) return

	if(isliving(target))
		var/mob/living/M = target
		if(M.stat > 1)
			return
		if(chassis.occupant.a_intent != I_HELP) // So that the help intent act as a kind of safety
			M.damage_through_armor(80, HALLOSS, BP_CHEST)
			M.damage_through_armor(20, BURN, BP_CHEST,ARMOR_ENERGY)
			M.updatehealth()
			occupant_message(SPAN_WARNING("You bash [target] with [src.name], sizzling their flesh."))
			chassis.visible_message(SPAN_WARNING("[chassis] attacked [target]."))
			log_message("Attacked [target.name] with [name]")
		else
			step_away(M,chassis)
			occupant_message("You shove [target] out of the way.")
			chassis.visible_message("[chassis] pushes [target] out of the way.")
		set_ready_state(0)
		chassis.use_power(energy_drain)
		do_after_cooldown()
		

	else // For attacking non living targets
		if(isobj(target)) 
			var/obj/target_obj = target
			if(!target_obj.vars.Find("unacidable") || target_obj.unacidable)	return
			var/C = chassis.loc
			var/T = target.loc
			if istype(target, /obj/effect/blob) // Blob combat
				var/obj/effect/blob/B = target
				if(istype(target, /obj/effect/blob/core) // Solely for flavor
					B.take_overall_damage(dam_force)
					occupant_message(SPAN_WARNING("You bash \the [target] with [src.name]."))
					chassis.visible_message("The [chassis] strikes \the [target]  with \the [name], cracking its shell.")
				else
					B.take_overall_damage(dam_force)
					occupant_message(SPAN_WARNING("You bash \the [target] with [src.name]."))
					chassis.visible_message("The [chassis] strikes \the [target]  with \the [name]")
				set_ready_state(0)
				chassis.use_power(energy_drain)
				do_after_cooldown()
			else if(target.loc == C)
				log_message("Bashed through \the [target]")
				target.ex_act(2)
	return 1

/obj/item/mecha_parts/mecha_equipment/melee_weapon/sword/attach(obj/mecha/M as obj)
	..()
	if(istype(M, /obj/mecha/combat/durand))
		melee_overlay = new(src.icon, icon_state = "durand_mech_sword")
		M.add_overlay(melee_overlay)
	else if(istype(M, /obj/mecha/combat/gygax))
		melee_overlay = new(src.icon, icon_state = "gygax_mech_sword")
		M.add_overlay(melee_overlay)
	return
