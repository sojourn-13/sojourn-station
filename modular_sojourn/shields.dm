/obj/item/weapon/shield/riot/bastion
	name = "Prototype: Bastion Shield"
	desc = "A Project inspired by an idea for a true deployable barrier, the \"Bastion Shield\" came as surprisingly successful idea, both light enough to carry as a shield, and expands out into a combat barrier when deployed. Bow before the Cobalt Aegis."
	icon = 'zzzz_modular_occulus/icons/obj/bastion.dmi'
	icon_state = "bastion"
	item_icons = list(
		slot_l_hand_str = 'zzzz_modular_occulus/icons/obj/bastion.dmi',
		slot_r_hand_str = 'zzzz_modular_occulus/icons/obj/bastion.dmi',
		slot_back_str = 'zzzz_modular_occulus/icons/obj/bastion.dmi')
	item_state = null
	item_state_slots = list(
		slot_l_hand_str = "bastion_left",
		slot_r_hand_str = "bastion_right",
		slot_back_str = "bastion_back")
	flags = CONDUCT
	slot_flags = SLOT_BACK
	force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_PAINFUL
	throw_speed = 1
	throw_range = 4
	w_class = ITEM_SIZE_BULKY
	origin_tech = list(TECH_MATERIAL = 4, TECH_COMBAT = 4)
	matter = list(MATERIAL_PHORONGLASS = 5, MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 10, MATERIAL_OSMIUM = 2)
	price_tag = 2500
	attack_verb = list("shoved", "bashed")
	var/structure_form_type = /obj/structure/shield_deployed

/obj/item/weapon/shield/riot/bastion/update_state()
	if(!picking_human)
		return
	if(MOVING_QUICKLY(picking_human))
		item_state_slots = list(slot_l_hand_str = "bastion_left_run",	slot_r_hand_str = "bastion_right_run",	slot_back_str = "bastion_back_run")
		armor = getArmor(arglist(armor_carry)) //OCCULUS CRUTCH FIX - REMOVE WHEN UPSTREAM PAYS ATTENTION TO THEIR RUNTIMES
		visible_message("[picking_human] lowers [gender_datums[picking_human.gender].his] [src.name].")
	else
		item_state_slots = list(slot_l_hand_str = "bastion_left_walk",	slot_r_hand_str = "bastion_right_walk",	slot_back_str = "bastion_back_walk")
		armor = getArmor(arglist(armor_brace)) //OCCULUS CRUTCH FIX - REMOVE WHEN UPSTREAM PAYS ATTENTION TO THEIR RUNTIMES
		visible_message("[picking_human] raises [gender_datums[picking_human.gender].his] [src.name] to cover [gender_datums[picking_human.gender].him]self!")
	update_wear_icon()

/obj/item/weapon/shield/riot/bastion/attack_self(mob/user)
	deploy(user)

/obj/item/weapon/shield/riot/bastion/proc/deploy(var/mob/user)
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
	desc = "A Deployed Bastion shield, ready to be used as a combat barrier for gunfights."
	icon = 'zzzz_modular_occulus/icons/obj/bastion.dmi'
	icon_state = "barrier"
	density = TRUE
	anchored = TRUE
	throwpass = 1
	climbable = TRUE
	var/max_health = 500
	var/health = 500
	var/reinforced = FALSE
	var/item_form_type = /obj/item/weapon/shield/riot/bastion

/obj/structure/shield_deployed/update_icon()
	if(reinforced)
		icon_state = "barrier_reinforced"
	else
		icon_state = "barrier"
	
/obj/structure/shield_deployed/proc/damage(damage)
	health -= damage
	if(health <= 0)
		collapse()

/obj/structure/shield_deployed/attackby(obj/item/I, mob/living/user)
	.=..()
	if(I.has_quality(QUALITY_WELDING))
		if(health == max_health)
			to_chat(user, SPAN_NOTICE("\The [src] is already fully repaired!"))
			return
		if(health < max_health)
			to_chat(user, SPAN_NOTICE("You start reparing \the [src]."))
			if(do_after(user, 30))
				health = max_health
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

/obj/structure/shield_deployed/attack_generic(var/mob/user, var/damage, var/attack_message = "smashes", var/wallbreaker)//Occulus Edit
	if(damage)//Occulus edit
		damage(damage)//Occulus Edit
		attack_animation(user)
		visible_message(SPAN_DANGER("[user] [attack_message] the [src]!"))
		return 1

/obj/structure/shield_deployed/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0)) return 1
	if(istype(mover,/obj/item/projectile))
		if(locate(/mob/living/) in get_turf(loc))
			return (check_cover(mover,target))
		
		var/obj/item/projectile/P = mover
		var/chance = 40
		if(get_dist(P.starting, loc) <= 1)
			return 1
		if(health >= 1)
			if(reinforced == TRUE)
				chance += 40
			if(prob(chance))
				damage(P.get_structure_damage())
				visible_message(SPAN_WARNING("[P] hits \the [src]!"))
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
	if(get_turf(P.original) == cover)
		var/chance = 40
		if(reinforced == TRUE)			
			chance += 40	
		if(health==0)
			chance = 0
		if(prob(chance))
			damage(P.get_structure_damage())
			if (health > 0)
				visible_message(SPAN_WARNING("[P] hits \the [src]!"))
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
	if(health < max_health)
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
	climbers |= user

	var/delay = (issmall(user) ? 20 : 34)
	var/duration = max(delay * user.stats.getMult(STAT_VIG, STAT_LEVEL_EXPERT), delay * 0.66)
	if(!do_after(user, duration))
		climbers -= user
		return

	if(!can_climb(user, post_climb_check=1))
		climbers -= user
		return

	if(!neighbor_turf_passable())
		to_chat(user, SPAN_DANGER("You can't climb there, the way is blocked."))
		climbers -= user
		return

	if(get_turf(user) == get_turf(src))
		usr.forceMove(get_step(src, src.dir))
	else
		usr.forceMove(get_turf(src))

	usr.visible_message(SPAN_WARNING("[user] climbed over \the [src]!"))
	climbers -= user
