
// Star-Striker! A sci only gun that fires laser based shells
/obj/item/gun/projectile/boltgun/sci
	name = "\"Star Striker\" laser boltgun"
	desc = "A weapon based on the Sike boltgun line but fitted to use longer, laser based casings. Chambered in .223 laser casings."
	icon = 'icons/obj/guns/energy/starstriker.dmi'
	icon_state = "starstriker"
	item_state = "starstriker"
	max_shells = 10
	price_tag = 250 //no...
	damage_multiplier = 1.4 //So were worth using
	extra_damage_mult_scoped = 0.5
	force = WEAPON_FORCE_PAINFUL
	zoom_factor = 2.0
	caliber = CAL_SCI
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_MAGNET = 3, TECH_POWER = 6)
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 10)
	fire_sound = 'sound/weapons/Laser.ogg'
	saw_off = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	serial_type = "SI"
