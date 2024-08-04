/obj/structure/flora
	//Stuff for maintaining colony plaints
	var/needs_to_maintain = FALSE
	var/needs_to_be_deweeded = FALSE
	var/needs_to_be_pest_b_goned = FALSE
	var/needs_to_be_watered = FALSE //fancy water only
	var/remove_dead_weeds = FALSE
	var/remove_dead_pets = FALSE
//	var/maintenance_timer = 999 HOURS TODO: make a timer that works

/obj/structure/flora/New()
	..()
	if(needs_to_maintain)
		im_dieing_gardener()
	//	maintenance_timer = clamp(rand(60,90),rand(90,120),120) MINUTES //The idea is most 2 hours before maintaing
	//minium of 1 hour and a good middle ground of 1 hour and a half before you got to go maintain it more

///obj/structure/flora/Process()
//	if(needs_to_maintain )
//		im_dieing_gardener()

/obj/structure/flora/proc/im_dieing_gardener()
	if(needs_to_maintain)
		if(prob(25))
			needs_to_be_deweeded = TRUE
			sanity_damage += 0.004
		if(prob(25))
			needs_to_be_pest_b_goned = TRUE
			sanity_damage += 0.004
		if(prob(25))
			needs_to_be_watered = TRUE
			sanity_damage += 0.004
		if(prob(10))
			remove_dead_weeds = TRUE
			sanity_damage += 0.004
		if(prob(10))
			remove_dead_pets = TRUE
			sanity_damage += 0.004

/obj/structure/flora/examine(mob/user)
	..()
	if(needs_to_maintain)
		to_chat(user, "<span class='info'>This plant needs to be maintained a bit from time to time.</span>")
	if(needs_to_be_deweeded)
		to_chat(user, "<span class='info'>Weeds seem to have infested this plant.</span>")
	if(needs_to_be_pest_b_goned)
		to_chat(user, "<span class='info'>Small harmful pests can be seen on the plant and in its pot.</span>")
	if(needs_to_be_watered)
		to_chat(user, "<span class='info'>This plant looks rather dry and seems to need some LSS Plant Mineral Water.</span>")
	if(remove_dead_weeds)
		to_chat(user, "<span class='info'>This plant has some dead weeds mingling with it.</span>")
	if(remove_dead_pets)
		to_chat(user, "<span class='info'>This plant has some dead bugs on it, gross.</span>")

/obj/structure/flora/attackby(obj/item/I, mob/user)
	..()
	if(needs_to_be_deweeded)
		if(istype(I, /obj/item/plantspray/weeds) || istype(I, /obj/item/weedkiller))
			to_chat(user, "<span class='info'>The invasive weeds wilt away.</span>")
			needs_to_be_deweeded = FALSE
			remove_dead_weeds = TRUE
			sanity_damage -= 0.004
			if(isliving(user))
				var/mob/living/H = user
				H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/clay_thumb, "CLAY_THUMB_CONISOUR", skill_gained = 2, learner = H)
			return
		if(istype(I, /obj/item/tool/minihoe))
			to_chat(user, "<span class='info'>You remove the invasive plants.</span>")
			needs_to_be_deweeded = FALSE
			sanity_damage -= 0.004
			if(isliving(user))
				var/mob/living/H = user
				H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/clay_thumb, "CLAY_THUMB_CONISOUR", skill_gained = 1, learner = H)
			return
	if(remove_dead_weeds)
		if(istype(I, /obj/item/tool/minihoe)  || istype(I, /obj/item/tool/scythe))
			to_chat(user, "<span class='info'>The weeds are no more.</span>")
			remove_dead_weeds = FALSE
			sanity_damage -= 0.004
			if(isliving(user))
				var/mob/living/H = user
				H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/clay_thumb, "CLAY_THUMB_CONISOUR", skill_gained = 1, learner = H)
			return
	if(needs_to_be_pest_b_goned)
		if(istype(I, /obj/item/plantspray))
			to_chat(user, "<span class='info'>The harmful pests slowly die out.</span>")
			needs_to_be_pest_b_goned = FALSE
			remove_dead_pets = TRUE
			sanity_damage -= 0.004
			if(isliving(user))
				var/mob/living/H = user
				H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/clay_thumb, "CLAY_THUMB_CONISOUR", skill_gained = 1, learner = H)
			return
	if(remove_dead_pets)
		if(istype(I, /obj/item/tool/shovel))
			to_chat(user, "<span class='info'>The dead pests are no more.</span>")
			remove_dead_pets = FALSE
			sanity_damage -= 0.004
			if(isliving(user))
				var/mob/living/H = user
				H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/clay_thumb, "CLAY_THUMB_CONISOUR", skill_gained = 1, learner = H)
			return
	if(needs_to_be_watered)
		if(istype(I, /obj/item/plantspray/water))
			to_chat(user, "<span class='info'>The water rejuvenates the plants.</span>")
			needs_to_be_watered = FALSE
			sanity_damage -= 0.004
			if(isliving(user))
				var/mob/living/H = user
				H.learnt_tasks.attempt_add_task_mastery(/datum/task_master/task/clay_thumb, "CLAY_THUMB_CONISOUR", skill_gained = 3, learner = H)
			return

//grass
/obj/structure/flora/grass
	name = "grass"
	icon = 'icons/obj/flora/snowflora.dmi'
	anchored = 1

/obj/structure/flora/grass/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/grass/brown
	icon_state = "snowgrass1bb"

/obj/structure/flora/grass/brown/New()
	..()
	icon_state = "snowgrass[rand(1, 3)]bb"


/obj/structure/flora/grass/green
	icon_state = "snowgrass1gb"

/obj/structure/flora/grass/green/New()
	..()
	icon_state = "snowgrass[rand(1, 3)]gb"

/obj/structure/flora/grass/both
	icon_state = "snowgrassall1"

/obj/structure/flora/grass/both/New()
	..()
	icon_state = "snowgrassall[rand(1, 3)]"


//bushes
/obj/structure/flora/bush
	name = "bush"
	icon = 'icons/obj/flora/snowflora.dmi'
	icon_state = "snowbush1"
	anchored = 1

/obj/structure/flora/bush/New()
	..()
	icon_state = "snowbush[rand(1, 6)]"
//newbushes

/obj/structure/flora/ausbushes
	name = "bush"
	icon = 'icons/obj/flora/ausflora.dmi'
	icon_state = "firstbush_1"
	anchored = 1
	layer = LOW_OBJ_LAYER

/obj/structure/flora/ausbushes/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the plant, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You harvest some clippings,"))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			if(prob(20))
				new /obj/plant_spawner/towercaps(get_turf(src))
				to_chat(user, SPAN_NOTICE("Even got a towercap log out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/ausbushes/New()
	..()
	icon_state = "firstbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/reedbush
	icon_state = "reedbush_1"

/obj/structure/flora/ausbushes/reedbush/New()
	..()
	icon_state = "reedbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/leafybush
	icon_state = "leafybush_1"

/obj/structure/flora/ausbushes/leafybush/New()
	..()
	icon_state = "leafybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/palebush
	icon_state = "palebush_1"

/obj/structure/flora/ausbushes/palebush/New()
	..()
	icon_state = "palebush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/stalkybush
	icon_state = "stalkybush_1"

/obj/structure/flora/ausbushes/stalkybush/New()
	..()
	icon_state = "stalkybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/grassybush
	icon_state = "grassybush_1"

/obj/structure/flora/ausbushes/grassybush/New()
	..()
	icon_state = "grassybush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/fernybush
	icon_state = "fernybush_1"

/obj/structure/flora/ausbushes/fernybush/New()
	..()
	icon_state = "fernybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/sunnybush
	icon_state = "sunnybush_1"

/obj/structure/flora/ausbushes/sunnybush/New()
	..()
	icon_state = "sunnybush_[rand(1, 3)]"

/obj/structure/flora/ausbushes/genericbush
	icon_state = "genericbush_1"

/obj/structure/flora/ausbushes/genericbush/New()
	..()
	icon_state = "genericbush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/pointybush
	icon_state = "pointybush_1"

/obj/structure/flora/ausbushes/pointybush/New()
	..()
	icon_state = "pointybush_[rand(1, 4)]"

/obj/structure/flora/ausbushes/lavendergrass
	name = "lavender"
	icon_state = "lavendergrass_1"

/obj/structure/flora/ausbushes/lavendergrass/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the plant, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/harebells(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Got a flower out of it too!"))
			qdel(src)
			return
		return


/obj/structure/flora/ausbushes/lavendergrass/New()
	..()
	icon_state = "lavendergrass_[rand(1, 4)]"

/obj/structure/flora/ausbushes/ywflowers
	name = "flowers"
	icon_state = "ywflowers_1"

/obj/structure/flora/ausbushes/ywflowers/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the plant, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/sunflower(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Got a flower out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/ausbushes/ywflowers/New()
	..()
	icon_state = "ywflowers_[rand(1, 3)]"

/obj/structure/flora/ausbushes/brflowers
	name = "flowers"
	icon_state = "brflowers_1"

/obj/structure/flora/ausbushes/brflowers/New()
	..()
	icon_state = "brflowers_[rand(1, 3)]"

/obj/structure/flora/ausbushes/ppflowers
	name = "flowers"
	icon_state = "ppflowers_1"

/obj/structure/flora/ausbushes/ppflowers/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the plant, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/poppy(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Got a flower out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/ausbushes/ppflowers/New()
	..()
	icon_state = "ppflowers_[rand(1, 4)]"

/obj/structure/flora/ausbushes/sparsegrass
	name = "sparse grass"
	icon_state = "sparsegrass_1"

/obj/structure/flora/ausbushes/sparsegrass/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the plant, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Got a flower out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/ausbushes/sparsegrass/New()
	..()
	icon_state = "sparsegrass_[rand(1, 3)]"

/obj/structure/flora/ausbushes/fullgrass
	name = "full grass"
	icon_state = "fullgrass_1"

/obj/structure/flora/ausbushes/fullgrass/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the plant, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Got a flower out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/ausbushes/fullgrass/New()
	..()
	icon_state = "fullgrass_[rand(1, 3)]"

/obj/structure/flora/small
	anchored = 1

/obj/structure/flora/small/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_HAMMERING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_HAMMERING)
		to_chat(user, SPAN_NOTICE("Crushing the rocks, turning them to sand..."))
		if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/item/stack/ore/glass(get_turf(src))
			new /obj/item/stack/ore/glass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You crush the rocks into dust! Well sand..."))
			qdel(src)
			return
		return

/obj/structure/flora/small/rock1
	name = "rocks"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock1"

/obj/structure/flora/small/rock2
	name = "rocks"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock2"

/obj/structure/flora/small/rock3
	name = "rocks"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock3"

/obj/structure/flora/small/rock4
	name = "rocks"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock4"

/obj/structure/flora/small/rock5
	name = "rocks"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "rock5"

/obj/structure/flora/small/trailrocka1
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrock1"
	name = "rocks"

/obj/structure/flora/small/trailrocka2
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrock2"
	name = "rocks"

/obj/structure/flora/small/trailrocka3
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrock3"
	name = "rocks"

/obj/structure/flora/small/trailrocka4
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrock4"
	name = "rocks"

/obj/structure/flora/small/trailrocka5
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrock5"
	name = "rocks"

/obj/structure/flora/small/trailrockb1
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrockbig1"
	name = "rocks"

/obj/structure/flora/small/trailrockb2
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrockbig2"
	name = "rocks"

/obj/structure/flora/small/trailrockb3
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrockbig3"
	name = "rocks"

/obj/structure/flora/small/trailrockb4
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrockbig4"
	name = "rocks"

/obj/structure/flora/small/trailrockb5
	name = "rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "trailrockbig5"
	name = "rocks"

/obj/structure/flora/small/lavarock1
	name = "black rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "lavarocks1"
	name = "rocks"

/obj/structure/flora/small/lavarock2
	name = "black rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "lavarocks2"
	name = "rocks"

/obj/structure/flora/small/lavarock3
	name = "black rocks"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "lavarocks3"
	name = "rocks"

/obj/structure/flora/small/busha1
	name = "bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha1"

/obj/structure/flora/small/busha1/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src)) //We get more
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/busha2
	name = "bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha2"

/obj/structure/flora/small/busha2/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src)) //We get more
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/busha3
	name = "bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "busha3"

/obj/structure/flora/small/busha3/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src)) //We get more
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/bushb1
	name = "bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb1"

/obj/structure/flora/small/bushb1/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src)) //We get more
			if(prob(20))
				new /obj/plant_spawner/towercaps(get_turf(src))
				to_chat(user, SPAN_NOTICE("Even got a towercap log out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/small/bushb2
	name = "bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb2"

/obj/structure/flora/small/bushb2/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src)) //We get more
			if(prob(20))
				new /obj/plant_spawner/towercaps(get_turf(src))
				to_chat(user, SPAN_NOTICE("Even got a towercap log out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/small/bushb3
	name = "bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushb3"

/obj/structure/flora/small/bushb3/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			new /obj/plant_spawner/grass(get_turf(src))
			if(prob(70))
				new /obj/plant_spawner/towercaps(get_turf(src))
				to_chat(user, SPAN_NOTICE("Even got a towercap log out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/small/bushc1
	name = "bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushc1"

/obj/structure/flora/small/bushc1/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			new /obj/plant_spawner/grass(get_turf(src))
			if(prob(60))
				new /obj/plant_spawner/towercaps(get_turf(src))
				to_chat(user, SPAN_NOTICE("Even got a towercap log out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/small/bushc2
	name = "bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushc2"

/obj/structure/flora/small/bushc2/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			new /obj/plant_spawner/grass(get_turf(src))
			if(prob(20))
				new /obj/plant_spawner/towercaps(get_turf(src))
				to_chat(user, SPAN_NOTICE("Even got a towercap log out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/small/bushc3
	name = "bush"
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "bushc3"

/obj/structure/flora/small/bushc3/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			new /obj/plant_spawner/grass(get_turf(src))
			if(prob(20))
				new /obj/plant_spawner/towercaps(get_turf(src))
				to_chat(user, SPAN_NOTICE("Even got a towercap log out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/small/grassa1
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa1"

/obj/structure/flora/small/grassa1/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/grassa2
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa2"

/obj/structure/flora/small/grassa2/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/grassa3
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa3"

/obj/structure/flora/small/grassa3/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/grassa4
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa4"

/obj/structure/flora/small/grassa4/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/grassa5
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassa5"

/obj/structure/flora/small/grassa5/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/grassb1
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb1"

/obj/structure/flora/small/grassb1/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/grassb2
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb2"

/obj/structure/flora/small/grassb2/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/grassb3
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb3"

/obj/structure/flora/small/grassb3/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/grassb4
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb4"

/obj/structure/flora/small/grassb4/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/small/grassb5
	icon = 'icons/obj/flora/jungleflora.dmi'
	icon_state = "grassb5"

/obj/structure/flora/small/grassb5/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the grass, harvesting some clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/big
	name = "big bush"
	layer = ABOVE_MOB_LAYER
	anchored = 1



/obj/structure/flora/big/bush1
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush1"

/obj/structure/flora/big/bush1/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the bush away, harvesting some plant clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/big/bush2
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush2"

/obj/structure/flora/big/bush2/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the bush away, harvesting some plant clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/big/bush3
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush3"

/obj/structure/flora/big/bush3/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the bush away, harvesting some plant clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			new /obj/plant_spawner/grass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/big/rocks1
	name = "rock pile"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "rocks1"
	layer = PROJECTILE_HIT_THRESHHOLD_LAYER

/obj/structure/flora/big/rocks1/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_HAMMERING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_HAMMERING)
		to_chat(user, SPAN_NOTICE("Crushing the rocks, turning them to sand..."))
		if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/item/stack/ore/glass(get_turf(src))
			new /obj/item/stack/ore/glass(get_turf(src))
			new /obj/random/material_ore(get_turf(src))
			new /obj/random/material_ore(get_turf(src))
			to_chat(user, SPAN_NOTICE("You crush the rocks into dust! Well sand..."))
			qdel(src)
			return
		return

/obj/structure/flora/big/rocks2
	name = "rock pile"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "rocks2"
	layer = PROJECTILE_HIT_THRESHHOLD_LAYER

/obj/structure/flora/big/rocks2/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_HAMMERING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_HAMMERING)
		to_chat(user, SPAN_NOTICE("Crushing the rocks, turning them to sand..."))
		if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/item/stack/ore/glass(get_turf(src))
			new /obj/item/stack/ore/glass(get_turf(src))
			new /obj/random/material_ore(get_turf(src))
			new /obj/random/material_ore(get_turf(src))
			to_chat(user, SPAN_NOTICE("You crush the rocks into dust! Well sand..."))
			qdel(src)
			return
		return

/obj/structure/flora/big/rocks3
	name = "rock pile"
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "rocks3"
	layer = PROJECTILE_HIT_THRESHHOLD_LAYER

/obj/structure/flora/big/rocks3/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_HAMMERING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_HAMMERING)
		to_chat(user, SPAN_NOTICE("Crushing the rocks, turning them to sand..."))
		if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/item/stack/ore/glass(get_turf(src))
			new /obj/item/stack/ore/glass(get_turf(src))
			new /obj/random/material_ore(get_turf(src))
			new /obj/random/material_ore(get_turf(src))
			to_chat(user, SPAN_NOTICE("You crush the rocks into dust! Well sand..."))
			qdel(src)
			return
		return

/obj/structure/flora/pumpkin
	name = "pumpkin"
	icon = 'icons/obj/flora/pumpkins.dmi'
	desc = "A healthy, fat pumpkin. It looks as if it was freshly plucked from its vines and shows no signs of decay."
	icon_state = "decor-pumpkin"

/obj/effect/landmark/carved_pumpkin_spawn
	name = "jack o' lantern spawn"
	icon = 'icons/obj/flora/pumpkins.dmi'
	icon_state = "spawner-jackolantern"

/obj/effect/landmark/carved_pumpkin_spawn/New()
	var/new_pumpkin = pick(
		prob(70);/obj/structure/flora/pumpkin,
		prob(60);/obj/structure/flora/pumpkin/carved,
		prob(30);/obj/structure/flora/pumpkin/carved/scream,
		prob(30);/obj/structure/flora/pumpkin/carved/girly,
		prob(10);/obj/structure/flora/pumpkin/carved/owo)
	new new_pumpkin(src.loc)
	..()

/obj/structure/flora/pumpkin/carved
	name = "jack o' lantern"
	desc = "A fat, freshly picked pumpkin. This one has a face carved into it! This one has devilishly evil-looking eyes and a grinning mouth more than big enough for a very small person to hide in."
	icon_state = "decor-jackolantern"

/obj/structure/flora/pumpkin/carved/scream
	desc = "A fat, freshly picked pumpkin. This one has a face carved into it! This one has rounded eyes looking in completely opposite directions and a wide mouth, forever frozen in a silent scream. It looks ridiculous, actually."
	icon_state = "decor-jackolantern-scream"

/obj/structure/flora/pumpkin/carved/girly
	desc = "A fat, freshly picked pumpkin. This one has a face carved into it! This one has neatly rounded eyes topped with what appear to be cartoon-y eyelashes, completed with what seems to have been the carver's attempt at friendly, toothy smile. The mouth is easily the scariest part of its face."
	icon_state = "decor-jackolantern-girly"

/obj/structure/flora/pumpkin/carved/owo
	desc = "A fat, freshly picked pumpkin. This one has a face carved into it! This one has large, round eyes and a squiggly, cat-like smiling mouth. Its pleasantly surprised expression seems to suggest that the pumpkin has noticed something about you."
	icon_state = "decor-jackolantern-owo"

/obj/structure/flora/rock
	name = "rock"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "basalt1"
	desc = "A dull and sturdy rock."
	anchored = 1
	density = 1

/obj/structure/flora/rock/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_HAMMERING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_HAMMERING)
		to_chat(user, SPAN_NOTICE("Crushing the rocks, turning them to sand..."))
		if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/item/stack/ore/glass(get_turf(src))
			to_chat(user, SPAN_NOTICE("You crush the rocks into dust! Well sand..."))
			qdel(src)
			return
		return

/obj/structure/flora/rock/variant1
	name = "rock"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "basalt2"
	desc = "A dull and sturdy rock."
	anchored = 1

/obj/structure/flora/rock/variant2
	name = "rock"
	icon = 'icons/obj/flora/rocks.dmi'
	icon_state = "basalt3"
	desc = "A dull and sturdy rock."
	anchored = 1

/obj/structure/flora/church_rock //Durasteel ore
	name = "Ashen Stone"
	icon = 'icons/obj/flora/church_stuff.dmi'
	icon_state = "church_rock"
	desc = "A stone found by the church, said to hold some sort of significance, though no one is quite sure what."
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	mouse_opacity = MOUSE_OPACITY_ICON

obj/structure/flora/small/snow/rock1
	name = "rocks"
	desc = "Rocks with snow atop."
	icon = 'icons/obj/flora/snowrocks.dmi'
	icon_state = "snowrock1"

/obj/structure/flora/small/snow/rock2
	name = "rocks"
	desc = "Rocks with snow atop."
	icon = 'icons/obj/flora/snowrocks.dmi'
	icon_state = "snowrock2"

/obj/structure/flora/small/snow/rock3
	name = "rocks"
	desc = "Rocks with snow atop."
	icon = 'icons/obj/flora/snowrocks.dmi'
	icon_state = "snowrock3"

/obj/structure/flora/small/snow/rock4
	name = "rocks"
	desc = "Rocks with snow atop."
	icon = 'icons/obj/flora/snowrocks.dmi'
	icon_state = "snowrock4"

/obj/structure/flora/small/snow/rock5
	name = "rocks"
	desc = "Rocks with snow atop."
	icon = 'icons/obj/flora/snowrocks.dmi'
	icon_state = "snowrock5"

/obj/structure/flora/small/snow/rock6
	name = "rocks"
	desc = "Rocks with snow atop."
	icon = 'icons/obj/flora/snowrocks.dmi'
	icon_state = "snowrock6"

/obj/structure/flora/small/snow/rock7
	name = "rocks"
	desc = "Rocks with snow atop."
	icon = 'icons/obj/flora/snowrocks.dmi'
	icon_state = "snowrock7"

/obj/structure/flora/small/snow/rock8
	name = "rocks"
	desc = "Rocks with snow atop."
	icon = 'icons/obj/flora/snowrocks.dmi'
	icon_state = "snowrock8"

/obj/structure/flora/small/snow/boulder1
	name = "boulder"
	desc = "A large rock with a flat top where ice and snow has built up."
	density = TRUE
	icon = 'icons/obj/flora/snowrocks.dmi'
	icon_state = "snowboulder1"

/obj/structure/flora/small/snow/boulder2
	name = "boulder"
	desc = "A large rock with snow and ice on the top."
	density = TRUE
	icon = 'icons/obj/flora/snowrocks.dmi'
	icon_state = "snowboulder2"
