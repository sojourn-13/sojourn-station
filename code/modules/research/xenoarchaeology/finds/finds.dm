//original code and idea from Alfie275 (luna era) and ISaidNo (goonservers) - with thanks

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Xenoarchaeological finds

/datum/find
	var/find_type = 0				//random according to the digsite type
	var/excavation_required = 0		//random 5-95%
	var/view_range = 50				//how close excavation has to come to show an overlay on the turf
	var/clearance_range = 3			//how close excavation has to come to extract the item
									//if excavation hits var/excavation_required exactly, it's contained find is extracted cleanly without the ore
	var/prob_delicate = 90			//probability it requires an active suspension field to not insta-crumble
	var/dissonance_spread = 1		//proportion of the tile that is affected by this find
									//used in conjunction with analysis machines to determine correct suspension field type

/datum/find/New(var/digsite, var/exc_req)
	excavation_required = exc_req
	find_type = get_random_find_type(digsite)
	clearance_range = rand(2,6)
	dissonance_spread = rand(1500,2500) / 100

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Strange rocks

//have all strange rocks be cleared away using welders for now
/obj/item/stack/ore/strangerock
	name = "Strange rock"
	desc = "Seems to have some unusal strata evident throughout it."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "strange"
	max_amount = 1
	var/datum/geosample/geologic_data
	var/obj/item/inside
	var/method = 0// 0 = fire, 1 = brush, 2 = pick
	origin_tech = list(TECH_MATERIAL = 5)

/obj/item/stack/ore/strangerock/New(loc, var/inside_item_type = 0)
	..(loc)

	method = rand(0,2)
	if(inside_item_type)
		inside = new/obj/item/archaeological_find(src, new_item_type = inside_item_type)

/*/obj/item/stack/ore/strangerock/ex_act(var/severity)
	if(severity && prob(30))
		src.visible_message("The [src] crumbles away, leaving some dust and gravel behind.")*/

/obj/item/stack/ore/strangerock/attackby(obj/item/I, mob/user)
	var/tool_type = I.get_tool_type(user, list(QUALITY_WELDING, QUALITY_DIGGING, QUALITY_EXCAVATION), src)
	var/turf/T = get_turf(src)
	switch(tool_type)
		if(QUALITY_WELDING)
			if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_COG))
				if(method == 0)
					for(var/obj/A in contents)
						A.forceMove(T)
					for(var/mob/M in viewers(world.view, user))
						M.show_message("<span class='info'>[src] burns away revealing [inside.name].</span>",1)
				else
					for(var/mob/M in viewers(world.view, user))
						M.show_message("<span class='info'>A few sparks fly off [src], but nothing else happens.</span>",1)
				qdel(src)
				return
		if(QUALITY_DIGGING)
			if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_DIGGING, FAILCHANCE_EASY, required_stat = STAT_COG))
				if(method == 1)
					for(var/obj/A in contents)
						A.forceMove(T)
					for(var/mob/M in viewers(world.view, user))
						M.show_message("<span class='info'>[src] chips away revealing [inside.name].</span>",1)
				else
					for(var/mob/M in viewers(world.view, user))
						M.show_message("<span class='info'>A plume of dust and dirt scatter around [src], but nothing else happens.</span>",1)
				qdel(src)
				return
		if(QUALITY_EXCAVATION)
			if(I.use_tool(user, src, WORKTIME_FAST, QUALITY_EXCAVATION, FAILCHANCE_EASY, required_stat = STAT_COG))
				if(method == 2)
					for(var/obj/A in contents)
						A.forceMove(T)
					for(var/mob/M in viewers(world.view, user))
						M.show_message("<span class='info'>[src] carefully extracts chunks away revealing [inside.name].</span>",1)
				else
					for(var/mob/M in viewers(world.view, user))
						M.show_message("<span class='info'>A plume of dust and dirt scatter around [src], but nothing else happens.</span>",1)
				qdel(src)
				return
		if(ABORT_CHECK)
			return

	if(istype(I,/obj/item/device/core_sampler/))
		var/obj/item/device/core_sampler/S = I
		S.sample_item(src, user)
		return

	..()
	if(prob(33))
		src.visible_message(SPAN_WARNING("[src] crumbles away, leaving some dust and gravel behind."))
		qdel(src)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Archaeological finds

/obj/item/archaeological_find
	name = "object"
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "ano01"
	var/find_type = 0

/obj/item/archaeological_find/get_item_cost(export)
	. = ..()
	. += rand(500,3500) //Always worth something to someone

/obj/item/archaeological_find/New(loc, var/new_item_type)
	if(new_item_type)
		find_type = new_item_type
	else
		find_type = rand(1,36)	//update this when you add new find types

	var/item_type = "object"
	icon_state = "unknown[rand(1,4)]"
	var/additional_desc = ""
	var/obj/item/new_item
	var/source_material = ""
	var/apply_material_decorations = 1
	var/apply_image_decorations = 0
	var/material_descriptor = ""
	var/apply_prefix = 1
	if(prob(40))
		material_descriptor = pick("rusted ","dusty ","archaic ","fragile ")
	source_material = pick("cordite","quadrinium",MATERIAL_STEEL,"titanium","aluminium","ferritic-alloy","plasteel","duranium")

	var/talkative = 0
	if(prob(5))
		talkative = 1

	//for all items here:
	//icon_state
	//item_state
	switch(find_type)
		if(1)
			item_type = "bowl"
			if(prob(33))
				new_item = new /obj/item/reagent_containers/glass/replenishing(src.loc)
			else
				new_item = new /obj/item/reagent_containers/glass/beaker(src.loc)
			new_item.icon = 'icons/obj/xenoarchaeology.dmi'
			new_item.icon_state = "bowl"
			new_item.price_tag = rand(200,500)
			apply_image_decorations = 1
			if(prob(20))
				additional_desc = "There appear to be [pick("dark","faintly glowing","pungent","bright")] [pick("red","purple","green","blue")] stains inside."
		if(2)
			item_type = "urn"
			if(prob(33))
				new_item = new /obj/item/reagent_containers/glass/replenishing(src.loc)
			else
				new_item = new /obj/item/reagent_containers/glass/beaker(src.loc)
			new_item.icon = 'icons/obj/xenoarchaeology.dmi'
			new_item.icon_state = "urn"
			new_item.price_tag = rand(200,500)
			apply_image_decorations = 1
			if(prob(20))
				additional_desc = "It [pick("whispers faintly","makes a quiet roaring sound","whistles softly","thrums quietly","throbs")] if you put it to your ear."
		if(3)
			item_type = "[pick("fork","spoon","knife")]"
			if(prob(25))
				new_item = new /obj/item/material/kitchen/utensil/fork(src.loc)
			else if(prob(50))
				new_item = new /obj/item/tool/knife(src.loc)
			else
				new_item = new /obj/item/material/kitchen/utensil/spoon(src.loc)
			new_item.price_tag = rand(250,600) //Legit no use
			additional_desc = "[pick("It's like no [item_type] you've ever seen before",\
			"It's a mystery how anyone is supposed to eat with this",\
			"You wonder what the creator's mouth was shaped like")]."
		if(4)
			name = "statuette"
			icon = 'icons/obj/xenoarchaeology.dmi'
			item_type = "statuette"
			icon_state = "statuette"
			additional_desc = "It depicts a [pick("small","ferocious","wild","pleasing","hulking")] \
			[pick("alien figure","rodent-like creature","reptilian alien","primate","unidentifiable object")] \
			[pick("performing unspeakable acts","posing heroically","in a fetal position","cheering","sobbing","making a plaintive gesture","making a rude gesture")]."
			if(prob(25))
				new_item = new /obj/item/vampiric(src.loc)
			new_item.price_tag = rand(500,750)
		if(5)
			name = "instrument"
			icon = 'icons/obj/xenoarchaeology.dmi'
			item_type = "instrument"
			icon_state = "instrument"
			if(prob(30))
				apply_image_decorations = 1
				additional_desc = "[pick("You're not sure how anyone could have played this",\
				"You wonder how many mouths the creator had",\
				"You wonder what it sounds like",\
				"You wonder what kind of music was made with it")]."
			new_item.price_tag = rand(600,650)//Again no use
		if(6)
			item_type = "[pick("bladed knife","serrated blade","sharp cutting implement")]"
			new_item = new /obj/item/tool/knife(src.loc)
			additional_desc = "[pick("It doesn't look safe.",\
			"It looks wickedly jagged",\
			"There appear to be [pick("dark red","dark purple","dark green","dark blue")] stains along the edges")]."
			new_item.price_tag = rand(300,650)//some use
		if(7)
			item_type = "[pick("jewled","fragmented","cosmic")]"
			new_item = new /obj/item/oddity/broken_necklace(src.loc)
			additional_desc = "[pick("It doesn't look safe.",\
			"It looks wickedly jagged",\
			"There appear to be [pick("dark red","dark purple","dark green","dark blue")] stains along the string")]."
			new_item.price_tag = rand(3250,4650)//Bluespace artifact.
		if(8)
			item_type = "handcuffs"
			new_item = new /obj/item/handcuffs(src.loc)
			additional_desc = "[pick("They appear to be for securing two things together","Looks kinky","Doesn't seem like a children's toy")]."
			new_item.price_tag = rand(100,400)
		if(9)
			item_type = "[pick("wicked","evil","byzantine","dangerous")] looking [pick("device","contraption","thing","trap")]"
			apply_prefix = 0
			new_item = new /obj/item/beartrap(src.loc)
			new_item.price_tag = rand(20,800) //Has some uses
			additional_desc = "[pick("It looks like it could take a limb off",\
			"Could be some kind of animal trap",\
			"There appear to be [pick("dark red","dark purple","dark green","dark blue")] stains along part of it")]."
		if(10)
			item_type = "[pick("cylinder","tank","chamber")]"
			new_item = new /obj/item/flame/lighter(src.loc)
			additional_desc = "There is a tiny device attached."
			new_item.price_tag = rand(120,900) //Has some uses
			if(prob(30))
				apply_image_decorations = 1
		if(11)
			item_type = "box"
			new_item = new /obj/item/storage/box(src.loc)
			new_item.icon = 'icons/obj/xenoarchaeology.dmi'
			new_item.icon_state = "box"
			new_item.price_tag = rand(250,1000) //Has some uses
			var/obj/item/storage/box/new_box = new_item
			new_box.max_w_class = pick(\
				prob(1);ITEM_SIZE_TINY,
				prob(2);ITEM_SIZE_SMALL,
				prob(3);ITEM_SIZE_NORMAL,
				prob(2);ITEM_SIZE_BULKY\
			)
			var/storage_amount = 2**(new_box.max_w_class-1)
			new_box.max_storage_space = rand(storage_amount, storage_amount * 10)
			if(prob(30))
				apply_image_decorations = 1
		if(12)
			item_type = "[pick("cylinder","tank","chamber")]"
			if(prob(25))
				new_item = new /obj/item/tank/air(src.loc)
			else if(prob(50))
				new_item = new /obj/item/tank/anesthetic(src.loc)
			else
				new_item = new /obj/item/tank/plasma(src.loc)
			icon_state = pick("oxygen","oxygen_fr","oxygen_f","plasma","anesthetic")
			additional_desc = "It [pick("gloops","sloshes")] slightly when you shake it."
			new_item.price_tag = rand(450,1000) //Has some uses
		if(13)
			item_type = "tool"
			if(prob(25))
				new_item = new /obj/item/tool/wrench(src.loc)
			else if(prob(25))
				new_item = new /obj/item/tool/crowbar(src.loc)
			else
				new_item = new /obj/item/tool/screwdriver(src.loc)
			new_item.price_tag = rand(450,1200) //Has some uses
			additional_desc = "[pick("It doesn't look safe.",\
			"You wonder what it was used for",\
			"There appear to be [pick("dark red","dark purple","dark green","dark blue")] stains on it")]."
		if(14)
			apply_material_decorations = 0
			var/list/possible_spawns = list()
			possible_spawns += /obj/item/stack/material/steel
			possible_spawns += /obj/item/stack/material/plasteel
			possible_spawns += /obj/item/stack/material/glass
			possible_spawns += /obj/item/stack/material/glass/reinforced
			possible_spawns += /obj/item/stack/material/plasma
			possible_spawns += /obj/item/stack/material/gold
			possible_spawns += /obj/item/stack/material/silver
			possible_spawns += /obj/item/stack/material/uranium
			possible_spawns += /obj/item/stack/material/sandstone
			possible_spawns += /obj/item/stack/material/silver

			var/new_type = pick(possible_spawns)
			new_item = new new_type(src.loc)
			new_item:amount = rand(50,75) //If you get lucky and get this then you should get a good amout
		if(15)
			if(prob(75))
				new_item = new /obj/item/pen(src.loc)
			else
				new_item = new /obj/item/pen/reagent/sleepy(src.loc)
			if(prob(30))
				apply_image_decorations = 1
			new_item.price_tag = rand(350,1200) //Has some uses
		if(16)
			apply_prefix = 0
			if(prob(25))
				icon = 'icons/obj/xenoarchaeology.dmi'
				item_type = "smooth green crystal"
				icon_state = "green_lump"
			else if(prob(33))
				icon = 'icons/obj/xenoarchaeology.dmi'
				item_type = "irregular purple crystal"
				icon_state = "phazon"
			else
				icon = 'icons/obj/xenoarchaeology.dmi'
				item_type = "rough red crystal"
				icon_state = "changerock"
			additional_desc = pick("It shines faintly as it catches the light.","It appears to have a faint inner glow.","It seems to draw you inward as you look it at.","Something twinkles faintly as you look at it.","It's mesmerizing to behold.")
			new_item.price_tag = rand(750,2500) //It shines!
			apply_material_decorations = 0
			if(prob(10))
				apply_image_decorations = 1
		if(17 to 18)
			new_item = new /obj/item/device/radio/beacon(src.loc)
			talkative = 0
			new_item.icon = 'icons/obj/xenoarchaeology.dmi'
			new_item.icon_state = "unknown[rand(1,4)]"
			new_item.desc = ""
			new_item.price_tag = rand(450,1500)
		if(19 to 20)
			apply_prefix = 0
			new_item = new /obj/item/tool/sword(src.loc)
			new_item.force = 10
			item_type = new_item.name
			new_item.price_tag = rand(550,1100)
		if(21 to 22)
			if(prob(50))
				new_item = new /obj/item/material/shard(src.loc)
			else
				new_item = new /obj/item/material/shard/plasma(src.loc)
			apply_prefix = 0
			apply_image_decorations = 0
			apply_material_decorations = 0
		if(23)
			apply_prefix = 0
			new_item = new /obj/item/stack/rods(loc)
			apply_image_decorations = 0
			apply_material_decorations = 0
		if(24)
			var/list/possible_spawns = typesof(/obj/item/stock_parts)
			possible_spawns -= /obj/item/stock_parts
			possible_spawns -= /obj/item/stock_parts/subspace

			var/new_type = pick(possible_spawns)
			new_item = new new_type(src.loc)
			item_type = new_item.name
			apply_material_decorations = 0
		if(25)
			apply_prefix = 0
			new_item = new /obj/item/tool/sword/katana(src.loc)
			new_item.force = 10
			item_type = new_item.name
			new_item.price_tag = rand(650,1200)
		if(26)
			//energy gun
			var/spawn_type = pick(\
			/obj/item/gun/energy/cog/xenoarch,\
			/obj/item/gun/energy/xray/xenoarch,\
			/obj/item/gun/energy/captain/xenoarch)
			if(spawn_type)
				var/obj/item/gun/energy/new_gun = new spawn_type(src.loc)
				new_item = new_gun
				new_gun.icon_state = "egun[rand(1,6)]"
				new_gun.desc = "This is an antique energy weapon, Wonder how it shoots."
				new_gun.serial_type = "INDEX"
				new_gun.serial_shown = FALSE
				new_gun.cell.charge = new_gun.cell.maxcharge
				new_item.price_tag = rand(950,2500)
			item_type = "gun"

		if(27)
			//projectile guns
			var/spawn_type = pick(\
			/obj/item/gun/projectile/revolver/xenoarch,\
			/obj/item/gun/projectile/revolver/sixshot/xenoarch,\
			/obj/item/gun/projectile/boltgun/heavysniper/xenoarch)
			if(spawn_type)
				var/obj/item/gun/projectile/new_gun = new spawn_type(src.loc)
				new_item = new_gun
				new_gun.icon_state = "gun[rand(1,4)]"
				new_gun.desc = "This is a antique firearm. Cleaned and ready to use."
				new_gun.serial_type = "INDEX"
				new_gun.serial_shown = FALSE
				new_gun.price_tag = rand(950,2500)
			item_type = "gun"

		if(28)
			//completely unknown alien device
			if(prob(50))
				apply_image_decorations = 0
			new_item?.price_tag = rand(450,800)
		if(29)
			//fossil bone/skull
			//new_item = new /obj/item/fossil/base(src.loc)

			//the replacement item propogation isn't working, and it's messy code anyway so just do it here
			var/list/candidates = list("/obj/item/fossil/bone"=9,"/obj/item/fossil/skull"=3,
			"/obj/item/fossil/skull/horned"=2)
			var/spawn_type = pickweight(candidates)
			new_item = new spawn_type(src.loc)

			apply_prefix = 0
			additional_desc = "A fossilised part of an alien, long dead."
			apply_image_decorations = 0
			apply_material_decorations = 0
			new_item.price_tag = rand(950,1750)
		if(30)
			//fossil shell
			new_item = new /obj/item/fossil/shell(src.loc)
			apply_prefix = 0
			additional_desc = "A fossilised, pre-Stygian alien crustacean."
			apply_image_decorations = 0
			apply_material_decorations = 0
			new_item.price_tag = rand(950,1750)
			if(prob(10))
				apply_image_decorations = 1
		if(31)
			//fossil plant
			new_item = new /obj/item/fossil/plant(src.loc)
			item_type = new_item.name
			additional_desc = "A fossilised shred of alien plant matter."
			apply_image_decorations = 0
			apply_material_decorations = 0
			apply_prefix = 0
			new_item.price_tag = rand(1000,1750)
		if(32)
			//humanoid remains
			apply_prefix = 0
			item_type = "humanoid [pick("remains","skeleton")]"
			icon = 'icons/effects/blood.dmi'
			icon_state = "remains"
			additional_desc = pick("They appear almost human.",\
			"They are contorted in a most gruesome way.",\
			"They look almost peaceful.",\
			"The bones are yellowing and old, but remarkably well preserved.",\
			"The bones are scored by numerous burns and partially melted.",\
			"The are battered and broken, in some cases less than splinters are left.",\
			"The mouth is wide open in a death rictus, the victim would appear to have died screaming.")
			apply_image_decorations = 0
			apply_material_decorations = 0
			new_item.price_tag = rand(950,1750)
		if(33)
			//robot remains
			apply_prefix = 0
			item_type = "[pick("mechanical","robotic","cyborg")] [pick("remains","chassis","debris")]"
			icon = 'icons/mob/robots.dmi'
			icon_state = "remainsrobot"
			additional_desc = pick("Almost mistakeable for the remains of a modern cyborg.",\
			"They are barely recognisable as anything other than a pile of waste metals.",\
			"It looks like the battered remains of an ancient robot chassis.",\
			"The chassis is rusting and old, but remarkably well preserved.",\
			"The chassis is scored by numerous burns and partially melted.",\
			"The chassis is battered and broken, in some cases only chunks of metal are left.",\
			"A pile of wires and crap metal that looks vaguely robotic.")
			apply_image_decorations = 0
			apply_material_decorations = 0
			new_item.price_tag = rand(1000,2000)
		if(34)
			//xenos remains
			apply_prefix = 0
			item_type = "alien [pick("remains","skeleton")]"
			icon = 'icons/effects/blood.dmi'
			icon_state = "remainsxeno"
			additional_desc = pick("It looks vaguely reptilian, but with more teeth.",\
			"They are faintly unsettling.",\
			"There is a faint aura of unease about them.",\
			"The bones are yellowing and old, but remarkably well preserved.",\
			"The bones are scored by numerous burns and partially melted.",\
			"The are battered and broken, in some cases less than splinters are left.",\
			"This creature would have been twisted and monstrous when it was alive.",\
			"It doesn't look human.")
			apply_image_decorations = 0
			apply_material_decorations = 0
			new_item.price_tag = rand(1500,2500)
		if(35)
			//gas mask
			if(prob(25))
				new_item = new /obj/item/clothing/mask/gas/poltergeist(src.loc)
			else
				new_item = new /obj/item/clothing/mask/gas(src.loc)
			new_item.price_tag = rand(100,200)
		if(36)
			//oddity knife
			if(prob(25))
				new_item = new /obj/item/oddity/common/rusted_sword(src.loc)
			else
				new_item = new /obj/item/oddity/common/old_knife(src.loc)
			new_item.price_tag = rand(500,700)
		if(37)
			//oddity random
			if(prob(25))
				new_item = new /obj/item/oddity/chimeric_fang_trophy(src.loc)
			else
				new_item = new /obj/item/oddity/common/broken_key(src.loc)
			new_item.price_tag = rand(500,700)


	var/decorations = ""
	if(apply_material_decorations)
		source_material = pick("cordite","quadrinium",MATERIAL_STEEL,"titanium","aluminium","ferritic-alloy","plasteel","duranium")
		desc = "A [material_descriptor ? "[material_descriptor] " : ""][item_type] made of [source_material], all craftsmanship is of [pick("the lowest","low","average","high","the highest")] quality."

		var/list/descriptors = list()
		if(prob(30))
			descriptors.Add("is encrusted with [pick("","synthetic ","multi-faceted ","uncut ","sparkling ") + pick("rubies","emeralds","diamonds","opals","lapiz lazuli")]")
		if(prob(30))
			descriptors.Add("is studded with [pick("gold","gold","aluminium","titanium")]")
		if(prob(30))
			descriptors.Add("is encircled with bands of [pick("quadrinium","cordite","ferritic-alloy","plasteel","duranium")]")
		if(prob(30))
			descriptors.Add("menaces with spikes of [pick("solid plasma",MATERIAL_URANIUM,"white pearl","black steel")]")
		if(descriptors.len > 0)
			decorations = "It "
			for(var/index=1, index <= descriptors.len, index++)
				if(index > 1)
					if(index == descriptors.len)
						decorations += " and "
					else
						decorations += ", "
				decorations += descriptors[index]
			decorations += "."
		if(decorations)
			desc += " " + decorations

	var/engravings = ""
	if(apply_image_decorations)
		engravings = "[pick("Engraved","Carved","Etched")] on the item is [pick("an image of","a frieze of","a depiction of")] \
		[pick("an alien humanoid","an amorphic blob","a short, hairy being","a rodent-like creature","a robot","a primate","a reptilian alien","an unidentifiable object","a statue","a starship","unusual devices","a structure")] \
		[pick("surrounded by","being held aloft by","being struck by","being examined by","communicating with")] \
		[pick("alien humanoids","amorphic blobs","short, hairy beings","rodent-like creatures","robots","primates","reptilian aliens")]"
		if(prob(50))
			engravings += ", [pick("they seem to be enjoying themselves","they seem extremely angry","they look pensive","they are making gestures of supplication","the scene is one of subtle horror","the scene conveys a sense of desperation","the scene is completely bizarre")]"
		engravings += "."

		if(desc)
			desc += " "
		desc += engravings

	if(apply_prefix)
		name = "[pick("Strange","Ancient","Alien","")] [item_type]"
	else
		name = item_type

	if(desc)
		desc += " "
	desc += additional_desc
	if(!desc)
		desc = "This item is completely [pick("alien","bizarre")]."

	//icon and icon_state should have already been set
	if(new_item)
		new_item.name = name
		new_item.desc = src.desc

		if(talkative)
			new_item.talking_atom = new(new_item)

		qdel(src)

	else if(talkative)
		src.talking_atom = new(src)
