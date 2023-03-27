/obj/structure/diamond
	name = "Fragment of Amethyn"
	desc = "A once in the galaxy formation of diamond and anomalous materials that took four weeks of painstaking chiseling to remove from its geode prison. \
	This object is so valuable it is literally priceless, incapable of being sold on any market due to nobody have the money to buy it. So now Ryan keeps \
	it in the Lonestar vault as an insurance policy."
	icon = 'icons/obj/engine.dmi'
	icon_state = "diamond"
	anchored = 1
	density = 1
	layer = BELOW_OBJ_LAYER
	//Insainly rare materals, tho its impossable to brake down without some adv trickery
	matter = list(MATERIAL_VOXALLOY = 5, MATERIAL_DURASTEEL = 30, MATERIAL_DIAMOND = 30, MATERIAL_TITANIUM = 10, MATERIAL_OSMIUM = 20, MATERIAL_MHYDROGEN = 20, MATERIAL_PLASMAGLASS = 60, MATERIAL_PLASMA = 100)
	price_tag = 0 //We have no buyer
	sanity_damage = 4 //Looks nice!

/obj/structure/diamond/attackby(obj/item/I, mob/user)

	var/tool_type = I.get_tool_type(user, list(QUALITY_BOLT_TURNING), src)
	switch(tool_type)

		if(QUALITY_BOLT_TURNING)
			if(I.use_tool(user, src, WORKTIME_NORMAL, tool_type, FAILCHANCE_VERY_EASY, required_stat = STAT_MEC))
				to_chat(user, SPAN_NOTICE("You [anchored? "un" : ""]secured \the [src]!"))
				anchored = !anchored
			return

		if(ABORT_CHECK)
			return

/obj/structure/diamond/wealthy_shovel
	name = "Gilded Rose Gold Shovel"
	desc = "A rose gold made shovel stuck in a mount of diamonds to flaunt wealth over how LSS was able to corner and then oversaturate the tools market."
	icon = 'icons/obj/statue.dmi'
	icon_state = "weathyshovel"
	matter = list(MATERIAL_DIAMOND = 30, MATERIAL_GOLD = 20)
	price_tag = 200 //as much as tools used to be worth sold...
	sanity_damage = 2 //Looks nice!
