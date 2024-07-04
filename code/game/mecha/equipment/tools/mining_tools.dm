/*
 * Contains
 * /obj/item/mecha_parts/mecha_equipment/tool/drill
 * /obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill
 */

/obj/item/mecha_parts/mecha_equipment/tool/drill
	name = "drill"
	desc = "This is the drill that'll pierce the heavens! (Can be attached to: Combat and Engineering Exosuits)"
	icon_state = "mecha_drill"
	equip_cooldown = 15
	energy_drain = 10
	price_tag = 150
	force = 30
	armor_divisor = ARMOR_PEN_DEEP
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	tool_qualities = list(QUALITY_DIGGING = 60)
	required_type = list(/obj/mecha/working, /obj/mecha/combat, /obj/mecha/medical)

/obj/item/mecha_parts/mecha_equipment/tool/drill/action(atom/T, mob/living/user)
	attack_object(T,user) // drill has nothing special to do, just drilling

/obj/item/mecha_parts/mecha_equipment/tool/drill/attack_object(obj/T, mob/living/user) // attack_object override for all of the drill's fancy interactions after action()
	..() // strike the earth

	if(locate(/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp) in chassis.equipment) // load ore if any is nearby after striking something
		var/obj/structure/ore_box/ore_box = locate(/obj/structure/ore_box) in chassis.cargo
		if(ore_box)
			for(var/obj/item/stack/ore/ore in range(chassis,1))
				if(get_dir(chassis,ore)&chassis.dir)
					ore.Move(ore_box)

	return 1

/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill
	name = "diamond drill"
	desc = "This is an upgraded version of the drill that'll pierce the heavens! (Can be attached to: Combat and Engineering Exosuits)"
	icon_state = "mecha_diamond_drill"
	origin_tech = list(TECH_MATERIAL = 4, TECH_ENGINEERING = 3)
	matter = list(MATERIAL_STEEL = 15, MATERIAL_DIAMOND = 3)
	equip_cooldown = 10 // 3 diamonds for 3x the speed!
	force = 40
	tool_qualities = list(QUALITY_DIGGING = 90)

/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill/action(atom/T, mob/living/user)
	attack_object(T,user) // drill has nothing special to do, just drilling

/obj/item/mecha_parts/mecha_equipment/tool/drill/diamonddrill/attack_object(obj/T, mob/living/user) // attack_object override for all of the drill's fancy interactions after action()
	..() // strike the earth

	if(locate(/obj/item/mecha_parts/mecha_equipment/tool/hydraulic_clamp) in chassis.equipment) // load ore if any is nearby after striking something
		var/obj/structure/ore_box/ore_box = locate(/obj/structure/ore_box) in chassis.cargo
		if(ore_box)
			for(var/obj/item/stack/ore/ore in range(chassis,1))
				if(get_dir(chassis,ore)&chassis.dir)
					ore.Move(ore_box)

	return 1
