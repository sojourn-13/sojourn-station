/obj/item/ammo_kit
	name = "scrap Ammo Kit"
	desc = "A somewhat jank looking crafting kit. It has a can of single-use tools, cheap pliers and a box of bullet making materials."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "ammo_kit-1"
	flags = CONDUCT
	throwforce = 1
	w_class = ITEM_SIZE_SMALL

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
			new /obj/item/ammo_casing/magnum/scrap/prespawned(user.loc)
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
				new /obj/item/ammo_magazine/ammobox/rifle_75/scrap(user.loc)
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
