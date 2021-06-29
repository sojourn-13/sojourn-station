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
- Cannot constantly vent, random minimal delay between ventings.
- Manually venting the gun make it happen immediately, but has a delay where the user must stand still and not get shot.
- Overheat by firing too fast for venting to keep up.
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
- Plasma Cannon Mounted Stand : Can accept Plasma Cannons and Fuel Backpack, prevent overheating of the gun thanks to external cooling system. Give one to Blackshield.
- Plasma Incinerator : Blue Cross Weapon. ***NO RISK OF OVERHEATING***, Overcharge setting is even deadlier and risk overheating. // Overcharge might not be added
*/

/obj/item/weapon/gun/hydrogen/pistol
	name = "Plasma Pistol"
	desc = "A volatile but powerful weapon that use hydrogen flasks to fire powerful bolts."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "pistol"
	twohanded = FALSE

	projectile_type = /obj/item/projectile/hydrogen/pistol
	use_plasma_cost = 10 // How much plasma is used per shot
	heat_per_shot = 5

	init_firemodes = list(
		list(mode_name = "standard", projectile_type = /obj/item/projectile/hydrogen/pistol, fire_sound='sound/weapons/lasercannonfire.ogg', fire_delay=10, icon="destroy", heat_per_shot = 5, use_plasma_cost = 10),
		list(mode_name = "maximal", projectile_type = /obj/item/projectile/hydrogen/pistol/max, fire_sound='sound/effects/supermatter.ogg', fire_delay=30, icon="kill", heat_per_shot = 10, use_plasma_cost = 20)
	)

/obj/item/weapon/gun/hydrogen/cannon
	name = "Plasma Cannon"
	desc = "A volatile but powerful weapon that use hydrogen flasks to fire powerful bolts."
	icon = 'icons/obj/guns/plasma/hydrogen.dmi'
	icon_state = "cannon"

	projectile_type = /obj/item/projectile/hydrogen/cannon
	use_plasma_cost = 20 // How much plasma is used per shot
	heat_per_shot = 10

	init_firemodes = list(
		list(mode_name = "standard", projectile_type = /obj/item/projectile/hydrogen/cannon, fire_sound='sound/weapons/lasercannonfire.ogg', fire_delay=10, icon="destroy", heat_per_shot = 10, use_plasma_cost = 20),
		list(mode_name = "maximal", projectile_type = /obj/item/projectile/hydrogen/cannon/max, fire_sound='sound/effects/supermatter.ogg', fire_delay=30, icon="kill", heat_per_shot = 20, use_plasma_cost = 40)
	)

// Blue cross weapon, no overheat and infinite ammo.
/obj/item/weapon/gun/hydrogen/incinerator
	name = "Plasma Incinerator"
	desc = "A bluecross weapon, this plasma gun doesn't seems to heat up its hydrogen cell doesn't seem to run out"
	icon_state = "incinerator"
	use_plasma_cost = 0
	heat_per_shot = 0 // No heat gain.

	init_firemodes = list(
		list(mode_name = "standard", projectile_type = /obj/item/projectile/hydrogen, fire_sound='sound/weapons/lasercannonfire.ogg', fire_delay=10, icon="destroy", heat_per_shot = 0, use_plasma_cost = 1),
		list(mode_name = "maximal", projectile_type = /obj/item/projectile/hydrogen/max, fire_sound='sound/effects/supermatter.ogg', fire_delay=30, icon="kill", heat_per_shot = 0, use_plasma_cost = 1)
	)

/obj/item/weapon/gun/hydrogen/incinerator/Initialize()
	..()
	flask = new /obj/item/weapon/hydrogen_fuel_cell/infinite(src)

// Can't remove the cell
/obj/item/weapon/gun/hydrogen/incinerator/attackby(obj/item/weapon/W as obj, mob/living/user as mob)
	return
