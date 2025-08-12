/obj/mecha/combat/phazon
	desc = "An exosuit which can only be described as 'WTF?'."
	name = "Phazon"
	icon_state = "phazon"
	initial_icon = "phazon"
	step_in = 1
	dir_in = 1 //Facing North.
	normal_step_energy_drain = 3
	step_energy_drain = 3
	health = 600
	deflect_chance = 30
	damage_absorption = list("brute"=25,"melee"=25,"fire"=0.7,"bullet"=25,"energy"=25,"bomb"=0.7)
	armor_level = MECHA_ARMOR_MEDIUM
	max_temperature = 25000
	price_tag = 40000
	infra_luminosity = 3
	wreckage = /obj/effect/decal/mecha_wreckage/phazon
	add_req_access = 1
	//operation_req_access = list()
	internal_damage_threshold = 25
	force = 15
	max_equip = 5
	cargo_capacity = 1
	phase_state = "phazon-phase"

/obj/mecha/combat/phazon/GrantActions(mob/living/user)
	..()
	phasing_action.Grant(user, src)
	switch_damtype_action.Grant(user, src)

/obj/mecha/combat/phazon/RemoveActions(mob/living/user)
	..()
	phasing_action.Remove(user)
	switch_damtype_action.Remove(user)

/obj/mecha/combat/phazon/Initialize()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/tool/rcd
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/gravcatapult
	ME.attach(src)
	bluespace_entropy(10, get_turf(src))

/obj/mecha/combat/phazon/add_cell()
	cell = new /obj/item/cell/large/moebius/nuclear(src)

