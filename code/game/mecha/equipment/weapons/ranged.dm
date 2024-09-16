/*
 * Contains ranged mech weapon subtypes
 */

/obj/item/mecha_parts/mecha_equipment/ranged_weapon
	name = "mecha weapon"
	range = MECHA_RANGED
	origin_tech = list(TECH_MATERIAL = 3, TECH_COMBAT = 3)
	matter = list(MATERIAL_STEEL = 15)
	var/projectile //Type of projectile fired.
	var/projectiles = 1 //Amount of projectiles loaded.
	var/projectiles_per_shot = 1 //Amount of projectiles fired per single shot.
	var/deviation = 0 //Inaccuracy of shots, essentially applies an angle deviation between negative MAX_ACCURACY_OFFSET and positive by using GaussRand to create a very random number using deviation as the basis.
	var/fire_cooldown = 0 //Duration of sleep between firing projectiles in single shot.
	var/fire_sound //Sound played while firing.
	var/fire_volume = 50 //How loud it is played.
	var/auto_rearm = 0 //Does the weapon reload itself after each shot?
	required_type = list(/obj/mecha/combat, /obj/mecha/working/hoverpod/combatpod)
	destroy_sound = 'sound/mecha/weapdestr.ogg'

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/action_checks(atom/target)
	if(projectiles <= 0)
		return 0
	return ..()

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/action(atom/target)
	if(!action_checks(target))
		return

	var/turf/curloc = chassis.loc
	var/turf/targloc = get_turf(target)
	if(!curloc || !targloc)
		return

	chassis.use_power(energy_drain)
	chassis.visible_message(SPAN_WARNING("[chassis] fires [src]!"))
	occupant_message(SPAN_WARNING("You fire [src]!"))
	log_message("Fired from [src], targeting [target].")
	start_cooldown()

	for(var/i = 1 to min(projectiles, projectiles_per_shot))
		var/turf/aimloc = targloc
		if(!aimloc || aimloc == curloc)
			break

		playsound(chassis, fire_sound, fire_volume, 1)
		projectiles--
		var/P = new projectile(curloc)
		Fire(P, target)
		if(fire_cooldown)
			sleep(fire_cooldown)

	if(auto_rearm)
		projectiles = projectiles_per_shot

/obj/item/mecha_parts/mecha_equipment/ranged_weapon/proc/Fire(atom/A, atom/target)
	var/obj/item/projectile/P = A
	var/def_zone
	if(chassis && ishuman(chassis.occupant))
		var/mob/living/carbon/human/H = chassis.occupant
		def_zone = H.targeted_organ
		P.firer = H
	P.launch(target, def_zone, x_offset = 0, y_offset = 0, angle_offset = CLAMP(GaussRand(deviation), -MAX_ACCURACY_OFFSET, MAX_ACCURACY_OFFSET))
