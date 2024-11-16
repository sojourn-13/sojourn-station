/obj/item/tool/karl
	name = "KASMT 'Karl' Mining Tool"
	desc = "The Kinetic Acceleration Modular Swappable  Tool is a dual-purpose tool, combining a rugged mining axe with a high-powered energy gun. Its sturdy steel build and sharp edges effortlessly carve through tough materials. With a swift switch, it transforms into a precision plasma gun, boasting a dangerous energy blade and a futuristic plasma-powered punch. Versatile, durable, and adaptable, it's the ultimate companion for miners and defenders alike. It has an inbuilt hand-crank and yes miners its a feature to you crank the gun like crazy. It has an 'R' on the side of it."
	flags = CONDUCT
	slot_flags = SLOT_BELT
	icon = 'icons/obj/karl_mining.dmi'
	icon_state = "karl_axe"
	item_state = "karl_axe"
	degradation = 0.5
	max_health = 340
	w_class = ITEM_SIZE_BULKY
	price_tag = 1700
	matter = list(MATERIAL_STEEL = 35, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 5, MATERIAL_PLASTEEL = 20)
	origin_tech = list(TECH_MATERIAL = 4, TECH_ENGINEERING = 4)
	attack_verb = list("swung", "hacked", "struck", "blasted", "fired", "zapped", "discharged", "cut", "cleaved", "pierced")
	hitsound = 'sound/weapons/blunthit.ogg'

	// Damage related
	force = WEAPON_FORCE_DANGEROUS
	armor_divisor = ARMOR_PEN_EXTREME
	throwforce = WEAPON_FORCE_NORMAL
	sharp = TRUE
	structure_damage_factor = STRUCTURE_DAMAGE_DESTRUCTIVE // Drills and picks are made for getting through hard materials
	embed_mult = 1.4 // Digs deep

	// Spawn and value related

	// Turn on-off related
	toggleable = TRUE
	tool_qualities = list(QUALITY_DIGGING = 25, QUALITY_PRYING = 15, QUALITY_CUTTING = 15) // So it still shares its switch off quality despite not yet being used.
	switched_off_qualities = list(QUALITY_DIGGING = 25, QUALITY_PRYING = 15, QUALITY_CUTTING = 15)
	switched_on_qualities = list(QUALITY_DIGGING = 45, QUALITY_WELDING = 10, QUALITY_PRYING = 5, QUALITY_CUTTING = 15)
	suitable_cell = /obj/item/cell/medium/high
	use_power_cost = 1.7
	passive_power_cost = 0.09
	glow_color = COLOR_BLUE_LIGHT

	// Gun-mode related
	action_button_name = "Switch K.A.S.M.T Mode"
	var/gunmode = FALSE  // TRUE when KARL is in gun mode
	var/obj/item/gun/energy/plasma/installation = /obj/item/gun/energy/plasma	// The inbuilt gun. Store as path to initialize a new gun on creation.
	var/projectile			// Holder for bullettype
	var/shot_sound 			// What sound should play when the gun fires
	var/reqpower = 80		// Power needed to shoot

/obj/item/tool/karl/New()
	. = ..()

	// Init inbuilt gun
	if(ispath(installation))
		installation = new installation
		projectile = installation.projectile_type
		shot_sound = installation.fire_sound

/obj/item/tool/karl/Initialize()
	. = ..()
	verbs += /obj/item/tool/karl/proc/toggle_mode_verb

/obj/item/tool/karl/Destroy()
	QDEL_NULL(installation)
	. = ..()

/obj/item/tool/karl/update_icon()
	cut_overlays()

	var/karl_icon = "karl"
	if(gunmode)
		karl_icon += "_gun"
	else
		karl_icon += "_axe"
		if(switched_on)
			karl_icon += "_on"

	icon_state = karl_icon  // Item sprite

	if(wielded)
		karl_icon += "_wielded"

	item_state = karl_icon  // On-suit sprite

/obj/item/tool/karl/equipped(mob/user)
	..()
	update_icon()

/obj/item/tool/karl/dropped(mob/user)
	..()
	update_icon()

/obj/item/tool/karl/attack_self(mob/user)
	if(isbroken)
		to_chat(user, SPAN_WARNING("\The [src] is broken."))
		return
	if(gunmode)
		if(cell)
			if(!cell.fully_charged())
				var/pumping_time = wielded ? 1 SECOND : 2 SECONDS
				if(do_after(user, pumping_time))
					if(cell)  // Check the cell is still there in case big brain player chose to remove it during pumping
						cell.give(use_power_cost * 1 SECOND) // Enough to use the tool during 1 second
						to_chat(user, SPAN_NOTICE("You recharge \the [src] by pumping it, cell charge at [round(cell.percent())]%."))
						// Continue pumping till user cancels the pumping
						attack_self(user)
			else
				to_chat(user, SPAN_NOTICE("\The [src]\'cell is fully charged'."))
		else
			to_chat(user, SPAN_NOTICE("\The [src] is missing a cell to recharge."))
		return
	..()
	return

/obj/item/tool/karl/turn_on(mob/user)
	. = ..()
	if(.)
		to_chat(user, SPAN_NOTICE("A dangerous energy blade now covers the edges of the tool."))

/obj/item/tool/karl/turn_off(mob/user)
	to_chat(user, SPAN_NOTICE("The energy blade swiftly retracts."))
	..()

// Same values than /obj/item/proc/use_tool
/obj/item/tool/karl/use_tool(mob/living/user, atom/target, base_time, required_quality, fail_chance, required_stat, instant_finish_tier = 110, forced_sound = null, sound_repeat = 2.5 SECONDS)
	. = ..()  // That proc will return TRUE only when everything was done right, and FALSE if something went wrong, ot user was unlucky.

	// Recharge upon successfull use when switched off
	if(. && !switched_on && cell)
		cell.give(use_power_cost * 1 SECOND) // Enough to use the tool during 1 second

/obj/item/tool/karl/proc/toggle_mode_verb()
	set name = "Unique Action"
	set category = "Object"
	set src in view(1)

	toggle_karl_mode(usr)

/obj/item/tool/karl/proc/toggle_karl_mode(mob/user)
	gunmode = !gunmode
	to_chat(user, SPAN_NOTICE("\The [src] switches to [gunmode ? "gun" : "tool"] mode."))
	update_icon()
	update_wear_icon()

/obj/item/tool/karl/afterattack(atom/target, mob/user, proximity, params)

	if(isbroken)
		to_chat(user, SPAN_WARNING("\The [src] is broken."))
		return

	if(gunmode)
		if(!wielded)
			to_chat(user, SPAN_WARNING("\The [src] must be wielded to shoot."))
			return
		if(!cell?.checked_use(reqpower))
			to_chat(user, SPAN_WARNING("[src] battery is dead or missing."))
			return
		shootAt(target, user.targeted_organ)
		user.setClickCooldown(1 SECOND)
		return

	return ..()

/obj/item/tool/karl/proc/shootAt(var/mob/living/target, def_zone)

	// Check source and destination
	var/turf/T = get_turf(src)
	var/turf/U = get_turf(target)
	if(!istype(T) || !istype(U))
		return

	// Launching projectile
	var/obj/item/projectile/A = new projectile(loc)
	playsound(loc, shot_sound, 75, 1)

	// Shooting Code
	A.launch(target, def_zone)

/obj/item/tool/karl/ui_action_click(mob/user, actiontype)
	switch(actiontype)
		if("Tool information")
			nano_ui_interact(user)
		else
			toggle_karl_mode(user)
