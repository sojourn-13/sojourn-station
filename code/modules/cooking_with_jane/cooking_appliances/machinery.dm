/obj/machinery/cooking_with_jane
	var/tmp/obj/effect/flicker_overlay/scan
	var/list/scan_types = list()
	var/scan_chance = 1

/obj/machinery/cooking_with_jane/Initialize()
	. = ..()
	scan = new(src)

/obj/machinery/cooking_with_jane/RefreshParts()
	var/scan_rating = 0
	for(var/obj/item/stock_parts/scanning_module/M in component_parts)
		scan_rating += M.rating
	if(scan_rating >= 4)
		scan_chance = scan_rating - 3
	else
		scan_chance = 0

/obj/machinery/cooking_with_jane/proc/decide_action(var/force_action)
	if(prob(scan_chance) || force_action)
		var/list/witnesses = list()
		for(var/mob/living/carbon/human/target in ohearers(10))
			witnesses += target

		if(witnesses.len)
			var/action = 0
			if(!force_action)
				if(prob(95))
					action = 1
				else
					action = 2

			if(action == 1)
				var/flick_state = pick(scan_types)
				#ifdef CWJ_DEBUG
				log_debug("Called /cooking_with_jane/decide_action([force_action]). Decided [action], used for icon_state [flick_state] on [src]")
				#endif
				flick(flick_state, scan)
			if(action == 2)
				var/mob/living/carbon/human/target = pick(witnesses)
				#ifdef CWJ_DEBUG
				log_debug("Called /cooking_with_jane/decide_action([force_action]). Decided [action], ran scan animation on [target]")
				#endif
				var/image/img = image('icons/obj/cwj_cooking/kitchen.dmi', target)
				view() << img
				flick("scan_person", img)
				spawn(40)
					qdel(img)
				src.visible_message(SPAN_NOTICE("A small device pops out of the [src]. It runs a scan on [target]."))
		#ifdef CWJ_DEBUG
		else
			log_debug("Called /cooking_with_jane/decide_action([force_action]) and tried to run an event, but no witnesses were found near [src]")
		#endif