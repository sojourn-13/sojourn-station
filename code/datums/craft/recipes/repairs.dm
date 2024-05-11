/*
/datum/craft_recipe/repairs
	category = "Repairs"
	time = 60
	related_stats = list(STAT_MEC)
	icon_state = "gun"

/datum/craft_recipe/repairs/double_barrel
	name = "Double barrel shotgun"
	result = /obj/item/gun/projectile/shotgun/doublebarrel
	steps = list(
		list(/obj/item/gun/projectile/shotgun/doublebarrel/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/combat_shotgun
	name = "Regulator shotgun"
	result = /obj/item/gun/projectile/shotgun/pump/combat
	steps = list(
		list(/obj/item/gun/projectile/shotgun/pump/combat/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTIC),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/sixshot_shotgun
	name = "Sixshot shotgun"
	result = /obj/item/gun/projectile/revolver/sixshot
	steps = list(
		list(/obj/item/gun/projectile/revolver/sixshot/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/grizzly_shotgun
	name = "Grizzly shotgun"
	result = /obj/item/gun/projectile/shotgun/pump
	steps = list(
		list(/obj/item/gun/projectile/shotgun/pump/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/obrez_shotgun
	name = "sawn-down Grizzly shotgun"
	result = /obj/item/gun/projectile/shotgun/pump/sawn
	steps = list(
		list(/obj/item/gun/projectile/shotgun/pump/obrez, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/ak47_rifle
	name = "Kalashnikov rifle"
	result = /obj/item/gun/projectile/automatic/ak47/sa
	steps = list(
		list(/obj/item/gun/projectile/automatic/ak47/sa/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/sts_standard_rifle_blackshield
	name = "Blackshield STS rifle"
	result = /obj/item/gun/projectile/automatic/sts/rifle/blackshield
	steps = list(
		list(/obj/item/gun/projectile/automatic/sts/rifle/sawn/blackshield, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/sts_standard_rifle
	name = "STS battle rifle"
	result = /obj/item/gun/projectile/automatic/sts/rifle
	steps = list(
		list(/obj/item/gun/projectile/automatic/sts/rifle/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/solmarine
	name = "Solarian carbine"
	result = /obj/item/gun/projectile/automatic/omnirifle/solmarine
	steps = list(
		list(/obj/item/gun/projectile/automatic/omnirifle/solmarine/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/strelki_rifle
	name = "Strelki rifle"
	result = /obj/item/gun/projectile/automatic/nordwind/strelki
	steps = list(
		list(/obj/item/gun/projectile/automatic/nordwind/strelki/sawn, 1, "time" = 60),
		list(CRAFT_MATERIAL, 6, MATERIAL_WOOD),
		list(CRAFT_MATERIAL, 6, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 10, MATERIAL_GLASS),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/scout_boltgun
	name = "Scout heavy boltgun"
	result = /obj/item/gun/projectile/boltgun/scout
	steps = list(
		list(/obj/item/gun/projectile/boltgun/sawn/scout, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 10, MATERIAL_GLASS),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/roe_boltgun
	name = "Roe light boltgun"
	result = /obj/item/gun/projectile/boltgun/light
	steps = list(
		list(/obj/item/gun/projectile/boltgun/sawn/light, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTEEL),
		list(CRAFT_MATERIAL, 10, MATERIAL_GLASS),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/novakovic_boltgun
	name = "Novakovic boltgun"
	result = /obj/item/gun/projectile/boltgun/sa
	steps = list(
		list(/obj/item/gun/projectile/boltgun/sawn/sa, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_WOOD),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)

/datum/craft_recipe/repairs/mosin_boltgun
	name = "Kardashev-Mosin boltgun"
	result = /obj/item/gun/projectile/boltgun
	steps = list(
		list(/obj/item/gun/projectile/boltgun/sawn/true, 1, "time" = 60),
		list(CRAFT_MATERIAL, 10, MATERIAL_PLASTIC),
		list(CRAFT_MATERIAL, 10, MATERIAL_STEEL),
		list(QUALITY_SAWING, 30, "time" = 60),
		list(QUALITY_HAMMERING, 30, "time" = 60),
		list(QUALITY_WELDING, 30, "time" = 60)
	)
*/