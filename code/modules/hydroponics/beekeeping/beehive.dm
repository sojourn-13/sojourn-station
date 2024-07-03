/obj/machinery/beehive
	name = "beehive"
	desc = "A brown box hopefully full of honey and bees, they help pollinate plants keeping them healthy and help produce slighty!"
	icon = 'icons/obj/beekeeping.dmi'
	icon_state = "beehive"
	density = TRUE
	anchored = TRUE

	var/closed = FALSE
	var/bee_count = 0 // Percent
	var/smoked = 0 // Timer
	var/honeycombs = 0 // Percent
	var/frames = 0
	var/maxFrames = 5

	var/foods = 0 //How many flower beds are around us that we can use?

/obj/machinery/beehive/update_icon()
	cut_overlays()
	icon_state = "beehive"
	if(closed)
		add_overlay("lid")
	if(frames)
		add_overlay("empty[frames]")
	if(honeycombs >= 100)
		add_overlay("full[round(honeycombs / 100)]")
	if(!smoked)
		switch(bee_count)
			if(1 to 40)
				add_overlay("bees1")
			if(41 to 80)
				add_overlay("bees2")
			if(81 to 100)
				add_overlay("bees3")

/obj/machinery/beehive/examine(mob/user)
	..()
	if(!closed)
		to_chat(user, "The lid is open.")

/obj/machinery/beehive/attackby(obj/item/I, mob/user)

	if(istype(I, /obj/item/bee_smoker))
		if(closed)
			to_chat(user, SPAN_NOTICE("You need to open \the [src] with a crowbar before smoking the bees."))
			return
		user.visible_message(SPAN_NOTICE("\The [user] smokes the bees in \the [src]."), SPAN_NOTICE("You smoke the bees in \the [src]."))
		smoked = 30
		update_icon()
		return
	else if(istype(I, /obj/item/honey_frame))
		if(closed)
			to_chat(user, SPAN_NOTICE("You need to open \the [src] with a crowbar before inserting \the [I]."))
			return
		if(frames >= maxFrames)
			to_chat(user, SPAN_NOTICE("There is no place for an another frame."))
			return
		var/obj/item/honey_frame/H = I
		if(H.honey)
			to_chat(user, SPAN_NOTICE("\The [I] is full with beeswax and honey, empty it in the extractor first."))
			return
		++frames
		user.visible_message(SPAN_NOTICE("\The [user] loads \the [I] into \the [src]."), SPAN_NOTICE("You load \the [I] into \the [src]."))
		update_icon()
		user.drop_from_inventory(I)
		qdel(I)
		return
	else if(istype(I, /obj/item/bee_pack))
		var/obj/item/bee_pack/B = I
		if(B.full && bee_count)
			to_chat(user, SPAN_NOTICE("\The [src] already has bees inside."))
			return
		if(!B.full && bee_count < 90)
			to_chat(user, SPAN_NOTICE("\The [src] is not ready to split."))
			return
		if(!B.full && !smoked)
			to_chat(user, SPAN_NOTICE("Smoke \the [src] first!"))
			return
		if(closed)
			to_chat(user, SPAN_NOTICE("You need to open \the [src] with a crowbar before moving the bees."))
			return
		if(B.full)
			user.visible_message(SPAN_NOTICE("\The [user] puts the queen and the bees from \the [I] into \the [src]."), SPAN_NOTICE("You put the queen and the bees from \the [I] into \the [src]."))
			bee_count = 20
			B.empty()
		else
			user.visible_message(SPAN_NOTICE("\The [user] puts bees and larvae from \the [src] into \the [I]."), SPAN_NOTICE("You put bees and larvae from \the [src] into \the [I]."))
			bee_count /= 2
			B.fill()
		update_icon()
		return

	var/list/usable_qualities = list(QUALITY_BOLT_TURNING, QUALITY_SCREW_DRIVING, QUALITY_PRYING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	switch(tool_type)
		if(QUALITY_BOLT_TURNING)
			if(istype(get_turf(src), /turf/space) && !anchored)
				to_chat(user, SPAN_NOTICE("You can't anchor something to empty space. Idiot."))
				return
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("The [user] [anchored ? "wrenches" : "unwrenches"] \the [src]."))
				anchored = !anchored

		if(QUALITY_SCREW_DRIVING)
			if(bee_count)
				to_chat(user, SPAN_NOTICE("You can't dismantle \the [src] with these bees inside."))
				return
			to_chat(user, SPAN_NOTICE("You start dismantling \the [src]..."))
			playsound(loc, 'sound/items/Screwdriver.ogg', 50, 1)
			if(do_after(user, 30, src))
				user.visible_message(SPAN_NOTICE("\The [user] dismantles \the [src]."), SPAN_NOTICE("You dismantle \the [src]."))
				new /obj/item/beehive_assembly(loc)
				qdel(src)
			return

		if(QUALITY_PRYING)
			closed = !closed
			user.visible_message("<span class='notice'>\The [user] [closed ? "closes" : "opens"] \the [src].</span>", "<span class='notice'>You [closed ? "close" : "open"] \the [src].</span>")
			update_icon()
			return

		if(ABORT_CHECK)
			return

/obj/machinery/beehive/attack_hand(var/mob/user)
	if(used_now)
		to_chat(user, SPAN_NOTICE("Someone is already removing frames."))

	if(!closed)
		if(honeycombs < 100)
			to_chat(user, SPAN_NOTICE("There are no filled honeycombs."))
			return
		if(!smoked && bee_count)
			to_chat(user, SPAN_NOTICE("The bees won't let you take the honeycombs out like this, smoke them first."))
			return
		used_now = TRUE
		user.visible_message(SPAN_NOTICE("\The [user] starts taking the honeycombs out of \the [src]."), SPAN_NOTICE("You start taking the honeycombs out of \the [src]..."))
		while(honeycombs >= 100 && do_after(user, 30, src))
			new /obj/item/honey_frame/filled(loc)
			honeycombs -= 100
			--frames
			update_icon()
		if(honeycombs < 100)
			to_chat(user, SPAN_NOTICE("You take all filled honeycombs out."))
		used_now = FALSE
		return

/obj/machinery/beehive/Process()
	if(closed && !smoked && bee_count)
		pollinate_flowers()
		update_icon()
	smoked = max(0, smoked - 1)
	if(!smoked && bee_count)
		bee_count = min(foods + bee_count * 1.005, 100) //We start with are plant food amount so we dont times a negitive if we ever have harmful plants
		update_icon()
	foods = 0 //We reset are food after pollinating and dong are bee making, to prevent stacking

/obj/machinery/beehive/proc/pollinate_flowers()
	var/coef = bee_count / 100
	var/trays = 0
	for(var/obj/machinery/portable_atmospherics/hydroponics/H in view(7, src))
		if(H.seed && !H.dead)
			var/yield_o_seed = H.seed.get_trait(TRAIT_YIELD)
			yield_o_seed *= 0.5 //Bees can only give us a 1.5 mult, but it scales with base mult
			H.health += 0.05 * coef
			if(H.yield_mod < yield_o_seed)
				H.yield_mod += 0.001 * coef
			++trays
			if(H.seed.seed_name in bee_food_list)
				++foods
	coef = (foods + bee_count) / 100 //Redo are math to get extra honecomb
	honeycombs = min(honeycombs + 0.1 * coef * min(trays, 5), frames * 100)

/obj/machinery/honey_extractor
	name = "honey extractor"
	desc = "A machine used to turn honeycombs on the frame into honey and wax."
	icon = 'icons/obj/virology.dmi'
	icon_state = "centrifuge"
	density = TRUE
	anchored = TRUE
	var/processing = 0
	var/honey = 0
	var/spin_time = 50
	circuit = /obj/item/circuitboard/honey_extractor

/obj/machinery/honey_extractor/RefreshParts()
	..()
	var/sm_rating = 0
	var/sm_amount = 0
	for(var/obj/item/stock_parts/scanning_module/SM in component_parts)
		sm_rating += SM.rating
		sm_amount++

	spin_time = round(initial(spin_time)/(sm_rating/sm_amount))


/obj/machinery/honey_extractor/attackby(var/obj/item/I, var/mob/user)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	if(processing)
		to_chat(user, SPAN_NOTICE("\The [src] is currently spinning, wait until it's finished."))
		return
	else if(istype(I, /obj/item/honey_frame))
		var/obj/item/honey_frame/H = I
		var/frame_return = H.framed
		if(!H.honey)
			to_chat(user, SPAN_NOTICE("\The [H] is empty, put it into a beehive."))
			return
		user.visible_message(SPAN_NOTICE("\The [user] loads \the [H] into \the [src] and turns it on."), SPAN_NOTICE("You load \the [H] into \the [src] and turn it on."))
		processing = H.honey
		icon_state = "centrifuge_moving"
		qdel(H)
		spawn(spin_time)
			if(frame_return)
				new /obj/item/honey_frame(loc)
			new /obj/item/stack/wax(loc)
			honey += processing
			processing = 0
			icon_state = "centrifuge"

	else if(istype(I, /obj/item/reagent_containers/glass))
		if(!honey)
			to_chat(user, SPAN_NOTICE("There is no honey in \the [src]."))
			return
		var/obj/item/reagent_containers/glass/G = I
		var/transferred = min(G.reagents.maximum_volume - G.reagents.total_volume, honey)
		G.reagents.add_reagent("honey", transferred)
		honey -= transferred
		user.visible_message(SPAN_NOTICE("\The [user] collects honey from \the [src] into \the [G]."), SPAN_NOTICE("You collect [transferred] units of honey from \the [src] into \the [G]."))
		return 1

/obj/item/bee_smoker
	name = "bee smoker"
	desc = "A device used to calm down bees before harvesting honey."
	icon = 'icons/obj/device.dmi'
	icon_state = "battererburnt"
	w_class = ITEM_SIZE_SMALL

/obj/item/honey_frame
	name = "beehive frame"
	desc = "A frame for the beehive that the bees will fill with honeycombs."
	icon = 'icons/obj/beekeeping.dmi'
	icon_state = "honeyframe"
	w_class = ITEM_SIZE_SMALL

	var/honey = 0
	var/framed = TRUE

/obj/item/honey_frame/frameless
	name = "honeycomb"
	desc = "Honeycombs filled with honey, requires processing to get the honey out."
	icon_state = "honeycomb"
	honey = 20
	preloaded_reagents = list("honey" = 20, "woodpulp" = 10)
	framed = FALSE //So we dont give a frame when processed

/obj/item/honey_frame/filled
	name = "filled beehive frame"
	desc = "A frame for the beehive that the bees have filled with honeycombs."
	honey = 20

/obj/item/honey_frame/filled/New()
	..()
	add_overlay("honeycomb")

/obj/item/beehive_assembly
	name = "beehive assembly"
	desc = "Contains everything you need to build a beehive."
	icon = 'icons/obj/beekeeping.dmi'
	icon_state = "apiary"

/obj/item/beehive_assembly/attack_self(var/mob/user)
	to_chat(user, SPAN_NOTICE("You start assembling \the [src]..."))
	if(do_after(user, 30, src))
		user.visible_message(SPAN_NOTICE("\The [user] constructs a beehive."), SPAN_NOTICE("You construct a beehive."))
		new /obj/machinery/beehive(get_turf(user))
		user.drop_from_inventory(src)
		qdel(src)
	return

/obj/item/stack/wax
	name = "wax"
	singular_name = "wax piece"
	desc = "Soft substance produced by bees. Used to make candles."
	icon = 'icons/obj/beekeeping.dmi'
	icon_state = "wax"
	max_amount = 20
	price_tag = 95 //long and semi hard to get

/obj/item/stack/wax/New()
	..()
	recipes = wax_recipes

var/global/list/datum/stack_recipe/wax_recipes = list( \
	new/datum/stack_recipe("candle", /obj/item/flame/candle) \
)

/obj/item/bee_pack
	name = "bee pack"
	desc = "Contains a queen bee and some worker bees. Everything you'll need to start a hive!"
	icon = 'icons/obj/beekeeping.dmi'
	icon_state = "beepack"
	var/full = TRUE

/obj/item/bee_pack/New()
	..()
	add_overlay("beepack-full")

/obj/item/bee_pack/proc/empty()
	full = FALSE
	name = "empty bee pack"
	desc = "A stasis pack for moving bees. It's empty."
	cut_overlays()
	add_overlay("beepack-empty")

/obj/item/bee_pack/proc/fill()
	full = initial(full)
	name = initial(name)
	desc = initial(desc)
	cut_overlays()
	add_overlay("beepack-full")
