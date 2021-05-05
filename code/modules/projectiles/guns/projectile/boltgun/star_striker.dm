
// Star-Striker! A sci only gun that fires laser based shells
/obj/item/weapon/gun/projectile/boltgun/sci
	name = "\"Star Striker\" laser boltgun"
	desc = "A weapon based on the Sike boltgun line but fitted to use longer, laser based casings. Chambered in .223 laser casings."
	icon = 'icons/obj/guns/energy/starstriker.dmi'
	icon_state = "starstriker"
	item_state = "starstriker"
	max_shells = 10
	price_tag = 250 //no...
	damage_multiplier = 1.4 //So were worth using
	caliber = CAL_SCI
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_MAGNET = 3, TECH_POWER = 6)
	fire_sound = 'sound/weapons/Laser.ogg'
	saw_off = FALSE
