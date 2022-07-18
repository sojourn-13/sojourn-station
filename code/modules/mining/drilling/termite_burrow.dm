/obj/structure/termite_burrow
	name = "termite burrow"
	icon = 'icons/obj/burrows.dmi'
	icon_state = "maint_hole"
	desc = "A pile of rocks that regularly pulses as if it was alive."
	density = TRUE
	anchored = TRUE

	var/max_health = 50
	health = 50
	var/datum/termite_controller/controller

/obj/structure/termite_burrow/New(loc, parent)
	..()
	controller = parent  // Link burrow with termite controller

/obj/structure/termite_burrow/Destroy()
	visible_message(SPAN_DANGER("\The [src] crumbles!"))
	if(controller)
		controller.burrows -= src
		controller = null
	..()

/obj/structure/termite_burrow/attack_generic(mob/user, damage)
	user.do_attack_animation(src)
	visible_message(SPAN_DANGER("\The [user] smashes \the [src]!"))
	take_damage(damage)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN * 1.5)

/obj/structure/termite_burrow/attackby(obj/item/I, mob/user)
	if (user.a_intent == I_HURT && user.Adjacent(src))
		if(!(I.flags & NOBLUDGEON))
			user.do_attack_animation(src)
			var/damage = I.force * I.structure_damage_factor
			var/volume =  min(damage * 3.5, 15)
			if (I.hitsound)
				playsound(src, I.hitsound, volume, 1, -1)
			visible_message(SPAN_DANGER("[src] has been hit by [user] with [I]."))
			take_damage(damage)
			user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN * 1.5)
	return TRUE

/obj/structure/termite_burrow/bullet_act(obj/item/projectile/Proj)
	..()
        // Bullet not really efficient against a pile of rock
	if (!(Proj.testing))
		take_damage(Proj.get_structure_damage() * 0.25)

/obj/structure/termite_burrow/proc/take_damage(value)
	health = min(max(health - value, 0), max_health)
	if(health == 0)
		qdel(src)

/obj/structure/termite_burrow/proc/stop()
	qdel(src)  // Delete burrow
