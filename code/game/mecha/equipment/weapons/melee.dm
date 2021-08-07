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
	dam_force = 40 // Big sword make big boo boo - R4d6
