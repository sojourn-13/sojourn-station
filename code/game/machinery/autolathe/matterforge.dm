#define ERR_OK 0
#define ERR_NOTFOUND "not found"
#define ERR_NOMATERIAL "no material"
#define ERR_PAUSED "paused"

/obj/machinery/matter_nanoforge
	name = "Matter NanoForge"
	desc = "It consumes items and produces compressed matter. Objects produced by it are made up of compressed matter that can not be broken back down for their material value."
	icon = 'icons/obj/machines/matterforge.dmi'
	icon_state = "techprint"
	density = TRUE
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	use_power = NO_POWER_USE

	circuit = /obj/item/circuitboard/matter_nanoforge

	var/list/stored_material = list()
	var/obj/power_source
	var/storage_capacity = 1000
	var/unfolded
	var/list/lst = list()

	var/working = FALSE
	var/paused = FALSE
	var/error
	var/progress = 0

	var/datum/design/current_design
	var/list/queue = list()
	var/queue_max = 8

	var/list/disk_list = list(
		/obj/item/pc_part/drive/disk/design/nanoforge
	)
	var/list/design_list = list()
	var/speed = 2
	var/mat_efficiency = 1

	var/list/unsuitable_materials = list(MATERIAL_BIOMATTER)

	var/global/list/error_messages = list(
		ERR_NOTFOUND = "Design data not found.",
		ERR_NOMATERIAL = "Not enough materials.",
		ERR_NOREAGENT = "Not enough reagents.",
		ERR_PAUSED = "**Construction Paused**"
	)
	var/tmp/obj/effect/flicker_overlay/image_load
	var/tmp/obj/effect/flicker_overlay/image_load_material

/obj/machinery/matter_nanoforge/proc/get_designs()
	for (var/f in disk_list)
		design_list.Add(find_files_by_disk(f))

/obj/machinery/matter_nanoforge/proc/find_files_by_disk(typepath)
	var/list/files = list()
	var/obj/item/pc_part/drive/disk/design/c = new typepath
	for(var/f in c.designs)
		var/datum/design/design_object = new f
		design_object.AssembleDesignInfo()
		var/total_mat = 0
		for(var/dmat in design_object.materials)
			total_mat = total_mat +  ((1 - lst[dmat]) * 10) + design_object.materials[dmat]
		design_object.materials = list(MATERIAL_COMPRESSED_MATTER = total_mat)
		var/datum/design/reference = SSresearch.get_design(f)
		var/reference_icon = reference.nano_ui_data["icon"]
		if (!reference_icon)
			continue
		design_object.AssembleDesignUIData()
		design_object.nano_ui_data["icon"] = reference_icon
		files.Add(design_object)
	qdel(c)
	return files

/obj/machinery/matter_nanoforge/ui_assets(mob/user)
	if(user?.client?.get_preference_value(/datum/client_preference/tgui_toaster) == GLOB.PREF_YES)
		return list()
	return list(
		get_asset_datum(/datum/asset/spritesheet_batched/design_icons)
	)

/obj/machinery/matter_nanoforge/ui_interact(mob/user, datum/tgui/ui)
	if(!check_user(user))
		return

	if(!design_list?.len)
		get_designs()

	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Matterforge", name)
		ui.open()

/obj/machinery/matter_nanoforge/ui_act(action, params)
	. = ..()
	if(.)
		return

	switch(action)
		if("insert_material")
			if(power_source)
				eat(usr)
				. = TRUE
			else
				to_chat(usr, SPAN_WARNING("\The [src] does not have any artifact powering it."))
				. = FALSE

		if("eject_material")
			if(!current_design || paused || error)
				var/material = params["id"]
				var/material/M = get_material_by_name(material)

				if(!M.stack_type)
					return FALSE

				var/num = input("Enter sheets number to eject. 0-[stored_material[material]]","Eject",0) as num
				if(!CanUseTopic(usr))
					return FALSE

				num = min(max(num,0), stored_material[material])
				eject(num)
				. = TRUE

		if("add_to_queue")
			var/recipe = params["id"]
			var/datum/design/picked_design

			for(var/datum/design/f in design_list)
				var/test = text2path((recipe))
				if(f.id == test)
					picked_design = f
					break

			if(picked_design)
				var/amount = 1

				if(params["several"])
					amount = input("How many \"[picked_design.id]\" you want to print ?", "Print several") as null|num
					if(!CanUseTopic(usr) || !(picked_design in design_list) || amount == null)
						return

				queue_design(picked_design, amount)

			. = TRUE

		if("remove_from_queue")
			var/ind = text2num(params["index"])
			if(ind >= 1 && ind <= queue.len)
				queue.Cut(ind, ind + 1)
			. = TRUE

		if("move_up_queue")
			var/ind = text2num(params["index"])
			if(ind >= 2 && ind <= queue.len)
				queue.Swap(ind, ind - 1)
			. = TRUE

		if("move_down_queue")
			var/ind = text2num(params["index"])
			if(ind >= 1 && ind <= queue.len-1)
				queue.Swap(ind, ind + 1)
			. = TRUE

		if("abort_print")
			abort()
			. = TRUE

		if("pause")
			paused = !paused
			. = TRUE

		if("clear_queue")
			queue.Cut()
			. = TRUE

/obj/machinery/matter_nanoforge/proc/materials_data()
	var/list/data = list()
	data["mat_efficiency"] = mat_efficiency
	data["mat_capacity"] = storage_capacity

	var/list/M = list()
	for(var/mtype in stored_material)
		if(stored_material[mtype] <= 0)
			continue

		var/material/MAT = get_material_by_name(mtype)
		var/list/ME = list("name" = MAT.display_name, "id" = mtype, "amount" = stored_material[mtype], "ejectable" = !!MAT.stack_type)

		M.Add(list(ME))

	data["materials"] = M

	return data

/obj/machinery/matter_nanoforge/ui_static_data(mob/user)
	var/list/data = list()

	var/list/L = list()
	for(var/datum/design/d in design_list)
		L.Add(list(d.nano_ui_data))
	data["designs"] = L

	return data

/obj/machinery/matter_nanoforge/ui_data(mob/user)
	var/list/data = list()

	data["have_materials"] = TRUE
	data["have_design_selector"] = TRUE

	data["error"] = error
	data["paused"] = paused
	data["unfolded"] = unfolded

	data |= materials_data()

	if(current_design)
		data["current"] = current_design.nano_ui_data
		data["progress"] = progress
	else
		data["current"] = null
		data["progress"] = null

	var/list/Q = list()
	var/qmats = stored_material[MATERIAL_COMPRESSED_MATTER]

	for(var/i = 1; i <= queue.len; i++)
		var/datum/design/picked_design = queue[i]
		var/list/QR = picked_design.nano_ui_data.Copy()

		QR["ind"] = i

		QR["error"] = 0

		for(var/rmat in picked_design.materials)
			qmats -= picked_design.materials[rmat]
			if(qmats < 0)
				QR["error"] = 1

		if(can_print(picked_design) != ERR_OK)
			QR["error"] = 2

		Q.Add(list(QR))

	data["queue"] = Q
	data["queue_max"] = queue_max

	return data

/obj/machinery/matter_nanoforge/attack_hand(mob/user)
	if(..())
		return TRUE
	matter_assoc_list()
	if(!check_user(user))
		return
	user.set_machine(src)
	if(!design_list?.len)
		get_designs()
	ui_interact(user)

/obj/machinery/matter_nanoforge/attackby(obj/item/I, mob/user)

	if(default_deconstruction(I, user))
		return

	if(default_part_replacement(I, user))
		return

	if(!check_user(user))
		return

	GET_COMPONENT_FROM(comp, /datum/component/inspiration, I)
	if(comp && comp.get_power() > 0)
		if(power_source)
			power_source.forceMove(loc)
		user.drop_item(I)
		I.forceMove(src)
		power_source = I
		update_static_data_for_all_viewers()
		return

	if(power_source)
		matter_assoc_list()
		eat(user, I)
		return
	else
		to_chat(user, SPAN_WARNING("\The [src] does not have any artifact powering it."))

/obj/machinery/matter_nanoforge/on_deconstruction()
	if(power_source)
		power_source.forceMove(get_turf(src))
	power_source = null

/obj/machinery/matter_nanoforge/proc/eat(mob/living/user, obj/item/eating)
	if(!check_user(user))
		return FALSE

	var/used_sheets

	if(!eating && istype(user))
		eating = user.get_active_hand()
	if(!istype(eating))
		return FALSE
	if(stat)
		return FALSE
	if(stored_material[MATERIAL_COMPRESSED_MATTER] == storage_capacity)
		return FALSE
	if(!Adjacent(user) && !Adjacent(eating))
		return FALSE
	if(!length(eating.get_matter()))
		to_chat(user, SPAN_WARNING("\The [eating] does not contain significant amounts of useful materials and cannot be accepted."))
		return FALSE
	var/total_used = 0     // Amount of material used.
	var/mass_per_sheet = 0 // Amount of material constituting one sheet.
	var/list/total_material_gained = list()
	for(var/obj/O in eating.GetAllContents(includeSelf = TRUE))
		var/list/_matter = O.get_matter()
		if(_matter)
			for(var/material in _matter)
				if(material in unsuitable_materials)
					continue

				if(!(material in total_material_gained))
					total_material_gained[material] = 0

				var/total_material = _matter[material]

				if(istype(O, /obj/item/stack/material/cyborg))
					return //Prevents borgs throwing their stuff into it

				if(istype(O, /obj/item/ammo_magazine))
					return //Prevents people from shoving in ammo to get matter

				if(istype(O, /obj/item/ammo_casing))
					return //Prevents people from shoving in ammo to get matter

				if(istype(O, /obj/item/stack))
					var/obj/item/stack/material/stack = O
					total_material *= stack.get_amount()

				if(istype(O, /obj/item/stack/material/compressed_matter))
					to_chat(user, SPAN_NOTICE("You deposit [total_material] compressed matter into \the [src]."))
					stored_material[MATERIAL_COMPRESSED_MATTER] += total_material
					qdel(eating)
					return
				total_material_gained[material] += total_material
				total_used += total_material
				mass_per_sheet += O.matter[material]
	var/datum/component/inspiration/artifact = power_source.GetComponent(/datum/component/inspiration)
	var/gained_mats = 0
	for(var/mat in total_material_gained)
		var/added_mats = artifact.get_power() * total_material_gained[mat] * lst[mat]
		if(added_mats + stored_material[MATERIAL_COMPRESSED_MATTER] > storage_capacity)
			added_mats = storage_capacity - stored_material[MATERIAL_COMPRESSED_MATTER]
		var/leftover_mats = (added_mats + stored_material[MATERIAL_COMPRESSED_MATTER]) - storage_capacity
		stored_material[MATERIAL_COMPRESSED_MATTER] += added_mats
		if(leftover_mats == 0)
			used_sheets = (added_mats / artifact.get_power()) / lst[mat]
		else
			used_sheets = total_material_gained[mat]
		gained_mats += added_mats
	if(istype(eating, /obj/item/stack))
		var/obj/item/stack/stack = eating
		to_chat(user, SPAN_NOTICE("You create [gained_mats] Compressed Matter from [stack.singular_name]\s in the [src]."))

		if(!stack.use(used_sheets))
			qdel(stack)	// Protects against weirdness
	else
		to_chat(user, SPAN_NOTICE("You recycle \the [eating] in \the [src]."))
		qdel(eating)

/obj/machinery/matter_nanoforge/proc/queue_design(datum/design/picked_design, amount=1)
	if(!picked_design || !amount)
		return

	while(amount && queue.len < queue_max)
		queue.Add(picked_design)
		amount--

	if(!current_design)
		next_file()

/obj/machinery/matter_nanoforge/proc/check_craftable_amount_by_material(datum/design/design, material)
	return stored_material[MATERIAL_COMPRESSED_MATTER] / max(1, SANITIZE_LATHE_COST(design.materials[MATERIAL_COMPRESSED_MATTER])) // loaded material / required material

/obj/machinery/matter_nanoforge/proc/can_print(datum/design/picked_design)
	if(progress <= 0)
		if(!picked_design)
			return ERR_NOTFOUND

		var/datum/design/design = picked_design

		for(var/rmat in design.materials)
			if(!(stored_material[MATERIAL_COMPRESSED_MATTER] >= 0))
				return ERR_NOMATERIAL

			if(stored_material[MATERIAL_COMPRESSED_MATTER] < SANITIZE_LATHE_COST(design.materials[rmat]))
				return ERR_NOMATERIAL

	if (paused)
		return ERR_PAUSED

	return ERR_OK

/obj/machinery/matter_nanoforge/Process()

	if(current_design)
		var/err = can_print(current_design)

		if(err == ERR_OK)
			error = null

			working = TRUE
			progress += speed

		else if(err in error_messages)
			error = error_messages[err]
		else
			error = "Unknown error."

		if(current_design && progress >= current_design.time)
			finish_construction()

	else
		error = null
		working = FALSE
		next_file()

	update_icon()
	SStgui.update_uis(src)



/obj/machinery/matter_nanoforge/proc/next_file()
	current_design = null
	progress = 0
	if(queue.len)
		var/hold = queue[1]
		current_design = hold
		print_pre()
		working = TRUE
		queue.Cut(1, 2) // Cut queue[1]
	else
		working = FALSE
	update_icon()

/obj/machinery/matter_nanoforge/proc/eject(amount)

	if(!stored_material.len || stored_material[1] == 0)
		return

	if (!amount)
		return

	amount = min(amount, stored_material[MATERIAL_COMPRESSED_MATTER])

	var/whole_amount = round(amount)
	var/remainder = amount - whole_amount

	if (whole_amount)
		var/obj/item/stack/material/compressed_matter/S = new(drop_location())

		//Accounting for the possibility of too much to fit in one stack
		if (whole_amount <= S.max_amount)
			S.amount = whole_amount
			S.update_strings()
			S.update_icon()
		else
			//There's too much, how many stacks do we need
			var/fullstacks = round(whole_amount / S.max_amount)
			//And how many sheets leftover for this stack
			S.amount = whole_amount % S.max_amount

			if (!S.amount)
				qdel(S)

			for(var/i = 0; i < fullstacks; i++)
				var/obj/item/stack/material/compressed_matter/MS = new(drop_location())
				MS.amount = MS.max_amount
				MS.update_strings()
				MS.update_icon()

	//And if there's any remainder, we eject that as a shard
	if (remainder)
		new /obj/item/material/shard(drop_location(), MATERIAL_COMPRESSED_MATTER, _amount = remainder)

	//The stored material gets the amount (whole+remainder) subtracted
	stored_material[MATERIAL_COMPRESSED_MATTER] -= amount

/obj/machinery/matter_nanoforge/proc/abort()
	if(working)
		print_post()
	current_design = null
	paused = TRUE
	working = FALSE
	update_icon()

//Finishing current construction
/obj/machinery/matter_nanoforge/proc/finish_construction()
	fabricate_design(current_design)

/obj/machinery/matter_nanoforge/proc/fabricate_design(datum/design/design)
	consume_materials(design)
	design.Fabricate(drop_location(), 0, src)

	working = FALSE
	current_design = null
	print_post()
	next_file()

/obj/machinery/matter_nanoforge/proc/consume_materials(datum/design/design)
	stored_material[MATERIAL_COMPRESSED_MATTER] = max(0, stored_material[MATERIAL_COMPRESSED_MATTER] - (design.materials[MATERIAL_COMPRESSED_MATTER] * mat_efficiency))
	return TRUE

#undef ERR_OK
#undef ERR_NOTFOUND
#undef ERR_NOMATERIAL
#undef SANITIZE_LATHE_COST
#undef ERR_PAUSED

/obj/machinery/matter_nanoforge/ex_act(severity)
	return 0

/obj/machinery/matter_nanoforge/bullet_act(obj/item/projectile/P, def_zone)
	return 0

/obj/effect/flicker_overlay
	name = ""
	icon_state = ""
	// Acts like a part of the object it's created for when in vis_contents
	// Inherits everything but the icon_state
	vis_flags = VIS_INHERIT_ICON | VIS_INHERIT_DIR | VIS_INHERIT_LAYER | VIS_INHERIT_PLANE | VIS_INHERIT_ID

/obj/effect/flicker_overlay/New(atom/movable/loc)
	..()
	// Just VIS_INHERIT_ICON isn't enough: flicker() needs an actual icon to be set
	icon = loc.icon
	loc.vis_contents += src

/obj/effect/flicker_overlay/Destroy()
	if(istype(loc, /atom/movable))
		var/atom/movable/A = loc
		A.vis_contents -= src
	return ..()

/obj/machinery/matter_nanoforge/update_icon()
	cut_overlays()

	icon_state = initial(icon_state)

	if(panel_open)
		add_overlay(image(icon, "[icon_state]_panel"))

	if(working) // if paused, work animation looks awkward.
		if(paused || error)
			icon_state = "[icon_state]_pause"
		else
			icon_state = "[icon_state]_work"

//Updates matter  nanoforge material storage size, production speed and material efficiency.
/obj/machinery/matter_nanoforge/RefreshParts()
	..()
	var/mb_rating = 0
	var/mb_amount = 0
	for(var/obj/item/stock_parts/matter_bin/MB in component_parts)
		mb_rating += MB.rating
		mb_amount++

	storage_capacity = round(initial(storage_capacity)*(mb_rating/mb_amount))

	var/man_rating = 0
	var/man_amount = 0
	for(var/obj/item/stock_parts/manipulator/M in component_parts)
		man_rating += M.rating
		man_amount++
	man_rating -= man_amount

	var/las_rating = 0
	var/las_amount = 0
	for(var/obj/item/stock_parts/micro_laser/M in component_parts)
		las_rating += M.rating
		las_amount++
	las_rating -= las_amount

	queue_max = initial(queue_max) + mb_rating //So the more matter bin levels the more we can queue!

	speed = initial(speed) + man_rating + las_rating
	mat_efficiency = max(0.2, 1.0 - (man_rating * 0.1))

/obj/machinery/matter_nanoforge/proc/print_pre()
	flick("[initial(icon_state)]_start", src)

/obj/machinery/matter_nanoforge/proc/print_post()
	flick("[initial(icon_state)]_finish", src)
	if(!current_design && !queue.len)
		playsound(src.loc, 'sound/machines/ping.ogg', 50, 1 -3)
		visible_message("\The [src] pings, indicating that queue is complete.")

/obj/machinery/matter_nanoforge/proc/res_load(material/material)
	flick("[initial(icon_state)]_load", image_load)
	if(material)
		image_load_material.color = material.icon_colour
		image_load_material.alpha = max(255 * material.opacity, 200) // The icons are too transparent otherwise
		flick("[initial(icon_state)]_load_m", image_load_material)

//here we have the conversion rates of the forge, unless an exploit is found, those should not be touched if possible
/obj/machinery/matter_nanoforge/proc/matter_assoc_list()
	lst[MATERIAL_IRON] = 0.30			//"a kilogram of steel"
	lst[MATERIAL_GLASS] = 0.45			//as long as guild is not mass producing sand...
	lst[MATERIAL_RGLASS] = 0.70
	lst[MATERIAL_STEEL] = 0.50			//why mixing a kilogram of steel and onde of feathers be worse than it's source?
	lst[MATERIAL_PLASMAGLASS] = 0.70	//better off using it on crafts or to repair specific windows
	lst[MATERIAL_RPLASMAGLASS] = 0.90 	//but why?
	lst[MATERIAL_DIAMOND] = 1.20 		//who actually does that?
	lst[MATERIAL_PLASMA] = 0.70
	lst[MATERIAL_GOLD] = 0.70
	lst[MATERIAL_URANIUM] = 1
	lst[MATERIAL_SILVER] = 0.70			//while guild has no problem obtaining, using as fuel for the forge is still not reccomended
	lst[MATERIAL_PLASTEEL] = 0.70		//hard to happen, Guild needs it far more for crafts
	lst[MATERIAL_DURASTEEL] = 2.55		//good luck finding a sheet of this
	lst[MATERIAL_PLASTIC] = 0.45		//"a kilogram of feathers"
	lst[MATERIAL_TRITIUM] = 1			//only exists if guild mines it themselves
	lst[MATERIAL_PLATINUM] = 1
	lst[MATERIAL_MHYDROGEN] = 1			//only exists if guild mines it themselves
	lst[MATERIAL_OSMIUM] = 1			//only exists if guild mines it themselves
	lst[MATERIAL_WOOD] = 0.20
	lst[MATERIAL_CLOTH] = 0.10
	lst[MATERIAL_SILK] = 0.10
	lst[MATERIAL_CARDBOARD] = 0.10
	lst[MATERIAL_LEATHER] = 0.20
	lst[MATERIAL_BONE] = 0.20
	lst[MATERIAL_TITANIUM] = 0.80		//only exists if guild mines it themselves
	lst[MATERIAL_COMPRESSED_MATTER] = 1 //we make this!
	lst[MATERIAL_RSCRAP] = 0.75			//now guild has a reason to make refined scrap {does not work, snowflake material code}
	lst[MATERIAL_AMERIDIAN] = 0.90			//so ameridian is useful to guild now?
//	lst[MATERIAL_BIOMATTER] = 0.2		//church makes so much of it {does not work, snowflake material code}

/obj/machinery/matter_nanoforge/proc/check_user(mob/user)
	if(!user.stats?.getPerk(PERK_HANDYMAN) && !usr.stat_check(STAT_MEC, 80))
		to_chat(usr, SPAN_NOTICE("You don't know how to make the [src] work, you lack the training or mechanical skill."))
		return FALSE
	else
		return TRUE
