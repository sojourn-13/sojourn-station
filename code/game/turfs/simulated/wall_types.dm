/turf/simulated/wall/r_wall
	icon_state = "rgeneric"

/turf/simulated/wall/r_wall/New(var/newloc)
	..(newloc, MATERIAL_PLASTEEL, MATERIAL_PLASTEEL) //3strong

/turf/simulated/wall/cult
	icon_state = "cult"

/turf/simulated/wall/cult/New(var/newloc)
	..(newloc,"cult","cult2")

/turf/unsimulated/wall/cult
	name = "cult wall"
	desc = "Hideous images dance beneath the surface."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "cult"

/turf/simulated/wall/tomb_king
	name = "strange wall"
	desc = "A reinforced wall painted obsidian and gold, glyphs and strange depictions of unknown tales told in images decorate the base."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "Nashef_standard"
	icon_base = "Nashef_standard"
	icon_base_override = "Nashef_standard"
	icon_base_reinf = "Nashef_reinforced"

/turf/simulated/wall/tomb_king/New(var/newloc)
	..(newloc, MATERIAL_STEEL)

/turf/simulated/wall/church
	name = "church wall"
	desc = "A reinforced wall with golden triming, latin and with faithful depictions of tales told in images decorate the base."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "church_standard"
	icon_base = "church_standard"
	icon_base_override = "church_standard"
	icon_base_reinf = "church_reinforced"
	base_color_override = "#FFFFFF"
	reinf_color_override = "#FFFFFF"

/turf/simulated/wall/church/New(var/newloc)
	..(newloc, MATERIAL_STEEL)

/turf/simulated/wall/church_reinforced
	name = "church wall"
	desc = "A reinforced wall with golden triming, latin and with faithful depictions of tales told in images decorate the base."
	icon_state = "church_reinforced"
	icon_base_override = "church_standard"
	icon_base_reinf_override = "church_reinforced"
	icon = 'icons/turf/wall_masks.dmi'
	base_color_override = "#FFFFFF"
	reinf_color_override = "#FFFFFF"

/turf/simulated/wall/church_reinforced/New(var/newloc)
	..(newloc, MATERIAL_PLASTEEL, MATERIAL_PLASTEEL) //3strong

/turf/simulated/wall/rock
	name = "rock wall"
	desc = "A wall of rocks."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "rockold"

/turf/simulated/wall/rock/snow
	name = "snowy rock face"
	desc = "A wall of cold rocks. Everything is like this over here..."
	icon = 'icons/turf/wall_masks.dmi'
	icon_state = "snowwall"
	icon_base_override = "snowwall"
	base_color_override = "#FFFFFF"
	reinf_color_override = "#FFFFFF"

//Shuttle Floors
/obj/landed_holder
	name = "landed turf holder"
	desc = "holds all the info about the turf this turf 'landed on'"
	var/turf/turf_type
	var/turf/simulated/shuttle/my_turf
	var/image/turf_image
	var/list/decals

	New(var/location = null, var/turf/simulated/shuttle/turf)
		..(null)
		my_turf = turf

/obj/landed_holder/proc/land_on(var/turf/T)
	//Gather destination information
	var/obj/landed_holder/new_holder = new(null)
	new_holder.turf_type = T.type
	new_holder.dir = T.dir
	new_holder.icon = T.icon
	new_holder.icon_state =  T.icon_state
	new_holder.copy_overlays(T, TRUE)
	new_holder.underlays = T.underlays.Copy()
	new_holder.decals = T.decals ? T.decals.Copy() : null

	//Set the destination to be like us
	T.Destroy()
	var/turf/simulated/shuttle/new_dest = T.ChangeTurf(my_turf.type,,1)
	new_dest.set_dir(my_turf.dir)
	new_dest.icon_state = my_turf.icon_state
	new_dest.icon = my_turf.icon
	new_dest.copy_overlays(my_turf, TRUE)
	new_dest.underlays = my_turf.underlays
	new_dest.decals = my_turf.decals
	//Shuttle specific stuff
	new_dest.interior_corner = my_turf.interior_corner
	new_dest.takes_underlays = my_turf.takes_underlays
	new_dest.under_turf = my_turf.under_turf
	new_dest.join_flags = my_turf.join_flags
	new_dest.join_group = my_turf.join_group

	// Associate the holder with the new turf.
	new_holder.my_turf = new_dest
	new_dest.landed_holder = new_holder

	//Update underlays if necessary (interior corners won't have changed).
	if(new_dest.takes_underlays && !new_dest.interior_corner)
		new_dest.underlay_update()

	return new_dest

/obj/landed_holder/proc/leave_turf()
	var/turf/new_source
	//Change our source to whatever it was before
	if(turf_type)
		new_source = my_turf.ChangeTurf(turf_type,,1)
		new_source.set_dir(dir)
		new_source.icon_state = icon_state
		new_source.icon = icon
		new_source.copy_overlays(src, TRUE)
		new_source.underlays = underlays
		new_source.decals = decals
	else
		new_source = my_turf.ChangeTurf(get_base_turf_by_area(my_turf),,1)

	return new_source

/turf/simulated/shuttle
	name = "shuttle"
	icon = 'icons/turf/shuttle_white.dmi'
	thermal_conductivity = 0.05
	heat_capacity = 0

	var/obj/landed_holder/landed_holder
	var/interior_corner = 0
	var/takes_underlays = 0
	var/turf/under_turf //Underlay override turf path.
	var/join_flags = 0 //Bitstring to represent adjacency of joining walls
	var/join_group = "shuttle" //A tag for what other walls to join with. Null if you don't want them to.

/turf/simulated/shuttle/Destroy()
	landed_holder = null
	..()

/turf/simulated/shuttle/wall
	name = "wall"
	icon_state = "wall1"
	opacity = 1
	density = TRUE
	blocks_air = TRUE

/turf/simulated/shuttle/wall/cargo
	name = "Cargo Transport Shuttle (A5)"
	icon = 'icons/turf/shuttlecargo.dmi'
	icon_state = "cargoshwall1"

/turf/simulated/shuttle/wall/escpod
	name = "Shuttle Pod"
	icon = 'icons/turf/shuttleescpod.dmi'
	icon_state = "escpodwall1"

/turf/simulated/shuttle/wall/mining
	name = "The Rocinante"
	icon = 'icons/turf/shuttlemining.dmi'
	icon_state = "11,23"

/turf/simulated/shuttle/wall/science //I guess this got repurposed into the Marshal shuttle soooooo-
	name = "The Vasiliy"
	icon = 'icons/turf/shuttlescience.dmi'
	icon_state = "6,18"

/obj/structure/shuttle_part //For placing them over space, if sprite covers not whole tile.
	name = "shuttle"
	icon = 'icons/turf/shuttle.dmi'
	anchored = 1
	density = TRUE

	atmos_canpass = CANPASS_DENSITY

/obj/structure/shuttle_part/cargo
	name = "Cargo Transport Shuttle (A5)"
	icon = 'icons/turf/shuttlecargo.dmi'
	icon_state = "cargoshwall1"

/obj/structure/shuttle_part/escpod
	name = "Shuttle Pod"
	icon = 'icons/turf/shuttleescpod.dmi'
	icon_state = "escpodwall1"

/obj/structure/shuttle_part/mining
	name = "The Rocinante"
	icon = 'icons/turf/shuttlemining.dmi'
	icon_state = "11,23"

/obj/structure/shuttle_part/science
	name = "Science Shuttle"
	icon = 'icons/turf/shuttlescience.dmi'
	icon_state = "6,18"

/obj/structure/shuttle_part/ex_act(severity) //Making them indestructible, like shuttle walls
    return 0

/turf/simulated/wall/iron/New(var/newloc)
	..(newloc,MATERIAL_IRON)
/turf/simulated/wall/uranium/New(var/newloc)
	..(newloc,MATERIAL_URANIUM)
/turf/simulated/wall/diamond/New(var/newloc)
	..(newloc,MATERIAL_DIAMOND)
/turf/simulated/wall/gold/New(var/newloc)
	..(newloc,MATERIAL_GOLD)
/turf/simulated/wall/silver/New(var/newloc)
	..(newloc,MATERIAL_SILVER)
/turf/simulated/wall/plasma/New(var/newloc)
	..(newloc,MATERIAL_PLASMA)
/turf/simulated/wall/durasteel/New(var/newloc)
	..(newloc,MATERIAL_DURASTEEL)
/turf/simulated/wall/sandstone/New(var/newloc)
	..(newloc,MATERIAL_SANDSTONE)
/turf/simulated/wall/ironplasma/New(var/newloc)
	..(newloc,MATERIAL_IRON,MATERIAL_PLASMA)
/turf/simulated/wall/golddiamond/New(var/newloc)
	..(newloc,MATERIAL_GOLD,MATERIAL_DIAMOND)
/turf/simulated/wall/silvergold/New(var/newloc)
	..(newloc,MATERIAL_SILVER,MATERIAL_GOLD)
/turf/simulated/wall/sandstonediamond/New(var/newloc)
	..(newloc,MATERIAL_SANDSTONE,MATERIAL_DIAMOND)
/turf/simulated/wall/wood/New(var/newloc)
	..(newloc,MATERIAL_WOOD)

/turf/simulated/wall/cloth/New(var/newloc)
	..(newloc,MATERIAL_CLOTH)


/turf/simulated/wall/marble/New(var/newloc)
	..(newloc,MATERIAL_MARBLE)

/turf/simulated/wall/marble/dark/New(var/newloc)
	..(newloc,MATERIAL_MARBLE)
	base_color = "#333333"

/turf/simulated/wall/wood
	icon_state = "wood"
	icon_base_override = "wood"
	base_color_override = "#FFFFFF"
	reinf_color_override = "#FFFFFF"

/turf/simulated/wall/wood_old
	icon_state = "oldwood"
	icon_base_override = "oldwood"
	base_color_override = "#FFFFFF"
	reinf_color_override = "#FFFFFF"

/turf/simulated/wall/wood_barrel
	icon_state = "woodenwall"
	icon_base_override = "woodenwall"
	base_color_override = "#FFFFFF"
	reinf_color_override = "#FFFFFF"

/turf/simulated/wall/wood_barrel/New(var/newloc)
	..(newloc, MATERIAL_WOOD)

/turf/simulated/wall/wood/New(var/newloc)
	..(newloc, MATERIAL_WOOD)

/turf/simulated/wall/wood_old/New(var/newloc)
	..(newloc, MATERIAL_WOOD)

// Kind of wondering if this is going to bite me in the butt.
/turf/simulated/wall/voxshuttle/New(var/newloc)
	..(newloc, MATERIAL_VOXALLOY)
/turf/simulated/wall/voxshuttle/attackby()
	return
/turf/simulated/wall/titanium/New(var/newloc)
	..(newloc, MATERIAL_VOXALLOY)


//Untinted walls have white color, all their coloring is built into their sprite and they should really not be given a tint, it'd look awful
/turf/simulated/wall/untinted
	base_color_override = "#FFFFFF"
	reinf_color_override = "#FFFFFF"

/*
	greyson positronic/Alliance walls, for use on derelict stuff
*/
/turf/simulated/wall/untinted/onestar
	icon_state = "onestar_standard"
	icon_base_override = "onestar_standard"


/turf/simulated/wall/untinted/onestar/New(var/newloc)
	..(newloc, MATERIAL_STEEL)


/turf/simulated/wall/untinted/onestar_reinforced
	icon_state = "onestar_reinforced"
	icon_base_override = "onestar_standard"
	icon_base_reinf_override = "onestar_reinforced"

/turf/simulated/wall/untinted/onestar_reinforced/New(var/newloc)
	..(newloc, MATERIAL_STEEL,MATERIAL_STEEL)


/turf/simulated/shuttle/proc/underlay_update()
	if(!takes_underlays)
		//Basically, if it's not forced, and we don't care, don't do it.
		return 0

	var/turf/under //May be a path or a turf
	var/mutable_appearance/us = new(src) //We'll use this for changes later
	us.underlays.Cut()

	//Mapper wanted something specific
	if(under_turf)
		under = under_turf

	//Well if this isn't our first rodeo, we know EXACTLY what we landed on, and it looks like this.
	if(landed_holder && !interior_corner)
		var/mutable_appearance/landed_on = new(landed_holder)
		landed_on.layer = FLOAT_LAYER //Not turf
		landed_on.plane = FLOAT_PLANE //Not turf
		us.underlays = list(landed_on)
		appearance = us
		return

	if(!under)
		var/turf/T1
		var/turf/T2
		var/turf/T3

		T1 = get_step(src, turn(join_flags,135)) // 45 degrees before opposite
		T2 = get_step(src, turn(join_flags,225)) // 45 degrees beyond opposite
		T3 = get_step(src, turn(join_flags,180)) // Opposite from the diagonal

		if(isfloor(T1) && ((T1.type == T2.type) || (T1.type == T3.type)))
			under = T1
		else if(isfloor(T2) && T2.type == T3.type)
			under = T2
		else if(isfloor(T3) || istype(T3,/turf/space/transit))
			under = T3
		else
			under = get_base_turf_by_area(src)

	if(istype(under,/turf/simulated/shuttle))
		interior_corner = 1 //Prevents us from 'landing on grass' and having interior corners update.

	var/mutable_appearance/under_ma

	if(ispath(under)) //It's just a mapper-specified path
		under_ma = new()
		under_ma.icon = initial(under.icon)
		under_ma.icon_state = initial(under.icon_state)
		under_ma.color = initial(under.color)

	else //It's a real turf
		under_ma = new(under)

	if(under_ma)
		if(ispath(under,/turf/space)) //Scramble space turfs
			under_ma.icon_state = "[rand(1,25)]"
		us.underlays = list(under_ma)

	appearance = us

	return under
