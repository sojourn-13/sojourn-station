/obj/item/gun/launcher/rocket/deimos/panah
	name = "DAS-500 \"Panah\" SPEAR"
	desc = "A Deimos Armament Solutions pattern \"Panah\" Single-shot Portable/Expendable Anti-tank Rocket (SPEAR). This dispogolok launcher must be unfolded before use. Once fired, it is no longer ugolok."
	icon = 'icons/obj/guns/projectile/deimos/panah.dmi'
	icon_state = "panah_folded"
	item_state = "panah_folded"
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK|SLOT_BELT
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	serial_type = "DAS"
	max_rockets = 1
	var/icon_scale = 1.15
	var/fired = 0
	var/disposable = 1
	twohanded = TRUE
	max_upgrades = 0

	// Start with safety on (folded)
	safety = 1
	restrict_safety = 0

/obj/item/gun/launcher/rocket/deimos/panah/New()
	..()
	// Pre-load with one rocket
	var/obj/item/ammo_casing/rocket/loaded_rocket = new /obj/item/ammo_casing/rocket/disposable(src)
	rockets += loaded_rocket
	// Ensure the correct empty/loaded icon is applied on spawn (no magazine preloaded)
	update_icon()


/obj/item/gun/launcher/rocket/deimos/panah/update_icon()
	if(fired)
		icon_state = "panah_spent"
		item_state = "panah_spent"
	else if(safety)
		icon_state = "panah_folded"
		item_state = "panah_folded"
	else
		icon_state = "panah_unfolded"
		item_state = "panah_unfolded"
	if(wielded)
		item_state += "_doble"

/obj/item/gun/launcher/rocket/deimos/panah/toggle_safety(mob/living/user)
	if(fired)
		to_chat(user, SPAN_WARNING("\The [src] has already been fired and cannot be unfolded again."))
		icon_state = "panah_spent"
		item_state = "panah_spent"
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


/obj/item/gun/launcher/rocket/deimos/panah/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(safety)
		to_chat(user, SPAN_WARNING("\The [src] must be unfolded before it can be fired!"))
		return
	if(fired)
		to_chat(user, SPAN_WARNING("\The [src] has already been fired and is now useless."))
		icon_state = "panah_spent"
		item_state = "panah_spent"
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
		// After successful firing, mark as fired and digolok
		fired = 1
		name = "Spent DAI-500 \"Panah\" panah"
		desc = "A used Deimos Armament Solutions pattern \"Panah\" Single-shot Portable/Expendable Anti-tank Rocket (SPEAR). The firing mechanism has been destroyed and it's now just expensive scrap metal."
		icon_state = "panah_spent"
		item_state = "panah_spent"

		// Clear remaining rockets and digolok functionality
		rockets.Cut()
		safety = 1
		restrict_safety = 1

	return result

/obj/item/gun/launcher/rocket/deimos/panah/process_projectile(obj/item/projectile/projectile, mob/user, atom/target, var/target_zone, var/params=null, var/pointblank=0, var/reflex=0)
	// Use ballistic launch instead of throwing for visible rocket travel
	projectile.loc = get_turf(user)
	projectile.launch(target, target_zone, 0, 0, 0, null, user)
	return 1

/obj/item/gun/launcher/rocket/deimos/panah/examine(mob/user)
	if(!..(user, 2))
		return

	if(fired)
		to_chat(user, SPAN_WARNING("This launcher has been fired and is now useless."))
	else if(safety)
		to_chat(user, SPAN_NOTICE("The launcher is currently folded. Use the safety toggle to unfold it for firing."))
	else
		to_chat(user, SPAN_NOTICE("The launcher is unfolded and ready to fire."))
		to_chat(user, SPAN_NOTICE("[rockets.len] / [max_rockets] rockets loaded."))

/obj/item/gun/launcher/rocket/deimos/panah/attackby(obj/item/I as obj, mob/user as mob)
	if(fired)
		to_chat(user, SPAN_WARNING("\The [src] has already been fired and cannot be reloaded."))
		return

	..()

/obj/item/gun/projectile/shotgun/pump/deimos/golok
	name = "DAS-200 \"Golok\" SABUL"
	desc = "A Deimos Armament Solutions \"Golok\" Special-purpose Advanced Ballistic Utility Launcher (SABUL). This break-action launcher fires utility shells, mini-rockets, and grenades one at a time, but can be reloaded and reused indefinitely. The weapon must be opened to load ammunition and closed to fire."
	icon = 'icons/obj/guns/projectile/deimos/golok.dmi'
	icon_state = "golok_closed"
	item_state = "golok_closed"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK|SLOT_BELT
	serial_type = "DAS"
	force = WEAPON_FORCE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_STEEL = 10)
	price_tag = 1200
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3)
	init_recoil = HANDGUN_RECOIL(2)
	// Accepts both utility and grenade calibers
	caliber = list(CAL_UTILITY, CAL_GRENADE, CAL_MINIROCKET, CAL_SHOTGUN)
	load_method = SINGLE_CASING
	handle_casings = HOLD_CASINGS
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	fire_sound = 'sound/weapons/guns/fire/GLfire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/china_lake_reload.ogg'
	max_shells = 1
	var/icon_scale = 1.3
	fire_delay = 25
	slowdown_hold = 0.5
	twohanded = TRUE

	var/action_open = 0  // Track if the action is open or closed

	// Start with safety on (action closed)
	safety = 1
	restrict_safety = 0

/obj/item/gun/projectile/shotgun/pump/deimos/golok/update_icon()
	if(action_open)
		icon_state = "golok_open"
		item_state = "golok_open"
	else
		icon_state = "golok_closed"
		item_state = "golok_closed"
	if(wielded)
		item_state += "_doble"

/obj/item/gun/projectile/shotgun/pump/deimos/golok/attack_self(mob/living/user as mob)
	if(world.time >= user.next_move)
		toggle_action(user)
		user.next_move = world.time + 3

/obj/item/gun/projectile/shotgun/pump/deimos/golok/proc/toggle_action(mob/living/user)
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

/obj/item/gun/projectile/shotgun/pump/deimos/golok/attack_hand(mob/user)
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

/obj/item/gun/projectile/shotgun/pump/deimos/golok/toggle_safety(mob/living/user)
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


/obj/item/gun/projectile/shotgun/pump/deimos/golok/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(action_open)
		to_chat(user, SPAN_WARNING("\The [src] must be closed before it can be fired!"))
		return

	if(safety)
		to_chat(user, SPAN_WARNING("\The [src] safety is on! Toggle it off to fire."))
		return

	// Preserve break-action and safety checks above, but delegate the actual
	// projectile creation and processing to the parent implementation so this
	// weapon uses the same projectile logic as other launchers (like adv_gl).
	var/result = ..()
	return result


/obj/item/gun/projectile/shotgun/pump/deimos/golok/load_ammo(var/obj/item/A, mob/user)
	if(!action_open)
		to_chat(user, SPAN_WARNING("\The [src] must be opened before you can load ammunition!"))
		return

	return ..()

/obj/item/gun/projectile/shotgun/pump/deimos/golok/unload_ammo(mob/user, var/allow_dump=1)
	if(!action_open)
		to_chat(user, SPAN_WARNING("\The [src] must be opened before you can unload ammunition!"))
		return

	return ..()

/obj/item/gun/projectile/shotgun/pump/deimos/golok/examine(mob/user)
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

/obj/item/gun/projectile/shotgun/pump/deimos/golok/handle_post_fire(mob/user)
	// Use parent behaviour so the chambered round is expended and left in the
	// chamber as a spent casing. The break-action code will eject it when
	// the action is opened (toggle_action).
	user.attack_log += "\[[time_stamp()]\] <font color='red'> fired a utility/grenade round ([chambered.name]) from a golok launcher ([src.name])</font>"
	// Call parent to handle expending and process_chambered() properly.
	..()

/obj/item/gun/projectile/shotgun/pump/deimos/golok/attackby(obj/item/A, mob/user)
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

/obj/item/gun/projectile/shotgun/pump/deimos/golok/New()
	..()


	// Ensure the correct empty/loaded icon is applied on spawn (no magazine preloaded)
	update_icon()

/obj/item/gun/projectile/shotgun/pump/deimos/parang
	name = "DAS-250 \"Parang\" MABUL"
	desc = "A Deimos Armament Solutions \"Parang\" Multi-purpose Advanced Ballistic Utility Launcher (MABUL). This pump action launcher fires utility shells and grenades with a magazine of five grenades or shells, but can not fire the mini-rockets the SABUL can."
	icon = 'icons/obj/guns/projectile/deimos/parang.dmi'
	icon_state = "parang"
	item_state = "parang"
	fire_delay = 1.5
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK|SLOT_BELT
	force = WEAPON_FORCE_PAINFUL
	matter = list(MATERIAL_PLASTEEL = 25, MATERIAL_STEEL = 10)
	caliber = list(CAL_UTILITY, CAL_GRENADE, CAL_SHOTGUN)
	load_method = SINGLE_CASING
	origin_tech = list(TECH_COMBAT = 6, TECH_MATERIAL = 2)
	handle_casings = HOLD_CASINGS
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG) //Would be funny as shit if it took a bayonet but, no.
	fire_sound = 'sound/weapons/guns/fire/GLfire.ogg'
	bulletinsert_sound = 'sound/weapons/guns/interact/china_lake_reload.ogg'   // Might not be a M203 but better than a mag sound.
	max_shells = 5
	fire_delay = 15
	var/icon_scale = 1
	init_recoil = HANDGUN_RECOIL(2)
	twohanded = TRUE
	serial_type = "DAS"

/obj/item/gun/projectile/shotgun/pump/deimos/parang/load_ammo(var/obj/item/A, mob/user)
	// Allow manual loading of utility, grenade, and shotgun shells
	if(istype(A, /obj/item/ammo_casing))
		var/obj/item/ammo_casing/C = A
		// Ensure this gun supports single casing loading and the casing's caliber is accepted
		if(!(load_method & SINGLE_CASING) || !(C.caliber in caliber))
			to_chat(user, SPAN_WARNING("\The [src] is incompatible with \the [C]."))
			return
		// Check capacity
		if(loaded.len >= max_shells)
			to_chat(user, SPAN_WARNING("[src] is full."))
			return

		// Apply reload delay for slow rounds
		if(C.reload_delay)
			to_chat(user, SPAN_NOTICE("It takes some time to reload \the [src] with \the [C]..."))
			if (!do_after(user, C.reload_delay, user))
				return

		// Handle stacked casings by creating a single inserted casing
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
			inserted_casing.amount = 1 // We're only taking one shell
			// Preserve BB if present
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

		update_firemode()
		user.visible_message("[user] inserts \a [C] into [src].", SPAN_NOTICE("You insert \a [C] into [src]."))
		if(bulletinsert_sound)
			playsound(src.loc, bulletinsert_sound, 60, 1)
		update_icon()
		return

	// Fallback to parent for magazines or other types
	return ..(A, user)

/obj/item/gun/projectile/shotgun/pump/deimos/parang/handle_post_fire(mob/user)
	// For pump-action MABUL, let the parent expend/process the chambered
	// round, then immediately pump to eject the spent casing and chamber the
	// next round (if available).
	..()
	pump(user)

/obj/item/gun/projectile/shotgun/pump/deimos/parang/New()
	..()


	// Ensure the correct empty/loaded icon is applied on spawn (no magazine preloaded)
	update_icon()


// Deimos Armament Solutions - Additional Weapons
/obj/item/gun/projectile/deimos/tombak
	name = "DAS-400 \"Tombak\" AHR"
	desc = "A Deimos Armament Solutions \"Tombak\" Advanced Heavy Rifle (AHR). This rifle fires beefed up 12x64mm caseless rounds, and packs a very hefty punch, however with less recoil than traditional caseless weaponry."
	icon = 'icons/obj/guns/projectile/deimos/tombak.dmi'
	icon_state = "tombak"
	item_state = "tombak"
	w_class = ITEM_SIZE_BULKY
	slot_flags = SLOT_BACK|SLOT_BELT
	origin_tech = list(TECH_COMBAT = 7, TECH_MATERIAL = 4)
	serial_type = "DAS"
	var/icon_scale = 1.3
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL, GUN_SIGHT)
	caliber = "12x64" // uses the heavy 12x64 caseless caliber (add define if missing)
	mag_well = MAG_WELL_CL_AMR
	ammo_type = /obj/item/ammo_casing/c12x64
	load_method = MAGAZINE|SINGLE_CASING
	wield_delay = 1 SECOND
	wield_delay_factor = 0.5// 50 vig
	zoom_factors = list(1.5)
	fire_delay = 100
	fire_sound = 'sound/weapons/guns/fire/dmr_fire.ogg'
	reload_sound = 'sound/weapons/guns/interact/sfrifle_magin.ogg'
	unload_sound = 'sound/weapons/guns/interact/sfrifle_magout.ogg'
	init_recoil = RIFLE_RECOIL(2)
	force = WEAPON_FORCE_PAINFUL
	twohanded = TRUE
	price_tag = 3500

/obj/item/gun/projectile/deimos/tombak/New()
	..()


	// Ensure the correct empty/loaded icon is applied on spawn (no magazine preloaded)
	update_icon()

/obj/item/gun/projectile/deimos/tombak/update_icon()
	var/base = initial(icon_state)
	if(load_method & MAGAZINE)
		if(!ammo_magazine)
			icon_state = base + "_empty"
		else
			icon_state = base
	item_state = icon_state
	if(wielded)
		item_state += "_doble"

/obj/item/gun/projectile/deimos/tombak/handle_post_fire(mob/user)
	// Let parent consume ammo, then refresh sprite
	..()
	update_icon()


/obj/item/gun/projectile/deimos/palu
	name = "DAS-300 \"Palu\" CAWS"
	desc = "A Deimos Armament Solutions \"Palu\" Close Assault Weapons System (CAWS). This shotgun has the advantage of taking both drum mags and SBAW magazines for shotgun shells, making it ideal for combat use."
	icon = 'icons/obj/guns/projectile/deimos/palu.dmi'
	icon_state = "palu"
	item_state = "palu"
	w_class = ITEM_SIZE_HUGE
	slot_flags = SLOT_BACK|SLOT_BELT
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 3)
	serial_type = "DAS"
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL, GUN_SIGHT)
	load_method = MAGAZINE|SINGLE_CASING
	mag_well = MAG_WELL_DRUM|MAG_WELL_RIFLE
	wield_delay = 1 SECOND
	wield_delay_factor = 0.5// 50 vig
	zoom_factors = list(0.4)
	ammo_type = /obj/item/ammo_casing/shotgun
	fire_sound = 'sound/weapons/guns/fire/sbaw.ogg'
	reload_sound = 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	unload_sound = 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	init_recoil = FOLDING_RECOIL(1.5)
	damage_mult = 0.7
	force = WEAPON_FORCE_PAINFUL
	caliber = CAL_SHOTGUN
	var/icon_scale = 0.8
	fire_delay = 35
	twohanded = TRUE
	price_tag = 1800
	init_firemodes = list(
		SEMI_AUTO_NODELAY
	)

/obj/item/gun/projectile/deimos/palu/update_icon()
	var/base = initial(icon_state)
	if(load_method & MAGAZINE)
		if(!ammo_magazine)
			icon_state = base + "_empty"
		else
			icon_state = base
	item_state = icon_state
	if(wielded)
		item_state += "_doble"

/obj/item/gun/projectile/deimos/palu/handle_post_fire(mob/user)
	..()
	update_icon()

/obj/item/gun/projectile/deimos/palu/New()
	..()


	// Ensure the correct empty/loaded icon is applied on spawn (no magazine preloaded)
	update_icon()


/obj/item/gun/projectile/deimos/celurit
	name = "DAS-100 \"Celurit\" SPC"
	desc = "A Deimos Armament Solutions \"Celurit\" Special Purpose Carbine (SPC). This carbine fires 10x24mm caseless rounds, and packs a very hefty punch, however with less recoil than traditional caseless weaponry."
	icon = 'icons/obj/guns/projectile/deimos/celurit.dmi'
	icon_state = "celurit"
	item_state = "celurit"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = list(SLOT_BACK, SLOT_BELT)
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3)
	serial_type = "DAS"
	caliber = "10x24"
	gun_tags = list(GUN_PROJECTILE, GUN_SCOPE, GUN_MAGWELL, GUN_SIGHT)
	mag_well = MAG_WELL_CL_CARBINE
	zoom_factors = list(0.8)
	ammo_type = /obj/item/ammo_casing/c10x24
	load_method = SINGLE_CASING|MAGAZINE
	wield_delay = 1 SECOND
	wield_delay_factor = 0.5// 50 vig
	fire_sound = 'sound/weapons/guns/fire/sfrifle_fire.ogg'
	reload_sound = 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	unload_sound = 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	init_recoil = CARBINE_RECOIL(0.8)
	force = WEAPON_FORCE_PAINFUL
	var/icon_scale = 0.9
	twohanded = FALSE
	fire_delay = 10
	price_tag = 1600
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_3_ROUND,
		BURST_5_ROUND,
		FULL_AUTO_600
	)
/obj/item/gun/projectile/deimos/celurit/New()
	..()


	// Ensure the correct empty/loaded icon is applied on spawn (no magazine preloaded)
	update_icon()

/obj/item/gun/projectile/deimos/celurit/update_icon()
	var/base = initial(icon_state)
	if(load_method & MAGAZINE)
		if(!ammo_magazine)
			icon_state = base + "_empty"
		else
			icon_state = base
	item_state = icon_state
	if(wielded)
		item_state += "_doble"

/obj/item/gun/projectile/deimos/celurit/handle_post_fire(mob/user)
	..()
	update_icon()


/obj/item/gun/projectile/deimos/keris
	name = "DAS-50 \"Keris\" SPP"
	desc = "A Deimos Armament Solutions \"Keris\" Special Purpose Pistol (SPP). This pistol fires 8x16mm caseless rounds, and packs a very hefty punch, however with less recoil than traditional caseless weaponry."
	icon = 'icons/obj/guns/projectile/deimos/keris.dmi'
	icon_state = "keris"
	item_state = "keris"
	w_class = ITEM_SIZE_SMALL
	slot_flags = list(SLOT_BELT, SLOT_HOLSTER)
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 2)
	serial_type = "DAS"
	caliber = "8x16"
	gun_tags = list(GUN_PROJECTILE, GUN_MAGWELL)
	mag_well = MAG_WELL_CL_PISTOL
	ammo_type = /obj/item/ammo_casing/c8x16
	load_method = MAGAZINE|SINGLE_CASING
	wield_delay = 1 SECOND
	wield_delay_factor = 0.5// 50 vig
	fire_sound = 'sound/weapons/guns/fire/hpistol_fire.ogg'
	reload_sound = 'sound/weapons/guns/interact/hpistol_magin.ogg'
	unload_sound = 'sound/weapons/guns/interact/hpistol_magout.ogg'
	init_recoil = HANDGUN_RECOIL(1)
	force = WEAPON_FORCE_NORMAL
	fire_delay = 5
	var/icon_scale = 1
	twohanded = FALSE
	price_tag = 900
	init_firemodes = list(
		SEMI_AUTO_NODELAY,
		BURST_2_ROUND
	)

/obj/item/gun/projectile/deimos/keris/New()
	..()


	// Ensure the correct empty/loaded icon is applied on spawn (no magazine preloaded)
	update_icon()

/obj/item/gun/projectile/deimos/keris/update_icon()
	var/base = initial(icon_state)
	if(get_ammo() <= 0)
		icon_state = base + "_empty"
	else
		icon_state = base
	item_state = icon_state
	if(wielded)
		item_state += "_doble"

/obj/item/gun/projectile/deimos/keris/handle_post_fire(mob/user)
	..()
	update_icon()
