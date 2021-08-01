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
		if(prob(25))
			needs_to_be_pest_b_goned = TRUE
		if(prob(25))
			needs_to_be_watered = TRUE
		if(prob(10))
			remove_dead_weeds = TRUE
		if(prob(10))
			remove_dead_pets = TRUE

/obj/structure/flora/examine(mob/user)
	..()
	if(needs_to_maintain)
		to_chat(user, "<span class='info'>This plant needs to be maintained a bit form time to time.</span>")
	if(needs_to_be_deweeded)
		to_chat(user, "<span class='info'>Other plants seem to have infected this plant.</span>")
	if(needs_to_be_pest_b_goned)
		to_chat(user, "<span class='info'>Small harmfull pests can be seen on the plant and in its pot.</span>")
	if(needs_to_be_watered)
		to_chat(user, "<span class='info'>This plant looks rather dry and seems to need some LSS Plant Mineral Water.</span>")
	if(remove_dead_weeds)
		to_chat(user, "<span class='info'>This plant has some dead other plants inside it.</span>")
	if(remove_dead_pets)
		to_chat(user, "<span class='info'>This plant has some dead bugs inside, gross.</span>")

/obj/structure/flora/attackby(obj/item/I, mob/user)
	..()
	if(needs_to_be_deweeded)
		if(istype(I, /obj/item/plantspray/weeds) || istype(I, /obj/item/weedkiller))
			to_chat(user, "<span class='info'>The invasive other plants wilt away.</span>")
			needs_to_be_deweeded = FALSE
			remove_dead_weeds = TRUE
			return
		if(istype(I, /obj/item/tool/minihoe))
			to_chat(user, "<span class='info'>You remove the invasive plants.</span>")
			needs_to_be_deweeded = FALSE
			return
	if(remove_dead_weeds)
		if(istype(I, /obj/item/tool/minihoe)  || istype(I, /obj/item/tool/scythe))
			to_chat(user, "<span class='info'>The dead plants are no more.</span>")
			remove_dead_weeds = FALSE
			return
	if(needs_to_be_pest_b_goned)
		if(istype(I, /obj/item/plantspray))
			to_chat(user, "<span class='info'>The harmful pests slowly die out.</span>")
			needs_to_be_pest_b_goned = FALSE
			remove_dead_pets = TRUE
			return
	if(remove_dead_pets)
		if(istype(I, /obj/item/tool/shovel))
			to_chat(user, "<span class='info'>The harmful pests slowly die out.</span>")
			remove_dead_pets = FALSE
			return
	if(remove_dead_pets)
		if(istype(I, /obj/item/plantspray/water))
			to_chat(user, "<span class='info'>The water rejuvenates the plants.</span>")
			remove_dead_pets = FALSE
			return

//trees
/obj/structure/flora/tree
	name = "tree"
	anchored = 1
	density = 1
	pixel_x = -16
	layer = ABOVE_MOB_LAYER
	mouse_opacity = MOUSE_OPACITY_ICON

/obj/structure/flora/tree/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_SAWING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_SAWING)
		to_chat(user, SPAN_NOTICE("You start to cut the tree, felling it and turning it into planks..."))
		if(I.use_tool(user, src, WORKTIME_SLOW, tool_type, FAILCHANCE_NORMAL, required_stat = STAT_MEC))
			playsound(loc, 'sound/items/tree_fall.ogg', 80, 1)
			new /obj/item/stack/material/wood(get_turf(src), 1 ? 10 : 2)
			to_chat(user, SPAN_NOTICE("You cut down a tree."))
			qdel(src)
			return
		return

/obj/structure/flora/tree/pine
	name = "pine tree"
	icon = 'icons/obj/flora/pinetrees.dmi'
	icon_state = "pine_1"

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

/obj/structure/flora/tree/dead/New()
	..()
	icon_state = "tree_[rand(1, 6)]"

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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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

/obj/structure/flora/pottedplant
	name = "potted plant"
	icon = 'icons/obj/plants.dmi'
	icon_state = "plant-26"
	layer = PROJECTILE_HIT_THRESHHOLD_LAYER
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant
	name = "potted plant"
	desc = "Really brings the room together."
	icon = 'icons/obj/plants.dmi'
	icon_state = "plant-01"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/large
	name = "large potted plant"
	desc = "This is a large plant. Three branches support pairs of waxy leaves."
	icon_state = "plant-26"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/fern
	name = "potted fern"
	desc = "This is an ordinary looking fern."
	icon_state = "plant-02"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/overgrown
	name = "overgrown potted plants"
	desc = "This is an assortment of colorful plants. Some parts are overgrown."
	icon_state = "plant-03"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/bamboo
	name = "potted bamboo"
	desc = "These are bamboo shoots. The tops looks like they've been cut short."
	icon_state = "plant-04"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/largebush
	name = "large potted bush"
	desc = "This is a large bush. The leaves stick upwards in an odd fashion."
	icon_state = "plant-05"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/thinbush
	name = "thin potted bush"
	desc = "This is a thin bush. It appears to be flowering."
	icon_state = "plant-06"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/mysterious
	name = "mysterious potted bulbs"
	desc = "This is a mysterious looking plant. Touching the bulbs cause them to shrink."
	icon_state = "plant-07"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/smalltree
	name = "small potted tree"
	desc = "This is a small tree. It is rather pleasant."
	icon_state = "plant-08"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/unusual
	name = "unusual potted plant"
	desc = "This is an unusual plant. Its bulbous ends emit a soft blue light."
	icon_state = "plant-09"
	light_range = 2
	light_power = 0.6
	light_color = "#33CCFF"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/orientaltree
	name = "potted oriental tree"
	desc = "This is a rather oriental style tree. Its flowers are bright pink."
	icon_state = "plant-10"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/smallcactus
	name = "small potted cactus"
	desc = "This is a small cactus. Its needles are sharp."
	icon_state = "plant-11"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/tall
	name = "tall potted plant"
	desc = "This is a tall plant. Tiny pores line its surface."
	icon_state = "plant-12"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/sticky
	name = "sticky potted plant"
	desc = "This is an odd plant. Its sticky leaves trap insects."
	icon_state = "plant-13"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/smelly
	name = "smelly potted plant"
	desc = "This is some kind of tropical plant. It reeks of rotten eggs."
	icon_state = "plant-14"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/small
	name = "small potted plant"
	desc = "This is a pot of assorted small flora. Some look familiar."
	icon_state = "plant-15"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/aquatic
	name = "aquatic potted plant"
	desc = "This is apparently an aquatic plant. It's probably fake."
	icon_state = "plant-16"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/shoot
	name = "small potted shoot"
	desc = "This is a small shoot. It still needs time to grow."
	icon_state = "plant-17"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/flower
	name = "potted flower"
	desc = "This is a slim plant. Sweet smelling flowers are supported by spindly stems."
	icon_state = "plant-18"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/crystal
	name = "crystalline potted plant"
	desc = "These are rather cubic plants. Odd crystal formations grow on the end."
	icon_state = "plant-19"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/subterranean
	name = "subterranean potted plant"
	desc = "This is a subterranean plant. Its bulbous ends glow faintly."
	icon_state = "plant-20"
	light_range = 2
	light_power = 0.6
	light_color = "#FF6633"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/minitree
	name = "potted tree"
	desc = "This is a miniature tree. Apparently it was grown to 1/5 scale."
	icon_state = "plant-21"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/stoutbush
	name = "stout potted bush"
	desc = "This is a stout bush. Its leaves point up and outwards."
	icon_state = "plant-22"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/drooping
	name = "drooping potted plant"
	desc = "This is a small plant. The drooping leaves make it look like it's wilted."
	icon_state = "plant-23"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/tropical
	name = "tropical potted plant"
	desc = "This is some kind of tropical plant. It hasn't begun to flower yet."
	icon_state = "plant-24"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/dead
	name = "dead potted plant"
	desc = "This is the dried up remains of a dead plant. Someone should replace it."
	icon_state = "plant-25"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/bamboo
	name = "potted bamboo shoots plant"
	desc = "A small patch of bamboo shoots. Perfect for sipping tea by."
	icon_state = "plant-27"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/bamboo_red
	name = "potted red bamboo shoots plant"
	desc = "A small patch of red bamboo shoots. Perfect for sipping red tea by."
	icon_state = "plant-28"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/redshoot
	name = "potted red shoot plant"
	desc = "A meak and red vine plant that grows bright yellow pettles."
	icon_state = "plant-29"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/rotwood
	name = "potted iron rot tree"
	desc = "A mini red rot tree typically grown in high iron deposits."
	icon_state = "plant-30"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/rotwood_green
	name = "potted copper rot tree"
	desc = "A mini green rot tree typically grown in high copper deposits well it would normally be a copper colour it leaches only off the oxygenation."
	icon_state = "plant-31"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/rotwood_blue
	name = "potted copper rot tree" //same as a normal copper rot but different!
	desc = "A mini azurite rot tree typically grown in high copper deposits being a rare and unique as it only grows in azurite deposet."
	icon_state = "plant-32"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/bush_buds
	name = "potted bush bud grove tree"
	desc = "A round bush that produces large bulbs of silky peddles this ones a deep blue."
	icon_state = "plant-33"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/bush_buds_yellow
	name = "potted yellow bush bud grove tree"
	desc = "A round bush that produces large bulbs of silky peddles this ones a mellow yellow do to lack of propper lighting in its natural habitat."
	icon_state = "plant-34"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/grave_poppers
	name = "potted grave poppers"
	desc = "A large grave popper plant that tend to grow over graves and other battle fields. This one is a mix of red and blue in its pettles."
	icon_state = "plant-35"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/bush_buds_red
	name = "potted ruby bush bud grove tree"
	desc = "A round bush that produces large bulbs of silky peddles this ones a ruby red reflecting on its green base."
	icon_state = "plant-36"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/grave_poppers_blue
	name = "potted blue grave poppers"
	desc = "A large grave popper plant that tend to grow over graves and other battle fields. This one is a light blue in its pettles."
	icon_state = "plant-37"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/grave_poppers_red
	name = "potted red grave poppers"
	desc = "A large grave popper plant that tend to grow over graves and other battle fields. This one is a deep red in its pettles."
	icon_state = "plant-38"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/barrel_cactus
	name = "potted barrel cactus"
	desc = "Small and subby barrel cactus requiring little to not maintains."
	icon_state = "plant-39"
	needs_to_maintain = FALSE

/obj/structure/flora/pottedplant/clockcult
	name = "crafted tesla bolb plant"
	desc = "Handmade of brass and life like bulb plant pettles it runs on an intenal cell that makes a ticking sound?"
	icon_state = "plant-40"
	light_range = 2
	light_power = 0.6
	light_color = "#B5A642" //Brass-y
	needs_to_maintain = FALSE

/obj/structure/flora/pottedplant/bush_ball
	name = "potted bush ball"
	desc = "Mini bush trimmed to be in a ball for a generic plant to have in a office setting."
	icon_state = "plant-41"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/bush_tall
	name = "potted bush piller"
	desc = "Mini bush trimmed to be in a piller for a generic plant to have in a office setting."
	icon_state = "plant-42"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/bush_bullet
	name = "potted bush cone"
	desc = "Mini bush trimmed to be in a cone for a generic plant to have in a office setting."
	icon_state = "plant-43"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/star_root
	name = "potted star root vine"
	desc = "A rare star root that grows with a blue tint."
	icon_state = "plant-44"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/water_root
	name = "potted water root vine"
	desc = "A rather Sol looking water root vine that tends to be able to grow in any climet..."
	icon_state = "plant-45"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/decorative
	name = "decorative potted plant"
	desc = "This is a decorative shrub. It's been trimmed into the shape of an apple."
	icon_state = "applebush"
	needs_to_maintain = TRUE

/obj/structure/flora/pottedplant/xmas
	name = "small christmas tree"
	desc = "This is a tiny well lit decorative christmas tree."
	icon_state = "plant-xmas"
	needs_to_maintain = TRUE

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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/stack/material/wood(get_turf(src), 1 ? 1 : 2)
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Even got some scrap wood out of it too!"))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/flower/harebells/wild(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/flower/sunflower/wild(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/flower/poppy/wild(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Got a flower out of it too!"))
			qdel(src)
			return
		return

/obj/structure/flora/ausbushes/fullgrass/New()
	..()
	icon_state = "fullgrass_[rand(1, 3)]"

/obj/structure/flora/tree/sif
	name = "glowing tree"
	desc = "It's a tree, except this one seems quite alien. It glows a deep blue."
	icon = 'icons/obj/flora/deadtrees.dmi'
	icon_state = "tree_sif"

/obj/structure/flora/tree/palm
	icon = 'icons/obj/flora/palmtrees.dmi'
	icon_state = "palm1"

/obj/structure/flora/tree/jungle
	name = "tree"
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant1
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree2"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant2
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree3"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant3
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree4"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant4
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree5"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle/variant5
	icon = 'icons/obj/flora/jungletree.dmi'
	icon_state = "tree6"
	pixel_x = -45
	pixel_y = -16

/obj/structure/flora/tree/jungle_small
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant1
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree2"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant2
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree3"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant3
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree4"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant4
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree5"
	pixel_x = -30
	pixel_y = -16

/obj/structure/flora/tree/jungle_small/variant5
	icon = 'icons/obj/flora/jungletreesmall.dmi'
	icon_state = "tree6"
	pixel_x = -30
	pixel_y = -16

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
			new /obj/item/ore/glass(get_turf(src))
			new /obj/item/ore/glass(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src)) //We get more
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src)) //We get more
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src)) //We get more
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src)) //We get more
			new /obj/item/stack/material/wood(get_turf(src), 1 ? 1 : 2)
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Even got some scrap wood out of it too!"))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src)) //We get more
			new /obj/item/stack/material/wood(get_turf(src), 1 ? 1 : 2)
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Even got some scrap wood out of it too!"))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/stack/material/wood(get_turf(src), 1 ? 2 : 2)
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Even got some scrap wood out of it too!"))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/stack/material/wood(get_turf(src), 1 ? 2 : 2)
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Even got some scrap wood out of it too!"))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/stack/material/wood(get_turf(src), 1 ? 2 : 2)
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Even got some scrap wood out of it too!"))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/stack/material/wood(get_turf(src), 1 ? 2 : 2)
			to_chat(user, SPAN_NOTICE("You harvest some clippings. Even got some scrap wood out of it too!"))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
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
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/big
	name = "big bush"
	layer = ABOVE_MOB_LAYER
	anchored = 1

/obj/structure/flora/small/big/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	var/list/usable_qualities = list(QUALITY_CUTTING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_CUTTING)
		to_chat(user, SPAN_NOTICE("You start to cut the bush away, harvesting some plant clippings..."))
		if(I.use_tool(user, src, WORKTIME_NEAR_INSTANT, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			new /obj/item/reagent_containers/food/snacks/grown/grass/cuttings(get_turf(src))
			to_chat(user, SPAN_NOTICE("You harvest some clippings."))
			qdel(src)
			return
		return

/obj/structure/flora/big/bush1
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush1"

/obj/structure/flora/big/bush2
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush2"

/obj/structure/flora/big/bush3
	icon = 'icons/obj/flora/largejungleflora.dmi'
	icon_state = "bush3"

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
			new /obj/item/ore/glass(get_turf(src))
			new /obj/item/ore/glass(get_turf(src))
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
			new /obj/item/ore/glass(get_turf(src))
			new /obj/item/ore/glass(get_turf(src))
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
			new /obj/item/ore/glass(get_turf(src))
			new /obj/item/ore/glass(get_turf(src))
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
			new /obj/item/ore/glass(get_turf(src))
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

/obj/structure/flora/church_rock/Initialize(mapload) //When its mapped in
	..()
	pixel_x = -45
	pixel_y = null

/obj/structure/flora/church_rock/New() //If an admin spawns it in
	..()
	pixel_x = -45
	pixel_y = null

/obj/structure/flora/church_tree //fancy red tree
	name = "Cherry Tree"
	icon = 'icons/obj/flora/church_stuff.dmi'
	icon_state = "red_tree_alt"
	desc = "A large hard wood tree with bark like steel, typically used for meditation."
	anchored = TRUE
	density = FALSE
	layer = ABOVE_MOB_LAYER
	mouse_opacity = MOUSE_OPACITY_ICON
