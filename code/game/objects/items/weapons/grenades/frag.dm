/obj/item/grenade/frag
	name = "SA DF grenade \"Pomme\""
	desc = "A military-grade defensive fragmentation grenade, designed to be thrown from cover."
	icon_state = "frag"
	item_state = "frggrenade"
	loadable = TRUE

	var/fragment_type = /obj/item/projectile/bullet/pellet/fragment/strong
	var/num_fragments = 150  //total number of fragments produced by the grenade
	var/fragment_damage = 5
	var/damage_step = 2      //projectiles lose a fragment each time they travel this distance. Can be a non-integer.

	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 7

/obj/item/grenade/frag/prime()
	set waitfor = 0
	..()

	var/turf/O = get_turf(src)
	if(!O) return

	if(num_fragments)
		var/lying = FALSE
		if(isturf(src.loc))
			for(var/mob/living/M in O)
				//lying on a frag grenade while the grenade is on the ground causes you to absorb most of the shrapnel.
				//you will most likely be dead, but others nearby will be spared the fragments that hit you instead.
				if(M.lying)
					lying = TRUE

		if(!lying)
			fragment_explosion(O, spread_range, fragment_type, num_fragments, fragment_damage, damage_step)
		else
			fragment_explosion(O, 0, fragment_type, num_fragments, fragment_damage, damage_step)

	qdel(src)

/obj/item/grenade/frag/nt
	name = "NT DF grenade \"Holy Thunder\""
	desc = "A military-grade defensive fragmentation grenade, designed to be thrown from cover."
	icon_state = "frag_nt"
	item_state = "frggrenade_nt"
	matter = list(MATERIAL_BIOMATTER = 40)
	fragment_damage = 7
	damage_step = 3

/obj/item/grenade/frag/stinger
	name = "Seinemetall Defense GmbH \"Stinger\""
	desc = "A repurposed fragmentation grenade loaded in rubbers fragments, ready to serve the public trust. Lethal if used ontop of someone."
	icon_state = "stinger"
	item_state = "stinger"
	loadable = TRUE
	num_fragments = 70
	fragment_type = /obj/item/projectile/bullet/pellet/fragment/rubber
	fragment_damage = 1 //+1 from the actual projectile itself. This mostly applies to instances where someone is directly on top of the grenade. Leaving this value at default was resulting in 400+ damage stiingers.
	damage_step = 12

/obj/item/grenade/frag/pipebomb
	name = "improvised pipebomb"
	desc = "A jury rigged medium cell filled with plasma. Throw at authorities."
	icon_state = "frag_pipebomb"
	item_state = "fraggrenade_pipebomb"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 2, MATERIAL_PLASMA = 2, MATERIAL_PLASTIC = 3, MATERIAL_SILVER = 2)
	num_fragments = 25
	fragment_damage = 10
	damage_step = 5

/obj/item/grenade/frag/white_phosphorous
	name = "SA WPG \"Sabac \""
	desc = "A modernized incendiary hailing popular use within assault troops of all kinds. Use with care, highly flammable."
	icon_state = "white_phos"
	item_state = "fraggrenade"
	fragment_type = /obj/item/projectile/bullet/pellet/fragment/ember
	num_fragments = 10
	fragment_damage = 5
	damage_step = 5
	spread_range = 7
	var/datum/effect/effect/system/smoke_spread/white_phosphorous/smoke

/obj/item/grenade/frag/white_phosphorous/prime()
	playsound(loc, 'sound/effects/smoke.ogg', 50, 1, -3)
	smoke.set_up(5, 0, usr.loc)
	smoke.set_up(5, 0, get_turf(loc))
	smoke.start()
	..()

/obj/item/grenade/frag/white_phosphorous/New()
	..()
	smoke = new
	smoke.attach(src)

/obj/item/grenade/frag/white_phosphorous/Destroy()
	qdel(smoke)
	smoke = null
	return ..()
