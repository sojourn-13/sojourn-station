
#define HOLD_CASINGS	0 //do not do anything after firing. Manual action, like pump shotguns, or guns that want to define custom behaviour
#define EJECT_CASINGS	1 //drop spent casings on the ground after firing
#define CYCLE_CASINGS 	2 //experimental: cycle casings, like a revolver. Also works for multibarrelled guns


/obj/item/gun/projectile
	name = "gun"
	desc = "A gun that fires bullets."
	icon = 'icons/obj/guns/projectile.dmi'
	icon_state = "revolver"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_STEEL = 1)

	//Racking and chambering
	var/allow_racking = TRUE //Do we allow the racking of the shot?
	var/auto_rack = FALSE
	var/caliber = CAL_MAGNUM		//determines which casings will fit
	var/handle_casings = EJECT_CASINGS	//determines how spent casings should be handled
	var/load_method = SINGLE_CASING|SPEEDLOADER //1 = Single shells, 2 = box or quick loader, 3 = magazine
	var/obj/item/ammo_casing/chambered = null

	//gunporn stuff
	var/unload_sound 	= 'sound/weapons/guns/interact/pistol_magout.ogg'
	var/reload_sound 	= 'sound/weapons/guns/interact/pistol_magin.ogg'
	var/cocked_sound 	= 'sound/weapons/guns/interact/pistol_cock.ogg'
	var/bulletinsert_sound 	= 'sound/weapons/guns/interact/bullet_insert.ogg'
	var/item_suffix = ""		//Allows for variations within the same icon sheet.

	//For SINGLE_CASING or SPEEDLOADER guns
	var/max_shells = 1			//the number of casings that will fit inside As of 3/29/2022 this has to be at lest 1 otherwise the gun can no fire without fire_from_mag
	var/ammo_type = null		//the type of ammo that the gun comes preloaded with
	var/list/loaded = list()	//stored ammo

	//For MAGAZINE guns
	var/magazine_type = null	//the type of magazine that the gun comes preloaded with
	var/obj/item/ammo_magazine/ammo_magazine = null //stored magazine
	var/mag_well = MAG_WELL_GENERIC	//What kind of magazines the gun can load
	var/ammo_mag = "default" // magazines + gun itself. if set to default, then not used
	var/tac_reloads = TRUE	// Enables guns to eject mag and insert new magazine.
	var/fire_from_mag = TRUE //This allows us to fire directly from the mag rather then a loaded list or chamber

	gun_tags = list(GUN_PROJECTILE)

	//Lib sideloading port
	var/perk_plusone_eligible = FALSE //Incase we get shotguns that we dont want to get the oddity interaction
	var/alt_plus_one_loading = FALSE

/obj/item/gun/projectile/loadAmmoBestGuess()
	var/obj/item/ammo_magazine/chosenMag = null

	if(magazine_type)
		return // This gun specifies what it starts with

	for(var/mag in typesof(/obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/castMag = mag

		//log_debug("[mag] - [initial(castMag.mag_well)] , [initial(castMag.caliber)], '[initial(castMag.initial_ammo)]'")

		if(initial(castMag.mag_well) == mag_well && initial(castMag.caliber) == caliber && initial(castMag.initial_ammo) == null)
			if(!chosenMag)
				chosenMag = castMag
			else
				var/obj/item/ammo_casing/casing1      = initial(castMag.ammo_type)
				var/obj/item/projectile/bullet/proj1 = initial(casing1.projectile_type)

				var/obj/item/ammo_casing/casing2      = initial(chosenMag.ammo_type)
				var/obj/item/projectile/bullet/proj2 = initial(casing2.projectile_type)

				if(initial(proj1.damage_types[BRUTE]) > initial(proj2.damage_types[BRUTE]) && initial(castMag.max_ammo) >= initial(chosenMag.max_ammo))
					//log_debug ("updated, replaced [casing2] with [casing1] because [initial(proj2.damage)] > [initial(proj1.damage)]")
					chosenMag = castMag

	if(chosenMag)
		var/obj/item/ammo_magazine/newMag = new chosenMag
		newMag.loc = src
		ammo_magazine = newMag
		update_firemode()
		update_icon()

	return

/obj/item/gun/projectile/Destroy()
	QDEL_NULL(chambered)
	QDEL_NULL(ammo_magazine)
	QDEL_LIST(loaded)
	return ..()

/obj/item/gun/projectile/proc/cock_gun(mob/user)
	set waitfor = 0
	if(cocked_sound)
		sleep(3)
		if(user && loc) playsound(src.loc, cocked_sound, 75, 1)

/obj/item/gun/projectile/consume_next_projectile()
	//get the next casing
	if(loaded.len)
		chambered = loaded[1] //load next casing.
		if(handle_casings != HOLD_CASINGS)
			loaded -= chambered
	else if(ammo_magazine && ammo_magazine.stored_ammo.len && fire_from_mag)
		chambered = ammo_magazine.stored_ammo[1]
		if(handle_casings != HOLD_CASINGS)
			ammo_magazine.stored_ammo -= chambered

	if (chambered)
		return chambered.BB
	return null

/obj/item/gun/projectile/handle_post_fire(mob/user)
	..()
	if(chambered)
		chambered.expend()
		process_chambered()

	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		if(!loaded.len && max_shells)
			loaded += ammo_magazine.stored_ammo[1]
			ammo_magazine.stored_ammo -= loaded

	//Lib sideloading port
	if(!alt_plus_one_loading)
		side_loading(user)

/obj/item/gun/projectile/handle_click_empty(mob/user)
	..()
	process_chambered()

	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		if(!loaded.len && max_shells)
			loaded += ammo_magazine.stored_ammo[1]
			ammo_magazine.stored_ammo -= loaded

	//Lib sideloading port
	if(!alt_plus_one_loading)
		side_loading(user)

/obj/item/gun/projectile/proc/process_chambered()
	if (!chambered) return

	if(chambered.is_caseless)
		QDEL_NULL(chambered)
		return
	// Aurora forensics port, gunpowder residue.
	if(chambered.leaves_residue)
		var/mob/living/carbon/human/H = loc
		if(istype(H))
			if(!H.gloves)
				H.gunshot_residue = chambered.caliber
			else
				var/obj/item/clothing/G = H.gloves
				G.gunshot_residue = chambered.caliber

	switch(handle_casings)
		if(EJECT_CASINGS) //eject casing onto ground.
			chambered.forceMove(get_turf(src))
			for(var/obj/item/ammo_casing/temp_casing in chambered.loc)
				if(temp_casing == chambered)
					continue
				if((temp_casing.desc == chambered.desc) && !temp_casing.BB)
					var/temp_amount = temp_casing.amount + chambered.amount
					if(temp_amount > chambered.maxamount)
						temp_casing.amount -= (chambered.maxamount - chambered.amount)
						chambered.amount = chambered.maxamount
						temp_casing.update_icon()
					else
						chambered.amount = temp_amount
						QDEL_NULL(temp_casing)
					chambered.update_icon()

			playsound(src.loc, casing_sound, 50, 1)
		if(CYCLE_CASINGS) //cycle the casing back to the end.
			if(ammo_magazine)
				ammo_magazine.stored_ammo += chambered
			else
				loaded += chambered

	if(handle_casings != HOLD_CASINGS)
		chambered = null


//Attempts to load A into src, depending on the type of thing being loaded and the load_method
//Maybe this should be broken up into separate procs for each load method?
/obj/item/gun/projectile/proc/load_ammo(var/obj/item/A, mob/user)
	if(istype(A, /obj/item/ammo_magazine))
		var/obj/item/ammo_magazine/AM = A
		if(!(load_method & AM.mag_type) || caliber != AM.caliber)
			to_chat(user, SPAN_WARNING("[AM] won't fit into the magwell. This mag and ammunition inside it is incompatible with \the [src]."))
			return //incompatible

		//How are we trying to apply this magazine to this gun?
		//Its possible for both magazines and guns to support multiple load methods.
		//In the case of that, we use a fixed order to determine whats most desireable
		var/method_for_this_load = 0

		//Magazine loading takes precedence first
		if ((load_method & AM.mag_type) & MAGAZINE)
			method_for_this_load = MAGAZINE
		//Speedloading second
		else if ((load_method & AM.mag_type) & SPEEDLOADER)
			method_for_this_load = SPEEDLOADER
		else if ((load_method & AM.mag_type) & SINGLE_CASING)
			method_for_this_load = SINGLE_CASING
		else
			//Not sure how this could happen, sanity check. Abort and return if none of the above were true
			return

		switch(method_for_this_load)
			if(MAGAZINE)
				if(AM.ammo_mag != ammo_mag && ammo_mag != "default")
					to_chat(user, SPAN_WARNING("[src] requires another magazine.")) // Magazine not defined, might be internal
					return
				if(tac_reloads && ammo_magazine)
					if(!(AM.mag_well & mag_well))
						to_chat(user, SPAN_WARNING("\The [AM] won't fit into the magwell.")) //Prevents an exploit
						return
					else if(replace_item(ammo_magazine, A, user)) // The replace_item() proc already existed, THIS is a proper tac reload and not an Iraqi reload.
						ammo_magazine = A
						update_icon()
						to_chat(user, SPAN_NOTICE("You tactically reload your [src] with [AM]!"))
				else if(ammo_magazine)
					to_chat(user, SPAN_WARNING("\The [src] already has a magazine loaded.")) //already a magazine here, and this type of gun doesn't allow tactical reloads.
					return
				if(!(AM.mag_well & mag_well))
					to_chat(user, SPAN_WARNING("\The [AM] won't fit into the magwell.")) // The gun lacks the proper magwell for this type of mag
					return
				user.remove_from_mob(AM)
				AM.loc = src
				ammo_magazine = AM
				//This is so that when re reload we also add a bullet to the loaded lens, like racking it
				if(ammo_magazine.stored_ammo.len)
					if(!loaded.len && max_shells)
						loaded += ammo_magazine.stored_ammo[1]
						ammo_magazine.stored_ammo -= loaded
				if(reload_sound) playsound(src.loc, reload_sound, 75, 1)
				cock_gun(user)
				update_firemode()
			if(SPEEDLOADER)
			//Soj edit - Badly codes in speed loader to mag form gun
				if(loaded.len >= max_shells)
					if(ammo_magazine)
						if(ammo_magazine.stored_ammo.len >= ammo_magazine.max_ammo)
							to_chat(user, SPAN_WARNING("\The [src] is full!"))
							return
					else
						to_chat(user, SPAN_WARNING("\The [src] is full!"))
						return
				var/count = 0
				if(AM.reload_delay)
					to_chat(user, SPAN_NOTICE("It takes some time to reload \the [src] with \the [AM]..."))
				if (do_after(user, AM.reload_delay, user))
					for(var/obj/item/ammo_casing/C in AM.stored_ammo)
						if(loaded.len >= max_shells)
							break
						if(C.caliber == caliber)
							C.forceMove(src)
							loaded += C
							AM.stored_ammo -= C //should probably go inside an ammo_magazine proc, but I guess less proc calls this way...
							count++
							AM.update_icon()
					for(var/obj/item/ammo_casing/C in AM.stored_ammo)
						if(ammo_magazine.stored_ammo.len >= ammo_magazine.max_ammo)
							break
						if(C.caliber == caliber)
							ammo_magazine.insertCasing(C)
							AM.stored_ammo -= C //should probably go inside an ammo_magazine proc, but I guess less proc calls this way...
							count++
							AM.update_icon()
				if(count)
					user.visible_message("[user] reloads [src].", SPAN_NOTICE("You load [count] round\s into \the [src]."))
					if(reload_sound) playsound(src.loc, reload_sound, 75, 1)
					cock_gun(user)
				update_firemode()
		AM.update_icon()
	else if(istype(A, /obj/item/ammo_casing))
		var/obj/item/ammo_casing/C = A
		if(!(load_method & SINGLE_CASING) || caliber != C.caliber)
			to_chat(user, SPAN_WARNING("\The [src] is incompatible with \the [C]."))
			return //incompatible
		if(loaded.len >= max_shells)
			to_chat(user, SPAN_WARNING("[src] is full."))
			return

		if(C.reload_delay)
			to_chat(user, SPAN_NOTICE("It takes some time to reload \the [src] with \the [C]..."))
		if (!do_after(user, C.reload_delay, user))
			return

		if(C.amount > 1)
			C.amount -= 1
			var/type = C.type
			var/obj/item/ammo_casing/inserted_casing = new type
			inserted_casing.desc = C.desc
			inserted_casing.caliber = C.caliber
			inserted_casing.projectile_type = C.projectile_type
			inserted_casing.icon_state = C.icon_state
			inserted_casing.spent_icon = C.spent_icon
			inserted_casing.is_caseless = C.is_caseless
			inserted_casing.shell_color = C.shell_color
			inserted_casing.maxamount = C.maxamount
			inserted_casing.amount = 1 //Were only taking 1 shell, prevents ammo douping
			//This here makes ot so if were loading in pre-shot sells it dosnt magiclly give it a BB
			if(ispath(inserted_casing.projectile_type) && C.BB)
				inserted_casing.BB = new inserted_casing.projectile_type(inserted_casing)
			else
				inserted_casing.BB = null
			C.update_icon()
			inserted_casing.update_icon()
			loaded.Insert(1, inserted_casing)
		else
			user.remove_from_mob(C)
			C.forceMove(src)
			loaded.Insert(1, C) //add to the head of the list
		update_firemode()
		user.visible_message("[user] inserts \a [C] into [src].", SPAN_NOTICE("You insert \a [C] into \the [src]."))
		if(bulletinsert_sound) playsound(src.loc, bulletinsert_sound, 75, 1)

	update_icon()


//attempts to unload src. If allow_dump is set to 0, the speedloader unloading method will be disabled
/obj/item/gun/projectile/proc/unload_ammo(mob/user, var/allow_dump=1)
	if(ammo_magazine)
		user.put_in_hands(ammo_magazine)

		if(unload_sound)
			playsound(src.loc, unload_sound, 75, 1)
		ammo_magazine.update_icon()
		ammo_magazine = null
	else if(loaded.len)
		//presumably, if it can be speed-loaded, it can be speed-unloaded.
		if(allow_dump && (load_method & SPEEDLOADER))
			var/count = 0
			var/turf/T = get_turf(user)
			if(T)
				for(var/obj/item/ammo_casing/C in loaded)
					C.forceMove(T)
					count++
				loaded.Cut()
			if(count)
				user.visible_message("[user] unloads [src].", SPAN_NOTICE("You unload [count] round\s from \the [src]."))
				if(bulletinsert_sound) playsound(src.loc, bulletinsert_sound, 75, 1)
		else if(load_method & SINGLE_CASING)
			var/obj/item/ammo_casing/C = loaded[loaded.len]
			loaded.len--
			user.put_in_hands(C)
			user.visible_message("[user] removes \a [C] from [src].", SPAN_NOTICE("You remove \a [C] from \the [src]."))
			if(bulletinsert_sound) playsound(src.loc, bulletinsert_sound, 75, 1)
	else
		to_chat(user, SPAN_WARNING("[src] is empty."))
	update_icon()

/obj/item/gun/projectile/attackby(var/obj/item/A as obj, mob/user as mob)
	.=..()
	if (!.) //Parent returns true if attackby is handled
		load_ammo(A, user)

/obj/item/gun/projectile/attack_self(mob/user as mob)
	if(firemodes.len > 1)
		..()
	else
		unload_ammo(user)

/obj/item/gun/projectile/attack_hand(mob/user as mob)
	if(user.get_inactive_hand() == src)
		unload_ammo(user, allow_dump=0)
	else
		return ..()

/obj/item/gun/projectile/MouseDrop(over_object, src_location, over_location)
	..()
	if(src.loc == usr && istype(over_object, /obj/screen/inventory/hand))
		unload_ammo(usr, allow_dump=0)

/obj/item/gun/projectile/afterattack(atom/A, mob/living/user)
	..()
	if(auto_eject && ammo_magazine && ammo_magazine.stored_ammo && !ammo_magazine.stored_ammo.len)
		ammo_magazine.forceMove(get_turf(src.loc))
		user.visible_message(
			"[ammo_magazine] falls out and clatters on the floor!",
			SPAN_NOTICE("[ammo_magazine] falls out and clatters on the floor!")
			)
		if(auto_eject_sound)
			playsound(user, auto_eject_sound, 40, 1)
		ammo_magazine.update_icon()
		ammo_magazine = null
		update_icon() //make sure to do this after unsetting ammo_magazine

/obj/item/gun/projectile/examine(mob/user)
	..(user)
	if(ammo_magazine)
		to_chat(user, "It has \a [ammo_magazine] loaded.")
	to_chat(user, "Has [get_ammo()] round\s remaining.")

	//Sideloading Lib changes
	if(perk_plusone_eligible)
		if(ishuman(user))
			if(user.stats.getPerk(PERK_SIDE_LOADING))
				to_chat(user, SPAN_NOTICE("[name] is eligible for sideloading.")) // Feedback that we can do this
	return

/obj/item/gun/projectile/proc/get_ammo()
	var/bullets = 0
	if(loaded)
		bullets += loaded.len
	if(ammo_magazine && ammo_magazine.stored_ammo)
		bullets += ammo_magazine.stored_ammo.len
//	if(chambered) Soj edit, chamber IS apart of loaded so no doble counting
//		bullets += 1
	return bullets

/obj/item/gun/projectile/proc/get_max_ammo()
	var/bullets = 0
	if (load_method & MAGAZINE)
		if(ammo_magazine)
			bullets += ammo_magazine.max_ammo
	if (load_method & SPEEDLOADER)
		bullets += max_shells
	return bullets

/* Unneeded -- so far.
//in case the weapon has firemodes and can't unload using attack_hand()
/obj/item/gun/projectile/verb/unload_gun()
	set name = "Unload Ammo"
	set category = "Object"
	set src in usr

	if(usr.stat || usr.restrained()) return

	unload_ammo(usr)
*/

/obj/item/gun/projectile/ui_data(mob/user)
	var/list/data = ..()

	var/list/ammo_stats = list()
	ammo_stats += list(list("name" = "Rifled Caliber", "type" = "String", "value" = caliber))
	ammo_stats += list(list("name" = "Ammo Remaining", "type" = "ProgressBar", "value" = get_ammo(), "max" = get_max_ammo()))
	ammo_stats += data["stats"]["Ammo Stats"]
	data["stats"]["Ammo Stats"] = ammo_stats

	return data

/obj/item/gun/projectile/get_dud_projectile()
	var/proj_type
	if(chambered)
		proj_type = chambered.BB.type
	else if(loaded.len)
		var/obj/item/ammo_casing/A = loaded[1]
		if(!A.BB)
			return null
		proj_type = A.BB.type
	else if(ammo_magazine && ammo_magazine.stored_ammo.len)
		var/obj/item/ammo_casing/A = ammo_magazine.stored_ammo[1]
		if(!A.BB)
			return null
		proj_type = A.BB.type
	if(!proj_type)
		return null
	return new proj_type

/obj/item/gun/projectile/refresh_upgrades()
	max_shells = initial(max_shells)
	..()

/obj/item/gun/projectile/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/smg_cock.ogg',20,4)

/obj/item/gun/projectile/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/lmg_magin.ogg',20,4)

//Lib sideloading port
/obj/item/gun/projectile/proc/side_loading(mob/user)
	if(!perk_plusone_eligible && !ishuman(user))
		return

	var/mob/living/carbon/human/H = user
	if(!H.stats.getPerk(PERK_SIDE_LOADING))
		return

	var/otherhands_object = H.get_inactive_hand()
	if(istype(otherhands_object, /obj/item/ammo_casing))
		var/obj/item/ammo_casing/autoload = otherhands_object
		if(autoload.caliber == caliber)
			if(!ammo_magazine)
				load_ammo(autoload, H)
			else
				ammo_magazine.attackby(autoload, user)
