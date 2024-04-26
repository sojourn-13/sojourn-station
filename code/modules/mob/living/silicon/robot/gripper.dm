//Simple borg hand.
//Limited use.
/obj/item/gripper
	name = "magnetic gripper"
	desc = "A simple grasping tool specialized in construction and engineering work."
	icon = 'icons/obj/device.dmi'

	description_info = "Can be used to remove sticky tape from cameras on help intent."
	description_antag = "Can be used for a strong brute attack on humans using harm intent."
	icon_state = "gripper"

	flags = NOBLUDGEON

	//Has a list of items that it can hold.
	var/list/can_hold = list(
		/obj/item/extinguisher,
		/obj/item/cell,
		/obj/item/firealarm_electronics,
		/obj/item/airalarm_electronics,
		/obj/item/airlock_electronics,
		/obj/item/tracker_electronics,
		/obj/item/stock_parts,
		/obj/item/frame,
		/obj/item/camera_assembly,
		/obj/item/tank,
		/obj/item/circuitboard,
		/obj/item/device/assembly,//Primarily for making improved cameras, but opens many possibilities
		/obj/item/computer_hardware,
		/obj/item/tool_upgrade,
		/obj/item/am_containment,
		/obj/item/am_shielding_container,
		/obj/item/stack/tile, //Repair floors yay
		/obj/item/oddity/blackbox_nanoforge
		)

	var/obj/item/wrapped = null // Item currently being held.

	var/force_holder = null //
	var/justdropped = 0//When set to 1, the gripper has just dropped its item, and should not attempt to trigger anything

/obj/item/gripper/examine(var/mob/user)
	..()
	if (wrapped)
		to_chat(user, span("notice", "It is holding \the [wrapped]"))
	else
		to_chat(user, "It is empty.")


/proc/grippersafety(var/obj/item/gripper/G)
	if (!G || !G.wrapped)//The object must have been lost
		return FALSE

	//The object left the gripper but it still exists. Maybe placed on a table
	if (G.wrapped.loc != G)
		//Reset the force and then remove our reference to it
		G.wrapped.force = G.force_holder
		G.wrapped = null
		G.force_holder = null
		G.update_icon()
		return FALSE

	return TRUE



/obj/item/gripper/proc/grip_item(obj/item/I as obj, mob/user as mob, var/feedback = 1)
	//This function returns 1 if we successfully took the item, or 0 if it was invalid. This information is useful to the caller
	if (!wrapped)
		if(is_type_in_list(I,can_hold))
			if (feedback)
				to_chat(user, "You collect \the [I].")
			I.do_pickup_animation(user.loc, I.loc)
			I.forceMove(src)
			wrapped = I
			update_icon()
			return TRUE
		if (feedback)
			to_chat(user, "<span class='danger'>Your gripper cannot hold \the [I].</span>")
		return FALSE
	if (feedback)
		to_chat(user, "<span class='danger'>Your gripper is already holding \the [wrapped].</span>")
	return FALSE


//This places a little image of the gripped item in the gripper, so you can see visually what you're holding
/obj/item/gripper/update_icon()
	underlays.Cut()
	if (wrapped && wrapped.icon)
		var/mutable_appearance/MA = new(wrapped)
		MA.layer = ABOVE_HUD_LAYER
		MA.plane = get_relative_plane(ABOVE_HUD_PLANE)

		//Reset pixel offsets to initial values, incase being on a table messed them up
		//And then subtract 8 from the Y value so it appears in the claw at the bottom
		MA.pixel_y = initial(MA.pixel_y)-8
		MA.pixel_x = initial(MA.pixel_x)

		underlays += MA

/obj/item/gripper/attack_self(mob/user as mob)
	if(wrapped)
		.=wrapped.attack_self(user)
		update_icon()
		return
	return ..()

/obj/item/gripper/AltClick(mob/user as mob)
	if(wrapped)
		.=wrapped.AltClick(user)
		update_icon()
	return ..()

/obj/item/gripper/verb/drop_item()

	set name = "Drop Item"
	set desc = "Release an item from your magnetic gripper."
	set category = "Robot Commands"

	drop(get_turf(src))

/obj/item/gripper/proc/drop(var/atom/target)
	if(wrapped && wrapped.loc == src)
		wrapped.forceMove(target)
	wrapped = null
	update_icon()
	return TRUE

/obj/item/gripper/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(wrapped) 	//The force of the wrapped obj gets set to zero during the attack() and afterattack().
		force_holder = wrapped.force
		wrapped.force = 0.0
		wrapped.attack(M,user)
		if(QDELETED(wrapped))
			wrapped = null
		return TRUE
	else// mob interactions
		switch (user.a_intent)
			if (I_HELP)
				user.visible_message("[user] [pick("boops", "squeezes", "pokes", "prods", "strokes", "bonks")] [M] with \the [src]")
			if (I_HURT)
				M.attack_generic(user,user.mob_size*0.5,"crushed")//about 20 dmg for a cyborg
				//Attack generic does a visible message so we dont need one here
				user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN*4)
				playsound(user, 'sound/effects/attackblob.ogg', 60, 1)
				//Slow,powerful attack for borgs. No spamclicking
	return FALSE

/obj/item/gripper/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if (wrapped)
		var/resolved = wrapped.attackby(O,user)
		if(!resolved && wrapped && O)
			O.afterattack(wrapped,user,1)//We pass along things targeting the gripper, to objects inside the gripper. So that we can draw chemicals from held beakers for instance
	return

/obj/item/gripper/afterattack(var/atom/target, var/mob/living/user, proximity, params)

	if(!proximity)
		return // This will prevent them using guns at range but adminbuse can add them directly to modules, so eh.

	//There's some weirdness with items being lost inside the arm. Trying to fix all cases. ~Z
	if(!wrapped)
		for(var/obj/item/thing in src.contents)
			wrapped = thing
			break

	if(wrapped) //Already have an item.
		return//This is handled in /mob/living/silicon/robot/GripperClickOn

	if(istype(target, /obj/machinery/camera) && user.a_intent == I_HELP)
		var/obj/machinery/camera/cam = target
		if(cam.taped)
			to_chat(user, SPAN_NOTICE("You remove the tape from \the [cam] using the edge of your magnetic gripper."))
			cam.icon_state = "camera"
			cam.taped = 0
			cam.set_status(1)

	else if (istype(target, /obj/item/storage) && !istype(target, /obj/item/storage/pill_bottle) && !istype(target, /obj/item/storage/secure))
		var/obj/item/storage/S = target
		for (var/obj/item/C in S.contents)
			if (grip_item(C, user, 0))
				to_chat(user, "You grab the [C] from inside the [target.name].")
				S.update_icon()
				return
		to_chat(user, "There is nothing inside the box that your gripper can collect")
		return

	else if(istype(target,/obj/item)) //Check that we're not pocketing a mob.

		//...and that the item is not in a container.
		if(!isturf(target.loc))
			return

		grip_item(target, user)

	else if (!justdropped)
		target.attack_ai(user)

	justdropped = 0


/*
	//Definitions of gripper subtypes
*/

// VEEEEERY limited version for mining borgs. Basically only for swapping cells, upgrading the drills, and upgrading custom KAs.
/obj/item/gripper/miner
	name = "drill maintenance gripper"
	desc = "A simple grasping tool for the maintenance of heavy drilling machines."
	icon_state = "gripper-mining"

	can_hold = list(
		/obj/item/cell,
		/obj/item/stock_parts,
		/obj/item/am_containment,
		/obj/item/am_shielding_container,
		/obj/item/circuitboard/miningdrill
	)

/obj/item/gripper/paperwork
	name = "paperwork gripper"
	desc = "A simple grasping tool for clerical work."

	can_hold = list(
		/obj/item/clipboard,
		/obj/item/paper,
		/obj/item/paper_bundle,
		/obj/item/card/id,
		/obj/item/book,
		/obj/item/newspaper,
		/obj/item/photo,
		/obj/item/spacecash,
		/obj/item/coin,
		/obj/item/device/toner,
		/obj/item/computer_hardware/hard_drive/portable
		)

/obj/item/gripper/research //A general usage gripper, used for toxins/robotics/xenobio/etc
	name = "scientific gripper"
	icon_state = "gripper-sci"
	desc = "A simple grasping tool suited to assist in a wide array of research applications."

	can_hold = list(
		/obj/item/cell,
		/obj/item/stock_parts,
		/obj/item/device/mmi,
		/obj/item/robot_parts,
		/obj/item/borg/upgrade,
		/obj/item/device/flash, //to build borgs,
		/obj/item/organ/internal/vital/brain, //to insert into MMIs,
		/obj/item/stack/cable_coil, //again, for borg building,
		/obj/item/circuitboard,
		/obj/item/slime_extract,
		/obj/item/reagent_containers/glass,
		/obj/item/reagent_containers/food/snacks/monkeycube,
		/obj/item/reagent_containers/blood,
		/obj/item/device/assembly,//For building bots and similar complex R&D devices
		/obj/item/device/scanner/health,//For building medibots
		/obj/item/disk,
		/obj/item/device/scanner/plant,//For farmbot construction
		/obj/item/tool/minihoe,//Farmbots and xenoflora
		/obj/item/seeds,
		/obj/item/tank,
		/obj/item/computer_hardware,
		/obj/item/am_containment,
		/obj/item/am_shielding_container,
		/obj/item/device/integrated_electronics,
		/obj/item/integrated_circuit
		)

/obj/item/gripper/chemistry //A gripper designed for chemistry and medical, to allow borgs to work efficiently in the lab
	name = "medical gripper"
	icon_state = "gripper-sci"
	desc = "A specialised grasping tool designed for working in chemistry and pharmaceutical labs, as well as have basic surgical uses."

	can_hold = list(
		/obj/item/reagent_containers/glass,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/spray,
		/obj/item/reagent_containers/blood,
		/obj/item/reagent_containers/hypospray,
		/obj/item/storage/pill_bottle,
		/obj/item/hand_labeler,
		/obj/item/am_containment,
		/obj/item/am_shielding_container,
		/obj/item/am_shielding_container,
		/obj/item/organ,
		/obj/item/organ_module,
		/obj/item/modification/organ,
		/obj/item/device/mmi,
		/obj/item/tank,
		/obj/item/reagent_containers/food/snacks/meat, //For grinding up roaches
		/obj/item/reagent_containers/food/snacks/grown, //For grinding up herbs
		/obj/item/genetics, //for doing genetics. Research borgs get this as well
		/obj/item/stack/material/plasma
		)

/obj/item/gripper/service //Used to handle food, drinks, and seeds.
	name = "service gripper"
	icon_state = "gripper"
	desc = "A simple grasping tool used to perform tasks in the service sector, such as handling food, drinks, and seeds."

	can_hold = list(
		/obj/item/reagent_containers/glass,
		/obj/item/reagent_containers/food,
		/obj/item/seeds,
		/obj/item/grown,
		/obj/item/trash,
		/obj/item/tool/broken_bottle,
		/obj/item/paper,
		/obj/item/newspaper,
		/obj/item/circuitboard/broken,
		/obj/item/am_containment,
		/obj/item/am_shielding_container,
		/obj/item/clothing/mask/smokable/cigarette,
		/obj/item/reagent_containers/cooking_with_jane/cooking_container,
		/obj/item/spatula
		)

/obj/item/gripper/ammo //Used to boxes, ammo and shells
	name = "ammo gripper"
	icon_state = "gripper-ammo"
	desc = "A gripper used for loading guns and ammo into boxes."

	can_hold = list(
		/obj/item/ammo_casing,
		/obj/item/ammo_kit,
		/obj/item/ammo_magazine,
		/obj/item/cell,
		/obj/item/part/gun,
		/obj/item/am_containment,
		/obj/item/am_shielding_container,
		/obj/item/mech_ammo_box
		)


/obj/item/gripper/upgrade //Used to boxes, ammo and shells
	name = "tool mod gripper"
	icon_state = "gripper-toolstuff"
	desc = "A gripper used to upgrade a borgs tools only holds mods and spare fuel."

	can_hold = list(
		/obj/item/tool_upgrade,
		/obj/item/weldpack/canister
		)


/obj/item/gripper/no_use //Used when you want to hold and put items in other things, but not able to 'use' the item

/obj/item/gripper/no_use/attack_self(mob/user as mob)
	return

/obj/item/gripper/no_use/loader //This is used to disallow building with metal.
	name = "sheet loader"
	desc = "A specialized loading device, designed to pick up and insert sheets of materials inside machines."
	icon_state = "gripper-sheet"

	can_hold = list(
		/obj/item/stack/material,
		/obj/item/stack/material/refined_scrap
		)
