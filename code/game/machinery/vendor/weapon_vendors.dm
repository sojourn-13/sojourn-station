/obj/machinery/vending/weapon_machine
	name = "Marshal Portable Armory"
	desc = "A self-defense equipment vending machine. When you need to be tacticool."
	product_slogans = "The best defense is good offense!;Buy for your whole family today!;Nobody can outsmart bullet!;Stupidity can be cured! By LEAD.;Remember, 'Stand your Ground' is applicable in a court of law!;Guns kill people, It's never your fault!;It's dangerous to go unarmed, take this!;Buy more ammo, you never know when you'll need it!" // Yes, It's a Zelda reference, fight me - Papalus
	product_ads = "Stunning!;Take justice in your own hands!;LEADership!;Guns don't kill people, YOU do!;His fault for being in sights!;Serve them a cold plate of justice!;Justice in lead form!;Smell the gunpowder!;Better now than never!"
	icon_state = "weapon"
	no_criminals = TRUE
	vendor_department = DEPARTMENT_SECURITY
	products = list(
	// Non-Lethal
	/obj/item/device/flash = 6,
	/obj/item/reagent_containers/spray/pepper = 6,
	// Melee
	/obj/item/tool/baton/mini = 5,
	/obj/item/tool/knife/tacknife = 6,
	/obj/item/tool/fireaxe/militia_tomahawk = 6,
	// Firearms, ordered by price and category. / My idea with these is we selling old stock so supply spec can still sell the new one
	// Pistol
	/obj/item/gun/projectile/automatic/slaught_o_matic = 5,
	/obj/item/gun/projectile/boltgun/flare_gun = 5,
	/obj/item/gun/projectile/clarissa = 3, // Pocket guns
	/obj/item/gun/projectile/ladon = 2,
	/obj/item/gun/projectile/glock = 2,
	// Revolver
	/obj/item/gun/projectile/revolver/detective = 3, // Honey fetch the family revolver
	/obj/item/gun/projectile/revolver = 2, // Old stock
	// Automatic
	/obj/item/gun/projectile/automatic/texan = 2,
	/obj/item/gun/projectile/automatic/ppsh/ppv = 2,
	/obj/item/gun/projectile/automatic/bulldog = 2,
	/obj/item/gun/projectile/automatic/bulldog/rds = 2,
	// Shotgun
	/obj/item/gun/projectile/shotgun/pump = 2,
	/obj/item/gun/projectile/shotgun/pump/gladstone = 2,
	// Energy
	/obj/item/gun/energy/gun/martin = 2,
	/obj/item/gun/energy/stunrevolver = 2,
	// LTL Ammo
	/obj/item/ammo_magazine/speed_loader_pistol_35/rubber = 6,
	/obj/item/ammo_magazine/pistol_35/rubber = 6,
	/obj/item/ammo_magazine/highcap_pistol_35/rubber = 6,
	/obj/item/ammo_magazine/smg_35/rubber = 6,
	/obj/item/ammo_magazine/speed_loader_magnum_40/rubber = 6,
	/obj/item/ammo_magazine/magnum_40/rubber = 6,
	/obj/item/ammo_magazine/smg_magnum_40/rubber = 6,
	/obj/item/ammo_magazine/speed_loader_kurz_50/rubber = 6,
	/obj/item/ammo_magazine/kurz_50/rubber = 6,
	/obj/item/ammo_magazine/light_rifle_257/rubber = 6,
	/obj/item/ammo_magazine/rifle_75/rubber = 6,
	/obj/item/ammo_magazine/heavy_rifle_408/rubber = 6,
	/obj/item/ammo_magazine/speed_loader_shotgun/beanbag = 6,
	// Ammo
	/obj/item/ammo_magazine/speed_loader_pistol_35 = 6,
	/obj/item/ammo_magazine/pistol_35 = 6,
	/obj/item/ammo_magazine/highcap_pistol_35 = 6,
	/obj/item/ammo_magazine/smg_35 = 6,
	/obj/item/ammo_magazine/speed_loader_magnum_40 = 6,
	/obj/item/ammo_magazine/magnum_40 = 6,
	/obj/item/ammo_magazine/smg_magnum_40 = 6,
	/obj/item/ammo_magazine/speed_loader_kurz_50 = 6,
	/obj/item/ammo_magazine/kurz_50 = 6,
	/obj/item/ammo_magazine/light_rifle_257 = 6,
	/obj/item/ammo_magazine/speed_loader_rifle_75 = 6,
	/obj/item/ammo_magazine/rifle_75 = 6,
	/obj/item/ammo_magazine/heavy_rifle_408 = 6,
	/obj/item/ammo_magazine/speed_loader_shotgun/pellet = 6,
	/obj/item/ammo_magazine/speed_loader_shotgun = 6,
	// Boxes
	/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 6,
	/obj/item/ammo_magazine/ammobox/pistol_35 =6,
	/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 6,
	/obj/item/ammo_magazine/ammobox/magnum_40 = 6,
	/obj/item/ammo_magazine/ammobox/kurz_50/rubber = 6,
	/obj/item/ammo_magazine/ammobox/kurz_50 = 6,
	/obj/item/ammo_magazine/ammobox/light_rifle_257_small = 6,
	/obj/item/ammo_magazine/ammobox/rifle_75_small = 6,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 6,
	/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 6,
	/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 6,
	/obj/item/ammo_magazine/ammobox/shotgun = 6,
	/obj/item/ammo_casing/grenade = 5,
	/obj/item/ammo_casing/flare/prespawn = 15,
	/obj/item/ammo_casing/flare/blue/prespawn = 15,
	/obj/item/ammo_casing/flare/green/prespawn = 15,
	/obj/item/storage/box/smokes = 6,
	// Misc
	/obj/item/clothing/accessory/holster/armpit = 5,
	/obj/item/clothing/accessory/holster/waist = 5,
	/obj/item/clothing/accessory/holster/hip = 5,
	/obj/item/clothing/accessory/holster/leg = 5,
	/obj/item/storage/pouch/pistol_holster = 5,
	/obj/item/storage/pouch/pistol_holster/cowboy = 5,
	/obj/item/storage/pouch/kniferig = 5,
	/obj/item/storage/pouch/ammo = 5,
	/obj/item/storage/backpack/guncase = 35,
	/obj/item/gun_upgrade/mechanism/weintraub = 2
	)

	prices = list(
	// Non-Lethal
	/obj/item/device/flash = 100,
	/obj/item/reagent_containers/spray/pepper = 50,
	// Melee
	/obj/item/tool/baton/mini = 100,
	/obj/item/tool/knife/tacknife = 60,
	/obj/item/tool/fireaxe/militia_tomahawk = 90,
	// Firearms, ordered by price and category. / My idea with these is we selling old stock so supply spec can still sell the new one
	// Pistol
	/obj/item/gun/projectile/automatic/slaught_o_matic = 65,
	/obj/item/gun/projectile/boltgun/flare_gun = 135,
	/obj/item/gun/projectile/clarissa = 120, // Pocket guns
	/obj/item/gun/projectile/ladon = 800,
	/obj/item/gun/projectile/glock = 950,
	// Revolver
	/obj/item/gun/projectile/revolver/detective = 120, // Honey fetch the family revolver
	/obj/item/gun/projectile/revolver = 950, // Old stock
	// Automatic
	/obj/item/gun/projectile/automatic/texan = 1100,
	/obj/item/gun/projectile/automatic/ppsh/ppv = 1400,
	/obj/item/gun/projectile/automatic/bulldog = 1600,
	/obj/item/gun/projectile/automatic/bulldog/rds = 1850,
	// Shotgun
	/obj/item/gun/projectile/shotgun/pump = 800,
	/obj/item/gun/projectile/shotgun/pump/gladstone = 1150,
	// Energy
	/obj/item/gun/energy/gun/martin = 330,
	/obj/item/gun/energy/stunrevolver = 1000, // There is no way anyone is actually going to buy it but here we are
	// LTL Ammo
	/obj/item/ammo_magazine/speed_loader_pistol_35/rubber = 15,
	/obj/item/ammo_magazine/pistol_35/rubber = 25,
	/obj/item/ammo_magazine/highcap_pistol_35/rubber = 35,
	/obj/item/ammo_magazine/smg_35/rubber = 45,
	/obj/item/ammo_magazine/speed_loader_magnum_40/rubber = 25,
	/obj/item/ammo_magazine/magnum_40/rubber = 40,
	/obj/item/ammo_magazine/smg_magnum_40/rubber = 60,
	/obj/item/ammo_magazine/speed_loader_kurz_50/rubber = 35,
	/obj/item/ammo_magazine/kurz_50/rubber = 50,
	/obj/item/ammo_magazine/light_rifle_257/rubber = 55,
	/obj/item/ammo_magazine/rifle_75/rubber = 75,
	/obj/item/ammo_magazine/heavy_rifle_408/rubber = 95,
	/obj/item/ammo_magazine/speed_loader_shotgun/beanbag = 60,
	// Ammo
	/obj/item/ammo_magazine/speed_loader_pistol_35 = 30,
	/obj/item/ammo_magazine/pistol_35 = 45,
	/obj/item/ammo_magazine/highcap_pistol_35 = 55,
	/obj/item/ammo_magazine/smg_35 = 80,
	/obj/item/ammo_magazine/speed_loader_magnum_40 = 45,
	/obj/item/ammo_magazine/magnum_40 = 55,
	/obj/item/ammo_magazine/smg_magnum_40 = 100,
	/obj/item/ammo_magazine/speed_loader_kurz_50 = 60,
	/obj/item/ammo_magazine/kurz_50 = 80,
	/obj/item/ammo_magazine/light_rifle_257 = 105,
	/obj/item/ammo_magazine/speed_loader_rifle_75 = 120,
	/obj/item/ammo_magazine/rifle_75 = 145,
	/obj/item/ammo_magazine/heavy_rifle_408 = 160,
	/obj/item/ammo_magazine/speed_loader_shotgun/pellet = 105,
	/obj/item/ammo_magazine/speed_loader_shotgun = 110,
	// Boxes
	/obj/item/ammo_magazine/ammobox/pistol_35/rubber = 150,
	/obj/item/ammo_magazine/ammobox/pistol_35 = 250,
	/obj/item/ammo_magazine/ammobox/magnum_40/rubber = 180,
	/obj/item/ammo_magazine/ammobox/magnum_40 = 280,
	/obj/item/ammo_magazine/ammobox/kurz_50/rubber = 210,
	/obj/item/ammo_magazine/ammobox/kurz_50 = 310,
	/obj/item/ammo_magazine/ammobox/light_rifle_257_small = 350,
	/obj/item/ammo_magazine/ammobox/rifle_75_small = 400,
	/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small = 450,
	/obj/item/ammo_magazine/ammobox/shotgun/beanbags = 250,
	/obj/item/ammo_magazine/ammobox/shotgun/buckshot = 300,
	/obj/item/ammo_magazine/ammobox/shotgun = 350,
	/obj/item/ammo_casing/grenade = 100,
	/obj/item/ammo_casing/flare/prespawn = 50,
	/obj/item/ammo_casing/flare/blue/prespawn = 50,
	/obj/item/ammo_casing/flare/green/prespawn = 50,
	/obj/item/storage/box/smokes = 300, // Why was this so cheap again, kinda guh
	// Misc
	/obj/item/clothing/accessory/holster/armpit = 50,
	/obj/item/clothing/accessory/holster/waist = 50,
	/obj/item/clothing/accessory/holster/hip = 50,
	/obj/item/clothing/accessory/holster/leg = 50,
	/obj/item/storage/pouch/pistol_holster = 50,
	/obj/item/storage/pouch/pistol_holster/cowboy = 100,
	/obj/item/storage/pouch/kniferig = 100,
	/obj/item/storage/pouch/ammo = 80,
	/obj/item/storage/backpack/guncase = 50,
	/obj/item/gun_upgrade/mechanism/weintraub = 100
	)

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
					/obj/item/device/holowarrant = 5,
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
					/obj/item/ammo_magazine/kurz_50/rubber/pepperball = 6,
					/obj/item/ammo_magazine/speed_loader_kurz_50/rubber/pepperball = 6,
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

	contraband = list(/obj/item/reagent_containers/snacks/donut/normal = 12)
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
					/obj/item/reagent_containers/drinks/bottle/ntcahors = 20,
					/obj/item/tool_upgrade/augment/sanctifier = 5,
					/obj/item/soap/church = 5,
					/obj/item/storage/wallet = 5,
					/obj/item/storage/belt/utility/neotheology = 5,
					/obj/item/storage/backpack/duffelbag = 5,
					/obj/item/storage/backpack/satchel/neotheology = 5,
					/obj/item/storage/backpack/neotheology = 5,
					/obj/item/storage/backpack/sport/neotheology = 5,
					/obj/item/clothing/suit/storage/neotheosports = 5,
					/obj/item/clothing/suit/storage/toggle/absolutehoodie = 5,
					/obj/item/clothing/suit/greatcoat/absolutecoat= 5,
					/obj/item/clothing/suit/hooded/absolutecloak = 5,
					/obj/item/clothing/under/rank/church = 5,
					/obj/item/clothing/suit/storage/surtout = 5,
					/obj/item/clothing/head/leather_hat = 5,
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
					/obj/item/tool/sword/nt/shortsword = 3,
					/obj/item/gun/energy/ntpistol = 3,
					/obj/item/pc_part/drive/disk/design/nt/lemant = 2,
					/obj/item/pc_part/drive/disk/design/nt/mk58 = 2,
					/obj/item/pc_part/drive/disk/design/nt/old_guns = 2,
					/obj/item/pc_part/drive/disk/design/nt/new_guns = 2,
					/obj/item/pc_part/drive/disk/design/nt/basic_arms/public = 2,
					/obj/item/pc_part/drive/disk/design/nt/basic_utility/public = 3)
	contraband = list(/obj/item/tool/knife/neotritual = 3,
					/obj/item/gun/matter/launcher/nt_sprayer = 3)

	prices = list(/obj/item/book/ritual/cruciform = 5,
					/obj/item/storage/fancy/candle_box = 30,
					/obj/item/storage/fancy/cigarettes/faith = 65, // Some healing chems
					/obj/item/reagent_containers/drinks/bottle/ntcahors = 100,
					/obj/item/tool_upgrade/augment/sanctifier = 80,
					/obj/item/soap/church = 50,
					/obj/item/storage/wallet = 15,
					/obj/item/storage/belt/utility/neotheology = 20,
					/obj/item/storage/backpack/duffelbag = 75,
					/obj/item/storage/backpack/satchel/neotheology = 20,
					/obj/item/storage/backpack/neotheology = 20,
					/obj/item/storage/backpack/sport/neotheology = 20,
					/obj/item/clothing/suit/storage/neotheosports = 40,
					/obj/item/clothing/suit/storage/toggle/absolutehoodie = 50,
					/obj/item/clothing/suit/greatcoat/absolutecoat= 45,
					/obj/item/clothing/suit/hooded/absolutecloak = 35,
					/obj/item/clothing/under/rank/acolyte = 25,
					/obj/item/clothing/under/rank/church = 15,
					/obj/item/clothing/suit/storage/surtout = 65,
					/obj/item/clothing/head/leather_hat = 40,
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
					/obj/item/pc_part/drive/disk/design/nt/lemant = 600,
					/obj/item/pc_part/drive/disk/design/nt/mk58 = 550,
					/obj/item/pc_part/drive/disk/design/nt/old_guns = 950,
					/obj/item/pc_part/drive/disk/design/nt/new_guns = 800,
					/obj/item/pc_part/drive/disk/design/nt/basic_arms/public = 100,
					/obj/item/pc_part/drive/disk/design/nt/basic_utility/public = 100,
					/obj/item/tool/knife/neotritual = 250,
					/obj/item/gun/matter/launcher/nt_sprayer = 500)
	//custom_vendor = TRUE // So they can sell pouches and other printed goods, if they bother to stock them - Turns out they just abuse it to get free stuff, and they just make a custom vendor if they want to sell

/* We don't actually use this code at all, check_NT is hardcoded to always return true, so why run the proc every time?
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
*/

/obj/machinery/vending/serbomat
	name = "From Serbia with love"
	desc = "A strange old world vending machine, for some reason it is still operational."
	icon_state = "serbomat"
	product_ads = "For Tsar and Country.;Have you fulfilled your nutrition quota today?;Very nice!;We are simple people, for this is all we eat.;If there is a person, there is a problem. If there is no person, then there is no problem."
	products = list(
					/obj/item/reagent_containers/drinks/bottle/vodka = 30,
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
					/obj/item/reagent_containers/drinks/bottle/vodka = 5,
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
