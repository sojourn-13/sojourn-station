/datum/trade_station/kriosanconfederacy
	name_pool = list(
		"Kriosan 'Quill' Sporting" = "A common Federacy trade ship looking for the latest game to hunt. They're sending a message. \"Greetings. Please amuse yourself with our stock.\""
	)
	icon_states = list("htu_destroyer", "ship")
	uid = "kriosanconfederacy"
	tree_x = 0.54
	tree_y = 0.7
	stations_recommended = list("mcronalds")
	offer_limit = 20
	base_income = 1600
	wealth = 0
	markup = COMMON_GOODS
	hidden_inv_threshold = 3000
	start_discovered = TRUE //WE KNOW WERE ARE OVERHOUNDS ARE
	spawn_always = TRUE //Were right next door
	inventory = list(
		"Hunting Gear" = list(
			/obj/item/gun/projectile/boltgun/light,
			/obj/item/gun/projectile/boltgun/sa,
			/obj/item/gun/projectile/automatic/nordwind/strelki,
			/obj/item/gun/projectile/automatic/survivalrifle,
			/obj/item/gun/projectile/shotgun/doublebarrel,
			/obj/item/gun/projectile/shotgun/pump,
			/obj/item/tool/knife/dagger
		),
		"Ammo" = list(
			/obj/item/ammo_magazine/ammobox/rifle_75_small,
			/obj/item/ammo_magazine/ammobox/light_rifle_257_small,
			/obj/item/ammo_magazine/smg_10x24,
			/obj/item/ammo_magazine/ammobox/shotgun/buckshot,
			/obj/item/ammo_magazine/ammobox/shotgun
		),
		"Pets" = list(
			/mob/living/simple/corgi = good_data("Noble Corgi", list(1, 2), 500),
			/mob/living/simple/corgi/puppy = good_data("Young Corgi", list(1, 2), 250),
			/mob/living/simple/lizard = good_data("Crate Pusher", list(1, 2), 100),
			/mob/living/simple/cat = good_data("Rat Slayer", list(1, 2), 150)
		),
		"Assault Armor" = list(
			/obj/item/clothing/suit/space/void/assault = good_data("Assault Armor", list(3, 5), 20000)
		)
	)
	hidden_inventory = list(
		"Basic Gun Mods" = list(
			/obj/item/gun_upgrade/barrel/forged,
			/obj/item/tool_upgrade/productivity/ergonomic_grip,
			/obj/item/tool_upgrade/refinement/laserguide,
			/obj/item/gun_upgrade/underbarrel/bipod
		),
		"Big Game Hunting Gear" = list(
			/obj/item/gun/projectile/boltgun/scout = custom_good_amount_range(list(-3, 1)),
			/obj/item/tool/sword/saber = custom_good_amount_range(list(-1, 3)),
			/obj/item/tool/sword/machete,
			/obj/item/tool/spear //Useless other than to hand craft and sell it back to them
		)
	)
	offer_types = list(
		/mob/living/simple/hostile/helldiver = offer_data("helldiver", 1500, 2),
		/mob/living/carbon/superior/lodge/tatonka = offer_data("tatonka", 1000, 2),
		/mob/living/carbon/superior/lodge/tatonka/tangu = offer_data("tangu", 1500, 1),
		/mob/living/carbon/superior/lodge/clucker = offer_data("clucker", 500, 3),
		/mob/living/carbon/superior/lodge/cerberus = offer_data("cerberus", 1200, 1),
		/mob/living/carbon/superior/lodge/cerberus/chimera = offer_data("chimera", 3000, 1),
		/obj/item/animal_part/tatonka_tongue = offer_data("tatonka tongue", 120, 10),
		/obj/item/animal_part/tatonka_horn = offer_data("tatonka horn", 100, 10),
		/obj/item/animal_part/tangu_horn = offer_data("tangu horn", 200, 10),
		/obj/item/animal_part/clucker_feather = offer_data("clucker feather", 150, 10),
		/obj/item/animal_part/slepnir_hoof = offer_data("slepnir hoof", 350, 10),
		/obj/item/animal_part/cerberus_snout = offer_data("cerberus snout", 450, 10),
		/obj/item/animal_part/helldiver_tooth = offer_data("hell diver tooth", 1450, 10),
		/obj/item/animal_part/chimera_fang = offer_data("chimera fang", 3550, 10),
		/obj/item/animal_part/render_claw = offer_data("render claw", 1750, 10),
		/obj/item/animal_part/tahca_antler = offer_data("tahca antler", 1250, 10),
		/obj/item/animal_part/wolf_tooth = offer_data("pristine animal fang", 400, 10),
		/obj/item/gun/projectile/shotgun/pump/hunter_crossbow = offer_data("hunter crossbow", 2500, 3),
		/obj/item/gun/projectile/boltgun/baroque = offer_data("hunter baroque", 4500, 1),
		/obj/item/tool/spear/hunter_halberd = offer_data("hunter halberd", 1300, 2),
		/obj/item/tool/gauntlet = offer_data("render gauntlet", 2800, 2),
		/obj/item/tool/fireaxe/woodsman = offer_data("woodsman axe", 900, 3),
		/obj/item/shield/buckler/handmade/bone = offer_data("hunter bone shield", 1600, 1),
		/obj/item/tool/sword/huntingclaw = offer_data("hunting claw", 1500, 2)
	)

