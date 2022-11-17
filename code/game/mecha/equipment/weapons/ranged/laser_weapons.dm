
/*
 * Contains
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/riggedlaser
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy/auto
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/ion
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/pulse
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/taser
 * /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/plasma
 */

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy
	name = "general energy weapon"
	auto_rearm = 1
	range = MECHA_MELEE | MECHA_RANGED

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser
	equip_cooldown = 5
	name = "\improper CH-PS \"Immolator\" laser"
	icon_state = "mecha_laser"
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 10, MATERIAL_SILVER  =10)
	energy_drain = 30
	projectile = /obj/item/projectile/beam
	fire_sound = 'sound/weapons/Laser.ogg'
	price_tag = 400

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/riggedlaser
	equip_cooldown = 15
	name = "jury-rigged welder-laser"
	desc = "While not regulation, this inefficient weapon can be attached to working exo-suits in desperate, or malicious, times."
	icon_state = "mecha_laser"
	energy_drain = 60
	projectile = /obj/item/projectile/beam
	fire_sound = 'sound/weapons/Laser.ogg'
	required_type = list(/obj/mecha/combat, /obj/mecha/working, /obj/mecha/working)
	price_tag = 200

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy
	equip_cooldown = 10
	name = "\improper CH-LC \"Solaris\" laser cannon"
	icon_state = "mecha_laser"
	matter = list(MATERIAL_STEEL = 25, MATERIAL_PLASTEEL = 15, MATERIAL_SILVER  =10)
	energy_drain = 100
	projectile = /obj/item/projectile/beam/heavylaser
	fire_sound = 'sound/weapons/lasercannonfire.ogg'
	price_tag = 500

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy/auto
	equip_cooldown = 5
	name = "\improper Multi-laser Cannon"
	desc = "Four solaris laser cannons welded together to achieve a higher firerate."
	icon_state = "mecha_auto_laser"
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 5, MATERIAL_SILVER = 1)
	energy_drain = 250 //less efficient than its constituent parts but more punchy per burst
	projectile = /obj/item/projectile/beam/heavylaser
	projectiles = 8
	projectiles_per_shot = 2
	fire_cooldown = 5 //so we dont fire all our beams at the exact same instant. Remember! We track once a target is clicked!
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/ion
	equip_cooldown = 40 //this is fine.
	name = "mkIV ion heavy cannon"
	icon_state = "mecha_ion"
	energy_drain = 500 //VERY strong, expensive to fire!
	projectile = /obj/item/projectile/ion
	fire_sound = 'sound/weapons/Laser.ogg'
	price_tag = 300

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/pulse
	equip_cooldown = 30 //this is fine.
	name = "\improper \"MPL-3 MK2\" heavy pulse rifle"
	desc = "A remnant of bygone age even in it's full glory, unlike it's infantry version it features a burst mode with lack of any EMP elements."
	icon_state = "mecha_pulse"
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 10, MATERIAL_URANIUM  =5)
	projectiles_per_shot = 2
	deviation = 3
	fire_cooldown = 2
	energy_drain = 150 //more expensive than a heavy, less than a multi-las, highly advanced laser!
	origin_tech = list(TECH_MATERIAL = 3, TECH_COMBAT = 6, TECH_POWER = 4)
	projectile = /obj/item/projectile/beam/pulse/heavy
	fire_sound = 'sound/weapons/energy/pulse2.ogg'

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/taser
	name = "\improper PBT \"Pacifier\" mounted taser"
	icon_state = "mecha_taser"
	matter = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 10, MATERIAL_SILVER  =5)
	energy_drain = 90
	equip_cooldown = 8
	projectile = /obj/item/projectile/beam/stun
	fire_sound = 'sound/weapons/Taser.ogg'

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/hydrogen
	name = "\improper Mech-mounted Hydrogen-Plasma Cannon"
	desc = "A Sollex-Pattern hydrogen-plasma cannon, modified to fit on combat exosuits. Unlike its hand-held counter-part, this one doesn't need cooling, as it use the Exosuit's systems for that purpose."
	icon_state = "hydrogen_cannon"
	energy_drain = 1000
	fire_cooldown = 25
	matter = list(MATERIAL_PLASTEEL = 30, MATERIAL_MHYDROGEN = 6, MATERIAL_TRITIUM = 6)
	origin_tech = list(TECH_COMBAT = 9, TECH_MATERIAL = 7, TECH_PLASMA = 10)
	projectile = /obj/item/projectile/hydrogen/cannon/max
	fire_sound = 'sound/weapons/lasercannonfire.ogg'
	price_tag = 1300 //state of the art

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/sonic
	equip_cooldown = 15
	name = "mech-mounted sonic emitter"
	desc = "An upscaled version of the handheld sonic emitter, designed to be mounted on an exosuit. Being bigger, it is more efficient than the handheld version, packing a bigger punch for less power."
	icon_state = "mecha_pulse"
	energy_drain = 50
	projectile = /obj/item/projectile/sonic_bolt/heavy
	fire_sound = 'sound/weapons/Laser.ogg'
	required_type = list(/obj/mecha/combat, /obj/mecha/working)
	price_tag = 200

/* Commenting this out rather than removing it because it may be useful for reference.
/obj/item/mecha_parts/mecha_equipment/ranged_weapon/honker
	name = "\improper HoNkER BlAsT 5000"
	icon_state = "mecha_honker"
	energy_drain = 200
	equip_cooldown = 150
	range = MELEE|RANGED
	construction_time = 500
	construction_cost = list("metal"=20000,"bananium"=10000)

	can_attach(obj/mecha/combat/honker/M as obj)
		if(!istype(M))
			return 0
		return ..()

	action(target)
		if(!chassis)
			return 0
		if(energy_drain && chassis.get_charge() < energy_drain)
			return 0
		if(!equip_ready)
			return 0

		playsound(chassis, 'sound/items/AirHorn.ogg', 100, 1)
		chassis.occupant_message("<font color='red' size='5'>HONK</font>")
		for(var/mob/living/carbon/M in ohearers(6, chassis))
			if(ishuman(M))
				var/mob/living/carbon/human/H = M
				if(istype(H.l_ear, /obj/item/clothing/ears/earmuffs) || istype(H.r_ear, /obj/item/clothing/ears/earmuffs))
					continue
			to_chat(M, "<font color='red' size='7'>HONK</font>")
			M.sleeping = 0
			M.stuttering += 20
			M.ear_deaf += 30
			M.Weaken(3)
			if(prob(30))
				M.Stun(10)
				M.Paralyse(4)
			else
				M.make_jittery(500)
		chassis.use_power(energy_drain)
		log_message("Honked from [src.name]. HONK!")
		do_after_cooldown()
		return
*/
