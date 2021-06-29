/*
Core Concept : 	This unfortunate quality makes a Plasma Weapon potentially as deadly to the wielder as it is to the target.
				However, the sheer power and deadliness of Plasma Weapons often outweigh the hazards that come with their use.

--- AMMO ---
- Projectile Drop-off for each gun.
- Make the gun use non-rechargable hydrogen flasks.
- Each flask hold ~15 shots.
- Reloaded using a screwdriver to remove and secure the cell. High skill cap and take a long time.
- Failure when reloading can lead to 20 burn damage to the hand or a containment failure on the first shot.
- Backpack & Feedline can replace hydrogen flasks.

--- HEAT MECHANIC ---
- Heat the gun by firing shots.
- Lose Heat over time when not firing.
- Regularly release steam when a Heat threshold is reached, reducing Heat.
- Cannot constantly vent_level, random minimal delay between vent_levelings.
- Manually vent_leveling the gun make it happen immediately, but has a delay where the user must stand still and not get shot.
- Overheat by firing too fast for vent_leveling to keep up.
- When overheating, deal 50 burn damage to the active hand.

- When containment fail, give a second warning, destroy the gun and deal 50 burn damage to every bodypart, with a 1-tile explosion.

--- PROJECTILE ---
- Deal 100 burn damage with high armor penetration.
- Does a 1-tile explosion when hitting a target.
- Maximal Mode : Use more fuel for more damage, force a delay after firing.

--- TYPES ---
- Plasma Pistol : Same Damage, less range and lower rate of fire. Can use Maximal Mode.
- Plasma Torch : Welder that use plasma flasks or backpack, can be used as an emergency pistol without the Maximal Mode and less range.
- Plasma Grenade : Made from Flasks. Explode and sear everything around them.
- Plasma Gun : Reasonable rate of fire, can use Maximal Mode. Likely to survive through containment failure.
- Plasma Cannon : Cannot use Fuel Flasks, Projectile explosion is a 3x3 AoE. Maximal Mode give even bigger boom. More Dangerous Meltdown.
- Plasma Cannon Mounted Stand : Can accept Plasma Cannons and Fuel Backpack, prevent_level overheating of the gun thanks to external cooling system. Give one to Blackshield.
- Plasma Incinerator : Blue Cross Weapon. ***NO RISK OF OVERHEATING***, Overcharge setting is even deadlier and risk overheating. // Overcharge might not be added
*/

/obj/item/weapon/gun/plasma
	name = "Plasma Gun"
	desc = "A volatile but powerful weapon that use hydrogen flasks to fire powerful bolts."
	icon = 'icons/obj/guns/plasma/plasma.dmi'
	icon_state = "plasma"
	origin_tech = list(TECH_COMBAT = 5, TECH_MATERIAL = 5)
	w_class = ITEM_SIZE_BULKY
	matter = list(MATERIAL_STEEL = 1)
	recoil_buildup = 1
	twohanded = TRUE
	max_upgrades = 0

	var/projectile_type = /obj/item/projectile/plasma_bullet
	var/use_plasma_cost = 10 // How much plasma is used per shot
	var/heat_per_shot = 5 // How much heat is gained each shot

	var/obj/item/weapon/hydrogen_fuel_cell/flask = null // The flask the gun use for ammo
	var/secured = TRUE // Is the flask secured?
	var/heat_level = 0 // Current heat level of the gun
	var/vent_level = 50 // Threshold at which is automatically vent_level
	var/vent_level_timer = 10 // Timer in second before the next vent_leveling can happen
	var/overheat = 100 // Max heat before overheating.

/obj/item/weapon/gun/plasma/Initialize()
	..()
	flask = new /obj/item/weapon/hydrogen_fuel_cell(src) // Give the gun a new flask when mapped in.

/obj/item/weapon/gun/plasma/examine(mob/user)
	..(user)
	if(!flask)
		to_chat(user, SPAN_NOTICE("Has no flask inserted."))
		return
	var/shots_remaining = round(flask.plasma / use_plasma_cost)
	to_chat(user, "Has [shots_remaining] shot\s remaining.")
	return

// Removing the plasma flask
/obj/item/weapon/gun/plasma/MouseDrop(over_object)
	if(secured)
		to_chat(usr, "The cell is screwed to the gun. You cannot remove it.")
	else if((src.loc == usr) && istype(over_object, /obj/screen/inventory/hand) && eject_item(flask, usr))
		flask = null
		update_icon()

/obj/item/weapon/gun/plasma/attackby(obj/item/weapon/W as obj, mob/living/user as mob)

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
				if(prob(5) && secured) // Get burned.
					user.visible_message(
											SPAN_NOTICE("[user] make a mistake while unsecuring the flask and burn /his hand."),
											SPAN_NOTICE("You make a mistake while unsecuring the flask and burn your hand.")
										)
					if(user.hand == user.l_hand) // Are we using the left arm?
						user.apply_damage(25, BURN, def_zone = BP_L_ARM)
					else // If not then it must be the right arm.
						user.apply_damage(25, BURN, def_zone = BP_R_ARM)
				return
		else
			to_chat(user, "There is no flask.")

	if(flask)
		to_chat(usr, SPAN_WARNING("[src] is already loaded."))
		return

	if(istype(W, /obj/item/weapon/hydrogen_fuel_cell/backpack))
		if(do_after(user, WORKTIME_DELAYED, src))
			flask = W
			user.visible_message(	SPAN_NOTICE("[user] connect the [W.name] to the [src.name]."),
									SPAN_NOTICE("You make a mistake while unsecuring the flask and burn your hand.")
								)

	if(istype(W, /obj/item/weapon/hydrogen_fuel_cell) && insert_item(W, user))
		flask = W
		update_icon()
		return

/obj/item/weapon/gun/plasma/Process()

	// Lose heat over time.
	if(heat_level > 0)
		heat_level--

	if(vent_level_timer > 0)
		vent_level_timer--

/obj/item/weapon/gun/plasma/proc/vent_leveling()
	heat_level = 0 // Remove the heat
	vent_level_timer = initial(vent_level_timer) // Reset the timer
	src.visible_message("The [src.name]'s vent_levels open and spew super-heated steam, cooling itself down.")

/obj/item/weapon/gun/plasma/consume_next_projectile()
	if(!flask) return null
	if(!ispath(projectile_type)) return null
	if(!flask.use(use_plasma_cost)) return null
	heat_level += heat_per_shot // Increase the heat.
	return new projectile_type(src)

// The part where the gun blow up.
/obj/item/weapon/gun/plasma/handle_post_fire(mob/living/user as mob)
	..()
	if(!secured) // Blow up if you forgot to secure the cell.
		src.visible_message(SPAN_DANGER("The [src.name]'s magnetic containment failed, covering its wielder with burning plasma!"))

		// Damage every bodypart
		user.apply_damage(50, BURN, def_zone = BP_HEAD)
		user.apply_damage(50, BURN, def_zone = BP_CHEST)
		user.apply_damage(50, BURN, def_zone = BP_GROIN)
		user.apply_damage(50, BURN, def_zone = BP_L_ARM)
		user.apply_damage(50, BURN, def_zone = BP_R_ARM)
		user.apply_damage(50, BURN, def_zone = BP_L_LEG)
		user.apply_damage(50, BURN, def_zone = BP_R_LEG)

		return

	// vent_level if possible
	if(heat_level >= vent_level && vent_level_timer <= 0)
		vent_leveling()

	return

