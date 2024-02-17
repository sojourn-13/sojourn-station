// File for all the parts needed for the handmade drones.

// Control Module used in all the custom bots.
/obj/item/bot_part
	name = "robot parts"
	desc = "Parts for the assembly of a robot."
	icon = 'icons/mob/custom_bot.dmi'

/obj/item/bot_part/control
	name = "custom control module"
	desc = "A programable control board for robots."
	icon_state = "mainboard"
	origin_tech = list(TECH_DATA = 3)

// Parts for the fabrication of the roomba.
/obj/item/bot_part/roomba
	name = "roomba parts"
	desc = "Parts for the assembly of a roomba."
	icon = 'icons/mob/custom_bot.dmi'

/obj/item/bot_part/roomba/roomba_frame
	desc = "It's a frame for a roomba."
	name = "Roomba Chassis"
	icon_state = "roomba_frame_0"
	force = 3.0
	throwforce = 10.0
	throw_speed = 2
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	var/build_step = 0 // Used to know at which part of the assembly process we are.
	var/created_name = "Roomba" // The name the roomba will start with.
	var/step_message = "It is missing a custom control module." // What does the assembly need next.
	var/obj/item/cell/medium/power_cell // The power cell the roomba has

/obj/item/bot_part/roomba/roomba_frame/examine(mob/user)
	..() // Default stuff
	to_chat(user, "It has '[created_name]' written on its nametag.")
	to_chat(user, "[step_message]") // Let the user know what he need to do next.

/obj/item/bot_part/roomba/roomba_treads
	name = "roomba treads"
	desc = "Treads for the assembly of a roomba."
	icon_state = "roomba_treads"

// Armor Plating
/obj/item/bot_part/roomba/roomba_plating
	name = "roomba plating"
	desc = "Some steel sheets for attaching on a roomba to give it protection."
	icon_state = "roomba_armor"
	var/health_bonus = 100

	// The total armor it will give to the roomba.
	var/list/armor_stat = list(
		melee = 6,
		bullet = 6,
		energy = 6,
		bomb = 25,
		bio = 100, // It's a robot, no pain or diseases for you buddy.
		agony = 100
	)

/obj/item/bot_part/roomba/roomba_plating/heavy
	name = "heavy roomba plating"
	desc = "Some plasteel sheets for attaching on a roomba to give it extra protection."
	icon_state = "roomba_armor_heavy"
	health_bonus = 200
	armor_stat = list(
		melee = 12,
		bullet = 12,
		energy = 12,
		bomb = 50,
		bio = 100,
		agony = 100
	)

// Knife
/obj/item/bot_part/roomba/roomba_knife
	name = "roomba knife"
	desc = "A knife with tape on it, for attaching on a roomba."
	icon_state = "roomba_knife"
	tool_qualities = list() // So that it can't trigger the screwdriving part.
	var/damage_boost = 30 // The damage bonus it give to the roomba when installed.

// SI Sword Drone
/obj/item/bot_part/sword_part
	name = "Sword Drone Parts"
	desc = "Parts used for the construction of a Soteria Sword Drone."

/obj/item/bot_part/sword_part/main_frame
	name = "Sword Drone Chassis"
	desc = "It's a frame for a sword drone."
	icon_state = "sword_frame_0"
	force = 3.0
	throwforce = 10.0
	throw_speed = 2
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	var/build_step = 0 // Used to know at which part of the assembly process we are.
	var/created_name = "Sword Drone" // The name the drone will start with.
	var/step_message = "It is missing a left arm." // What does the assembly need next.
	var/obj/item/cell/large/power_cell // The power cell the drone has

/obj/item/bot_part/sword_part/main_frame/examine(mob/user)
	..() // Default stuff
	to_chat(user, "It has '[created_name]' written on its nametag.")
	to_chat(user, "[step_message]") // Let the user know what he need to do next.

// SI Mantis Drone
/obj/item/bot_part/mantis_part
	name = "Mantis Drone Parts"
	desc = "Parts used for the construction of a Soteria Mantis Drone."

/obj/item/bot_part/mantis_part/main_frame
	name = "Mantis Drone Chassis"
	desc = "It's a frame for a mantis drone."
	icon_state = "mantis_frame_0"
	force = 3.0
	throwforce = 10.0
	throw_speed = 2
	throw_range = 5
	w_class = ITEM_SIZE_NORMAL
	var/build_step = 0 // Used to know at which part of the assembly process we are.
	var/created_name = "Mantis Drone" // The name the drone will start with.
	var/step_message = "It is missing a left arm frame." // What does the assembly need next.
	var/obj/item/cell/large/power_cell // The power cell the drone has

/obj/item/bot_part/mantis_part/main_frame/examine(mob/user)
	..() // Default stuff
	to_chat(user, "It has '[created_name]' written on its nametag.")
	to_chat(user, "[step_message]") // Let the user know what he need to do next.

// Drone Limb
/obj/item/bot_part/head_frame
	name = "Head Frame"
	icon_state = "head_frame"

/obj/item/bot_part/left_arm_frame
	name = "Left Arm Frame"
	icon_state = "left_arm_frame"

/obj/item/bot_part/right_arm_frame
	name = "Right Arm Frame"
	icon_state = "right_arm_frame"

/obj/item/bot_part/left_leg_frame
	name = "Left Leg Frame"
	icon_state = "left_leg_frame"

/obj/item/bot_part/right_leg_frame
	name = "Right Leg Frame"
	icon_state = "right_leg_frame"

// Fabrication Kit : Everything to make a Roomba/Drone.
/obj/item/storage/box/roomba_kit
	name = "Custom Roomba Fabrication Kit"
	desc = "Everything to make your own Roomba! Tools not included."

/obj/item/storage/box/roomba_kit/populate_contents()
	new /obj/item/bot_part/roomba/roomba_frame(src)
	new /obj/item/bot_part/control(src)
	new /obj/item/cell/medium/moebius(src)
	new /obj/item/bot_part/roomba/roomba_treads(src)
	new /obj/item/stack/cable_coil(src, 5, "red")

/obj/item/storage/box/sword_drone_kit
	name = "Custom Sword Drone Fabrication Kit"
	desc = "Everything to make your own Soteria-brand Sword Drone! Tools not included."

/obj/item/storage/box/sword_drone_kit/populate_contents()
	new /obj/item/bot_part/sword_part/main_frame(src)
	new /obj/item/bot_part/left_arm_frame(src)
	new /obj/item/bot_part/right_arm_frame(src)
	new /obj/item/bot_part/left_leg_frame(src)
	new /obj/item/bot_part/right_leg_frame(src)
	new /obj/item/bot_part/head_frame(src)
	new /obj/item/tool_upgrade/augment/hydraulic(src)
	new /obj/item/organ_module/active/simple/armblade/energy_blade(src)
	new /obj/item/cell/large/moebius(src)
	new /obj/item/bot_part/control(src)
	new /obj/item/stack/cable_coil(src, 10, "red")
	new /obj/item/clothing/suit/armor/vest/soteriasuit(src)
	new /obj/item/tool_upgrade/productivity/red_paint(src)

/obj/item/storage/box/mantis_drone_kit
	name = "Custom Mantis Drone Fabrication Kit"
	desc = "Everything to make your own Soteria-brand Mantis Drone! Tools not included."

/obj/item/storage/box/mantis_drone_kit/populate_contents()
	new /obj/item/bot_part/mantis_part/main_frame(src)
	new /obj/item/bot_part/left_arm_frame(src)
	new /obj/item/bot_part/right_arm_frame(src)
	new /obj/item/bot_part/left_leg_frame(src)
	new /obj/item/bot_part/right_leg_frame(src)
	new /obj/item/bot_part/head_frame(src)
	new /obj/item/tool_upgrade/augment/hydraulic(src)
	new /obj/item/organ_module/active/simple/armblade(src)
	new /obj/item/organ_module/active/simple/armblade(src)
	new /obj/item/cell/large/moebius(src)
	new /obj/item/bot_part/control(src)
	new /obj/item/stack/cable_coil(src, 10, "red")
	new /obj/item/clothing/suit/armor/vest/soteriasuit(src)
	new /obj/item/tool_upgrade/productivity/red_paint(src)
