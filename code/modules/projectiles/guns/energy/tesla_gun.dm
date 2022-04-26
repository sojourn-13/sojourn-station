/obj/item/gun/energy/tesla_gun
	name = "Tesla Gun"
	desc = "A gun that shoot lighting at people. Nobody is quite sure who originally made this or why. Deadly and fun! Tesla would be horrified."
	icon = 'icons/obj/guns/energy/cog.dmi'
	icon_state = "cog"
	item_charge_meter = FALSE
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5)
	price_tag = 1600
	charge_cost = 100
	fire_sound = 'sound/effects/lightningshock.ogg'
	suitable_cell = /obj/item/cell/medium
	cell_type = /obj/item/cell/medium/moebius
	slot_flags = SLOT_BELT|SLOT_HOLSTER|SLOT_BACK
	twohanded = TRUE
	w_class = ITEM_SIZE_BULKY
	can_dual = FALSE
	projectile_type = /obj/item/projectile/beam/tesla
	serial_type = "INDEX"
	serial_shown = FALSE
