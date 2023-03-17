/obj/mecha/combat/basiliscus
	name = "Basiliscus Tankette V2"
	desc = "The second, smaller version of the solfed-feared tank of New-Byzantine design, reshaped by the Church and Guild into an smaller size for combat in areas with dense vegetation and inside the colony - an minitank of the size of an airlock. After the destruction of the empire during the war against Sol Federation, the design has been forgotten by time. With the current solfed menace in Nadezhda the Church Numericals and Guild Artisans worked together to form their own tank to meet an proper safety agenda that was lacking on the colony, with the outcome being an absurdly formidable on the fighting and defensive prowerness, deadly and perfect for destroying mechas and structures- but it is very slow to turn and have an slow moving speed, making it rely on infantry support to not be destroyed if it gets flanked, becoming more viable for artillery support and as an steady shield against enemy attacks."
	icon_state = "basiliscus"
	initial_icon = "basiliscus"
	step_in = 3
	step_energy_drain = 1 //Rolling Rolling Rolling
	price_tag = 25000
	health = 1000
	deflect_chance = 25
	damage_absorption = list("brute"=0.6,"fire"=0.7,"bullet"=0.6,"energy"=0.7,"bomb"=0.9)
	max_temperature = 30000
	infra_luminosity = 3
	armor_level = MECHA_ARMOR_HEAVY
	wreckage = /obj/effect/decal/mecha_wreckage/tank
	add_req_access = 0
	internal_damage_threshold = 25 // Tonk
	force = 10 //Has no HANDS
	max_equip = 10

/obj/mecha/combat/basiliscus/equiped/New()
	..()
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
	return
