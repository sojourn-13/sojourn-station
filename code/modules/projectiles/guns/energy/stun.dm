/obj/item/weapon/gun/energy/taser
	name = "\"Counselor\" stun gun"
	desc = "The OT SP \"Counselor\" is a taser gun used for non-lethal takedowns. Originally produced by the Old Testament as a non-lethal and safe alternative to plasma or ballistics."
	icon = 'icons/obj/guns/energy/taser.dmi'
	icon_state = "taser"
	item_state = null	//so the human update icon uses the icon_state instead.
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_PLASTIC = 6, MATERIAL_SILVER = 3)
	price_tag = 1000
	charge_cost = 50
	fire_sound = 'sound/weapons/Taser.ogg'
	can_dual = TRUE
	projectile_type = /obj/item/projectile/beam/stun

	init_firemodes = list(
		list(mode_name="taser", projectile_type=/obj/item/projectile/beam/stun, fire_delay=12, charge_cost = 50),
		list(mode_name="stunbolt", projectile_type=/obj/item/projectile/energy/electrode, fire_delay=25, charge_cost = 300),
		list(mode_name="stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_delay=50, charge_cost = 600), //Takes 1 full level 1 M cell
	)

/obj/item/weapon/gun/energy/taser/mounted
	name = "mounted taser gun"
	self_recharge = 1
	use_external_power = 1
	safety = FALSE
	restrict_safety = TRUE
	damage_multiplier = 0.6

	init_firemodes = list(
		list(mode_name="taser", projectile_type=/obj/item/projectile/beam/stun, fire_delay=24, charge_cost = 7500), //We use large cells
		list(mode_name="stunbolt", projectile_type=/obj/item/projectile/energy/electrode, fire_delay=50, charge_cost = 25000),
		list(mode_name="stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_delay=80, charge_cost = 50000),
	)

/obj/item/weapon/gun/energy/taser/mounted/cyborg
	name = "taser gun"
	recharge_time = 10 //Time it takes for shots to recharge (in ticks)
	damage_multiplier = 0.9
	init_firemodes = list(
		list(mode_name="taser", projectile_type=/obj/item/projectile/beam/stun, fire_delay=12, charge_cost = 50),
		list(mode_name="stunbolt", projectile_type=/obj/item/projectile/energy/electrode, fire_delay=25, charge_cost = 300),
		list(mode_name="stunshot", projectile_type=/obj/item/projectile/energy/electrode/stunshot, fire_delay=50, charge_cost = 600),
	)

/obj/item/weapon/gun/energy/stunrevolver
	name = "\"Zeus\" stun revolver"
	desc = "Also know as stun revolver. Older and less precise H&S solution for non-lethal takedowns. This gun has a smaller capacity in exchange for S-cells use."
	icon = 'icons/obj/guns/energy/stunrevolver.dmi'
	icon_state = "stunrevolver"
	item_state = "stunrevolver"
	fire_sound = 'sound/weapons/Gunshot.ogg'
	can_dual = TRUE
	origin_tech = list(TECH_COMBAT = 3, TECH_MATERIAL = 3, TECH_POWER = 2)
	charge_cost = 50
	matter = list(MATERIAL_PLASTEEL = 12, MATERIAL_WOOD = 6, MATERIAL_SILVER = 2)
	price_tag = 750
	suitable_cell = /obj/item/weapon/cell/small
	cell_type = /obj/item/weapon/cell/small
	projectile_type = /obj/item/projectile/energy/electrode
