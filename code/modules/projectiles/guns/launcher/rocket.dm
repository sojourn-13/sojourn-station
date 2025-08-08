/obj/item/gun/launcher/rocket
	name = "RPG-7"
	desc = "An ancient rocket-propelled grenade launcher, this model is centuries old but well preserved."
	icon_state = "rocket"
	item_state = "rocket"
	w_class = ITEM_SIZE_HUGE
	throw_speed = 2
	throw_range = 10
	force = 5.0
	flags = CONDUCT
	slot_flags = SLOT_BACK
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5)

	release_force = 15
	throw_distance = 30
	var/max_rockets = 1
	var/list/rockets = new/list()
	serial_type = "SA"

	wield_delay = 2 SECOND
	wield_delay_factor = 0.6 // 60 vig , heavy stuff

/obj/item/gun/launcher/rocket/examine(mob/user)
	if(!..(user, 2))
		return
	to_chat(user, "\blue [rockets.len] / [max_rockets] rockets.")

/obj/item/gun/launcher/rocket/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/ammo_casing/rocket))
		if(rockets.len < max_rockets)
			user.drop_item()
			I.loc = src
			rockets += I
			to_chat(user, SPAN_NOTICE("You put the rocket in [src]."))
			to_chat(user, SPAN_NOTICE("[rockets.len] / [max_rockets] rockets."))
		else
			to_chat(user, SPAN_WARNING("[src] cannot hold more rockets."))

/obj/item/gun/launcher/rocket/consume_next_projectile()
	if(rockets.len)
		var/obj/item/ammo_casing/rocket/I = rockets[1]
		rockets -= I
		if(I.BB)
			return I.BB
		else if(ispath(I.projectile_type))
			return new I.projectile_type(src)
	return null

/obj/item/gun/launcher/rocket/handle_post_fire(mob/user, atom/target)
	message_admins("[key_name_admin(user)] fired a rocket from a rocket launcher ([src.name]) at [target].")
	log_game("[key_name_admin(user)] used a rocket launcher ([src.name]) at [target].")
	..()

/obj/item/gun/launcher/rocket/spear
	name = "SI-BS \"SPEAR\" recoilless rifle"
	desc = "A Blackshield pattern Single-shot Portable/Expendable Anti-tank Rocket (SPEAR) recoilless rifle. This disposable launcher must be unfolded before use. Once fired, it is no longer usable."
	icon = 'icons/obj/guns/projectile/spear.dmi'
	icon_state = "spear_folded"
	item_state = "spear_folded"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK|SLOT_BELT
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	serial_type = "SI-BS"
	max_rockets = 1
	var/fired = 0
	var/disposable = 1
	twohanded = TRUE
	max_upgrades = 0

	// Start with safety on (folded)
	safety = 1
	restrict_safety = 0

/obj/item/gun/launcher/rocket/spear/New()
	..()
	// Pre-load with one rocket
	var/obj/item/ammo_casing/rocket/loaded_rocket = new /obj/item/ammo_casing/rocket/disposable(src)
	rockets += loaded_rocket
	update_icon()

/obj/item/gun/launcher/rocket/spear/update_icon()
	if(fired)
		icon_state = "spear_spent"
		item_state = "spear_spent"
	else if(safety)
		icon_state = "spear_folded"
		item_state = "spear_folded"
	else
		icon_state = "spear_unfolded"
		item_state = "spear_unfolded"

/obj/item/gun/launcher/rocket/spear/toggle_safety(mob/living/user)
	if(fired)
		to_chat(user, SPAN_WARNING("\The [src] has already been fired and cannot be unfolded again."))
		icon_state = "spear_spent"
		item_state = "spear_spent"
		return

	safety = !safety
	playsound(user, 'sound/weapons/guns/interact/selector.ogg', 50, 1)

	if(safety)
		to_chat(user, SPAN_NOTICE("You fold \the [src], engaging the safety."))
	else
		to_chat(user, SPAN_NOTICE("You unfold \the [src], readying it for firing."))

	update_icon()
	update_firemode()
	update_hud_actions()
	check_safety_cursor(user)

/obj/item/gun/launcher/rocket/spear/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(safety)
		to_chat(user, SPAN_WARNING("\The [src] must be unfolded before it can be fired!"))
		return
	if(fired)
		to_chat(user, SPAN_WARNING("\The [src] has already been fired and is now useless."))
		icon_state = "spear_spent"
		item_state = "spear_spent"
		return

	// Only mark as fired if we actually have ammunition and can fire
	if(!rockets.len)
		to_chat(user, SPAN_WARNING("\The [src] is empty!"))
		return

	// Count rockets before firing
	var/rockets_before = rockets.len

	// Call parent Fire method to actually fire the weapon
	var/result = ..()

	// Check if a rocket was actually consumed (fired)
	var/rockets_after = rockets.len
	var/rocket_consumed = (rockets_before > rockets_after)

	// Only mark as spent if a rocket was actually fired
	if(rocket_consumed)
		// After successful firing, mark as fired and disable
		fired = 1
		name = "spent SI-BS \"SPEAR\" recoilless rifle"
		desc = "A used SI-BS SPEAR recoilless rifle. The firing mechanism has been destroyed and it's now just expensive scrap metal."
		icon_state = "spear_spent"
		item_state = "spear_spent"

		// Clear remaining rockets and disable functionality
		rockets.Cut()
		safety = 1
		restrict_safety = 1

	return result

/obj/item/gun/launcher/rocket/spear/process_projectile(obj/item/projectile/projectile, mob/user, atom/target, var/target_zone, var/params=null, var/pointblank=0, var/reflex=0)
	// Use ballistic launch instead of throwing for visible rocket travel
	projectile.loc = get_turf(user)
	projectile.launch(target, target_zone, 0, 0, 0, null, user)
	return 1

/obj/item/gun/launcher/rocket/spear/examine(mob/user)
	if(!..(user, 2))
		return

	if(fired)
		to_chat(user, SPAN_WARNING("This launcher has been fired and is now useless."))
	else if(safety)
		to_chat(user, SPAN_NOTICE("The launcher is currently folded. Use the safety toggle to unfold it for firing."))
	else
		to_chat(user, SPAN_NOTICE("The launcher is unfolded and ready to fire."))
		to_chat(user, SPAN_NOTICE("[rockets.len] / [max_rockets] rockets loaded."))

/obj/item/gun/launcher/rocket/spear/attackby(obj/item/I as obj, mob/user as mob)
	if(fired)
		to_chat(user, SPAN_WARNING("\The [src] has already been fired and cannot be reloaded."))
		return

	..()

/obj/item/gun/projectile/shotgun/pump/sabul
	name = "SI-BS \"SABUL\" utility platform"
	desc = "A SI-BS pattern Specialised Ballistic Utility Launcher (SABUL) utility platform. \
	This break-action launcher fires utility shells and grenades one at a time, but can be reloaded and reused indefinitely. \
	The weapon must be opened to load ammunition and closed to fire."
	icon = 'icons/obj/guns/projectile/sable.dmi'
	icon_state = "sable_closed"
	item_state = "sable_closed"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BACK|SLOT_BELT
	serial_type = "SI-BS"
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_STEEL = 10)
	price_tag = 1200
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3)

	// Accepts both utility and grenade calibers
	caliber = list(CAL_UTILITY, CAL_GRENADE, CAL_MINIROCKET, CAL_SHOTGUN)
	load_method = SINGLE_CASING
	handle_casings = EJECT_CASINGS
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	fire_sound = 'sound/weapons/guns/fire/GLfire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/shotgun_insert.ogg'

	max_shells = 1
	fire_delay = 10
	slowdown_hold = 0.5
	init_recoil = HANDGUN_RECOIL(2)
	twohanded = TRUE
	serial_type = "SI-BS"

	var/action_open = 0  // Track if the action is open or closed

	// Start with safety on (action closed)
	safety = 1
	restrict_safety = 0

/obj/item/gun/projectile/shotgun/pump/sabul/New()
	..()
	update_icon()

/obj/item/gun/projectile/shotgun/pump/sabul/update_icon()
	if(action_open)
		icon_state = "sable_open"
		item_state = "sable_open"
	else
		icon_state = "sable_closed"
		item_state = "sable_closed"

/obj/item/gun/projectile/shotgun/pump/sabul/attack_self(mob/living/user as mob)
	if(world.time >= user.next_move)
		toggle_action(user)
		user.next_move = world.time + 3

/obj/item/gun/projectile/shotgun/pump/sabul/proc/toggle_action(mob/living/user)
	action_open = !action_open

	playsound(user, 'sound/weapons/guns/interact/shotgun_pump.ogg', 50, 1)

	if(action_open)
		to_chat(user, SPAN_NOTICE("You break open \the [src], ejecting any spent casings."))
		// Eject spent casing if present
		if(chambered)
			if(!chambered.BB)  // If it's a spent casing (no projectile)
				chambered.loc = get_turf(src)
				chambered = null
	else
		to_chat(user, SPAN_NOTICE("You close \the [src], readying it for firing."))
		// Chamber ammunition when closing the action
		if(!chambered && loaded.len)
			var/obj/item/ammo_casing/AC = loaded[1]
			loaded -= AC
			chambered = AC
			// Ensure the chambered round has a projectile
			if(ispath(chambered.projectile_type) && !chambered.BB)
				chambered.BB = new chambered.projectile_type(chambered)
			to_chat(user, SPAN_NOTICE("You chamber \a [AC]."))

	update_icon()

/obj/item/gun/projectile/shotgun/pump/sabul/attack_hand(mob/user)
	// Check if action is open and there's a shell to remove
	if(action_open && chambered && user.get_active_hand() == null)
		if(world.time >= user.next_move)
			user.next_move = world.time + 3
			to_chat(user, SPAN_NOTICE("You carefully remove \the [chambered] from \the [src]."))
			user.put_in_hands(chambered)
			chambered = null
			playsound(user, 'sound/weapons/guns/interact/shotgun_insert.ogg', 30, 1)
		return

	// Otherwise, call parent for normal behavior
	return ..()

/obj/item/gun/projectile/shotgun/pump/sabul/toggle_safety(mob/living/user)
	if(restrict_safety)
		to_chat(user, SPAN_WARNING("This gun does not have a functional safety!"))
		return

	safety = !safety
	playsound(user, 'sound/weapons/selector.ogg', 50, 1)
	to_chat(user, SPAN_NOTICE("You toggle the safety [safety ? "on":"off"]."))
	//Update firemode when safeties are toggled
	update_firemode()
	update_hud_actions()
	check_safety_cursor(user)

/obj/item/gun/projectile/shotgun/pump/sabul/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(action_open)
		to_chat(user, SPAN_WARNING("\The [src] must be closed before it can be fired!"))
		return

	if(safety)
		to_chat(user, SPAN_WARNING("\The [src] safety is on! Toggle it off to fire."))
		return

	// Play fire sound before firing
	if(fire_sound)
		playsound(src, fire_sound, 70, 1)

	return ..()

/obj/item/gun/projectile/shotgun/pump/sabul/consume_next_projectile()
	if(chambered)
		return chambered.BB
	return null

/obj/item/gun/projectile/shotgun/pump/sabul/load_ammo(var/obj/item/A, mob/user)
	if(!action_open)
		to_chat(user, SPAN_WARNING("\The [src] must be opened before you can load ammunition!"))
		return

	return ..()

/obj/item/gun/projectile/shotgun/pump/sabul/unload_ammo(mob/user, var/allow_dump=1)
	if(!action_open)
		to_chat(user, SPAN_WARNING("\The [src] must be opened before you can unload ammunition!"))
		return

	return ..()

/obj/item/gun/projectile/shotgun/pump/sabul/examine(mob/user)
	if(!..(user, 2))
		return

	if(action_open)
		to_chat(user, SPAN_NOTICE("The action is open and ready for loading."))
		if(chambered)
			to_chat(user, SPAN_NOTICE("There is a [chambered.name] loaded."))
		else
			to_chat(user, SPAN_NOTICE("It is currently unloaded."))
	else
		to_chat(user, SPAN_NOTICE("The action is closed. Click in hand to open it for loading."))
		if(chambered)
			to_chat(user, SPAN_NOTICE("It appears to be loaded."))
		else
			to_chat(user, SPAN_NOTICE("It appears to be unloaded."))

	to_chat(user, SPAN_NOTICE("The safety is [safety ? "on" : "off"]."))
	if(safety && !action_open)
		to_chat(user, SPAN_NOTICE("Both the action must be closed and safety off to fire."))

/obj/item/gun/projectile/shotgun/pump/sabul/handle_post_fire(mob/user)
	user.attack_log += "\[[time_stamp()]\] <font color='red'> fired a utility/grenade round ([chambered.name]) from a SABLE launcher ([src.name])</font>"
	chambered = null

/obj/item/gun/projectile/shotgun/pump/sabul/attackby(obj/item/A, mob/user)
	// Check if it's ammunition
	if(istype(A, /obj/item/ammo_casing))
		if(!action_open)
			to_chat(user, SPAN_WARNING("\The [src] must be opened before you can insert a shell!"))
			return

		var/obj/item/ammo_casing/C = A
		// Check if caliber is compatible with our list of accepted calibers
		if(!(load_method & SINGLE_CASING) || !(C.caliber in caliber))
			to_chat(user, SPAN_WARNING("\The [src] is incompatible with \the [C]."))
			return

		// Check if we already have ammunition loaded or chambered
		if(chambered || loaded.len >= max_shells)
			to_chat(user, SPAN_WARNING("[src] can only hold one shell at a time and is already loaded."))
			return

		// Only apply reload delay for rockets, everything else loads instantly
		if(C.caliber == CAL_MINIROCKET && C.reload_delay)
			to_chat(user, SPAN_NOTICE("It takes some time to reload \the [src] with \the [C]..."))
			if (!do_after(user, C.reload_delay, user))
				return

		if(C.amount > 1)
			C.amount -= 1
			var/type = C.type
			var/obj/item/ammo_casing/inserted_casing = new type
			inserted_casing.desc = C.desc
			inserted_casing.caliber = C.caliber
			inserted_casing.projectile_type = C.projectile_type
			inserted_casing.icon_state = C.icon_state
			inserted_casing.spent_icon = C.spent_icon
			inserted_casing.is_caseless = C.is_caseless
			inserted_casing.shell_color = C.shell_color
			inserted_casing.maxamount = C.maxamount
			inserted_casing.amount = 1 //Were only taking 1 shell, prevents ammo douping
			//This here makes it so if were loading in pre-shot shells it doesnt magically give it a BB
			if(ispath(inserted_casing.projectile_type) && C.BB)
				inserted_casing.BB = new inserted_casing.projectile_type(inserted_casing)
			else
				inserted_casing.BB = null
			C.update_icon()
			inserted_casing.update_icon()
			loaded += inserted_casing
		else
			user.remove_from_mob(C)
			C.forceMove(src)
			loaded += C
		user.visible_message("[user] inserts \a [C] into [src].", SPAN_NOTICE("You insert \a [C] into [src]."))
		if(bulletinsert_sound)
			playsound(src.loc, bulletinsert_sound, 60, 1)
		return

	// Call parent attackby for normal handling
	return ..(A, user)
