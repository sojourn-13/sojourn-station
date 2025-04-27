//----------------------------------------------
//-----------------Enforcement---------------------
//----------------------------------------------
//Gun crate cost should be all gun prices added together /2 for the crate price. Ergo cargo buys for 50% then sells for 100%. Or just sell for 50 :/
// The surplus tag prevents them from abusing this. The prices are somewhat high to prevent buying to recycle for plasteel and to slightly encourage buying from marshal armory. -Kaz
/datum/supply_pack/specialops
	name = "Special Ops Crate"
	contains = list(/obj/item/storage/box/emps,
					/obj/item/grenade/smokebomb,
					/obj/item/grenade/smokebomb,
					/obj/item/grenade/smokebomb,
					/obj/item/pen/reagent/paralysis,
					/obj/item/grenade/chem_grenade/incendiary)
	cost = 650
	crate_name = "special ops crate"
	group = "Enforcement"
	hidden = TRUE

/datum/supply_pack/pistol_35_pack
	name = "35 Pistol Pack Weapons Crate"
	contains = list(/obj/item/gun/projectile/glock, //400
				/obj/item/gun/projectile/giskard, //150
				/obj/item/gun/projectile/olivaw, //225
				/obj/item/gun/projectile/mk58) //325
	cost = 1250
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "35 Pistol Pack Weapons Crate"
	group = "Enforcement"

/datum/supply_pack/revolver_style_pack
	name = "Stylish Revolver Pack Weapons Crate"
	contains = list(/obj/item/gun/projectile/revolver/deckard, //700
				/obj/item/gun/projectile/revolver/mistral, //450
				/obj/item/gun/projectile/revolver/hornet, //500
				/obj/item/gun/projectile/revolver/lemant) //225
	cost = 1875
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "Stylish Revolver Pack Weapons Crate"
	group = "Enforcement"

/datum/supply_pack/fssmall
	name = "HS Cheap Sidearms Crate"
	contains = list(/obj/item/gun/projectile/colt, //225
			/obj/item/gun/projectile/giskard, //125
			/obj/item/gun/projectile/olivaw) //225
	cost = 575
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "HS cheap sidearms crate"
	group = "Enforcement"

/datum/supply_pack/longrevolver
	name = "Lonestar Long Revolver Novelty Crate"
	contains = list(/obj/item/gun/projectile/revolver/longboi)
	cost = 1000 //Higher than normal since novelty item. -Kaz
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "long revolver crate"
	group = "Enforcement"

/* - To op for common getting
/datum/supply_pack/littlecomet
	name = "Little Comet Sidearm Crate"
	contains = list(/obj/item/gun/projectile/revolver/little_comet)
	cost = 2500
	containertype = /obj/structure/closet/crate/serbcrate_gray
	crate_name = "Little Comet Sidearm Crate"
	group = "Enforcement"
*/

//Specialty packs that have a theme, these come with a single handgun, ammo, and something thematic. -Kaz
/datum/supply_pack/westernshootercrate
	name = "LS Western Shooter Specialty Crate"
	contains = list(/obj/item/gun/projectile/revolver, //400
					/obj/item/ammo_magazine/speed_loader_magnum_40/lethal,
					/obj/item/ammo_magazine/speed_loader_magnum_40/lethal,
					/obj/item/gun_upgrade/barrel/gauss)
	cost = 750
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "LS Western Shooter Specialty Crate"
	group = "Enforcement"

/datum/supply_pack/lasershowcrate
	name = "LS Laser Show Specialty Crate"
	contains = list(/obj/item/gun/energy/firestorm, //1100
					/obj/item/cell/medium/super,
					/obj/item/cell/medium/super,
					/obj/item/tool_upgrade/reinforcement/heatsink)
	cost = 1850
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "LS Laser Show Specialty Crate"
	group = "Enforcement"

/datum/supply_pack/clownguncrate
	name = "LS Clowning Around Specialty Crate"
	contains = list(/obj/item/gun/projectile/revolver/longboi, //1000
					/obj/item/ammo_magazine/speed_loader_kurz_50,
					/obj/item/ammo_magazine/speed_loader_kurz_50,
					/obj/item/gun_upgrade/trigger/honker,
					/obj/item/gun_upgrade/mechanism/weintraub)
	cost = 1400
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "LS Clowning Around Specialty Crate"
	group = "Enforcement"

/datum/supply_pack/kickasscrate
	name = "LS Time to Kick Ass Specialty Crate"
	contains = list(/obj/item/gun/projectile/revolver/rev10/mateba, //1500
					/obj/item/ammo_magazine/speed_loader_kurz_50,
					/obj/item/ammo_magazine/speed_loader_kurz_50,
					/obj/item/clothing/gloves/thick/combat,
					/obj/item/clothing/shoes/combat,
					/obj/item/clothing/under/johnny,
					/obj/item/reagent_containers/snacks/candy_drop_blue)
	cost = 1900
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "LS Time to Kick Ass Specialty Crate"
	group = "Enforcement"

/datum/supply_pack/smoothoperator
	name = "LS Smooth Operator Specialty Crate"
	contains = list(/obj/item/gun/projectile/silenced, //375
					/obj/item/ammo_magazine/magnum_40,
					/obj/item/ammo_magazine/magnum_40,
					/obj/item/clothing/shoes/syndigaloshes,
					/obj/item/clothing/gloves/fingerless,
					/obj/item/clothing/under/tactical,
					/obj/item/clothing/glasses/sunglasses/big)
	cost = 1200
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "LS Smooth Operator Specialty Crate"
	group = "Enforcement"

/datum/supply_pack/stealthisoptionalcrate
	name = "LS Stealth is Optional Specialty Crate"
	contains = list(/obj/item/gun/projectile/automatic/motherfucker, //150
					/obj/item/ammo_magazine/ammobox/pistol_35,
					/obj/item/ammo_magazine/ammobox/pistol_35,
					/obj/item/clothing/head/helmet/faceshield/altyn,
					/obj/item/clothing/suit/armor/flakvest/full,
					/obj/item/grenade/flashbang,
					/obj/item/grenade/flashbang)
	cost = 900
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "LS Stealth is Optional Specialty Crate"
	group = "Enforcement"

//AMMUNITION
/datum/supply_pack/thirtyfive_ammo
	name = "HS .35 Handgun Ammunition Crate"
	contains = list(/obj/item/ammo_magazine/ammobox/pistol_35,
					/obj/item/ammo_magazine/ammobox/pistol_35,
					/obj/item/ammo_magazine/ammobox/pistol_35,
					/obj/item/ammo_magazine/pistol_35,
					/obj/item/ammo_magazine/pistol_35,
					/obj/item/ammo_magazine/pistol_35,
					/obj/item/ammo_magazine/speed_loader_pistol_35,
					/obj/item/ammo_magazine/speed_loader_pistol_35,
					/obj/item/ammo_magazine/speed_loader_pistol_35)
	cost = 650
	crate_name = "HS .35 ammunition crate"
	group = "Enforcement"

/datum/supply_pack/thirtyfive_ammo_nl
	name = "HS .35 Handgun Non-Lethal Ammunition Crate"
	contains = list(/obj/item/ammo_magazine/ammobox/pistol_35/rubber,
					/obj/item/ammo_magazine/ammobox/pistol_35/rubber,
					/obj/item/ammo_magazine/ammobox/pistol_35/rubber,
					/obj/item/ammo_magazine/pistol_35/rubber,
					/obj/item/ammo_magazine/pistol_35/rubber,
					/obj/item/ammo_magazine/pistol_35/rubber,
					/obj/item/ammo_magazine/speed_loader_pistol_35/rubber,
					/obj/item/ammo_magazine/speed_loader_pistol_35/rubber,
					/obj/item/ammo_magazine/speed_loader_pistol_35/rubber)
	cost = 450
	crate_name = "HS .35 Non-Lethal ammunition crate"
	group = "Enforcement"

/datum/supply_pack/fourty_ammo
	name = "HS .40 Ammunition Crate"
	contains = list(/obj/item/ammo_magazine/ammobox/magnum_40,
					/obj/item/ammo_magazine/ammobox/magnum_40,
					/obj/item/ammo_magazine/ammobox/magnum_40,
					/obj/item/ammo_magazine/magnum_40,
					/obj/item/ammo_magazine/magnum_40,
					/obj/item/ammo_magazine/magnum_40,
					/obj/item/ammo_magazine/speed_loader_magnum_40,
					/obj/item/ammo_magazine/speed_loader_magnum_40,
					/obj/item/ammo_magazine/speed_loader_magnum_40)
	cost = 750
	crate_name = "HS .40 ammunition crate"
	group = "Enforcement"

/datum/supply_pack/fourty_ammo_nl
	name = "HS .40 Non-Lethal Ammunition Crate"
	contains = list(/obj/item/ammo_magazine/ammobox/magnum_40/rubber,
					/obj/item/ammo_magazine/ammobox/magnum_40/rubber,
					/obj/item/ammo_magazine/ammobox/magnum_40/rubber,
					/obj/item/ammo_magazine/magnum_40/rubber,
					/obj/item/ammo_magazine/magnum_40/rubber,
					/obj/item/ammo_magazine/magnum_40/rubber,
					/obj/item/ammo_magazine/speed_loader_magnum_40/rubber,
					/obj/item/ammo_magazine/speed_loader_magnum_40/rubber,
					/obj/item/ammo_magazine/speed_loader_magnum_40/rubber)
	cost = 550
	crate_name = "HS .40 Non-Lethal ammunition crate"
	group = "Enforcement"

/datum/supply_pack/kurz_ammo
	name = "HS .50 Kurz Ammunition Crate"
	contains = list(/obj/item/ammo_magazine/ammobox/kurz_50,
					/obj/item/ammo_magazine/ammobox/kurz_50,
					/obj/item/ammo_magazine/ammobox/kurz_50,
					/obj/item/ammo_magazine/kurz_50,
					/obj/item/ammo_magazine/kurz_50,
					/obj/item/ammo_magazine/kurz_50,
					/obj/item/ammo_magazine/speed_loader_kurz_50,
					/obj/item/ammo_magazine/speed_loader_kurz_50,
					/obj/item/ammo_magazine/speed_loader_kurz_50)
	cost = 950
	crate_name = "HS .50 Kurz ammunition crate"
	group = "Enforcement"

/datum/supply_pack/kurz_ammo_nl
	name = "HS .50 Kurz Less-Than-Lethal Ammunition Crate"
	contains = list(/obj/item/ammo_magazine/ammobox/kurz_50,
					/obj/item/ammo_magazine/ammobox/kurz_50,
					/obj/item/ammo_magazine/ammobox/kurz_50,
					/obj/item/ammo_magazine/kurz_50,
					/obj/item/ammo_magazine/kurz_50,
					/obj/item/ammo_magazine/kurz_50,
					/obj/item/ammo_magazine/speed_loader_kurz_50,
					/obj/item/ammo_magazine/speed_loader_kurz_50,
					/obj/item/ammo_magazine/speed_loader_kurz_50)
	cost = 750
	crate_name = "HS .50 Kurz Less-Than-Lethal ammunition crate"
	group = "Enforcement"

/datum/supply_pack/ammo_disks_1
	name = "SA Always prepared Ammunition Disks Pack"
	contains = list(/obj/item/pc_part/drive/disk/design/lethal_ammo,
					/obj/item/pc_part/drive/disk/design/ammo_boxes_rifle)
	cost = 2200
	crate_name = "Standard Ammunition Disks Crate"
	group = "Enforcement"


/datum/supply_pack/rifle_75and257
	name = "Rifle and Carbine Ammunition Pack"
	contains = list(/obj/item/ammo_magazine/rifle_75,
					/obj/item/ammo_magazine/rifle_75,
					/obj/item/ammo_magazine/ammobox/rifle_75,
					/obj/item/ammo_magazine/ammobox/light_rifle_257,
					/obj/item/ammo_magazine/light_rifle_257,
					/obj/item/ammo_magazine/light_rifle_257)

	cost = 980
	crate_name = "7.5mm and .257 Ammunition Crate"
	group = "Enforcement"


/datum/supply_pack/Heavyrifle_ammo
	name = "Heavy Rifle Ammunition Pack"
	contains = list(/obj/item/ammo_magazine/heavy_rifle_408,
					/obj/item/ammo_magazine/heavy_rifle_408,
					/obj/item/ammo_magazine/ammobox/heavy_rifle_408,
					/obj/item/ammo_magazine/ammobox/heavy_rifle_408)

	cost = 1200
	crate_name = "Heavy Rifle Ammunition Crate"
	group = "Enforcement"

/datum/supply_pack/exotic_ammo_disk
	name = "SA Exotic Ammunition Disk Pack"
	contains = list(/obj/item/pc_part/drive/disk/design/exotic_ammo)

	cost = 1500
	crate_name = "Exotic Ammunition Disk Crate"
	group = "Enforcement"

/datum/supply_pack/ntweapons
	name = "CA Energy Weapons Crate"
	contains = list(/obj/item/gun/energy/laser,
				/obj/item/gun/energy/laser,
				/obj/item/gun/energy/ntpistol,
				/obj/item/gun/energy/ntpistol,
				/obj/item/gun/energy/taser,
				/obj/item/gun/energy/taser)
	cost = 4000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "CA energy weapons crate"
	group = "Enforcement"

/datum/supply_pack/eweapons
	name = "Incendiary Weapons Crate"
	contains = list(/obj/item/flamethrower/full,
					/obj/item/tank/plasma,
					/obj/item/tank/plasma,
					/obj/item/tank/plasma,
					/obj/item/grenade/chem_grenade/incendiary,
					/obj/item/grenade/chem_grenade/incendiary,
					/obj/item/grenade/chem_grenade/incendiary)
	cost = 2000
	containertype = /obj/structure/closet/crate/secure/weapon
	crate_name = "incendiary weapons crate"
	group = "Enforcement"

/datum/supply_pack/shotgunammo_beanbag
	name = "HS Beanbag Shells Crate"
	contains = list(/obj/item/ammo_magazine/ammobox/shotgun/beanbags,
					/obj/item/ammo_magazine/ammobox/shotgun/beanbags,
					/obj/item/ammo_magazine/ammobox/shotgun/beanbags,
					/obj/item/ammo_magazine/ammobox/shotgun/beanbags,
					/obj/item/ammo_magazine/ammobox/shotgun/beanbags)
	cost = 800
	crate_name = "HS beanbag shells crate"
	group = "Enforcement"

/datum/supply_pack/shotgunammo_slug
	name = "HS Slug Shells Crate"
	contains = list(/obj/item/ammo_magazine/ammobox/shotgun,
					/obj/item/ammo_magazine/ammobox/shotgun,
					/obj/item/ammo_magazine/ammobox/shotgun,
					/obj/item/ammo_magazine/ammobox/shotgun,
					/obj/item/ammo_magazine/ammobox/shotgun)
	cost = 1200
	containertype = /obj/structure/closet/crate/secure
	crate_name = "HS slug shells crate"
	group = "Enforcement"

/datum/supply_pack/shotgunammo_buckshot
	name = "HS Buckshot Shells Crate"
	contains = list(/obj/item/ammo_magazine/ammobox/shotgun/buckshot,
					/obj/item/ammo_magazine/ammobox/shotgun/buckshot,
					/obj/item/ammo_magazine/ammobox/shotgun/buckshot,
					/obj/item/ammo_magazine/ammobox/shotgun/buckshot,
					/obj/item/ammo_magazine/ammobox/shotgun/buckshot)
	cost = 1200
	containertype = /obj/structure/closet/crate/secure
	crate_name = "HS buckshot shells crate"
	group = "Enforcement"


//UTILITY
/datum/supply_pack/Enforcementbarriers
	name = "Enforcement Barrier Crate"
	contains = list(/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier,
					/obj/machinery/deployable/barrier)
	cost = 1600
	containertype = /obj/structure/closet/crate/secure/gear
	crate_name = "Marshal Enforcement barrier crate"
	group = "Enforcement"

/datum/supply_pack/Enforcementwallshield
	name = "Wall Shield Generators Crate"
	contains = list(/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen,
					/obj/machinery/shieldwallgen)
	cost = 1600
	containertype = /obj/structure/closet/crate/secure
	crate_name = "wall shield generators crate"
	group = "Enforcement"

//GUN MODS
/datum/supply_pack/gunmods
	name = "Random Gun Mod Crate"
	contains = list(/obj/random/dungeon_gun_mods,
					/obj/random/dungeon_gun_mods,
					/obj/random/dungeon_gun_mods,
					/obj/random/dungeon_gun_mods,
					/obj/random/dungeon_gun_mods)
	cost = 600
	containertype = /obj/structure/closet/crate/secure
	crate_name = "gun mod crate"
	group = "Enforcement"


//XANAROTH
//This crate is unaffected by price changes since its from krios, not pirates.
/datum/supply_pack/assaultsuit
	name = "Assault Armor"
	contains = list(/obj/item/clothing/suit/space/void/assault)
	cost = 20000
	containertype = /obj/structure/closet/crate/secure
	crate_name = "assault armor crate"
	group = "Enforcement"

//Putting the void wolf stuff here so its easier to remove later, if needed.
/datum/supply_pack/voidwolfrifles
	name = "Void Wolf Rifles Crate"
	contains = list(/obj/item/gun/projectile/automatic/ak47/sa,
					/obj/item/gun/projectile/automatic/ak47/sa,
					/obj/item/gun/projectile/automatic/ak47/sa,
					/obj/item/gun/projectile/automatic/ak47/sa)
	cost = 2000
	containertype = /obj/structure/closet/crate/serbcrate_gray
	crate_name = "Void Wolf Rifles Crate"
	group = "Xanorath Syndicate"

/datum/supply_pack/voidwolfflamer
	name = "Void Wolf HellFire Crate"
	contains = list(/obj/item/gun/flamethrower,
					/obj/item/weldpack/canister/flamethrower)
	cost = 3500
	containertype = /obj/structure/closet/crate/serbcrate_gray
	crate_name = "Void Wolf HellFire Crate"
	group = "Xanorath Syndicate"


/datum/supply_pack/voidwolfmarksman
	name = "Void Marksman Kit"
	contains = list(/obj/item/gun/projectile/boltgun/scout,
					/obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/hv,
					/obj/item/gun_upgrade/barrel/gauss)

	cost = 1600
	crate_name = "Void Wolf Marksman Kit"
	group = "Xanorath Syndicate"

/datum/supply_pack/voidwolfflamer_ammo
	name = "Void Wolf HellFire Canisters Crate"
	contains = list(/obj/item/weldpack/canister/flamethrower,
					/obj/item/weldpack/canister/flamethrower,
					/obj/item/weldpack/canister/flamethrower,
					/obj/item/weldpack/canister/flamethrower,
					/obj/item/weldpack/canister/flamethrower)
	cost = 750
	containertype = /obj/structure/closet/crate/serbcrate_gray
	crate_name = "Void Wolf HellFire Canisters Crate"
	group = "Xanorath Syndicate"

/datum/supply_pack/voidwolfdrugs
	name = "Void Wolf Recreations Crate"
	contains = list(/obj/item/reagent_containers/hypospray/autoinjector/drugs,
					/obj/item/reagent_containers/hypospray/autoinjector/drugs,
					/obj/item/reagent_containers/syringe/drugs,
					/obj/item/reagent_containers/syringe/drugs,
					/obj/item/reagent_containers/pill/zoom,
					/obj/item/reagent_containers/pill/happy,
					/obj/item/seeds/ambrosiadeusseed,
					/obj/item/seeds/ambrosiavulgarisseed,
					/obj/item/reagent_containers/snacks/grown/ambrosiadeus,
					/obj/item/reagent_containers/snacks/grown/ambrosiadeus,
					/obj/item/reagent_containers/snacks/grown/ambrosiadeus,
					/obj/item/reagent_containers/snacks/grown/ambrosiavulgaris,
					/obj/item/reagent_containers/snacks/grown/ambrosiavulgaris,
					/obj/item/reagent_containers/snacks/grown/ambrosiavulgaris)
	cost = 600
	containertype = /obj/structure/closet/crate/serbcrate
	crate_name = "Void Wolf Recreations Crate"
	group = "Xanorath Syndicate"

/datum/supply_pack/voidwolfgunmod
	name = "Void Wolf Gun-Mod Crate"
	contains = list(/obj/item/gun_upgrade/scope/killer,
					/obj/item/gun_upgrade/trigger/boom,
					/obj/item/gun_upgrade/barrel/gauss,
					/obj/item/gun_upgrade/mechanism/reverse_loader,
					/obj/item/gun_upgrade/trigger/dangerzone)
	cost = 800
	containertype = /obj/structure/closet/crate/serbcrate_gray
	crate_name = "Void Wolf Gun-Mod Crate"
	group = "Xanorath Syndicate"

/datum/supply_pack/voidwolfswords
	name = "Void Wolf Energy Swords Crate"
	contains = list(/obj/item/melee/energy/sword/pirate,
					/obj/item/melee/energy/sword/pirate,
					/obj/item/melee/energy/sword/pirate,
					/obj/item/melee/energy/sword/pirate)
	cost = 2000
	containertype = /obj/structure/closet/crate/serbcrate_gray
	crate_name = "Void Wolf Energy Swords Crate"
	group = "Xanorath Syndicate"

/datum/supply_pack/voidwolfarmor
	name = "Void Wolf Red Armor Crate"
	contains = list(/obj/item/clothing/suit/space/void/merc/xanorath,
					/obj/item/clothing/suit/space/void/merc/xanorath,
					/obj/item/clothing/suit/space/void/merc/xanorath)
	cost = 1500
	containertype = /obj/structure/closet/crate/serbcrate_gray
	crate_name = "Void Wolf Red Armor Crate"
	group = "Xanorath Syndicate"
/*
//Sold for actual value, given its explosive, very powerful, and difficult to get ammo for. -Kaz
/datum/supply_pack/voidwolfemporer
	name = "Void Wolf Emporer Crate"
	contains = list(/obj/item/gun/projectile/gyropistol,
					/obj/item/ammo_magazine/a75,
					/obj/item/ammo_magazine/a75)
	cost = 1500
	containertype = /obj/structure/closet/crate/serbcrate_gray
	crate_name = "Void Wolf Emporer Crate"
	group = "Xanorath Syndicate"
*/
