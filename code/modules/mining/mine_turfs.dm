/**********************Mineral deposits**************************/
/turf/unsimulated/mineral
	name = "impassable rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock-dark"
	blocks_air = 1
	density = 1
	opacity = 1
	layer = BELOW_MOB_LAYER

/turf/unsimulated/mineral/cold
	name = "impassable rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock-cold"
	blocks_air = 1
	density = 1
	opacity = 1
	layer = BELOW_MOB_LAYER

/turf/unsimulated/mineral/transition
	name = "path elsewhere"
	desc = "Looks like this leads to a whole new area."
	icon_state = "floor_transition"

/turf/unsimulated/mineral/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_EXCAVATION)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_EXCAVATION)
		to_chat(user, SPAN_NOTICE("You try to break out a rock geode or two."))
		if(I.use_tool(user, src, WORKTIME_DELAYED, tool_type, FAILCHANCE_ZERO, required_stat = STAT_ROB))
			new /obj/random/material_ore_small(get_turf(src))
			if(prob(50))
				new /obj/random/material_ore_small(get_turf(src))
			if(prob(25))
				new /obj/random/material_ore_small(get_turf(src))
			if(prob(5))
				new /obj/random/material_ore_small(get_turf(src))
			to_chat(user, SPAN_NOTICE("You break out some rock geode(s)."))
			return
		return

/turf/unsimulated/wall/jungle
	name = "dense forestry"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_state = "wall2"
	desc = "A thick, impassable mass of plants and shrubbery."
	blocks_air = 1
	density = 1
	opacity = 1

/turf/unsimulated/wall/jungle/variant
	name = "dense forestry"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_state = "wall1"
	desc = "A thick, impassable mass of plants and shrubbery."
	blocks_air = 1
	density = 1
	opacity = 1

/turf/simulated/mineral //wall piece
	name = "Rock"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rock"
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	opacity = 1
	density = 1
	layer = BELOW_MOB_LAYER
	blocks_air = 1
	temperature = T20C
	var/mined_turf = /turf/simulated/floor/asteroid
	var/ore/mineral
	var/mined_ore = 0
	var/last_act = 0
	var/emitter_blasts_taken = 0 // EMITTER MINING! Muhehe.

	var/datum/geosample/geologic_data
	var/excavation_level = 0
	var/list/finds
	var/next_rock = 0
	var/archaeo_overlay = ""
	var/excav_overlay = ""
	var/obj/item/last_find
	var/datum/artifact_find/artifact_find

	has_resources = 1

/turf/simulated/mineral/Initialize()
	.=..()
	icon_state = "rock[rand(0,4)]"
	spawn(0)
		MineralSpread()

/turf/simulated/mineral/can_build_cable()
	return !density

/turf/simulated/mineral/is_plating()
	return 1

/turf/simulated/mineral/ex_act(severity)
	switch(severity)
		if(1.0)
			mined_ore = 5 //light bomb, were not lossing much ore
			GetDrilled()
		if(2.0)
			mined_ore = 4 //Heavyer bomb, we lose some ore in this
			GetDrilled()
		if(3.0)
			mined_ore = 3 //Heavy bomb, we lose quite a bit of ore
			GetDrilled()

/turf/simulated/mineral/bullet_act(var/obj/item/projectile/Proj)

	// Emitter blasts
	if (!(Proj.testing))
		if(istype(Proj, /obj/item/projectile/beam/emitter))
			emitter_blasts_taken++

			if(emitter_blasts_taken > 1) // 2 blasts per tile
				mined_ore = 4 //Were blasting away rock with high power lasers this takes quite a bit of time to set up and power.
				GetDrilled()

/turf/simulated/mineral/Bumped(AM)
	. = ..()
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if(istype(H.l_hand,/obj/item))
			var/obj/item/I = H.l_hand
			if((QUALITY_DIGGING in I.tool_qualities) && (!H.hand))
				attackby(I,H)
		if(istype(H.r_hand,/obj/item))
			var/obj/item/I = H.r_hand
			if((QUALITY_DIGGING in I.tool_qualities) && (H.hand))
				attackby(I,H)

	else if(isrobot(AM))
		var/mob/living/silicon/robot/R = AM
		if(istype(R.module_active,/obj/item))
			var/obj/item/I = R.module_active
			if(QUALITY_DIGGING in I.tool_qualities)
				attackby(I,R)

	else if(istype(AM,/obj/mecha))
		var/obj/mecha/M = AM
		if(istype(M.selected,/obj/item/mecha_parts/mecha_equipment/tool/drill))
			M.selected.action(src)

/turf/simulated/mineral/proc/MineralSpread()
	if(mineral && mineral.spread)
		for(var/trydir in cardinal)
			if(prob(mineral.spread_chance))
				var/turf/simulated/mineral/target_turf = get_step(src, trydir)
				if(istype(target_turf) && !target_turf.mineral)
					target_turf.mineral = mineral
					target_turf.UpdateMineral()
					target_turf.MineralSpread()


/turf/simulated/mineral/proc/UpdateMineral()
	clear_ore_effects()
	if(!mineral)
		name = "\improper Rock"
		icon_state = "rock"
		return
	name = "\improper [mineral.display_name] deposit"
	new /obj/effect/mineral(src, mineral)

//Not even going to touch this pile of spaghetti
/turf/simulated/mineral/attackby(obj/item/I, mob/living/user)

	var/tool_type = I.get_tool_type(user, list(QUALITY_DIGGING, QUALITY_EXCAVATION), src, CB = CALLBACK(src,PROC_REF(check_radial_dig)))
	switch(tool_type)

		if(QUALITY_EXCAVATION)
			var/excavation_amount = input("How deep are you going to dig?", "Excavation depth", 0)
			if(excavation_amount)
				to_chat(user, SPAN_NOTICE("You start exacavating [src]."))
				if(I.use_tool(user, src, WORKTIME_SLOW, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_COG))
					to_chat(user, SPAN_NOTICE("You finish exacavating [src]."))
					if(finds && finds.len)
						var/datum/find/F = finds[1]
						if(round(excavation_level + excavation_amount) == F.excavation_required)
							//Chance to extract any items here perfectly, otherwise just pull them out along with the rock surrounding them
							if(excavation_level + excavation_amount > F.excavation_required)
								//if you can get slightly over, perfect extraction
								excavate_find(100, F)
							else
								excavate_find(80, F)

						else if(excavation_level + excavation_amount > F.excavation_required - F.clearance_range)
							//just pull the surrounding rock out
							excavate_find(0, F)

					if(excavation_level + excavation_amount >= 100 )
						//if players have been excavating this turf, leave some rocky debris behind
						var/obj/structure/boulder/B
						if(artifact_find)
							if( excavation_level > 0 || prob(15) )
								//boulder with an artifact inside
								B = new(src)
								if(artifact_find)
									B.artifact_find = artifact_find
							else
								artifact_debris(1)
						else if(prob(15))
							//empty boulder
							B = new(src)

						if(B)
							GetDrilled(0)
						else
							GetDrilled(1)
						return

					excavation_level += excavation_amount

					//archaeo over-lays
					if(!archaeo_overlay && finds && finds.len)
						var/datum/find/F = finds[1]
						if(F.excavation_required <= excavation_level + F.view_range)
							archaeo_overlay = "overlay_archaeo[rand(1,3)]"
							add_overlay(archaeo_overlay)

					//there's got to be a better way to do this
					var/update_excav_overlay = 0
					if(excavation_level >= 75)
						if(excavation_level - excavation_amount < 75)
							update_excav_overlay = 1
					else if(excavation_level >= 50)
						if(excavation_level - excavation_amount < 50)
							update_excav_overlay = 1
					else if(excavation_level >= 25)
						if(excavation_level - excavation_amount < 25)
							update_excav_overlay = 1

					//update over-lays displaying excavation level
					if( !(excav_overlay && excavation_level > 0) || update_excav_overlay )
						var/excav_quadrant = round(excavation_level / 25) + 1
						excav_overlay = "overlay_excv[excav_quadrant]_[rand(1,3)]"
						add_overlay(excav_overlay)

					//drop some rocks
					next_rock += excavation_amount * 10
					while(next_rock > 100)
						next_rock -= 100
						new /obj/item/stack/ore(src)
				return
			return

		if(QUALITY_DIGGING)
			var/fail_message
			if(finds && finds.len)
				//Chance to destroy / extract any finds here
				fail_message = ". <b>[pick("There is a crunching noise [I] collides with some different rock.","Part of the rock face crumbles away.","Something breaks under [I].")]</b>"
			to_chat(user, SPAN_NOTICE("You start digging the [src]. [fail_message ? fail_message : ""]"))
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_ROB))
				var/dig_bonus = round(I.tool_qualities[QUALITY_DIGGING] / 5) / 5 //7 for normal pickaxes, 8 for drills, 9 for jackhammers, 10 for diamonddrills and GP pickaxes, 12 for GP drills, 15 for GP jackhammers- leading to ~1.2
				to_chat(user, SPAN_NOTICE("You finish digging the [src]."))
				if(fail_message && prob(90))
					if(prob(25))
						excavate_find(5, finds[1])
					else if(prob(50))
						finds.Remove(finds[1])
						if(prob(50))
							artifact_debris()
				var/obj/structure/boulder/B
				if(excavation_level)
					//if players have been excavating this turf, leave some rocky debris behind
					if(artifact_find)
						if( excavation_level > 0 || prob(15) )
							//boulder with an artifact inside
							B = new(src)
							if(artifact_find)
								B.artifact_find = artifact_find
						else
							artifact_debris(1)
					else if(prob(15))
						//empty boulder
						B = new(src)
				if(mineral) //This entire segment can be done better.
					var/mineral_result = CEILING((mineral.result_amount * dig_bonus) - (mined_ore * dig_bonus), 1)
					if(isliving(user))
						var/mob/living/digger = user
						var/task_level = digger.learnt_tasks.get_task_mastery_level("SLAB_CLEARER")
						if(task_level)
							mineral_result += task_level

					var/obj/structure/ore_box/box = istype(user.pulling, /obj/structure/ore_box) ? user.pulling : FALSE
					var/obj/item/stack/ore/O = DropMineral(mineral_result)
					if(box && O)
						O.forceMove(box)
					else if(istype(user.get_inactive_hand(), /obj/item/storage/bag/ore))
						var/obj/item/storage/bag/ore/bag = user.get_inactive_hand()
						if(bag.can_be_inserted(O, TRUE))
							bag.handle_item_insertion(O, suppress_warning = TRUE)
				if(B)
					GetDrilled(0, FALSE)
				else
					GetDrilled(1, FALSE)
				return
			return

		if(ABORT_CHECK)
			return

	if (istype(I, /obj/item/device/core_sampler))
		geologic_data.UpdateNearbyArtifactInfo(src)
		var/obj/item/device/core_sampler/C = I
		C.sample_item(src, user)
		return

	if (istype(I, /obj/item/device/depth_scanner))
		var/obj/item/device/depth_scanner/C = I
		C.scan_atom(user, src)
		return

	if (istype(I, /obj/item/device/measuring_tape))
		var/obj/item/device/measuring_tape/P = I
		user.visible_message(SPAN_NOTICE("\The [user] extends [P] towards [src]."),SPAN_NOTICE("You extend [P] towards [src]."))
		if(do_after(user,25, src))
			to_chat(user, SPAN_NOTICE("\icon[P] [src] has been excavated to a depth of [2*excavation_level]cm."))
		return

	else
		return ..()

/turf/simulated/mineral/proc/clear_ore_effects()
	for(var/obj/effect/mineral/M in contents)
		qdel(M)

/turf/simulated/mineral/proc/DropMineral(mineralamount = 1)
	if(!mineral)
		return

	clear_ore_effects()
	var/obj/item/stack/ore/O = new mineral.ore(src)
	O.amount = mineralamount
	return O

/turf/simulated/mineral/proc/GetDrilled(var/artifact_fail = 0, give_minerals = TRUE)
	//var/destroyed = 0 //used for breaking strange rocks
	if (mineral && mineral.result_amount && give_minerals)

		//if the turf has already been excavated, some of it's ore has been removed
		DropMineral(mineral.result_amount - mined_ore)

	//destroyed artifacts have weird, unpleasant effects
	//make sure to destroy them before changing the turf though
	if(artifact_find && artifact_fail)
		var/pain = 0
		if(prob(50))
			pain = 1
		for(var/mob/living/M in range(src, 200))
			to_chat(M, "<font color='red'><b>[pick("A high pitched [pick("keening","wailing","whistle")]","A rumbling noise like [pick("thunder","heavy machinery")]")] somehow penetrates your mind before fading away!</b></font>")
			if(pain)
				if (M.HUDtech.Find("pain"))
					flick("pain",M.HUDtech["pain"])
				if(prob(50))
					M.adjustBruteLoss(5)
			else
				M.flash(10, TRUE, TRUE , TRUE, 10)
			M.apply_effect(25, IRRADIATE)

	//Add some rubble,  you did just clear out a big chunk of rock.

	var/turf/simulated/floor/asteroid/N = ChangeTurf(mined_turf)

	if(istype(N))
		N.overlay_detail = "asteroid[rand(0,9)]"
		N.updateMineralOverlays(1)

/turf/simulated/mineral/proc/excavate_find(var/prob_clean = 0, var/datum/find/F)
	//with skill and luck, players can cleanly extract finds
	//otherwise, they come out inside a chunk of rock
	var/obj/item/X
	if(prob_clean)
		var/obj/item/archaeological_find/AF = new /obj/item/archaeological_find(src, new_item_type = F.find_type)
		geologic_data.UpdateNearbyArtifactInfo(src)
		X = AF
	else
		var/obj/item/stack/ore/strangerock/SR = new /obj/item/stack/ore/strangerock(src, inside_item_type = F.find_type)
		geologic_data.UpdateNearbyArtifactInfo(src)
		SR.geologic_data = geologic_data
		X = SR

	//some find types delete the /obj/item/archaeological_find and replace it with something else, this handles when that happens
	//yuck
	var/display_name = "something"
	if(!X)
		X = last_find
	if(X)
		display_name = X.name

	//many finds are ancient and thus very delicate - luckily there is a specialised energy suspension field which protects them when they're being extracted
	if(prob(F.prob_delicate))
		var/obj/effect/suspension_field/S = locate() in src
		if(!S || S.field_type != get_responsive_reagent(F.find_type))
			if(X)
				visible_message("\red<b>[pick("[display_name] crumbles away into dust","[display_name] breaks apart")].</b>")
				qdel(X)

	finds.Remove(F)


/turf/simulated/mineral/proc/artifact_debris(var/severity = 0)
	//cael's patented random limited drop componentized loot system!
	//sky's patented not-fucking-retarded overhaul!

	//Give a random amount of loot from 1 to 3 or 5, varying on severity.
	for(var/j in 1 to rand(1, 3 + max(min(severity, 1), 0) * 2))
		switch(rand(1,7))
			if(1)
				var/obj/item/stack/rods/R = new(src)
				R.amount = rand(5,25)

			if(2)
				var/obj/item/stack/material/plasteel/R = new(src)
				R.amount = rand(5,25)

			if(3)
				var/obj/item/stack/material/steel/R = new(src)
				R.amount = rand(5,25)

			if(4)
				var/obj/item/stack/material/plasteel/R = new(src)
				R.amount = rand(5,25)

			if(5)
				var/quantity = rand(1,3)
				for(var/i=0, i<quantity, i++)
					new /obj/item/material/shard(src)

			if(6)
				var/quantity = rand(1,3)
				for(var/i=0, i<quantity, i++)
					new /obj/item/material/shard/plasma(src)

			if(7)
				var/obj/item/stack/material/uranium/R = new(src)
				R.amount = rand(5,25)

/turf/simulated/mineral/random
	name = "Mineral deposit"
	var/mineralSpawnChanceList = list(ORE_URANIUM = 5, ORE_PLATINUM = 5, ORE_IRON = 35, ORE_CARBON = 35, ORE_DIAMOND = 1, ORE_GOLD = 5, ORE_SILVER = 5, ORE_PLASMA = 10, ORE_HYDROGEN = 1)
	var/mineralChance = 100 //10 //means 10% chance of this plot changing to a mineral deposit

/turf/simulated/mineral/random/New()
	if (prob(mineralChance) && !mineral)
		var/mineral_name = pickweight(mineralSpawnChanceList) //temp mineral name
		mineral_name = lowertext(mineral_name)
		if (mineral_name && (mineral_name in ore_data))
			mineral = ore_data[mineral_name]
			UpdateMineral()

	. = ..()

/turf/simulated/mineral/proc/check_radial_dig()
	return TRUE

/turf/simulated/mineral/random/high_chance
	mineralChance = 100 //25
	mineralSpawnChanceList = list(ORE_URANIUM = 10, ORE_PLATINUM = 10, ORE_IRON = 20, ORE_CARBON = 20, ORE_DIAMOND = 2, ORE_GOLD = 10, ORE_SILVER = 10, ORE_PLASMA = 20, ORE_HYDROGEN = 1)

/********************** Planet **************************/

/turf/simulated/mineral/planet
	mined_turf = /turf/simulated/floor/asteroid/dirt

/**********************Asteroid**************************/

// Setting icon/icon_state initially will use these values when the turf is built on/replaced.
// This means you can put grass on the asteroid etc.
/turf/simulated/floor/asteroid
	name = "sand"
	icon = 'icons/turf/flooring/asteroid.dmi'
	icon_state = "asteroid"

	initial_flooring = /decl/flooring/asteroid
	oxygen = MOLES_O2STANDARD
	nitrogen = MOLES_N2STANDARD
	temperature = T20C
	var/dug = 0       //0 = has not yet been dug, 1 = has already been dug
	var/overlay_detail
	has_resources = 1

/turf/simulated/floor/asteroid/New()
	..()
	icon_state = "asteroid[rand(0,2)]"
	if(prob(20))
		overlay_detail = "asteroid[rand(0,8)]"
		updateMineralOverlays(1)

/turf/simulated/floor/asteroid/ex_act(severity)
	switch(severity)
		if(3.0)
			return
		if(2.0)
			if (prob(70))
				gets_dug()
		if(1.0)
			gets_dug()
	return

/turf/simulated/floor/asteroid/is_plating()
	return !density

/turf/simulated/floor/asteroid/attackby(obj/item/I, mob/user)

	if(QUALITY_DIGGING in I.tool_qualities)
		if (dug)
			to_chat(user, SPAN_WARNING("This area has already been dug"))
			return
		if(I.use_tool(user, src, WORKTIME_NORMAL, QUALITY_DIGGING, FAILCHANCE_EASY, required_stat = STAT_ROB))
			to_chat(user, SPAN_NOTICE("You dug a hole."))
			gets_dug(user)

	else
		..(I,user)

/turf/simulated/floor/asteroid/proc/gets_dug(mob/user)

	if(dug)
		return

	var/task_level = 0
	if(isliving(user))
		var/mob/living/digger = user
		task_level = digger.learnt_tasks.get_task_mastery_level("SLAB_CLEARER")
		if(!task_level)
			task_level = 0


	var/obj/item/stack/ore/newsand = new /obj/item/stack/ore/glass(src)
	newsand.amount = rand(3)+2 + task_level
	newsand = new /obj/item/stack/ore(src)
	newsand.amount = rand(3)+2 + task_level

	dug = TRUE
	desc = "A hole has been dug here." //so we can tell from looking
	//icon_state = "asteroid_dug"
	return

/turf/simulated/floor/asteroid/proc/updateMineralOverlays(var/update_neighbors)

	cut_overlays()

	var/list/step_overlays = list("n" = NORTH, "s" = SOUTH, "e" = EAST, "w" = WEST)
	for(var/direction in step_overlays)

		if(istype(get_step(src, step_overlays[direction]), /turf/space))
			add_overlay(image('icons/turf/flooring/asteroid.dmi', "asteroid_edges", dir = step_overlays[direction]))

	//todo cache
	if(overlay_detail) add_overlay(image(icon = 'icons/turf/flooring/decals.dmi', icon_state = overlay_detail))

	if(update_neighbors)
		var/list/all_step_directions = list(NORTH,NORTHEAST,EAST,SOUTHEAST,SOUTH,SOUTHWEST,WEST,NORTHWEST)
		for(var/direction in all_step_directions)
			var/turf/simulated/floor/asteroid/A
			if(istype(get_step(src, direction), /turf/simulated/floor/asteroid))
				A = get_step(src, direction)
				A.updateMineralOverlays()

/turf/simulated/floor/asteroid/Entered(atom/movable/M as mob|obj)
	..()
	if(isrobot(M))
		var/mob/living/silicon/robot/R = M
		if(R.module)
			if(istype(R.module_state_1,/obj/item/storage/bag/ore))
				attackby(R.module_state_1,R)
			else if(istype(R.module_state_2,/obj/item/storage/bag/ore))
				attackby(R.module_state_2,R)
			else if(istype(R.module_state_3,/obj/item/storage/bag/ore))
				attackby(R.module_state_3,R)
			else
				return

/turf/simulated/floor/asteroid/proc/check_radial_dig()
	return FALSE
