/obj/item/weapon/ore
	name = "rock"
	icon = 'icons/obj/mining.dmi'
	icon_state = "ore2"
	w_class = ITEM_SIZE_SMALL
	var/crushable = TRUE
	var/datum/geosample/geologic_data
	var/material
	var/sheet_amout = 1 //How many sheets do we give?

/obj/item/weapon/ore/attackby(obj/item/I, mob/user)
	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	if(!istype(user.loc, /turf))
		return
<<<<<<< HEAD
=======
	if(!crushable)
		return
>>>>>>> bd60e5effe52c89ef42d197a3a71c5777c28352b
	var/list/usable_qualities = list(QUALITY_HAMMERING)
	var/tool_type = I.get_tool_type(user, usable_qualities, src)
	if(tool_type==QUALITY_HAMMERING)
		to_chat(user, SPAN_NOTICE("Crushing the rocks, turning them to sand..."))
		if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_ZERO, required_stat = STAT_MEC))
			new /obj/item/weapon/ore/glass(get_turf(src))
			if(prob(50))
				new /obj/random/material_ore_small(get_turf(src))
			to_chat(user, SPAN_NOTICE("You crush the rocks into dust! Well sand..."))
			qdel(src)
			return
		return


/obj/item/weapon/ore/uranium
	name = "pitchblende"
	icon_state = "ore_uranium"
	origin_tech = list(TECH_MATERIAL = 5)
	material = MATERIAL_URANIUM
	crushable = FALSE

/obj/item/weapon/ore/uranium/small
	name = "pitchblende shard"
	material = MATERIAL_URANIUM
	sheet_amout = 0.2
	crushable = FALSE

/obj/item/weapon/ore/uranium/small
	name = "pitchblende shard"
	material = MATERIAL_URANIUM
	sheet_amout = 0.2

/obj/item/weapon/ore/iron
	name = "hematite"
	icon_state = "ore_iron"
	origin_tech = list(TECH_MATERIAL = 1)
	material = "hematite"
	crushable = FALSE

/obj/item/weapon/ore/iron/small
	name = "hematite nugget"
	sheet_amout = 0.2
	crushable = FALSE

/obj/item/weapon/ore/iron/small
	name = "hematite nugget"
	sheet_amout = 0.2

/obj/item/weapon/ore/coal
	name = "raw carbon"
	icon_state = "ore_coal"
	origin_tech = list(TECH_MATERIAL = 1)
	material = "carbon"
	crushable = FALSE

/obj/item/weapon/ore/coal/small
	name = "raw carbon chunk"
	sheet_amout = 0.2
	crushable = FALSE

/obj/item/weapon/ore/coal/small
	name = "raw carbon chunk"
	sheet_amout = 0.2

/obj/item/weapon/ore/glass
	name = "sand"
	icon_state = "ore_glass"
	origin_tech = list(TECH_MATERIAL = 1)
	material = "sand"
	slot_flags = SLOT_HOLSTER
	crushable = FALSE

// POCKET SAND!
/obj/item/weapon/ore/glass/throw_impact(atom/hit_atom)
	..()
	var/mob/living/carbon/human/H = hit_atom
	if(istype(H) && H.has_eyes() && prob(85))
		to_chat(H, SPAN_DANGER("Some of \the [src] gets in your eyes!"))
		H.eye_blind += 5
		H.eye_blurry += 10
		spawn(1)
			if(istype(loc, /turf/)) qdel(src)


/obj/item/weapon/ore/plasma
	name = "plasma crystals"
	icon_state = "ore_plasma"
	origin_tech = list(TECH_MATERIAL = 2)
	material = MATERIAL_PLASMA
	crushable = FALSE

/obj/item/weapon/ore/plasma/small
	name = "plasma crystal"
	sheet_amout = 0.2
	crushable = FALSE

/obj/item/weapon/ore/plasma/small
	name = "plasma crystal"
	sheet_amout = 0.2

/obj/item/weapon/ore/silver
	name = "native silver ore"
	icon_state = "ore_silver"
	origin_tech = list(TECH_MATERIAL = 3)
	material = MATERIAL_SILVER
	crushable = FALSE

/obj/item/weapon/ore/silver/small
	name = "native silver nugget"
	sheet_amout = 0.2
	crushable = FALSE

/obj/item/weapon/ore/silver/small
	name = "native silver nugget"
	sheet_amout = 0.2

/obj/item/weapon/ore/gold
	name = "native gold ore"
	icon_state = "ore_gold"
	origin_tech = list(TECH_MATERIAL = 4)
	material = MATERIAL_GOLD
	crushable = FALSE

/obj/item/weapon/ore/gold/small
	name = "native gold nugget"
	sheet_amout = 0.2
	crushable = FALSE

/obj/item/weapon/ore/gold/small
	name = "native gold nugget"
	sheet_amout = 0.2

/obj/item/weapon/ore/diamond
	name = "diamonds"
	icon_state = "ore_diamond"
	origin_tech = list(TECH_MATERIAL = 6)
	material = MATERIAL_DIAMOND
	crushable = FALSE

/obj/item/weapon/ore/diamond/small
	name = "diamond dust"
	sheet_amout = 0.2
	crushable = FALSE

/obj/item/weapon/ore/diamond/small
	name = "diamond dust"
	sheet_amout = 0.2

/obj/item/weapon/ore/osmium
	name = "raw platinum"
	icon_state = "ore_platinum"
	material = MATERIAL_PLATINUM
	crushable = FALSE

/obj/item/weapon/ore/osmium/small
	name = "raw platinum shard"
	sheet_amout = 0.2
	crushable = FALSE

/obj/item/weapon/ore/osmium/small
	name = "raw platinum shard"
	sheet_amout = 0.2

/obj/item/weapon/ore/hydrogen
	name = "raw hydrogen"
	icon_state = "ore_hydrogen"
	material = MATERIAL_MHYDROGEN
	crushable = FALSE

/obj/item/weapon/ore/hydrogen/small
	name = "raw hydrogen nugget" //Its a nugget?
	sheet_amout = 0.2
	crushable = FALSE

/obj/item/weapon/ore/hydrogen/small
	name = "raw hydrogen nugget" //Its a nugget?
	sheet_amout = 0.2

/obj/item/weapon/ore/slag
	name = "Slag"
	desc = "Someone screwed up..."
	icon_state = "slag"
	material = null

/obj/item/weapon/ore/New()
	pixel_x = rand(0,16)-8
	pixel_y = rand(0,8)-8
	..()

/obj/item/weapon/ore/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/device/core_sampler))
		var/obj/item/device/core_sampler/C = W
		C.sample_item(src, user)
	else
		return ..()
