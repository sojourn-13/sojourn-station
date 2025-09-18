////////////////////////////////////////////////////////////////////////////////
/// HYPOSPRAY //Sprites by INFRARED_BARON#8170
////////////////////////////////////////////////////////////////////////////////

/obj/item/reagent_containers/hypospray
	name = "hypospray"
	desc = "The Soteria medical hypospray is a sterile, air-needle autoinjector for rapid administration of drugs to patients."
	icon = 'icons/obj/syringe.dmi'
	item_state = "hypospray"
	icon_state = "hypospray"
	amount_per_transfer_from_this = 5
	var/default_transfer_amount = 5
	unacidable = 1
	volume = 40
	var/bypass_suit = FALSE // Whether this hypospray can bypass suits/armour when injecting
	possible_transfer_amounts = null
	reagent_flags = OPENCONTAINER
	slot_flags = SLOT_BELT
	preloaded_reagents = list("tricordrazine" = 40)
	var/injtime = 0 //A simple delay in injecting
	var/time = 8 //Standard inject time (seconds)


/obj/item/reagent_containers/hypospray/New()
	..()
	// remember the default transfer amount so we can restore it when vials are removed
	default_transfer_amount = amount_per_transfer_from_this
	update_icon()

/obj/item/reagent_containers/hypospray/update_icon()
	if(reagents?.total_volume > 0)
		icon_state = "hypospray"
	else
		icon_state = "hypospray_empty"


/obj/item/reagent_containers/hypospray/on_reagent_change()
	..()
	// Keep the sprite in sync with reagent changes
	update_icon()


/obj/item/reagent_containers/hypospray/proc/inject_body_bag(obj/structure/closet/body_bag/bag, mob/user)
	// Basic implementation: if a living mob is inside the bag, inject them.
	if(!bag)
		return FALSE
	if(bag.opened)
		to_chat(user, SPAN_NOTICE("The [bag] is open."))
		return TRUE
	if(!reagents?.total_volume)
		to_chat(user, SPAN_WARNING("[src] is empty."))
		return FALSE

	// find a living mob inside the bag's contents
	var/mob/living/target_mob = null
	for(var/atom/A in bag.contents)
		if(istype(A, /mob/living))
			target_mob = A
			break

	if(target_mob)
		return inject_mob(target_mob, user)

	to_chat(user, SPAN_NOTICE("The [bag] is empty."))
	return TRUE


/obj/item/reagent_containers/hypospray/proc/inject_mob(mob/living/M, mob/user)
	if(!M || !reagents?.total_volume)
		return FALSE

	// Determine injection duration and validate the target can be injected.
	injtime = time
	var/mob/living/carbon/human/H = M
	if(istype(H))
		var/obj/item/clothing/suit/space/SS = H.get_equipped_item(slot_wear_suit)
		var/obj/item/rig/RIG = H.get_equipped_item(slot_back)
		if(H.a_intent == I_HURT)
			user.visible_message(SPAN_WARNING("[user] tries to inject [M] with [src]! But [M] is actively resisting"), SPAN_WARNING("You begin injecting [M] but they seem to be resisting."))
			injtime += 10
		// If a rig or suit is deployed, apply the timing penalty and check for
		// robotic-suit refusal. This mirrors syringe behaviour but is kept
		// separate from the biological can_inject() checks below.
		if((istype(RIG) && RIG.suit_is_deployed()) || istype(SS))
			injtime += 10
			var/obj/item/organ/external/affected = H.get_organ(BP_CHEST)
			if(BP_IS_ROBOTIC(affected))
				to_chat(user, SPAN_WARNING("Injection port on [M]'s suit is refusing your [src]."))
				if(RIG)
					playsound(src.loc, 'sound/machines/buzz-two.ogg', 50, 1 -3)
					RIG.visible_message("\icon[RIG]\The [RIG] states \"Attention: User of this suit appears to be synthetic origin\".")
				return FALSE
		// If biological injection is refused, handle low-bio exceptions or
		// allow armour-only failures to be bypassed when src.bypass_suit is set.
		if(!H.can_inject(user, FALSE))
			var/obj/item/organ/external/affected = H.get_organ(user.targeted_organ)
			var/skip_due_to_armor = FALSE
			if(src.bypass_suit)
				if(user.targeted_organ == BP_HEAD)
					var/obj/item/clothing/head/HHEAD = H.get_equipped_item(slot_head)
					if(HHEAD && (HHEAD.item_flags & THICKMATERIAL))
						skip_due_to_armor = TRUE
				else
					if(SS && (SS.item_flags & THICKMATERIAL))
						skip_due_to_armor = TRUE
			// If we did NOT skip due to armour, perform the standard can_inject
			// fallback (low-bio auto-inject or rejection).
			if(!skip_due_to_armor)
				if(BP_IS_LIFELIKE(affected) && user && user.stats.getStat(STAT_BIO) < STAT_LEVEL_BASIC)
					if(M.reagents)
						var/trans = reagents.remove_any(amount_per_transfer_from_this)
						user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
						to_chat(user, SPAN_NOTICE("[trans] units injected, [reagents.total_volume] units remaining in \the [src]."))
						return TRUE
					else
						H.can_inject(user, TRUE)
						return FALSE
	else if(!M.can_inject(user, TRUE))
		return FALSE

	// If injecting someone else, perform the timed action so the progress bar shows.
	if(M != user)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		user.do_attack_animation(M)
		if(injtime)
			user.visible_message(SPAN_WARNING("[user] begins injecting [M]!"), SPAN_WARNING("You begin injecting [M]!"))
			if(!do_mob(user, M, injtime))
				return FALSE

	// Perform transfer, logging and feedback.
	var/contained = reagents.log_list()
	var/trans = reagents.trans_to_mob(M, amount_per_transfer_from_this, CHEM_BLOOD)
	admin_inject_log(user, M, src, contained, trans)
	to_chat(user, SPAN_NOTICE("[trans] units injected. [reagents.total_volume] units remaining in the [src]."))
	playsound(src.loc, 'sound/machines/click.ogg', 25)
	return TRUE


/obj/item/reagent_containers/hypospray/proc/use_after(obj/target, mob/living/user, click_parameters)
	// Fallback hook: child types may override. Return TRUE if handled.
	return FALSE

/obj/item/reagent_containers/hypospray/attack(mob/living/M as mob, mob/user as mob)
	if(!reagents.total_volume)
		to_chat(user, SPAN_WARNING("[src] is empty."))
		return
	if (!istype(M))
		return
	injtime = time //This -could- be abused but only in such narrow circumstances and with such meager payoff that it's fine. it's fine.
	// Handling errors and injection duration
	var/mob/living/carbon/human/H = M
	if(istype(H))
		var/obj/item/clothing/suit/space/SS = H.get_equipped_item(slot_wear_suit)
		var/obj/item/rig/RIG = H.get_equipped_item(slot_back)
		if(H.a_intent == I_HURT)
			user.visible_message(SPAN_WARNING("[user] trys to inject [M] with [src]! But [M] is actively resisting"), SPAN_WARNING("You inject begin injecting [M] with [src] but they seem to be resisting."))
			injtime += 10 //Not as good as having a real suit on
		// If a rig or suit is deployed, apply the timing penalty and check for
		// robotic-suit refusal. This mirrors syringe behaviour but is kept
		// separate from the biological can_inject() checks below.
		if((istype(RIG) && RIG.suit_is_deployed()) || istype(SS))
			injtime += 30
			var/obj/item/organ/external/affected = H.get_organ(BP_CHEST)
			if(BP_IS_ROBOTIC(affected))
				to_chat(user, SPAN_WARNING("Injection port on [M]'s suit is refusing your [src]."))
				if(RIG)
					playsound(src.loc, 'sound/machines/buzz-two.ogg', 50, 1 -3)
					RIG.visible_message("\icon[RIG]\The [RIG] states \"Attention: User of this suit appears to be synthetic origin\".")
				return
		// If biological injection is refused, handle low-bio exceptions or
		// allow armour-only failures to be bypassed when src.bypass_suit is set.
		if(!H.can_inject(user, FALSE))
			var/obj/item/organ/external/affected = H.get_organ(user.targeted_organ)
			var/skip_due_to_armor = FALSE
			if(src.bypass_suit)
				if(user.targeted_organ == BP_HEAD)
					var/obj/item/clothing/head/HHEAD = H.get_equipped_item(slot_head)
					if(HHEAD && (HHEAD.item_flags & THICKMATERIAL))
						skip_due_to_armor = TRUE
				else
					if(SS && (SS.item_flags & THICKMATERIAL))
						skip_due_to_armor = TRUE
			if(skip_due_to_armor)
				if(M.reagents)
					var/trans = reagents.remove_any(amount_per_transfer_from_this)
					user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
					to_chat(user, SPAN_NOTICE("[trans] units injected, [reagents.total_volume] units remaining in \the [src]."))
				return
			else
				if(BP_IS_LIFELIKE(affected) && user && user.stats.getStat(STAT_BIO) < STAT_LEVEL_BASIC)
					if(M.reagents)
						var/trans = reagents.remove_any(amount_per_transfer_from_this)
						user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
						to_chat(user, SPAN_NOTICE("[trans] units injected, [reagents.total_volume] units remaining in \the [src]."))
						return TRUE
					else
						H.can_inject(user, TRUE)
						return FALSE
	else if(!M.can_inject(user, TRUE))
		return
	// handling injection duration on others
	if(M != user)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		user.do_attack_animation(M)
		if(injtime)
			user.visible_message(SPAN_WARNING("[user] begins injecting [M]!"), SPAN_WARNING("You begins injecting [M]!"))
			if(do_mob(user, M, injtime))
				user.visible_message(SPAN_WARNING("[user] injects [M] with [src]!"), SPAN_WARNING("You inject [M] with [src]."))
			else
				return
	// handling actual injection
	// on this stage we are sure that everything is alright
	var/contained = reagents.log_list()
	var/trans = reagents.trans_to_mob(M, amount_per_transfer_from_this, CHEM_BLOOD)
	admin_inject_log(user, M, src, contained, trans)
	to_chat(user, SPAN_NOTICE("[trans] units injected. [reagents.total_volume] units remaining in \the [src]."))
	return


/obj/item/reagent_containers/hypospray/vial/afterattack(atom/target, mob/user, proximity)
	// Allow drawing from reagent containers and injecting mobs like a syringe does.
	if(!proximity || !target)
		return

	// Drawing from reagent containers (beakers/bottles)
	if(istype(target, /obj/item/reagent_containers/glass))
		if(!target.reagents?.total_volume)
			to_chat(user, SPAN_NOTICE("The [target] is empty."))
			return
		var/trans = target.reagents.trans_to_obj(src, amount_per_transfer_from_this)
		to_chat(user, SPAN_NOTICE("You fill \the [src] with [trans] units of the solution."))
		return

	// Injecting into mobs or injectable objects
	if(ismob(target) || target.is_injectable())
		if(!reagents.total_volume)
			to_chat(user, SPAN_NOTICE("The [src] is empty."))
			return
		// If it's a mob, use the existing inject_mob which handles checks/logging
		if(ismob(target))
			return inject_mob(target, user)
		// Otherwise, inject into the object directly
		var/trans = reagents.trans_to(target, amount_per_transfer_from_this)
		user.visible_message(SPAN_WARNING("[user] injects [target] with [src]!"), SPAN_WARNING("You inject [target] with [src]."))
		to_chat(user, SPAN_NOTICE("You inject [trans] units into [target]."))
		return


/obj/item/reagent_containers/hypospray/verb/empty()
	set name = "Empty Hypospray"
	set category = "Object"
	set src in usr

	if (alert(usr, "Are you sure you want to empty that?", "Empty Bottle:", "Yes", "No") != "Yes")
		return
	if(isturf(usr.loc))
		to_chat(usr, SPAN_NOTICE("You empty \the [src] onto the floor."))
		reagents.splash(usr.loc, reagents.total_volume)


/obj/item/reagent_containers/hypospray/vial
	name = "SI medical hypospray"
	desc = "The Soteria medical hypospray is a sterile, air-needle autoinjector for rapid administration of drugs to patients for convenience and efficiency. Uses a replaceable 30u vial."
	item_state = "hypo"
	icon_state = "hypo"
	possible_transfer_amounts = list(1,2,5,10,15,20,30)
	amount_per_transfer_from_this = 5
	volume = 0
	time = 5
	bypass_suit = TRUE
	var/single_use = FALSE
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	var/obj/item/reagent_containers/glass/beaker/vial/loaded_vial


/obj/item/reagent_containers/hypospray/vial/attack(mob/living/M as mob, mob/user as mob)
	// Simple wrapper for vial variant: forward to inject_mob which handles transfer/logging.
	if(!reagents.total_volume)
		to_chat(user, SPAN_WARNING("[src] is empty."))
		return
	return inject_mob(M, user)


/obj/item/reagent_containers/hypospray/vial/update_icon()
	// For the vial hypospray, prefer showing the "loaded" sprite when a vial
	// object is present. This prevents the icon from appearing empty briefly
	// when reagents are transferred into/out of the underlying reagent pool.
	if(loaded_vial)
		icon_state = "hypo"
	else
		icon_state = "hypo_empty"


/obj/item/reagent_containers/hypospray/vial/on_reagent_change()
	// Keep the vial hypospray icon in sync with reagent changes and vial state
	update_icon()

/obj/item/reagent_containers/hypospray/vial/New()
	..()
	loaded_vial = new /obj/item/reagent_containers/glass/beaker/vial(src)
	volume = loaded_vial.volume
	reagents.maximum_volume = loaded_vial.reagents.maximum_volume
	// adopt the vial's transfer amount so each injection uses the expected quantity
	amount_per_transfer_from_this = loaded_vial.amount_per_transfer_from_this

	// Ensure the icon reflects the newly-loaded vial
	update_icon()


/obj/item/reagent_containers/hypospray/vial/proc/remove_vial(mob/user, swap_mode)
	if(!loaded_vial)
		return
	reagents.trans_to_holder(loaded_vial.reagents,volume)
	reagents.maximum_volume = 0
	loaded_vial.update_icon()
	user.put_in_hands(loaded_vial)
	loaded_vial = null
	// Refresh our icon now that the vial is gone
	update_icon()
	if (swap_mode != "swap") // if swapping vials, we will print a different message in another proc
		to_chat(user, "You remove the vial from the [src].")


/obj/item/reagent_containers/hypospray/vial/attack_hand(mob/user)
	return ..()


// Support click-dragging (mouse drop) to a hand UI slot to remove the vial.
// Mirrors patterns used by guns/ammo which respond to MouseDrop when dropped
// onto a hand slot.
/* MouseDrop(over_object, src_location, over_location)
   - over_object: the atom under the mouse (often a /obj/screen/inventory/hand when
	 dragging over a hand slot)
*/
/obj/item/reagent_containers/hypospray/vial/MouseDrop(over_object, src_location, over_location)
	..()
	// If the hypospray is held by the user and the drop target is a hand
	// inventory UI, treat this as a drag-to-hand and remove the vial.
	if(src.loc == usr && istype(over_object, /obj/screen/inventory/hand))
		if(loaded_vial)
			remove_vial(usr)
			update_icon()
			playsound(loc, 'sound/weapons/flipblade.ogg', 50, 1)
			return TRUE
	return



/obj/item/reagent_containers/hypospray/vial/use_tool(mob/living/user, obj/item/W, atom/target, base_time, required_quality, fail_chance, required_stat, instant_finish_tier = 110, forced_sound = null, sound_repeat = 2.5 SECONDS)
	if(istype(W, /obj/item/reagent_containers/glass/beaker/vial))
		// The parent use_tool signature is used so other code can call this with
		// keyword args. We still want to accept loading from the user's hand, so
		// detect the vial in the user's hands by searching their held items.
		var/obj/item/W = null
		// Look for a vial in the user's active hand or inventory that we can load
		for(var/atom/A in user.contents)
			if(istype(A, /obj/item/reagent_containers/glass/beaker/vial))
				W = A
				break
		// If we didn't find a vial or the action was interrupted, abort.
		if(!W || !do_after(user, 1 SECOND, src) || !(W in user))
			return TRUE
		// Try to unequip the vial from the user into the hypospray. Some edge cases
		// (slot inaccessible, custom mob logic) may make unEquip fail; attempt a safe
		// fallback move so vials can still be loaded from the hand.
		var/succeeded = FALSE
		if(user.unEquip(W, src))
			succeeded = TRUE
		else
			// If the vial is in the user's inventory or hands, try to forcibly move it into the hypospray.
			if(W in user)
				// Detach it from the user's inventory and set its location to the hypospray.
				user.remove_from_mob(W)
				W.loc = src
				succeeded = TRUE

		if(!succeeded)
			to_chat(user, SPAN_WARNING("You can't unequip [W]."))
			return TRUE
		var/usermessage = ""
		if(loaded_vial)
			remove_vial(user, "swap")
			usermessage = "You load \the [W] into \the [src] as you remove the old one."
		else
			usermessage = "You load \the [W] into \the [src]."
		if(W.is_open_container())
			W.update_icon()
		loaded_vial = W
		reagents.maximum_volume = loaded_vial.reagents.maximum_volume
		// adopt the vial's volume and transfer amount so each injection uses the expected quantity
		volume = loaded_vial.volume
		amount_per_transfer_from_this = loaded_vial.amount_per_transfer_from_this
		loaded_vial.reagents.trans_to_holder(reagents, volume)
		user.visible_message(SPAN_NOTICE("[user] has loaded [W] into \the [src]."),SPAN_NOTICE("[usermessage]"))
		update_icon()
		playsound(src.loc, 'sound/weapons/empty.ogg', 50, 1)
		return TRUE
	return FALSE


// parent-level attackby removed: vial-loading/attackby is handled by the vial subtype (use_tool / vial/attackby)


/obj/item/reagent_containers/hypospray/vial/attackby(obj/item/W, mob/user)
	// Allow clicking a vial onto the hypospray to load it, bypassing parent use_tool restrictions.
	if(istype(W, /obj/item/reagent_containers/glass/beaker/vial))
		// call use_tool with (user, target, ...) as the parent signature expects
		return use_tool(user, W, null)
	return ..()


/obj/item/reagent_containers/hypospray/vial/use_after(obj/target, mob/living/user, click_parameters) // hyposprays can be dumped into, why not out? uses standard_pour_into helper checks. Hyposprays can also inject through bags
	if (istype(target, /obj/structure/closet/body_bag))
		inject_body_bag(target, user)
		return TRUE

	if (!reagents.total_volume && istype(target, /obj/item/reagent_containers/glass))
		var/good_target = is_type_in_list(target, list(
			/obj/item/reagent_containers/glass/beaker,
			/obj/item/reagent_containers/glass/bottle
		))
		if (!good_target)
			return
		if (!target.reagents?.total_volume)
			return TRUE
		var/trans = target.reagents.trans_to_obj(src, amount_per_transfer_from_this)
		to_chat(user, SPAN_NOTICE("You fill \the [src] with [trans] units of the solution."))
		return TRUE
	else
		standard_pour_into(user, target)
		return TRUE

/obj/item/reagent_containers/hypospray/vial/combat
	// Combat variant of the vial hypospray: different icons for loaded/empty
	name = "SI combat hypospray"
	desc = "The Soteria combat hypospray is a sterile, air-needle autoinjector for rapid administration of drugs to patients while under hostile fire. Uses a replaceable 30u vial."
	icon_state = "combat_hypo"
	item_state = "combat_hypo"
	time = 0 // faster inject time for combat variant (seconds)

/obj/item/reagent_containers/hypospray/vial/combat/update_icon()
	// Only show the empty combat sprite when there is no loaded vial
	if(loaded_vial)
		icon_state = "combat_hypo"
	else
		icon_state = "combat_hypo_empty"

/obj/item/reagent_containers/hypospray/autoinjector
	name = "autoinjector (inaprovaline)"
	desc = "A rapid and safe way to administer small amounts of drugs by untrained or trained personnel. Anyone with a syringe and some chemicals can refill or even replace the loaded reagents, provided \
	they know how to properly use a syringe."
	w_class = ITEM_SIZE_TINY
	slot_flags = SLOT_EARS
	icon_state = "syrette_inopravoline"
	item_state = "syrette_inopravoline"
	amount_per_transfer_from_this = 5
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 1)
	reagent_flags = INJECTABLE | DRAINABLE | AMOUNT_VISIBLE | REFILLABLE
	volume = 5
	preloaded_reagents = list("inaprovaline" = 5)
	var/can_be_refilled = TRUE //For cargos
	var/baseline_sprite = "syrette_inopravoline" //Mostly used for chemmasters so we dont need to init(sprite name), to allow mid-round changing of icons.
	injtime = 2 //Instant was a bit to powerful well refilling

/obj/item/reagent_containers/hypospray/autoinjector/sugar
	name = "autoinjector (Emergency Glucose)"
	desc = "A Soteria proprietary injector. Meant for even the most dull-minded individuals, these are marked with a stylized symbol of a Cortical Borer. For emergencies, rogue borers, and-or diabetic shock."
	preloaded_reagents = list("sugar" = 5)
	can_be_refilled = FALSE
	injtime = 5

/obj/item/reagent_containers/hypospray/autoinjector/examine(mob/user)
	..()
	if(can_be_refilled)
		to_chat(user, "<span class='info'>This one is refillable.</span>")

/obj/item/reagent_containers/hypospray/autoinjector/on_reagent_change()
	..()
	if(reagents?.total_volume <= 0 && !can_be_refilled) //Prevents autoinjectors from being refilled when it cant be refilled
		reagent_flags &= ~INJECTABLE
		reagent_flags &= ~REFILLABLE

/obj/item/reagent_containers/hypospray/autoinjector/update_icon()
	cut_overlays()
	if(reagents?.total_volume > 0)
		icon_state = "[baseline_sprite]"
	else
		icon_state = "[baseline_sprite]_spent"
	price_tag = 0

/obj/item/reagent_containers/hypospray/autoinjector/chemmaters
	icon_state = "syrette"
	item_state = "syrette"
	baseline_sprite = "syrette"
	preloaded_reagents = list()

/obj/item/reagent_containers/hypospray/autoinjector/antitoxin
	name = "autoinjector (anti-toxin)"
	icon_state = "syrette_antitox"
	item_state = "syrette_antitox"
	baseline_sprite = "syrette_antitox"
	preloaded_reagents = list("anti_toxin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/tricordrazine
	name = "autoinjector (tricordrazine)"
	icon_state = "syrette_tricord"
	item_state = "syrette_tricord"
	baseline_sprite = "syrette_tricord"
	preloaded_reagents = list("tricordrazine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/kelotane
	name = "autoinjector (kelotane)"
	icon_state = "syrette_yellow"
	item_state = "syrette_yellow"
	baseline_sprite = "syrette_yellow"
	preloaded_reagents = list("kelotane" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/bicaridine
	name = "autoinjector (bicaridine)"
	icon_state = "syrette_red"
	item_state = "syrette_red"
	baseline_sprite = "syrette_red"
	preloaded_reagents = list("bicaridine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/antirad
	name = "autoinjector (anti-rad)"
	icon_state = "syrette_green"
	item_state = "syrette_green"
	baseline_sprite = "syrette_green"
	preloaded_reagents = list("hyronalin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/dexalin
	name = "autoinjector (dexalin)"
	icon_state = "syrette_cyan"
	item_state = "syrette_cyan"
	baseline_sprite = "syrette_cyan"
	preloaded_reagents = list("dexalin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/tramadol
	name = "autoinjector (tramadol)"
	icon_state = "syrette_magenta"
	item_state = "syrette_magenta"
	baseline_sprite = "syrette_magenta"
	preloaded_reagents = list("tramadol" = 5)

// Intermediate
/obj/item/reagent_containers/hypospray/autoinjector/polystem
	name = "autoinjector (polystem)"
	icon_state = "syrette_magenta"
	item_state = "syrette_magenta"
	baseline_sprite = "syrette_magenta"
	preloaded_reagents = list("polystem" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/meralyne
	name = "autoinjector (meralyne)"
	icon_state = "syrette_magenta"
	item_state = "syrette_magenta"
	baseline_sprite = "syrette_magenta"
	preloaded_reagents = list("meralyne" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/dermaline
	name = "autoinjector (dermaline)"
	icon_state = "syrette_orange"
	item_state = "syrette_orange"
	baseline_sprite = "syrette_orange"
	preloaded_reagents = list("dermaline" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/dexalinplus
	name = "autoinjector (dexalin plus)"
	preloaded_reagents = list("dexalinp" = 5)
	icon_state = "syrette_blue"
	item_state = "syrette_blue"
	baseline_sprite = "syrette_blue"

/obj/item/reagent_containers/hypospray/autoinjector/oxycodone
	name = "autoinjector (oxycodone)"
	preloaded_reagents = list("oxycodone" = 5)
	icon_state = "syrette_blue"
	item_state = "syrette_blue"
	baseline_sprite = "syrette_blue"

/obj/item/reagent_containers/hypospray/autoinjector/ryetalyn
	name = "autoinjector (ryetalyn)"
	preloaded_reagents = list("ryetalyn" = 5)
	icon_state = "syrette_orange"
	item_state = "syrette_orange"
	baseline_sprite = "syrette_orange"

/obj/item/reagent_containers/hypospray/autoinjector/quickclot
	name = "autoinjector (quickclot)"
	preloaded_reagents = list("quickclot" = 5)
	icon_state = "syrette_quickclot"
	item_state = "syrette_quickclot"
	baseline_sprite = "syrette_quickclot"

/obj/item/reagent_containers/hypospray/autoinjector/sanguinum
	name = "autoinjector (sanguinum)"
	preloaded_reagents = list("sanguinum" = 5)
	icon_state = "syrette_red"
	item_state = "syrette_red"
	baseline_sprite = "syrette_red"

/obj/item/reagent_containers/hypospray/autoinjector/spaceacillin
	name = "autoinjector (spaceacillin)"
	icon_state = "syrette_spacealine"
	item_state = "syrette_spacealine"
	baseline_sprite = "syrette_spacealine"
	preloaded_reagents = list("spaceacillin" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/hyperzine
	name = "autoinjector (hyperzine)"
	icon_state = "syrette_hyperzine"
	item_state = "syrette_hyperzine"
	baseline_sprite = "syrette_hyperzine"
	preloaded_reagents = list("hyperzine" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/drugs
	name = "autoinjector (drugs)"
	icon_state = "syrette_fun1"
	item_state = "syrette_fun1"
	baseline_sprite = "syrette_fun1"
	preloaded_reagents = list("space_drugs" = 5)

/obj/item/reagent_containers/hypospray/autoinjector/quickhealbrute
	name = "autoinjector (brute-aid)"
	icon_state = "syrette_red"
	item_state = "syrette_red"
	baseline_sprite = "syrette_red"
	preloaded_reagents = list("bicaridine" = 1, "meralyne" = 1, "seligitillin" = 1, "tricordrazine" = 1, "polystem" = 1)
	price_tag = 100
	can_be_refilled = FALSE

/obj/item/reagent_containers/hypospray/autoinjector/quickhealburn
	name = "autoinjector (burn-aid)"
	icon_state = "syrette_yellow"
	item_state = "syrette_yellow"
	baseline_sprite = "syrette_yellow"
	preloaded_reagents = list("kelotane" = 1.25, "dermaline" = 1.25, "tricordrazine" = 1.25, "polystem" = 1.25)
	price_tag = 100
	can_be_refilled = FALSE

/obj/item/reagent_containers/hypospray/autoinjector/large //bigger storage, not refillable. great for medical to sell, I suppose?
	name = "advanced autoinjector" //placeholder
	desc = "A larger, more robust autoinjector whos design prevents refilling, but allows for much more storage. A proprietary Soteria design."
	icon_state = "supeyrette" //fancy animated sprite courtesy of Guidesu.
	item_state = "supeyrette"
	amount_per_transfer_from_this = 10
	reagent_flags = INJECTABLE | DRAINABLE | AMOUNT_VISIBLE
	volume = 10
	preloaded_reagents = list("inaprovaline" = 10)
	can_be_refilled = FALSE //No refill!!!
	baseline_sprite = "supeyrette"
	injtime = 5 //150% longer inject time for 100% more storage.A worthy trade off for this tool


/obj/item/reagent_containers/hypospray/autoinjector/large/chemmaters
	icon_state = "supeyrette" //still missing the icons from doll.
	item_state = "supeyrette"
	baseline_sprite = "supeyrette"
	preloaded_reagents = list()

/obj/item/reagent_containers/hypospray/autoinjector/large/meralyn
	name = "meralyn advanced autoinjector"
	preloaded_reagents = list("meralyn" = 10)

/obj/item/reagent_containers/hypospray/autoinjector/large/vermicetol
	name = "vermicetol advanced autoinjector"
	preloaded_reagents = list("vermicetol" = 10)

/obj/item/reagent_containers/hypospray/autoinjector/large/varceptol
	name = "varceptol advanced autoinjector"
	preloaded_reagents = list("varceptol" = 10)

/obj/item/reagent_containers/hypospray/autoinjector/large/blood
	name = "adv-bleed repair advanced autoinjector"
	preloaded_reagents = list("nanoblood" = 2, "sanguinum" = 5, "quickclot" = 3)

/obj/item/reagent_containers/hypospray/autoinjector/large/antirad
	name = "adv-antirad advanced autoinjector"
	preloaded_reagents = list("arithrazine" = 5, "peridaxon" = 3, "anti_toxin" = 2)

/obj/item/reagent_containers/hypospray/autoinjector/large/peridaxon
	name = "alky-peri advanced autoinjector"
	preloaded_reagents = list("peridaxon" = 5, "alkysine" = 5)
