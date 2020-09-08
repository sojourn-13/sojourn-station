/obj/item/weapon/gun/energy/centurio
	name = "\"Centurio\" plasma pistol"
	desc = "A specialized firearm designed to fire lethal plasma rounds or a slow yet high impact stun shot."
	icon = 'icons/obj/guns/energy/toxgun.dmi'
	icon_state = "toxgun"
	w_class = ITEM_SIZE_NORMAL
	slot_flags = SLOT_BELT|SLOT_BACK|SLOT_HOLSTER
	twohanded = FALSE
	can_dual = 1
	sel_mode = 1
	origin_tech = list(TECH_COMBAT = 5, TECH_PLASMA = 4)
	matter = list(MATERIAL_STEEL = 20, MATERIAL_PLASMA = 5)
	price_tag = 1250
	damage_multiplier = 1
	init_firemodes = list(
		list(mode_name="melt", projectile_type=/obj/item/projectile/plasma/heavy, fire_sound='sound/weapons/lasercannonfire.ogg', fire_delay = 9, icon="destroy", projectile_color = "#006633"),
		list(mode_name="impact stun", projectile_type=/obj/item/projectile/plasma/impact, fire_sound='sound/effects/supermatter.ogg', fire_delay = 25, icon="stun", projectile_color = "#ff7f24"),
		)