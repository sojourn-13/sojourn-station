
//trees
/obj/structure/flora/tree
	name = "tree"
	anchored = TRUE
	density = TRUE
	pixel_x = -16
	layer = ABOVE_MOB_LAYER
	mouse_opacity = MOUSE_OPACITY_ICON
	var/stump = TRUE //Do we have a stump when cut down?
	var/shadow = TRUE //Do we have a shadow to drop?
	var/shadow_overlay = "shadow_overlay" //Are shadow underlay, looks nice
	var/stump_type = /obj/structure/flora/stump //What type stump do we have
	var/modular_shadow = TRUE //Are rng picker var, yes or no basiclly
	var/infested = FALSE //Is this tree infested?

/obj/structure/flora/tree/New()
	..()
	if(modular_shadow)
		shadow_overlay = "shadow_overlay[rand(0, 6)]"
	var/image/shadow_overlay_grabber = image(src.icon, src.shadow_overlay, layer = HIDE_LAYER-0.01) //So we dont hide landmines
	underlays.Cut() //I guess we use this?
	underlays += shadow_overlay_grabber
	if(prob(5))
		infested = TRUE
		desc = "An unsettling feeling comes from this tree. Buzzing can be heard."

	//This code is only added to the compiler when 'JANEDEBUG' is defined. We can use it this way this for bugtesting.
	#ifdef JANEDEBUG
	infested = TRUE
	#endif

/obj/structure/flora/stump
	icon = 'icons/obj/flora/jungletree.dmi'
	name = "Tree stump"
	desc = "Once a tall tree, now a small stub in the groumd, without a voice..."
	density = FALSE
	icon_state = "tree_stump"
	pixel_x = -50
	pixel_y = -16

/obj/structure/flora/stump/small
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	desc = "Once a growing tree, now a small stub in the groumd, without a voice..."
	icon_state = "tree_stump"

/obj/structure/flora/stump/small/New()
	..()
	icon_state = "tree_stump[rand(0, 6)]"

/obj/structure/flora/stump/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_SHOVELING, QUALITY_DIGGING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)

	switch(tool_type)
		if(QUALITY_SHOVELING)
			to_chat(user, SPAN_NOTICE("You start to remove the stump."))
			if(I.use_tool(user, src, WORKTIME_SLOW, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_ROB))
				new /obj/plant_spawner/towercaps(get_turf(src))
				to_chat(user, SPAN_NOTICE("You dig up the stump reclaiming a log."))
				qdel(src)
				return
		if(QUALITY_DIGGING)
			to_chat(user, SPAN_NOTICE("You start to remove the stump."))
			if(I.use_tool(user, src, WORKTIME_SLOW, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_ROB))
				new /obj/plant_spawner/towercaps(get_turf(src))
				to_chat(user, SPAN_NOTICE("You dig up the stump reclaiming a log."))
				qdel(src)
				return

/obj/structure/flora/tree/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_SAWING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_SAWING)
		to_chat(user, SPAN_NOTICE("You start to cut the tree, felling it."))
		if(I.use_tool(user, src, WORKTIME_SLOW, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_ROB)) //it's....a tree, you're not just cutting it down but breaking it into useable segments. it's body based, not mec.
			playsound(loc, 'sound/items/tree_fall.ogg', 80, 1)
			new /obj/plant_spawner/towercaps(get_turf(src))
			new /obj/plant_spawner/towercaps(get_turf(src))
			new /obj/plant_spawner/towercaps(get_turf(src))
			new /obj/plant_spawner/towercaps(get_turf(src))
			new /obj/plant_spawner/towercaps(get_turf(src))
			new stump_type(get_turf(src))
			if(infested)
				visible_message(SPAN_DANGER("Wasps stay behind to protect escaping bees!"))
				new /mob/living/carbon/superior_animal/vox/wasp(get_turf(src))
				new /mob/living/carbon/superior_animal/vox/wasp(get_turf(src))
				new /obj/item/honey_frame/frameless(get_turf(src))
				if(prob(30))
					new /mob/living/carbon/superior_animal/vox/wasp(get_turf(src))
					new /obj/item/honey_frame/frameless(get_turf(src))
			to_chat(user, SPAN_NOTICE("You cut down a tree."))
			qdel(src)
			return
		return

/obj/structure/flora/tree/pine
	name = "pine tree"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_1"
	shadow = FALSE

/obj/structure/flora/tree/pine/New()
	..()
	icon_state = "pine_[rand(1, 3)]"

/obj/structure/flora/tree/pine/xmas
	name = "xmas tree"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_c"

/obj/structure/flora/tree/pine/xmas/New()
	..()
	icon_state = "pine_c"

/obj/structure/flora/tree/dead
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "tree_1"
	shadow = FALSE

/obj/structure/flora/tree/dead/New()
	..()
	icon_state = "tree_[rand(1, 6)]"

/obj/structure/flora/tree/sif
	name = "glowing tree"
	desc = "It's a tree, except this one seems quite alien. It glows a deep blue."
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "tree_sif"
	stump = FALSE
	shadow = FALSE

/obj/structure/flora/tree/palm
	icon = 'icons/obj/flora/palmtrees.dmi'
	icon_state = "palm1"
	stump = FALSE
	shadow = FALSE

/obj/structure/flora/tree/jungle
	name = "tree"
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay"
	icon_state = "tree"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/baracade
	name = "fallen tree"
	desc = "A fallen tree, a natural blockage in jungels."
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "cant_get_up"
	pixel_x = -32
	pixel_y = -50
	stump = FALSE
	shadow = FALSE

/obj/structure/flora/tree/jungle/variant1
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay1"
	icon_state = "tree2"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant2
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay2"
	icon_state = "tree3"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant3
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay3"
	icon_state = "tree4"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant4
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay4"
	icon_state = "tree5"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant5
	icon = 'icons/obj/flora/jungletree.dmi'
	shadow_overlay = "shadow_overlay5"
	icon_state = "tree6"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle_small
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay"
	stump_type = /obj/structure/flora/stump/small
	icon_state = "tree"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant1
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay1"
	icon_state = "tree2"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant2
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay2"
	icon_state = "tree3"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant3
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay3"
	icon_state = "tree4"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant4
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay4"
	icon_state = "tree5"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant5
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	shadow_overlay = "shadow_overlay5"
	icon_state = "tree6"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/church_tree //fancy red tree
	name = "Cherry Tree"
	icon = 'icons/obj/flora/church_stuff.dmi'
	icon_state = "red_tree_alt"
	desc = "A large hard wood tree with bark like steel, typically used for meditation."
	anchored = TRUE
	density = FALSE
	layer = ABOVE_MOB_LAYER
	mouse_opacity = MOUSE_OPACITY_ICON

/obj/structure/flora/tree/snow
	icon = 'icons/obj/flora/snowtree.dmi'
	modular_shadow = FALSE

/obj/structure/flora/tree/snow/snow
	name = "tree"
	desc = "A tall tree with a bed of snow over its branches."
	shadow_overlay = "shadow_overlay1"
	icon_state = "tree1"
	pixel_x = -32
	pixel_y = 5

/obj/structure/flora/tree/snow/two
	name = "tree"
	desc = "A thick trunk of a frozen and dead tree."
	shadow_overlay = "shadow_overlay2"
	icon_state = "tree2"
	pixel_x = -25
	pixel_y = 5

/obj/structure/flora/tree/snow/three
	name = "pine tree"
	desc = "A tall green needley tree with layers of snow."
	shadow_overlay = "shadow_overlay3"
	icon_state = "tree3"
	pixel_x = -32
	pixel_y = 5

/obj/structure/flora/tree/snow/four
	name = "pine tree"
	desc = "A short green needley tree with layers of snow."
	shadow_overlay = "shadow_overlay4"
	icon_state = "tree4"
	pixel_x = -35
	pixel_y = 5

/obj/structure/flora/tree/snow/five
	name = "pine tree"
	desc = "A tall green needley tree with a singular blanket of snow."
	shadow_overlay = "shadow_overlay5"
	icon_state = "tree5"
	pixel_x = -32
	pixel_y = 5
