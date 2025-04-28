/obj/item/gun/matter/launcher
	w_class = ITEM_SIZE_HUGE

	var/release_force = 1
	var/throw_distance = 7
	muzzle_flash = 0

//This normally uses a proc on projectiles and our ammo is not strictly speaking a projectile.
/obj/item/gun/matter/launcher/can_hit(mob/living/target, mob/living/user)
	return TRUE

/obj/item/gun/matter/launcher/proc/update_release_force(obj/item/projectile)
	return FALSE

/obj/item/gun/matter/launcher/process_projectile(obj/item/projectile, mob/user, atom/target)
	update_release_force(projectile)
	projectile.loc = get_turf(user)
	projectile.throw_at(target, throw_distance, release_force, user)
	return TRUE
