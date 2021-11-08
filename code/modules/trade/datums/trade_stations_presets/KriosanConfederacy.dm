/datum/trade_station/kriosanconfederacy
	name_pool = list("Kriosan 'Quill' Sporting" = "A common Federacy trade ship looking for the latest game to hunt. They're sending a message. \"Greeting. Please amuse yourself on our stock.\"")
	start_discovered = TRUE //WE KNOW WERE ARE OVERHOUNDS ARE
	spawn_always = TRUE //Were right next door
	offer_amout_devider_of_wanted_goods = 10 //less do to needing hunters
	assortiment = list(
		"Hunting Gear" = list(
			/obj/item/gun/projectile/boltgun/light,
			/obj/item/gun/projectile/boltgun/light_wood,
			/obj/item/gun/projectile/boltgun/sa,
			/obj/item/gun/projectile/automatic/survivalrifle
		),
		"Ammo" = list(
			/obj/item/ammo_magazine/ammobox/rifle_75_small,
			/obj/item/ammo_magazine/ammobox/light_rifle_257_small,
			/obj/item/ammo_magazine/rifle_10x24
		),
		"Pets" = list(
			/mob/living/simple_animal/corgi = custom_good_name("Noble Corgi"),
			/mob/living/simple_animal/corgi/puppy = custom_good_name("Young Corgi"),
			/mob/living/simple_animal/lizard = custom_good_name("Crate Pusher"), //Donst have a price, intented
			/mob/living/simple_animal/cat = custom_good_name("Rat Slayer")
		)
	)
	offer_types = list(
		/mob/living/simple_animal/hostile/helldiver,
		/mob/living/carbon/superior_animal/lodge/tatonka,
		/mob/living/carbon/superior_animal/lodge/tatonka/tangu,
		/mob/living/carbon/superior_animal/lodge/clucker,
		/mob/living/carbon/superior_animal/lodge/cerberus,
		/mob/living/carbon/superior_animal/lodge/cerberus/chimera,
		/obj/item/animal_part/tatonka_tongue,
		/obj/item/animal_part/tatonka_horn,
		/obj/item/animal_part/tangu_horn,
		/obj/item/animal_part/clucker_feather,
		/obj/item/animal_part/slepnir_hoof,
		/obj/item/animal_part/cerberus_snout,
		/obj/item/animal_part/helldiver_tooth,
		/obj/item/animal_part/chimera_fang,
		/obj/item/animal_part/render_claw,
		/obj/item/animal_part/tahca_antler,
		/obj/item/animal_part/wolf_tooth,
		/obj/item/gun/projectile/shotgun/pump/hunter_crossbow,
		/obj/item/gun/projectile/boltgun/baroque,
		/obj/item/tool/spear/hunter_halberd,
		/obj/item/tool/gauntlet,
		/obj/item/tool/fireaxe/woodsman,
		/obj/item/shield/buckler/handmade/bone,
		/obj/item/tool/sword/huntingclaw
	)

