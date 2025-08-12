/obj/mecha/combat/dreadnought
	desc = "Heavy-duty, combat exosuit, developed after the Durand model. Rarely found among civilian populations."
	name = "Dreadnought"
	icon_state = "marauder"
	initial_icon = "marauder"
	step_in = 3
	normal_step_energy_drain = 3
	step_energy_drain = 3
	price_tag = 25000 //Rare spawns + uncraftable
	health = 1500
	deflect_chance = 25
	damage_absorption = list("brute"=50,"melee"=50,"fire"=0.7,"bullet"=50,"energy"=50,"bomb"=0.7)
	max_temperature = 60000
	infra_luminosity = 3
	armor_level = MECHA_ARMOR_SUPERHEAVY
	wreckage = /obj/effect/decal/mecha_wreckage/marauder
	add_req_access = 0
	internal_damage_threshold = 25
	force = 45
	max_equip = 10

/obj/mecha/combat/dreadnought/GrantActions(mob/living/user)
	. = ..()
	smoke_action.Grant(user, src)
	zoom_action.Grant(user, src)

/obj/mecha/combat/dreadnought/RemoveActions(mob/living/user)
	. = ..()
	smoke_action.Remove(user)
	zoom_action.Remove(user)

/obj/mecha/combat/dreadnought/Initialize()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/pulse(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/loaded(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/drill(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/thruster(src)
	ME.attach(src)

/*******************/
/* Subtypes        */
/*******************/

/obj/mecha/combat/dreadnought/gloria
	name = "Warhound Gloria"
	desc = "What was once a heavily augmented person is now a walking tank, modeled after a dreadnought combat mech, Warhound Gloria is the pinnacle of excelsior engineering. A \
	heavily armored and even more heavily equipped bastion for the people's revolution. The modified combat armor appears to be specialized at withstanding electro-magnetic pulses, but \
	otherwise functions as a standard dreadnought."
	icon_state = "mauler"
	initial_icon = "mauler"
	wreckage = /obj/effect/decal/mecha_wreckage/mauler

/obj/mecha/combat/dreadnought/gloria/emp_act(severity)
	return

/obj/mecha/combat/dreadnought/gloria/Initialize()
	. = ..()//Let it equip whatever is needed. TODO: This is stupid
	var/obj/item/mecha_parts/mecha_equipment/ME
	if(equipment.len)//Now to remove it and equip anew.
		for(ME in equipment)
			ME.detach(src)
			qdel(ME)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/ion(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/pulse(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/loaded(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flashbang(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/hmg(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/hmg(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/thruster(src)
	ME.attach(src)
	smoke_system.set_up(3, 0, src)
	smoke_system.attach(src)


/obj/mecha/combat/dreadnought/seraph
	desc = "Heavy-duty, command-type exosuit. This is a custom model, utilized only by high-ranking military personnel."
	name = "Seraph"
	icon_state = "seraph"
	initial_icon = "seraph"
	step_in = 2
	normal_step_energy_drain = 1
	step_energy_drain = 1
	health = 1800
	wreckage = /obj/effect/decal/mecha_wreckage/seraph
	internal_damage_threshold = 20
	force = 55
	max_equip = 10
	cargo_capacity = 10

/obj/mecha/combat/dreadnought/seraph/Initialize()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME
	if(equipment.len)//Now to remove it and equip anew.
		for(ME in equipment)
			ME.detach(src)
			qdel(ME)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon/loaded(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/loaded(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/teleporter(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/armor_booster/antiproj_armor_booster(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/armor_booster/anticcw_armor_booster(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/thruster(src)
	ME.attach(src)

/obj/mecha/combat/dreadnought/seraph/hellbrute
	desc = "Heavy-duty, combat exosuit, developed off of the existing seraph model. Usually found in the hands of a void wolf reavers. As rare as it is powerful."
	name = "Hell Brute"
	icon_state = "mauler"
	initial_icon = "mauler"
	wreckage = /obj/effect/decal/mecha_wreckage/mauler
