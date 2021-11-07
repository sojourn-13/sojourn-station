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
	/obj/item/tool/baton/mini = 10,
	/obj/item/reagent_containers/spray/pepper = 2,
	//Melee
	/obj/item/tool/knife/tacknife = 3,
	/obj/item/tool/fireaxe/militia_tomahawk = 3,
	//Firearms, ordered by price and category.
	//Pistol
	/obj/item/gun/projectile/automatic/slaught_o_matic = 5,
	/obj/item/gun/energy/gun/martin = 2,
	/obj/item/gun/projectile/clarissa = 2,
	/obj/item/gun/projectile/giskard = 2,
	/obj/item/gun/projectile/olivaw = 2,
	/obj/item/gun/projectile/colt = 2,
	/obj/item/gun/projectile/glock = 2,
	/obj/item/gun/projectile/boltgun/flare_gun = 5,
	//Revolver
	/obj/item/gun/projectile/revolver/detective = 2,
	/obj/item/gun/projectile/revolver/lemant = 2,
	/obj/item/gun/projectile/revolver/sixshot = 2,
	/obj/item/gun/projectile/revolver/rev10 = 2,
	/obj/item/gun/projectile/revolver/mistral = 2,
	//Automatic
	/obj/item/gun/projectile/automatic/basstet = 2,
	/obj/item/gun/projectile/automatic/greasegun = 2,
	/obj/item/gun/projectile/automatic/mac = 2,
	/obj/item/gun/projectile/automatic/wirbelwind = 2,
	/obj/item/gun/projectile/automatic/bulldog = 2,
	//Shotgun
	/obj/item/gun/projectile/shotgun/pump = 2,
	/obj/item/gun/projectile/boltgun/lever = 2,
	/obj/item/gun/projectile/shotgun/pump/gladstone = 2,
	/obj/item/gun/projectile/shotgun/pump/china = 2,
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
	/obj/item/ammo_casing/flare/prespawn = 15,
	/obj/item/ammo_casing/flare/blue/prespawn = 15,
	/obj/item/ammo_casing/flare/green/prespawn = 15,
	//Misc
	/obj/item/clothing/accessory/holster/armpit = 2,
	/obj/item/clothing/accessory/holster/leg = 2,
	/obj/item/gun_upgrade/mechanism/weintraub = 2,
	/obj/item/storage/pouch/pistol_holster = 2,
	/obj/item/storage/pouch/ammo = 2,
	/obj/item/storage/briefcase/rifle = 5,
	/obj/item/storage/box/smokes = 3)

	prices = list(
	//Non-lethal
	/obj/item/device/flash = 200,
	/obj/item/tool/baton/mini = 140,
	/obj/item/reagent_containers/spray/pepper = 50,
	//Melee
	/obj/item/tool/knife/tacknife = 40,
	/obj/item/tool/fireaxe/militia_tomahawk = 75,
	//Firearms, ordered by price and category.
	//Pistol
	/obj/item/gun/projectile/automatic/slaught_o_matic = 100,
	/obj/item/gun/energy/gun/martin = 250,
	/obj/item/gun/projectile/clarissa = 250,
	/obj/item/gun/projectile/giskard = 300,
	/obj/item/gun/projectile/olivaw = 450,
	/obj/item/gun/projectile/colt = 450,
	/obj/item/gun/projectile/glock = 800,
	/obj/item/gun/projectile/boltgun/flare_gun = 500,
	//Revolver
	/obj/item/gun/projectile/revolver/detective = 250,
	/obj/item/gun/projectile/revolver/lemant = 450,
	/obj/item/gun/projectile/revolver/sixshot = 500,
	/obj/item/gun/projectile/revolver/rev10 = 800,
	/obj/item/gun/projectile/revolver/mistral = 900,
	//Automatic
	/obj/item/gun/projectile/automatic/basstet = 850,
	/obj/item/gun/projectile/automatic/greasegun = 950,
	/obj/item/gun/projectile/automatic/mac = 1000,
	/obj/item/gun/projectile/automatic/wirbelwind = 1500,
	/obj/item/gun/projectile/automatic/bulldog = 1650,
	//Shotgun
	/obj/item/gun/projectile/shotgun/pump = 600,
	/obj/item/gun/projectile/boltgun/lever = 650,
	/obj/item/gun/projectile/shotgun/pump/gladstone = 850,
	/obj/item/gun/projectile/shotgun/pump/china = 1750,
	//Ammo
	/obj/item/ammo_magazine/speed_loader_pistol_35/rubber = 20,
	/obj/item/ammo_magazine/speed_loader_pistol_35 = 40,
	/obj/item/ammo_magazine/pistol_35/rubber = 25,
	/obj/item/ammo_magazine/pistol_35 = 50,
	/obj/item/ammo_magazine/highcap_pistol_35/rubber = 40,
	/obj/item/ammo_magazine/highcap_pistol_35 = 80,
	/obj/item/ammo_magazine/speed_loader_magnum_40/rubber = 40,
	/obj/item/ammo_magazine/speed_loader_magnum_40 = 80,
	/obj/item/ammo_magazine/magnum_40/rubber = 75,
	/obj/item/ammo_magazine/magnum_40 = 150,
	/obj/item/ammo_magazine/smg_35/rubber = 100,
	/obj/item/ammo_magazine/smg_35 = 200,
	/obj/item/ammo_magazine/light_rifle_257/rubber = 125,
	/obj/item/ammo_magazine/light_rifle_257 = 250,
	/obj/item/ammo_magazine/speed_loader_rifle_75 = 250,
	/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 300,
	/obj/item/ammo_magazine/ammobox/pistol_35 =350,
	/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 400,
	/obj/item/ammo_magazine/ammobox/magnum_40 = 450,
	/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 300,
	/obj/item/ammo_magazine/ammobox/shotgun = 350,
	/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 400,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 750,
	/obj/item/ammo_casing/grenade = 50,
	/obj/item/ammo_casing/flare/prespawn = 120,
	/obj/item/ammo_casing/flare/blue/prespawn = 120,
	/obj/item/ammo_casing/flare/green/prespawn = 120,
	//Misc
	/obj/item/clothing/accessory/holster/armpit = 50,
	/obj/item/clothing/accessory/holster/leg = 50,
	/obj/item/gun_upgrade/mechanism/weintraub = 200,
	/obj/item/storage/pouch/pistol_holster = 50,
	/obj/item/storage/pouch/ammo = 75,
	/obj/item/storage/briefcase/rifle = 50,
	/obj/item/storage/box/smokes = 100)

/obj/machinery/vending/security
	name = "SecTech"
	desc = "A security equipment vendor."
	product_slogans = "Criminals don't commit crimes when they're already in prison!;Proper escalation? Who has time for that!;Criminal activity damns the criminal to hell. It's your job to send them there.;Remember, they were already beaten up when you got there.;Fuck the Non-Aggression Principle!"
	product_ads = "Crack some skulls!;Beat some heads in!;Don't forget - harm is good!;Your weapons are right here.;Handcuffs!;Freeze, scumbag!;Don't tase me bro!;Tase them, bro.;Why not have a donut?;Brutalize them!;Tag and bag!;Be quick, be robust."
	icon_state = "sec"
	icon_deny = "sec-deny"
	req_access = list(access_security)
	products = list(/obj/item/handcuffs = 8,
					/obj/item/handcuffs/zipties = 8,
					/obj/item/grenade/flashbang = 8,
					/obj/item/grenade/chem_grenade/teargas = 8,
					/obj/item/grenade/frag/stinger = 8,
					/obj/item/grenade/smokebomb = 8,
					/obj/item/device/flash = 8,
					/obj/item/gun/projectile/boltgun/flare_gun = 2,
					/obj/item/reagent_containers/spray/pepper = 8,
					/obj/item/ammo_magazine/ammobox/light_rifle_257/rubber = 8,
					/obj/item/ammo_magazine/pistol_35/rubber = 8,
					/obj/item/ammo_magazine/highcap_pistol_35/rubber = 8,
					/obj/item/ammo_magazine/smg_35/rubber = 8,
					/obj/item/ammo_magazine/light_rifle_257_short/rubber = 8,
					/obj/item/ammo_magazine/rifle_75/rubber = 8,
					/obj/item/ammo_magazine/heavy_rifle_408/rubber = 8,
					/obj/item/ammo_magazine/magnum_40/rubber = 8,
					/obj/item/ammo_magazine/speed_loader_magnum_40/rubber = 6,
					/obj/item/ammo_magazine/kurtz_50/rubber = 6,
					/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber = 6,
					/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 2,
					/obj/item/ammo_casing/flare/prespawn = 5,
					/obj/item/ammo_casing/flare/blue/prespawn = 5,
					/obj/item/ammo_casing/flare/green/prespawn = 5,
					/obj/item/device/hailer = 8,
					/obj/item/taperoll/police = 8,
					/obj/item/storage/box/evidence = 2,
					/obj/item/tool/fireaxe/militia_tomahawk = 4,
					/obj/item/tool/knife/tacknife = 4,
					/obj/item/tool/baton/mini = 6)

	contraband = list(/obj/item/reagent_containers/food/snacks/donut/normal = 12)
	auto_price = FALSE

/obj/machinery/vending/theomat
	name = "Church of Absolute Theo-Mat"
	desc = "A church dispensary for disciples and new converts."
	product_slogans = "Find peace through faith.;Help humanity ascend, join your brethren today!;Come and seek a new life!;Safety in brotherhood!"
	product_ads = "Praise!;Pray!;Only for the faithful!;Ascend!;Seek a new life!;Better living through technology!"
	icon_state = "teomat"
	vendor_department = DEPARTMENT_CHURCH
	products = list(/obj/item/book/ritual/cruciform = 10,
					/obj/item/storage/fancy/candle_box = 10,
					/obj/item/storage/fancy/cigarettes/faith = 10,
					/obj/item/reagent_containers/food/drinks/bottle/ntcahors = 20,
					/obj/item/tool_upgrade/augment/sanctifier = 5,
					/obj/item/soap/church = 5,
					/obj/item/storage/wallet = 5,
					/obj/item/storage/belt/utility/neotheology = 5,
					/obj/item/storage/backpack/duffelbag = 5,
					/obj/item/storage/backpack/satchel/neotheology = 5,
					/obj/item/storage/backpack/neotheology = 5,
					/obj/item/storage/backpack/sport/neotheology = 5,
					/obj/item/clothing/suit/storage/neotheosports = 5,
					/obj/item/clothing/under/rank/church/sport = 5,
					/obj/item/clothing/under/rank/church = 5,
					/obj/item/stack/medical/bruise_pack = 8,
					/obj/item/stack/medical/ointment = 8,
					/obj/item/stack/medical/splint = 5,
					/obj/item/stack/medical/advanced/bruise_pack = 4,
					/obj/item/stack/medical/advanced/ointment = 4,
					/obj/item/storage/pouch/small_generic = 2,
					/obj/item/storage/pouch/medium_generic = 2,
					/obj/item/storage/pouch/medical_supply = 2,
					/obj/item/grenade/chem_grenade/antiweed/nt_antiweed = 5,
					/obj/item/grenade/chem_grenade/cleaner/nt_cleaner = 5,
					/obj/item/tool/knife/dagger/nt = 3,
					/obj/item/tool/sword/nt = 3,
					/obj/item/gun/energy/ntpistol = 3,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_old_guns = 2,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_new_guns = 2,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_basic_arms/public = 2,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter_public = 3)
	contraband = list(/obj/item/tool/knife/neotritual = 3,
					/obj/item/gun/matter/launcher/nt_sprayer = 3)

	prices = list(/obj/item/book/ritual/cruciform = 5,
					/obj/item/storage/fancy/candle_box = 30,
					/obj/item/storage/fancy/cigarettes/faith = 65, //Some healing chems
					/obj/item/reagent_containers/food/drinks/bottle/ntcahors = 100,
					/obj/item/tool_upgrade/augment/sanctifier = 80,
					/obj/item/soap/church = 50,
					/obj/item/storage/wallet = 15,
					/obj/item/storage/belt/utility/neotheology = 20,
					/obj/item/storage/backpack/duffelbag = 75,
					/obj/item/storage/backpack/satchel/neotheology = 20,
					/obj/item/storage/backpack/neotheology = 20,
					/obj/item/storage/backpack/sport/neotheology = 20,
					/obj/item/clothing/suit/storage/neotheosports = 40,
					/obj/item/clothing/under/rank/church/sport = 15,
					/obj/item/clothing/under/rank/church = 15,
					/obj/item/stack/medical/bruise_pack = 50,
					/obj/item/stack/medical/ointment = 35,
					/obj/item/stack/medical/splint = 20,
					/obj/item/stack/medical/advanced/bruise_pack/nt = 100,
					/obj/item/stack/medical/advanced/ointment/nt = 100,
					/obj/item/storage/pouch/small_generic = 400,
					/obj/item/storage/pouch/medium_generic = 500,
					/obj/item/storage/pouch/medical_supply = 200,
					/obj/item/grenade/chem_grenade/antiweed/nt_antiweed = 25,
					/obj/item/grenade/chem_grenade/cleaner/nt_cleaner = 50,
					/obj/item/tool/knife/dagger/nt = 50,
					/obj/item/tool/sword/nt = 100,
					/obj/item/gun/energy/ntpistol = 120,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_old_guns = 1500,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_new_guns = 1000,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_basic_arms/public = 100,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter_public = 100,
					/obj/item/tool/knife/neotritual = 250,
					/obj/item/gun/matter/launcher/nt_sprayer = 500)

/obj/machinery/vending/serbomat
	name = "From Serbia with love"
	desc = "A old world strange vender for some reason still operational."
	icon_state = "serbomat"
	product_ads = "For Tsar and Country.;Have you fulfilled your nutrition quota today?;Very nice!;We are simple people, for this is all we eat.;If there is a person, there is a problem. If there is no person, then there is no problem."
	products = list(
					/obj/item/reagent_containers/food/drinks/bottle/vodka = 30, // ghetto antihacking, have fun
					/obj/item/storage/deferred/crate/uniform_green = 4,
					/obj/item/storage/deferred/crate/uniform_brown = 4,
					/obj/item/storage/deferred/crate/uniform_black = 4,
					/obj/item/storage/deferred/crate/uniform_flak = 2,
					/obj/item/storage/deferred/crate/uniform_light = 2,
					/obj/item/gun/projectile/boltgun/sa = 8,
					/obj/item/ammo_magazine/ammobox/rifle_75_small = 15,
					/obj/item/ammo_magazine/ammobox/rifle_75_small/rubber = 15,
					/obj/item/ammo_magazine/speed_loader_rifle_75 = 20
					)
	prices = list(
					/obj/item/reagent_containers/food/drinks/bottle/vodka = 5,
					/obj/item/storage/deferred/crate/uniform_green = 200,
					/obj/item/storage/deferred/crate/uniform_brown = 200,
					/obj/item/storage/deferred/crate/uniform_black = 200,
					/obj/item/storage/deferred/crate/uniform_flak = 220,
					/obj/item/storage/deferred/crate/uniform_light = 180,
					/obj/item/gun/projectile/boltgun/sa = 100,
					/obj/item/ammo_magazine/ammobox/rifle_75_small = 100,
					/obj/item/ammo_magazine/ammobox/rifle_75_small/rubber = 100,
					/obj/item/ammo_magazine/speed_loader_rifle_75 = 60
					)
	idle_power_usage = 211
	auto_price = FALSE
	vendor_department = DEPARTMENT_CIVILIAN

//For the propis loot
/obj/machinery/vending/propis_loot_box
	name = "Prospectors 'Git-yer-Shit' Vendor"
	desc = "The prospectors much loved 'Git-yer-Shit' a machine meant to sap the credits... 'reward' people for playing a lottery like system for boxes of items. Please spend responsibly."
	icon_state = "MagiVend"
	product_slogans = list("Imagine the rare stuff and buy more!", "Rare stuff if you buy more!", "Buy and get random items!", "Don't quit, buy more!", "Its not a lootbox, its surprise mechanics!")
	vendor_department = DEPARTMENT_PROSPECTOR
	products = list(
		/obj/item/storage/box/vendor_lootbox = 3,
		/obj/item/storage/box/vendor_lootbox/combat_basic_light = 3,
		/obj/item/storage/box/vendor_lootbox/combat_basic_medium = 3,
		/obj/item/storage/box/vendor_lootbox/combat_basic_high = 3,
		/obj/item/storage/box/vendor_lootbox/medicine_basic = 3,
		/obj/item/storage/box/vendor_lootbox/medicine_moderate = 3,
		/obj/item/storage/box/vendor_lootbox/medicine_high = 3,
		/obj/item/storage/box/vendor_lootbox/oddity_low = 3,
		/obj/item/storage/box/vendor_lootbox/oddity_moderate = 3,
		/obj/item/storage/box/vendor_lootbox/oddity_high = 3,
		/obj/item/grenade/spawnergrenade/manhacks/junkbot = 3
		)
	prices = list(
		/obj/item/storage/box/vendor_lootbox = 50,
		/obj/item/storage/box/vendor_lootbox/combat_basic_light = 100,
		/obj/item/storage/box/vendor_lootbox/combat_basic_medium = 250,
		/obj/item/storage/box/vendor_lootbox/combat_basic_high = 500,
		/obj/item/storage/box/vendor_lootbox/medicine_basic = 100,
		/obj/item/storage/box/vendor_lootbox/medicine_moderate = 250,
		/obj/item/storage/box/vendor_lootbox/medicine_high = 500,
		/obj/item/storage/box/vendor_lootbox/oddity_low = 150,
		/obj/item/storage/box/vendor_lootbox/oddity_moderate = 300,
		/obj/item/storage/box/vendor_lootbox/oddity_high = 600,
		/obj/item/grenade/spawnergrenade/manhacks/junkbot = 100
		)
	product_ads = "Imagine the rare stuff and buy more!;Rare stuff if you buy more!;Buy and get random items!;Don't quit, buy more!;Its not a lootbox, its surprise mechanics!"
	auto_price = FALSE

//For Blackshield Kits
/obj/machinery/vending/blackshield_kit
	name = "\improper Blackshield Kit Vendor"
	desc = "A vendor that can dispense specialized equipment kits for Blackshield Troopers."
	icon_state = "trashvend"
	products = list( // 5 in stock for the default blackshield kit, 3 for the rest
		/obj/item/storage/box/bs_kit/mosin = 5,
		/obj/item/storage/box/bs_kit/sts = 3,
		/obj/item/storage/box/bs_kit/cog = 3,
		/obj/item/storage/box/bs_kit/roe = 3,
		/obj/item/storage/box/bs_kit/greasegun = 3,
		/obj/item/storage/box/bs_kit/grizzly = 3,
		/obj/item/storage/box/bs_kit/stallion = 5,
		/obj/item/storage/box/bs_kit/lamia = 3,
		/obj/item/storage/box/bs_kit/colt = 3,
		/obj/item/storage/box/bs_kit/martin = 5,
		/obj/item/storage/box/bs_kit/sawn_shotgun = 5,
		/obj/item/storage/box/bs_kit/standard_armor = 5,
		/obj/item/storage/box/bs_kit/flak_armor = 3,
		/obj/item/storage/box/bs_kit/bullet_armor = 3,
		/obj/item/storage/box/bs_kit/laser_armor = 3
		)
	prices = list( // 500$ for default Blackshield stuff, 750 for the rest
		/obj/item/storage/box/bs_kit/mosin = 500,
		/obj/item/storage/box/bs_kit/sts = 750,
		/obj/item/storage/box/bs_kit/cog = 750,
		/obj/item/storage/box/bs_kit/roe = 750,
		/obj/item/storage/box/bs_kit/greasegun = 750,
		/obj/item/storage/box/bs_kit/grizzly = 750,
		/obj/item/storage/box/bs_kit/stallion = 500,
		/obj/item/storage/box/bs_kit/lamia = 750,
		/obj/item/storage/box/bs_kit/colt = 750,
		/obj/item/storage/box/bs_kit/martin = 500,
		/obj/item/storage/box/bs_kit/sawn_shotgun = 500,
		/obj/item/storage/box/bs_kit/standard_armor = 500,
		/obj/item/storage/box/bs_kit/flak_armor = 750,
		/obj/item/storage/box/bs_kit/bullet_armor = 750,
		/obj/item/storage/box/bs_kit/laser_armor = 1250
		)
	auto_price = FALSE

/obj/machinery/vending/blackshield_kit/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/voucher/blackshield))
		var/obj/item/voucher/blackshield/Voucher = I
		switch(Voucher.voucher_type)
			if("Primary")
				RedeemPrimary(I, user)
			if("Secondary")
				RedeemSecondary(I, user)
			if("Armor")
				RedeemArmor(I, user)
		return
	return ..()

/obj/machinery/vending/blackshield_kit/proc/RedeemPrimary(obj/item/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/bs_kit/mosin = "Mosin",
					/obj/item/storage/box/bs_kit/sts = "STS",
					/obj/item/storage/box/bs_kit/cog = "Cog",
					/obj/item/storage/box/bs_kit/greasegun = "Grease Gun",
					/obj/item/storage/box/bs_kit/roe = "Roe light boltgun",
					/obj/item/storage/box/bs_kit/grizzly = "Grizzly"
					)
	var/selection = input(redeemer, "Pick your primary weapon", "Blackshield Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE

/obj/machinery/vending/blackshield_kit/proc/RedeemSecondary(obj/item/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/bs_kit/stallion = "Stallion",
					/obj/item/storage/box/bs_kit/lamia = "Lamia",
					/obj/item/storage/box/bs_kit/colt = "Colt",
					/obj/item/storage/box/bs_kit/sawn_shotgun = "Sawn-Off Shotgun",
					/obj/item/storage/box/bs_kit/martin = "Martin"
					)
	var/selection = input(redeemer, "Pick your side-arm", "Blackshield Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE

/obj/machinery/vending/blackshield_kit/proc/RedeemArmor(obj/item/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/bs_kit/standard_armor = "Plate",
					/obj/item/storage/box/bs_kit/flak_armor = "Flak",
					/obj/item/storage/box/bs_kit/laser_armor = "Ablative",
					/obj/item/storage/box/bs_kit/bullet_armor = "Bullet-Proof"
					)
	var/selection = input(redeemer, "Pick your armor", "Blackshield Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE