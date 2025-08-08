/obj/mecha/combat/durand
	desc = "An aging combat exosuit utilized by many frontier groups. Originally developed to combat hostile alien lifeforms."
	name = "Durand"
	icon_state = "durand"
	initial_icon = "durand"
	step_in = 3
	normal_step_energy_drain = 3
	step_energy_drain = 3
	dir_in = 1 //Facing North.
	health = 1400
	deflect_chance = 20
	damage_absorption = list("brute"=0.5,"fire"=1.1,"bullet"=0.65,"energy"=0.9,"bomb"=1)
	armor_level = MECHA_ARMOR_HEAVY
	max_temperature = 30000
	price_tag = 25000
	infra_luminosity = 8
	force = 40
	wreckage = /obj/effect/decal/mecha_wreckage/durand
	max_equip = 5
	internal_damage_threshold = 30

/obj/mecha/combat/durand/Initialize()
	. = ..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/ultracannon/loaded(src)
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/scattershot/loaded(src)
	ME.attach(src)

/obj/mecha/combat/durand/GrantActions(mob/living/user)
	. = ..()
	defense_action.Grant(user, src)

/obj/mecha/combat/durand/RemoveActions(mob/living/user)
	. = ..()
	defense_action.Remove(user)

/obj/mecha/combat/durand/security
	desc = "A heavy mech suit even older than the standard durand. This one has been repurposed for the security team but isn't in the best shape."
	name = "Old Stomper"
	icon_state = "old_durand"
	initial_icon = "old_durand"
	wreckage = /obj/effect/decal/mecha_wreckage/durand/security
	step_in = 5
	internal_damage_threshold = 40

/obj/mecha/combat/durand/security/Initialize()
	. = ..()//Let it equip whatever is needed. - TODO: this is stupid
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
