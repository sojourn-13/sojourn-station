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
	/obj/item/gun/projectile/giskard = 2,
	/obj/item/gun/projectile/olivaw = 2,
	/obj/item/gun/projectile/colt = 2,
	/obj/item/gun/projectile/boltgun/flare_gun = 5,
	//Revolver
	/obj/item/gun/projectile/revolver/detective = 2,
	/obj/item/gun/projectile/revolver/lemant = 2,
	/obj/item/gun/projectile/revolver/sixshot = 2,
	/obj/item/gun/projectile/revolver/rev10 = 2,
	//Automatic
	/obj/item/gun/projectile/automatic/ppsh/ppv = 2,
	/obj/item/gun/projectile/automatic/greasegun = 2,
	//Shotgun
	/obj/item/gun/projectile/boltgun/lever = 2,
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
	/obj/item/ammo_magazine/speed_loader_kurtz_50 = 3,
	/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber = 3,
	/obj/item/ammo_magazine/magnum_40/rubber = 3,
	/obj/item/ammo_magazine/magnum_40 = 3,
	/obj/item/ammo_magazine/kurtz_50/rubber = 3,
	/obj/item/ammo_magazine/kurtz_50 = 3,
	/obj/item/ammo_magazine/smg_35/rubber = 3,
	/obj/item/ammo_magazine/smg_35 = 3,
	/obj/item/ammo_magazine/light_rifle_257/rubber = 3,
	/obj/item/ammo_magazine/light_rifle_257 = 5,
	/obj/item/ammo_magazine/rifle_75 = 5,
	/obj/item/ammo_magazine/rifle_75/rubber = 3,
	/obj/item/ammo_magazine/speed_loader_rifle_75 = 3,
	/obj/item/ammo_magazine/heavy_rifle_408 = 3,
	/obj/item/ammo_magazine/heavy_rifle_408/rubber = 3,
	/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 2,
	/obj/item/ammo_magazine/ammobox/pistol_35 =2,
	/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 2,
	/obj/item/ammo_magazine/ammobox/magnum_40 = 2,
	/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 2,
	/obj/item/ammo_magazine/ammobox/shotgun = 2,
	/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 2,
	/obj/item/ammo_magazine/ammobox/light_rifle_257_small = 3,
	/obj/item/ammo_magazine/ammobox/rifle_75_small = 3,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 2,
	/obj/item/ammo_casing/grenade = 5,
	/obj/item/ammo_casing/flare/prespawn = 15,
	/obj/item/ammo_casing/flare/blue/prespawn = 15,
	/obj/item/ammo_casing/flare/green/prespawn = 15,
	//Misc
	/obj/item/clothing/accessory/holster/armpit = 5,
	/obj/item/clothing/accessory/holster/waist = 5,
	/obj/item/clothing/accessory/holster/hip = 5,
	/obj/item/clothing/accessory/holster/leg = 5,
	/obj/item/gun_upgrade/mechanism/weintraub = 2,
	/obj/item/storage/pouch/pistol_holster = 5,
	/obj/item/storage/pouch/pistol_holster/cowboy = 5,
	/obj/item/storage/pouch/kniferig = 5,
	/obj/item/storage/pouch/ammo = 2,
	/obj/item/storage/backpack/guncase = 35,
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
	/obj/item/gun/projectile/giskard = 300,
	/obj/item/gun/projectile/olivaw = 450,
	/obj/item/gun/projectile/colt = 450,
	/obj/item/gun/projectile/boltgun/flare_gun = 500,
	//Revolver
	/obj/item/gun/projectile/revolver/detective = 250,
	/obj/item/gun/projectile/revolver/lemant = 450,
	/obj/item/gun/projectile/revolver/sixshot = 500,
	/obj/item/gun/projectile/revolver/rev10 = 800,
	//Automatic
	/obj/item/gun/projectile/automatic/ppsh/ppv = 1200,
	/obj/item/gun/projectile/automatic/greasegun = 800,
	//Shotgun
	/obj/item/gun/projectile/boltgun/lever = 650,
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
	/obj/item/ammo_magazine/speed_loader_kurtz_50 = 120,
	/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber = 100,
	/obj/item/ammo_magazine/magnum_40/rubber = 75,
	/obj/item/ammo_magazine/magnum_40 = 150,
	/obj/item/ammo_magazine/kurtz_50/rubber = 150,
	/obj/item/ammo_magazine/kurtz_50 = 300,
	/obj/item/ammo_magazine/smg_35/rubber = 100,
	/obj/item/ammo_magazine/smg_35 = 200,
	/obj/item/ammo_magazine/light_rifle_257/rubber = 125,
	/obj/item/ammo_magazine/light_rifle_257 = 250,
	/obj/item/ammo_magazine/rifle_75 = 300,
	/obj/item/ammo_magazine/rifle_75/rubber = 175,
	/obj/item/ammo_magazine/speed_loader_rifle_75 = 250,
	/obj/item/ammo_magazine/heavy_rifle_408 = 400,
	/obj/item/ammo_magazine/heavy_rifle_408/rubber = 350,
	/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 300,
	/obj/item/ammo_magazine/ammobox/pistol_35 =350,
	/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 400,
	/obj/item/ammo_magazine/ammobox/magnum_40 = 450,
	/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 300,
	/obj/item/ammo_magazine/ammobox/shotgun = 350,
	/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 400,
	/obj/item/ammo_magazine/ammobox/light_rifle_257_small = 400,
	/obj/item/ammo_magazine/ammobox/rifle_75_small = 500,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 750,
	/obj/item/ammo_casing/grenade = 50,
	/obj/item/ammo_casing/flare/prespawn = 80,
	/obj/item/ammo_casing/flare/blue/prespawn = 80,
	/obj/item/ammo_casing/flare/green/prespawn = 80,
	//Misc
	/obj/item/clothing/accessory/holster/armpit = 50,
	/obj/item/clothing/accessory/holster/waist = 50,
	/obj/item/clothing/accessory/holster/hip = 50,
	/obj/item/clothing/accessory/holster/leg = 50,
	/obj/item/gun_upgrade/mechanism/weintraub = 200,
	/obj/item/storage/pouch/pistol_holster = 50,
	/obj/item/storage/pouch/pistol_holster/cowboy = 100, // Two pistols, double the price
	/obj/item/storage/pouch/kniferig = 50,
	/obj/item/storage/pouch/ammo = 75,
	/obj/item/storage/backpack/guncase = 25,
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
					/obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber/pepperball = 8,
					/obj/item/ammo_magazine/pistol_35/rubber/pepperball = 8,
					/obj/item/ammo_magazine/highcap_pistol_35/rubber/pepperball = 8,
					/obj/item/ammo_magazine/smg_35/rubber/pepperball = 8,
					/obj/item/ammo_magazine/magnum_40/rubber/pepperball = 8,
					/obj/item/ammo_magazine/speed_loader_magnum_40/rubber/pepperball = 6,
					/obj/item/ammo_magazine/kurtz_50/rubber/pepperball = 6,
					/obj/item/ammo_magazine/speed_loader_kurtz_50/rubber/pepperball = 6,
					/obj/item/ammo_magazine/light_rifle_257_short/rubber/pepperball = 8,
					/obj/item/ammo_magazine/rifle_75/rubber = 8,
					/obj/item/ammo_magazine/heavy_rifle_408/rubber = 8,
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
					/obj/item/clothing/accessory/necklace/fractalrosary = 15,
					/obj/item/clothing/suit/storage/neotheosports = 5,
					/obj/item/clothing/suit/storage/toggle/absolutehoodie = 5,
					/obj/item/clothing/suit/greatcoat/absolutecoat= 5,
					/obj/item/clothing/suit/hooded/absolutecloak = 5,
					/obj/item/clothing/under/rank/church = 5,
					/obj/item/clothing/under/rank/acolyte = 5,
					/obj/item/clothing/suit/storage/numericalgarb = 3,
					/obj/item/clothing/head/numerical_hat = 3,
					/obj/item/stack/medical/bruise_pack = 8,
					/obj/item/stack/medical/ointment = 8,
					/obj/item/stack/medical/splint = 5,
					/obj/item/stack/medical/bruise_pack/advanced/nt = 4,
					/obj/item/stack/medical/ointment/advanced/nt = 4,
					/obj/item/storage/pouch/small_generic = 2,
					/obj/item/storage/pouch/medium_generic = 2,
					/obj/item/storage/pouch/medical_supply = 2,
					/obj/item/grenade/chem_grenade/antiweed/nt_antiweed = 5,
					/obj/item/grenade/chem_grenade/cleaner/nt_cleaner = 5,
					/obj/item/tool/knife/dagger/nt = 3,
					/obj/item/tool/sword/nt = 3,
					/obj/item/gun/energy/ntpistol = 3,
					/obj/item/computer_hardware/hard_drive/portable/design/guns/lemant = 2,
					/obj/item/computer_hardware/hard_drive/portable/design/guns/mk58 = 2,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_old_guns = 2,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_new_guns = 2,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_basic_arms/public = 2,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter/public = 3,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter = 2)
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
					/obj/item/clothing/accessory/necklace/fractalrosary = 5,
					/obj/item/clothing/suit/storage/neotheosports = 40,
					/obj/item/clothing/suit/storage/toggle/absolutehoodie = 50,
					/obj/item/clothing/suit/greatcoat/absolutecoat= 45,
					/obj/item/clothing/suit/hooded/absolutecloak = 35,
					/obj/item/clothing/under/rank/acolyte = 25,
					/obj/item/clothing/under/rank/church = 15,
					/obj/item/clothing/suit/storage/numericalgarb = 65,
					/obj/item/clothing/head/numerical_hat = 40,
					/obj/item/stack/medical/bruise_pack = 50,
					/obj/item/stack/medical/ointment = 35,
					/obj/item/stack/medical/splint = 20,
					/obj/item/stack/medical/bruise_pack/advanced/nt = 100,
					/obj/item/stack/medical/ointment/advanced/nt = 100,
					/obj/item/storage/pouch/small_generic = 400,
					/obj/item/storage/pouch/medium_generic = 500,
					/obj/item/storage/pouch/medical_supply = 200,
					/obj/item/grenade/chem_grenade/antiweed/nt_antiweed = 25,
					/obj/item/grenade/chem_grenade/cleaner/nt_cleaner = 50,
					/obj/item/tool/knife/dagger/nt = 50,
					/obj/item/tool/sword/nt = 100,
					/obj/item/gun/energy/ntpistol = 120,
					/obj/item/computer_hardware/hard_drive/portable/design/guns/lemant = 600,
					/obj/item/computer_hardware/hard_drive/portable/design/guns/mk58 = 550,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_old_guns = 950,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_new_guns = 800,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_basic_arms/public = 100,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter/public = 100,
					/obj/item/computer_hardware/hard_drive/portable/design/nt_bioprinter = 400,
					/obj/item/tool/knife/neotritual = 250,
					/obj/item/gun/matter/launcher/nt_sprayer = 500)
	custom_vendor = TRUE // So they can sell pouches and other printed goods, if they bother to stock them

/obj/machinery/vending/theomat/proc/check_NT(mob/user)
	var/bingo = TRUE //SoJ tweak, were always true, sadly for us church likes non-churchies (lame I know)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(is_neotheology_disciple(H))
			bingo = TRUE

		else if(istype(H.get_active_hand(), /obj/item/clothing/accessory/cross))
			bingo = TRUE

		else if(istype(H.wear_mask, /obj/item/clothing/accessory/cross))
			bingo = TRUE

		else if(H.w_uniform && istype(H.w_uniform, /obj/item/clothing))
			var/obj/item/clothing/C = H.w_uniform
			for(var/obj/item/I in C.accessories)
				if(istype(I, /obj/item/clothing/accessory/cross))
					bingo = TRUE
					break

	if(bingo)
		return TRUE
	to_chat(user, SPAN_WARNING("[src] flashes a message: Unauthorized Access."))
	return FALSE

/obj/machinery/vending/theomat/vend(datum/data/vending_product/R, mob/user)
	if(check_NT(user))
		..()

/obj/machinery/vending/theomat/try_to_buy(obj/item/W, var/datum/data/vending_product/R, var/mob/user)
	if(check_NT(user))
		..()

/obj/machinery/vending/serbomat
	name = "From Serbia with love"
	desc = "A strange old world vending machine, for some reason it is still operational."
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
		/obj/item/storage/box/vendor_lootbox = 4,
		/obj/item/storage/box/vendor_lootbox/combat_basic_light = 4,
		/obj/item/storage/box/vendor_lootbox/combat_basic_medium = 4,
		/obj/item/storage/box/vendor_lootbox/combat_basic_high = 4,
		/obj/item/storage/box/vendor_lootbox/medicine_basic = 4,
		/obj/item/storage/box/vendor_lootbox/medicine_moderate = 4,
		/obj/item/storage/box/vendor_lootbox/medicine_high = 4,
		/obj/item/storage/box/vendor_lootbox/oddity_low = 4,
		/obj/item/storage/box/vendor_lootbox/oddity_moderate = 4,
		/obj/item/storage/box/vendor_lootbox/oddity_high = 4,
		/obj/item/grenade/spawnergrenade/manhacks/junkbot = 4,
		/obj/item/ammo_kit = 5,
		/obj/item/gun/projectile/revolver/handmade = 3,
		/obj/item/gun/projectile/boltgun/handmade = 3,
		/obj/item/gun/projectile/shotgun/slidebarrel = 3,
		/obj/item/gun/projectile/shotgun/pump/china/makeshift = 3,
		/obj/item/gun/projectile/automatic/motherfucker = 3,
		/obj/item/gun/energy/laser/makeshift = 3,
		/obj/item/gun/energy/shrapnel = 3,
		/obj/item/gun/projectile/shotgun/doublebarrel = 2,
		/obj/item/gun/projectile/automatic/vector = 2
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
		/obj/item/storage/box/vendor_lootbox/oddity_moderate = 275,
		/obj/item/storage/box/vendor_lootbox/oddity_high = 400,
		/obj/item/grenade/spawnergrenade/manhacks/junkbot = 100,
		/obj/item/ammo_kit = 25,
		/obj/item/gun/projectile/revolver/handmade = 100,
		/obj/item/gun/projectile/boltgun/handmade = 150,
		/obj/item/gun/projectile/shotgun/slidebarrel = 250,
		/obj/item/gun/projectile/shotgun/pump/china/makeshift = 400,
		/obj/item/gun/projectile/automatic/motherfucker = 300,
		/obj/item/gun/energy/laser/makeshift = 400,
		/obj/item/gun/energy/shrapnel = 500,
		/obj/item/gun/projectile/shotgun/doublebarrel = 650,
		/obj/item/gun/projectile/automatic/vector = 1100 // Pricy
		)
	product_ads = "Imagine the rare stuff and buy more!;Rare stuff if you buy more!;Buy and get random items!;Don't quit, buy more!;Its not a lootbox, its surprise mechanics!"
	auto_price = FALSE
