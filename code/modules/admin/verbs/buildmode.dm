/proc/togglebuildmode(mob/M as mob in GLOB.player_list)
	set name = "Toggle Build Mode"
	set category = "Admin.Special"
	if(M.client)
		if(M.client.buildmode)
			log_and_message_admins("[key_name(usr)] has left build mode at \the [jumplink(usr)]") //So we can go to it
			M.client.buildmode = 0
			M.client.show_popup_menus = 1
			for(var/obj/effect/bmode/buildholder/H)
				if(H.cl == M.client)
					qdel(H)
		else
			log_and_message_admins("[key_name(usr)] has entered build mode at \the [jumplink(usr)]") //So we can go to it
			M.client.buildmode = 1
			M.client.show_popup_menus = 0

			var/obj/effect/bmode/buildholder/H = new/obj/effect/bmode/buildholder()
			var/obj/effect/bmode/builddir/A = new/obj/effect/bmode/builddir(H)
			A.master = H
			var/obj/effect/bmode/buildhelp/B = new/obj/effect/bmode/buildhelp(H)
			B.master = H
			var/obj/effect/bmode/buildmode/C = new/obj/effect/bmode/buildmode(H)
			C.master = H
			var/obj/effect/bmode/buildquit/D = new/obj/effect/bmode/buildquit(H)
			D.master = H

			H.builddir = A
			H.buildhelp = B
			H.buildmode = C
			H.buildquit = D
			M.client.screen += A
			M.client.screen += B
			M.client.screen += C
			M.client.screen += D
			H.cl = M.client

/obj/effect/bmode//Cleaning up the tree a bit
	density = 1
	anchored = 1
	plane = ABOVE_HUD_PLANE
	layer = ABOVE_HUD_LAYER
	dir = NORTH
	icon = 'icons/misc/buildmode.dmi'
	var/obj/effect/bmode/buildholder/master = null

/obj/effect/bmode/set_plane(var/np)
	plane = np

/obj/effect/bmode/update_plane()
	return

/obj/effect/bmode/Destroy()
	if(master && master.cl)
		master.cl.screen -= src
	master = null
	return ..()

/obj/effect/bmode/builddir
	icon_state = "build"
	screen_loc = "NORTH,WEST"
	Click()
		switch(dir)
			if(NORTH)
				set_dir(EAST)
			if(EAST)
				set_dir(SOUTH)
			if(SOUTH)
				set_dir(WEST)
			if(WEST)
				set_dir(NORTHWEST)
			if(NORTHWEST)
				set_dir(NORTH)
		return 1

/obj/effect/bmode/buildhelp
	icon = 'icons/misc/buildmode.dmi'
	icon_state = "buildhelp"
	screen_loc = "NORTH,WEST+1"
	Click()
		switch(master.cl.buildmode)
			if(1)
				to_chat(usr, "\blue ***********************************************************")
				to_chat(usr, "\blue Left Mouse Button        = Construct / Upgrade")
				to_chat(usr, "\blue Right Mouse Button       = Deconstruct / Delete / Downgrade")
				to_chat(usr, "\blue Left Mouse Button + ctrl = R-Window")
				to_chat(usr, "\blue Left Mouse Button + alt  = Airlock")
				to_chat(usr, "")
				to_chat(usr, "\blue Use the button in the upper left corner to")
				to_chat(usr, "\blue change the direction of built objects.")
				to_chat(usr, "\blue ***********************************************************")
			if(2)
				to_chat(usr, "\blue ***********************************************************")
				to_chat(usr, "\blue Right Mouse Button on buildmode button = Set object type")
				to_chat(usr, "\blue Middle Mouse Button on buildmode button= On/Off object type saying")
				to_chat(usr, "\blue Middle Mouse Button on turf/obj        = Capture object type")
				to_chat(usr, "\blue Left Mouse Button on turf/obj          = Place objects")
				to_chat(usr, "\blue Right Mouse Button                     = Delete objects")
				to_chat(usr, "")
				to_chat(usr, "\blue Use the button in the upper left corner to")
				to_chat(usr, "\blue change the direction of built objects.")
				to_chat(usr, "\blue ***********************************************************")
			if(3)
				to_chat(usr, "\blue ***********************************************************")
				to_chat(usr, "\blue Right Mouse Button on buildmode button = Select var(type) & value")
				to_chat(usr, "\blue Left Mouse Button on turf/obj/mob      = Set var(type) & value")
				to_chat(usr, "\blue Right Mouse Button on turf/obj/mob     = Reset var's value")
				to_chat(usr, "\blue ***********************************************************")
			if(4)
				to_chat(usr, "\blue ***********************************************************")
				to_chat(usr, "\blue Left Mouse Button on turf/obj/mob      = Select")
				to_chat(usr, "\blue Right Mouse Button on turf/obj/mob     = Throw")
				to_chat(usr, "\blue ***********************************************************")
			if(5)
				to_chat(usr, "\blue ***********************************************************")
				to_chat(usr, "\blue LMB on mob = Select mob")
				to_chat(usr, "\blue Alt LMB on mob = De-select mob")
				to_chat(usr, "\blue Shift LMB on mob = Select Group the mob belongs to")
				to_chat(usr, "\blue RMB on atom = Move selected mobs to position")
				to_chat(usr, "\blue Shift RMB on atom/movable = Move selected mobs to position and, if applicable, set their target to the atom")
				to_chat(usr, "\blue Alt RMB on atom/movable = If applicable, set selected mobs' target to the atom")
				to_chat(usr, "\blue MMB on mob = Add mob to selected group")
				to_chat(usr, "\blue Shift MMB on mob = Remove mob from selected group")
				to_chat(usr, "\blue Shift LMB on build mode icon = Select all mobs in selected group")
				to_chat(usr, "\blue Alt LMB on build mode icon = De-select all mobs")
				to_chat(usr, "\blue RMB on build mode icon = Toggle movement override, forcing all other walks to fail for a given period of time")
				to_chat(usr, "\blue Alt RMB on build mode icon = Toggle walks respecting currently running overrides")
				to_chat(usr, "\blue Ctrl RMB on build mode icon = Toggle walks being temporary")
				to_chat(usr, "\blue Shift RMB on build mode icon = Toggle moving dead mobs")
				to_chat(usr, "\blue MMB on build mode icon = Enter key of group you wish to select")
				to_chat(usr, "\blue Shift MMB on build mode icon = Enter key of group you wish to delete")
				to_chat(usr, "\blue Alt MMB on build mode icon = Add all selected mobs to selected group")
				to_chat(usr, "\blue ***********************************************************")
		return 1

/obj/effect/bmode/buildquit
	icon_state = "buildquit"
	screen_loc = "NORTH,WEST+3"

	Click()
		togglebuildmode(master.cl.mob)
		return 1

/obj/effect/bmode/buildholder
	density = 0
	anchored = 1
	var/client/cl = null
	/// List of mobs. Used for pathmode, every mob in here will be controlled if the user decides to make them move or target.
	var/list/selected_mobs = list()
	var/obj/effect/bmode/builddir/builddir = null
	var/obj/effect/bmode/buildhelp/buildhelp = null
	var/obj/effect/bmode/buildmode/buildmode = null
	var/obj/effect/bmode/buildquit/buildquit = null
	var/atom/movable/throw_atom = null

/obj/effect/bmode/buildholder/New()

	GLOB.buildholders += src

	. = ..()


/obj/effect/bmode/buildholder/Destroy()

	GLOB.buildholders -= src

	qdel(builddir)
	builddir = null
	qdel(buildhelp)
	buildhelp = null
	qdel(buildmode)
	buildmode = null
	qdel(buildquit)
	buildquit = null
	throw_atom = null
	cl = null

	for (var/mob/living/entity in selected_mobs)
		entity.selected_by -= src
	selected_mobs.Cut()
	return ..()

/obj/effect/bmode/buildmode
	icon_state = "buildmode1"
	screen_loc = "NORTH,WEST+2"
	var/varholder = "name"
	var/valueholder = "derp"
	var/objholder = /obj/structure/closet
	var/objsay = 1
	/// The key of the mob group we have currently selected. See admin.dm for the documentation on the list that contains the assoc lists.
	var/listname = null
	/// When we move our master's selected mobs, do their walks take priority over all other walks?
	var/override_movement = TRUE
	/// Are our walks temporary, do they expire on their own?
	var/temporary_walks = TRUE
	/// Do we forbid dead movement?
	var/deathcheck = TRUE
	/// Do we respect overrides?
	var/respect_overrides = FALSE

	Click(location, control, params)
		var/list/pa = params2list(params)

		if(pa.Find("middle"))
			switch(master.cl.buildmode)
				if(2)
					objsay=!objsay
				if(5)
					if ((pa.Find("shift")) || (pa.Find("alt")))
						if (pa.Find("shift"))
							var/list_to_delete = input(usr, "Enter the name of the list you want to delete:", "Name", "")
							if (!(list_to_delete == ""))
								if (list_to_delete in GLOB.mob_groups)
									var/list/target_list = GLOB.mob_groups[list_to_delete]
									for (var/mob/living/content in target_list)
										content.groups_in -= list_to_delete
									GLOB.mob_groups -= list_to_delete
									target_list.Cut()
									to_chat(usr, "[list_to_delete] successfully deleted.")
								else
									to_chat(usr, SPAN_WARNING("[list_to_delete] does not exist!"))
						else if (pa.Find("alt"))
							if (listname)
								if (!(listname in GLOB.mob_groups))
									GLOB.mob_groups[listname] = list()
									to_chat(usr, "[listname] successfully created as a list.")
								var/list/target_list = GLOB.mob_groups[listname]
								for (var/mob/living/entity in master.selected_mobs)
									if (!(entity in target_list))
										target_list += entity
										entity.groups_in += listname

								to_chat(usr, "New length of [listname]: [target_list.len]")
							else
								to_chat(usr, SPAN_WARNING("You don't have any group selected!"))
					else
						var/listname_temp = input(usr, "Enter the name of the list you wish to manipulate:", "Name", "")
						if (!(listname_temp == ""))
							if (listname_temp in GLOB.mob_groups)
								to_chat(usr, "[listname_temp] selected.")
							else
								to_chat(usr, "Notice: [listname_temp] does not exist. Attempting to add something to it will create it.")
							listname = listname_temp
						else
							listname = null
							to_chat(usr, "Successfully de-selected any currently selected group.")


		if(pa.Find("left"))
			switch(master.cl.buildmode)
				if(1)
					master.cl.buildmode = 2
					src.icon_state = "buildmode2"
				if(2)
					master.cl.buildmode = 3
					src.icon_state = "buildmode3"
				if(3)
					master.cl.buildmode = 4
					src.icon_state = "buildmode4"
				if(4)
					master.cl.buildmode = 5
					src.icon_state = "buildmode5"
				if(5)
					if ((pa.Find("alt")) || (pa.Find("shift")))
						if (pa.Find("alt"))
							for (var/mob/living/entity in master.selected_mobs)
								entity.selected_by -= master
							master.selected_mobs.Cut()
							to_chat(usr, "Successfully de-selected all selected mobs.")
						else if (pa.Find("shift"))
							if (listname)
								if (listname in GLOB.mob_groups)
									for (var/mob/living/entity in GLOB.mob_groups[listname])
										if (!(entity in master.selected_mobs))
											master.selected_mobs += entity
											entity.selected_by += master
									var/list/target_list = GLOB.mob_groups[listname]
									to_chat(usr, "Successfully selected all mobs in [target_list]. New length of selected mobs: [master.selected_mobs.len]")
								else
									to_chat(usr, SPAN_WARNING("[listname] does not exist!"))
							else
								to_chat(usr, SPAN_WARNING("You do not have any currently selected group!"))
					else
						master.cl.buildmode = 1
						src.icon_state = "buildmode1"

		else if(pa.Find("right"))
			switch(master.cl.buildmode)
				if(1)
					return 1
				if(2)
					objholder = text2path(input(usr,"Enter typepath:" ,"Typepath","/obj/structure/closet"))
					if(!ispath(objholder))
						objholder = /obj/structure/closet
						alert("That path is not allowed.")
					else
						if(ispath(objholder,/mob) && !check_rights(R_DEBUG,0))
							objholder = /obj/structure/closet
				if(3)
					var/list/locked = list("vars", "key", "ckey", "client", "firemut", "ishulk", "telekinesis", "xray", "cuffed", "ka", "last_eaten", "urine")

					master.buildmode.varholder = input(usr,"Enter variable name:" ,"Name", "name")
					if(master.buildmode.varholder in locked && !check_rights(R_DEBUG,0))
						return 1
					var/thetype = input(usr,"Select variable type:" ,"Type") in list("text","number","mob-reference","obj-reference","turf-reference")
					if(!thetype) return 1
					switch(thetype)
						if("text")
							master.buildmode.valueholder = input(usr,"Enter variable value:" ,"Value", "value") as text
						if("number")
							master.buildmode.valueholder = input(usr,"Enter variable value:" ,"Value", 123) as num
						if("mob-reference")
							master.buildmode.valueholder = input(usr,"Enter variable value:" ,"Value") as mob in SSmobs.mob_list
						if("obj-reference")
							master.buildmode.valueholder = input(usr,"Enter variable value:" ,"Value") as obj in world
						if("turf-reference")
							master.buildmode.valueholder = input(usr,"Enter variable value:" ,"Value") as turf in world
				if(5)
					if ((pa.Find("ctrl")) || (pa.Find("alt")) || (pa.Find("shift")))
						if (pa.Find("ctrl"))
							temporary_walks = (!(temporary_walks))
							to_chat(usr, "Toggled temporary walks to [temporary_walks].")
						else if (pa.Find("alt"))
							respect_overrides = (!(respect_overrides))
							to_chat(usr, "Toggled respect override to [respect_overrides].")
						else if (pa.Find("shift"))
							deathcheck = (!(deathcheck))
							to_chat(usr, "Toggled dead movement to [!deathcheck].")
					else
						override_movement = (!(override_movement))
						to_chat(usr, "Toggled movement override to [override_movement].")

    	return 1

/proc/build_click(var/mob/user, buildmode, params, var/obj/object)
	var/obj/effect/bmode/buildholder/holder = null
	for(var/obj/effect/bmode/buildholder/H in GLOB.buildholders)
		if(H.cl == user.client)
			holder = H
			break
	if(!holder) return
	var/list/pa = params2list(params)

	switch(buildmode)
		if(1)
			if(istype(object,/turf) && pa.Find("left") && !pa.Find("alt") && !pa.Find("ctrl") )
				if(istype(object,/turf/space))
					var/turf/T = object
					T.ChangeTurf(/turf/simulated/floor)
					return
				if(istype(object,/turf/simulated/open))
					var/turf/T = object
					T.ChangeTurf(/turf/simulated/floor)
					return
				else if(istype(object,/turf/simulated/floor))
					var/turf/T = object
					T.ChangeTurf(/turf/simulated/wall)
					return
				else if(istype(object,/turf/simulated/wall))
					var/turf/T = object
					T.ChangeTurf(/turf/simulated/wall/r_wall)
					return
			else if(pa.Find("right"))
				if(istype(object,/turf/simulated/wall))
					var/turf/T = object
					T.ChangeTurf(/turf/simulated/floor)
					return
				else if(istype(object,/turf/simulated/floor))
					var/turf/T = object
					T.ChangeTurf(/turf/space)
					return
				else if(istype(object,/turf/simulated/wall/r_wall))
					var/turf/T = object
					T.ChangeTurf(/turf/simulated/wall)
					return
				else if(isobj(object))
					qdel(object)
					return
			else if(istype(object,/turf) && pa.Find("alt") && pa.Find("left"))
				new/obj/machinery/door/airlock(get_turf(object))
			else if(istype(object,/turf) && pa.Find("ctrl") && pa.Find("left"))
				switch(holder.builddir.dir)
					if(NORTH)
						var/obj/structure/window/reinforced/WIN = new/obj/structure/window/reinforced(get_turf(object))
						WIN.set_dir(NORTH)
					if(SOUTH)
						var/obj/structure/window/reinforced/WIN = new/obj/structure/window/reinforced(get_turf(object))
						WIN.set_dir(SOUTH)
					if(EAST)
						var/obj/structure/window/reinforced/WIN = new/obj/structure/window/reinforced(get_turf(object))
						WIN.set_dir(EAST)
					if(WEST)
						var/obj/structure/window/reinforced/WIN = new/obj/structure/window/reinforced(get_turf(object))
						WIN.set_dir(WEST)
					if(NORTHWEST)
						var/obj/structure/window/reinforced/WIN = new/obj/structure/window/reinforced(get_turf(object))
						WIN.set_dir(NORTHWEST)
		if(2)
			if(pa.Find("left"))
				if(ispath(holder.buildmode.objholder,/turf))
					var/turf/T = get_turf(object)
					T.ChangeTurf(holder.buildmode.objholder)
				else
					var/obj/A = new holder.buildmode.objholder (get_turf(object))
					A.set_dir(holder.builddir.dir)
			else if(pa.Find("right"))
				if(isobj(object) && (!(istype(object, /obj/effect/bmode)))) //you fools
					qdel(object)
			if(pa.Find("middle"))
				holder.buildmode.objholder = text2path("[object.type]")
				if(holder.buildmode.objsay)	to_chat(usr, "[object.type]")


		if(3)
			if(pa.Find("left")) //I cant believe this shit actually compiles.
				if(object.vars.Find(holder.buildmode.varholder))
					log_admin("[key_name(usr)] modified [object.name]'s [holder.buildmode.varholder] to [holder.buildmode.valueholder]")
					object.vars[holder.buildmode.varholder] = holder.buildmode.valueholder
				else
					to_chat(usr, "\red [initial(object.name)] does not have a var called '[holder.buildmode.varholder]'")
			if(pa.Find("right"))
				if(object.vars.Find(holder.buildmode.varholder))
					log_admin("[key_name(usr)] modified [object.name]'s [holder.buildmode.varholder] to [holder.buildmode.valueholder]")
					object.vars[holder.buildmode.varholder] = initial(object.vars[holder.buildmode.varholder])
				else
					to_chat(usr, "\red [initial(object.name)] does not have a var called '[holder.buildmode.varholder]'")

		if(4)
			if(pa.Find("left"))
				if(istype(object, /atom/movable))
					holder.throw_atom = object
			if(pa.Find("right"))
				if(holder.throw_atom)
					holder.throw_atom.throw_at(object, 10, 1)
					log_admin("[key_name(usr)] threw [holder.throw_atom] at [object]")

		if(5)
			if (pa.Find("left"))
				if (istype(object, /mob/living))
					var/mob/living/living_object = object
					if (pa.Find("shift") || pa.Find("alt"))
						if (pa.Find("shift"))
							var/in_group = FALSE
							for (var/entry in GLOB.mob_groups)
								var/list/list_in_list = GLOB.mob_groups[entry]
								if (living_object in list_in_list)
									in_group = TRUE
									for (var/mob/living/entity in list_in_list)
										if (!(entity in holder.selected_mobs))
											holder.selected_mobs += entity
											entity.selected_by += holder
									to_chat(usr, "Selected group ([entry]) successfully, length, [list_in_list.len].")
									to_chat(usr, "New length of selected mobs: [holder.selected_mobs.len]")
									break
							if (!in_group)
								to_chat(usr, "\the [living_object] is not part of any group.")
						else if (pa.Find("alt"))
							if (living_object in holder.selected_mobs)
								holder.selected_mobs -= living_object
								living_object.selected_by -= holder
								to_chat(usr, "Successfully de-selected [living_object], new selected mob length is [holder.selected_mobs.len].")
							else
								to_chat(usr, SPAN_WARNING("[living_object] is not selected!"))


					else if (!(living_object in holder.selected_mobs))
						holder.selected_mobs += living_object
						living_object.selected_by += holder
						to_chat(usr, "Successfully selected [living_object], new selected mob length is [holder.selected_mobs.len].")
					else
						to_chat(usr, SPAN_WARNING("[living_object] is already selected!"))

			else if (pa.Find("right"))
				var/distance = null
				var/set_target = FALSE
				var/move_to_target = TRUE
				if (istype(object, /atom/movable))
					if ((pa.Find("shift")) || (pa.Find("alt")))
						set_target = TRUE
						if (!(pa.Find("shift")))
							move_to_target = FALSE
					distance = 1
				else if (istype(object, /turf))
					distance = 0
				if (!(isnull(distance)))
					for (var/mob/living/held in holder.selected_mobs)
						if (set_target)
							if (issuperioranimal(held))
								var/mob/living/carbon/superior_animal/superior_held = held
								superior_held.loseTarget(FALSE, TRUE)
								superior_held.target_mob = WEAKREF(object)
							else if (istype(held, /mob/living/simple_animal))
								var/mob/living/simple_animal/simple_held = held
								simple_held.target_mob = WEAKREF(object)
								if (istype(simple_held, /mob/living/simple_animal/hostile))
									var/mob/living/simple_animal/hostile/hostile_held = simple_held
									hostile_held.stance = HOSTILE_STANCE_ATTACKING

						if (move_to_target)
							held.set_glide_size(DELAY2GLIDESIZE(held.move_to_delay))
							var/timer
							if (holder.buildmode.temporary_walks)
								timer = ((get_dist(held, object) * (held.move_to_delay * 1.2)) + 2) //warning: arbitrary math
							var/movement_flags
							if (!(held.move_packet))
								movement_flags |= MOVEMENT_LOOP_START_FAST
						//	if (!(holder.buildmode.respect_overrides))
						//		movement_flags |= MOVEMENT_LOOP_IGNORE_PRIORITY
							var/movement_priority = MOVEMENT_DEFAULT_PRIORITY
							if (holder.buildmode.override_movement)
								movement_priority = MOVEMENT_PATHMODE_PRIORITY
							if (!(holder.buildmode.deathcheck) || held.stat != DEAD)
								SSmove_manager.move_to(held, object, distance, held.move_to_delay, timer, priority = movement_priority, flags = movement_flags)
						held.AI_inactive = 0
						held.life_cycles_before_scan = initial(held.life_cycles_before_scan)
						held.life_cycles_before_sleep = initial(held.life_cycles_before_sleep)

			else if (pa.Find("middle"))
				if (istype(object, /mob/living))
					var/mob/living/selected_mob = object
					if (holder.buildmode.listname)
						if (pa.Find("shift"))
							if (holder.buildmode.listname in GLOB.mob_groups)
								if (selected_mob in GLOB.mob_groups[holder.buildmode.listname])
									GLOB.mob_groups[holder.buildmode.listname] -= selected_mob
									var/list/list_var = GLOB.mob_groups[holder.buildmode.listname]
									to_chat(usr, "[selected_mob] successfully removed from [holder.buildmode.listname], new length [list_var.len].")
								else
									to_chat(usr, SPAN_WARNING("[selected_mob] is not in [holder.buildmode.listname]!"))
							else
								to_chat(usr, SPAN_WARNING("[holder.buildmode.listname] does not exist!"))

						else if (!(holder.buildmode.listname in GLOB.mob_groups))
							GLOB.mob_groups[holder.buildmode.listname] = list()
							to_chat(usr, "[holder.buildmode.listname] successfully created as a list.")
						if (!(selected_mob in GLOB.mob_groups[holder.buildmode.listname]))
							GLOB.mob_groups[holder.buildmode.listname] += selected_mob
							selected_mob.groups_in += holder.buildmode.listname
							var/list/list_var = GLOB.mob_groups[holder.buildmode.listname]
							to_chat(usr, "[selected_mob] successfully added to [holder.buildmode.listname], new length [list_var.len].")
						else
							to_chat(usr, SPAN_WARNING("[selected_mob] is already part of [holder.buildmode.listname]!"))
					else
						to_chat(usr, SPAN_WARNING("You do not have any currently selected group!"))


