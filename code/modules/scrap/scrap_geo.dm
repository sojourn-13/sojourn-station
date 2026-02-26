/obj/item/scrap_geo
	w_class = ITEM_SIZE_NORMAL
	name = "Scrap Geo"
	desc = "A cluster of dence, layered trash, eather made to be protect whatever is inside or by happenstance, \
	breaking this down will likely be more worthwile then jamming it into a recycler"
	var/steps = 4
	var/step = 1
	var/tool_needed = QUALITY_PRYING
	var/layer_time = WORKTIME_NORMAL
	var/busy = FALSE

	icon_state = "geo"
	icon = 'icons/obj/structures/scrap/refine.dmi'

/obj/item/scrap_geo/Initialize(mapload, severity = 1)
	..()
	steps = rand(4,12)

/obj/item/scrap_geo/examine(var/mob/user)
	.=..()
	if (isliving(user))
		if(steps > step && tool_needed)
			to_chat(user, SPAN_NOTICE("The [src] has a layer of trash that would need to be removed by [tool_needed]"))
		if(!tool_needed)
			to_chat(user, SPAN_NOTICE("The [src] has a layer of trash that can be carefully peeled off by hand"))
		if(step >= steps)
			to_chat(user, SPAN_NOTICE("The [src] is just about cracked open, just needs to be pulled apart by hand"))

/obj/item/scrap_geo/proc/cycle_steps(mob/user)
	step += 1
	layer_time = rand(WORKTIME_NORMAL, WORKTIME_LONG)
	if(step >= steps)
		to_chat(user, SPAN_NOTICE("With a little bit of pulling by hand the layers of scrap breaks away."))
		new /obj/item/scrap_lump(user.loc)
		if(prob(10))
			new /obj/random/junk/items_only(user.loc)
			new /obj/random/junk/items_only(user.loc)
		if(prob(10))
			new /obj/item/stack/rods/random(user.loc)
			new /obj/item/stack/material/steel/random(user.loc)
		if(prob(10))
			new /obj/item/material/shard(user.loc)
			new /obj/item/material/shard(user.loc)
		if(prob(10))
			new /obj/random/common_oddities(user.loc)
		if(prob(10))
			new /obj/item/storage/wallet/random(user.loc)
		if(prob(10))
			new /obj/random/powercell(user.loc)
		if(prob(10))
			new /obj/random/gun_parts/frames(user.loc)
		if(prob(10))
			new /obj/item/scrap_lump(user.loc)
		if(prob(10))
			new /obj/item/stack/material/refined_scrap/random(user.loc)
		if(prob(10))
			new /obj/item/ammo_kit(user.loc) //Simulates layers of cases and other unspent scrap ammo
		if(prob(10))
			new /obj/item/stack/rods/random(user.loc)
			new /obj/item/material/shard(user.loc)
		var/loot_item = pick(/obj/random/pouch, /obj/random/pack/tech_loot, \
							/obj/random/tool_upgrade, /obj/random/pack/gun_loot,
							/obj/random/science)
		if(loot_item)
			new loot_item(user.loc)
		else
			if(prob(80))
				new /obj/random/booze(user.loc)
			else
				new /obj/random/medical/always_spawn(user.loc)
		qdel(src)
	else
		tool_needed = pick(QUALITY_PRYING,\
						   FALSE,\
						   QUALITY_SHOVELING,\
						   QUALITY_DIGGING,\
						   QUALITY_CUTTING,\
						   QUALITY_SCREW_DRIVING,\
						   QUALITY_HAMMERING,\
						   QUALITY_BOLT_TURNING,\
						   QUALITY_WELDING,\
						   QUALITY_EXCAVATION)

//Super easy task to farm for super minior gains
/obj/item/scrap_geo/attackby(obj/item/W, mob/living/carbon/human/user)
	if(user.a_intent != I_HURT)
		if(tool_needed)
			user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
			var/list/usable_qualities = list(tool_needed)
			var/tool_type = W.get_tool_type(user, usable_qualities, src)
			if(tool_type == tool_needed)
				if(W.use_tool(user, src, layer_time - user.learnt_tasks.get_task_mastery_level("SCRAPPER"), tool_needed, FAILCHANCE_VERY_EASY - user.learnt_tasks.get_task_mastery_level("SCRAPPER"), required_stat = STAT_ROB, forced_sound = "rummage"))
					user.visible_message(SPAN_NOTICE("[user] works on \the [src]."))
					user.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/scrapper, "SCRAPPER", skill_gained = 0.1, learner = user)
					cycle_steps(user)
		else
			cycle_steps(user)
	..()

/obj/item/scrap_geo/attack_hand(mob/living/carbon/human/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(user.a_intent != I_HURT)
		if(!tool_needed && !busy)
			busy = TRUE
			if(do_after(user, layer_time - user.learnt_tasks.get_task_mastery_level("SCRAPPER")))
				user.visible_message(SPAN_NOTICE("[user] works on \the [src]."))
				user.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/scrapper, "SCRAPPER", skill_gained = 0.1, learner = user)
				cycle_steps(user)
			busy = FALSE
