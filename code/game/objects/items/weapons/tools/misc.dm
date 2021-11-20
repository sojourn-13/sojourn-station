/obj/item/tool/omnitool
	name = "\improper Lonestar \"Munchkin 5000\""
	desc = "A fuel-powered monster of a tool. Its welder part is the most advanced one, capable of welding things without harmful glow and sparks, so no protection needed. The complexity of this tool means that regular maintenance is required."
	icon_state = "omnitool"
	max_health = 200
	w_class = ITEM_SIZE_NORMAL
	worksound = WORKSOUND_DRIVER_TOOL
	switched_on_qualities = list(QUALITY_SCREW_DRIVING = 50, QUALITY_BOLT_TURNING = 50, QUALITY_DRILLING = 20, QUALITY_WELDING = 30, QUALITY_CAUTERIZING = 10)
	price_tag = 1000
	use_fuel_cost = 0.1
	max_fuel = 50
	toggleable = TRUE
	create_hot_spot = TRUE
	glow_color = COLOR_ORANGE
	max_upgrades = 2

/obj/item/tool/polytool
	name = "\"Jolly Co-operation\" polytool"
	desc = "One of the few jointly designed tools by both Lonestar Shipping Solutions and the Artificer's Guild, a rather curious attempt at merging the munchkin 5000 of lonestar infamy and \
	designs taken directly from the guild arc welder. What it produced was a munchkin and arc welder combo with much finer tuned properties, efficient fuel economy, comfortable hand grips, and plenty of slots for tool augments."
	icon_state = "polytool"
	item_state = "polytool"
	max_health = 300
	w_class = ITEM_SIZE_NORMAL
	worksound = WORKSOUND_DRIVER_TOOL
	switched_on_qualities = list(QUALITY_SCREW_DRIVING = 75, QUALITY_BOLT_TURNING = 75, QUALITY_DRILLING = 40, QUALITY_PULSING = 60, QUALITY_WIRE_CUTTING = 30, QUALITY_WELDING = 60, QUALITY_CAUTERIZING = 30)
	price_tag = 3000
	use_fuel_cost = 0.05
	max_fuel = 100
	toggleable = TRUE
	create_hot_spot = TRUE
	glow_color = COLOR_BLUE_LIGHT
	max_upgrades = 4 //Superior in all ways to the munchkin and arc welder as a tool, only way to obtain it is through guild crafting or getting really lucky in cargo tech lockers. Give how fuck rare munckins are, balance by scarcity factor. -Kaz

/obj/item/tool/medmultitool
	name = "Greyson Positronic medical multitool"
	desc = "A compact Greyson Positronic medical multitool. It has all surgery tools and takes a medium cell in its handle.."
	icon_state = "medmulti"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_GLASS = 2, MATERIAL_PLATINUM = 2)
	flags = CONDUCT
	origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 4)
	tool_qualities = list(QUALITY_CLAMPING = 30, QUALITY_RETRACTING = 30, QUALITY_BONE_SETTING = 30, QUALITY_CAUTERIZING = 30, QUALITY_SAWING = 15, QUALITY_CUTTING = 30, QUALITY_LASER_CUTTING = 30, QUALITY_WIRE_CUTTING = 25, QUALITY_BONE_GRAFTING = 50)
	suitable_cell = /obj/item/cell/medium
	use_power_cost = 0.2 //Effective!
	max_upgrades = 2
	workspeed = 1.2
	price_tag = 1400 // Super fancy

/obj/item/tool/medmultitool/medimplant
	name = "soteria medical omnitool"
	desc = "An all-in-one medical tool based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels, and requires a medium power cell."
	icon_state = "medimplant"
	matter = null
	force = WEAPON_FORCE_PAINFUL
	sharp = TRUE
	edge = TRUE
	worksound = WORKSOUND_DRIVER_TOOL
	flags = CONDUCT
	tool_qualities = list(QUALITY_CLAMPING = 30, QUALITY_RETRACTING = 30, QUALITY_BONE_SETTING = 30, QUALITY_CAUTERIZING = 30, QUALITY_SAWING = 15, QUALITY_CUTTING = 30, QUALITY_WIRE_CUTTING = 15, QUALITY_BONE_GRAFTING = 40)
	degradation = 0.5
	workspeed = 0.8
	price_tag = 600 // Not nearly as fancy.

	use_power_cost = 1.2
	suitable_cell = /obj/item/cell/medium

	max_upgrades = 1

/obj/item/tool/medmultitool/medimplant/sci
	name = "soteria medical omnitool"
	desc = "An all-in-one medical tool based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels, and requires a small power cell. This one is a cheap copy of better versions."
	icon_state = "medimplant_sci"
	matter = null //Nope
	degradation = 1
	workspeed = 0.2 //SLOW

	suitable_cell = /obj/item/cell/small

	max_upgrades = 0 //NO

/obj/item/tool/medmultitool/medimplant/cht_mant
	name = "surgical omni-gland"
	desc = "An all in one organic touch that functions through a set of chemicals, enzymes, and a cht'mants sensitive glands."
	icon_state = "chtmant_hand"
	use_power_cost = 0
	suitable_cell = null
	degradation = 0
	max_upgrades = 0
	workspeed = 1.1 //Can't be upgraded and its locked behind a race that can literally get no other implants but this one, which can't be upgraded, so its slightly better. -Kaz

/obj/item/tool/medmultitool/medimplant/organic
	name = "organic medical omnitool"
	desc = "An all-in-one medical tool implant based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels. This version is made of entirely organic materials and doesn't require a power cell, sadly it cannot be upgraded and work takes slightly longer, but at least it is self repairing."
	icon_state = "organicmedimplant"
	use_power_cost = 0
	suitable_cell = null
	degradation = 0
	max_upgrades = 0
	workspeed = 1
	//matter = list(MATERIAL_BIOMATTER = 10) No

/obj/item/tool/engimplant
	name = "engineering omnitool"
	desc = "An all-in-one engineering tool implant. Convenient to use and more effective than the basics, but much less efficient than customized or more specialized tools."
	icon_state = "engimplant"
	force = WEAPON_FORCE_DANGEROUS
	worksound = WORKSOUND_DRIVER_TOOL
	flags = CONDUCT
	tool_qualities = list(QUALITY_SCREW_DRIVING = 35, QUALITY_BOLT_TURNING = 35, QUALITY_DRILLING = 15, QUALITY_WELDING = 30, QUALITY_CAUTERIZING = 10, QUALITY_PRYING = 25, QUALITY_DIGGING = 20, QUALITY_PULSING = 30, QUALITY_WIRE_CUTTING = 30, QUALITY_HAMMERING = 30)
	degradation = 0.5
	workspeed = 0.8
	price_tag = 600

	use_power_cost = 0.8
	suitable_cell = /obj/item/cell/medium

	max_upgrades = 1

	var/buffer_name
	var/atom/buffer_object

/obj/item/tool/engimplant/organic
	name = "organic engineering omnitool"
	desc = "An all-in-one engineering tool implant. Convenient to use and more effective than the basics, but much less efficient than customized or more specialized tools. This version is made of entirely organic materials and doesn't require a power cell, sadly it cannot be upgraded and work takes slightly longer, but at least it is self repairing."
	icon_state = "organicengimplant"
	use_power_cost = 0
	suitable_cell = null
	degradation = 0
	max_upgrades = 0
	workspeed = 1

/obj/item/tool/engimplant/Destroy() // code for omnitool buffers was copied from multitools.dm
	unregister_buffer(buffer_object)
	return ..()

/obj/item/tool/engimplant/proc/get_buffer(var/typepath)
	get_buffer_name(TRUE)
	if(buffer_object && (!typepath || istype(buffer_object, typepath)))
		return buffer_object

/obj/item/tool/engimplant/proc/get_buffer_name(var/null_name_if_missing = FALSE)
	if(buffer_object)
		buffer_name = buffer_object.name
	else if(null_name_if_missing)
		buffer_name = null
	return buffer_name

/obj/item/tool/engimplant/proc/set_buffer(var/atom/buffer)
	if(!buffer || istype(buffer))
		buffer_name = buffer ? buffer.name : null
		if(buffer != buffer_object)
			unregister_buffer(buffer_object)
			buffer_object = buffer
			if(buffer_object)
				GLOB.destroyed_event.register(buffer_object, src, /obj/item/tool/engimplant/proc/unregister_buffer)

/obj/item/tool/engimplant/proc/unregister_buffer(var/atom/buffer_to_unregister)
	// Only remove the buffered object, don't reset the name
	// This means one cannot know if the buffer has been destroyed until one attempts to use it.
	if(buffer_to_unregister == buffer_object && buffer_object)
		GLOB.destroyed_event.unregister(buffer_object, src)
		buffer_object = null

/obj/item/tool/engimplant/resolve_attackby(atom/A, mob/user)
	if(!isobj(A))
		return ..(A, user)

	var/obj/O = A
	var/datum/extension/multitool/MT = get_extension(O, /datum/extension/multitool)
	if(!MT)
		return ..(A, user)

	user.AddTopicPrint(src)
	MT.interact(src, user)
	return 1

/obj/item/tool/silk_wand
	name = "metal silk weaver"
	desc = "A small metal two pronged fork used to gather balls of silk."
	icon_state = "silk_wand"
	tool_qualities = list(QUALITY_WEAVING = 30)
