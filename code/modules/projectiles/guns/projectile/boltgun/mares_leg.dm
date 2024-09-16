/obj/item/gun/projectile/boltgun/lever/shotgun
	name = "\"Mare's Leg\" repeating shotgun"
	desc = "An Armstrong rifle sporting a sawn-down barrel and rebored to take 20mm shotgun shells. It appears someone has mangled this gun and defaced its serial numbers."
	icon = 'icons/obj/guns/projectile/mares.dmi'
	icon_state = "mares"
	item_state = "mares"
	w_class = ITEM_SIZE_BULKY
	caliber = CAL_SHOTGUN
	fire_sound = 'sound/weapons/guns/fire/shotgun.ogg'
	max_shells = 6
	price_tag = 650
	init_recoil = HMG_RECOIL(1.0)
	damage_multiplier = 0.8
	penetration_multiplier = 0.9
	zoom_factors = list()
	extra_damage_mult_scoped = 0.2
	matter = list(MATERIAL_STEEL = 20, MATERIAL_WOOD = 6, MATERIAL_PLASTEEL = 7)
	serial_type = "INDEX"
	extra_bulk = -2
	gun_tags = list(GUN_PROJECTILE, GUN_INTERNAL_MAG, GUN_SCOPE)

/obj/item/gun/projectile/boltgun/lever/shotgun/bounty
	name = "\"Bounty\" repeating shotgun"
	desc = "A training shotgun turned into a workhorse. The Bounty was a Blackshield training shotgun for their bolt cycling training, now modified and repurposed to fire slug and buckshot shells. When used in close quarters with Blackshield's training, a trooper can clear a whole room full of bugs in seconds."
	icon = 'icons/obj/guns/projectile/bounty.dmi'
	damage_multiplier = 1.1
	penetration_multiplier = 0.7
	icon_state = "bounty"
	item_state = "bounty"
	price_tag = 950
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASTIC = 6, MATERIAL_PLASTEEL = 7)
	serial_type = "NM"
