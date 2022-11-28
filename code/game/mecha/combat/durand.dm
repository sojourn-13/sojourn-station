/obj/mecha/combat/durand
	desc = "An aging combat exosuit utilized by many frontier groups. Originally developed to combat hostile alien lifeforms."
	name = "Durand"
	icon_state = "durand"
	initial_icon = "durand"
	step_in = 3
	step_energy_drain = 3
	dir_in = 1 //Facing North.
	health = 800
	deflect_chance = 20
	damage_absorption = list("brute"=0.5,"fire"=1.1,"bullet"=0.65,"energy"=0.9,"bomb"=1)
	armor_level = MECHA_ARMOR_HEAVY
	max_temperature = 30000
	price_tag = 25000
	infra_luminosity = 8
	force = 40
	var/defence = 0
	var/def_boost = 30
	wreckage = /obj/effect/decal/mecha_wreckage/durand
	max_equip = 5
	internal_damage_threshold = 30

/obj/mecha/combat/durand/New()
	..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon/loaded(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/loaded(src)
	ME.attach(src)
	return

/obj/mecha/combat/durand/relaymove(mob/user,direction)
	if(defence)
		if(world.time - last_message > 20)
			src.occupant_message("<font color='red'>Unable to move while in defence mode</font>")
			last_message = world.time
		return 0
	. = ..()
	return

/obj/mecha/combat/durand/security
	desc = "A heavy mech suit even older than the standard durand. This one has been repurposed for the security team but isn't in the best shape."
	name = "Old Stomper"
	icon_state = "old_durand"
	initial_icon = "old_durand"
	wreckage = /obj/effect/decal/mecha_wreckage/durand/security
	step_in = 5
	internal_damage_threshold = 40

/obj/mecha/combat/durand/security/New()
	..()//Let it equip whatever is needed.
	var/obj/item/mecha_parts/mecha_equipment/ME
	if(equipment.len)//Now to remove it and equip anew.
		for(ME in equipment)
			ME.detach(src)
			qdel(ME)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/ion
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flashbang
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/taser
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/melee_weapon/sword
	ME.attach(src)
	return

/obj/mecha/combat/durand/verb/defence_mode()
	set category = "Exosuit Interface"
	set name = "Toggle defence mode"
	set src = usr.loc
	set popup_menu = 0
	if(usr!=src.occupant)
		return
	defence = !defence
	if(defence)
		deflect_chance += def_boost
		src.occupant_message("<font color='blue'>You enable [src] defence mode.</font>")
	else
		deflect_chance -= def_boost
		src.occupant_message("<font color='red'>You disable [src] defence mode.</font>")
	src.log_message("Toggled defence mode.")
	return


/obj/mecha/combat/durand/get_stats_part()
	var/output = ..()
	output += "<b>Defence mode: [defence?"on":"off"]</b>"
	return output

/obj/mecha/combat/durand/get_commands()
	var/output = {"<div class='wr'>
						<div class='header'>Special</div>
						<div class='links'>
						<a href='?src=\ref[src];toggle_defence_mode=1'>Toggle defence mode</a>
						</div>
						</div>
						"}
	output += ..()
	return output

/obj/mecha/combat/durand/Topic(href, href_list)
	..()
	if (href_list["toggle_defence_mode"])
		src.defence_mode()
	return
