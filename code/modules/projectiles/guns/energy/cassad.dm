/obj/item/gun/energy/pulse/cassad
	name = "\"Cassad\" energy rifle"
	desc = "\"Holland & Sullivan\" brand energy assault rifle, capable of prolonged combat. When surrender is not an option."
	icon = 'icons/obj/guns/energy/cassad.dmi'
	icon_state = "cassad"
	item_state = "cassad"
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 6, MATERIAL_URANIUM = 6)
	fire_sound = 'sound/weapons/pulse.ogg'
	projectile_type = /obj/item/projectile/beam/pulse
	sel_mode = 1
	charge_cost = 40 //20 shots per high medium-sized cell
	fire_delay = 12
	origin_tech = list(TECH_COMBAT = 7, TECH_PLASMA = 2)
	price_tag = 1500
	zoom_factor = null
	damage_multiplier = 1.1
	slot_flags = SLOT_BELT|SLOT_BACK
	init_firemodes = list(
		list(mode_name="rapid fire", mode_desc="Light rapid plasma bolts", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/Taser.ogg', fire_delay=8, icon="stun", projectile_color = "#00FFFF"),
		list(mode_name="armor penetrating", mode_desc="Harder hitting plasma bolts to reduce armor", projectile_type=/obj/item/projectile/plasma, fire_sound='sound/weapons/Laser.ogg', fire_delay=12, icon="kill", projectile_color = "#00AAFF"),
	)
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)
	twohanded = TRUE
	can_dual = FALSE
	serial_type = "H&S"

