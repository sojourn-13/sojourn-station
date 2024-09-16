/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack
	var/missile_speed = 2
	var/missile_range = 30
	max_ammo = 0
	loaded = TRUE //We always start loaded
	ammo_type = CAL_MECH_MISSILE
	range = MECHA_RANGED

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/get_equip_info()
	return "[..()]\[[projectiles]\][(projectiles < initial(projectiles))?" - <a href='?src=\ref[src];rearm=1'>Rearm</a>":null]"

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/Fire(atom/movable/AM, atom/target)
	AM.throw_at(target,missile_range, missile_speed, chassis)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/proc/rearm()
	if(projectiles < initial(projectiles))
		var/projectiles_to_add = initial(projectiles) - projectiles
		while(chassis.get_charge() >= projectile_energy_cost && projectiles_to_add)
			projectiles++
			projectiles_to_add--
			chassis.use_power(projectile_energy_cost)
	send_byjax(chassis.occupant, "exosuit.browser", "\ref[src]", get_equip_info())
	log_message("Rearmed [name].")

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/Topic(href, href_list)
	. = ..()
	if(href_list["rearm"])
		rearm()


/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/flare
	name = "\improper BNI Flare Launcher"
	desc = "An ubiquitous mining flare launcher used everywhere you can think of, from space to under water."
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
	. = ..()

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive
	name = "\improper ATM-9 missile rack"
	desc = "A rack of advanced tactical missiles lacking proper targetting computers onboard to cheapen their production. Fires in salvos of three and can do so as many times before having to be refitted."
	icon_state = "mecha_missilerack"
	projectile = /obj/item/missile
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 10, MATERIAL_SILVER = 5)
	missile_speed = 2
	fire_sound = 'sound/mecha/weapons/rocketlauncher.ogg'
	projectiles = 9
	max_ammo = 9
	missile_speed = 2
	missile_range = 15 //Medium
	projectiles_per_shot = 3
	fire_cooldown = 2
	projectile_energy_cost = 2000
	equip_cooldown = 60
	required_type = list(/obj/mecha/combat)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/explosive/Fire(atom/movable/AM, atom/target)
	var/obj/item/missile/M = AM
	M.primed = 1
	. = ..()

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/long
	name = "\improper \"Arrowhead\" S1 Long Tom missile launcher"
	desc = "A singular massive bunker-buster missile strapped into a single use pod to be mountable onto a mech. Capable of leveling any building at cost of extremely slow speed and massive strain on it's platform."
	icon_state = "mecha_tom"
	projectile = /obj/item/longtom
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 20, MATERIAL_SILVER = 5, MATERIAL_GOLD = 5, MATERIAL_URANIUM = 5)
	ammo_type = null //Cannot reload it
	missile_speed = 0.1 //Comically slow
	fire_sound = 'sound/mecha/weapons/rocketlauncher.ogg'
	projectiles_per_shot = 1
	projectiles = 1
	max_ammo = 0
	projectile_energy_cost = 1000000 //Wacky bandaid to make it unrearmable due to how missiles are coded for whatever reason
	equip_cooldown = 60
	required_type = list(/obj/mecha/combat)

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/ballistic/missile_rack/long/Fire(atom/movable/AM, atom/target)
	var/obj/item/longtom/M = AM
	M.primed = 1
	. = ..()

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
	. = ..()
	var/obj/item/grenade/flashbang/F = AM
	spawn(det_time)
		F.prime()
