/obj/item/emp_mine
	name = "OS Type - 183 \"Hei'an\""
	desc = "Self-rechargeable Chinese EMP mine. It still works, despite all the age, known for its weak lithium core components making it susceptible to taking bullet to destory them from afar."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "empmine0"
	w_class = ITEM_SIZE_BULKY

	var/armed = FALSE
	var/cooldown = 180 SECONDS
	var/trigger_range = 1
	var/emp_range = 3
	var/cooldown_timer = 0

/obj/item/emp_mine/bullet_act(var/obj/item/projectile/Proj)
	if(prob(90) && (!(Proj.testing)))
		explode()

/obj/item/emp_mine/proc/explode()
	var/turf/T = get_turf(src)
	explosion(T,-1,0,3,7)
	if(src)
		qdel(src)

/obj/item/emp_mine/proc/arm()
	if(armed)
		return

	armed = TRUE

	START_PROCESSING(SSobj, src)
	update_icon()

/obj/item/emp_mine/proc/disarm()
	if(!armed)
		return

	armed = FALSE

	STOP_PROCESSING(SSobj, src)
	update_icon()

/obj/item/emp_mine/update_icon()
	icon_state = "empmine[armed ? "1":"0"]"

/obj/item/emp_mine/Process()
	if(world.time - cooldown_timer > cooldown)
		var/turf/T = get_turf(src)
		if(!T)
			return

		for(var/mob/M in range(trigger_range, T))
			if(istype(M,/mob/living/carbon/human) || istype(M, /mob/living/silicon) || istype(M, /mob/living/simple/hostile/poporavtomat))
				cooldown_timer = world.time
				empulse(T, emp_range, emp_range, TRUE)
				break

/obj/item/emp_mine/attack_self(mob/user as mob)
	src.add_fingerprint(user)
	if(armed)
		disarm()
		log_and_message_admins(" - EMP Mine disarmed at \the [jumplink(src)] X:[src.x] Y:[src.y] Z:[src.z] User:[user]") //So we can go to it
		to_chat(user, SPAN_NOTICE("You disarm \the [src]"))
	else
		cooldown_timer = world.time - cooldown + 100
		arm()
		log_and_message_admins(" - EMP Mine armed at \the [jumplink(src)] X:[src.x] Y:[src.y] Z:[src.z] User:[user]") //So we can go to it
		to_chat(user, SPAN_WARNING("You arm \the [src]! You have 10 seconds to run away."))

//Pre-armed mine
/obj/item/emp_mine/armed/New()
	..()
	arm()
