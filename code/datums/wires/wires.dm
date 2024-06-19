// Wire datums. Created by Giacomand.
// Was created to replace a horrible case of copy and pasted code with no care for maintability.
// Goodbye Door wires, Cyborg wires, Vending Machine wires, Autolathe wires
// Protolathe wires, APC wires and Camera wires!

#define MAX_FLAG 65535

var/list/same_wires = list()
// 14 colours, if you're adding more than 14 wires then add more colours here
var/list/wireColours = list("red", "blue", "green", "darkred", "orange", "brown", "gold", "gray", "cyan", "navy", "purple", "pink", "black", "yellow")

/datum/wires

	var/random = 1 // Will the wires be different for every single instance.
	var/atom/holder = null // The holder
	var/holder_type = null // The holder type; used to make sure that the holder is the correct type.
	var/wire_count = 0 // Max is 16
	var/wires_status = 0 // BITFLAG OF WIRES

	var/list/wires = list()
	var/list/signallers = list()

	var/table_options = " align='center'"
	var/row_options1 = " width='80px'"
	var/row_options2 = " width='260px'"
	var/window_x = 370
	var/window_y = 470

	var/list/descriptions // Descriptions of wires (datum/wire_description) for use with examining.
	var/list/wire_log = list() // A log for admin use of what happened to these wires.

/datum/wires/New(var/atom/holder)
	..()
	src.holder = holder
	if(!istype(holder, holder_type))
		CRASH("Our holder is null/the wrong type!")

	// Generate new wires
	if(random)
		GenerateWires()

	// Get the same wires
	else
		// We don't have any wires to copy yet, generate some and then copy it.
		if(!same_wires[holder_type])
			GenerateWires()
			same_wires[holder_type] = src.wires.Copy()
		else
			var/list/wires = same_wires[holder_type]
			src.wires = wires // Reference the wires list.

/datum/wires/Destroy()
	holder = null
	return ..()

/datum/wires/proc/GenerateWires()
	var/list/colours_to_pick = wireColours.Copy() // Get a copy, not a reference.
	var/list/indexes_to_pick = list()
	//Generate our indexes
	for(var/i = 1; i < MAX_FLAG && i < (1 << wire_count); i += i)
		indexes_to_pick += i
	colours_to_pick.len = wire_count // Downsize it to our specifications.

	while(colours_to_pick.len && indexes_to_pick.len)
		// Pick and remove a colour
		var/colour = pick_n_take(colours_to_pick)

		// Pick and remove an index
		var/index = pick_n_take(indexes_to_pick)

		src.wires[colour] = index
		//wires = shuffle(wires)

/datum/wires/proc/examine(index, mob/user)
	. = "You aren't sure what this wire does."
	var/mec_stat = user.stats.getStat(STAT_MEC)

	var/datum/wire_description/wd = get_description(index)
	if(!wd)
		return
	if(wd.skill_level >= mec_stat)
		return
	return wd.description

/datum/wires/proc/get_description(index)
	for(var/datum/wire_description/desc in descriptions)
		if(desc.index == index)
			return desc

/datum/wires/proc/add_log_entry(mob/user, message)
	wire_log += "\[[time_stamp()]\] [user.name] ([user.ckey]) [message]"

/datum/wires/proc/Interact(mob/living/user)
	if(istype(user) && holder && CanUse(user))
		ui_interact(user)

/datum/wires/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "Wires", "[holder.name] wires")
		ui.open()

/// Users will be interacting with our holder object and not the wire datum directly, therefore we need to return the holder.
/datum/wires/ui_host()
	return holder

/datum/wires/ui_state(mob/user)
	return GLOB.physical_state

/datum/wires/ui_data(mob/user)
	var/list/data = list()

	var/list/wires_list = list()
	for(var/color in wires)
		var/datum/wire_description/wd = get_description(GetIndex(color))

		var/color_name = color
		if(color in LIST_COLOR_RENAME)
			color_name = LIST_COLOR_RENAME[color]

		wires_list += list(list(
			"color" = color,
			"color_name" = color_name,
			// was wire
			"desc" = can_see_wire_info(user, wd) ? wd.description : null,
			"cut" = IsColourCut(color),
			"attached" = IsAttached(color)
		))
	data["wires"] = wires_list

	// Get the information shown at the bottom of wire TGUI window, such as "The red light is blinking", etc.
	// If the user is colorblind, we need to replace these colors as well.
	data["status"] = get_status(user)

	return data

/datum/wires/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()
	if(.)
		return

	var/mob/user = usr
	if(!CanUse(user))
		return

	var/obj/item/I = user.get_active_hand()
	var/color = lowertext(params["wire"])
	holder.add_hiddenprint(user)

	switch(action)
		 // Toggles the cut/mend status.
		if("cut")
			if(!istype(I))
				return TRUE

			var/tool_type = null
			if(QUALITY_CUTTING in I.tool_qualities)
				tool_type = QUALITY_CUTTING

			if(QUALITY_WIRE_CUTTING in I.tool_qualities)
				tool_type = QUALITY_WIRE_CUTTING

			if(!tool_type)
				to_chat(user, SPAN_WARNING("You need something that can cut!"))
				return TRUE

			if(I.use_tool(user, holder, WORKTIME_INSTANT, tool_type, FAILCHANCE_ZERO))
				add_log_entry(user, "has [IsColourCut(color) ? "mended" : "cut"] the <font color='[color]'>[capitalize(color)]</font> wire")
				CutWireColour(color)
				return TRUE

		// Pulse a wire.
		if("pulse")
			if(!istype(I))
				return  TRUE

			if(!I.get_tool_type(user, list(QUALITY_PULSING), holder))
				to_chat(user, SPAN_WARNING("You need a multitool!"))
				return TRUE

			if(I.use_tool(user, holder, WORKTIME_INSTANT, QUALITY_PULSING, FAILCHANCE_ZERO))
				add_log_entry(user, "has pulsed the <font color='[color]'>[capitalize(color)]</font> wire")
				PulseColour(color)
				return TRUE

		 // Attach a signaler to a wire.
		if("attach")
			if(IsAttached(color))
				var/obj/item/O = Detach(color)
				add_log_entry(user, "has detached [O] from the <font color='[color]'>[capitalize(color)]</font> wire")
				if(O)
					user.put_in_hands(O)
					return TRUE

			if(!(istype(I, /obj/item/device/assembly/signaler) || istype(I, /obj/item/implant/carrion_spider/spark)))
				to_chat(user, SPAN_WARNING("You need a remote signaller!"))
				return TRUE

			if(!user.unEquip(I))
				to_chat(user, SPAN_WARNING("[I] is stuck to your hand!"))
				return TRUE

			add_log_entry(user, "has attached [I] to the <font color='[color]'>[capitalize(color)]</font> wire")
			Attach(color, I)
			return TRUE

/datum/wires/proc/can_see_wire_info(mob/living/user, datum/wire_description/wd)
	if(!istype(wd))
		return FALSE

	if(user?.stats.getPerk(PERK_HANDYMAN))
		return TRUE

	var/user_skill = user.stats?.getStat(STAT_MEC) || 0
	if(user_skill > wd.skill_level)
		return TRUE

	return FALSE

/datum/wires/proc/get_status(mob/living/user)
	return list()

//
// Overridable Procs
//

// Called when wires cut/mended.
/datum/wires/proc/UpdateCut(var/index, var/mended)
	return

// Called when wire pulsed. Add code here.
/datum/wires/proc/UpdatePulsed(var/index)
	return

/datum/wires/proc/CanUse(var/mob/living/L)
	return 1

// Example of use:
/*
var/const/BOLTED= 1
var/const/SHOCKED = 2
var/const/SAFETY = 4
var/const/POWER = 8
/datum/wires/door/UpdateCut(var/index, var/mended)
	var/obj/machinery/door/airlock/A = holder
	switch(index)
		if(BOLTED)
		if(!mended)
			A.bolt()
	if(SHOCKED)
		A.shock()
	if(SAFETY )
		A.safety()
*/


//
// Helper Procs
//

/datum/wires/proc/PulseColour(var/colour)
	PulseIndex(GetIndex(colour))

/datum/wires/proc/PulseIndex(var/index)
	if(IsIndexCut(index))
		return
	UpdatePulsed(index)

/datum/wires/proc/GetIndex(var/colour)
	if(wires[colour])
		var/index = wires[colour]
		return index
	else
		CRASH("[colour] is not a key in wires.")

//
// Is Index/Colour Cut procs
//

/datum/wires/proc/IsColourCut(var/colour)
	var/index = GetIndex(colour)
	return IsIndexCut(index)

/datum/wires/proc/IsIndexCut(var/index)
	return (index & wires_status)

//
// Signaller Procs
//

/datum/wires/proc/IsAttached(var/colour)
	if(signallers[colour])
		return 1
	return 0

/datum/wires/proc/GetAttached(var/colour)
	if(signallers[colour])
		return signallers[colour]
	return null

/datum/wires/proc/Attach(var/colour, var/obj/item/device/assembly/signaler/S)
    var/obj/item/implant/carrion_spider/spark/I = S
    if(istype(S) || istype(I))
        if(!IsAttached(colour))
            signallers[colour] = S
            S.loc = holder
            S.connected = src
            return S

/datum/wires/proc/Detach(var/colour)
	if(colour)
		var/obj/item/device/assembly/signaler/S = GetAttached(colour)
		var/obj/item/implant/carrion_spider/spark/I = S
		if(istype(S) || istype(I))
			signallers -= colour
			S.connected = null
			S.loc = holder.loc
			return S


/datum/wires/proc/Pulse(var/obj/item/device/assembly/signaler/S)
	var/obj/item/implant/carrion_spider/spark/I = S
	if(istype(S) || istype(I))
		for(var/colour in signallers)
			if(S == signallers[colour])
				PulseColour(colour)
				break


//
// Cut Wire Colour/Index procs
//

/datum/wires/proc/CutWireColour(var/colour)
	var/index = GetIndex(colour)
	CutWireIndex(index)

/datum/wires/proc/CutWireIndex(var/index)
	if(IsIndexCut(index))
		wires_status &= ~index
		UpdateCut(index, 1)
	else
		wires_status |= index
		UpdateCut(index, 0)

/datum/wires/proc/RandomCut()
	var/r = rand(1, wires.len)
	CutWireIndex(r)

/datum/wires/proc/RandomCutAll(var/probability = 10)
	for(var/i = 1; i < MAX_FLAG && i < (1 << wire_count); i += i)
		if(prob(probability))
			CutWireIndex(i)

/datum/wires/proc/CutAll()
	for(var/i = 1; i < MAX_FLAG && i < (1 << wire_count); i += i)
		CutWireIndex(i)

/datum/wires/proc/IsAllCut()
	if(wires_status == (1 << wire_count) - 1)
		return 1
	return 0

/datum/wires/proc/MendAll()
	for(var/i = 1; i < MAX_FLAG && i < (1 << wire_count); i += i)
		if(IsIndexCut(i))
			CutWireIndex(i)

//
//Shuffle and Mend
//

/datum/wires/proc/Shuffle()
	wires_status = 0
	GenerateWires()
