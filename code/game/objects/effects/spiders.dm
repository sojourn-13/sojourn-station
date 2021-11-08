//generic procs copied from obj/effect/alien
/obj/effect/spider
	name = "web"
	desc = "it's stringy and sticky"
	icon = 'icons/effects/effects.dmi'
	anchored = 1
	density = 0
	health = 5

//similar to weeds, but only barfed out by nurses manually
/obj/effect/spider/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
		if(2.0)
			if (prob(50))
				qdel(src)
		if(3.0)
			if (prob(5))
				qdel(src)
	return

/obj/effect/spider/attackby(var/obj/item/I, var/mob/user)
	if(I.attack_verb.len)
		visible_message("<span class='warning'>\The [src] have been [pick(I.attack_verb)] with \the [I][(user ? " by [user]." : ".")]</span>")
	else
		visible_message("<span class='warning'>\The [src] have been attacked with \the [I][(user ? " by [user]." : ".")]</span>")

	var/damage = I.force / 4.0

	if(QUALITY_WELDING in I.tool_qualities)
		if(I.use_tool(user, src, WORKTIME_INSTANT, QUALITY_WELDING, FAILCHANCE_ZERO))
			damage = 15

	health -= damage
	healthCheck()

/obj/effect/spider/bullet_act(var/obj/item/projectile/Proj)
	..()
	health -= Proj.get_structure_damage()
	healthCheck()

/obj/effect/spider/healthCheck()
	if(health <= 0)
		qdel(src)

/obj/effect/spider/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if(exposed_temperature > T0C + 50) //Weak to fire, windows take T0C + 100.
		health -= 5
		healthCheck()

/obj/effect/spider/stickyweb
	health = 1
	icon_state = "stickyweb1"
	var/silk_baring = TRUE
	New()
		if(prob(50))
			icon_state = "stickyweb2"
		if(prob(20) && silk_baring)
			silk_baring = FALSE
		..()

/obj/effect/spider/stickyweb/chtmant
	silk_baring = FALSE

/obj/effect/spider/stickyweb/attackby(obj/item/I, mob/user)
	if(!istype(user.loc, /turf))
		return
	if(!silk_baring)
		to_chat(user, SPAN_NOTICE("You can not collect anything from these webs."))
		qdel(src)
		return
	if(user.a_intent == I_HURT)
		to_chat(user, SPAN_NOTICE("You remove the webs."))
		qdel(src)
		return
	var/list/usable_qualities = list(QUALITY_WEAVING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_WEAVING)
		to_chat(user, SPAN_NOTICE("You started to collecting the sticky webs into a ball of silk."))
		if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_COG))
		//Hard to mess up but takes some time
			new /obj/item/stack/material/silk(get_turf(src), 1 ? 1 : 2)
			to_chat(user, SPAN_NOTICE("You bundle up a ball of spider silk."))
			qdel(src)
			return
	..()


/obj/effect/spider/stickyweb/fire_act(datum/gas_mixture/air, exposed_temperature, exposed_volume)
	if(exposed_temperature > T0C + 25) //Webs are even weaker to fire
		health -= 5
		healthCheck()

/obj/effect/spider/stickyweb/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0)) return 1
	var/mob/M = mover
	if(istype(M))
		if(M.faction == "spiders")
			return 1
	if(isliving(mover))
		var/mob/living/carbon/human/H = mover
		if(H.stats.getPerk(PERK_SPIDER_FRIEND))
			return 1
		if(prob(50))
			to_chat(mover, SPAN_WARNING("You get stuck in \the [src] for a moment."))
			return 0
	else if(istype(mover, /obj/item/projectile))
		return prob(30)
	return 1

/obj/effect/spider/eggcluster
	name = "egg cluster"
	desc = "They seem to pulse slightly with an inner life"
	icon_state = "eggs"
	var/amount_grown = 0
	var/spiderlings_lower = 3
	var/spiderlings_upper = 6

/obj/effect/spider/eggcluster/minor
	amount_grown = 20
	spiderlings_lower = 2
	spiderlings_upper = 4

/obj/effect/spider/eggcluster/New(var/location, var/atom/parent)
	pixel_x = rand(3,-3)
	pixel_y = rand(3,-3)
	START_PROCESSING(SSobj, src)
	get_light_and_color(parent)
	..()

/obj/effect/spider/eggcluster/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(istype(loc, /obj/item/organ/external))
		var/obj/item/organ/external/O = loc
		O.implants -= src

	. = ..()

/obj/effect/spider/eggcluster/Process()
	amount_grown += rand(0,2)
	if(amount_grown >= 100)
		var/num = rand(spiderlings_lower,spiderlings_upper)
		var/obj/item/organ/external/O = null
		if(istype(loc, /obj/item/organ/external))
			O = loc

		for(var/i=0, i<num, i++)
			var/spiderling = new /obj/effect/spider/spiderling(loc, src)
			if(O)
				O.implants += spiderling
		qdel(src)

/obj/effect/spider/spiderling
	name = "spiderling"
	desc = "It never stays still for long."
	icon_state = "spiderling"
	anchored = 0
	layer = PROJECTILE_HIT_THRESHHOLD_LAYER
	health = 3
	var/last_itch = 0
	var/amount_grown = -1
	var/obj/machinery/atmospherics/unary/vent_pump/entry_vent
	var/travelling_in_vent = 0
	var/spawn_type = /obj/random/mob/spiders

/obj/effect/spider/spiderling/New(var/location, var/atom/parent)
	pixel_x = rand(6,-6)
	pixel_y = rand(6,-6)
	START_PROCESSING(SSobj, src)
	//50% chance to grow up
	if(prob(50))
		amount_grown = 1
	get_light_and_color(parent)
	..()

/obj/effect/spider/spiderling/Destroy()
	STOP_PROCESSING(SSobj, src)
	if(entry_vent)
		entry_vent = null
	walk(src, 0)
	if (istype(loc, /obj/item/organ/external))
		var/obj/item/organ/external/O = loc
		O.implants -= src
	. = ..()

/obj/effect/spider/spiderling/Bump(atom/user)
	if(istype(user, /obj/structure/table))
		src.loc = user.loc
	else
		..()

/obj/effect/spider/spiderling/proc/die()
	visible_message("<span class='alert'>[src] dies!</span>")
	new /obj/effect/decal/cleanable/spiderling_remains(loc)
	qdel(src)

/obj/effect/spider/spiderling/healthCheck()
	if(health <= 0)
		die()

/obj/effect/spider/spiderling/Process()
	if(travelling_in_vent)
		if(istype(src.loc, /turf))
			travelling_in_vent = 0
			entry_vent = null
	else if(entry_vent)
		if(get_dist(src, entry_vent) <= 1)
			if(entry_vent.network && entry_vent.network.normal_members.len)
				var/list/vents = list()
				for(var/obj/machinery/atmospherics/unary/vent_pump/temp_vent in entry_vent.network.normal_members)
					vents.Add(temp_vent)
				if(!vents.len)
					entry_vent = null
					return
				var/obj/machinery/atmospherics/unary/vent_pump/exit_vent = pick(vents)

				spawn(rand(20,60))
					//Dirty hack
					if(!isnull(gc_destroyed))
						return

					loc = exit_vent
					var/travel_time = round(get_dist(loc, exit_vent.loc) / 2)
					spawn(travel_time)

						if(!exit_vent || exit_vent.welded)
							loc = entry_vent
							entry_vent = null
							return

						if(prob(50))
							src.visible_message(SPAN_NOTICE("You hear something squeezing through the ventilation ducts."),2)
						sleep(travel_time)
						//Dirty hack
						if(!isnull(gc_destroyed))
							return
						if(!exit_vent || exit_vent.welded)
							loc = entry_vent
							entry_vent = null
							return
						loc = exit_vent.loc
						entry_vent = null
						var/area/new_area = get_area(loc)
						if(new_area)
							new_area.Entered(src)
			else
				entry_vent = null
	//=================

	if(isturf(loc))
		if(prob(25))
			var/list/nearby = trange(5, src) - loc
			if(nearby.len)
				var/target_atom = pick(nearby)
				walk_to(src, target_atom, 5)
				if(prob(25))
					src.visible_message("<span class='notice'>\The [src] skitters[pick(" away"," around","")].</span>")
		else if(prob(1))
			//vent crawl!
			for(var/obj/machinery/atmospherics/unary/vent_pump/v in view(7,src))
				if(!v.welded)
					entry_vent = v
					walk_to(src, entry_vent, 5)
					break

		if(amount_grown >= 100)
			new spawn_type(src.loc, src) //This spawns the random mob spawner that the spiderling grows into
			qdel(src)
	else if(isorgan(loc))
		if(!amount_grown) amount_grown = 1
		var/obj/item/organ/external/O = loc
		if(!O.owner || O.owner.stat == DEAD || amount_grown > 80)
			O.implants -= src
			src.loc = O.owner ? O.owner.loc : O.loc
			src.visible_message("<span class='warning'>\A [src] makes its way out of [O.owner ? "[O.owner]'s [O.name]" : "\the [O]"]!</span>")
			if(O.owner)
				O.owner.apply_damage(1, BRUTE, O.organ_tag)
		else if(prob(1))
			O.owner.apply_damage(1, TOX, O.organ_tag)
			if(world.time > last_itch + 30 SECONDS)
				last_itch = world.time
				to_chat(O.owner, SPAN_NOTICE("Your [O.name] itches..."))
	else if(prob(1))
		src.visible_message(SPAN_NOTICE("\The [src] skitters."))

	if(amount_grown)
		amount_grown += rand(0,2)

/obj/effect/decal/cleanable/spiderling_remains
	name = "spiderling remains"
	desc = "Green squishy mess."
	icon = 'icons/effects/effects.dmi'
	icon_state = "blueshatter"
	anchored = TRUE

/obj/effect/spider/cocoon
	name = "cocoon"
	desc = "Something wrapped in silky spider web"
	icon_state = "cocoon1"
	health = 3

	var/is_large_cocoon

/obj/effect/spider/cocoon/Initialize()
	. = ..()
	icon_state = pick("cocoon1","cocoon2","cocoon3")

/obj/effect/spider/cocoon/proc/becomeLarge()
	health = 8
	is_large_cocoon = 1
	icon_state = pick("cocoon_large1","cocoon_large2","cocoon_large3")

/obj/effect/spider/cocoon/Destroy()
	src.visible_message(SPAN_WARNING("\The [src] splits open."))
	for(var/atom/movable/A in contents)
		A.forceMove(get_turf(src))
	return ..()

/obj/effect/spider/spiderling/near_grown
	amount_grown = 80
	spawn_type = /obj/random/mob/spiders/spider_ling //This one cant spawn carrons