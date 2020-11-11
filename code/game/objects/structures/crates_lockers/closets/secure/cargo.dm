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
	new /obj/item/weapon/tank/emergency_oxygen(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/glasses/powered/meson(src)
	new /obj/item/clothing/head/soft(src)
	new /obj/item/device/scanner/price(src)
	new /obj/item/weapon/gun/projectile/revolver/little_comet(src)
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
	if(prob(50))
		new /obj/item/weapon/storage/backpack/satchel/industrial(src)
	else if(prob(75))
		new /obj/item/weapon/storage/backpack/industrial(src)
	else if(prob(75))
		new /obj/item/weapon/storage/backpack/duffelbag(src)
	else if(prob(95))
		new /obj/item/weapon/storage/backpack/military(src)
	else
		new /obj/item/weapon/storage/backpack/holding(src)
	//armor
	if(prob(80)) //Prospector has slightly better chance at getting good armor
		new /obj/item/clothing/suit/armor/vest/handmade_black(src)
		new /obj/item/clothing/gloves/thick/handmade(src)
	else if(prob(80))
		new /obj/item/clothing/suit/armor/vest(src)
		new /obj/item/clothing/head/helmet(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else if(prob(80))
		new /obj/item/clothing/suit/armor/platecarrier(src)
		new /obj/item/clothing/head/helmet/ballistic(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else if(prob(80))
		new /obj/item/clothing/suit/armor/heavy/riot(src)
		new /obj/item/clothing/head/helmet/riot(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else
		new /obj/item/clothing/suit/armor/laserproof(src)
		new /obj/item/clothing/head/helmet/helmet/visor/cyberpunkgoggle(src) //shitty helmet but it looks cool with the vest
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	//longarms
	if(prob(50))
		new /obj/item/weapon/gun/energy/shrapnel(src)
		new /obj/item/weapon/cell/medium/high(src)
		new /obj/item/weapon/cell/medium/high(src)
	else if(prob(50))
		new /obj/item/weapon/gun/energy/lasersmg(src)
		new /obj/item/weapon/cell/medium/high(src)
		new /obj/item/weapon/cell/medium/high(src)
	else if(prob(50))
		new /obj/item/weapon/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
	else if(prob(50))
		new /obj/item/weapon/gun/projectile/boltgun/sa(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
	else
		new /obj/item/weapon/gun/projectile/boltgun(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
	//pistols
	if(prob(50)) //Coin toss off the bat if you get fucked on pistol spawns, encourages prospies to by from sec armory
		new /obj/item/weapon/gun/projectile/handmade_pistol(src)
	else if(prob(50))
		new /obj/item/weapon/gun/projectile/revolver/detective(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
	else if(prob(50))
		new /obj/item/weapon/gun/projectile/giskard(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/ammo_magazine/pistol_35(src)
	else if(prob(50))
		new /obj/item/weapon/gun/projectile/mk58(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/ammo_magazine/pistol_35(src)
	else
		new /obj/item/weapon/gun/projectile/olivaw(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/ammo_magazine/pistol_35(src)
	//melee
	if(prob(90)) //Mostly standard issue machete with a holster but you have a small chance to get a much better item.
		new /obj/item/clothing/accessory/holster/saber/machete(src)
		new /obj/item/weapon/tool/sword/machete(src)
	else if(prob(70))
		new /obj/item/weapon/tool/sword/katana(src)
	else if(prob(70))
		new /obj/item/weapon/tool/hammer/powered_hammer(src)
	else
		new /obj/item/weapon/tool/saw/chain(src)
	//Regular spawns
	new /obj/item/weapon/tool/knife/dagger(src)
	new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)


//Salvager lockers have less potential combat power by capped potential while still balancing with the most likely to spawn gear.
//In return they get tools and medical supplies depending on luck with the potential of getting some seriously good spawns. -Kaz
/obj/structure/closet/secure_closet/personal/salvager
	name = "salvager locker"
	req_access = list(access_foreman)
	access_occupy = list(access_prospector)
	icon_state = "med"

/obj/structure/closet/secure_closet/personal/salvager/populate_contents()
	new /obj/item/device/radio/headset/headset_pro(src)
	if(prob(50))
		new /obj/item/weapon/storage/backpack/satchel/medical(src)
	else if(prob(75))
		new /obj/item/weapon/storage/backpack/medical(src)
	else if(prob(75))
		new /obj/item/weapon/storage/backpack/duffelbag(src)
	else if(prob(95))
		new /obj/item/weapon/storage/backpack/military(src)
	else
		new /obj/item/weapon/storage/backpack/holding(src)
	//armor
	if(prob(90)) //Low chance but if you get lucky you get an immediate step up in armor.
		new /obj/item/clothing/suit/armor/vest/handmade_black(src)
		new /obj/item/clothing/gloves/thick/handmade(src)
	else
		new /obj/item/clothing/suit/armor/vest(src)
		new /obj/item/clothing/head/helmet(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	//longarms
	if(prob(50))
		new /obj/item/weapon/gun/energy/shrapnel(src)
		new /obj/item/weapon/cell/medium/high(src)
		new /obj/item/weapon/cell/medium/high(src)
	else if(prob(50))
		new /obj/item/weapon/gun/energy/lasersmg(src)
		new /obj/item/weapon/cell/medium/high(src)
		new /obj/item/weapon/cell/medium/high(src)
	else
		new /obj/item/weapon/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
	//pistols
	if(prob(50)) //Coin toss off the bat if you get fucked on pistol spawns, encourages prospies to by from sec armory
		new /obj/item/weapon/gun/projectile/handmade_pistol(src)
	else if(prob(50))
		new /obj/item/weapon/gun/projectile/revolver/detective(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
	else if(prob(50))
		new /obj/item/weapon/gun/projectile/giskard(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/ammo_magazine/pistol_35(src)
	else if(prob(50))
		new /obj/item/weapon/gun/projectile/mk58(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/ammo_magazine/pistol_35(src)
	else
		new /obj/item/weapon/gun/projectile/olivaw(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/ammo_magazine/pistol_35(src)
	//melee
	if(prob(90)) //Mostly standard issue machete with a holster but you have a small chance to get a much better item.
		new /obj/item/clothing/accessory/holster/saber/machete(src)
		new /obj/item/weapon/tool/sword/machete(src)
	else if(prob(70))
		new /obj/item/weapon/tool/sword/katana(src)
	else if(prob(70))
		new /obj/item/weapon/tool/hammer/powered_hammer(src)
	else
		new /obj/item/weapon/tool/saw/chain(src)
	//Regular Spawns
	new /obj/item/device/radio/headset/headset_pro(src)
	new /obj/item/weapon/tool/knife/dagger(src)
	new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)
	//Salvager
	if(prob(90))
		new /obj/item/weapon/storage/belt/utility/handmade/full(src)
	else
		new /obj/item/weapon/storage/belt/utility/full(src)
	new /obj/item/weapon/storage/firstaid/regular(src)
	if(prob(80))
		new /obj/item/weapon/storage/firstaid/ifak(src)
	else if(prob(90))
		new /obj/item/weapon/storage/firstaid/adv(src)
	else
		new /obj/item/weapon/storage/firstaid/combat(src)


//Foremans can technically do the jobs of both prospectors and salvagers (but not as well) and as such have better odds on the gear they start with.
//Still based on proability but hey, at least you get it all. -Kaz
/obj/structure/closet/secure_closet/reinforced/foreman
	name = "foreman's locker"
	req_access = list(access_foreman)
	icon_state = "qm"

/obj/structure/closet/secure_closet/reinforced/foreman/populate_contents()
	new /obj/item/device/radio/headset/heads/foreman(src)
	if(prob(30))
		new /obj/item/weapon/storage/backpack/satchel/industrial(src)
	else if(prob(50))
		new /obj/item/weapon/storage/backpack/industrial(src)
	else if(prob(60))
		new /obj/item/weapon/storage/backpack/duffelbag(src)
	else if(prob(95))
		new /obj/item/weapon/storage/backpack/military(src)
	else
		new /obj/item/weapon/storage/backpack/holding(src)
	//armor
	if(prob(70)) //Low chance but if you get lucky you get an immediate step up in armor.
		new /obj/item/clothing/suit/armor/vest/handmade_black(src)
		new /obj/item/clothing/gloves/thick/handmade(src)
	else if(prob(60))
		new /obj/item/clothing/suit/armor/vest(src)
		new /obj/item/clothing/head/helmet(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else if(prob(60))
		new /obj/item/clothing/suit/armor/platecarrier(src)
		new /obj/item/clothing/head/helmet/ballistic(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else if(prob(80))
		new /obj/item/clothing/suit/armor/heavy/riot(src)
		new /obj/item/clothing/head/helmet/riot(src)
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	else
		new /obj/item/clothing/suit/armor/laserproof(src)
		new /obj/item/clothing/head/helmet/helmet/visor/cyberpunkgoggle(src) //shitty helmet but it looks cool with the vest
		new /obj/item/clothing/gloves/thick/combat(src)
		new /obj/item/clothing/shoes/combat(src)
	//longarms
	if(prob(30))
		new /obj/item/weapon/gun/energy/shrapnel(src)
		new /obj/item/weapon/cell/medium/high(src)
		new /obj/item/weapon/cell/medium/high(src)
	else if(prob(30))
		new /obj/item/weapon/gun/energy/lasersmg(src)
		new /obj/item/weapon/cell/medium/high(src)
		new /obj/item/weapon/cell/medium/high(src)
	else if(prob(30))
		new /obj/item/weapon/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
	else if(prob(30))
		new /obj/item/weapon/gun/projectile/boltgun/sa(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
	else
		new /obj/item/weapon/gun/projectile/boltgun(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
	//pistols
	if(prob(5)) //Coin toss off the bat if you get fucked on pistol spawns, encourages prospies to by from sec armory
		new /obj/item/weapon/gun/projectile/handmade_pistol(src)
	else if(prob(20))
		new /obj/item/weapon/gun/projectile/revolver/detective(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
	else if(prob(20))
		new /obj/item/weapon/gun/projectile/giskard(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/ammo_magazine/pistol_35(src)
	else if(prob(50))
		new /obj/item/weapon/gun/projectile/mk58(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/ammo_magazine/pistol_35(src)
	else
		new /obj/item/weapon/gun/projectile/olivaw(src)
		new /obj/item/ammo_magazine/pistol_35(src)
		new /obj/item/ammo_magazine/pistol_35(src)
	//melee
	if(prob(70)) //Mostly standard issue machete with a holster but you have a small chance to get a much better item.
		new /obj/item/clothing/accessory/holster/saber/machete(src)
		new /obj/item/weapon/tool/sword/machete(src)
	else if(prob(50))
		new /obj/item/weapon/tool/sword/katana(src)
	else if(prob(50))
		new /obj/item/weapon/tool/hammer/powered_hammer(src)
	else
		new /obj/item/weapon/tool/saw/chain(src)
	//Regular spawns
	new /obj/item/weapon/tool/knife/dagger(src)
	new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)
	//Salvager improved
	if(prob(30))
		new /obj/item/weapon/storage/belt/utility/handmade/full(src)
	else
		new /obj/item/weapon/storage/belt/utility/full(src)
	new /obj/item/weapon/storage/firstaid/regular(src)
	if(prob(60))
		new /obj/item/weapon/storage/firstaid/ifak(src)
	else if(prob(70))
		new /obj/item/weapon/storage/firstaid/adv(src)
	else
		new /obj/item/weapon/storage/firstaid/combat(src)