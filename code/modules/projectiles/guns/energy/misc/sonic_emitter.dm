/obj/item/gun/energy/sonic_emitter
	name = "handheld sonic emitter"
	desc = "A sonic weapon prototype specially designed to counter ameridian-based lifeforms by targeting the crystal's resonant frequency. \
			It is, however, very power-intensive and slow to shoot. It take large cells."
	icon = 'icons/obj/guns/energy/sonic_emitter.dmi'
	icon_state = "sonic_emitter"
	item_state = "sonic_emitter"
	charge_meter = FALSE
	matter = list(MATERIAL_STEEL = 10, MATERIAL_PLASTIC = 5)
	price_tag = 500
	charge_cost = 1000
	fire_sound = 'sound/effects/basscannon.ogg'
	suitable_cell = /obj/item/cell/large
	cell_type = /obj/item/cell/large
	slot_flags = SLOT_BELT|SLOT_HOLSTER
	projectile_type = /obj/item/projectile/sonic_bolt
	fire_delay = 15
	max_upgrades = 0

/obj/item/gun/energy/sonic_emitter/preloaded/New()
	cell = new /obj/item/cell/large/super(src)
	. = ..()
	update_icon()
	serial_type = "SI"
