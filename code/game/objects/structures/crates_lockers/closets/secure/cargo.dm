/obj/structure/closet/secure_closet/personal/cargotech
	name = "cargo technician's locker"
	req_access = list(access_merchant)
	access_occupy = list(access_cargo)
	icon_state = "cargo"

/obj/structure/closet/secure_closet/personal/cargotech/populate_contents()
	new /obj/item/clothing/under/rank/cargotech(src)
	new /obj/item/clothing/shoes/color/black(src)
	new /obj/item/device/radio/headset/headset_cargo(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/clothing/head/soft(src)
	new /obj/item/device/scanner/price(src)
	if(prob(30))
		new /obj/item/storage/backpack/satchel/industrial(src)
	else if(prob(50))
		new /obj/item/storage/backpack/industrial(src)
	else if(prob(50))
		new /obj/item/storage/backpack/duffelbag(src)
	else if(prob(75))
		new /obj/item/storage/backpack/military(src)
	else
		new /obj/item/storage/backpack/holding(src)
	if(prob(45))
		new /obj/item/gun/projectile/revolver/detective(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
	if(prob(45))
		new /obj/item/gun/projectile/giskard(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
	if(prob(25))
		new /obj/item/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
	if(prob(45))
		new /obj/item/storage/pouch/small_generic(src)
	if(prob(35))
		new /obj/item/storage/pouch/medium_generic(src)
	if(prob(25))
		new /obj/item/storage/pouch/large_generic(src)
	if(prob(55))
		new /obj/item/storage/firstaid/regular(src)
	if(prob(40))
		new /obj/item/storage/firstaid/adv(src)
	if(prob(65))
		new /obj/item/reagent_containers/syringe/stim/turbo(src)
	if(prob(65))
		new /obj/item/reagent_containers/syringe/stim/boxer(src)
	if(prob(65))
		new /obj/item/reagent_containers/syringe/stim/violence_ultra(src)
	if(prob(15))
		new /obj/item/gun/projectile/silenced/rat(src)
	if(prob(15))
		new /obj/item/oddity/common/old_money(src)
	if(prob(15))
		new /obj/item/oddity/common/old_id(src)
	if(prob(15))
		new /obj/item/oddity/common/old_newspaper(src)
	if(prob(15))
		new /obj/item/oddity/common/old_pda(src)
	if(prob(15))
		new /obj/item/oddity/common/old_radio(src)
	if(prob(15))
		new /obj/item/tool/polytool(src)

/obj/structure/closet/secure_closet/reinforced/quartermaster
	name = "chief executive officer's locker"
	req_access = list(access_merchant)
	icon_state = "qm"

/obj/structure/closet/secure_closet/reinforced/quartermaster/populate_contents()
	new /obj/item/clothing/under/rank/cargotech(src)
	new /obj/item/clothing/shoes/color/brown(src)
	new /obj/item/device/radio/headset/headset_cargo(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/clothing/suit/fire(src)
	new /obj/item/tank/emergency_oxygen(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/glasses/powered/meson(src)
	new /obj/item/clothing/head/soft(src)
	new /obj/item/device/scanner/price(src)
	new /obj/item/gun/projectile/revolver/little_comet(src)
	new /obj/item/gun_upgrade/mechanism/glass_widow(src)
	new /obj/item/ammo_magazine/ammobox/pistol_35(src)
	new /obj/item/ammo_magazine/ammobox/pistol_35/rubber(src)

//Prospector gear, you'll notice it is immensely heavily randomized, this is intentional to add some replayibility to prospector starts.
//To anyone editing this, I advise using if statements over switch to better have control of what loot spawns, it rolls each in order of success so you can better set the odds.
//The lockers are set to personal to prevent prospectors from opening every locker in an effort to get the best gear rolls. -Kazkin
/obj/structure/closet/secure_closet/personal/prospector
	name = "prospector locker"
	req_access = list(access_foreman)
	access_occupy = list(access_prospector)
	icon_state = "mining"

/obj/structure/closet/secure_closet/personal/prospector/populate_contents()
	new /obj/item/device/radio/headset/headset_pro(src)
	new /obj/item/clothing/accessory/cape/scav(src)
	if(prob(70))
		new /obj/item/storage/backpack/satchel/industrial(src)
	else if(prob(80))
		new /obj/item/storage/backpack/industrial(src)
	else if(prob(80))
		new /obj/item/storage/backpack/duffelbag(src)
	else if(prob(90))
		new /obj/item/storage/backpack/military(src)
	else
		new /obj/item/storage/backpack/holding(src)
	//armor
	if(prob(80))
		new /obj/item/clothing/suit/storage/scavengerarmor(src)
		new /obj/item/clothing/head/space/void/riggedvoidsuit(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else if(prob(70))
		new /obj/item/clothing/suit/armor/platecarrier(src)
		new /obj/item/clothing/head/helmet/ballistic(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else if(prob(70))
		new /obj/item/clothing/suit/armor/heavy/riot(src)
		new /obj/item/clothing/head/helmet/faceshield/riot(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else
		new /obj/item/clothing/suit/armor/laserproof(src)
		new /obj/item/clothing/head/helmet/visor/cyberpunkgoggle(src) //shitty helmet but it looks cool with the vest
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	//longarms
	if(prob(75))
		new /obj/item/gun/projectile/automatic/luger(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
	else if(prob(75))
		new /obj/item/gun/projectile/automatic/bren(src)
		new /obj/item/ammo_magazine/light_rifle_257(src)
		new /obj/item/ammo_magazine/light_rifle_257(src)
	else if(prob(50))
		new /obj/item/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
	else if(prob(50))
		new /obj/item/gun/projectile/boltgun/sa(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
	else
		new /obj/item/gun/projectile/boltgun(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
	//pistols
	new /obj/item/gun/projectile/automatic/slaught_o_matic(src)
	if(prob(30))
		new /obj/item/gun/projectile/revolver/detective(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
	else if(prob(40))
		new /obj/item/gun/projectile/giskard(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
	else if(prob(50))
		new /obj/item/gun/projectile/mk58(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
	else
		new /obj/item/gun/projectile/avasarala(src)
		new /obj/item/ammo_magazine/kurtz_50(src)
		new /obj/item/ammo_magazine/kurtz_50(src)
	//melee
	if(prob(75)) //Mostly standard issue machete with a holster but you have a small chance to get a much better item.
		new /obj/item/clothing/accessory/holster/saber/machete(src)
		new /obj/item/tool/sword/machete(src)
	else if(prob(55))
		new /obj/item/tool/sword/katana(src)
	else if(prob(55))
		new /obj/item/tool/hammer/powered_hammer(src)
	else
		new /obj/item/tool/saw/chain(src)
	//Regular spawns
	new /obj/item/tool/knife/dagger(src)
	if(prob(50))
		new /obj/item/gun/projectile/boltgun/flare_gun(src)
		if(prob(50))
			new /obj/item/ammo_casing/flare/blue/prespawn(src)
		else if(prob(50))
			new /obj/item/ammo_casing/flare/green/prespawn(src)
		else
			new /obj/item/ammo_casing/flare/prespawn(src)
	else
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)
	if(prob(25))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)
	if(prob(15))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)


//Salvager lockers have less potential combat power by capped potential while still balancing with the most likely to spawn gear.
//In return they get tools and medical supplies depending on luck with the potential of getting some seriously good spawns. -Kaz
/obj/structure/closet/secure_closet/personal/salvager
	name = "salvager locker"
	req_access = list(access_foreman)
	access_occupy = list(access_prospector)
	icon_state = "med"

/obj/structure/closet/secure_closet/personal/salvager/populate_contents()
	new /obj/item/device/radio/headset/headset_pro(src)
	new /obj/item/clothing/accessory/cape/scav(src)
	if(prob(70))
		new /obj/item/storage/backpack/satchel/medical(src)
	else if(prob(65))
		new /obj/item/storage/backpack/medical(src)
	else if(prob(65))
		new /obj/item/storage/backpack/duffelbag(src)
	else if(prob(90))
		new /obj/item/storage/backpack/military(src)
	else
		new /obj/item/storage/backpack/holding(src)
	//armor
	new /obj/item/clothing/suit/storage/scavengerarmor(src)
	new /obj/item/clothing/head/space/void/riggedvoidsuit(src)
	//longarms
	if(prob(80))
		new /obj/item/gun/projectile/automatic/luger(src)
		new /obj/item/ammo_magazine/smg_35(src)
		new /obj/item/ammo_magazine/smg_35(src)
	else if(prob(75))
		new /obj/item/gun/projectile/automatic/bren(src)
		new /obj/item/ammo_magazine/light_rifle_257(src)
		new /obj/item/ammo_magazine/light_rifle_257(src)
	else
		new /obj/item/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
	//pistols
	new /obj/item/gun/projectile/automatic/slaught_o_matic(src)
	if(prob(30))
		new /obj/item/gun/projectile/revolver/detective(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
	else if(prob(40))
		new /obj/item/gun/projectile/giskard(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
	else if(prob(40))
		new /obj/item/gun/projectile/mk58(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
	else
		new /obj/item/gun/projectile/olivaw(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
	//melee
	if(prob(80)) //Mostly standard issue machete with a holster but you have a small chance to get a much better item.
		new /obj/item/clothing/accessory/holster/saber/machete(src)
		new /obj/item/tool/sword/machete(src)
	else if(prob(60))
		new /obj/item/tool/sword/katana(src)
	else if(prob(60))
		new /obj/item/tool/hammer/powered_hammer(src)
	else
		new /obj/item/tool/saw/chain(src)
	//Regular Spawns
	new /obj/item/device/radio/headset/headset_pro(src)
	new /obj/item/tool/knife/dagger(src)
	if(prob(50))
		new /obj/item/gun/projectile/boltgun/flare_gun(src)
		if(prob(50))
			new /obj/item/ammo_casing/flare/blue/prespawn(src)
		else if(prob(50))
			new /obj/item/ammo_casing/flare/green/prespawn(src)
		else
			new /obj/item/ammo_casing/flare/prespawn(src)
	else
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)
	//Salvager
	if(prob(90))
		new /obj/item/storage/belt/utility/full(src)
	else
		new /obj/item/storage/belt/utility/handmade/full(src)
	new /obj/item/storage/firstaid/regular(src)
	if(prob(90))
		new /obj/item/storage/firstaid/ifak(src)
	if(prob(80))
		new /obj/item/storage/firstaid/adv(src)
	else
		new /obj/item/storage/firstaid/combat(src)
	new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)
	if(prob(50))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)
	if(prob(20))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)


//Foremans can technically do the jobs of both prospectors and salvagers (but not as well) and as such have better odds on the gear they start with.
//Still based on proability but hey, at least you get it all. -Kaz
/obj/structure/closet/secure_closet/reinforced/foreman
	name = "foreman's locker"
	req_access = list(access_foreman)
	icon_state = "qm"

/obj/structure/closet/secure_closet/reinforced/foreman/populate_contents()
	new /obj/item/device/radio/headset/heads/foreman(src)
	new /obj/item/clothing/accessory/cape/scav(src)
	new /obj/item/computer_hardware/hard_drive/portable/design/scav/forman(src)
	if(prob(60))
		new /obj/item/storage/backpack/satchel/industrial(src)
	else if(prob(50))
		new /obj/item/storage/backpack/industrial(src)
	else if(prob(60))
		new /obj/item/storage/backpack/duffelbag(src)
	else if(prob(95))
		new /obj/item/storage/backpack/military(src)
	else
		new /obj/item/storage/backpack/holding(src)
	//armor
	if(prob(65))
		new /obj/item/clothing/suit/storage/scavengerarmor(src)
		new /obj/item/clothing/head/space/void/riggedvoidsuit(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else if(prob(60))
		new /obj/item/clothing/suit/armor/platecarrier(src)
		new /obj/item/clothing/head/helmet/ballistic(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else if(prob(80))
		new /obj/item/clothing/suit/armor/heavy/riot(src)
		new /obj/item/clothing/head/helmet/faceshield/riot(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else
		new /obj/item/clothing/suit/armor/laserproof(src)
		new /obj/item/clothing/head/helmet/visor/cyberpunkgoggle(src) //shitty helmet but it looks cool with the vest
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	//longarms
	if(prob(60))
		new /obj/item/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
	else if(prob(60))
		new /obj/item/gun/projectile/boltgun/sa(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
	else
		new /obj/item/gun/projectile/boltgun(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
	//pistols
	new /obj/item/gun/projectile/automatic/slaught_o_matic(src) //has silver eye
	//melee
	if(prob(75)) //Mostly standard issue machete with a holster but you have a small chance to get a much better item.
		new /obj/item/clothing/accessory/holster/saber/machete(src)
		new /obj/item/tool/sword/machete(src)
	else
		new /obj/item/tool/power_fist(src)
	//Regular spawns
	new /obj/item/tool/knife/dagger(src)
	if(prob(70))
		new /obj/item/gun/projectile/boltgun/flare_gun(src)
		new /obj/item/ammo_casing/flare/blue/prespawn(src)
		new /obj/item/ammo_casing/flare/green/prespawn(src)
		new /obj/item/ammo_casing/flare/prespawn(src)
	else
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)
	new /obj/item/clothing/head/helmet/foreman(src)
	new /obj/item/clothing/suit/storage/vest/scav(src)
	new /obj/item/gun/projectile/silvereye(src)
	new /obj/item/ammo_magazine/kurtz_50/hv(src)
	new /obj/item/ammo_magazine/kurtz_50/hv(src)
	new /obj/item/ammo_magazine/kurtz_50/hv(src)
	new /obj/item/ammo_magazine/ammobox/kurtz_50/hv(src)
	//Salvager improved
	new /obj/item/storage/belt/utility/full(src)
	new /obj/item/storage/firstaid/regular(src)
	if(prob(60))
		new /obj/item/storage/firstaid/ifak(src)
	else if(prob(70))
		new /obj/item/storage/firstaid/adv(src)
	else
		new /obj/item/storage/firstaid/combat(src)
	if(prob(40))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)
	if(prob(20))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)


/obj/structure/closet/secure_closet/personal/artist
	name = "lonestar artist's locker"
	req_access = list(access_theatre)
	access_occupy = list(access_cargo)
	icon_state = "cargo"

/obj/structure/closet/secure_closet/personal/artist/populate_contents()
	new/obj/item/clothing/suit/artist(src)
	new/obj/item/clothing/under/rank/artist(src)
	new/obj/item/clothing/suit/artist(src)
	new/obj/item/clothing/shoes/artist_shoes(src)
	new/obj/item/clothing/head/beret/artist(src)
	new/obj/item/clothing/glasses/artist(src)
	new/obj/item/clothing/mask/gas/artist_hat(src)
	new/obj/item/device/radio/headset/headset_cargo(src)
	new/obj/item/circuitboard/artist_bench(src)
	new/obj/item/storage/pouch/grow_a_gun(src)

/obj/structure/closet/wardrobe/color/pink/artist

/obj/structure/closet/wardrobe/color/pink/artist/populate_contents()
	//new/obj/item/clothing/under/mime(src)
	new/obj/item/clothing/shoes/color/black(src)
	new/obj/item/clothing/gloves/color/white(src)
	//new/obj/item/clothing/mask/gas/mime(src)
	new/obj/item/clothing/head/beret(src)
	new/obj/item/pen/crayon/mime(src)
	new/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing(src)
	new/obj/item/bikehorn(src)
	new/obj/item/clothing/glasses/monocle(src)
	new/obj/item/storage/fancy/crayons(src)
	new/obj/item/reagent_containers/spray/waterflower(src)
	new/obj/item/device/pda/clown(src)
	new/obj/item/storage/pouch/grow_a_gun(src)
	//new/obj/item/clothing/mask/gas/plaguedoctor(src)
	new/obj/item/clothing/gloves/color/green(src)
	//new/obj/item/clothing/gloves/color/rainbow(src)
	new/obj/item/storage/backpack/clown(src)
	//new/obj/item/clothing/shoes/clown_shoes(src)
	//new/obj/item/clothing/under/rank/clown(src)
	new/obj/item/clothing/mask/gas/clown_hat(src)
