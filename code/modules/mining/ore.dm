/obj/item/stack/ore
	name = "rock"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ore2"
	w_class = ITEM_SIZE_SMALL
	max_amount = 120
	var/crushable = TRUE
	var/material
	var/material_randomly_has = TRUE
	var/sheet_amout = 1 //How many sheets do we give?
	price_tag = 1

/obj/item/stack/ore/get_storage_cost()
	return amount * BASE_STORAGE_COST(w_class)

/obj/item/stack/ore/Initialize()
	..()
	pixel_x = rand(0,16)-8
	pixel_y = rand(0,8)-8
	if(material_randomly_has)
		if(prob(5))
			material = ORE_HYDROGEN
		if(prob(15))
			material = ORE_PLATINUM
		if(prob(10))
			material = ORE_DIAMOND
		if(prob(20))
			material = ORE_GOLD
		if(prob(15))
			material = ORE_URANIUM
		if(prob(20))
			material = ORE_SILVER
		if(prob(10))
			material = ORE_PLASMA
		if(prob(40))
			material = ORE_CARBON
		if(prob(40))
			material = ORE_IRON
		else
			material = ORE_SAND

/obj/item/stack/ore/ex_act(severity)
	return //We allow mining charges to not blow up ores

/obj/item/stack/ore/attackby(obj/item/I, mob/user)
	var/tool_type = I.get_tool_type(user, list(QUALITY_HAMMERING), src)
	if(tool_type==QUALITY_HAMMERING)
		to_chat(user, SPAN_NOTICE("Crushing the rocks, turning them to sand..."))
		if(I.use_tool(user, src, WORKTIME_QUICK, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/item/stack/ore/glass(get_turf(src))
			if(prob(50))
				new /obj/random/material_ore_small(get_turf(src))
			to_chat(user, SPAN_NOTICE("You crush the rocks into dust! Well sand..."))
			qdel(src)
			return
		return
	else
		..()

/obj/item/stack/ore/Crossed(atom/movable/AM) //TGCode for QoL walk over and pick up ore! Adjusted for Eris code in variety of places.
	var/obj/item/storage/bag/ore/OB
	var/turf/simulated/floor/F = get_turf(src)
	if(loc != F)
		return ..()
	if(istype(AM, /obj/structure/ore_box))
		forceMove(AM)
		return
	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		for(var/thing in H.get_body_slots())
			if(istype(thing, /obj/item/storage/bag/ore))
				OB = thing
				break
	else if(isrobot(AM))
		var/mob/living/silicon/robot/R = AM
		for(var/thing in R.get_all_slots())
			if(istype(thing, /obj/item/storage/bag/ore))
				OB = thing
				break
	if(OB && istype(F, /turf/simulated/floor/asteroid))
		OB.collectItems(F, AM)	//Attackby wouldn't work here to pick up the ore from the turf when I did it originally. Using collect items instead.
	return ..()

/obj/item/stack/ore/uranium
	name = "pitchblende"
	icon_state = "ore_uranium"
	origin_tech = list(TECH_MATERIAL = 5)
	material = ORE_URANIUM
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 3

/obj/item/stack/ore/uranium/small
	name = "pitchblende shard"
	material = MATERIAL_URANIUM
	sheet_amout = 0.5

/obj/item/stack/ore/iron
	name = "hematite"
	icon_state = "ore_iron"
	origin_tech = list(TECH_MATERIAL = 1)
	material = ORE_IRON
	crushable = FALSE
	material_randomly_has = FALSE

/obj/item/stack/ore/iron/small
	name = "hematite nugget"
	sheet_amout = 0.5

/obj/item/stack/ore/coal
	name = "raw carbon"
	icon_state = "ore_coal"
	origin_tech = list(TECH_MATERIAL = 1)
	material = ORE_CARBON
	crushable = FALSE
	material_randomly_has = FALSE

/obj/item/stack/ore/coal/small
	name = "raw carbon chunk"
	sheet_amout = 0.5

/obj/item/stack/ore/glass
	name = "sand"
	icon_state = ORE_SAND
	origin_tech = list(TECH_MATERIAL = 1)
	material = ORE_SAND
	slot_flags = SLOT_HOLSTER
	crushable = FALSE
	material_randomly_has = FALSE

// POCKET SAND!
/obj/item/stack/ore/glass/throw_impact(atom/hit_atom)
	..()
	var/mob/living/carbon/human/H = hit_atom
	if(istype(H) && H.has_eyes() && prob(85))
		to_chat(H, SPAN_DANGER("Some of \the [src] gets in your eyes!"))
		H.eye_blind += 5
		H.eye_blurry += 10
		spawn(1)
			if(istype(loc, /turf/)) qdel(src)


/obj/item/stack/ore/plasma
	name = "plasma crystals"
	icon_state = "ore_plasma"
	origin_tech = list(TECH_MATERIAL = 2)
	material = ORE_PLASMA
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 5

/obj/item/stack/ore/plasma/small
	name = "plasma crystal"
	sheet_amout = 0.5

/obj/item/stack/ore/silver
	name = "native silver ore"
	icon_state = "ore_silver"
	origin_tech = list(TECH_MATERIAL = 3)
	material = ORE_SILVER
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 2

/obj/item/stack/ore/silver/small
	name = "native silver nugget"
	sheet_amout = 0.5

/obj/item/stack/ore/gold
	name = "native gold ore"
	icon_state = "ore_gold"
	origin_tech = list(TECH_MATERIAL = 4)
	material = ORE_GOLD
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 6

/obj/item/stack/ore/gold/small
	name = "native gold nugget"
	sheet_amout = 0.5

/obj/item/stack/ore/diamond
	name = "diamonds"
	icon_state = "ore_diamond"
	origin_tech = list(TECH_MATERIAL = 6)
	material = ORE_DIAMOND
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 7

/obj/item/stack/ore/diamond/small
	name = "diamond dust"
	sheet_amout = 0.5

/obj/item/stack/ore/osmium
	name = "raw platinum"
	icon_state = "ore_platinum"
	material = ORE_PLATINUM
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 9

/obj/item/stack/ore/osmium/small
	name = "raw platinum shard"
	sheet_amout = 0.5

/obj/item/stack/ore/hydrogen
	name = "raw hydrogen"
	icon_state = "ore_hydrogen"
	material = ORE_HYDROGEN
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 10

/obj/item/stack/ore/hydrogen/small
	name = "raw hydrogen nugget" //Its a nugget?
	sheet_amout = 0.5

/obj/item/stack/ore/slag
	name = "Slag"
	desc = "Someone screwed up..."
	icon_state = "slag"
	material = null
	price_tag = 0
