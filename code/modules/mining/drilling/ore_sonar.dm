/obj/item/device/ore_sonar
	name = "ore sonar"
	desc = "A solid and robust looking white device made to work in the toughest conditions. It's able to scan and print a readout of the local ore heatmap. It works off an internal battery that takes a very long time to recharge. A droopy eared rabbit shape is stamped onto its side."
	icon_state = "ore-sonar"
	item_state = "ore-sonar"
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_SMALL
	origin_tech = list(TECH_MAGNET = 2, TECH_ENGINEERING = 2)
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_STEEL = 2, MATERIAL_GLASS = 1, MATERIAL_SILVER = 2)
	var/cooldowntime = 0

/obj/item/device/ore_sonar/attack_self(mob/living/carbon/user as mob)
	if(world.time < cooldowntime)
		to_chat(user, SPAN_NOTICE("Device is still recharging. Please allow 20 minutes between each use, babe."))
		return
	cooldowntime = world.time + 20 MINUTES
	to_chat(user, SPAN_NOTICE("Scan Initated. Starting to print out results."))
	var/turf/origin = get_turf(user)
	var/dist_scan_x = world.maxx-TRANSITIONEDGE - origin.x
	var/dist_scan_y = world.maxy-TRANSITIONEDGE - origin.y
	var/icon/mineralmapss = new("icons/480x480.dmi","black")
	mineralmapss.Scale(world.maxx-TRANSITIONEDGE,world.maxy-TRANSITIONEDGE)
	for(var/turf/T in trange(dist_scan_x * dist_scan_y,origin))
		if(T.x >= world.maxx-TRANSITIONEDGE || T.x <= TRANSITIONEDGE)	continue
		if(T.y >= world.maxy-TRANSITIONEDGE || T.y <= TRANSITIONEDGE)	continue
		if(istype(T, /turf/simulated/mineral))
			var/turf/simulated/mineral/TA = T
			//We need to do the coloring here!
			if(istype(TA.mineral, /ore/uranium))
				//addgreen and continue
				mineralmapss.DrawBox(rgb(0,255,0),TA.x,TA.y,TA.x, TA.y)
				continue
			if(istype(TA.mineral, /ore/hematite))
				mineralmapss.DrawBox(rgb(204,102,0),TA.x,TA.y,TA.x, TA.y)
				//addbrown and continue
				continue
			if(istype(TA.mineral, /ore/coal))
				//adddarkgrey and continue
				mineralmapss.DrawBox(rgb(89,89,89),TA.x,TA.y,TA.x, TA.y)
				continue
			if(istype(TA.mineral, /ore/glass))
				mineralmapss.DrawBox(rgb(255,255,153),TA.x,TA.y,TA.x, TA.y)
				continue
				//addyellow and continue
			if(istype(TA.mineral, /ore/plasma))
				mineralmapss.DrawBox(rgb(204,51,255),TA.x,TA.y,TA.x, TA.y)
				continue
				//addpurple and continue
			if(istype(TA.mineral, /ore/silver))
				mineralmapss.DrawBox(rgb(224,224,235),TA.x,TA.y,TA.x, TA.y)
				continue
				//addgrey and continue
			if(istype(TA.mineral, /ore/gold))
				mineralmapss.DrawBox(rgb(255,204,0),TA.x,TA.y,TA.x, TA.y)
				continue
				//addorange and continue
			if(istype(TA.mineral, /ore/diamond))
				mineralmapss.DrawBox(rgb(255,64,142),TA.x,TA.y,TA.x, TA.y)
				continue
				//addblueish and continue
			if(istype(TA.mineral, /ore/platinum))
				mineralmapss.DrawBox(rgb(0,0,255),TA.x,TA.y,TA.x, TA.y)
				continue
				//addgreysih and continue
			if(istype(TA.mineral, /ore/hydrogen))
				mineralmapss.DrawBox(rgb(124,143,90),TA.x,TA.y,TA.x, TA.y)
				continue
				//adddarkishcolor and continue
		if(istype(T, /turf/simulated/floor/asteroid))
			//So we first add on are floor tile colour then re-draw are check for the crystal.
			var/turf/simulated/floor/asteroid/TA = T
			mineralmapss.DrawBox(rgb(255,248,220),TA.x,TA.y,TA.x, TA.y)
			for(var/c in TA.contents)
				var/obj/structure/ameridian_crystal/CA = c
				if(istype(CA, /obj/structure/ameridian_crystal))
					mineralmapss.DrawBox(rgb(0,255,255),CA.x,CA.y,CA.x, CA.y)
			continue
		//Now we add areself
		if(T == origin)
			mineralmapss.DrawBox(rgb(255,0,0),T.x,T.y,T.x, T.y)
			continue
	mineralmapss.Scale((world.maxx-TRANSITIONEDGE )* 6,(world.maxy-TRANSITIONEDGE) * 6)
	sleep(20)
	var/obj/item/paper/G = new(user.loc)
	G.name = "Ore Heatmap"
	G.info = "[icon2html(mineralmapss,world)] <br> Legend:<br> <font color='#00FF00'>Uranium</font> Electric green<br>"
	G.info += "<font color='#CC6600'>Hematite</font> Rusty Orange<br>"
	G.info += "<font color='#595959'>Coal</font> Shadowy Grey<br>"
	G.info += "<font color='#FFFF99'>Sand</font> Bright Yellow<br>"
	G.info += "<font color='#CC33FF'>Plasma</font>Purple<br>"
	G.info += "<font color='#E0E0EB'>Silver</font> Bright Grey<br>"
	G.info += "<font color='#FFCC00'>Gold</font> Golden Yellow<br>"
	G.info += "<font color='#FF408E'>Diamond</font> Cute Pink<br>"
	G.info += "<font color='#0000FF'>Platinum</font> Slick Blue<br>"
	G.info += "<font color='#7C8E5A'>Hydrogen</font> Army Green<br>"
	G.info += "<font color='#00FFFF'>Ameridian Growth</font> Neon Cyan<br>"
	G.info += "<font color='#964B00'>Dirt Flooring</font> Light Cream<br>"
	G.info += "<font color='#FF0000'>Your location</font> Angry Red<br>"
	G.update_icon()



