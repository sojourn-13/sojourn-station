/obj/item/projectile/forcebolt
	name = "force bolt"
	icon = 'icons/obj/projectiles.dmi'
	icon_state = "ice_1"
	damage_types = list(BRUTE = 15)
	check_armour = ARMOR_ENERGY

/obj/item/projectile/forcebolt/strong
	name = "force bolt"

/obj/item/projectile/forcebolt/on_hit(atom/movable/target)

	if (!testing)
		if(istype(target))
			var/throwdir = get_dir(firer,target)
			target.throw_at(get_edge_target_turf(target, throwdir),10,10)
			return TRUE

/*
/obj/item/projectile/forcebolt/strong/on_hit(var/atom/target)

	// NONE OF THIS WORKS. DO NOT USE.
	var/throwdir = null

	for(var/mob/M in hearers(2, src))
		if(M.loc != src.loc)
			throwdir = get_dir(src,target)
			M.throw_at(get_edge_target_turf(M, throwdir),15,1)
	return ..()
*/

/obj/item/projectile/coin
	name = "coin"
	desc = "Keep the change, ya filthy animal."
	damage_types = list(BRUTE = 5)
	embed = 0
