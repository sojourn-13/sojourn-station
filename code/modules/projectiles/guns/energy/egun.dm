/obj/item/gun/energy/gun
	name = "\"Spider Rose\" energy pistol"
	desc = "Spider Rose is a versatile energy based sidearm, capable of switching between low and high capacity projectile settings. In other words: Stun or Kill."
	icon = 'icons/obj/guns/energy/egun.dmi'
	icon_state = "energystun100"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	can_dual = TRUE
	fire_sound = 'sound/weapons/Taser.ogg'
	charge_cost = 100
	matter = list(MATERIAL_PLASTEEL = 13, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 6)
	price_tag = 750

	projectile_type = /obj/item/projectile/beam/stun
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	modifystate = "energystun"
	item_modifystate = "stun"

	init_firemodes = list(
		STUNBOLT,
		LETHAL,
		WEAPON_CHARGE,
		)
	serial_type = "H&S"

/obj/item/gun/energy/gun/mounted
	name = "mounted energy gun"
	self_recharge = 1
	use_external_power = 1
	safety = FALSE
	restrict_safety = TRUE

/obj/item/gun/energy/gun/martin
	name = "\"Martin\" energy pistol"
	desc = "Martin is essentialy downscaled Spider Rose, made for security employees and civilians to use it as personal self defence weapon."
	icon = 'icons/obj/guns/energy/pdw.dmi'
	icon_state = "PDW"
	item_state = "gun"
	charge_meter = FALSE
	w_class = ITEM_SIZE_SMALL
	can_dual = TRUE
	charge_cost = 50
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 1)
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_PLASTIC = 4, MATERIAL_SILVER = 2)
	price_tag = 250
	modifystate = null
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small

/obj/item/gun/energy/gun/martin/preloaded

/obj/item/gun/energy/gun/martin/preloaded/New()
	cell = new /obj/item/cell/small/high(src)
	. = ..()
	update_icon()

/obj/item/gun/energy/gun/martin/proc/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stun")
		add_overlay("taser_pdw")
	else
		add_overlay("lazer_pdw")

/obj/item/gun/energy/gun/martin/update_icon()
	cut_overlays()
	if(cell && cell.charge >= charge_cost) //no overlay if we dont have any power
		update_mode()

/obj/item/gun/energy/gun/martin/upgraded
	name = "Overclocked \"Martin\" energy pistol"
	desc = "An overclocked varient of the Martin energy pistol, allowing for more efficent energy consumption and a slightly intensified lens."
	icon_state = "PDWU"
	charge_cost = 25
	matter = list(MATERIAL_PLASTEEL = 6, MATERIAL_PLASTIC = 4, MATERIAL_SILVER = 2, MATERIAL_URANIUM = 1)
	price_tag = 450

/obj/item/gun/energy/gun/martin/upgraded/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stun")
		add_overlay("taser_pdwu")
	else
		add_overlay("lazer_pdwu")

/obj/item/gun/energy/ntpistol
	name = "\"Serenity\" energy pistol"
	desc = "\"New Testament\" brand laser pistol. Small and easily concealable, it's still a reasonable punch for a laser weapon."
	icon = 'icons/obj/guns/energy/ntpistol.dmi'
	icon_state = "ntpistol"
	item_state = "ntpistol"
	item_charge_meter = FALSE
	fire_sound = 'sound/weapons/Laser.ogg'
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 1)
	w_class = ITEM_SIZE_SMALL
	projectile_type = /obj/item/projectile/beam
	charge_cost = 50
	can_dual = TRUE
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_WOOD = 4, MATERIAL_SILVER = 2)
	price_tag = 150
	init_firemodes = list(
		LETHAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small
	serial_type = "Absolute"