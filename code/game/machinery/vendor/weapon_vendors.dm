
/obj/machinery/vending/weapon_machine
	name = "Marshal Portable Armory"
	desc = "A self-defense equipment vending machine. When you need to be tacticool."
	product_slogans = "The best defense is good offense!;Buy for your whole family today!;Nobody can outsmart bullet!;Stupidity can be cured! By LEAD.;Dead kids can't bully your children!;Guns kill people, It's never your fault!;It's dangerous to go unarmed, take this!;Buy more ammo, you never know when you'll need it!" //Yes, It's a Zelda reference, fight me - Papalus
	product_ads = "Stunning!;Take justice in your own hands!;LEADership!;It's not your fault!;His fault for being in sights!;Serve them a cold plate of justice!;Justice in lead form!;Smell the gunpowder!;Better now than never!"
	icon_state = "weapon"
	no_criminals = TRUE
	products = list(/obj/item/device/flash = 2,
	/obj/item/weapon/reagent_containers/spray/pepper = 2,
	/obj/item/weapon/gun/projectile/automatic/slaught_o_matic = 30,
	/obj/item/weapon/gun/projectile/olivaw = 2,
	/obj/item/weapon/gun/projectile/giskard = 2,
	/obj/item/weapon/gun/projectile/colt = 2,
	/obj/item/weapon/gun/energy/gun/martin = 2,
	/obj/item/weapon/gun/projectile/revolver/detective = 2,
	/obj/item/weapon/gun/projectile/clarissa = 2, // SoJ edit
	/obj/item/ammo_magazine/speed_loader_pistol_35/rubber = 3,
	/obj/item/ammo_magazine/highcap_pistol_35/rubber = 3,
	/obj/item/ammo_magazine/smg_35/rubber = 3,
	/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 3,
	/obj/item/ammo_magazine/highcap_pistol_35/practice = 3,
	/obj/item/ammo_magazine/ammobox/pistol_35/practice = 5,
	/obj/item/ammo_magazine/speed_loader_magnum_40/rubber = 3,
	/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 3,
	/obj/item/ammo_magazine/speed_loader_magnum_40/practice = 3,
	/obj/item/ammo_magazine/ammobox/magnum_40/practice = 2,
	/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 2,
	/obj/item/ammo_magazine/light_rifle_257/rubber = 3,
	/obj/item/clothing/accessory/holster/armpit = 2,
	/obj/item/clothing/accessory/holster/leg = 2,
	/obj/item/weapon/gun_upgrade/mechanism/weintraub = 2,
	/obj/item/weapon/storage/pouch/pistol_holster = 2,
	/obj/item/weapon/storage/pouch/ammo = 2,
	/obj/item/weapon/storage/briefcase/rifle = 5) //SoJ Edit, adds in 5 rifle cases

	contraband = list(/obj/item/weapon/gun/projectile/automatic/mac = 1,
	/obj/item/weapon/gun/projectile/shotgun/pump/gladstone = 1,
	/obj/item/weapon/gun/projectile/shotgun/pump = 1,
	/obj/item/weapon/gun/projectile/boltgun/lever = 2,
	/obj/item/weapon/gun/projectile/shotgun/pump/china = 2,
	/obj/item/ammo_casing/grenade/frag = 3,
	/obj/item/ammo_casing/grenade/blast = 4,
	/obj/item/ammo_casing/grenade = 2,
	/obj/item/ammo_magazine/highcap_pistol_35 = 5,
	/obj/item/ammo_magazine/highcap_pistol_35 = 5,
	/obj/item/ammo_magazine/speed_loader_pistol_35 = 5,
	/obj/item/ammo_magazine/smg_35 = 5,
	/obj/item/ammo_magazine/speed_loader_magnum_40 = 5,
	/obj/item/ammo_magazine/light_rifle_257 = 3,
	/obj/item/ammo_magazine/speed_loader_rifle_75 = 4,
	/obj/item/ammo_magazine/ammobox/pistol_35 =3,
	/obj/item/ammo_magazine/ammobox/magnum_40 = 3,
	/obj/item/ammo_magazine/ammobox/shotgun = 2,
	/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 2,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 2,
	/obj/item/weapon/tool/knife/tacknife = 3)

	prices = list(/obj/item/device/flash = 200,
	/obj/item/weapon/reagent_containers/spray/pepper = 100,
	/obj/item/weapon/gun/projectile/automatic/slaught_o_matic = 50,
	/obj/item/weapon/gun/projectile/olivaw = 600,
	/obj/item/weapon/gun/projectile/giskard = 500,
	/obj/item/weapon/gun/projectile/colt = 900,
	/obj/item/weapon/gun/energy/gun/martin = 500,
	/obj/item/weapon/gun/projectile/revolver/detective = 400,
	/obj/item/weapon/gun/projectile/clarissa = 450, //Weakest gun in the game - SoJ Edit
	/obj/item/weapon/gun/projectile/shotgun/pump/gladstone = 1500,
	/obj/item/weapon/gun/projectile/shotgun/pump = 1300,
	/obj/item/weapon/gun/projectile/automatic/mac = 2000,
	/obj/item/weapon/gun/projectile/boltgun/lever = 1800,
	/obj/item/ammo_magazine/speed_loader_pistol_35/rubber = 60,
	/obj/item/ammo_magazine/highcap_pistol_35/rubber = 160,
	/obj/item/ammo_magazine/smg_35/rubber = 320,
	/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 280,
	/obj/item/ammo_magazine/speed_loader_pistol_35/practice = 30,
	/obj/item/ammo_magazine/highcap_pistol_35/practice = 80,
	/obj/item/ammo_magazine/ammobox/pistol_35/practice = 140,
	/obj/item/ammo_magazine/speed_loader_magnum_40/rubber = 100,
	/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 550,
	/obj/item/ammo_magazine/speed_loader_magnum_40/practice = 50,
	/obj/item/ammo_magazine/ammobox/magnum_40/practice = 225,
	/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 800,
	/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber = 350,
	/obj/item/ammo_magazine/light_rifle_257/rubber = 150,
	/obj/item/ammo_magazine/ammobox/shotgun/flashshells = 400,
	/obj/item/ammo_magazine/ammobox/shotgun/blanks = 50,
	/obj/item/clothing/accessory/holster = 150,
	/obj/item/weapon/storage/pouch/pistol_holster =150,
	/obj/item/weapon/gun_upgrade/mechanism/weintraub = 1000,
	/obj/item/weapon/storage/pouch/ammo = 100,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 600,
	/obj/item/ammo_magazine/speed_loader_pistol_35 = 80,
	/obj/item/ammo_magazine/highcap_pistol_35 = 120,
	/obj/item/ammo_magazine/highcap_pistol_35 = 180,
	/obj/item/ammo_magazine/smg_35 = 360,
	/obj/item/ammo_magazine/ammobox/pistol_35 = 300,
	/obj/item/ammo_magazine/speed_loader_magnum_40 = 130,
	/obj/item/ammo_magazine/ammobox/magnum_40 = 500,
	/obj/item/ammo_magazine/ammobox/shotgun = 800,
	/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 800,
	/obj/item/ammo_magazine/ammobox/light_rifle_257 = 350,
	/obj/item/ammo_magazine/speed_loader_rifle_75 = 500,
	/obj/item/ammo_magazine/light_rifle_257 = 350,
	/obj/item/weapon/storage/briefcase/rifle = 150, //SoJ change makes rifle cases 150 credits
	/obj/item/weapon/tool/knife/tacknife = 200)

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
					/obj/item/device/flash = 8,
					/obj/item/weapon/reagent_containers/spray/pepper = 8,
					/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber = 8,
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
					/obj/item/weapon/storage/box/evidence = 2)

	contraband = list(/obj/item/weapon/tool/knife/tacknife = 4,
						/obj/item/weapon/reagent_containers/food/snacks/donut/normal = 12)
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
					/obj/item/weapon/reagent_containers/food/drinks/bottle/ntcahors = 20,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_old_guns = 2,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_new_guns = 2,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_basic_arms/public = 2,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter_public = 3,
					/obj/item/weapon/soap/church = 5,
					/obj/item/weapon/storage/wallet = 5,
					/obj/item/weapon/storage/backpack/satchel = 5,
					/obj/item/clothing/suit/storage/toggle/leather/blackjacket = 5,
					/obj/item/stack/medical/bruise_pack = 8,
					/obj/item/stack/medical/ointment = 8,
					/obj/item/stack/medical/splint = 5,
					/obj/item/stack/medical/advanced/bruise_pack = 4,
					/obj/item/stack/medical/advanced/ointment = 4,
					/obj/item/weapon/storage/pouch/small_generic = 2,
					/obj/item/weapon/storage/pouch/medium_generic = 2,
					/obj/item/weapon/storage/pouch/medical_supply = 2)
	contraband = list(/obj/item/weapon/tool/knife/neotritual = 3,
					/obj/item/weapon/gun/matter/launcher/nt_sprayer = 3)

	prices = list(/obj/item/weapon/book/ritual/cruciform = 500,
					/obj/item/weapon/storage/fancy/candle_box = 200,
					/obj/item/weapon/reagent_containers/food/drinks/bottle/ntcahors = 250,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_old_guns = 8000,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_new_guns = 7000,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_basic_arms/public = 1000,
					/obj/item/weapon/computer_hardware/hard_drive/portable/design/nt_bioprinter_public = 1000,
					/obj/item/weapon/soap = 200,
					/obj/item/weapon/storage/wallet = 150,
					/obj/item/weapon/storage/backpack/satchel = 300,
					/obj/item/clothing/suit/storage/toggle/leather/blackjacket = 300,
					/obj/item/stack/medical/bruise_pack = 100,
					/obj/item/stack/medical/ointment = 100,
					/obj/item/stack/medical/splint = 200,
					/obj/item/stack/medical/advanced/bruise_pack = 400,
					/obj/item/stack/medical/advanced/ointment = 400,
					/obj/item/weapon/storage/pouch/small_generic = 800,
					/obj/item/weapon/storage/pouch/medium_generic = 1000,
					/obj/item/weapon/storage/pouch/medical_supply = 600,
					/obj/item/weapon/tool/knife/neotritual = 1000,
					/obj/item/weapon/gun/matter/launcher/nt_sprayer = 1500)

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
					/obj/item/ammo_magazine/ammobox/heavy_rifle_408 = 30,
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
