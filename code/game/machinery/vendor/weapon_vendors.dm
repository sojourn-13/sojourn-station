/obj/machinery/vending/weapon_machine
	name = "Marshal Portable Armory"
	desc = "A self-defense equipment vending machine. When you need to be tacticool."
	product_slogans = "The best defense is good offense!;Buy for your whole family today!;Nobody can outsmart bullet!;Stupidity can be cured! By LEAD.;Remember, 'Stand your Ground' is applicable in a court of law!;Guns kill people, It's never your fault!;It's dangerous to go unarmed, take this!;Buy more ammo, you never know when you'll need it!" //Yes, It's a Zelda reference, fight me - Papalus
	product_ads = "Stunning!;Take justice in your own hands!;LEADership!;Guns don't kill people, YOU do!;His fault for being in sights!;Serve them a cold plate of justice!;Justice in lead form!;Smell the gunpowder!;Better now than never!"
	icon_state = "weapon"
	no_criminals = TRUE
	vendor_department = DEPARTMENT_SECURITY
	products = list(
	//Non-lethal
	/obj/item/device/flash = 2,
	/obj/item/weapon/reagent_containers/spray/pepper = 2,
	//Melee
	/obj/item/weapon/tool/knife/tacknife = 3,
	/obj/item/weapon/tool/fireaxe/militia_tomahawk = 3,
	//Firearms
	/obj/item/weapon/gun/projectile/automatic/slaught_o_matic = 5,
	/obj/item/weapon/gun/projectile/olivaw = 2,
	/obj/item/weapon/gun/projectile/giskard = 2,
	/obj/item/weapon/gun/projectile/colt = 2,
	/obj/item/weapon/gun/energy/gun/martin = 2,
	/obj/item/weapon/gun/projectile/glock = 2,
	/obj/item/weapon/gun/projectile/revolver/detective = 2,
	/obj/item/weapon/gun/projectile/clarissa = 2,
	/obj/item/weapon/gun/projectile/automatic/mac = 1,
	/obj/item/weapon/gun/projectile/shotgun/pump/gladstone = 1,
	/obj/item/weapon/gun/projectile/shotgun/pump = 1,
	/obj/item/weapon/gun/projectile/boltgun/lever = 1,
	/obj/item/weapon/gun/projectile/shotgun/pump/china = 1,
	//Ammo
	/obj/item/ammo_magazine/speed_loader_pistol_35/rubber = 3,
	/obj/item/ammo_magazine/speed_loader_pistol_35 = 3,
	/obj/item/ammo_magazine/pistol_35/rubber = 3,
	/obj/item/ammo_magazine/pistol_35 = 3,
	/obj/item/ammo_magazine/highcap_pistol_35/rubber = 3,
	/obj/item/ammo_magazine/highcap_pistol_35 = 3,
	/obj/item/ammo_magazine/speed_loader_magnum_40/rubber = 3,
	/obj/item/ammo_magazine/speed_loader_magnum_40 = 3,
	/obj/item/ammo_magazine/magnum_40/rubber = 3,
	/obj/item/ammo_magazine/magnum_40 = 3,
	/obj/item/ammo_magazine/smg_35/rubber = 3,
	/obj/item/ammo_magazine/smg_35 = 3,
	/obj/item/ammo_magazine/light_rifle_257/rubber = 3,
	/obj/item/ammo_magazine/light_rifle_257 = 3,
	/obj/item/ammo_magazine/speed_loader_rifle_75 = 3,
	/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 2,
	/obj/item/ammo_magazine/ammobox/pistol_35 =2,
	/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 2,
	/obj/item/ammo_magazine/ammobox/magnum_40 = 2,
	/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 2,
	/obj/item/ammo_magazine/ammobox/shotgun = 2,
	/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 2,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 2,
	/obj/item/ammo_casing/grenade = 5,
	//Misc
	/obj/item/clothing/accessory/holster/armpit = 2,
	/obj/item/clothing/accessory/holster/leg = 2,
	/obj/item/weapon/gun_upgrade/mechanism/weintraub = 2,
	/obj/item/weapon/storage/pouch/pistol_holster = 2,
	/obj/item/weapon/storage/pouch/ammo = 2,
	/obj/item/weapon/storage/briefcase/rifle = 5,
	/obj/item/weapon/storage/box/smokes = 3)

	prices = list(
	//Non-lethal
	/obj/item/device/flash = 200,
	/obj/item/weapon/reagent_containers/spray/pepper = 50,
	//Melee
	/obj/item/weapon/tool/knife/tacknife = 40,
	/obj/item/weapon/tool/fireaxe/militia_tomahawk = 75,
	//Firearms
	/obj/item/weapon/gun/projectile/automatic/slaught_o_matic = 100,
	/obj/item/weapon/gun/projectile/olivaw = 450,
	/obj/item/weapon/gun/projectile/giskard = 300,
	/obj/item/weapon/gun/projectile/colt = 450,
	/obj/item/weapon/gun/energy/gun/martin = 250,
	/obj/item/weapon/gun/projectile/glock = 800,
	/obj/item/weapon/gun/projectile/revolver/detective = 250,
	/obj/item/weapon/gun/projectile/clarissa = 250,
	/obj/item/weapon/gun/projectile/automatic/mac = 1000,
	/obj/item/weapon/gun/projectile/shotgun/pump/gladstone = 850,
	/obj/item/weapon/gun/projectile/shotgun/pump = 600,
	/obj/item/weapon/gun/projectile/boltgun/lever = 650,
	/obj/item/weapon/gun/projectile/shotgun/pump/china = 1750,
	//Ammo
	/obj/item/ammo_magazine/speed_loader_pistol_35/rubber = 25,
	/obj/item/ammo_magazine/speed_loader_pistol_35 = 50,
	/obj/item/ammo_magazine/pistol_35/rubber = 25,
	/obj/item/ammo_magazine/pistol_35 = 50,
	/obj/item/ammo_magazine/highcap_pistol_35/rubber = 40,
	/obj/item/ammo_magazine/highcap_pistol_35 = 80,
	/obj/item/ammo_magazine/speed_loader_magnum_40/rubber = 50,
	/obj/item/ammo_magazine/speed_loader_magnum_40 = 100,
	/obj/item/ammo_magazine/magnum_40/rubber = 75,
	/obj/item/ammo_magazine/magnum_40 = 150,
	/obj/item/ammo_magazine/smg_35/rubber = 100,
	/obj/item/ammo_magazine/smg_35 = 200,
	/obj/item/ammo_magazine/light_rifle_257/rubber = 125,
	/obj/item/ammo_magazine/light_rifle_257 = 250,
	/obj/item/ammo_magazine/speed_loader_rifle_75 = 300,
	/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 300,
	/obj/item/ammo_magazine/ammobox/pistol_35 =350,
	/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 400,
	/obj/item/ammo_magazine/ammobox/magnum_40 = 450,
	/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 300,
	/obj/item/ammo_magazine/ammobox/shotgun = 350,
	/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 400,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 750,
	/obj/item/ammo_casing/grenade = 50,
	//Misc
	/obj/item/clothing/accessory/holster/armpit = 50,
	/obj/item/clothing/accessory/holster/leg = 50,
	/obj/item/weapon/gun_upgrade/mechanism/weintraub = 200,
	/obj/item/weapon/storage/pouch/pistol_holster = 50,
	/obj/item/weapon/storage/pouch/ammo = 75,
	/obj/item/weapon/storage/briefcase/rifle = 50,
	/obj/item/weapon/storage/box/smokes = 100)

/obj/machinery/vending/security
	name = "SecTech"
	desc = "A security equipment vendor."
	product_slogans = "Criminals don't commit crimes when they're already in prison!;Proper escalation? Who has time for that!;Criminal activity damns the criminal to hell. It's your job to send them there.;Remember, they were already beaten up when you got there.;Fuck the Non-Aggression Principle!"
	product_ads = "Crack some skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?;Brutalize them!;Tag and bag!;Be quick, be robust."
	icon_state = "sec"
	icon_deny = "sec-deny"
	req_access = list(access_security)
	products = list(/obj/item/weapon/handcuffs = 8,
					/obj/item/weapon/handcuffs/zipties = 8,
					/obj/item/weapon/grenade/flashbang = 8,
					/obj/item/weapon/grenade/chem_grenade/teargas = 8,
					/obj/item/weapon/grenade/frag/stinger = 8,
					/obj/item/weapon/grenade/smokebomb = 8,
					/obj/item/device/flash = 8,
					/obj/item/weapon/reagent_containers/spray/pepper = 8,
					/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber = 8,
					/obj/item/ammo_magazine/pistol_35/rubber = 8,
					/obj/item/ammo_magazine/highcap_pistol_35/rubber = 8,
					/obj/item/ammo_magazine/smg_35/rubber = 8,
					/obj/item/ammo_magazine/light_rifle_257_short/rubber = 8,
					/obj/item/ammo_magazine/rifle_75/rubber = 8,
					/obj/item/ammo_magazine/heavy_rifle_408/rubber = 8,
					/obj/item/ammo_magazine/magnum_40/rubber = 8,
					/obj/item/ammo_magazine/speed_loader_magnum_40/rubber = 6,
					/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 2,
					/obj/item/device/hailer = 8,
					/obj/item/taperoll/police = 8,
					/obj/item/weapon/storage/box/evidence = 2,
					/obj/item/weapon/tool/fireaxe/militia_tomahawk = 4,
					/obj/item/weapon/tool/knife/tacknife = 4)

	contraband = list(/obj/item/weapon/reagent_containers/food/snacks/donut/normal = 12)
	auto_price = FALSE

/obj/machinery/vending/theomat
	name = "Church of Absolute Theo-Mat"
	desc = "A church dispensary for disciples and new converts."
	product_slogans = "Find peace through faith.;Help humanity ascend, join your brethren today!;Come and seek a new life!;Safety in brotherhood!"
	product_ads = "Praise!;Pray!;Only for the faithful!;Ascend!;Seek a new life!;Better living through technology!"
	icon_state = "teomat"
	vendor_department = DEPARTMENT_CHURCH
	products = list(/obj/item/weapon/book/ritual/cruciform = 10,
					/obj/item/weapon/storage/fancy/candle_box = 10,
					/obj/item/weapon/storage/fancy/cigarettes/faith = 10,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/ntcahors = 20,
					/obj/item/weapon/tool_upgrade/augment/sanctifier = 5,
					/obj/item/weapon/soap/church = 5,
					/obj/item/weapon/storage/wallet = 5,
					/obj/item/weapon/storage/belt/utility/neotheology = 5,
					/obj/item/weapon/storage/backpack/sport/neotheology = 5,
					/obj/item/clothing/suit/storage/neotheosports = 5,
					/obj/item/clothing/under/rank/church/sport = 5,
					/obj/item/clothing/under/rank/church = 5,
					/obj/item/stack/medical/bruise_pack = 8,
					/obj/item/stack/medical/ointment = 8,
					/obj/item/stack/medical/splint = 5,
					/obj/item/stack/medical/advanced/bruise_pack = 4,
					/obj/item/stack/medical/advanced/ointment = 4,
					/obj/item/weapon/storage/pouch/small_generic = 2,
					/obj/item/weapon/storage/pouch/medium_generic = 2,
					/obj/item/weapon/storage/pouch/medical_supply = 2,
					/obj/item/weapon/grenade/chem_grenade/antiweed/nt_antiweed = 5,
					/obj/item/weapon/grenade/chem_grenade/cleaner/nt_cleaner = 5,
					/obj/item/weapon/tool/knife/dagger/nt = 3,
					/obj/item/weapon/tool/sword/nt = 3,
					/obj/item/weapon/gun/energy/ntpistol = 3,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_old_guns = 2,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_new_guns = 2,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_basic_arms/public = 2,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter_public = 3)
	contraband = list(/obj/item/weapon/tool/knife/neotritual = 3,
					/obj/item/weapon/gun/matter/launcher/nt_sprayer = 3)

	prices = list(/obj/item/weapon/book/ritual/cruciform = 5,
					/obj/item/weapon/storage/fancy/candle_box = 30,
					/obj/item/weapon/storage/fancy/cigarettes/faith = 65, //Some healing chems
					/obj/item/weapon/reagent_containers/food/drinks/bottle/ntcahors = 100,
					/obj/item/weapon/tool_upgrade/augment/sanctifier = 80,
					/obj/item/weapon/soap/church = 50,
					/obj/item/weapon/storage/wallet = 15,
					/obj/item/weapon/storage/belt/utility/neotheology = 20,
					/obj/item/weapon/storage/backpack/sport/neotheology = 20,
					/obj/item/clothing/suit/storage/neotheosports = 40,
					/obj/item/clothing/under/rank/church/sport = 15,
					/obj/item/clothing/under/rank/church = 15,
					/obj/item/stack/medical/bruise_pack = 50,
					/obj/item/stack/medical/ointment = 35,
					/obj/item/stack/medical/splint = 20,
					/obj/item/stack/medical/advanced/bruise_pack/nt = 100,
					/obj/item/stack/medical/advanced/ointment/nt = 100,
					/obj/item/weapon/storage/pouch/small_generic = 400,
					/obj/item/weapon/storage/pouch/medium_generic = 500,
					/obj/item/weapon/storage/pouch/medical_supply = 200,
					/obj/item/weapon/grenade/chem_grenade/antiweed/nt_antiweed = 25,
					/obj/item/weapon/grenade/chem_grenade/cleaner/nt_cleaner = 50,
					/obj/item/weapon/tool/knife/dagger/nt = 50,
					/obj/item/weapon/tool/sword/nt = 100,
					/obj/item/weapon/gun/energy/ntpistol = 120,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_old_guns = 1500,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_new_guns = 1000,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_basic_arms/public = 100,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter_public = 100,
					/obj/item/weapon/tool/knife/neotritual = 250,
					/obj/item/weapon/gun/matter/launcher/nt_sprayer = 500)

/obj/machinery/vending/serbomat
	name = "From Serbia with love"
	desc = "How did this end up here?"
	icon_state = "serbomat"
	product_ads = "For Tsar and Country.;Have you fulfilled your nutrition quota today?;Very nice!;We are simple people, for this is all we eat.;If there is a person, there is a problem. If there is no person, then there is no problem."
	products = list(
					/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka = 30, // ghetto antihacking, have fun
					/obj/item/weapon/storage/deferred/crate/uniform_green = 4,
					/obj/item/weapon/storage/deferred/crate/uniform_brown = 4,
					/obj/item/weapon/storage/deferred/crate/uniform_black = 4,
					/obj/item/weapon/storage/deferred/crate/uniform_flak = 2,
					/obj/item/weapon/storage/deferred/crate/uniform_light = 2,
					/obj/item/weapon/gun/projectile/boltgun/sa = 8,
					/obj/item/ammo_magazine/ammobox/light_rifle_257 = 30,
					)
	prices = list(
					/obj/item/weapon/reagent_containers/food/drinks/bottle/vodka = 50,
					/obj/item/weapon/storage/deferred/crate/uniform_green = 2000,
					/obj/item/weapon/storage/deferred/crate/uniform_brown = 2000,
					/obj/item/weapon/storage/deferred/crate/uniform_black = 2000,
					/obj/item/weapon/storage/deferred/crate/uniform_flak = 2200,
					/obj/item/weapon/storage/deferred/crate/uniform_light = 1800,
					/obj/item/weapon/gun/projectile/boltgun/sa = 1000,
					/obj/item/ammo_magazine/ammobox/heavy_rifle_408 = 300,
					)
	idle_power_usage = 211
	auto_price = FALSE
	vendor_department = DEPARTMENT_CIVILIAN
