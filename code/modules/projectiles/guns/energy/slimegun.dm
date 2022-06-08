/obj/item/gun/energy/slimegun
	name = "\"Ranch\" core stopper gun"
	desc = "A gun suited for only dealing with slime outbreaks, do to many safety innovations to it the beam when hitting anything other then a slime will be harmless. \
	On hitting a slime the beam will attack its core shutting it down for an instantaneous death. Do to its small design it only takes small cells."
	icon = 'icons/obj/guns/energy/slimegun.dmi'
	icon_state = "slimepistol"
	item_state = "slimepistol"
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 3)
	price_tag = 500
	charge_cost = 100
	fire_sound = 'sound/weapons/Taser.ogg'
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	can_dual = TRUE
	projectile_type = /obj/item/projectile/slime_death
	serial_type = "SI"
