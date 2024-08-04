/obj/item/shield/riot/bastion
	name = "Deployable: Bastion Shield"
	desc = "A project inspired by an idea for a true deployable barrier, the \"Bastion Shield\" came as a surprisingly successful one, both surprisingly light and insurmountably sturdy enough to be carried out into the most dangerous combat zones. A true marvel of Guild, SI and Blackshield joint effort. When deployed, you can even brace a gun on it."
	icon = 'icons/obj/bastion.dmi'
	icon_state = "bastion"
	item_state = "bastion"
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_BULKY
	origin_tech = list(TECH_MATERIAL = 4, TECH_COMBAT = 4)
	matter = list(MATERIAL_PLASMAGLASS = 1, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 10)
	price_tag = 1200
	attack_verb = list("shoved", "bashed")
	var/structure_form_type = /obj/structure/shield_deployed
	item_icons = list(
		slot_back_str = 'icons/obj/bastion.dmi')
	item_state_slots = list(
		slot_back_str = "bastion_back"
		)


/obj/item/bastion_broken
	name = "Broken: Bastion Shield"
	desc = "Once a project inspired by an idea for a true deployable barrier, the \"Bastion Shield\" came as a surprisingly successful one, both surprisingly light and insurmountably sturdy enough to be carried out into the most dangerous combat zones. A true marvel of Guild, SI and Blackshield joint effort. \
	Now a broken shell of its former self, maybe it can still be scrapped for what it's worth..."
	icon = 'icons/obj/bastion.dmi'
	icon_state = "bastion_broken"
	matter = list(MATERIAL_STEEL = 2, MATERIAL_PLASTEEL = 4)
	w_class = ITEM_SIZE_NORMAL

/obj/item/shield/riot/bastion/attack_self(mob/user)
	deploy(user)

/obj/item/shield/riot/bastion/proc/deploy(var/mob/user)
	var/turf/T = get_turf(src) //When held, this will still find the user's location
	if (istype(T))
		var/obj/structure/shield_deployed/R = new structure_form_type(user.loc)
		R.add_fingerprint(user)
		R.dir = user.dir
		if(user.dir != NORTH)
			R.layer = ABOVE_MOB_LAYER
		qdel(src)

/obj/structure/shield_deployed
	name = "Bastion Barrier"
	desc = "A Deployed Bastion shield, ready to be used as a combat barrier for gunfights. Guns can be braced on it."
	icon = 'icons/obj/bastion.dmi'
	icon_state = "barrier"
	density = TRUE
	anchored = TRUE
	throwpass = 1
	climbable = TRUE
	maxHealth = 300 //Lets not like, be unkillable or what not, would suck to eat like 500 shots or hits
	health = 300
	var/base_blocking = 60
	var/reinforced_blocking = 40
	var/base_cover = 50
	var/reinforced_added_cover = 50
	var/reinforced = FALSE
	var/item_form_type = /obj/item/shield/riot/bastion

/obj/structure/shield_deployed/update_icon()
	if(reinforced)
		icon_state = "barrier_reinforced"
	else
		icon_state = "barrier"

/obj/structure/shield_deployed/proc/damage(damage)
	health -= damage
	if(health < 1)
		new /obj/item/bastion_broken(get_turf(src))
		qdel(src)


/obj/structure/shield_deployed/attackby(obj/item/I, mob/living/user)
	.=..()
	if(user.a_intent == I_HELP && istype(I, /obj/item/gun))
		var/obj/item/gun/G = I
		G.gun_brace(user, src)
		return
	if(I.has_quality(QUALITY_WELDING))
		if(health == maxHealth)
			to_chat(user, SPAN_NOTICE("\The [src] is already fully repaired!"))
			return
		if(health < maxHealth)
			to_chat(user, SPAN_NOTICE("You start reparing \the [src]."))
			if(do_after(user, 30))
				health = maxHealth
				to_chat(user, SPAN_NOTICE("\The [src] is now fully repaired!"))
				return
	if(I.has_quality(QUALITY_BOLT_TURNING))
		if(get_dir(loc, usr) == dir)
			return
		if(reinforced == FALSE)
			to_chat(user, SPAN_NOTICE("You start reinforcing \the [src]!"))
			if(do_after(user, 30))
				reinforced = TRUE
				to_chat(user, SPAN_NOTICE("\The [src] is reinforced in place and expanded!"))
				update_icon()
				return
		if(reinforced == TRUE)
			if(user.loc != loc)
				if(do_after(user, 30))
					reinforced = FALSE
					to_chat(user,SPAN_NOTICE("You collapse \the [src], allowing it to be picked up."))
					update_icon()
					return
			else
				if(do_after(user, 10))
					reinforced = FALSE
					to_chat(user,SPAN_NOTICE("You collapse \the [src], allowing it to be picked up."))
					update_icon()
					return

/obj/structure/shield_deployed/attack_generic(mob/user, damage, attack_message, damagetype = BRUTE, attack_flag = ARMOR_MELEE, sharp = FALSE, edge = FALSE)
	if(damage)//Occulus edit
		damage(damage)//Occulus Edit
		attack_animation(user)
		visible_message(SPAN_DANGER("[user] [attack_message] the [src]!"))
		return 1

/obj/structure/shield_deployed/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0))
		return 1
	if(istype(mover,/obj/item/projectile))

		var/obj/item/projectile/P = mover
		var/chance = base_blocking

		if(locate(/mob/living/) in get_turf(loc))
			return (check_cover(P,target))
		if(get_dist(P.starting, loc) <= 1)
			return 1
		if(istype(P, /obj/item/projectile/test) || P.testing) // Turrets need to try to kill the shield and so their test bullet needs to penetrate.
			return 1
		var/bad_arc = reverse_direction(dir) // Arc of directions from which we cannot block.
		if(!check_parry_arc(src, bad_arc, P)) // This is actually for mobs but it will work for our purposes as well.
			return 1

		if(health >= 1)
			if(reinforced == TRUE)
				chance += reinforced_blocking
			if((prob(chance)) && (!(P.testing)))
				damage(P.get_structure_damage())
				visible_message(SPAN_WARNING("[P] hits \the [src]!"))
				qdel(P)
				return 0
		else
			return 1
	if(health >= 1)
		if (get_dir(loc, target) == dir)
			return !density
		else
			return 1
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/shield_deployed) in get_turf(mover))
		return 1
	return 0

/obj/structure/shield_deployed/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover
	if(health >= 1)
		cover = get_turf(src)
	else if(health == 0)
		cover = get_step(loc, get_dir(from, loc))
	if(!cover)
		return 1
	if(get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1

	if(istype(P, /obj/item/projectile/test) || P.testing) // Turrets need to try to kill the shield and so their test bullet needs to penetrate.
		return 1

	var/bad_arc = reverse_direction(dir) // Arc of directions from which we cannot block.
	if(!check_parry_arc(src, bad_arc, P)) // This is actually for mobs but it will work for our purposes as well.
		return 1

	var/chance = base_cover
	if(reinforced == TRUE)
		chance += reinforced_added_cover
	if((prob(chance)) && (!(P.testing)))
		damage(P.get_structure_damage())
		if (health > 0)
			visible_message(SPAN_WARNING("[P] hits \the [src]!"))
			qdel(P)
			return 0
		else
			//visible_message(SPAN_WARNING("[src] breaks down!"))
			//break_to_parts()
			return 1

	return 1

/obj/structure/shield_deployed/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSTABLE))
		return 1
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1

/obj/structure/shield_deployed/proc/collapse()
	visible_message("[usr] collapses [src].")
	new item_form_type(get_turf(src))
	qdel(src)

/obj/structure/shield_deployed/MouseDrop(over_object, src_location, over_location)
	..()
	if(!CanMouseDrop(over_object))	return
	if(!(ishuman(usr) || isrobot(usr)))	return
	if(reinforced)
		to_chat(usr, SPAN_NOTICE("\The [src] needs collapsed first!"))
		return
	if(health < maxHealth)
		to_chat(usr, SPAN_NOTICE("\The [src] is damaged and needs repaired first!"))
		return
	if(get_dir(loc, usr) == dir)
		to_chat(usr, SPAN_NOTICE("You cant pick it up from this side!"))
		return

	collapse()

/obj/structure/shield_deployed/do_climb(var/mob/living/user)
	if(!can_climb(user))
		return

	usr.visible_message(SPAN_WARNING("[user] starts climbing onto \the [src]!"))
	LAZYOR(climbers, user)

	var/delay = (issmall(user) ? 20 : 34) * user.mod_climb_delay
	var/duration = max(delay * user.stats.getMult(STAT_VIG, STAT_LEVEL_EXPERT), delay * 0.66)
	if(!do_after(user, duration))
		LAZYREMOVE(climbers, user)
		return

	if(!can_climb(user, post_climb_check=1))
		LAZYREMOVE(climbers, user)
		return

	if(!neighbor_turf_passable())
		to_chat(user, SPAN_DANGER("You can't climb there, the way is blocked."))
		LAZYREMOVE(climbers, user)
		return

	if(get_turf(user) == get_turf(src))
		usr.forceMove(get_step(src, src.dir))
	else
		usr.forceMove(get_turf(src))

	usr.visible_message(SPAN_WARNING("[user] climbed over \the [src]!"))
	LAZYREMOVE(climbers, user)
