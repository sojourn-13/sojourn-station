/obj/item/gun/energy/gun
	name = "\"Spider Rose\" energy pistol"
	desc = "Spider Rose is a versatile energy based sidearm, capable of switching between low and high capacity projectile settings. In other words: Stun or Kill."
	icon = 'icons/obj/guns/energy/egun.dmi'
	icon_state = "energystun100"
	item_state = null	//so the human update icon uses the icon_state instead.
	item_charge_meter = TRUE
	can_dual = TRUE
	fire_sound = 'sound/weapons/energy/laser_pistol.ogg'
	charge_cost = 100
	matter = list(MATERIAL_PLASTEEL = 13, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 6)
	price_tag = 650

	projectile_type = /obj/item/projectile/beam/stun
	origin_tech = list(TECH_COMBAT = 3, TECH_MAGNET = 2)
	modifystate = "energystun"
	item_modifystate = "stun"

	init_firemodes = list(
		STUNBOLT,
		list(mode_name="kill", mode_desc="Fires a lethal laser projectile", projectile_type=/obj/item/projectile/beam, item_modifystate="kill", fire_sound='sound/weapons/energy/laser_pistol.ogg', icon="kill"), // This is so that it uses the laser pistol firing sound. Use the LETHAL define for stock energy rifles.
		WEAPON_CHARGE,
		)
	serial_type = "H&S"

	wield_delay = 0.3 SECOND
	wield_delay_factor = 0.2 // 20 vig

/obj/item/gun/energy/gun/mounted
	name = "mounted energy gun"
	self_recharge = 1
	use_external_power = 1
	safety = FALSE
	restrict_safety = TRUE

/obj/item/gun/energy/gun/martin
	name = "\"Martin\" energy pistol"
	desc = "Martin is essentialy a downscaled Spider Rose, made for security employees and civilians to use it as a personal self defence weapon."
	icon = 'icons/obj/guns/energy/pdw.dmi'
	icon_state = "PDW"
	item_state = "gun"
	charge_meter = FALSE
	w_class = ITEM_SIZE_SMALL
	can_dual = TRUE
	charge_cost = 50
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 1)
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_PLASTIC = 4, MATERIAL_SILVER = 2)
	price_tag = 300
	modifystate = null
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small
	wield_delay = 0.2 SECOND
	wield_delay_factor = 0.2 // 20 vig

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
	price_tag = 500
	init_firemodes = list(
		list(mode_name="stun", mode_desc="Fires a concentrated stun beam", projectile_type=/obj/item/projectile/beam/stun, charge_cost = 25, icon="stun", fire_sound='sound/weapons/energy/Taser.ogg'),
		list(mode_name="lethal", mode_desc="Fires a concentrated laser blast", projectile_type=/obj/item/projectile/beam/midlaser, charge_cost = 25, icon="kill", fire_sound='sound/weapons/energy/laser_pistol.ogg'), // Intensified lens = more damage
		list(mode_name="charge mode", mode_desc="Hold down the trigger, and let loose a more powerful shot", mode_type = /datum/firemode/charge, icon="charge")
	)

/obj/item/gun/energy/gun/martin/upgraded/update_mode()
	var/datum/firemode/current_mode = firemodes[sel_mode]
	if(current_mode.name == "stun")
		add_overlay("taser_pdwu")
	else
		add_overlay("lazer_pdwu")
		
/obj/item/gun/energy/ntpistol
	name = "\"Serenity\" energy pistol"
	desc = "\"New Testament\" brand laser pistol. Small and easily concealable, it's still a reasonable punch for a laser weapon. Refurbished after numerous copyright allegations."
	icon = 'icons/obj/guns/energy/ntpistol.dmi'
	icon_state = "ntpistol"
	item_state = "ntpistol"
	item_charge_meter = FALSE
	fire_sound = 'sound/weapons/energy/Laser.ogg'
	origin_tech = list(TECH_COMBAT = 2, TECH_MAGNET = 1)
	w_class = ITEM_SIZE_SMALL
	projectile_type = /obj/item/projectile/beam
	charge_cost = 50
	can_dual = TRUE
	matter = list(MATERIAL_PLASTEEL = 4, MATERIAL_WOOD = 4, MATERIAL_SILVER = 2)
	price_tag = 200
	init_firemodes = list(
		LETHAL,
		WEAPON_CHARGE
	)
	twohanded = FALSE
	suitable_cell = /obj/item/cell/small
	cell_type = /obj/item/cell/small
	serial_type = "Absolute"
