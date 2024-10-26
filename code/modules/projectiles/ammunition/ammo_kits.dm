
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
		if(user.stats.getPerk(PERK_HANDYMAN))
			material_points += 11
		if(user.stats.getPerk(PERK_GUNSMITH))
			material_points += 11
		switch(user.stats.getStat(STAT_MEC))
			if(STAT_LEVEL_BASIC to STAT_LEVEL_ADEPT)
				material_points += 3
			if(STAT_LEVEL_ADEPT to STAT_LEVEL_EXPERT)
				material_points += 6
			if(STAT_LEVEL_EXPERT to STAT_LEVEL_PROF)
				material_points += 9
			if(STAT_LEVEL_PROF to STAT_LEVEL_MASTER)
				material_points += 12
			if(STAT_LEVEL_MASTER to INFINITY)
				material_points += 15

	var/list/array = list(
		CAL_PISTOL = list(
			"5 points, 15 ammo: Scrap 9mm ammo pile" = list(5, /obj/item/ammo_casing/pistol_35/scrap/prespawned),
			"3 points, 6 ammo: Scrap 9mm speedloader" = list(3, /obj/item/ammo_magazine/speed_loader_pistol_35/scrap),
			"12 points, 30 ammo: Scrap 9mm ammo box" = list(12, /obj/item/ammo_magazine/ammobox/pistol_35/scrap),
			"8 points, 15 ammo: 9mm ammo pile" = list(8, /obj/item/ammo_casing/pistol_35/prespawned),
			"18 points, 30 ammo: 9mm ammo box" = list(18, /obj/item/ammo_magazine/ammobox/pistol_35),
			"5 points: EMPTY 9mm pistol magazine" = list(5, /obj/item/ammo_magazine/pistol_35/empty),
			"7 points: EMPTY 9mm extended magazine" = list(7, /obj/item/ammo_magazine/highcap_pistol_35/empty),
			"9 points: EMPTY 9mm SMG magazine" = list(12, /obj/item/ammo_magazine/smg_35/empty)
			),
		CAL_MAGNUM = list(
			"3 points, 6 ammo: Scrap 10mm ammo pile" = list(3, /obj/item/ammo_casing/magnum_40/scrap/prespawned),
			"15 points, 30 ammo: Scrap 10mm ammo box" = list(15, /obj/item/ammo_magazine/ammobox/magnum_40/scrap),
			"5 points, 6 ammo: Scrap 10mm speedloader" = list(5, /obj/item/ammo_magazine/speed_loader_magnum_40/scrap),
			"7 points, 6 ammo: 10mm magnum ammo pile" = list(7, /obj/item/ammo_casing/magnum_40/prespawned),
			"26 points, 30 ammo: 10mm ammo box" = list(26, /obj/item/ammo_magazine/ammobox/magnum_40),
			"7 points: EMPTY 10mm pistol magazine" = list(7, /obj/item/ammo_magazine/magnum_40/empty)
			),
		CAL_50 = list(
			"8 points, 6 ammo: 12mm ammo pile" = list(8, /obj/item/ammo_casing/kurtz_50/prespawned),
			"8 points: EMPTY 12mm heavy pistol magazine" = list(8, /obj/item/ammo_magazine/kurtz_50/empty),
			"10 points, 6 ammo: 12mm speedloader" = list(10, /obj/item/ammo_magazine/speed_loader_kurtz_50),
			"26 points, 24 ammo: 12mm ammo box" = list(26, /obj/item/ammo_magazine/ammobox/kurtz_50) // Same price for all packets, except 4 less ammo
			),
		CAL_SHOTGUN = list(
			"3 points, 5 ammo: Scrap beanbags pile" = list(3, /obj/item/ammo_casing/shotgun/beanbag/scrap/prespawned),
			"4 points, 5 ammo: Scrap buckshot pile" = list(4, /obj/item/ammo_casing/shotgun/pellet/scrap/prespawned),
			"4 points, 5 ammo: Scrap slugs pile" = list(4, /obj/item/ammo_casing/shotgun/scrap/prespawned),
			"15 points, 30 ammo: Scrap slugs box" = list(15, /obj/item/ammo_magazine/ammobox/shotgun/scrap_slug),
			"12 points, 30 ammo: Scrap buckshot box" = list(12, /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet),
			"10 points, 30 ammo: Scrap beanbag box" = list(10, /obj/item/ammo_magazine/ammobox/shotgun/scrap_beanbag),
			"6 points, 5 ammo: 20mm beanbag pile" = list(6, /obj/item/ammo_casing/shotgun/beanbag/prespawned),
			"9 points, 5 ammo: 20mm buckshot pile" = list(9, /obj/item/ammo_casing/shotgun/pellet/prespawned),
			"9 points, 5 ammo: 20mm slug pile" = list(9, /obj/item/ammo_casing/shotgun/prespawned),
			"15 points, 30 ammo: 20mm beanbag box" = list(15, /obj/item/ammo_magazine/ammobox/shotgun/beanbags),
			"20 points, 30 ammo: 20mm buckshot box" = list(20, /obj/item/ammo_magazine/ammobox/shotgun/buckshot),
			"25 points, 30 ammo: 20mm slug box" = list(25, /obj/item/ammo_magazine/ammobox/shotgun),
			"5 points, 5 ammo: 20mm ceramic pile" = list(5, /obj/item/ammo_casing/shotgun/ceramic/prespawned),
			"20 points, 30 ammo: 20mm ceramic box" = list (20, /obj/item/ammo_magazine/ammobox/shotgun/ceramic),
			"12 points, 5 ammo: 20mm incendiary pile" = list(12, /obj/item/ammo_casing/shotgun/incendiary/prespawned),
			"28 points, 30 ammo: 20mm incendiary box" = list(28, /obj/item/ammo_magazine/ammobox/shotgun/incendiary)
			),
		CAL_LRIFLE = list(
			"3 points, 10 ammo: Scrap carbine ammo pile" = list(3, /obj/item/ammo_casing/light_rifle_257/scrap/prespawned),
			"10 points, 30 ammo: Scrap carbine ammo packet" = list(10, /obj/item/ammo_magazine/ammobox/light_rifle_257/scrap),
			"8 points, 10 ammo: Carbine ammo pile" = list(8, /obj/item/ammo_casing/light_rifle_257/prespawned),
			"26 points, 30 ammo: Carbine ammo packet" = list(26, /obj/item/ammo_magazine/ammobox/light_rifle_257_small),
			"5 points: EMPTY carbine standard magazine" = list(5, /obj/item/ammo_magazine/light_rifle_257_short/empty),
			"10 points: EMPTY carbine extended magazine" = list(10, /obj/item/ammo_magazine/light_rifle_257/scrap/empty),
			"30 points: EMPTY carbine drum magazine" = list(30, /obj/item/ammo_magazine/light_rifle_257_drum/empty),
			"20 points: EMPTY carbine linked box" = list(20, /obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/empty)
			),
		CAL_RIFLE = list(
			"3 points, 10 ammo: Scrap ammo pile" = list(3, /obj/item/ammo_casing/rifle_75/scrap/prespawned),
			"15 points, 30 ammo: Scrap rifle ammo packet" = list(15, /obj/item/ammo_magazine/ammobox/rifle_75_small/scrap),
			"8 points, 10 ammo: Rifle ammo pile" = list(8, /obj/item/ammo_casing/rifle_75/prespawned),
			"26 points, 30 ammo: Rifle ammo packet" = list(26, /obj/item/ammo_magazine/ammobox/rifle_75_small),
			"5 points: EMPTY Rifle short magazine" = list(5, /obj/item/ammo_magazine/rifle_75_short/scrap/empty),
			"10 points: EMPTY Rifle extended magazine" = list(10, /obj/item/ammo_magazine/rifle_75/empty),
			"30 points: EMPTY Rifle drum magazine" = list(30, /obj/item/ammo_magazine/rifle_75_drum/empty),
			"20 points: EMPTY Rifle linked box" = list(20, /obj/item/ammo_magazine/rifle_75_linked_box/empty)
			),
		CAL_HRIFLE = list(
			"3 points, 10 ammo: Scrap heavy rifle ammo pile" = list(3, /obj/item/ammo_casing/heavy_rifle_408/scrap/prespawned),
			"15 points, 40 ammo: Scrap heavy rifle ammo box" = list(15, /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/scrap),
			"8 points, 10 ammo: Heavy rifle ammo pile" = list(8, /obj/item/ammo_casing/heavy_rifle_408/prespawned),
			"26 points, 40 ammo: Heavy rifle ammo packet" = list(26, /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small),
			"5 points: EMPTY heavy rifle magazine" = list(5, /obj/item/ammo_magazine/heavy_rifle_408/scrap/empty),
			"30 points: EMPTY heavy rifle drum magazine" = list(30, /obj/item/ammo_magazine/heavy_rifle_408_drum/empty)
			),
		CAL_ANTIM = list(
			"5 points, 3 ammo: Scrap 14.5mm ammo pile" = list(5, /obj/item/ammo_casing/antim/scrap/prespawned),
			"10 points, 5 ammo: Scrap 14.5mm ammo box" = list(10, /obj/item/ammo_magazine/ammobox/antim/scrap),
			"10 points, 3 ammo: 14.5mm ammo pile" = list(10, /obj/item/ammo_casing/antim/prespawned),
			"28 points, 15 ammo: 14.5mm ammo box" = list(26, /obj/item/ammo_magazine/ammobox/antim_small) // Same price as every packet for half the ammo, otherwise impossible to get
			),
		CAL_FLARE = list(
			"1 point: old flare x1" = list(1, /obj/item/ammo_casing/flare/old),
			"2 points: red flare x1" = list(2, /obj/item/ammo_casing/flare),
			"2 points: blue flare x1" = list(2, /obj/item/ammo_casing/flare/blue),
			"2 points: green flare x1" = list(2, /obj/item/ammo_casing/flare/green)
			),
		CAL_BALL = list(
			"1 point, 4 ammo: 17mm ball ammo pile" = list(1, /obj/item/ammo_casing/ball/prespawned),
			"15 points, 30 ammo: 17mm ball ammo box" = list(15, /obj/item/ammo_magazine/ammobox/ball)
			)
/*		CAL_70 = list(
			"26 points: EMPTY 19mm Gyrojet magazine" = list(26, /obj/item/ammo_magazine/a75/empty)
			)*/
		)

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
	options[".60 Anti-Materiel"] = "antim"
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
