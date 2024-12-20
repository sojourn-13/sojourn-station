/obj/item/melee/energy
	var/active = 0
	var/active_force
	var/active_throwforce
	var/active_w_class
	sharp = 0
	edge = 0
	armor_divisor = ARMOR_PEN_MASSIVE
	flags = NOBLOODY
	structure_damage_factor = STRUCTURE_DAMAGE_HEAVY
	heat = 3800
	embed_mult = 0 //No physical matter to catch onto things
	hitsound = "sound/weapons/blade1.ogg" //Make these lightsaber thingies do the sound they're intended to do on attack.
	eye_hazard = TRUE


/obj/item/melee/energy/refresh_upgrades()
	..()

	if(active)
		force = active_force
		throwforce = active_throwforce

	if(wielded)
		if(force_wielded_multiplier)
			force = force * force_wielded_multiplier
		else //This will give items wielded 30% more damage. This is balanced by the fact you cannot use your other hand.
			force = (force * 1.3) //Items that do 0 damage will still do 0 damage though.
		name = "[name] (Wielded)"


/obj/item/melee/energy/is_hot()
	if (active)
		return heat

/obj/item/melee/energy/proc/activate(mob/living/user)
	anchored = 1
	if(active)
		return
	active = 1
	force = active_force
	throwforce = active_throwforce
	sharp = 1
	edge = 1
	w_class = active_w_class
	playsound(user, 'sound/weapons/saberon.ogg', 50, 1)
	update_wear_icon()

/obj/item/melee/energy/proc/deactivate(mob/living/user)
	anchored = 0
	if(!active)
		return
	playsound(user, 'sound/weapons/saberoff.ogg', 50, 1)
	active = 0
	force = initial(force)
	throwforce = initial(throwforce)
	sharp = initial(sharp)
	edge = initial(edge)
	w_class = initial(w_class)
	update_wear_icon()

/obj/item/melee/energy/attack_self(mob/living/user as mob)
	if (active)
		if ((CLUMSY in user.mutations) && prob(15))
			user.visible_message(SPAN_DANGER("\The [user] accidentally cuts \himself with \the [src]."),\
			SPAN_DANGER("You accidentally cut yourself with \the [src]."))
			user.take_organ_damage(5,5)
		deactivate(user)
	else
		activate(user)
	add_fingerprint(user)

/*
 * Energy Axe
 */
/obj/item/melee/energy/axe
	name = "energy axe"
	desc = "A battle axe with some kind of red energy crystal. Pretty sharp."
	icon_state = "axe0"
	icon = 'icons/obj/weapons.dmi'
	active_force = WEAPON_FORCE_GODLIKE
	active_throwforce = 50
	active_w_class = ITEM_SIZE_HUGE
	force = 20
	throwforce = 10
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	flags = CONDUCT | NOBLOODY
	origin_tech = list(TECH_MAGNET = 3, TECH_COMBAT = 4)
	attack_verb = list("attacked", "chopped", "cleaved", "torn", "cut")
	sharp = 1
	edge = 1

/obj/item/melee/energy/axe/activate(mob/living/user)
	icon_state = "axe1"
	..()
	to_chat(user, SPAN_NOTICE("\The [src] is now energized."))

/obj/item/melee/energy/axe/deactivate(mob/living/user)
	icon_state = initial(icon_state)
	..()
	to_chat(user, SPAN_NOTICE("\The [src] is de-energized. It's just a regular axe now."))

/*
 * Energy Sword
 */
/obj/item/melee/energy/sword
	color
	name = "energy sword"
	desc = "May the Force be with you."
	icon_state = "sword0"
	icon = 'icons/obj/weapons.dmi'
	active_force = WEAPON_FORCE_LETHAL // Go forth and slay, padawan
	active_throwforce = WEAPON_FORCE_LETHAL
	active_w_class = ITEM_SIZE_BULKY
	force = WEAPON_FORCE_HARMLESS
	throwforce = WEAPON_FORCE_HARMLESS
	no_double_tact = TRUE
	throw_speed = 1
	throw_range = 5
	w_class = ITEM_SIZE_SMALL
	price_tag = 300
	flags = NOBLOODY
	origin_tech = list(TECH_MAGNET = 3, TECH_ILLEGAL = 4)
	sharp = 1
	edge = 1
	var/blade_color

/obj/item/melee/energy/sword/dropped(var/mob/user)
	..()
	deactivate(user)

/obj/item/melee/energy/sword/New()
	if(!blade_color)
		blade_color = pick("red","blue","green","purple")
	..()

/obj/item/melee/energy/sword/green
	blade_color = "green"

/obj/item/melee/energy/sword/red
	blade_color = "red"

/obj/item/melee/energy/sword/blue
	blade_color = "blue"

/obj/item/melee/energy/sword/purple
	blade_color = "purple"

/obj/item/melee/energy/sword/pirate
	blade_color = "cutlass"

/obj/item/melee/energy/sword/sabre
	blade_color = "green"

/obj/item/melee/energy/sword/activate(mob/living/user)
	if(!active)
		to_chat(user, SPAN_NOTICE("\The [src] is now energized."))
	icon_state = "sword[blade_color]"
	..()
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	tool_qualities = list(QUALITY_CUTTING = 30,  QUALITY_WIRE_CUTTING = 20, QUALITY_WELDING = 1, QUALITY_CAUTERIZING = 1)

/obj/item/melee/energy/sword/deactivate(mob/living/user)
	if(active)
		to_chat(user, SPAN_NOTICE("\The [src] deactivates!"))
	icon_state = initial(icon_state)
	..()
	LAZYNULL(attack_verb)
	tool_qualities = initial(tool_qualities)

/* Outdated and dosnt fit with shield balance as easy as it is to make or get them
/obj/item/melee/energy/sword/handle_shield(mob/user, var/damage, atom/damage_source = null, mob/attacker = null, var/def_zone = null, var/attack_text = "the attack")
	if(active && default_parry_check(user, attacker, damage_source) && prob(50))
		user.visible_message(SPAN_DANGER("\The [user] parries [attack_text] with \the [src]!"))

		var/datum/effect/effect/system/spark_spread/spark_system = new /datum/effect/effect/system/spark_spread()
		spark_system.set_up(5, 0, user.loc)
		spark_system.start()
		playsound(user.loc, 'sound/weapons/blade1.ogg', 50, 1)
		return 1
	return 0
*/

/obj/item/melee/energy/sword/pirate
	name = "energy cutlass"
	desc = "Arrrr matey."
	icon_state = "cutlass0"
	active_force =  WEAPON_FORCE_ROBUST
	active_throwforce =  WEAPON_FORCE_ROBUST

/obj/item/melee/energy/sword/sabre
	name = "laser saber"
	desc = "You feel the radiant glow below your skin."
	origin_tech = list(TECH_MAGNET = 5, TECH_POWER = 6, TECH_COMBAT = 3)
	active_force =  WEAPON_FORCE_ROBUST
	active_throwforce =  WEAPON_FORCE_ROBUST

/obj/item/melee/energy/sword/sabre/dagger
	blade_color = "green"
	name = "laser dagger"
	desc = "A much smaller but still useful energy based short blade."
	clickdelay_offset = FAST_WEAPON_COOLDOWN
	armor_divisor = ARMOR_PEN_EXTREME
	active_force =  WEAPON_FORCE_DANGEROUS
	active_throwforce =  WEAPON_FORCE_DANGEROUS
	icon_state = "dagger0"

/obj/item/melee/energy/sword/sabre/dagger/activate(mob/living/user)
	if(!active)
		to_chat(user, SPAN_NOTICE("\The [src] is now energized."))
	..()
	icon_state = "daggergreen" //So we dont use sword icons
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "strikes", "cut")
	tool_qualities = list(QUALITY_CUTTING = 25,  QUALITY_WIRE_CUTTING = 15, QUALITY_LASER_CUTTING = 1, QUALITY_WELDING = 10, QUALITY_CAUTERIZING = 10)

/*
 * Energy Spear
 */

/obj/item/melee/energy/spear
	name = "energy spear"
	desc = "A repurposed energy cutlass crudely attached to a polearm to serve as a spear.\n The energy \"blade\" has been reshaped into a three-pronged cross tip."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "jumonji-off"
	wielded_icon = "jumonji-off_wielded"
	active_force = WEAPON_FORCE_BRUTAL
	active_throwforce = WEAPON_FORCE_LETHAL
	active_w_class = ITEM_SIZE_HUGE
	force = WEAPON_FORCE_NORMAL // It still is a rod even when turned off, you can still whack with it
	throwforce = WEAPON_FORCE_PAINFUL // Not gonna matter since it will turn off on throwing, thank you psions can't have shit in Nadezhda
	throw_speed = 3 // Same as normal spear
	throw_range = 7
	extended_reach = TRUE
	w_class = ITEM_SIZE_HUGE // It's a long spear
	slot_flags = SLOT_BACK
	flags = CONDUCT // It's a metal pole, you're a literal lightning rod while holding it
	origin_tech = list(TECH_MAGNET = 3, TECH_COMBAT = 4)

/obj/item/melee/energy/spear/activate(mob/living/user)
	if(!active)
		to_chat(user, SPAN_NOTICE("\The [src] is now energized."))
	icon_state = "jumonji-on"
	wielded_icon = "jumonji-on_wielded"
	..()
	attack_verb = list("pierced", "stabbed", "cleaved", "impaled", "sliced", "cut", "slashed", "lanced")
	tool_qualities = list(QUALITY_CUTTING = 30,  QUALITY_WIRE_CUTTING = 20, QUALITY_WELDING = 1, QUALITY_CAUTERIZING = 1)
	flags |= NOBLOODY // Only when it's active, otherwise you're beating people with a pole and WILL get bloodied

/obj/item/melee/energy/spear/deactivate(mob/living/user)
	if(active)
		to_chat(user, SPAN_NOTICE("\The [src] deactivates!"))
	icon_state = initial(icon_state)
	wielded_icon = initial(wielded_icon)
	..()
	LAZYNULL(attack_verb)
	tool_qualities = initial(tool_qualities)
	flags &= ~NOBLOODY

/obj/item/melee/energy/spear/examine(mob/user)
	..()
	if(active)
		to_chat(user, "<span class='info'>Thrust with it, and it becomes a spear. Cut with it, and it becomes a scythe.\nDraw it back, and it becomes a sickle. \n No matter how it's used, it never fails to hit its target...</span>")
		// Houzouin-ryu school of spearmanship's motto

/obj/item/melee/energy/spear/dropped(var/mob/user) // To prevent psions with tk from gaming it too hard.
	..()
	deactivate(user)

/*
 *Energy Blade
 */

//Can't be activated or deactivated, so no reason to be a subtype of energy
/obj/item/melee/energy/blade
	name = "energy blade"
	desc = "A concentrated beam of energy in the shape of a blade. Very stylish... and lethal."
	icon_state = "blade"
	icon = 'icons/obj/weapons.dmi'
	armor_divisor = 2
	sharp = 1
	edge = 1
	force = WEAPON_FORCE_BRUTAL
	anchored = 1    // Never spawned outside of inventory, should be fine.
	throwforce = 1  //Throwing or dropping the item deletes it.
	throw_speed = 1
	throw_range = 1
	w_class = ITEM_SIZE_NORMAL
	flags = NOBLOODY
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	tool_qualities = list(QUALITY_CUTTING = 30,  QUALITY_WIRE_CUTTING = 20, QUALITY_LASER_CUTTING = 20, QUALITY_WELDING = 10, QUALITY_CAUTERIZING = 10)
	var/mob/living/creator
	var/datum/effect/effect/system/spark_spread/spark_system
	var/dequel_self = TRUE

/obj/item/melee/energy/blade/New()
	..()
	spark_system = new /datum/effect/effect/system/spark_spread()
	spark_system.set_up(5, 0, src)
	spark_system.attach(src)

	START_PROCESSING(SSobj, src)

/obj/item/melee/energy/blade/Destroy()
	STOP_PROCESSING(SSobj, src)
	. = ..()


/obj/item/melee/energy/blade/proc/dequel_check()
	if(src && dequel_self)
		qdel(src)

/obj/item/melee/energy/blade/attack_self(mob/user as mob)
	user.drop_from_inventory(src)
	addtimer(CALLBACK(src, PROC_REF(dequel_check)), 1)

/obj/item/melee/energy/blade/dropped()
	addtimer(CALLBACK(src, PROC_REF(dequel_check)), 1)

/obj/item/melee/energy/blade/Process()
	if(!creator || loc != creator || (creator.l_hand != src && creator.r_hand != src))
		// Tidy up a bit.
		if(isliving(loc))
			var/mob/living/carbon/human/host = loc
			if(istype(host))
				for(var/obj/item/organ/external/organ in host.organs)
					for(var/obj/item/O in organ.implants)
						if(O == src)
							organ.implants -= src
			host.pinned -= src
			host.embedded -= src
			host.drop_from_inventory(src)
		addtimer(CALLBACK(src, PROC_REF(dequel_check)), 1)

/obj/item/melee/energy/blade/organ_module //just to make sure that blade doesnt delet itself
	dequel_self = FALSE

/obj/item/melee/energy/blade/organ_module/New()

/obj/item/melee/energy/blade/organ_module/attack_self(mob/user as mob)
