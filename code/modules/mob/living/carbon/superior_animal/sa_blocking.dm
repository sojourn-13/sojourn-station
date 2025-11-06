/mob/living/carbon/superior/Initialize(mapload)
	..()
	lower_guard_message = "[src] [lower_guard_message]"
	raise_guard_message = "[src] [raise_guard_message]"

/mob/living/carbon/superior/proc/stop_blocking()
	if(!mob_is_blocking)
		return
	block_cooldown_timer = world.time + block_cooldown
	mob_is_blocking = FALSE
	visible_message(SPAN_NOTICE("[lower_guard_message]"))
	if(HUDneed.Find("block"))
		var/obj/screen/block/HUD = HUDneed["block"]
		HUD.update_icon()
	update_block_overlay()
	return

/mob/living/carbon/superior/proc/start_blocking()
	if(mob_is_blocking)
		return
	if(world.time < block_cooldown_timer + block_cooldown)
		return
	mob_is_blocking = TRUE
	visible_message(SPAN_NOTICE("[raise_guard_message]"))
	if(HUDneed.Find("block"))
		var/obj/screen/block/HUD = HUDneed["block"]
		HUD.update_icon()
	update_block_overlay()
	return

/mob/living/carbon/superior/getarmorablative(var/def_zone, var/type)
	var/total = 0

	total += blocking_value
	total += mob_ablative_armor
	//Blocking gives of affectively free armor based on TGH + item in hand
	if(mob_is_blocking)
		if(stats.getStat(STAT_TGH) > 0)
			//Prevents a devide by 0
			var/tgt = stats.getStat(STAT_TGH)
			if(tgt == 0)
				tgt = 1
			total += clamp(0, round(tgt/12), 10)

	if(stats.getPerk(PERK_RESILIENCE))
		total += 3 //smoll universal armor boost

	return total


/mob/living/carbon/superior/proc/update_block_overlay(var/update_icons=1)
	var/image/I
	I = image("icon"='icons/mob/misc_overlays.dmi', "icon_state"="block", "layer"=BLOCKING_LAYER)

	if(mob_is_blocking)
		add_overlay(I)
	else
		cut_overlay(I)


	update_icons()