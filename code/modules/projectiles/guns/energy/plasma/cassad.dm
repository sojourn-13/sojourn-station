/obj/item/gun/energy/pulse/cassad
	name = "\"Cassad\" energy rifle"
	desc = "\"Holland & Sullivan\" brand energy assault rifle, capable of prolonged combat. When surrender is not an option."
	icon = 'icons/obj/guns/energy/cassad.dmi'
	icon_state = "cassad"
	item_state = "cassad"
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 6, MATERIAL_URANIUM = 6)
	fire_sound = 'sound/weapons/energy/pulse.ogg'
	projectile_type = /obj/item/projectile/beam/pulse
	sel_mode = 1
	charge_cost = 25
	fire_delay = 6
	init_recoil = CARBINE_RECOIL(1)
	origin_tech = list(TECH_COMBAT = 7, TECH_PLASMA = 2)
	price_tag = 1200
	zoom_factors = list()
	slot_flags = SLOT_BACK
	init_firemodes = list(
		list(mode_name="Melt", mode_desc="A reliable plasma round, for stripping away armor", projectile_type=/obj/item/projectile/plasma, fire_sound='sound/weapons/energy/burn.ogg', burst=1, fire_delay = 9, charge_cost=25, icon="kill", projectile_color = "#00AAFF"),
		list(mode_name="Pulse", mode_desc="A plasma round configured to explode violently on impact, and cause a pulse of EMP", projectile_type=/obj/item/projectile/plasma/aoe/ion, fire_sound='sound/weapons/energy/taser.ogg', burst=1, fire_delay=12, charge_cost=150, icon="stun", projectile_color = "#00FFFF")
	)
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)
	twohanded = TRUE
	can_dual = FALSE
	serial_type = "H&S"
	blacklist_upgrades = list(/obj/item/gun_upgrade/mechanism/greyson_master_catalyst = TRUE)


/obj/item/gun/energy/pulse/cassad/marqua
	name = "\"Railroad\" Pulse Carbine"
	desc = "A Mar'quaian long smooth alloyed carbine, loading M-cells, and pulsing their release along its lengthy rails, forming a well burning arc before dispatching it forth towards its target. Often with deadly accuracy."
	icon = 'icons/obj/guns/plasma/marqua.dmi'
	icon_state = "skrell_carbine"
	item_state = "skrell_carbine"
	matter = list(MATERIAL_PLASTEEL = 18, MATERIAL_PLASTIC = 8, MATERIAL_SILVER = 6, MATERIAL_URANIUM = 6)
	fire_sound = 'sound/weapons/energy/pulse.ogg'
	projectile_type = /obj/item/projectile/beam/pulse
	sel_mode = 1
	charge_cost = 90 // almost 7 shots out of a 600M due to DM rounding (6.666667)
	init_recoil = CARBINE_RECOIL(0.3)
	origin_tech = list(TECH_COMBAT = 7, TECH_PLASMA = 2)
	price_tag = 2400
	zoom_factors = list()
	damage_multiplier = 1.3
	slot_flags = SLOT_BACK
	init_firemodes = list(
		list(mode_name="rapid fire", mode_desc="Light rapid plasma bolts", projectile_type=/obj/item/projectile/plasma/light, fire_sound='sound/weapons/energy/Taser.ogg', fire_delay=1, icon="stun", projectile_color = "#00FFFF"),
		list(mode_name="armor penetrating", mode_desc="Harder hitting plasma bolts to reduce armor", projectile_type=/obj/item/projectile/plasma, fire_sound='sound/weapons/energy/Laser.ogg', fire_delay=3, icon="kill", projectile_color = "#00AAFF"),
	)
	gun_tags = list(GUN_ENERGY, GUN_SCOPE)
	twohanded = TRUE
	can_dual = FALSE
	serial_type = "MAR"


