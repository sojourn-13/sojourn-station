/obj/item/weapon/tool/omnitool
	name = "Lonestars \"Munchkin 5000\""
	desc = "A fuel powered monster of a tool. Its welding attachment is capable of welding things without an eye-damaging flash, so no eye protection is required."
	icon_state = "omnitool"
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

/obj/item/weapon/tool/arcwelder
	name = "arc welder"
	desc = "A specialized tool designed by the Artificer's Guild. It functions as a portable battery powered welder, multitool, and incredibly painful taser. Due to its complex design it doesn't require welding goggles nor conduct shocks."
	icon_state = "arc_welder"
	item_state = "arc_welder"
	w_class = ITEM_SIZE_NORMAL
	worksound = WORKSOUND_WELDING
	switched_on_qualities = list(QUALITY_WELDING = 40, QUALITY_PULSING = 30, QUALITY_WIRE_CUTTING = 15, QUALITY_CAUTERIZING = 10)
	matter = list(MATERIAL_PLASTEEL = 2, MATERIAL_PLASTIC = 3)
	price_tag = 1000 //valuable given its design
	use_power_cost = 1.2
	sparks_on_use = TRUE
	force = WEAPON_FORCE_WEAK
	switched_on_force = WEAPON_FORCE_PAINFUL
	throwforce = WEAPON_FORCE_WEAK
	suitable_cell = /obj/item/weapon/cell/medium
	toggleable = TRUE
	create_hot_spot = TRUE
	glow_color = COLOR_BLUE_LIGHT
	max_upgrades = 3
	var/stunforce = 0
	var/agonyforce = 40
	var/hitcost = 100

/obj/item/weapon/tool/arcwelder/turn_on(mob/user)

	if (cell && cell.charge > 0)
		item_state = "[initial(item_state)]_on"
		to_chat(user, SPAN_NOTICE("You switch [src] on."))
		playsound(loc, 'sound/effects/sparks4.ogg', 50, 1)
		..()
		damtype = BURN
	else
		item_state = initial(item_state)
		to_chat(user, SPAN_WARNING("[src] has no power!"))

/obj/item/weapon/tool/arcwelder/turn_off(mob/user)
	item_state = initial(item_state)
	playsound(loc, 'sound/effects/sparks1.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You switch [src] off."))
	..()
	damtype = initial(damtype)

/obj/item/weapon/tool/arcwelder/apply_hit_effect(mob/living/target, mob/living/user, var/hit_zone)
	if(isrobot(target))
		return ..()

	var/agony = agonyforce
	var/stun = stunforce
	var/obj/item/organ/external/affecting = null
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		affecting = H.get_organ(hit_zone)

	if(user.a_intent == I_HURT)
		. = ..()
		if (!.)
			return 0

		//whacking someone causes a much poorer electrical contact than deliberately prodding them.
		stun *= 0.5
		if(switched_on)		//Checks to see if the arc welder is on.
			agony *= 0.5	//whacking someone causes a much poorer contact than prodding them.
		else
			agony = 0	//Shouldn't really stun if it's off, should it?
		//we can't really extract the actual hit zone from ..(), unfortunately. Just act like they attacked the area they intended to.
	else if(!switched_on)
		if(affecting)
			target.visible_message(SPAN_WARNING("[target] has been prodded in the [affecting.name] with [src] by [user]. Luckily it was off."))
		else
			target.visible_message(SPAN_WARNING("[target] has been prodded with [src] by [user]. Luckily it was off."))
	else
		if(affecting)
			target.visible_message(SPAN_DANGER("[target] has been prodded in the [affecting.name] with [src] by [user]!"))
		else
			target.visible_message(SPAN_DANGER("[target] has been prodded with [src] by [user]!"))
		playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)

	//stun effects
	if(switched_on)
		target.stun_effect_act(stun, agony, hit_zone, src)
		msg_admin_attack("[key_name(user)] stunned [key_name(target)] with the [src].")

		deductcharge(hitcost)

		if(ishuman(target))
			var/mob/living/carbon/human/H = target
			H.forcesay(hit_appends)

/obj/item/weapon/tool/arcwelder/proc/deductcharge(var/power_drain)
	if(cell)
		if(cell.checked_use(power_drain))
			return TRUE
		else
			switched_on = FALSE
			update_icon()
			return FALSE

/obj/item/weapon/tool/medmultitool
	name = "greyson positronic medmultitool"
	desc = "A compact Greyson Positronic medical multitool. It has all surgery tools."
	icon_state = "medmulti"
	matter = list(MATERIAL_STEEL = 3, MATERIAL_GLASS = 2, MATERIAL_PLATINUM = 2)
	flags = CONDUCT
	origin_tech = list(TECH_MATERIAL = 3, TECH_BIO = 4)
	tool_qualities = list(QUALITY_CLAMPING = 30, QUALITY_RETRACTING = 30, QUALITY_BONE_SETTING = 30, QUALITY_CAUTERIZING = 30, QUALITY_SAWING = 15, QUALITY_CUTTING = 30, QUALITY_WIRE_CUTTING = 25)

	max_upgrades = 2
	workspeed = 1.2

/obj/item/weapon/tool/medmultitool/medimplant
	name = "Medical Omnitool"
	desc = "An all-in-one medical tool implant based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels, and requires a medium power cell."
	icon_state = "medimplant"
	matter = null
	force = WEAPON_FORCE_PAINFUL
	sharp = TRUE
	edge = TRUE
	worksound = WORKSOUND_DRIVER_TOOL
	flags = CONDUCT
	tool_qualities = list(QUALITY_CLAMPING = 30, QUALITY_RETRACTING = 30, QUALITY_BONE_SETTING = 30, QUALITY_CAUTERIZING = 30, QUALITY_SAWING = 15, QUALITY_CUTTING = 30, QUALITY_WIRE_CUTTING = 15)
	degradation = 0.5
	workspeed = 0.8

	use_power_cost = 1.2
	suitable_cell = /obj/item/weapon/cell/medium

	max_upgrades = 1

/obj/item/weapon/tool/medmultitool/medimplant/sci
	name = "Medical Omnitool"
	desc = "An all-in-one medical tool implant based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels, and requires a small power cell. This one was a cheap copy of of a buch better verson."
	icon_state = "medimplant_sci"
	matter = null //Nope
	degradation = 1
	workspeed = 0.2 //SLOW

	suitable_cell = /obj/item/weapon/cell/small

	max_upgrades = 0 //NO

/obj/item/weapon/tool/medmultitool/medimplant/organic
	name = "Organic Medical Omnitool"
	desc = "An all-in-one medical tool implant based on the legendary Greyson Positronic model. While convenient, it is less efficient than more advanced surgical tools, such as laser scalpels. This version is made of entirely organic materials and doesn't require a power cell, sadly it cannot be upgraded and work takes slightly longer, but at least it is self repairing."
	icon_state = "organicmedimplant"
	use_power_cost = 0
	suitable_cell = null
	degradation = 0
	max_upgrades = 0
	//matter = list(MATERIAL_BIOMATTER = 10) No

/obj/item/weapon/tool/engimplant
	name = "Engineering Omnitool"
	desc = "An all-in-one engineering tool implant. Convenient to use and more effective than the basics, but much less efficient than customized or more specialized tools."
	icon_state = "engimplant"
	force = WEAPON_FORCE_DANGEROUS
	worksound = WORKSOUND_DRIVER_TOOL
	flags = CONDUCT
	tool_qualities = list(QUALITY_SCREW_DRIVING = 35, QUALITY_BOLT_TURNING = 35, QUALITY_DRILLING = 15, QUALITY_WELDING = 30, QUALITY_CAUTERIZING = 10, QUALITY_PRYING = 25, QUALITY_DIGGING = 20, QUALITY_PULSING = 30, QUALITY_WIRE_CUTTING = 30, QUALITY_HAMMERING = 30)
	degradation = 0.5
	workspeed = 0.8

	use_power_cost = 0.8
	suitable_cell = /obj/item/weapon/cell/medium

	max_upgrades = 1

	var/buffer_name
	var/atom/buffer_object

/obj/item/weapon/tool/engimplant/Destroy() // code for omnitool buffers was copied from multitools.dm
	unregister_buffer(buffer_object)
	return ..()

/obj/item/weapon/tool/engimplant/proc/get_buffer(var/typepath)
	get_buffer_name(TRUE)
	if(buffer_object && (!typepath || istype(buffer_object, typepath)))
		return buffer_object

/obj/item/weapon/tool/engimplant/proc/get_buffer_name(var/null_name_if_missing = FALSE)
	if(buffer_object)
		buffer_name = buffer_object.name
	else if(null_name_if_missing)
		buffer_name = null
	return buffer_name

/obj/item/weapon/tool/engimplant/proc/set_buffer(var/atom/buffer)
	if(!buffer || istype(buffer))
		buffer_name = buffer ? buffer.name : null
		if(buffer != buffer_object)
			unregister_buffer(buffer_object)
			buffer_object = buffer
			if(buffer_object)
				GLOB.destroyed_event.register(buffer_object, src, /obj/item/weapon/tool/engimplant/proc/unregister_buffer)

/obj/item/weapon/tool/engimplant/proc/unregister_buffer(var/atom/buffer_to_unregister)
	// Only remove the buffered object, don't reset the name
	// This means one cannot know if the buffer has been destroyed until one attempts to use it.
	if(buffer_to_unregister == buffer_object && buffer_object)
		GLOB.destroyed_event.unregister(buffer_object, src)
		buffer_object = null

/obj/item/weapon/tool/engimplant/resolve_attackby(atom/A, mob/user)
	if(!isobj(A))
		return ..(A, user)

	var/obj/O = A
	var/datum/extension/multitool/MT = get_extension(O, /datum/extension/multitool)
	if(!MT)
		return ..(A, user)

	user.AddTopicPrint(src)
	MT.interact(src, user)
	return 1
