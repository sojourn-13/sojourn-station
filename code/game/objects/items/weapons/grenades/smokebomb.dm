/obj/item/grenade/smokebomb
	name = "HS smoke grenade \"Reynolds\""
	desc = "Smoke grenade, used to create a cloud of smoke providing cover and hiding movement."
	det_time = 20
	icon_state = "smokegrenade"
	item_state = "smokegrenade" //Sprites by hyperioo
	var/datum/effect/effect/system/smoke_spread/bad/smoke

/obj/item/grenade/smokebomb/New()
	..()
	src.smoke = new
	src.smoke.attach(src)

/obj/item/grenade/smokebomb/Destroy()
	qdel(smoke)
	smoke = null
	return ..()

/obj/item/grenade/smokebomb/prime()
	playsound(src.loc, 'sound/effects/smoke.ogg', 50, 1, -3)
	src.smoke.set_up(10, 0, usr.loc)
	spawn(0)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
		sleep(10)
		src.smoke.start()
		sleep(10)
		src.smoke.start()

	for(var/obj/effect/blob/B in view(8,src))
		var/damage = round(30/(get_dist(B,src)+1))
		B.take_damage(damage)
		B.update_icon()
	sleep(80)
	icon_state = initial(icon_state) + "_off"
	desc = "[initial(desc)] It has already been used."
	return

/obj/item/grenade/smokebomb/nt
	name = "NT smoke grenade \"Holy Fog\""
	desc = "Smoke grenade, used to create a cloud of smoke providing cover and hiding movement."
	icon_state = "smokegrenade_nt"
	item_state = "smokegrenade_nt"
	matter = list(MATERIAL_BIOMATTER = 10)
