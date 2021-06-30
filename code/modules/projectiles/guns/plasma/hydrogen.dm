/*
Hydrogen-based Plasma Weaponry got a bunch of quirks that make them very dangerous to use, but even more rewarding.

The projectile do 100 burn damage on the target, as well as a small explosion, but disapear after traveling a certain distance.

The core concept of this gun is heat management.
Keep firing, and eventually the gun will become too hot and burn your hands. If you keep going even more, then containment of the plasma will fail and burn every bodypart.
Luckily the gun slowly cool down over time, as well as regularly vent its heat.

However, if you fail to secure the hydrogen flask used as ammo, then containment won't be perfect and will get breached on the first shot.
Securing and unsecuring the flask is a long and hard task, and a failure when unsecuring the flask can burn your hands.
*/

/obj/item/weapon/gun/hydrogen
	name = "\improper \"Venatori\" hydrogen-plasma gun"
	desc = "A volatile but powerful weapon that uses hydrogen flasks to fire destructive plasma bolts. The brain child of Soteria Director Nakharan Mkne, meant to compete and exceed the church of the absolutes \
	own plasma designs, it succeeded. However, it did so by being extremely dangerous, requiring an intelligent and careful operator who can correctly manage the weapons over heating without being \
	burnt to a crisp."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "plasma"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 5)
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_STEEL = 1)
	recoil_buildup = 1
	twohanded = TRUE
	max_upgrades = 0
	fire_delay = 10
	fire_sound = 'sound/weapons/lasercannonfire.ogg'

	init_firemodes = list(
		list(mode_name = "standard", projectile_type = /obj/item/projectile/hydrogen, fire_sound = 'sound/weapons/lasercannonfire.ogg', fire_delay=30, icon="destroy", heat_per_shot = 25, use_plasma_cost = 10),
		list(mode_name = "overclock", projectile_type = /obj/item/projectile/hydrogen/max, fire_sound='sound/effects/supermatter.ogg', fire_delay=50, icon="kill", heat_per_shot = 40, use_plasma_cost = 20)
	)

	var/projectile_type = /obj/item/projectile/hydrogen
	var/use_plasma_cost = 10 // How much plasma is used per shot
	var/heat_per_shot = 25 // How much heat is gained each shot

	var/obj/item/weapon/hydrogen_fuel_cell/flask = null // The flask the gun use for ammo
	var/obj/item/weapon/hydrogen_fuel_cell/backpack/connected = null // The backpack the gun is connected to
	var/secured = TRUE // Is the flask secured?
	var/heat_level = 0 // Current heat level of the gun
	var/vent_level = 50 // Threshold at which is automatically vent_level
	var/vent_timer = 0 // Keep track of the timer
	var/vent_level_timer = 50 // Timer in second before the next venting can happen
	var/overheat = 100 // Max heat before overheating.

	// Damage dealt when overheating
	var/contain_fail_damage = 50 // Applied to every bodypart.
	var/overheat_damage = 25 // Applied to the hand holding the gun.

	var/aerith_aether = 50 // Variable used to repetidely call Process(), which is used for heat management. It is in deciseconds, so 50 = 5 seconds

/obj/item/weapon/gun/hydrogen/Initialize()
	..()
	flask = new /obj/item/weapon/hydrogen_fuel_cell(src) // Give the gun a new flask when mapped in.

/obj/item/weapon/gun/hydrogen/New()
	..()
	update_icon()
	Process()

/obj/item/weapon/gun/hydrogen/examine(mob/user)
	..(user)
	if(!flask)
		to_chat(user, SPAN_NOTICE("Has no flask inserted."))
		return
	if(use_plasma_cost) // So that the bluecross weapon can use 0 plasma
		var/shots_remaining = round(flask.plasma / use_plasma_cost)
		to_chat(user, "Has [shots_remaining] shot\s remaining.")
	if(!secured)
		to_chat(user, SPAN_DANGER("The fuel cell is not secured!"))
	return

// Removing the plasma flask
/obj/item/weapon/gun/hydrogen/MouseDrop(over_object)
	if(!connected)
		if(secured)
			to_chat(usr, "The cell is screwed to the gun. You cannot remove it.")
		else if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(flask, usr))
			flask = null
			update_icon()

/obj/item/weapon/gun/hydrogen/attackby(obj/item/weapon/W as obj, mob/living/user as mob)

	// Securing or unsecuring the cell
	if(QUALITY_SCREW_DRIVING)
		if((flask) && !(istype(W, /obj/item/weapon/hydrogen_fuel_cell/backpack)))
			var/obj/item/weapon/tool/T = W // New var to use tool-only procs.
			if(T.use_tool(user, src, WORKTIME_EXTREMELY_LONG, QUALITY_SCREW_DRIVING, FAILCHANCE_HARD, required_stat = STAT_MEC)) // Skill check. Hard to pass and long to do.
				if(secured)
					user.visible_message(
											SPAN_NOTICE("[user] unsecure the plasma flask."),
											SPAN_NOTICE("You unsecure the plasma flask.")
										)
					secured = FALSE
				else
					user.visible_message(
											SPAN_NOTICE("[user] secure the plasma flask."),
											SPAN_NOTICE("You secure the plasma flask.")
										)
					secured = TRUE
				return
			else // When you fail
				if(prob(75) && secured) // Get burned.
					user.visible_message(
											SPAN_NOTICE("[user] make a mistake while unsecuring the flask and burns \his hand."),
											SPAN_NOTICE("You make a mistake while unsecuring the flask and burns your hand.")
										)
					overheating(user)
				return
		else
			to_chat(user, "There is no flask to remove.")

	// We do not want to insert the backpack, thank you very much.
	if(istype(W, /obj/item/weapon/hydrogen_fuel_cell/backpack))
		return


	if(flask && istype(W, /obj/item/weapon/hydrogen_fuel_cell))
		to_chat(usr, SPAN_WARNING("[src] is already loaded."))
		return

	if(istype(W, /obj/item/weapon/hydrogen_fuel_cell) && insert_item(W, user))
		flask = W
		update_icon()
		return

/obj/item/weapon/gun/hydrogen/Process()
	// Lose heat over time.
	if(heat_level > 0)
		heat_level--

	if(vent_timer > 0)
		vent_timer--

	// Vent the gun whenever possible
	if(heat_level >= vent_level && vent_timer <= 0)
		venting()

	// Check if the gun is attached
	if(connected) // Are we connected to something?
		if(loc != connected) // Are we in the connected object?
			if(loc != connected.loc) // Are we not in the same place?
				src.visible_message("The [src.name] reattach itself to the [connected.name].")
				usr.remove_from_mob(src)
				forceMove(connected)

	src.visible_message("The [src.name] called Process()") // Trace for testing
	spawn(aerith_aether) Process()

/obj/item/weapon/gun/hydrogen/consume_next_projectile()
	if(!flask)
		return null
	if(!ispath(projectile_type))
		return null
	if(!flask.use(use_plasma_cost))
		return null
	heat_level += heat_per_shot // Increase the heat.
	return new projectile_type(src)

// The part where the gun blow up.
/obj/item/weapon/gun/hydrogen/handle_post_fire(mob/living/user as mob)
	..()
	if(!secured) // Blow up if you forgot to secure the cell.
		containment_failure(user)
		return

	// Burn the user if it overheat too much
	if(heat_level >= overheat * 2)
		containment_failure(user)
		return

	// Gun's too hot, start burning
	if(heat_level >= overheat)
		overheating(user)
		return

	return

/obj/item/weapon/gun/hydrogen/update_icon()
	cut_overlays()
	if(flask && !connected)
		add_overlay("[icon_state]_loaded")
	if(connected)
		add_overlay("[icon_state]_connected")


/////////////////////
///  Custom procs ///
/////////////////////

// Vent the weapon
/obj/item/weapon/gun/hydrogen/proc/venting()
	heat_level = 0 // Remove the heat
	vent_timer = vent_level_timer // Reset the timer
	src.visible_message("The [src.name]'s vents open and spew super-heated steam, cooling itself down.")

// The weapon is too hot, burns the user's hand.
/obj/item/weapon/gun/hydrogen/proc/overheating(mob/living/user as mob)
	src.visible_message(SPAN_DANGER("The [src.name] overheat, burning its wielder's hands!"))

	// Burn the hand holding the gun
	if(user.hand == user.l_hand) // Are we using the left arm?
		user.apply_damage(overheat_damage, BURN, def_zone = BP_L_ARM)
	else // If not then it must be the right arm.
		user.apply_damage(overheat_damage, BURN, def_zone = BP_R_ARM)

// The weapon's plasma containment has failed, greatly burning the user !
/obj/item/weapon/gun/hydrogen/proc/containment_failure(mob/living/user as mob)
	src.visible_message(SPAN_DANGER("The [src.name]'s magnetic containment failed, covering its wielder with burning plasma!"))
	// Damage every bodypart, for a total of 350
	user.apply_damage(contain_fail_damage, BURN, def_zone = BP_HEAD)
	user.apply_damage(contain_fail_damage, BURN, def_zone = BP_CHEST)
	user.apply_damage(contain_fail_damage, BURN, def_zone = BP_GROIN)
	user.apply_damage(contain_fail_damage, BURN, def_zone = BP_L_ARM)
	user.apply_damage(contain_fail_damage, BURN, def_zone = BP_R_ARM)
	user.apply_damage(contain_fail_damage, BURN, def_zone = BP_L_LEG)
	user.apply_damage(contain_fail_damage, BURN, def_zone = BP_R_LEG)