// This file is for custom drones built using the build_a_drone.dmi file.
/mob/living/carbon/superior_animal/robot/custom_drone
	name = "Custom Drone"
	desc = "A custom-built drone. They come in a variety of color and equipment."
	icon = 'icons/mob/build_a_drone.dmi'
	icon_state = "drone_st"
	health = 100 // 10 more than Greyson's armored roomba
	maxHealth = 100
	melee_damage_lower = 10
	melee_damage_upper = 15
	faction = "neutral"
	cleaning = FALSE
	drop1 = null
	drop2 = null
	cell_drop = /obj/item/cell/large
	ranged = FALSE
	limited_ammo = FALSE
	colony_friend = TRUE
	friendly_to_colony = TRUE
	cant_be_pulled = FALSE
	wander = FALSE

	get_stat_modifier = FALSE

	// Vars that determine the parts used for the sprite.
	var/chassis = "" // The chassis of the drone.
	var/radio = "" // The radio of the drone.
	var/shell = "" // The shell of the drone.
	var/marks = "" // Marks of the drone.
	var/screen = "" // The screen of the drone.
	var/right_tool = "" // The tool/weapon on the right side
	var/left_tool = "" // The tool/weapon on the left side
	var/scanner = "" // The scanner on the drone

	// Different from the right/left_tools, those vars are for the type of weapon, which determine its attacks.
	var/right_weapon_type
	var/left_weapon_type
	var/list/possible_ranged_attack = list() // List of possible ranged attack that the drone switch between

/mob/living/carbon/superior_animal/robot/custom_drone/New()
	..()

/mob/living/carbon/superior_animal/robot/custom_drone/examine(mob/user)
	..()

	var/right_weapon
	var/left_weapon

	switch(right_weapon_type) // The equipment determine the drops
		if(TOOL_LASER)
			right_weapon = "laser gun"
		if(TOOL_GUN)
			right_weapon = "gun"
		if(TOOL_BOMB)
			right_weapon = "bomb"

	switch(left_weapon_type) // The equipment determine the drops
		if(TOOL_MEDIC)
			left_weapon = "syringe"
		if(TOOL_WELDER)
			left_weapon = "welder"
		if(TOOL_FLAMER)
			left_weapon = "flamer"

	if(right_weapon)
		to_chat(user, SPAN_NOTICE("[src] has a [right_weapon]."))
	if(left_weapon)
		to_chat(user, SPAN_NOTICE("[src] has a [left_weapon]."))

/mob/living/carbon/superior_animal/robot/custom_drone/update_icon()
	cut_overlays()
	icon_state = "[chassis]"
	add_overlay("[radio]")
	add_overlay("[shell]")
	add_overlay("[marks]")
	add_overlay("[screen]")
	add_overlay("[scanner]")
	add_overlay("[right_tool]")
	add_overlay("[left_tool]")
	return TRUE

/mob/living/carbon/superior_animal/robot/custom_drone/proc/customize(_chassis, _radio, _shell, _marks, _screen, _scanner, _right_weapon_type, _left_weapon_type, _right_tool, _left_tool)
	if(!_chassis) // We only check if the chassis is null because it's the base icon. Anything else that is missing in on the coder's fault.
		chassis = "drone_st"
	else
		chassis = _chassis
	radio = _radio
	shell = _shell
	marks = _marks
	screen = _screen
	scanner = _scanner
	right_weapon_type = _right_weapon_type
	left_weapon_type = _left_weapon_type
	right_tool = _right_tool
	left_tool = _left_tool
	update_icon()
	update_weaponry()
	return TRUE

/mob/living/carbon/superior_animal/robot/custom_drone/proc/update_weaponry()
	possible_ranged_attack = list() // Reset the attacks
	ranged = initial(ranged)

	switch(right_weapon_type) // The equipment determine the drops
		if(TOOL_LASER)
			drop1 = /obj/item/gun/energy/cog
			possible_ranged_attack.Add(/obj/item/projectile/beam)
			ranged = TRUE
		if(TOOL_GUN)
			drop1 = /obj/item/gun/projectile/spring
			possible_ranged_attack.Add(/obj/item/projectile/bullet/pistol_35)
			ranged = TRUE
		if(TOOL_BOMB)
			drop1 = /obj/item/plastique // Plastic Explosives.
		else
			drop1 = /obj/item/scrap_lump

	switch(left_weapon_type) // The equipment determine the drops
		if(TOOL_MEDIC)
			drop2 = /obj/item/reagent_containers/syringe/large
		if(TOOL_WELDER)
			drop2 = /obj/item/tool/weldingtool
		if(TOOL_FLAMER)
			drop2 = /obj/item/gun/flamethrower
			possible_ranged_attack.Add(/obj/item/projectile/flamer_lob/flamethrower)
			ranged = TRUE
		else
			drop2 = /obj/item/scrap_lump

/mob/living/carbon/superior_animal/robot/custom_drone/OpenFire(target_mob)
	projectiletype = pick(possible_ranged_attack) // Random attack based on what we can do
	if(projectiletype == /obj/item/projectile/beam) // We attack with the cog, who can fire in bursts
		rapid = TRUE
		rapid_fire_shooting_amount = 3
	..()
	rapid = FALSE // Reset after the attack is done to preset the spring or flamethrower from shooting in bursts

/mob/living/carbon/superior_animal/robot/custom_drone/UnarmedAttack(var/atom/A, var/proximity)
	. = ..()
	if(.) // Make sure our attacks hit first.
		if(left_weapon_type == TOOL_MEDIC) // Do we use chemical attacks?
			if(isliving(A))
				var/mob/living/L = A
				if(istype(L) && L.reagents)
					L.reagents.add_reagent("toxin", 2) // 2 unit of toxin per minute

		if(right_weapon_type == TOOL_BOMB) // Explode on attack
			src.visible_message(SPAN_DANGER("\The [src] makes an odd warbling noise, fizzles, and explodes!"))
			drop1 = null // We don't get the explosive
			explosion(get_turf(loc), 0, 0, 2, 3) // Same strength as the dropped explosive.
			death()

// For repairing damage to the synths.
/mob/living/carbon/superior_animal/robot/custom_drone/attackby(obj/item/W as obj, mob/user as mob)
	var/obj/item/T // Define the tool variable early on to avoid compilation problem and to allow us to use tool-unique variables
	if(user.a_intent == I_HELP) // Are we helping ?

		// If it is a tool, assign it to the tool variable defined earlier.
		if(istype(W, /obj/item/tool))
			T = W

		if(QUALITY_WELDING in T.tool_qualities)
			if(health < maxHealth)
				if(T.use_tool(user, src, WORKTIME_NORMAL, QUALITY_WELDING, FAILCHANCE_EASY, required_stat = STAT_MEC))
					user.visible_message(
										SPAN_NOTICE("[user] [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [src.name]."),
										SPAN_NOTICE("You [user.stats.getPerk(PERK_ROBOTICS_EXPERT) ? "expertly" : ""] repair the damage to [src.name].")
										)
					if(user.stats.getPerk(PERK_ROBOTICS_EXPERT))
						heal_overall_damage(50, 50)
					else
						heal_overall_damage(rand(30, 50), rand(30, 50))
					return
				return
			to_chat(user, "[src] doesn't need repairs.")
			return
	// If nothing was ever triggered, continue as normal
	..()
