/obj/item/ore
	name = "rock"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ore2"
	w_class = ITEM_SIZE_SMALL
	var/crushable = TRUE
	var/datum/geosample/geologic_data
	var/material
	var/material_randomly_has = TRUE
	var/sheet_amout = 1 //How many sheets do we give?
	price_tag = 1

/obj/item/ore/New()
	..()
	if(material_randomly_has)
		if(prob(5))
			material = MATERIAL_MHYDROGEN
		if(prob(15))
			material = MATERIAL_PLATINUM
		if(prob(10))
			material = MATERIAL_DIAMOND
		if(prob(20))
			material = MATERIAL_GOLD
		if(prob(15))
			material = MATERIAL_URANIUM
		if(prob(20))
			material = MATERIAL_SILVER
		if(prob(10))
			material = MATERIAL_PLASMA
		if(prob(40))
			material = "carbon"
		if(prob(40))
			material = "hematite"
		else
			material = "sand"

/obj/item/ore/ex_act(severity)
	return //We allow mining charges to not blow up ores

/obj/item/ore/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
	if(!crushable)
		return
	var/list/usable_qualities = list(QUALITY_HAMMERING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_HAMMERING)
		to_chat(user, SPAN_NOTICE("Crushing the rocks, turning them to sand..."))
		if(I.use_tool(user, src, WORKTIME_QUICK, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/item/ore/glass(get_turf(src))
			if(prob(50))
				new /obj/random/material_ore_small(get_turf(src))
			to_chat(user, SPAN_NOTICE("You crush the rocks into dust! Well sand..."))
			qdel(src)
			return
		return

/obj/item/ore/Crossed(atom/movable/AM) //TGCode for QoL walk over and pick up ore! Adjusted for Eris code in variety of places.
	var/obj/item/storage/bag/ore/OB
	var/turf/simulated/floor/F = get_turf(src)
	if(loc != F)
		return ..()
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

/obj/item/ore/uranium
	name = "pitchblende"
	icon_state = "ore_uranium"
	origin_tech = list(TECH_MATERIAL = 5)
	material = MATERIAL_URANIUM
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 3

/obj/item/ore/uranium/small
	name = "pitchblende shard"
	material = MATERIAL_URANIUM
	sheet_amout = 0.5

/obj/item/ore/iron
	name = "hematite"
	icon_state = "ore_iron"
	origin_tech = list(TECH_MATERIAL = 1)
	material = "hematite"
	crushable = FALSE
	material_randomly_has = FALSE

/obj/item/ore/iron/small
	name = "hematite nugget"
	sheet_amout = 0.5

/obj/item/ore/coal
	name = "raw carbon"
	icon_state = "ore_coal"
	origin_tech = list(TECH_MATERIAL = 1)
	material = "carbon"
	crushable = FALSE
	material_randomly_has = FALSE

/obj/item/ore/coal/small
	name = "raw carbon chunk"
	sheet_amout = 0.5

/obj/item/ore/glass
	name = "sand"
	icon_state = "ore_glass"
	origin_tech = list(TECH_MATERIAL = 1)
	material = "sand"
	slot_flags = SLOT_HOLSTER
	crushable = FALSE
	material_randomly_has = FALSE

// POCKET SAND!
/obj/item/ore/glass/throw_impact(atom/hit_atom)
	..()
	var/mob/living/carbon/human/H = hit_atom
	if(istype(H) && H.has_eyes() && prob(85))
		to_chat(H, SPAN_DANGER("Some of \the [src] gets in your eyes!"))
		H.eye_blind += 5
		H.eye_blurry += 10
		spawn(1)
			if(istype(loc, /turf/)) qdel(src)


/obj/item/ore/plasma
	name = "plasma crystals"
	icon_state = "ore_plasma"
	origin_tech = list(TECH_MATERIAL = 2)
	material = MATERIAL_PLASMA
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 5

/obj/item/ore/plasma/small
	name = "plasma crystal"
	sheet_amout = 0.5

/obj/item/ore/silver
	name = "native silver ore"
	icon_state = "ore_silver"
	origin_tech = list(TECH_MATERIAL = 3)
	material = MATERIAL_SILVER
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 2

/obj/item/ore/silver/small
	name = "native silver nugget"
	sheet_amout = 0.5

/obj/item/ore/gold
	name = "native gold ore"
	icon_state = "ore_gold"
	origin_tech = list(TECH_MATERIAL = 4)
	material = MATERIAL_GOLD
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 6

/obj/item/ore/gold/small
	name = "native gold nugget"
	sheet_amout = 0.5

/obj/item/ore/diamond
	name = "diamonds"
	icon_state = "ore_diamond"
	origin_tech = list(TECH_MATERIAL = 6)
	material = MATERIAL_DIAMOND
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 7

/obj/item/ore/diamond/small
	name = "diamond dust"
	sheet_amout = 0.5

/obj/item/ore/osmium
	name = "raw platinum"
	icon_state = "ore_platinum"
	material = MATERIAL_PLATINUM
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 9

/obj/item/ore/osmium/small
	name = "raw platinum shard"
	sheet_amout = 0.5

/obj/item/ore/hydrogen
	name = "raw hydrogen"
	icon_state = "ore_hydrogen"
	material = MATERIAL_MHYDROGEN
	crushable = FALSE
	material_randomly_has = FALSE
	price_tag = 10

/obj/item/ore/hydrogen/small
	name = "raw hydrogen nugget" //Its a nugget?
	sheet_amout = 0.5

/obj/item/ore/slag
	name = "Slag"
	desc = "Someone screwed up..."
	icon_state = "slag"
	material = null
	price_tag = 0

/obj/item/ore/New()
	pixel_x = rand(0,16)-8
	pixel_y = rand(0,8)-8
	..()

/obj/item/ore/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/device/core_sampler))
		var/obj/item/device/core_sampler/C = W
		C.sample_item(src, user)
	else
		return ..()
