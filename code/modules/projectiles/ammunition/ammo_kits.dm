
/obj/item/ammo_kit
	name = "scrap ammo kit"
	desc = "A somewhat jank looking crafting kit. It has a can of single-use tools, cheap pliers and a box of bullet making materials."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "ammo_kit-1"
	flags = CONDUCT
	throwforce = 1
	w_class = ITEM_SIZE_SMALL


/obj/item/ammo_kit/Initialize()
	. = ..()
	icon_state = "ammo_kit-[rand(1,5)]"


/obj/item/ammo_kit/attack_self(mob/user)
	var/list/items_to_spawn = make_scrap_ammo(user, src)
	if(items_to_spawn && items_to_spawn.len)
		if(do_mob(user, src, 10 SECONDS))
			var/location = get_turf(src)
			for(var/i in items_to_spawn)
				var/item_type = items_to_spawn[i]
				new item_type(location)
			qdel(src)


// Typeless so it could be reused in crafting_station.dm
/proc/make_scrap_ammo(mob/living/user, obj/source, extra_material_points = 0)
	if(!istype(user))
		return

	var/material_points = 15 + extra_material_points // 10 steel and 5 cardboard

	if(user.stats)
		switch(user.stats.getStat(STAT_MEC))
			if(STAT_LEVEL_BASIC to STAT_LEVEL_ADEPT)
				material_points += 3
			if(STAT_LEVEL_ADEPT to STAT_LEVEL_EXPERT)
				material_points += 6
			if(STAT_LEVEL_EXPERT to STAT_LEVEL_PROF)
				material_points += 9
			if(STAT_LEVEL_PROF to STAT_LEVEL_GODLIKE)
				material_points += 12
			if(STAT_LEVEL_GODLIKE to INFINITY)
				material_points += 15
		//if(user.stats.getPerk(/datum/perk/oddity/gunsmith))
		//	material_points += 15

	var/list/array = list(
		CAL_RIFLE = list(
			"7.5 ammo pile (10 ammo, 3 points)" = list(3, /obj/item/ammo_casing/rifle_75/scrap/prespawned),
			"7.5 standard magazine (empty, 10 ammo, 5 points)" = list(5, /obj/item/ammo_magazine/rifle_75_short/scrap/empty),
			"7.5 extended magazine (empty, 20 ammo, 10 points)" = list(10, /obj/item/ammo_magazine/rifle_75/empty),
			"7.5 drum magazine (empty, 40 ammo, 30 points)" = list(30, /obj/item/ammo_magazine/rifle_75_drum/empty),
			"7.5 linked box (empty, 100 ammo, 20 points)" = list(20, /obj/item/ammo_magazine/rifle_75_linked_box/empty),
			"7.5 ammo box (30 ammo, 15 points)" = list(15, /obj/item/ammo_magazine/ammobox/rifle_75_small/scrap)),
		CAL_LRIFLE = list(
			".257 ammo pile (10 ammo, 3 points)" = list(3, /obj/item/ammo_casing/light_rifle_257/scrap/prespawned),
			".257 standard magazine (empty, 20 ammo, 5 points)" = list(5, /obj/item/ammo_magazine/light_rifle_257_short/empty),
			".257 extended magazine (empty, 30 ammo, 10 points)" = list(10, /obj/item/ammo_magazine/light_rifle_257/scrap/empty),
			".257 drum magazine (empty, 60 ammo, 30 points)" = list(30, /obj/item/ammo_magazine/light_rifle_257_drum/empty),
			".257 linked box (empty, 100 ammo, 20 points)" = list(20, /obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/empty),
			".257 ammo box (30 ammo, 10 points)" = list(10, /obj/item/ammo_magazine/ammobox/light_rifle_257/scrap)),
		CAL_HRIFLE = list(
			".408 ammo pile (10 ammo, 3 points)" = list(3, /obj/item/ammo_casing/heavy_rifle_408/scrap),
			".408 standard magazine (empty, 20 ammo, 5 points)" = list(5, /obj/item/ammo_magazine/heavy_rifle_408/scrap/empty),,
			".408 drum magazine (empty, 36 ammo, 30 points)" = list(30, /obj/item/ammo_magazine/heavy_rifle_408_drum/empty),
			".408 ammo box (40 ammo, 15 points)" = list(15, /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/scrap)),
		CAL_PISTOL = list(
			".35 ammo pile (15 ammo, 5 points)" = list(5, /obj/item/ammo_casing/pistol_35/scrap/prespawned),
			".35 speedloader (6 ammo, 3 points)" = list(3, /obj/item/ammo_magazine/speed_loader_pistol_35/scrap),
			".35 standard magazine (empty, 10 ammo, 5 points)" = list(5, /obj/item/ammo_magazine/pistol_35/scrap/empty),
			".35 extended magazine (empty, 16 ammo, 10 points)" = list(10, /obj/item/ammo_magazine/highcap_pistol_35/empty),
			".35 SMG magazine (empty, 32 ammo, 12 points)" = list(12, /obj/item/ammo_magazine/smg_35/empty),
			".35 ammo box (30 ammo, 12 points)" = list(12, /obj/item/ammo_magazine/ammobox/pistol_35/scrap)),
		CAL_MAGNUM = list(
			".40 ammo pile (6 ammo, 3 points)" = list(3, /obj/item/ammo_casing/magnum_40/scrap/prespawned),
			".40 speedloader (6 ammo, 5 points)" = list(5, /obj/item/ammo_magazine/speed_loader_magnum_40/scrap),
			".40 standard magazine (empty, 10 ammo, 5 points)" = list(5, /obj/item/ammo_magazine/magnum_40/empty),
			".40 ammo box (30 ammo, 15 points)" = list(15, /obj/item/ammo_magazine/magnum_40/old)),
		CAL_SHOTGUN = list(
			"20mm slug pile (5 ammo, 3 points)" = list(3, /obj/item/ammo_casing/shotgun/scrap/prespawned),
			"20mm pellet pile (5 ammo, 3 points)" = list(3, /obj/item/ammo_casing/shotgun/pellet/scrap/prespawned),
			"20mm beanbag pile (5 ammo, 2 points)" = list(2, /obj/item/ammo_casing/shotgun/beanbag/scrap/prespawned),
			"20mm slug box (30 ammo, 20 points)" = list(20, /obj/item/ammo_magazine/ammobox/shotgun/scrap_slug),
			"20mm pellet box (30 ammo, 15 points)" = list(15, /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet),
			"20mm beanbag box (30 ammo, 10 points)" = list(10, /obj/item/ammo_magazine/ammobox/shotgun/scrap_beanbag)),
		CAL_FLARE = list(
			"flare (1 ammo, 1 points)" = list(1, /obj/item/ammo_casing/flare/old)),
		CAL_BALL = list(
			"30mm ball ammo pile (4 ammo, 1 points)" = list(1, /obj/item/ammo_casing/ball/prespawned),
			"30mm ball ammo box (30 ammo, 15 points)" = list(15, /obj/item/ammo_magazine/ammobox/ball)),
		CAL_ANTIM = list(
			"60-06 ammo pile (3 ammo, 5 points)" = list(5, /obj/item/ammo_casing/antim/scrap/prespawned),
			"60-06 ammo box (5 ammo, 10 points)" = list(10, /obj/item/ammo_magazine/ammobox/antim/scrap)))

	var/list/items_to_spawn = list()
	var/user_is_choosing = TRUE

	while(user_is_choosing)
		var/items_to_spawn_string = items_to_spawn.len ? "\n" + jointext(items_to_spawn, "\n") : "None"
		var/action = alert(user, "Picked items: [items_to_spawn_string]", "Material points: [material_points]", "Pick an item", "Craft picked", "Cancel")
		switch(action)
			if("Pick an item")
				var/caliber_of_choice = input(user, "Choose a caliber", "Material points: [material_points]") as null|anything in array
				if(caliber_of_choice)
					var/craft = input(user, "Choose a craft", "Material points: [material_points]") as null|anything in array[caliber_of_choice]
					if(craft)
						if(material_points >= array[caliber_of_choice][craft][1])
							material_points -= array[caliber_of_choice][craft][1]
							items_to_spawn.Add(craft)
							items_to_spawn[craft] = array[caliber_of_choice][craft][2]
						else
							to_chat(user, SPAN_NOTICE("Not enough materials."))
							continue

			if("Craft picked")
				if(!items_to_spawn.len)
					if(alert(user, "No items picked. Abort crafting?", "Material points: [material_points]", "Yes", "No, turn back") != "No, turn back")
						user_is_choosing = FALSE
				else
					if(material_points)
						if(alert(user, "Remaining material points would be wasted. Craft anyway?", "Material points: [material_points]", "Yes", "No, turn back") == "No, turn back")
							continue

					if(!QDELETED(source) && in_range(source, user))
						return items_to_spawn
			else
				user_is_choosing = FALSE


/*
/obj/item/ammo_kit
	name = "scrap Ammo Kit"
	desc = "A somewhat jank looking crafting kit. It has a can of single-use tools, cheap pliers and a box of bullet making materials."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "ammo_kit-1"
	flags = CONDUCT
	throwforce = 1
	w_class = ITEM_SIZE_SMALL
	price_tag = 25

/obj/item/ammo_kit/Initialize()
	. = ..()
	icon_state = "ammo_kit-[rand(1,5)]"

//////////////////////////////////////////////////////////////////////////////////////

/obj/item/ammo_kit/attack_self(mob/living/user as mob)

	var/cog_stat = user.stats.getStat(STAT_COG)

	if(!isliving(loc))
		return

	var/list/options = list()
	options[".257 Rifle"] = "srifle"
	options["7.5 Rifle"] = "clrifle"
	options[".408 Rifle"] = "lrifle"
	options[".35 Auto"] = "pistol"
	options[".40 Magnum"] = "magnum"
	options["Shotgun Buckshot"] = "shot"
	options["Shotgun Beanbag"] = "bean"
	options["Shotgun Slug"] = "slug"
	options[".60 Anti-Material"] = "antim"
	options["30mm rolled shot"] = "ball"
	options[".22 flare shell"] = "flare"

	var/choice = input(user,"What ammo do you want to make?") as null|anything in options

	var/ammo_type = options[choice]

	var/dice_roll = (rand(0,20)*(1+cog_stat/20))	//0 cog means you get between 0 and 20, negative means you only over get minimum

	switch(ammo_type)
		if("pistol")
			spawn_pistol(dice_roll,user)
		if("magnum")
			spawn_magnum(dice_roll,user)
		if("srifle")
			spawn_rifle(dice_roll,user,1)	//same table, different spawns for all normal rifles
		if("clrifle")
			spawn_rifle(dice_roll,user,2)
		if("lrifle")
			spawn_rifle(dice_roll,user,3)
		if("antim")
			spawn_antim(dice_roll,user)
		if("shot")
			spawn_shotgun(dice_roll,user,1)
		if("bean")
			spawn_shotgun(dice_roll,user,2)
		if("slug")
			spawn_shotgun(dice_roll,user,3)
		if("ball")
			spawn_ball(dice_roll, user)
		if("flare")
			spawn_flare(dice_roll,user)

	if(choice)
		user.visible_message("[user] makes some [choice] rounds out of [src], using up all the materials in it.")
		qdel(src)	//All used up
	else
		to_chat(user, "You reconsider the path of the munition smith.")

//////////////////////////////////////////////////////////////////////////////////////

/obj/item/ammo_kit/proc/spawn_pistol(dice = 0, mob/user)	//Shazbot- I know there is probably a better way to do this, but this is easier to code

	var/boxxes = 0
	var/piles = 0
	var/mags = 0
	var/speedy = 0

	switch(dice)
		if(-99 to 10)	//if someone gets less than -99, they deserve the ammo
			piles = 1
		if(10 to 20)
			boxxes = 1
			mags = 1
			speedy = 1
		if(20 to 30)
			boxxes = 1
			piles = 1
			mags = 1
			speedy = 1
		if(30 to 40)
			boxxes = 2
			mags = 3
			speedy = 2
		if(40 to 50)
			piles = 1
			boxxes = 2
			mags = 4
			speedy = 3
		else
			boxxes = 3+ round(dice/10-5,1)	//rich get richer
			mags = 4+ round(dice/10-5,1)	//rich get richer
			speedy = 3+ round(dice/10-5,1)	//rich get richer

	if(piles)
		for(var/j = 1 to piles)
			new /obj/item/ammo_casing/pistol_35/scrap/prespawned(user.loc)
	if(boxxes)
		for(var/j = 1 to boxxes)
			new /obj/item/ammo_magazine/ammobox/pistol_35/scrap(user.loc)
	if(mags)
		for(var/j = 1 to mags)
			new /obj/item/ammo_magazine/pistol_35/scrap(user.loc)
	if(speedy)
		for(var/j = 1 to speedy)
			new /obj/item/ammo_magazine/speed_loader_pistol_35/scrap(user.loc)

//////////////////////////////////////////////////////////////////////////////////////

/obj/item/ammo_kit/proc/spawn_magnum(dice = 0, mob/user)

	var/boxxes = 0
	var/piles = 0
	var/mags = 0
	var/speedy = 0

	switch(dice)
		if(-99 to 8)
			piles = 2
		if(8 to 16)
			piles = 4
			speedy = 1
		if(16 to 24)
			boxxes = 1
			speedy = 1
			mags = 1
		if(24 to 32)
			piles = 2
			boxxes = 1
			speedy = 2
			mags = 1
		if(32 to 40)
			piles = 4
			speedy = 2
			boxxes = 1
			mags = 2
		if(40 to 48)
			speedy = 3
			boxxes = 2
			mags = 2
		else
			boxxes = 3 + round(dice/10-5,1)
			mags = 1 + round(dice/15-5,1)
			speedy = 1 + round(dice/15-5,1)

	if(piles)
		for(var/j = 1 to piles)
			new /obj/item/ammo_casing/magnum_40/scrap/prespawned(user.loc)
	if(boxxes)
		for(var/j = 1 to boxxes)
			new /obj/item/ammo_magazine/ammobox/magnum_40/scrap(user.loc)
	if(mags)
		for(var/j = 1 to mags)
			new /obj/item/ammo_magazine/magnum_40/old(user.loc)
	if(speedy)
		for(var/j = 1 to speedy)
			new /obj/item/ammo_magazine/speed_loader_magnum_40/scrap(user.loc)


//////////////////////////////////////////////////////////////////////////////////////

/obj/item/ammo_kit/proc/spawn_rifle(dice = 0, mob/user,rifle=1)	//All rifles use same spawning stats

	var/boxxes = 0
	var/piles = 0
	var/mags = 0

	switch(dice)
		if(-99 to 6)	//if someone gets less than -99, they deserve the ammo
			piles = 1
		if(6 to 12)
			piles = 2
		if(12 to 18)
			piles = 3
		if(18 to 24)
			piles = 4
			mags = 1
		if(24 to 30)
			boxxes = 1
		if(36 to 42)
			boxxes = 1
			piles = 2
			mags = 1
		if(42 to 48)
			boxxes = 1
			piles = 4
			mags = 2
		else
			boxxes = 2 + round(dice/10-5,1)
			mags = 1 + round(dice/15-5,1) //1+ every 10 over 50

	if(rifle==1) //srifle
		if(piles)
			for(var/j = 1 to piles)
				new /obj/item/ammo_casing/light_rifle_257/scrap/prespawned(user.loc)
		if(boxxes)
			for(var/j = 1 to boxxes)
				new /obj/item/ammo_magazine/ammobox/light_rifle_257/scrap(user.loc)
		if(mags)
			for(var/j = 1 to mags)
				new /obj/item/ammo_magazine/light_rifle_257/scrap(user.loc)


	if(rifle==2) //clrifle
		if(piles)
			for(var/j = 1 to piles)
				new /obj/item/ammo_casing/rifle_75/scrap/prespawned(user.loc)
		if(boxxes)
			for(var/j = 1 to boxxes)
				new /obj/item/ammo_magazine/ammobox/rifle_75_small/scrap(user.loc)
		if(mags)
			for(var/j = 1 to mags)
				new /obj/item/ammo_magazine/rifle_75/scrap(user.loc)

	if(rifle==3) //lrifle
		if(piles)
			for(var/j = 1 to piles)
				new /obj/item/ammo_casing/heavy_rifle_408/scrap/prespawned(user.loc)
		if(boxxes)
			for(var/j = 1 to boxxes)
				new /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/scrap(user.loc)
		if(mags)
			for(var/j = 1 to mags)
				new /obj/item/ammo_magazine/heavy_rifle_408/scrap(user.loc)

//////////////////////////////////////////////////////////////////////////////////////

/obj/item/ammo_kit/proc/spawn_antim(dice = 0, mob/user)	//Shazbot- I know there is probably a better way to do this, but this is easier to code

	var/boxxes = 0
	var/piles = 0

	switch(dice)
		if(-99 to 10)	//if someone gets less than -99, they deserve the ammo
			piles = 1
		if(10 to 20)
			piles = 2
		if(20 to 30)
			piles = 3
		if(30 to 40)
			piles = 4
		if(40 to 50)
			piles = 5
		else
			boxxes = 1
			piles = round(dice/10-6,1)

	if(piles)
		for(var/j = 1 to piles)
			new /obj/item/ammo_casing/antim/scrap/prespawned(user.loc)
	if(boxxes)
		for(var/j = 1 to boxxes)
			new /obj/item/ammo_magazine/ammobox/antim/scrap(user.loc)

//////////////////////////////////////////////////////////////////////////////////////

/obj/item/ammo_kit/proc/spawn_ball(dice = 0, mob/user)	//Shazbot- I know there is probably a better way to do this, but this is easier to code

	var/boxxes = 0
	var/piles = 0

	switch(dice)
		if(-99 to 10)	//if someone gets less than -99, they deserve the ammo
			piles = 1
		if(10 to 20)
			piles = 2
		if(20 to 30)
			piles = 3
		if(30 to 40)
			piles = 4
		if(40 to 50)
			piles = 5
		else
			boxxes = 1
			piles = round(dice/10-6,1)

	if(piles)
		for(var/j = 1 to piles)
			new /obj/item/ammo_casing/ball/prespawned(user.loc)
	if(boxxes)
		for(var/j = 1 to boxxes)
			new /obj/item/ammo_magazine/ammobox/ball(user.loc)

//////////////////////////////////////////////////////////////////////////////////////

/obj/item/ammo_kit/proc/spawn_flare(dice = 0, mob/user)	//Shazbot- I know there is probably a better way to do this, but this is easier to code

	var/piles = 0

	switch(dice)
		if(-99 to 10)	//if someone gets less than -99, they deserve the ammo
			piles = 1
		if(10 to 20)
			piles = 2
		if(20 to 30)
			piles = 3
		if(30 to 40)
			piles = 4
		if(40 to 50)
			piles = 5
		else
			piles = 6
			piles = round(dice/10-6,1)

	if(piles)
		for(var/j = 1 to piles)
			new /obj/item/ammo_casing/flare/old(user.loc)

//////////////////////////////////////////////////////////////////////////////////////

/obj/item/ammo_kit/proc/spawn_shotgun(dice = 0, mob/user,shotgun=1)	//All rifles use same spawning stats

	var/piles = 0
	var/boxes = 0

	switch(dice)
		if(-99 to 0)	//if someone gets less than -99, they deserve the ammo
			piles = 1
		else
			piles = 1 + round(dice/7-1,1)	//We can use math here because it's just piles
			boxes = 0 + round(dice/51-1,1)	//for every 50 we role we get a box, max of 2 boxes

	if(shotgun==1) //shot
		if(piles)
			for(var/j = 1 to piles)
				new /obj/item/ammo_casing/shotgun/pellet/scrap/prespawned(user.loc)
		if(boxes)
			for(var/j = 1 to boxes)
				new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(user.loc)

	if(shotgun==2) //bean
		if(piles)
			for(var/j = 1 to piles)
				new /obj/item/ammo_casing/shotgun/beanbag/scrap/prespawned(user.loc)
		if(boxes)
			for(var/j = 1 to boxes)
				new /obj/item/ammo_magazine/ammobox/shotgun/scrap_beanbag(user.loc)

	if(shotgun==3) //slug
		if(piles)
			for(var/j = 1 to piles)
				new /obj/item/ammo_casing/shotgun/scrap/prespawned(user.loc)
		if(boxes)
			for(var/j = 1 to boxes)
				new /obj/item/ammo_magazine/ammobox/shotgun/scrap_slug(user.loc)
*/