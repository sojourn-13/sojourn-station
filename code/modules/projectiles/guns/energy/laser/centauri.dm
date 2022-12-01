/obj/item/gun/energy/centauri
	name = "SI PDW \"Centauri\""
	desc = "\"Soteria\" brand laser sub-machine gun with a great firerate. \
	With a built in red dotted scope and plasma cooling build into the barrel makes recoil and sight not an issue. \
	Unlike other more scrapped together laser sub-machine guns this one is built to not over-heat itself with added delays in firing."
	icon = 'icons/obj/guns/energy/centauri.dmi'
	icon_state = "centauri"
	item_state = "centauri"
	item_charge_meter = TRUE
	fire_sound = 'sound/weapons/energy/Laser.ogg'
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 4, TECH_MATERIAL = 3, TECH_POWER = 3)
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT
	projectile_type = /obj/item/projectile/beam
	suitable_cell = /obj/item/cell/medium
	charge_cost = 50 //Doble normal do to being cooled by plasma and other such things
	fire_delay = 8 //Well its an SMG it has a long cool down form shits
	zoom_factors = list(0.5) //Scope
	matter = list(MATERIAL_PLASTEEL = 15, MATERIAL_STEEL = 10, MATERIAL_SILVER = 4, MATERIAL_PLASMA = 8)
	price_tag = 1800 //900 on cargo
	damage_multiplier = 0.6 //Litttttle better then normal
	init_recoil = CARBINE_RECOIL(1)
	gun_tags = list(GUN_LASER, GUN_ENERGY)
	init_firemodes = list(
		FULL_AUTO_300,
		SEMI_AUTO_NODELAY,
		BURST_5_ROUND
		)
	serial_type = "SI"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig
