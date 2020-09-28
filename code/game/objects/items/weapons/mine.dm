/obj/item/weapon/mine
	name = "Excelsior Mine"
	desc = "An anti-personnel mine. IFF technology grants safe passage to Excelsior agents, and a mercifully brief end to others unless they can disarm it with a multitool."
	icon = 'icons/obj/machines/excelsior/objects.dmi'
	icon_state = "mine"
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_STEEL = 30)
	matter_reagents = list("fuel" = 40)
	layer = HIDE_LAYER

	//var/obj/item/device/assembly_holder/detonator = null

	var/fragment_type = /obj/item/projectile/bullet/pellet/fragment/weak
	var/spread_radius = 4
	var/num_fragments = 30
	var/damage_step = 2

	var/explosion_d_size = -1
	var/explosion_h_size = 1
	var/explosion_l_size = 2
	var/explosion_f_size = 15

	var/armed = FALSE
	var/deployed = FALSE
	anchored = FALSE

/obj/item/weapon/mine/ignite_act()
	explode()

/obj/item/weapon/mine/proc/explode()
	var/turf/T = get_turf(src)
	explosion(T,explosion_d_size,explosion_h_size,explosion_l_size,explosion_f_size)
	fragment_explosion(T, spread_radius, fragment_type, num_fragments, null, damage_step)

	if(src)
		qdel(src)

/obj/item/weapon/mine/bullet_act()
	if(prob(90))
		explode()

/obj/item/weapon/mine/update_icon()
	cut_overlays()

	if(armed)
		add_overlay(image(icon,"mine_light"))

/obj/item/weapon/mine/attack_self(var/mob/user)
	if(locate(/obj/structure/multiz/ladder) in get_turf(user))
		to_chat(user, SPAN_NOTICE("You cannot place \the [src] here, there is a ladder."))
		return
	if(!armed)
		user.visible_message(
			SPAN_DANGER("[user] starts to deploy \the [src]."),
			SPAN_DANGER("You begin deploying \the [src]!")
			)

		if (do_after(user, 25))
			user.visible_message(
				SPAN_DANGER("[user] has deployed \the [src]."),
				SPAN_DANGER("You have deployed \the [src]!")
				)

			deployed = TRUE
			user.drop_from_inventory(src)
			anchored = TRUE
			armed = TRUE
			update_icon()
			playsound(loc, 'sound/weapons/armbomb.ogg', 75, 1, -3)
	update_icon()

/obj/item/weapon/mine/attack_hand(mob/user as mob)
	.=..()
	if (deployed)
		user.visible_message(
				SPAN_DANGER("[user] extends its hand to reach \the [src]!"),
				SPAN_DANGER("You extend your arms to pick it up, knowing that it will likely blow up when you touch it!")
				)
		if (do_after(user, 5))
			user.visible_message(
				SPAN_DANGER("[user] attempts to pick up \the [src] only to hear a beep as it explodes in your hands!"),
				SPAN_DANGER("You attempt to pick up \the [src] only to hear a beep as it explodes in your hands!")
				)
		explode()

/obj/item/weapon/mine/attackby(obj/item/I, mob/user)
	if(QUALITY_PULSING in I.tool_qualities)

		if (deployed)
			user.visible_message(
			SPAN_DANGER("[user] starts to carefully disarm \the [src]."),
			SPAN_DANGER("You begin to carefully disarm \the [src].")
			)
		if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_PULSING, FAILCHANCE_NORMAL,  required_stat = STAT_COG)) //disarming a mine with a multitool should be for smarties
			user.visible_message(
				SPAN_DANGER("[user] has disarmed \the [src]."),
				SPAN_DANGER("You have disarmed \the [src]!")
				)
			deployed = FALSE
			anchored = FALSE
			armed = FALSE
			deployed = FALSE
			update_icon()
		return
	else
		if (deployed)   //now touching it with stuff that don't pulse will also be a bad idea
			user.visible_message(
				SPAN_DANGER("The [src] is hit with [I] and it explodes!"),
				SPAN_DANGER("You hit the [src] with [I] and it explodes!"))
			explode()
		return

/obj/item/weapon/mine/Crossed(var/mob/AM)
	var/bonus_evade = 0
	if (armed)
		if (isliving(AM))
			if (!is_excelsior(AM))
				if(AM.stats.getPerk(PERK_SURE_STEP))
					bonus_evade += 30
				if(prob(AM.stats.getStat(STAT_VIG) + bonus_evade))
					AM.visible_message(
					SPAN_DANGER("[AM] narrowly avoids setting off \the [src] at the last second!"),
					SPAN_DANGER("Your vigilant observation lets you avoid \the [src] at the last possible second!")
					)
					return
				else
					explode()
					return
	.=..()

/obj/item/weapon/mine/armed
	name = "land mine"
	desc = "An anti-personnel mine. This one looks new, as if someone placed this here recently... Better disarm it with a multitool or a bullet."
	armed = TRUE
	deployed = TRUE
	anchored = TRUE

/obj/item/weapon/mine/improvised
	name = "improvised land mine"
	desc = "An anti-personnel mine that could only be more ghetto if it was held together by duct tape. It appears to be a makeshift trap with a frag grenade rigged to the trigger mechanism, a multitool should easily disarm this."
	icon_state = "mine_improvised"
	spread_radius = 4
	num_fragments = 10
	damage_step = 1

	explosion_d_size = -1
	explosion_h_size = -1
	explosion_l_size = 1
	explosion_f_size = 7

	armed = TRUE
	deployed = TRUE
	anchored = TRUE

/obj/item/weapon/mine/improvised/attackby(obj/item/I, mob/user)
	if(QUALITY_PULSING in I.tool_qualities)

		if (deployed)
			user.visible_message(
			SPAN_DANGER("[user] starts to carefully disarm \the [src]."),
			SPAN_DANGER("You begin to carefully disarm \the [src].")
			)
		if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_PULSING, FAILCHANCE_VERY_EASY,  required_stat = STAT_COG)) //disarming a mine with a multitool should be for smarties
			user.visible_message(
				SPAN_DANGER("[user] has disarmed \the [src]."),
				SPAN_DANGER("You have disarmed \the [src]!")
				)
			deployed = FALSE
			anchored = FALSE
			armed = FALSE
			update_icon()
			return
		else
			user.visible_message(
				SPAN_DANGER("[user] has set off \the [src]!"))
			explode()
			return