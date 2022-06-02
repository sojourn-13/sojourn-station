/obj/item/mecha_parts/mecha_equipment/melee_weapon
	name = "mecha melee weapon"
	range = MECHA_MELEE
	origin_tech = list(TECH_MATERIAL = 3, TECH_COMBAT = 3)
	matter = list(MATERIAL_STEEL = 15)
	equip_cooldown = 15
	energy_drain = 10
	structure_damage_factor = 2
	force = 20
	required_type = /obj/mecha
	embed_mult = 0 // Mech mounted weapons, shouldn't embed
	
/obj/item/mecha_parts/mecha_equipment/melee_weapon/fist
	name = "mech melee plating"
	desc = "Plating design to cover and reinforce the limbs of the mech to allow the pilot to punch or kick foes without inflicting damage upon the mech."
	icon_state = "mecha_fist"
	armor_penetration = ARMOR_PEN_DEEP
	structure_damage_factor = 2
	hitsound = 'sound/weapons/heavysmash.ogg'
	var/icon/melee_overlay //Currently dosnt do anything but is here for sake of constancey
	force = 30

/obj/item/mecha_parts/mecha_equipment/melee_weapon/sword
	name = "mech sword"
	desc = "A huge sword designed to be wielded by an exosuit."
	icon_state = "mech_sword"
	sharp = TRUE
	edge = TRUE
	tool_qualities = list(QUALITY_CUTTING = 35, QUALITY_SAWING = 20) // It's a literal mech sized blade
	armor_penetration = ARMOR_PEN_DEEP
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	hitsound = 'sound/weapons/bladeslice.ogg'
	var/icon/melee_overlay
	force = 60 // Big sword make big boo boo - R4d6 / Upped further because delay - Wizard

/obj/item/mecha_parts/mecha_equipment/melee_weapon/sword/attach(obj/mecha/M as obj)
	..()
	if(istype(M, /obj/mecha/combat/durand))
		melee_overlay = new(src.icon, icon_state = "durand_mech_sword")
		M.add_overlay(melee_overlay)
	else if(istype(M, /obj/mecha/combat/gygax))
		melee_overlay = new(src.icon, icon_state = "gygax_mech_sword")
		M.add_overlay(melee_overlay)
	return

/obj/item/mecha_parts/mecha_equipment/melee_weapon/cutlass
	name = "mech energy cutlass"
	desc = "A huge energy cutlass designed to be wielded by an exosuit."
	icon_state = "mecha_cutlass"
	sharp = TRUE
	edge = TRUE
	tool_qualities = list(QUALITY_CUTTING = 30,  QUALITY_WIRE_CUTTING = 20, QUALITY_WELDING = 1, QUALITY_CAUTERIZING = 1) //Same as E-cutlasses
	armor_penetration = ARMOR_PEN_DEEP
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	hitsound = 'sound/weapons/bladeslice.ogg'
	var/icon/melee_overlay
	force = 65 //5 more for all its extra costs is the balancing

/obj/item/mecha_parts/mecha_equipment/melee_weapon/cutlass/attach(obj/mecha/M as obj)
	..()
	//Todo: "cutless" based icons for this rather then base.
	if(istype(M, /obj/mecha/combat/durand))
		melee_overlay = new(src.icon, icon_state = "durand_mech_sword")
		M.add_overlay(melee_overlay)
	else if(istype(M, /obj/mecha/combat/gygax))
		melee_overlay = new(src.icon, icon_state = "gygax_mech_sword")
		M.add_overlay(melee_overlay)
	return

/obj/item/mecha_parts/mecha_equipment/melee_weapon/shockmaul
	name = "mech shock maul"
	desc = "A massive, plasteel maul designed to be wielded by an exosuit"
	icon_state = "mech_maul"
	hitsound = 'sound/weapons/Egloves.ogg'
	matter = list(MATERIAL_STEEL = 10, MATERIAL_SILVER = 2)
	var/icon/melee_overlay
	var/agonyforce = 80
	var/stunforce = 0

/obj/item/mecha_parts/mecha_equipment/melee_weapon/shockmaul/attack(mob/living/M, mob/living/user, target_zone)
	M.stun_effect_act(stunforce, agonyforce, target_zone, src)
	return ..()
