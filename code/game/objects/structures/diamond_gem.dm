/obj/structure/diamond
	name = "Fragment Of Amethyn"
	desc = "A large gemstone made up of both diamond and anomalist materials alike, \
	this prize of mining took 4 weeks to painstakingly chisel and grind out of what was thought to be impassable rock walls, \
	holding many denser materials not yet found. Well it would normally go for a high price and is estimated to be work 4 million credits for even a chunk of it, \
	no one on the Kriosan Confederacy or Syndicate markets have tried to even offer a price and Ryan can't seem to get it off his hands."
	icon = 'icons/obj/engine.dmi'
	icon_state = "diamond"
	anchored = 1
	density = 1
	layer = BELOW_OBJ_LAYER
	//Insainly rare materals, tho its impossable to brake down without some adv trickery
	matter = list(MATERIAL_VOXALLOY = 5, MATERIAL_DURASTEEL = 30, MATERIAL_DIAMOND = 30, MATERIAL_TITANIUM = 10, MATERIAL_OSMIUM = 20, MATERIAL_MHYDROGEN = 20, MATERIAL_PLASMAGLASS = 60, MATERIAL_PLASMA = 100)
	price_tag = 0 //We have no buyer

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
