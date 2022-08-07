/datum/ai_behavior/resist/perform(delta_time, datum/ai_controller/controller)
	. = ..()
	var/mob/living/living_pawn = controller.pawn
	living_pawn.resist()
	finish_action(controller, TRUE)

/datum/ai_behavior/battle_screech
	///List of possible screeches the behavior has
	var/list/screeches

/datum/ai_behavior/battle_screech/perform(delta_time, datum/ai_controller/controller)
	. = ..()
	var/mob/living/living_pawn = controller.pawn
	var/screech = pick(screeches)
	living_pawn.visible_message(screech) //TODO: improve this
	finish_action(controller, TRUE)

///Moves to target then finishes
/datum/ai_behavior/move_to_target
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT

/datum/ai_behavior/move_to_target/perform(delta_time, datum/ai_controller/controller)
	. = ..()
	finish_action(controller, TRUE)

/// Use in hand the currently held item
/*/datum/ai_behavior/use_in_hand
	behavior_flags = AI_BEHAVIOR_MOVE_AND_PERFORM


/datum/ai_behavior/use_in_hand/perform(delta_time, datum/ai_controller/controller)
	. = ..()
	var/mob/living/pawn = controller.pawn
	var/obj/item/held = pawn.get_item_by_slot(pawn.get_active_hand()) //NIKO TODO: Delete this or convert it to whatever you changed it to when youre done
	if(!held)
		finish_action(controller, FALSE)
		return
	pawn.activate_hand(pawn.get_active_hand())
	finish_action(controller, TRUE) */

/// Use the currently held item, or unarmed, on a weakref to an object in the world
/*/datum/ai_behavior/use_on_object
	required_distance = 1
	behavior_flags = AI_BEHAVIOR_REQUIRE_MOVEMENT

/datum/ai_behavior/use_on_object/setup(datum/ai_controller/controller, target_key)
	. = ..()
	var/datum/weakref/target_ref = controller.blackboard[target_key]
	var/target = target_ref?.resolve()
	if(!target)
		return FALSE
	controller.current_movement_target = target

/datum/ai_behavior/use_on_object/perform(delta_time, datum/ai_controller/controller, target_key)
	. = ..()
	var/mob/living/pawn = controller.pawn
	var/obj/item/held_item = pawn.get_item_by_slot(pawn.get_active_hand())
	var/datum/weakref/target_ref = controller.blackboard[target_key]
	var/atom/target = target_ref?.resolve()

	if(!target || !pawn.CanReach(target))
		finish_action(controller, FALSE)
		return

	pawn.set_combat_mode(FALSE)
	if(held_item)
		held_item.melee_attack_chain(pawn, target)
	else
		pawn.UnarmedAttack(target, TRUE)

	finish_action(controller, TRUE) */

/**find and set
 * Finds an item near themselves, sets a blackboard key as it. Very useful for ais that need to use machines or something.
 * if you want to do something more complicated than find a single atom, change the search_tactic() proc
 * cool tip: search_tactic() can set lists
 */
/datum/ai_behavior/find_and_set
	action_cooldown = 5 SECONDS

/datum/ai_behavior/find_and_set/perform(delta_time, datum/ai_controller/controller, set_key, locate_path, search_range)
	. = ..()
	var/find_this_thing = search_tactic(controller, locate_path, search_range)
	if(find_this_thing)
		controller.blackboard[set_key] = WEAKREF(find_this_thing)
		finish_action(controller, TRUE)
	else
		finish_action(controller, FALSE)

/datum/ai_behavior/find_and_set/proc/search_tactic(datum/ai_controller/controller, locate_path, search_range)
	return locate(locate_path) in oview(search_range, controller.pawn)
