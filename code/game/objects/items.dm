/obj/item
	name = "item"
	icon = 'icons/obj/items.dmi'
	w_class = ITEM_SIZE_NORMAL

	var/image/blood_overlay = null //this saves our blood splatter overlay, which will be processed not to go over the edges of the sprite
	var/randpixel = 6
	var/abstract = 0
	var/r_speed = 1.0
	health = null
	var/max_health = null
	var/burn_point = null
	var/burning = null
	var/hitsound = null
	var/worksound = null
	var/no_attack_log = 0			//If it's an item we don't want to log attack_logs with, set this to 1
	pass_flags = PASSTABLE

	//The cool stuff for melee
	var/screen_shake = FALSE 		//If a weapon can shake the victim's camera on hit.
	var/forced_broad_strike = FALSE //If a weapon is forced to always perform broad strikes.
	//Mostly used for spears when wielded, but can be placed on any item
	//Any value above 1 adds extra tiles it checks for reach
	//Also used in holsters and sheaths, code for handing is in item_attack.dm with "fancy_ranged_melee_attack"
	var/extended_reach = FALSE
	var/ready = FALSE					//All weapons that are ITEM_SIZE_BULKY or bigger have double tact, meaning you have to click twice.
	var/no_double_tact = FALSE			//for when you,  for some inconceivable reason, want a huge item to not have double tact
	var/double_tact_required = FALSE	//for when you,  you want smaller then huge items to have double tact - note no_double_tact removes this affect

	var/no_swing = FALSE            //for when you do not want an item to swing-attack
	var/push_attack = FALSE			//Hammers and spears can push the victim away on hit when you aim groin.
	//Why are we using vars instead of defines or anything else?
	//Because we need them to be shown in the tool info UI.

	var/obj/item/master = null
	var/list/origin_tech = null   //Used by R&D to determine what research bonuses it grants.
	var/list/attack_verb = null //Used in attackby() to say how something was attacked "[x] has been [LAZYPICK(z.attack_verb) || "attacked"] by [y] with [z]"

	var/extra_bulk = 0 	//Extra physicial volume added by certain mods

	var/heat_protection = 0 //flags which determine which body parts are protected from heat. Use the HEAD, UPPER_TORSO, LOWER_TORSO, etc. flags. See setup.dm
	var/cold_protection = 0 //flags which determine which body parts are protected from cold. Use the HEAD, UPPER_TORSO, LOWER_TORSO, etc. flags. See setup.dm
	var/max_heat_protection_temperature //Set this variable to determine up to which temperature (IN KELVIN) the item protects against heat damage. Keep at null to disable protection. Only protects areas set by heat_protection flags
	var/min_cold_protection_temperature //Set this variable to determine down to which temperature (IN KELVIN) the item protects against cold damage. 0 is NOT an acceptable number due to if(varname) tests!! Keep at null to disable protection. Only protects areas set by cold_protection flags

	var/datum/action/item_action/action = null
	var/action_button_name //It is also the text which gets displayed on the action button. If not set it defaults to 'Use [name]'. If it's not set, there'll be no button.
	var/action_button_is_hands_free = 0 //If 1, bypass the restrained, lying, and stunned checks action buttons normally test for
	var/action_button_proc //If set, when the button is used it calls the proc of that name
	var/action_button_arguments //If set, hands these arguments to the proc.

	//This flag is used to determine when items in someone's inventory cover others. IE helmets making it so you can't see glasses, etc.
	//It should be used purely for appearance. For gameplay effects caused by items covering body parts, use body_parts_covered.
	var/flags_inv = 0
	var/body_parts_covered = 0 //see setup.dm for appropriate bit flags

	var/list/tool_qualities = null// List of item qualities for tools system. See qualities.dm.
	var/sanctified = FALSE

	//var/heat_transfer_coefficient = 1 //0 prevents all transfers, 1 is invisible
	var/gas_transfer_coefficient = 1 // for leaking gas from turf to mask and vice-versa (for masks right now, but at some point, i'd like to include space helmets)
	var/permeability_coefficient = 1 // for chemicals/diseases
	var/siemens_coefficient = 1 // for electrical admittance/conductance (electrocution checks and shit)
	var/slowdown = 0 // How much clothing is slowing you down. Negative values speeds you up
	var/slowdown_hold // How much holding an item slows you down.

	var/stiffness = 0 // How much recoil is caused by moving
	var/obscuration = 0 // How much firearm accuracy is decreased

	var/list/armor_list = null //A list version of the armor datum, for initialization.
	var/datum/armor/armor// Ref to the armor datum

	var/list/allowed = null //suit storage stuff.
	var/list/blacklisted_allowed = null //suit storage stuff.
	var/obj/item/device/uplink/hidden/hidden_uplink = null // All items can have an uplink hidden inside, just remember to add the triggers.
	var/zoomdevicename = null //name used for message when binoculars/scope is used
	var/zoom = 0 //1 if item is actively being used to zoom. For scoped guns and binoculars.

	var/contained_sprite = FALSE //TRUE if object icon and related mob over-lays are all in one dmi

	var/icon_override = null  //Used to override hardcoded clothing dmis in human clothing proc.

	//** These specify item/icon overrides for _slots_

	var/list/item_state_slots = null //overrides the default item_state for particular slots.

	// Used to specify the icon file to be used when the item is worn. If not set the default icon for that slot will be used.
	// If icon_override or sprite_sheets are set they will take precendence over this, assuming they apply to the slot in question.
	// Only slot_l_hand/slot_r_hand are implemented at the moment. Others to be implemented as needed.
	var/tmp/list/item_icons = null

	// HUD action buttons. Only used by guns atm.
	var/list/hud_actions

	//Damage vars
	var/force = 0	//How much damage the weapon deals
	var/embed_mult = 1 //Multiplier for the chance of embedding in mobs. Set to zero to completely disable embedding
	var/structure_damage_factor = STRUCTURE_DAMAGE_NORMAL	//Multiplier applied to the damage when attacking structures and machinery

	//Does not affect damage dealt to mobs
	//var/attack_distance = 1

	var/list/item_upgrades = null

	/// Any upgrades in here will be applied on initialize().
	var/list/initialized_upgrades = null

	var/max_upgrades = 3
	var/allow_greyson_mods = FALSE
	name_prefixes = null
	var/list/blacklist_upgrades = null //Zebra list. /item/upgrade/thing = TRUE means it IS  blacklisted, /item/upgrade/thing/subtype = FALSE means it won't b blacklisted. subtypes go first.
	var/my_fuel = "fuel" //If we use fuel, what do we use?

	var/list/effective_faction = null // Which faction the item is effective against.
	var/damage_mult = 1 // The damage multiplier the item get when attacking that faction.
	//Stolen things form tool qualities
	var/eye_hazard = FALSE
	var/use_power_cost = 0
	var/use_fuel_cost = 0
	var/obj/item/cell/cell = null
	var/suitable_cell = null	//Dont forget to edit this for a tool, if you want in to consume cells
	var/passive_power_cost = 0 //Energy consumed per process tick while active
	var/use_stock_cost = 0
	var/stock = 0
	var/sparks_on_use = FALSE
	//Used for stashes
	var/start_hidden = FALSE

	var/chameleon_type

	var/has_alt_mode = FALSE
	var/alt_mode_damagetype = HALLOSS
	var/list/alt_mode_verbs = list("wack", "bash", "thump")
	var/alt_mode_active = FALSE
	var/alt_mode_toggle = ""
	var/alt_mode_lossrate = 0.5
	var/alt_mode_sharp = FALSE

/obj/item/Initialize()

	for (var/upgrade_typepath in initialized_upgrades)
		var/obj/item/upgrade = new upgrade_typepath

		if (!(LEGACY_SEND_SIGNAL(upgrade, COMSIG_IATTACK, src, null)))
			QDEL_NULL(upgrade)

	if(armor_list)
		armor = getArmor(arglist(armor_list))
	else
		armor = getArmor()

	if(chameleon_type)
		verbs.Add(/obj/item/proc/set_chameleon_appearance)

	if(has_alt_mode)
		verbs.Add(/obj/item/proc/verb_alt_mode_activeate)

	. = ..()

/obj/item/Destroy()
	QDEL_NULL(hidden_uplink)
	if(blood_overlay && items_blood_overlay_by_type[type] == blood_overlay)
		LAZYREMOVE(items_blood_overlay_by_type, type)
	QDEL_NULL(blood_overlay)
	QDEL_NULL(action)
	if(ismob(loc))
		var/mob/m = loc
		m.u_equip(src)
		remove_hud_actions(m)
		loc = null
	if(hud_actions)
		for(var/action in hud_actions)
			qdel(action)
		hud_actions = null

	return ..()

/obj/item/get_fall_damage()
	return w_class * 2

/obj/item/ex_act(severity)
	switch(severity)
		if(1)
			qdel(src)
			return
		if(2)
			if(prob(50))
				qdel(src)
				return
		if(3)
			if(prob(5))
				qdel(src)
				return

/obj/item/emp_act(severity)
	if(chameleon_type)
		name = initial(name)
		desc = initial(desc)
		icon = initial(icon)
		icon_state = initial(icon_state)
		update_icon()
		update_wear_icon()

/obj/item/verb/move_to_top()
	set name = "Move To Top"
	set category = "Object"
	set src in oview(1)

	if(!istype(loc, /turf) || usr.stat || usr.restrained() )
		return

	var/turf/T = loc

	loc = null

	loc = T

/obj/item/examine(user, distance = -1)
	var/message
	var/size
	switch(w_class)
		if(ITEM_SIZE_TINY)
			size = "tiny"
		if(ITEM_SIZE_SMALL)
			size = "small"
		if(ITEM_SIZE_NORMAL)
			size = "normal-sized"
		if(ITEM_SIZE_BULKY)
			size = "bulky"
		if(ITEM_SIZE_HUGE)
			size = "huge"
		if(ITEM_SIZE_GARGANTUAN)
			size = "gargantuan"
		if(ITEM_SIZE_COLOSSAL)
			size = "colossal"
		if(ITEM_SIZE_TITANIC)
			size = "titanic"
		if(ITEM_SIZE_PLANET)
			size = "planetary"
	message += "\nIt is a [size] item."

	for(var/Q in tool_qualities)
		message += "\n<blue>It possesses [tool_qualities[Q]] tier of [Q] quality.<blue>"

	if(allow_greyson_mods)
		message += "\n<blue>This allows for Greyson Positronic based mods to be integrated without normal constraints.<blue>"


	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.stats.getPerk(PERK_MARKET_PROF))
			message += "\n<blue>Export value: [get_item_cost() * SStrade.get_export_price_multiplier(src)][CREDITS]"

			var/offer_message = "\nThis item is requested at: "
			var/has_offers = FALSE
			for(var/datum/trade_station/TS in SStrade.discovered_stations)
				for(var/path in TS.special_offers)
					if(istype(src, path))
						has_offers = TRUE
						var/list/offer_content = TS.special_offers[path]
						var/offer_price = offer_content["price"]
						var/offer_amount = offer_content["amount"]
						if(offer_amount)
							offer_message += "[TS.name] ([round(offer_price / offer_amount, 1)][CREDITS] each, [offer_amount] requested), "
						else
							offer_message += "[TS.name] (offer fulfilled, awaiting new contract), "

			if(has_offers)
				offer_message = copytext(offer_message, 1, LAZYLEN(offer_message) - 1)
				message += SPAN_NOTICE(offer_message)

			if(surplus_tag)
				message += SPAN_NOTICE("\nThis item has a surplus tag and is only worth ten percent its usual value on exports.")

	return ..(user, distance, "", message)

/obj/item/attack_hand(mob/user as mob)
	if(pre_pickup(user))
		pickup(user)
		return TRUE
	return FALSE

//	Places item in active hand and invokes pickup animation
//	NOTE: This proc was created and replaced previous pickup() proc which is now called pre_pickup() as it makes more sense
//	keep that in mind when porting items form other builds
/obj/item/proc/pickup(mob/target)
	throwing = 0
	var/atom/old_loc = loc
	LEGACY_SEND_SIGNAL(src, COMSIG_ITEM_PICKED, src, target)
	if(target.put_in_active_hand(src) && old_loc )
		if((target != old_loc) && (target != old_loc.get_holding_mob()))
			do_pickup_animation(target,old_loc)
	add_hud_actions(target)

/obj/item/attack_ai(mob/user as mob)
	if(istype(loc, /obj/item/robot_module))
		//If the item is part of a cyborg module, equip it
		if(!isrobot(user))
			return
		var/mob/living/silicon/robot/R = user
		R.activate_module(src)
		//R.hud_used.update_robot_modules_display()

/obj/item/proc/talk_into(mob/living/M, message, channel, verb = "says", datum/language/speaking = null, speech_volume)
	return

/obj/item/proc/moved(mob/user as mob, old_loc as turf)
	return

// Called whenever an object is moved out of a mob's equip slot. Possibly into another slot, possibly to elsewhere
// Linker proc: mob/proc/prepare_for_slotmove, which is referenced in proc/handle_item_insertion and obj/item/attack_hand.
// This exists so that dropped() could exclusively be called when an item is dropped.
/obj/item/proc/on_slotmove(mob/user)
	if(wielded)
		unwield(user)
	if(zoom)
		zoom(user)
	if(get_equip_slot() in unworn_slots)
		LEGACY_SEND_SIGNAL(src, COMSIG_CLOTH_DROPPED, user)
		if(user)
			LEGACY_SEND_SIGNAL(user, COMSIG_CLOTH_DROPPED, src)


//	Called before an item is picked up (loc is not yet changed)
//	NOTE: This proc name was changed form pickup() as it makes more sense
//	keep that in mind when porting items form other builds
/obj/item/proc/pre_pickup(mob/user)
	return TRUE

// called when this item is removed from a storage item, which is passed on as S. The loc variable is already set to the new destination before this is called.
/obj/item/proc/on_exit_storage(obj/item/storage/the_storage)
	LEGACY_SEND_SIGNAL(the_storage, COMSIG_STORAGE_TAKEN, src, the_storage)
	return

// called when this item is added into a storage item, which is passed on as S. The loc variable is already set to the storage item.
/obj/item/proc/on_enter_storage(obj/item/storage/the_storage)
	LEGACY_SEND_SIGNAL(the_storage, COMSIG_STORAGE_INSERTED, src, the_storage)
	return

// called when "found" in pockets and storage items. Returns 1 if the search should end.
/obj/item/proc/on_found(mob/finder as mob)
	return
/obj/item/verb/verb_pickup()
	set src in oview(1)
	set category = "Object"
	set name = "Pick up"

	if(!usr) //BS12 EDIT
		return
	if(!usr.canmove || usr.stat || usr.restrained() || !Adjacent(usr))
		return
	if(!iscarbon(usr) || isbrain(usr))//Is humanoid, and is not a brain
		to_chat(usr, SPAN_WARNING("You can't pick things up!"))
		return
	if( usr.stat || usr.restrained() )//Is not asleep/dead and is not restrained
		to_chat(usr, SPAN_WARNING("You can't pick things up!"))
		return
	if(anchored) //Object isn't anchored
		to_chat(usr, SPAN_WARNING("You can't pick that up!"))
		return
	if(!usr.hand && usr.r_hand) //Right hand is not full
		to_chat(usr, SPAN_WARNING("Your right hand is full."))
		return
	if(usr.hand && usr.l_hand) //Left hand is not full
		to_chat(usr, SPAN_WARNING("Your left hand is full."))
		return
	if(!istype(loc, /turf)) //Object is on a turf
		to_chat(usr, SPAN_WARNING("You can't pick that up!"))
		return
	//All checks are done, time to pick it up!
	usr.UnarmedAttack(src)


//This proc is executed when someone clicks the on-screen UI button. To make the UI button show, set the 'icon_action_button' to the icon_state of the image of the button in screen1_action.dmi
//The default action is attack_self().
//Checks before we get to here are: mob is alive, mob is not restrained, paralyzed, asleep, resting, laying, item is on the mob.
/obj/item/proc/ui_action_click(mob/living/user, action_name)
	attack_self(usr)

//RETURN VALUES
//handle_shield should return a positive value to indicate that the attack is blocked and should be prevented.
//If a negative value is returned, it should be treated as a special return value for bullet_act() and handled appropriately.
//For non-projectile attacks this usually means the attack is blocked.
//Otherwise should return 0 to indicate that the attack is not affected in any way.
/obj/item/proc/handle_shield(mob/user, damage, atom/damage_source = null, mob/attacker = null, def_zone = null, attack_text = "the attack")
	return 0

/obj/item/proc/get_loc_turf()
	var/atom/L = loc
	while(L && !istype(L, /turf/))
		L = L.loc
	return loc

/obj/item/proc/eyestab(mob/living/carbon/M as mob, mob/living/carbon/user as mob)

	var/mob/living/carbon/human/H = M
	if(istype(H))
		for(var/obj/item/protection in list(H.head, H.wear_mask, H.glasses))
			if(protection && (protection.body_parts_covered & EYES))
				// you can't stab someone in the eyes wearing a mask!
				to_chat(user, SPAN_WARNING("You're going to need to remove the eye covering first."))
				return

	if(!M.has_eyes())
		to_chat(user, SPAN_WARNING("You cannot locate any eyes on [M]!"))
		return

	user.attack_log += "\[[time_stamp()]\]<font color='red'> Attacked [M.name] ([M.ckey]) with [name] (INTENT: [uppertext(user.a_intent)])</font>"
	M.attack_log += "\[[time_stamp()]\]<font color='orange'> Attacked by [user.name] ([user.ckey]) with [name] (INTENT: [uppertext(user.a_intent)])</font>"
	msg_admin_attack("[user.name] ([user.ckey]) attacked [M.name] ([M.ckey]) with [name] (INTENT: [uppertext(user.a_intent)]) (<A HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[user.x];Y=[user.y];Z=[user.z]'>JMP</a>)") //BS12 EDIT ALG

	user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	user.do_attack_animation(M)

	add_fingerprint(user)
	//if((CLUMSY in user.mutations) && prob(50))
	//	M = user
		/*
		to_chat(M, SPAN_WARNING("You stab yourself in the eye."))
		M.sdisabilities |= BLIND
		M.weakened += 4
		M.adjustBruteLoss(10)
		*/

	if(istype(H))

		var/obj/item/organ/internal/eyes/eyes = H.random_organ_by_process(OP_EYES)

		if(!eyes)
			return

		if(H != user)
			for(var/mob/O in (viewers(M) - user - M))
				O.show_message(SPAN_DANGER("[M] has been stabbed in the eye with [src] by [user]."), 1)
			to_chat(M, SPAN_DANGER("[user] stabs you in the eye with [src]!"))
			to_chat(user, SPAN_DANGER("You stab [M] in the eye with [src]!"))
		else
			user.visible_message( \
				SPAN_DANGER("[user] has stabbed themself with [src]!"), \
				SPAN_DANGER("You stab yourself in the eyes with [src]!") \
			)

		playsound(loc, 'sound/weapons/lightstab.ogg', 50, 1, -1)
		eyes.take_damage(rand(24, 32), BRUTE, 1, FALSE, TRUE, FALSE)
		if(eyes.damage >= eyes.min_bruised_damage)
			if(M.stat != DEAD)
				if(BP_IS_ORGANIC(eyes) || BP_IS_ASSISTED(eyes)) //robot eyes bleeding might be a bit silly
					to_chat(M, SPAN_DANGER("Your eyes start to bleed profusely!"))
			if(prob(50))
				if(M.stat != DEAD)
					to_chat(M, SPAN_WARNING("You drop what you're holding and clutch at your eyes!"))
					M.drop_item()
				M.eye_blurry += 10
				M.Paralyse(1)
				M.Weaken(4)
			if(eyes.damage >= eyes.min_broken_damage)
				if(M.stat != 2)
					to_chat(M, SPAN_WARNING("You go blind!"))
		var/obj/item/organ/external/affecting = H.get_organ(BP_HEAD)
		if(affecting.take_damage(7))
			M:UpdateDamageIcon()
	else
		M.take_organ_damage(7)
	M.eye_blurry += rand(3,4)

/obj/item/clean_blood()
	. = ..()
	if(blood_overlay)
		cut_overlay(blood_overlay)

/obj/item/clothing/gloves/clean_blood()
	.=..()
	transfer_blood = 0

/obj/item/reveal_blood()
	if(was_bloodied && !fluorescent)
		fluorescent = 1
		blood_color = COLOR_LUMINOL
		blood_overlay.color = COLOR_LUMINOL
	//	update_icon()

/obj/item/add_blood(mob/living/carbon/human/M as mob)
	if(!..())
		return 0

	if(istype(src, /obj/item/melee/energy))
		return

	if((flags & NOBLOODY)||(item_flags & NOBLOODY))
		return

	//if we haven't made our blood_overlay already
	if( !blood_overlay )
		generate_blood_overlay()

	//apply the blood-splatter overlay if it isn't already in there
	if(!blood_DNA.len)
		blood_overlay.color = blood_color
		add_overlay(blood_overlay)

	//if this blood isn't already in the list, add it
	if(istype(M))
		if(blood_DNA[M.dna.unique_enzymes])
			return 0 //already bloodied with this blood. Cannot add more.
		blood_DNA[M.dna.unique_enzymes] = M.dna.b_type
	return 1 //we applied blood to the item

var/global/list/items_blood_overlay_by_type = list()
/obj/item/proc/generate_blood_overlay()
	if(blood_overlay)
		return

	var/icon/ICO = items_blood_overlay_by_type[type]
	if(ICO)
		blood_overlay = image("icon" = ICO)
	else
		ICO = new /icon(icon, icon_state)
		ICO.Blend(new /icon('icons/effects/blood.dmi', rgb(255, 255, 255)), ICON_ADD) // fills the icon_state with white (except where it's transparent)
		ICO.Blend(new /icon('icons/effects/blood.dmi', "itemblood"), ICON_MULTIPLY)   // adds blood and the remaining white areas become transparant
		items_blood_overlay_by_type[type] = ICO
		blood_overlay = image("icon" = ICO)

/obj/item/proc/showoff(mob/user)
	for (var/mob/M in view(user))
		M.show_message("[user] holds up [src]. <a HREF=?src=\ref[M];lookitem=\ref[src]>Take a closer look.</a>",1)

/mob/living/carbon/verb/showoff()
	set name = "Show Held Item"
	set category = "Object"

	var/obj/item/I = get_active_hand()
	if(I && !I.abstract)
		I.showoff(src)

/*
For zooming with scope or binoculars. This is called from
modules/mob/mob_movement.dm if you move you will be zoomed out
modules/mob/living/carbon/human/life.dm if you die, you will be zoomed out.
*/
//Looking through a scope or binoculars should /not/ improve your periphereal vision. Still, increase viewsize a tiny bit so that sniping isn't as restricted to NSEW
/obj/item/proc/zoom(tileoffset = 14,viewsize = 9, stayzoomed = FALSE) //tileoffset is client view offset in the direction the user is facing. viewsize is how far out this thing zooms. 7 is normal view
	if(!usr)
		return

	var/devicename

	if(zoomdevicename)
		devicename = zoomdevicename
	else
		devicename = name

	var/cannotzoom

	if(usr.stat || !(ishuman(usr)))
		to_chat(usr, "You are unable to focus through the [devicename]")
		cannotzoom = 1
	else if(!zoom && (global_hud.darkMask[1] in usr.client.screen))
		to_chat(usr, "Your visor gets in the way of looking through the [devicename]")
		cannotzoom = 1
	else if(!zoom && usr.get_active_hand() != src)
		to_chat(usr, "You are too distracted to look through the [devicename]. Perhaps if it was in your active hand you could look through it.")
		cannotzoom = 1

	if((!zoom && !cannotzoom)|stayzoomed)
		//if(usr.hud_used.hud_shown)
			//usr.toggle_zoom_hud()	// If the user has already limited their HUD this avoids them having a HUD when they zoom in
		usr.client.view = viewsize
		usr.client.apply_clickcatcher()
		zoom = 1

		var/tilesize = 32
		var/viewoffset = tilesize * tileoffset

		switch(usr.dir)
			if(NORTH)
				usr.client.pixel_x = 0
				usr.client.pixel_y = viewoffset
			if(SOUTH)
				usr.client.pixel_x = 0
				usr.client.pixel_y = -viewoffset
			if(EAST)
				usr.client.pixel_x = viewoffset
				usr.client.pixel_y = 0
			if(WEST)
				usr.client.pixel_x = -viewoffset
				usr.client.pixel_y = 0

		if(!stayzoomed)
			usr.visible_message("[usr] peers through the [zoomdevicename ? "[zoomdevicename] of the [name]" : "[name]"].")
		var/mob/living/carbon/human/H = usr
		H.using_scope = src
	else
		usr.client.view = world.view
		usr.client.apply_clickcatcher()
		//if(!usr.hud_used.hud_shown)
			//usr.toggle_zoom_hud()
		zoom = 0

		usr.client.pixel_x = 0
		usr.client.pixel_y = 0

		if(!cannotzoom)
			usr.visible_message("[zoomdevicename ? "[usr] looks up from the [name]" : "[usr] lowers the [name]"].")
		var/mob/living/carbon/human/H = usr
		H.using_scope = null
	usr.parallax.update()
	return

/obj/item/proc/pwr_drain()
	return 0 // Process Kill

//Power and fuel drain, sparks spawn
//Moved here from _tools because we need tools to use certain tool only variables in the logic, but we don't want to break anything unexpected
/obj/item/proc/check_tool_effects(mob/living/user, time)
	if(use_power_cost)
		if(!cell || !cell.check_charge(use_power_cost*time))
			to_chat(user, SPAN_WARNING("[src] battery is dead or missing."))
			return FALSE

	if(use_fuel_cost)
		if(get_fuel() < (use_fuel_cost*time))
			to_chat(user, SPAN_NOTICE("You need more welding fuel to complete this task."))
			return FALSE

	if(use_stock_cost)
		if(stock < (use_stock_cost*time))
			to_chat(user, SPAN_NOTICE("There is not enough left in [src] to complete this task."))
			return FALSE

	if(eye_hazard)
		eyecheck(user)

	if(sparks_on_use && !(item_flags & SILENT))
		var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
		sparks.set_up(3, 0, get_turf(src))
		sparks.start()

	update_icon()
	return TRUE

//Called when a human swaps hands to a hand which is holding this item
/obj/item/proc/swapped_to(mob/user)
	add_hud_actions(user)

//Called when a human swaps hands away from a hand which is holding this item
/obj/item/proc/swapped_from(mob/user)
	remove_hud_actions(user)

/obj/item/proc/add_hud_actions(mob/user)
	if(!hud_actions || !user.client)
		return

	update_hud_actions()

	for(var/action in hud_actions)
		user.client.screen |= action

/obj/item/proc/remove_hud_actions(mob/user)
	if(!user)
		return
	if(!hud_actions || !user.client)
		return

	for(var/action in hud_actions)
		user.client.screen -= action

/obj/item/proc/on_embed(mob/user)
	return

/obj/item/proc/on_embed_removal(mob/living/user)
	if(!hud_actions)
		return

	for(var/action in hud_actions)
		user.client.screen -= action

/obj/item/proc/update_hud_actions()
	if(!hud_actions)
		return

	for(var/A in hud_actions)
		var/obj/item/action = A
		action.update_icon()

/obj/item/get_storage_cost()
	return (..() + extra_bulk)

/obj/item/proc/refresh_upgrades()
	damtype = initial(damtype)
	force = initial(force)
	armor_divisor = initial(armor_divisor)
	item_flags = initial(item_flags)
	name = initial(name)
	max_upgrades = initial(max_upgrades)
	allow_greyson_mods = initial(allow_greyson_mods)
	color = initial(color)
	sharp = initial(sharp)
	extended_reach = initial(extended_reach)
	no_swing = initial(no_swing)
	LAZYNULL(name_prefixes)

	extra_bulk = initial(extra_bulk)
	flags = initial(flags)

	//Now lets have each upgrade reapply its modifications
	LEGACY_SEND_SIGNAL(src, COMSIG_APPVAL, src)

	for (var/prefix in name_prefixes)
		name = "[prefix] [name]"
	SSnano.update_uis(src)

	if(alt_mode_active)
		alt_mode_activeate_two()

	if(isliving(loc) && extended_reach)
		var/mob/living/location_of_item = loc
		if(location_of_item.stats.getPerk(PERK_NATURAL_STYLE))
			extended_reach += 1

	if(wielded)
		if(force_wielded_multiplier)
			force = force * force_wielded_multiplier
		else //This will give items wielded 30% more damage. This is balanced by the fact you cannot use your other hand.
			force = (force * 1.3) //Items that do 0 damage will still do 0 damage though.
		name = "[name] (Wielded)"

	return


/obj/item/device
	icon = 'icons/obj/device.dmi'

//Soj cringe

/obj/item/proc/verb_alt_mode_activeate()
	set name = "Weapon: Toggle Alt Mode"
	set category = "Object"
	set src in usr

	alt_mode_activeate_one(usr)

/obj/item/proc/alt_mode_activeate_one(mob/user as mob)
	alt_mode_active = !alt_mode_active
	refresh_upgrades()
	if(alt_mode_active)
		visible_message(SPAN_DANGER("[user] [alt_mode_toggle]."))
	else
		visible_message(SPAN_DANGER("[user] beings to use their weapon in a more standard way."))

/obj/item/proc/alt_mode_activeate_two()
	damtype = alt_mode_damagetype
	force = force *= alt_mode_lossrate
	armor_divisor= armor_divisor *= alt_mode_lossrate
	attack_verb = LAZYCOPY(alt_mode_verbs)
	sharp = alt_mode_sharp
	flags |= NOBLOODY
