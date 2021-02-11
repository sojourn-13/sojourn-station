/datum/craft_recipe/repairs
	category = "Repairs"
	time = 60
	related_stats = list(STAT_MEC)
	icon_state = "gun"

/datum/craft_recipe/repairs/double_barrel
	name = "Double barrel shotgun"
	result = /obj/item/weapon/gun/projectile/shotgun/doublebarrel
	steps = list(
		list(/obj/item/weapon/gun/projectile/shotgun/doublebarrel/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/combat_shotgun
	name = "Combat shotgun"
	result = /obj/item/weapon/gun/projectile/shotgun/pump/combat
	steps = list(
		list(/obj/item/weapon/gun/projectile/shotgun/pump/combat/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTIC),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/gladstone_shotgun
	name = "Gladstone shotgun"
	result = /obj/item/weapon/gun/projectile/shotgun/pump/gladstone
	steps = list(
		list(/obj/item/weapon/gun/projectile/shotgun/pump/gladstone/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTIC),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/sixshot_shotgun
	name = "Sixshot shotgun"
	result = /obj/item/weapon/gun/projectile/revolver/sixshot
	steps = list(
		list(/obj/item/weapon/gun/projectile/revolver/sixshot/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/grizzly_shotgun
	name = "Grizzly shotgun"
	result = /obj/item/weapon/gun/projectile/shotgun/pump
	steps = list(
		list(/obj/item/weapon/gun/projectile/shotgun/pump/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/obrez_shotgun
	name = "Obrez shotgun"
	result = /obj/item/weapon/gun/projectile/shotgun/pump/sawn
	steps = list(
		list(/obj/item/weapon/gun/projectile/shotgun/pump/obrez, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/ak47_rifle
	name = "Kalashnikov rifle"
	result = /obj/item/weapon/gun/projectile/automatic/ak47/sa
	steps = list(
		list(/obj/item/weapon/gun/projectile/automatic/ak47/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/sts_standard_rifle
	name = "STS standard rifle"
	result = /obj/item/weapon/gun/projectile/automatic/sts/rifle
	steps = list(
		list(/obj/item/weapon/gun/projectile/automatic/sts/rifle/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/sts_heavy_rifle
	name = "STS heavy rifle"
	result = /obj/item/weapon/gun/projectile/automatic/sts/hrifle
	steps = list(
		list(/obj/item/weapon/gun/projectile/automatic/sts/hrifle/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/sts_carbine
	name = "STS carbine"
	result = /obj/item/weapon/gun/projectile/automatic/sts/lrifle
	steps = list(
		list(/obj/item/weapon/gun/projectile/automatic/sts/lrifle/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/scout_boltgun
	name = "Scout heavy boltgun"
	result = /obj/item/weapon/gun/projectile/boltgun/scout
	steps = list(
		list(/obj/item/weapon/gun/projectile/boltgun/sawn/scout, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/sika_boltgun
	name = "Sika light boltgun"
	result = /obj/item/weapon/gun/projectile/boltgun/scout/light
	steps = list(
		list(/obj/item/weapon/gun/projectile/boltgun/sawn/light, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
	)

/datum/craft_recipe/repairs/roe_boltgun
	name = "Roe light boltgun"
	result = /obj/item/weapon/gun/projectile/boltgun/scout/light/wood
	steps = list(
		list(/obj/item/weapon/gun/projectile/boltgun/sawn/light/wood, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60),
	)