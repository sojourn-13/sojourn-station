/**********************Mineral processing unit console**************************/

/obj/machinery/mineral/processing_unit_console
	name = "production machine console"
	desc = "A computer that links to the material processor"
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "console"
	density = 0
	anchored = 1

	var/obj/item/card/id/inserted_id	// Inserted ID card, for points

	var/obj/machinery/mineral/processing_unit/machine = null
	var/show_all_ores = 0

/obj/machinery/mineral/processing_unit_console/laber
	name = "labor camp production machine console"

/obj/machinery/mineral/processing_unit_console/scrap_haven
	name = "scrap haven production machine console"

/obj/machinery/mineral/processing_unit_console/New()
	..()
	spawn()
		src.machine = locate(/obj/machinery/mineral/processing_unit) in range(3, src)
		if (machine)
			machine.console = src
		else
			log_debug("[src] ([x],[y],[z]) can't find coresponding processing unit.")

/obj/machinery/mineral/processing_unit_console/attack_hand(mob/user)
	add_fingerprint(user)
	interact(user)

/obj/machinery/mineral/processing_unit_console/interact(mob/user)

	if(..())
		return

	if(!allowed(user))
		to_chat(user, "\red Access denied.")
		return

	user.set_machine(src)


	var/dat = "<h1>Ore processor console</h1>"

	dat += "Current unclaimed points: [machine.points]<br>"
	if(istype(inserted_id))
		dat += "You have [inserted_id.mining_points] mining points collected. <A href='?src=\ref[src];choice=eject'>Eject ID.</A><br>"
		dat += "<A href='?src=\ref[src];choice=claim'>Claim points.</A><br>"
	else
		dat += "No ID inserted.  <A href='?src=\ref[src];choice=insert'>Insert ID.</A><br>"
	dat += "High-speed processing is <A href='?src=\ref[src];toggle_speed=1'>[(machine.speed_process ? "<font color='green'>active</font>" : "<font color='red'>inactive</font>")]."
	dat += "<hr><table>"

	for(var/ore in machine.ores_processing)

		if(!machine.ores_stored[ore] && !show_all_ores) continue
		var/ore/O = ore_data[ore]
		if(!O) continue
		dat += "<tr><td width = 40><b>[capitalize(O.display_name)]</b></td><td width = 30>[machine.ores_stored[ore]]</td><td width = 100>"
		if(machine.ores_processing[ore])
			switch(machine.ores_processing[ore])
				if(0)
					dat += "<font color='red'>not processing</font>"
				if(1)
					dat += "<font color='orange'>smelting</font>"
				if(2)
					dat += "<font color='blue'>compressing</font>"
				if(3)
					dat += "<font color='gray'>alloying</font>"
		else
			dat += "<font color='red'>not processing</font>"
		dat += ".</td><td width = 30><a href='?src=\ref[src];toggle_smelting=[ore]'>\[change\]</a></td></tr>"

	dat += "</table><hr>"
	dat += "Currently displaying [show_all_ores ? "all ore types" : "only available ore types"]. <A href='?src=\ref[src];toggle_ores=1'>\[[show_all_ores ? "show less" : "show more"]\]</a></br>"
	dat += "The ore processor is currently <A href='?src=\ref[src];toggle_power=1'>[(machine.active ? "<font color='green'>processing</font>" : "<font color='red'>disabled</font>")]</a>."
	user << browse(dat, "window=processor_console;size=400x500")
	onclose(user, "processor_console")
	return

/obj/machinery/mineral/processing_unit_console/Topic(href, href_list)
	if(..())
		return 1
	usr.set_machine(src)

	if(href_list["toggle_smelting"])
		var/choice = input("What setting do you wish to use for processing [href_list["toggle_smelting"]]?") as null|anything in list("Smelting","Compressing","Alloying","Nothing")
		if(!choice) return

		switch(choice)
			if("Nothing") choice = 0
			if("Smelting") choice = 1
			if("Compressing") choice = 2
			if("Alloying") choice = 3

		machine.ores_processing[href_list["toggle_smelting"]] = choice

	if(href_list["toggle_speed"])

		machine.toggle_speed()

	if(href_list["toggle_power"])
		machine.active = !machine.active

	if(href_list["toggle_ores"])
		show_all_ores = !show_all_ores

	if(href_list["choice"])
		if(istype(inserted_id))
			if(href_list["choice"] == "eject")
				usr.put_in_hands(inserted_id)
				inserted_id = null
			if(href_list["choice"] == "claim")
				inserted_id.mining_points += machine.points
				machine.points = 0
		else if(href_list["choice"] == "insert")
			var/obj/item/card/id/I = usr.get_active_hand()
			if(istype(I))
				usr.drop_item()
				I.forceMove(src)
				inserted_id = I
			else
				to_chat(usr, "<span class='warning'>No valid ID.</span>")

	playsound(loc, 'sound/machines/machine_switch.ogg', 100, 1)
	src.updateUsrDialog()


/**********************Mineral processing unit**************************/


/obj/machinery/mineral/processing_unit
	name = "material processor" //This isn't actually a goddamn furnace, we're in space and it's processing platinum and flammable plasma...
	desc = "A large grinder, compressor , and smelter for all your sheet and material needs."
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "furnace"
	density = 1
	anchored = 1
	light_range = 3
	var/obj/machinery/mineral/console = null
	var/sheets_per_tick = 10
	var/list/ores_processing
	var/list/ores_stored
	var/static/list/alloy_data
	var/active = 0
	var/input_dir = 0
	var/output_dir = 0
	var/speed_process = FALSE
	var/points = 0
	var/static/list/ore_values = list(
		"sand" = 1,
		"hematite" = 1,
		"carbon" = 1,
		MATERIAL_PLASMA = 15,
		MATERIAL_SILVER = 16,
		MATERIAL_GOLD = 18,
		MATERIAL_URANIUM = 30,
		MATERIAL_DIAMOND = 50,
		MATERIAL_PLATINUM = 40,
		MATERIAL_MHYDROGEN = 40)

/obj/machinery/mineral/processing_unit/laber
	name = "labor material processor"

/obj/machinery/mineral/processing_unit/scrap_heaven
	name = "scrap haven material processor"

/obj/machinery/mineral/processing_unit/New()
	..()

	ores_processing = list()
	ores_stored = list()

	// initialize static alloy_data list
	if(!alloy_data)
		alloy_data = list()
		for(var/alloytype in typesof(/datum/alloy)-/datum/alloy)
			alloy_data += new alloytype()

	if(!ore_data || !ore_data.len)
		for(var/oretype in typesof(/ore)-/ore)
			var/ore/OD = new oretype()
			ore_data[OD.name] = OD

	for(var/orename in ore_data)
		ores_processing[orename] = 0
		ores_stored[orename] = 0

	spawn()
		//Locate our output and input machinery.
		var/obj/marker = null
		marker = locate(/obj/landmark/machinery/input) in range(1, loc)
		if(marker)
			input_dir = get_dir(src, marker)
		marker = locate(/obj/landmark/machinery/output) in range(1, loc)
		if(marker)
			output_dir = get_dir(src, marker)

/obj/machinery/mineral/processing_unit/proc/toggle_speed()
	speed_process = !speed_process // switching gears
	if(speed_process) // high gear
		STOP_PROCESSING(SSmachines, src)
		START_PROCESSING(SSfastprocess, src)
	else // low gear
		STOP_PROCESSING(SSfastprocess, src)
		START_PROCESSING(SSmachines, src)

/obj/machinery/mineral/processing_unit/Process()

	if (!output_dir || !input_dir)
		return

	var/list/tick_alloys = list()

	//Grab some more ore to process this tick.
	for(var/obj/item/stack/ore/O in get_step(src, input_dir))
		if(!isnull(ores_stored[O.material]))
			ores_stored[O.material] += O.sheet_amout * O.amount
		else
			ores_stored[O.material] = O.sheet_amout * O.amount
		points += ore_values[O.material] * O.amount // Give Points!
		if(isnull(ores_processing[O.material]))
			ores_processing[O.material] = 0

		qdel(O)

	if(!active)
		return

	//Process our stored ores and spit out sheets.
	var/sheets = 0
	for(var/metal in ores_stored)

		if(sheets >= sheets_per_tick) break

		if(ores_stored[metal] > 0 && ores_processing[metal] != 0)

			var/ore/O = ore_data[metal]

			if(!O) continue

			if(ores_processing[metal] == 3 && O.alloy) //Alloying.

				for(var/datum/alloy/A in alloy_data)

					if(A.metaltag in tick_alloys)
						continue

					tick_alloys += A.metaltag
					var/enough_metal

					if(!isnull(A.requires[metal]) && ores_stored[metal] >= A.requires[metal]) //We have enough of our first metal, we're off to a good start.

						enough_metal = 1

						for(var/needs_metal in A.requires)
							//Check if we're alloying the needed metal and have it stored.
							if(ores_processing[needs_metal] != 3 || ores_stored[needs_metal] < A.requires[needs_metal])
								enough_metal = 0
								break

					if(!enough_metal)
						continue
					else
						var/total
						for(var/needs_metal in A.requires)
							ores_stored[needs_metal] -= A.requires[needs_metal]
							total += A.requires[needs_metal]
							total = max(1,round(total*A.product_mod)) //Always get at least one sheet.
							sheets += total-1

						for(var/i=0,i<total,i++)
							new A.product(get_step(src, output_dir))

			else if(ores_processing[metal] == 2 && O.compresses_to) //Compressing.

				var/can_make = CLAMP(ores_stored[metal],0,sheets_per_tick-sheets)
				if(can_make%2>0) can_make--

				var/material/M = get_material_by_name(O.compresses_to)

				if(!istype(M) || !can_make || ores_stored[metal] < 1)
					continue

				for(var/i=0,i<can_make,i+=2)
					ores_stored[metal]-=2
					sheets+=2
					new M.stack_type(get_step(src, output_dir))

			else if(ores_processing[metal] == 1 && O.smelts_to) //Smelting.

				var/can_make = CLAMP(ores_stored[metal],0,sheets_per_tick-sheets)

				var/material/M = get_material_by_name(O.smelts_to)
				if(!istype(M) || !can_make || ores_stored[metal] < 1)
					continue

				for(var/i=0,i<can_make,i++)
					ores_stored[metal]--
					sheets++
					new M.stack_type(get_step(src, output_dir))
			else
				ores_stored[metal]--
				sheets++
				new /obj/item/stack/ore/slag(get_step(src, output_dir))
		else
			continue

	console.updateUsrDialog()
