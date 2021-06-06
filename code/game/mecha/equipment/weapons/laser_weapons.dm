
/*
 * Contains
 * /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser
 * /obj/item/mecha_parts/mecha_equipment/weapon/energy/riggedlaser
 * /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy
 * /obj/item/mecha_parts/mecha_equipment/weapon/energy/ion
 * /obj/item/mecha_parts/mecha_equipment/weapon/energy/pulse
 * /obj/item/mecha_parts/mecha_equipment/weapon/energy/taser
 */

/obj/item/mecha_parts/mecha_equipment/weapon/energy
	name = "general energy weapon"
	auto_rearm = 1
	range = MECHA_MELEE | MECHA_RANGED

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser
	equip_cooldown = 8
	name = "\improper CH-PS \"Immolator\" laser"
	icon_state = "mecha_laser"
	energy_drain = 30
	projectile = /obj/item/projectile/beam
	fire_sound = 'sound/weapons/Laser.ogg'

/obj/item/mecha_parts/mecha_equipment/weapon/energy/riggedlaser
	equip_cooldown = 30
	name = "jury-rigged welder-laser"
	desc = "While not regulation, this inefficient weapon can be attached to working exo-suits in desperate, or malicious, times."
	icon_state = "mecha_laser"
	energy_drain = 80
	projectile = /obj/item/projectile/beam
	fire_sound = 'sound/weapons/Laser.ogg'
	required_type = list(/obj/mecha/combat, /obj/mecha/working, /obj/mecha/working)

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy
	equip_cooldown = 15
	name = "\improper CH-LC \"Solaris\" laser cannon"
	icon_state = "mecha_laser"
	energy_drain = 60
	projectile = /obj/item/projectile/beam/heavylaser
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy/auto
	equip_cooldown = 5
	name = "\improper Multi-laser Cannon"
	desc = "Four solaris laser cannons welded together to achieve a higher firerate."
	icon_state = "mecha_auto_laser"
	energy_drain = 180
	projectile = /obj/item/projectile/beam/heavylaser
	projectiles = 8
	projectiles_per_shot = 2
	fire_cooldown = 0
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

/obj/item/mecha_parts/mecha_equipment/weapon/energy/ion
	equip_cooldown = 40
	name = "mkIV ion heavy cannon"
	icon_state = "mecha_ion"
	energy_drain = 120
	projectile = /obj/item/projectile/ion
	fire_sound = 'sound/weapons/Laser.ogg'

/obj/item/mecha_parts/mecha_equipment/weapon/energy/pulse
	equip_cooldown = 30
	name = "eZ-13 mk2 heavy pulse rifle"
	icon_state = "mecha_pulse"
	energy_drain = 120
	origin_tech = list(TECH_MATERIAL = 3, TECH_COMBAT = 6, TECH_POWER = 4)
	projectile = /obj/item/projectile/beam/pulse/heavy
	fire_sound = 'sound/weapons/marauder.ogg'

/obj/item/projectile/beam/pulse/heavy
	name = "heavy pulse laser"
	icon_state = "pulse1_bl"
	var/life = 20

	Bump(atom/A, var/forced)
		A.bullet_act(src, def_zone)
		src.life -= 10
		if(life <= 0)
			qdel(src)
		return

/obj/item/mecha_parts/mecha_equipment/weapon/energy/taser
	name = "\improper PBT \"Pacifier\" mounted taser"
	icon_state = "mecha_taser"
	energy_drain = 20
	equip_cooldown = 8
	projectile = /obj/item/projectile/beam/stun
	fire_sound = 'sound/weapons/Taser.ogg'

/* Commenting this out rather than removing it because it may be useful for reference.
/obj/item/mecha_parts/mecha_equipment/weapon/honker
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
