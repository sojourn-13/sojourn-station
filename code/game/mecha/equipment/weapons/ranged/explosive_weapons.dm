/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack
	var/missile_speed = 2
	var/missile_range = 30
	max_ammo = 0
	loaded = TRUE //We always start loaded
	ammo_type = CAL_MECH_MISSILE
	range = MECHA_RANGED

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/get_equip_info()
		return "[..()]\[[src.projectiles]\][(src.projectiles < initial(src.projectiles))?" - <a href='?src=\ref[src];rearm=1'>Rearm</a>":null]"

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/Fire(atom/movable/AM, atom/target)
	AM.throw_at(target,missile_range, missile_speed, chassis)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/proc/rearm()
	if(projectiles < initial(projectiles))
		var/projectiles_to_add = initial(projectiles) - projectiles
		while(chassis.get_charge() >= projectile_energy_cost && projectiles_to_add)
			projectiles++
			projectiles_to_add--
			chassis.use_power(projectile_energy_cost)
	send_byjax(chassis.occupant,"exosuit.browser","\ref[src]",src.get_equip_info())
	log_message("Rearmed [src.name].")
	return

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/Topic(href, href_list)
	..()
	if (href_list["rearm"])
		src.rearm()
	return


/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flare
	name = "\improper BNI Flare Launcher"
	icon_state = "mecha_flaregun"
	projectile = /obj/item/device/lighting/glowstick/flare
	fire_sound = 'sound/weapons/tablehit1.ogg'
	auto_rearm = 1
	fire_cooldown = 20
	projectiles_per_shot = 1
	projectile_energy_cost = 200
	missile_speed = 1
	missile_range = 15
	required_type = /obj/mecha  //Why restrict it to just mining or combat mechs?

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flare/Fire(atom/movable/AM, atom/target, turf/aimloc)
	var/obj/item/device/lighting/glowstick/flare/fired = AM
	fired.turn_on()
	..()

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive
	name = "\improper SRM-6 missile rack"
	desc = "A rack of short range missiles with minimal targetting assistance, capable of firing six per burst without overheating it's mech."
	icon_state = "mecha_missilerack"
	projectile = /obj/item/missile
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 10, MATERIAL_SILVER = 5)
	missile_speed = 3
	missile_range = 10 //Short range
	fire_sound = 'sound/mecha/weapons/rocketlauncher.ogg'
	projectiles = 6
	projectile_energy_cost = 2000
	equip_cooldown = 60

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive/Fire(atom/movable/AM, atom/target)
	var/obj/item/missile/M = AM
	M.primed = 1
	..()

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/medium
	name = "\improper MRM-8 missile rack"
	desc = "A rack of medium range missiles with targetting assistance, capable of firing eight per burst without overheating it's mech."
	icon_state = "mecha_missilerack_mrm"
	projectile = /obj/item/missile
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 10, MATERIAL_SILVER = 5)
	missile_speed = 2
	fire_sound = 'sound/mecha/weapons/rocketlauncher.ogg'
	projectiles = 8
	projectile_energy_cost = 2000
	equip_cooldown = 60

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/medium/Fire(atom/movable/AM, atom/target)
	var/obj/item/missile/M = AM
	M.primed = 1
	..()

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flashbang
	name = "\improper SGL-4 grenade launcher"
	icon_state = "mecha_grenadelnchr"
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 10)
	projectile = /obj/item/grenade/flashbang
	fire_sound = 'sound/effects/bang.ogg'
	projectiles = 4
	missile_speed = 1.5
	projectile_energy_cost = 1200
	equip_cooldown = 60
	var/det_time = 20

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flashbang/Fire(atom/movable/AM, atom/target)
	..()
	var/obj/item/grenade/flashbang/F = AM
	spawn(det_time)
		F.prime()
