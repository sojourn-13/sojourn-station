/obj/mecha/combat/gygax
	desc = "A lightweight, security exosuit. Popular among private and corporate security."
	name = "Gygax"
	icon_state = "gygax"
	initial_icon = "gygax"
	step_in = 2
	normal_step_energy_drain = 2
	step_energy_drain = 2
	leg_overload_coeff = 2
	dir_in = 1 //Facing North.
	health = 900
	deflect_chance = 15
	damage_absorption = list("brute"=25,"melee"=25,"fire"=1,"bullet"=25,"energy"=25,"bomb"=1)
	armor_level = MECHA_ARMOR_SCOUT
	max_temperature = 25000
	price_tag = 25000
	infra_luminosity = 6
	wreckage = /obj/effect/decal/mecha_wreckage/gygax
	internal_damage_threshold = 35
	max_equip = 5
	cargo_capacity = 3

/obj/mecha/combat/gygax/GrantActions(mob/living/user)
	..()
	overload_action.Grant(user, src)

/obj/mecha/combat/gygax/RemoveActions(mob/living/user)
	..()
	overload_action.Remove(user)

/*******************/
/* Subtypes        */
/*******************/
/obj/mecha/combat/gygax/marshals
	name = "M.A.I.D Exosuit"
	desc = "The Marshals' Armored Incentive of Dispersal, a fancy name for a visibly aging exosuit that has visibly been collecting dust in some unused corner of the Marshals offices. \
	It appears to have much lighter armor than even a standard gygax and despite still bearing the characteristic angled plates of its Gygax cousin, is unlikely to stand up under extended\
	small-arms fire."
	icon_state = "maid"
	initial_icon = "maid"
	step_in = 3
	normal_step_energy_drain = 4
	step_energy_drain = 4
	armor_level = MECHA_ARMOR_LIGHT
	health = 750
	deflect_chance = 10
	damage_absorption = list("brute"=10,"melee"=10,"fire"=1,"bullet"=10,"energy"=10,"bomb"=1)
	price_tag = 10000
	internal_damage_threshold = 45
	wreckage = /obj/effect/decal/mecha_wreckage/gygax/marshals

/obj/mecha/combat/gygax/marshals/Initialize()
	. = ..()//Let it equip whatever is needed. TODO: This is stupid
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
	ME = new /obj/item/mecha_parts/mecha_equipment/melee_weapon/shockmaul
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/ppc
	ME.attach(src)



/obj/mecha/combat/gygax/dark
	desc = "A lightweight exosuit used by Heavy Asset Protection. A significantly upgraded Gygax security mech."
	name = "Dark Gygax"
	icon_state = "darkgygax"
	initial_icon = "darkgygax"
	health = 1200
	deflect_chance = 25
	damage_absorption = list("brute"=30,"melee"=30,"fire"=0.8,"bullet"=30,"energy"=30,"bomb"=0.8)
	max_temperature = 45000
	leg_overload_coeff = 1
	wreckage = /obj/effect/decal/mecha_wreckage/gygax/dark
	max_equip = 7
	normal_step_energy_drain = 1
	step_energy_drain = 1
	cargo_capacity = 5

/obj/mecha/combat/gygax/dark/Initialize()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flashbang
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/tesla_energy_relay
	ME.attach(src)
	return

/obj/mecha/combat/gygax/dark/add_cell()
	cell = new /obj/item/cell/large/hyper(src)
