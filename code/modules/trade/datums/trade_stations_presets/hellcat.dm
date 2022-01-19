/datum/trade_station/fbv_hellcat
	name_pool = list(
		"FBV 'Hellcat'" = "\"Greetings. This is the Hellcat. We're currently escorting the Caduceus and we will be departing the system shortly alongside them. We are willing to part with our spare supplies while we're here.\""
	)
	icon_states = "ship"
	start_discovered = TRUE
	markup = COMMON_GOODS * 1.5
	offer_limit = 20
	base_income = 1600
	wealth = 0
	secret_inv_threshold = 32000
	forced_overmap_zone = list(
		list(15, 20),
		list(20, 25)
	)
	assortiment = list(
		"Enforcer Equipment" = list(
			/obj/item/handcuffs,
			/obj/item/shield/riot,
			/obj/item/tool/baton,
			/obj/machinery/deployable/barrier
		),
		"Energy weapons" = list(
			/obj/item/gun/energy/gun/martin,
			/obj/item/gun/energy/laser,
			/obj/item/gun/energy/tesla_shotgun,
			/obj/item/gun/energy/tesla_shotgun/manual,
			/obj/item/gun/energy/tesla_shotgun/high_damage,

		),
		"Projectile weapons" = list(
			/obj/item/gun/projectile/glock,
			/obj/item/gun/projectile/clarissa,
			/obj/item/gun/projectile/olivaw,
			/obj/item/gun/projectile/revolver/detective,
			/obj/item/gun/projectile/automatic/ak47/sa,
			/obj/item/gun/projectile/automatic/mac
		),
		"Ammunition" = list(
			/obj/item/grenade/empgrenade/low_yield,
			/obj/item/grenade/smokebomb,
			/obj/item/grenade/chem_grenade/incendiary,
			/obj/item/grenade/flashbang,

			/obj/item/ammo_magazine/ammobox/heavy_rifle_408,
			/obj/item/ammo_magazine/ammobox/rifle_75,
			/obj/item/ammo_magazine/ammobox/light_rifle_257,
			/obj/item/ammo_magazine/ammobox/shotgun,
			/obj/item/ammo_magazine/ammobox/kurtz_50,
			/obj/item/ammo_magazine/ammobox/magnum_40,
			/obj/item/ammo_magazine/ammobox/pistol_35
		),
		"Armor" = list(
			/obj/item/clothing/head/helmet/faceshield/riot,
			/obj/item/clothing/suit/armor/vest,
			/obj/item/clothing/suit/armor/vest/security,
			/obj/item/clothing/suit/armor/vest/detective,
			/obj/item/clothing/suit/storage/vest,
			/obj/item/clothing/head/armor/helmet/tanker,
			/obj/item/clothing/head/armor/helmet/tanker/green,
			/obj/item/clothing/head/armor/helmet/tanker/brown,
			/obj/item/clothing/head/armor/helmet/tanker/gray,
			/obj/item/clothing/suit/armor/bulletproof,
			/obj/item/clothing/suit/armor/laserproof
		),
	)
	secret_inventory = list(
		"Basic Gun Mods" = list(
			/obj/item/gun_upgrade/barrel/gauss,
			/obj/item/tool_upgrade/productivity/ergonomic_grip,
			/obj/item/tool_upgrade/refinement/laserguide,
		)
	)
	offer_types = list(
		/obj/item/gun/energy/laser/railgun/pistol = offer_data("\"Myrmidon\" rail pistol", 1500, 2),
		/obj/item/gun/energy/laser/railgun = offer_data("\"Reductor\" rail rifle", 3500, 1),
		/obj/item/tool/shovel/combat = offer_data("combat crovel", 500, 13),
		/obj/item/tool_upgrade/armor/melee = offer_data("melee armor plate", 500, 5),
		/obj/item/tool_upgrade/armor/bullet = offer_data("ballistic armor plate", 1200, 3),
		/obj/item/tool_upgrade/armor/bomb = offer_data("bomb proofing armor plate", 800, 3),
		/obj/item/tool_upgrade/armor/energy = offer_data("energy armor plate", 2000, 2),
		/obj/item/tool/baton/arcwelder = offer_data("arc welder", 1500, 2),
	)