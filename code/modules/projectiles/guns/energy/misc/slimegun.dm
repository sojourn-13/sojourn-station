/obj/item/gun/energy/slimegun
	name = "\"Ranch\" core stopper gun"
	desc = "A gun suited for dealing with slime outbreaks, due to many safety innovations the beam will be harmless for anything other than slime lifeforms. \
	When hitting a slime, the beam will directly attack its core, shutting it down for an instantaneous death while keeping it intact for harvesting. Due to its small design it only takes small cells."
	icon = 'icons/obj/guns/energy/slimegun.dmi'
	icon_state = "slimepistol"
	item_state = "slimepistol"
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 3)
	price_tag = 500
	charge_cost = 20
	fire_sound = 'sound/weapons/energy/Taser.ogg'
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	can_dual = TRUE
	projectile_type = /obj/item/projectile/slime_death
	serial_type = "SI"
