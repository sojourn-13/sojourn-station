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
	name = "Artificer's Guild \"Jolly Co-operation\" polytool"
	desc = "One of the few jointly designed tools by both Lonestar Shipping Solutions and the Artificer's Guild, a rather curious attempt at merging the munchkin 5000 of lonestar infamy and \
	designs taken directly from the guild arc welder. What it produced was a munchkin and arc welder combo with much finer tuned properties, efficient fuel economy, comfortable hand grips, and plenty of slots for tool augments."
	icon_state = "polytool"
	item_state = "polytool"
	max_health = 300
	w_class = ITEM_SIZE_NORMAL
	worksound = WORKSOUND_DRIVER_TOOL
	switched_on_qualities = list(QUALITY_SCREW_DRIVING = 75, QUALITY_WELDING = 60, QUALITY_BOLT_TURNING = 75, QUALITY_DRILLING = 40, QUALITY_PRYING = 50, QUALITY_WIRE_CUTTING = 30, QUALITY_HAMMERING = 50, QUALITY_SHOVELING = 50, QUALITY_SAWING = 50, QUALITY_CUTTING = 50, QUALITY_PULSING = 60, QUALITY_CAUTERIZING = 30)
	price_tag = 3000
	use_fuel_cost = 0.05
	max_fuel = 100
	toggleable = TRUE
	create_hot_spot = TRUE
	glow_color = COLOR_BLUE_LIGHT
	max_upgrades = 4 //Superior in all ways to the munchkin and arc welder as a tool, only way to obtain it is through guild crafting or getting really lucky in cargo tech lockers. Give how fuck rare munckins are, balance by scarcity factor. -Kaz

/obj/item/tool/polytool/engimultitool
	name = "Artificer's Guild \"Little Helper\" omnitool"
	desc = "The Artificer's Guild \"Little Helper\" is a mechanized, handheld all-in-one tool based on the polytool so known and loved. Convenient to use and highly customizable but less effecient than specialized tools and not suitable for advanced crafting applications."
	icon_state = "engi_omni"
	item_state = "engi_omni"
	max_health = 300
	w_class = ITEM_SIZE_NORMAL
	worksound = WORKSOUND_DRIVER_TOOL
	switched_on_qualities = list(QUALITY_SCREW_DRIVING = 30, QUALITY_WELDING = 30, QUALITY_BOLT_TURNING = 30, QUALITY_DRILLING = 20, QUALITY_PRYING = 30, QUALITY_WIRE_CUTTING = 30, QUALITY_HAMMERING = 30, QUALITY_SHOVELING = 30, QUALITY_SAWING = 30, QUALITY_CUTTING = 30, QUALITY_PULSING = 30, QUALITY_CAUTERIZING = 10)
	matter = list(MATERIAL_PLASTEEL = 5, MATERIAL_STEEL = 3)
	price_tag = 1400
	use_power_cost = 2
	suitable_cell = /obj/item/cell/medium
	toggleable = TRUE
	glow_color = COLOR_BLUE_LIGHT
	max_upgrades = 5
	workspeed = 0.8

/obj/item/tool/polytool/marqua
	name = "Mar'quaian poly tool"
	desc = "A complicated mess of drivers, bits, wrench heads, snips and pliers, this intricate mess of a tool in a handle has it all, its made of a strange alloy yet still has a slot under it for fuel."
	icon_state = "clustertool"
	item_state = "clustertool"
	max_health = 300
	w_class = ITEM_SIZE_NORMAL
	worksound = WORKSOUND_DRIVER_TOOL
	switched_on_qualities = list(QUALITY_SCREW_DRIVING = 75, QUALITY_BOLT_TURNING = 75, QUALITY_DRILLING = 40, QUALITY_PULSING = 60, QUALITY_WIRE_CUTTING = 30, QUALITY_WELDING = 60, QUALITY_CAUTERIZING = 30)
	price_tag = 6000
	use_fuel_cost = 0.01
	max_fuel = 100
	toggleable = TRUE
	create_hot_spot = TRUE
	glow_color = COLOR_BLUE_LIGHT
	max_upgrades = 0 //Superior in all ways to the munchkin and arc welder as a tool, only way to obtain it is through guild crafting or getting really lucky in cargo tech lockers. Give how fuck rare munckins are, balance by scarcity factor. -Kaz

/obj/item/tool/medmultitool
	name = "Greyson Positronic \"Autosurgeon\" medical omnitool"
	desc = "A compact Greyson Positronic medical omnitool. It has all surgery tools and takes a medium cell in its handle."
	icon_state = "medmulti"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_GLASS = 2, MATERIAL_PLATINUM = 2)
	flags = CONDUCT
	origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 4)
	tool_qualities = list(QUALITY_CLAMPING = 40, QUALITY_RETRACTING = 40, QUALITY_BONE_SETTING = 40, QUALITY_CAUTERIZING = 40, QUALITY_SAWING = 30, QUALITY_CUTTING = 40, QUALITY_LASER_CUTTING = 30, QUALITY_WIRE_CUTTING = 25, QUALITY_BONE_GRAFTING = 50)
	suitable_cell = /obj/item/cell/medium
	use_power_cost = 0.2 //Effective!
	max_upgrades = 2
	workspeed = 1.2
	price_tag = 1400 // Super fancy
	degradation = 2
	allow_greyson_mods = TRUE

/obj/item/tool/medmultitool/medimplant
	name = "Soteria medical omnitool implant"
	desc = "An all-in-one medical tool based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels, and requires a medium power cell."
	icon_state = "medmulti_sci"
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
	allow_greyson_mods = FALSE

	use_power_cost = 1.2
	suitable_cell = /obj/item/cell/medium

	max_upgrades = 1

/obj/item/tool/medmultitool/medimplant/sci
	name = "Soteria medical \"Minidoc\" omnitool"
	desc = "An all-in-one medical tool based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels, and requires a small power cell. This one is a cheap copy of better versions."
	icon_state = "medimplant"
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
	name = "engineering omnitool implant"
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


/obj/item/tool/multitool_improvised
	name= "improvised multitool implant"
	desc = "A jury-rigged implant, holding cobbled-together tools. For those who are more interested in tool carrying than scared of tetanus."
	icon = 'icons/obj/surgery.dmi'
	icon_state = "multitool_improvised"
	force = WEAPON_FORCE_PAINFUL
	switched_on_forcemult = 0.8
	worksound = WORKSOUND_DRIVER_TOOL
	flags = CONDUCT
	switched_on_qualities = list(
		QUALITY_CUTTING = 15,
		QUALITY_DRILLING = 5,
		QUALITY_SCREW_DRIVING = 15,
		QUALITY_WIRE_CUTTING = 20,
		QUALITY_RETRACTING = 10,
		QUALITY_BONE_SETTING = 10,
		QUALITY_PRYING = 10,
		QUALITY_HAMMERING = 20,
		QUALITY_BOLT_TURNING = 20,
		QUALITY_SHOVELING = 25,
		QUALITY_DIGGING = 25,
		QUALITY_EXCAVATION = 10,
		QUALITY_SAWING = 15,
		QUALITY_WELDING = 15,
		QUALITY_CAUTERIZING = 10)
	degradation = 1.5
	workspeed = 0.8

	max_upgrades = 3

	sparks_on_use = TRUE
	eye_hazard = TRUE //USE SAFTY GEAR NOT SQUINTS >:T

	use_fuel_cost = 0.1
	max_fuel = 40

	toggleable = TRUE
	create_hot_spot = TRUE
	glow_color = COLOR_ORANGE

	heat = 2250

/obj/item/tool/factorial_omni
	name = "blessed touch"
	desc = "Through the right litanies, a Factorial can coax bolts to turn and metal to join of their own accord, albeit not quite as effectively as actual tools."
	icon_state = "fact_omni"
	force = WEAPON_FORCE_DANGEROUS
	worksound = WORKSOUND_PULSING
	w_class = ITEM_SIZE_HUGE
	slot_flags = null
	sanctified = TRUE //Isn't affected by the general Absolutist speed penalty, still has its slow workspseed
	flags = CONDUCT
	tool_qualities = list(QUALITY_SCREW_DRIVING = 30, QUALITY_BOLT_TURNING = 30, QUALITY_DRILLING = 30, QUALITY_WELDING = 30, QUALITY_PRYING = 30, QUALITY_DIGGING = 30, QUALITY_PULSING = 30, QUALITY_WIRE_CUTTING = 30, QUALITY_HAMMERING = 30, QUALITY_SHOVELING = 30, QUALITY_EXCAVATION = 30, QUALITY_SAWING = 30, QUALITY_CUTTING = 30)
	no_double_tact = TRUE
	degradation = 0
	workspeed = 0.8
	max_upgrades = 0 // Can't upgrade it
	price_tag = 0
	var/mob/living/carbon/holder // The one that summoned the tool

/obj/item/tool/factorial_omni/New(var/loc, var/mob/living/carbon/Maker)
	..()
	holder = Maker
	START_PROCESSING(SSobj, src)

/obj/item/tool/factorial_omni/Process()
	..()
	if(loc != holder) // We're no longer in the owner's hand.
		visible_message("The [src.name] fades into nothingness.")
		STOP_PROCESSING(SSobj, src)
		qdel(src)
		return

/obj/item/tool/tessellate_omni
    name = "mending touch"
    desc = "Through the compassionate prayer, a Tessellate can ply and mend broken flesh, albeit not quite as effectively as actual tools."
    icon_state = "fact_omni"
    force = WEAPON_FORCE_DANGEROUS
    worksound = WORKSOUND_DRIVER_TOOL
    w_class = ITEM_SIZE_HUGE
    slot_flags = null
    sanctified = TRUE //Isn't affected by the general Absolutist speed penalty, still has its slow workspseed
    flags = CONDUCT
    tool_qualities = list(QUALITY_CLAMPING = 30, QUALITY_CAUTERIZING = 30, QUALITY_RETRACTING = 30, QUALITY_DRILLING = 30, QUALITY_SAWING = 30, QUALITY_BONE_SETTING = 30, QUALITY_CUTTING = 30, QUALITY_BONE_GRAFTING = 30)
    no_double_tact = TRUE
    degradation = 0
    workspeed = 0.8
    max_upgrades = 0 // Can't upgrade it
    price_tag = 0
    var/mob/living/carbon/holder // The one that summoned the tool

/obj/item/tool/tessellate_omni/New(var/loc, var/mob/living/carbon/Maker)
    ..()
    holder = Maker
    START_PROCESSING(SSobj, src)

/obj/item/tool/tessellate_omni/Process()
    ..()
    if(loc != holder) // We're no longer in the owner's hand.
        visible_message("The [src.name] fades into nothingness.")
        STOP_PROCESSING(SSobj, src)
        qdel(src)
        return
