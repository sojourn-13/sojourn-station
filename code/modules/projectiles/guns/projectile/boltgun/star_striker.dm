// Star-Striker! A sci only gun that fires laser based shells
/obj/item/gun/projectile/boltgun/sci
	name = "\"Star Striker\" laser boltgun"
	desc = "A weapon based on the Sike boltgun line but fitted to use longer, laser based casings. Chambered in .223 laser casings."
	icon = 'icons/obj/guns/energy/starstriker.dmi'
	icon_state = "starstriker"
	item_state = "starstriker"
	max_shells = 10
	price_tag = 250 //Massprintable form rnd, prevents it form being exported on mass for to cheap
	damage_multiplier = 1.4 //With normal we do 28, 38 while zoomed in.
	extra_damage_mult_scoped = 0.5
	force = WEAPON_FORCE_PAINFUL
	zoom_factors = list(2.0)
	caliber = CAL_SCI
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 2, TECH_MAGNET = 3, TECH_POWER = 6)
	matter = list(MATERIAL_PLASTEEL = 10, MATERIAL_PLASTIC = 15, MATERIAL_GLASS = 10)
	fire_sound = 'sound/weapons/energy/laser_rifle.ogg'
	saw_off = FALSE
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG)
	serial_type = "SI"
	gun_parts = null
