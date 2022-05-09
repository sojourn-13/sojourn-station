/obj/item/gun/energy/plasma/thalkor
	name = "\"Thalkor\" plasma accelerator"
	desc = "An advanced plasma weapon of Mar'Qua make. The Thalkor is a mainstay among the space-faring forces of the Mar'Qua, both for its startling firepower and surprising range for a plasma weapon"
	icon = 'icons/obj/guns/energy/thalkor.dmi'
	icon_state = "thalkor"
	w_class = ITEM_SIZE_HUGE
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 6, MATERIAL_URANIUM = 6)
	fire_sound = 'sound/weapons/pulse.ogg'
	projectile_type = /obj/item/projectile/beam/pulse
	sel_mode = 1
	charge_cost = 100
	fire_delay = 12
	origin_tech = list(TECH_COMBAT = 8, TECH_PLASMA = 4)
	price_tag = 1500
	zoom_factor = null
	damage_multiplier = 1.3
	penetration_multiplier = 1.3
	slot_flags = SLOT_BELT|SLOT_BACK
	init_firemodes = list(
		list(mode_name="Accelerated shot", mode_desc="A lighter plasma shot that travels at incredible speeds", projectile_type=/obj/item/projectile/plasma/marquafast, fire_sound='sound/weapons/Taser.ogg', fire_delay=14, icon="stun", projectile_color = "#00FFFF"),
		list(mode_name="Heavy shot", mode_desc="Full powered plasma shot", projectile_type=/obj/item/projectile/plasma/heavy/marqua, fire_sound='sound/weapons/Laser.ogg', fire_delay=20, icon="kill", projectile_color = "#00AAFF"),
	)
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)
	twohanded = TRUE
	can_dual = FALSE
	serial_type = "SI"

/obj/item/gun/energy/plasma/thalkor/pistol
	name = "\"Thilkor\" plasma accelerator"
	desc = "An advanced plasma weapon of Mar'Qua make. A mainstay among Mar'Qua for its sheer utility and ease of use."
	icon = 'icons/obj/guns/energy/thilkor.dmi'
	icon_state = "thilkor"
	w_class = ITEM_SIZE_NORMAL
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 4, MATERIAL_URANIUM = 4)
	fire_sound = 'sound/weapons/pulse.ogg'
	projectile_type = /obj/item/projectile/beam/pulse
	sel_mode = 1
	charge_cost = 75
	fire_delay = 12
	origin_tech = list(TECH_COMBAT = 8, TECH_PLASMA = 4)
	price_tag = 1250
	zoom_factor = null
	damage_multiplier = 0.6
	penetration_multiplier = 0.6
	slot_flags = SLOT_BELT
	twohanded = FALSE
	can_dual = TRUE