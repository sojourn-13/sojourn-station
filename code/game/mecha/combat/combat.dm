/obj/mecha/combat
	force = 30
	var/melee_cooldown = 10
	var/melee_can_hit = 1
	var/list/destroyable_obj = list(/obj/mecha, /obj/structure/window, /obj/structure/grille, /turf/simulated/wall)
	internal_damage_threshold = 50
	maint_access = 0
	//add_req_access = 0
	//operation_req_access = list(access_hos)
	damage_absorption = list("brute"=0.7,"fire"=1,"bullet"=0.7,"energy"=1,"bomb"=0.8)
	var/am = "d3c2fbcadca903a41161ccc9df9cf948"
	var/list/cargo = new
	var/cargo_capacity = 5

/*
/obj/mecha/combat/range_action(target as obj|mob|turf)
	if(internal_damage&MECHA_INT_CONTROL_LOST)
		target = pick(view(3,target))
	if(selected_weapon)
		selected_weapon.fire(target)
	return
*/

/obj/mecha/combat/melee_action(target as obj|mob|turf)
	if(internal_damage&MECHA_INT_CONTROL_LOST)
		target = safepick(oview(1,src))
	if(!melee_can_hit || !istype(target, /atom)) return
	if(isliving(target))
		var/mob/living/M = target
		if(src.occupant.a_intent == I_HURT)
			playsound(src, 'sound/weapons/punch4.ogg', 50, 1)
			if(damtype == "brute")
				step_away(M,src,15)
			/*
			if(M.stat>1)
				M.gib()
				melee_can_hit = 0
				if(do_after(melee_cooldown))
					melee_can_hit = 1
				return
			*/
			if(istype(target, /mob/living/carbon/human))
				var/mob/living/carbon/human/H = target
	//			if (M.health <= 0) return

				var/obj/item/organ/external/temp = H.get_organ(pick(BP_CHEST, BP_CHEST, BP_CHEST, BP_HEAD))
				if(temp)
					var/update = 0
					switch(damtype)
						if("brute")
							H.Paralyse(1)
							update |= temp.take_damage(rand(force/2, force), 0)
						if("fire")
							update |= temp.take_damage(0, rand(force/2, force))
						if("tox")
							if(H.reagents)
								if(H.reagents.get_reagent_amount("carpotoxin") + force < force*2)
									H.reagents.add_reagent("carpotoxin", force)
								if(H.reagents.get_reagent_amount("cryptobiolin") + force < force*2)
									H.reagents.add_reagent("cryptobiolin", force)
						else
							return
					if(update)	H.UpdateDamageIcon()
				H.updatehealth()

			else
				switch(damtype)
					if("brute")
						M.Paralyse(1)
						M.take_overall_damage(rand(force/2, force))
					if("fire")
						M.take_overall_damage(0, rand(force/2, force))
					if("tox")
						if(M.reagents)
							if(M.reagents.get_reagent_amount("carpotoxin") + force < force*2)
								M.reagents.add_reagent("carpotoxin", force)
							if(M.reagents.get_reagent_amount("cryptobiolin") + force < force*2)
								M.reagents.add_reagent("cryptobiolin", force)
					else
						return
				M.updatehealth()
			src.occupant_message("You hit [target].")
			src.visible_message("<font color='red'><b>[src.name] hits [target].</b></font>")
		else
			step_away(M,src)
			src.occupant_message("You push [target] out of the way.")
			src.visible_message("[src] pushes [target] out of the way.")

		melee_can_hit = 0
		if(do_after(melee_cooldown))
			melee_can_hit = 1
		return

	else
		if(damtype == "brute")
			for(var/target_type in src.destroyable_obj)
				if(istype(target, target_type) && hascall(target, "attackby"))
					src.occupant_message("You hit [target].")
					src.visible_message("<font color='red'><b>[src.name] hits [target]</b></font>")
					if(!istype(target, /turf/simulated/wall))
						target:attackby(src,src.occupant)
					else if(prob(5))
						target:dismantle_wall(1)
						src.occupant_message(SPAN_NOTICE("You smash through the wall."))
						src.visible_message("<b>[src.name] smashes through the wall</b>")
						playsound(src, 'sound/weapons/smash.ogg', 50, 1)
					melee_can_hit = 0
					if(do_after(melee_cooldown))
						melee_can_hit = 1
					break
	return

/obj/mecha/combat/moved_inside(var/mob/living/carbon/human/H as mob)
	if(..())
		if(H.client)
			H.client.mouse_pointer_icon = file('icons/mecha/mecha_mouse.dmi')
		return 1
	else
		return 0

/obj/mecha/combat/go_out()
	if(src.occupant && src.occupant.client)
		src.occupant.client.mouse_pointer_icon = initial(src.occupant.client.mouse_pointer_icon)
	..()
	return

/obj/mecha/combat/Topic(href,href_list)
	..()
	var/datum/topic_input/m_filter = new (href,href_list)
	if(m_filter.get("close"))
		am = null
		return
	/*
	if(filter.get("saminput"))
		if(md5(filter.get("saminput")) == am)
			occupant_message("From the lies of the Antipath, Circuit preserve us.")
		am = null
	return
	*/

/obj/mecha/combat/Topic(href, href_list)
	..()
	if(href_list["drop_from_cargo"])
		var/obj/O = locate(href_list["drop_from_cargo"])
		if(O && (O in src.cargo))
			src.occupant_message(SPAN_NOTICE("You unload [O]."))
			O.loc = get_turf(src)
			src.cargo -= O
			var/turf/T = get_turf(O)
			if(T)
				T.Entered(O)
			src.log_message("Unloaded [O]. Cargo compartment capacity: [cargo_capacity - src.cargo.len]")
	return

/obj/mecha/combat/Exit(atom/movable/O)
	if(O in cargo)
		return 0
	return ..()

/obj/mecha/combat/get_stats_part()
	var/output = ..()
	output += "<b>Cargo Compartment Contents:</b><div style=\"margin-left: 15px;\">"
	if(src.cargo.len)
		for(var/obj/O in src.cargo)
			output += "<a href='?src=\ref[src];drop_from_cargo=\ref[O]'>Unload</a> : [O]<br>"
	else
		output += "Nothing"
	output += "</div>"
	return output

/obj/mecha/combat/range_action(atom/target as obj|mob|turf)
	return
