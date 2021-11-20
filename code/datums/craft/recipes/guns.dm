/datum/craft_recipe/gun
	category = "Guns"
	time = 25
	related_stats = list(STAT_MEC)

/datum/craft_recipe/gun/ammo_kit
	name = "scrap ammo kit"
	result = /obj/item/ammo_kit
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/stack/rods, 5, "time" = 60),
		list(CRAFT_MATERIAL, 2, MATERIAL_STEEL, "time" = 60),
		list(CRAFT_MATERIAL, 1, MATERIAL_CARDBOARD, "time" = 60),
		list(/obj/item/tool/wirecutters/improvised, 1, "time" = 60),
		list(QUALITY_WELDING, 15, "time" = 30),
		list(QUALITY_CUTTING, 10, "time" = 30),
		list(QUALITY_ADHESIVE, 15, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 15, "time" = 30),
		list(QUALITY_SAWING, 15, "time" = 30)
	)

/datum/craft_recipe/gun/pistol
	name = "handmade pistol"
	result = /obj/item/gun/projectile/handmade_pistol
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/stack/rods, 3, "time" = 60),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD)
	)

/datum/craft_recipe/gun/pistol_magnum
	name = "handmade magnum"
	result = /obj/item/gun/projectile/handmade_pistol/magnum
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/gun/projectile/handmade_pistol, 1, "time" = 60),
		list(QUALITY_SAWING, 10, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 30),
		list(QUALITY_WELDING, 10, "time" = 30)
	)

/datum/craft_recipe/gun/pistol_slugger
	name = "handmade slugger"
	result = /obj/item/gun/projectile/handmade_pistol/shotgun
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/gun/projectile/handmade_pistol, 1, "time" = 60),
		list(QUALITY_SAWING, 10, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 30),
		list(QUALITY_WELDING, 10, "time" = 30)
	)

/datum/craft_recipe/gun/pistol_man_opener
	name = "handmade man-opener"
	result = /obj/item/gun/projectile/handmade_pistol/anti_material
	icon_state = "woodworking"
	steps = list(
		list(/obj/item/gun/projectile/handmade_pistol, 1, "time" = 60),
		list(QUALITY_SAWING, 10, "time" = 30),
		list(QUALITY_ADHESIVE, 10, "time" = 30),
		list(QUALITY_WELDING, 10, "time" = 30)
	)

/datum/craft_recipe/gun/handmaderevolver
	name = "handmade Revolver"
	result = /obj/item/gun/projectile/revolver/handmade
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
	result = /obj/item/gun/projectile/boltgun/handmade
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
	result = /obj/item/gun/projectile/shotgun/pump/china/makeshift
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
	result = /obj/item/gun/projectile/shotgun/slidebarrel
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
	result = /obj/item/gun/projectile/automatic/motherfucker
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
	result = /obj/item/gun/energy/laser/makeshift
	steps = list(
		list(CRAFT_MATERIAL, 4, MATERIAL_PLASTEEL, "time" = 60),
		list(QUALITY_ADHESIVE, 15, 70),
		list(CRAFT_MATERIAL, 20, MATERIAL_STEEL),
		list(QUALITY_WELDING, 10, 20),
		list(CRAFT_MATERIAL, 15, MATERIAL_PLASTIC),
		list(/obj/item/stock_parts/micro_laser , 4),
		list(QUALITY_SCREW_DRIVING, 10)
	)

/datum/craft_recipe/gun/shrapnelcannon
	name = "\"Shellshock\" scrap rifle"
	result = /obj/item/gun/energy/shrapnel
	icon_state = "gun"
	steps = list(
		list(CRAFT_MATERIAL, 20, MATERIAL_PLASTEEL, "time" = 60),
		list(CRAFT_MATERIAL, 8, MATERIAL_STEEL, "time" = 60),
		list(QUALITY_CUTTING, 20, "time" = 40),
		list(QUALITY_HAMMERING, 20, "time" = 40),
		list(/obj/item/stack/cable_coil, 10, "time" = 20),
		list(QUALITY_WIRE_CUTTING, 20, 30),
		list(QUALITY_SCREW_DRIVING, 20, "time" = 60),
		list(QUALITY_BOLT_TURNING, 30, "time" = 40)
	)

/datum/craft_recipe/gun/lasersmg
	name = "Lasblender - Texin"
	result = /obj/item/gun/energy/lasersmg
	icon_state = "gun"
	steps = list(
		list(/obj/item/gun/projectile/automatic/texan, 1),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL, "time" = 10),
		list(/obj/item/stock_parts/subspace/crystal, 1),
		list(/obj/item/computer_hardware/led, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(/obj/item/stock_parts/capacitor, 1, "time" = 5),
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 10),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/gun/lasersmg_alt
	name = "Lasblender - Mac"
	result = /obj/item/gun/energy/lasersmg/alt
	icon_state = "gun"
	steps = list(
		list(/obj/item/gun/projectile/automatic/mac, 1),
		list(QUALITY_WELDING, 10, "time" = 30),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL, "time" = 10),
		list(/obj/item/stock_parts/subspace/crystal, 1),
		list(/obj/item/computer_hardware/led, 1),
		list(/obj/item/stack/cable_coil, 5, "time" = 20),
		list(/obj/item/stock_parts/capacitor, 1, "time" = 5),
		list(CRAFT_MATERIAL, 2, MATERIAL_GLASS, "time" = 10),
		list(QUALITY_ADHESIVE, 15, 70)
	)

/datum/craft_recipe/gun/rxd
	name = "RXD - rapid crossbow device"
	result = /obj/item/gun/launcher/crossbow/RCD
	steps = list(
		list(/obj/item/rcd, 1, "time" = 30),
		list(QUALITY_SCREW_DRIVING, 10, 30),
		list(QUALITY_SAWING, 10, "time" = 60),
		list(CRAFT_MATERIAL, 5, MATERIAL_WOOD), //same as the old crossbow frame
		list(QUALITY_WELDING, 10, "time" = 30),
		list(/obj/item/stack/cable_coil, 2, "time" = 10)
	)

/datum/craft_recipe/gun/multi_laser
	name = "Multi-Laser Cannon"
	result = /obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy/auto
	steps = list(
		list(/obj/item/mecha_parts/mecha_equipment/ranged_weapon/energy/laser/heavy, 4, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 180)
	)

/datum/craft_recipe/gun/pilgrim_claw
	name = "Pilgrim Claw"
	result = /obj/item/gun/projectile/revolver/lemant/claw
	steps = list(
		list(/obj/item/gun/projectile/revolver/lemant, 1, "time" = 20),
		list(/obj/item/tool_upgrade/augment/spikes, 1, "time" = 20),
		list(QUALITY_HAMMERING, 30, "time" = 10)
	)
