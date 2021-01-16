/**
 * Multitool -- A multitool is used for hacking electronic devices.
 * TO-DO -- Using it as a power measurement tool for cables etc. Nannek.
 *
 */

/obj/item/weapon/tool/multitool
	name = "multitool"
	desc = "Used for pulsing wires to test which to cut. You can use this on airlocks or APCs to try to hack them."
	icon_state = "multitool"
	flags = CONDUCT
	force = WEAPON_FORCE_HARMLESS
	w_class = ITEM_SIZE_SMALL
	throwforce = WEAPON_FORCE_HARMLESS
	worksound = WORKSOUND_PULSING
	tool_qualities = list(QUALITY_PULSING = 30)
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1)
	origin_tech = list(TECH_MAGNET = 1, TECH_ENGINEERING = 1)
	use_power_cost = 0.08
	suitable_cell = /obj/item/weapon/cell/small

	var/buffer_name
	var/atom/buffer_object

/obj/item/weapon/tool/multitool/bs
	name = "bluespace multitool"
	icon_state = "bs_multitool"
	tool_qualities = list(QUALITY_PULSING = 100)

/obj/item/weapon/tool/onestar_multitool
	name = "greyson positronic multitool"
	desc = "Used for pulsing wires to test which to cut. You can use this on airlocks or APCs to try to hack them. \
			The advanced and precise engineering allows for more DIY improvements then most Greyson Positronic tools ."
	icon_state = "one_star_multitool"
	tool_qualities = list(QUALITY_PULSING = 60)
	matter = list(MATERIAL_PLASTIC = 2, MATERIAL_GLASS = 1, MATERIAL_PLATINUM = 1, MATERIAL_DIAMOND = 1)
	origin_tech = list(TECH_MAGNET = 6, TECH_ENGINEERING = 6)
	use_power_cost = 0.01
	degradation = 0.6
	workspeed = 1.6
	max_upgrades = 5 //UNLIMITED MODS!

/obj/item/weapon/tool/multitool/advanced
	name = "advanced multitool"
	desc = "Used for pulsing wires to test which to cut. You can use this on airlocks, APCs or even lockers to try to hack them. This verson is a more bulky and uses a medium cell."
	icon_state = "adv_multitool"
	tool_qualities = list(QUALITY_PULSING = 50)
	matter = list(MATERIAL_PLASTIC = 6, MATERIAL_GLASS = 5, MATERIAL_PLATINUM = 1)
	origin_tech = list(TECH_MAGNET = 5, TECH_ENGINEERING = 2)
	use_power_cost = 0.50
	workspeed = 1.2
	max_upgrades = 4
	suitable_cell = /obj/item/weapon/cell/medium


/obj/item/weapon/tool/multitool/Destroy()
	unregister_buffer(buffer_object)
	return ..()

/obj/item/weapon/tool/multitool/proc/get_buffer(var/typepath)
	// Only allow clearing the buffer name when someone fetches the buffer.
	// Means you cannot be sure the source hasn't been destroyed until the very moment it's needed.
	get_buffer_name(TRUE)
	if(buffer_object && (!typepath || istype(buffer_object, typepath)))
		return buffer_object

/obj/item/weapon/tool/multitool/proc/get_buffer_name(var/null_name_if_missing = FALSE)
	if(buffer_object)
		buffer_name = buffer_object.name
	else if(null_name_if_missing)
		buffer_name = null
	return buffer_name

/obj/item/weapon/tool/multitool/proc/set_buffer(var/atom/buffer)
	if(!buffer || istype(buffer))
		buffer_name = buffer ? buffer.name : null
		if(buffer != buffer_object)
			unregister_buffer(buffer_object)
			buffer_object = buffer
			if(buffer_object)
				GLOB.destroyed_event.register(buffer_object, src, /obj/item/weapon/tool/multitool/proc/unregister_buffer)

/obj/item/weapon/tool/multitool/proc/unregister_buffer(var/atom/buffer_to_unregister)
	// Only remove the buffered object, don't reset the name
	// This means one cannot know if the buffer has been destroyed until one attempts to use it.
	if(buffer_to_unregister == buffer_object && buffer_object)
		GLOB.destroyed_event.unregister(buffer_object, src)
		buffer_object = null

/obj/item/weapon/tool/multitool/resolve_attackby(atom/A, mob/user)
	if(!isobj(A))
		return ..(A, user)

	var/obj/O = A
	var/datum/extension/multitool/MT = get_extension(O, /datum/extension/multitool)
	if(!MT)
		return ..(A, user)

	user.AddTopicPrint(src)
	MT.interact(src, user)
	return 1
