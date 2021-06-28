/*
- Projectile Drop-off for each gun.
- Make the gun use non-rechargable hydrogen flasks.
- Each flask hold ~15 shots.
- Reloaded using a screwdriver to remove and secure the cell. High skill cap and take a long time.
- Failure when reloading can lead to 20 burn damage to the hand or a containment failure on the first shot.
- Backpack & Feedline can replace hydrogen flasks.

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

/obj/item/projectile/plasma_bullet
	name = "plasma bolt"
	icon_state = "plasma_bolt"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	hitsound_wall = 'sound/weapons/guns/misc/laser_searwall.ogg'
	damage_types = list(BURN = 100)
	armor_penetration = 30
	check_armour = ARMOR_ENERGY
	muzzle_type = /obj/effect/projectile/plasma/muzzle
	impact_type = /obj/effect/projectile/plasma/impact
	kill_count = 15 // How long until they disapear

/obj/item/projectile/plasma_bullet/on_impact(atom/target)
	explosion(loc, 0, 0, 1) // Smallest possible explosion
	set_light(0)
	return TRUE

/obj/item/projectile/plasma_bullet/pistol
	kill_count = 10

/obj/item/projectile/plasma_bullet/pistol/welder
	kill_count = 7

/obj/item/projectile/plasma_bullet/cannon
	kill_count = 12

/obj/item/projectile/plasma_bullet/cannon/on_impact(atom/target)
	explosion(loc, 0, 1, 2, 4) // Same values as the missile.
	set_light(0)
	return TRUE
