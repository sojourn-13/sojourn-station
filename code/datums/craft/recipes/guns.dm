/datum/craft_recipe/gun
	category = "Guns"
	time = 25
	related_stats = list(STAT_MEC)

/datum/craft_recipe/gun/ammo_kit
	name = "ammo kit"
	result = /obj/item/ammo_kit
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/stack/rods, 10, "time" = 60),
		list(CRAFT_MATERIAL, 3, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 4, MATERIAL_CARDBOARD, "time" = 60),
		list(/obj/item/weapon/tool/wrench/improvised, 1, "time" = 60),
		list(/obj/item/weapon/tool/knife/shiv, 1, "time" = 60),
		list(/obj/item/weapon/tool/wirecutters/improvised, 1, "time" = 60),
		list(QUALITY_WELDING, 15, "time" = 30),
		list(QUALITY_CUTTING, 10, "time" = 30),
		list(QUALITY_ADHESIVE, 15, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 15, "time" = 30),
		list(QUALITY_SAWING, 15, "time" = 30)
	)

/datum/craft_recipe/gun/pistol
	name = "handmade pistol"
	result = /obj/item/weapon/gun/projectile/handmade_pistol
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/stack/rods, 3, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(/obj/item/weapon/crossbowframe, 1, "time" = 20)
	)

/datum/craft_recipe/gun/pistol_magnum
	name = "handmade magnum"
	result = /obj/item/weapon/gun/projectile/handmade_pistol/magnum
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/weapon/gun/projectile/handmade_pistol, 1, "time" = 60),
		list(QUALITY_SAWING, 10, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 30),
		list(QUALITY_WELDING, 10, "time" = 30)
	)

/datum/craft_recipe/gun/pistol_slugger
	name = "handmade slugger"
	result = /obj/item/weapon/gun/projectile/handmade_pistol/shotgun
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/weapon/gun/projectile/handmade_pistol, 1, "time" = 60),
		list(QUALITY_SAWING, 10, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 30),
		list(QUALITY_WELDING, 10, "time" = 30)
	)

/datum/craft_recipe/gun/pistol_man_opener
	name = "handmade man-opener"
	result = /obj/item/weapon/gun/projectile/handmade_pistol/anti_material
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/weapon/gun/projectile/handmade_pistol, 1, "time" = 60),
		list(QUALITY_SAWING, 10, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 30),
		list(QUALITY_WELDING, 10, "time" = 30)
	)

/datum/craft_recipe/gun/handmaderevolver
	name = "handmade Revolver"
	result = /obj/item/weapon/gun/projectile/revolver/handmade
	steps = list(
		list(CRAFT_MATERIAL, 2, MATERIAL_PLASTEEL),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 15, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/handmaderifle
	name = "Handmade bolt action rifle"
	result = /obj/item/weapon/gun/projectile/boltgun/handmade
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/makeshiftgl
	name = "makeshift grenade launcher"
	result = /obj/item/weapon/gun/projectile/shotgun/pump/china/makeshift
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/slidebarrelshotgun
	name = "slide barrel shotgun"
	result = /obj/item/weapon/gun/projectile/shotgun/slidebarrel
	steps = list(
		list(CRAFT_MATERIAL, 3, MATERIAL_PLASTEEL),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/motherfucker
	name = "\"Punch Hole\" motherfucker"
	result = /obj/item/weapon/gun/projectile/automatic/motherfucker
	steps = list(
		list(CRAFT_MATERIAL, 5, MATERIAL_PLASTEEL),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 15, MATERIAL_WOOD),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/makeshiftlaser
	name = "makeshift laser carbine"
	result = /obj/item/weapon/gun/energy/laser/makeshift
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTIC),
		list(/obj/item/weapon/stock_parts/micro_laser , 4),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/shrapnelcannon
	name = "\"Shellshock\" scrap rifle"
	result = /obj/item/weapon/gun/energy/shrapnel
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(/obj/item/stack/material/steel, 8, "time" = 20),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/gun/lasersmg
	name = "Lasblender - Texin"
	result = /obj/item/weapon/gun/energy/lasersmg
	icon_state = "gun"
	steps = list(
		list(/obj/item/weapon/gun/projectile/automatic/texan, 1),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL, "time" = 10),
		list(/obj/item/weapon/stock_parts/subspace/crystal, 1),
		list(/obj/item/weapon/computer_hardware/led, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(/obj/item/weapon/stock_parts/capacitor, 1, "time" = 5),
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 10),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/gun/lasersmg_alt
	name = "Lasblender - Mac"
	result = /obj/item/weapon/gun/energy/lasersmg/alt
	icon_state = "gun"
	steps = list(
		list(/obj/item/weapon/gun/projectile/automatic/mac, 1),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL, "time" = 10),
		list(/obj/item/weapon/stock_parts/subspace/crystal, 1),
		list(/obj/item/weapon/computer_hardware/led, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(/obj/item/weapon/stock_parts/capacitor, 1, "time" = 5),
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 10),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/gun/rxd
	name = "RXD - rapid crossbow device"
	result = /obj/item/weapon/gun/launcher/crossbow/RCD
	steps = list(
		list(/obj/item/weapon/rcd, 1, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 10, 30),
		list(QUALITY_SAWING, 10, "time" = 60),
		list(/obj/item/weapon/crossbowframe, 1, "time" = 20),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)

/datum/craft_recipe/gun/multi_laser
	name = "Multi-Laser Cannon"
	result = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy/auto
	steps = list(
		list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy, 1, "time" = 60),
		list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy, 1, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
		list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy, 1, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
		list(/obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy, 1, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)
