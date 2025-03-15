/obj/structure/closet/secure_closet/personal/cargotech
	name = "cargo technician's locker"
	req_access = list(access_merchant)
	access_occupy = list(access_cargo)
	icon_state = "cargo"

/obj/structure/closet/secure_closet/personal/cargotech/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
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
	if(prob(75))
		new /obj/item/gun/projectile/revolver/detective(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
		new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
	else
		new /obj/item/gun/projectile/revolver(src)
		new /obj/item/ammo_magazine/speed_loader_magnum_40(src)
		new /obj/item/ammo_magazine/speed_loader_magnum_40(src)
	if(prob(75))
		new /obj/item/gun/projectile/giskard(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
	else
		new /obj/item/gun/projectile/makarov(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
		new /obj/item/ammo_magazine/highcap_pistol_35(src)
	if(prob(25))
		new /obj/item/gun/projectile/shotgun/pump(src)
		new /obj/item/ammo_magazine/speed_loader_shotgun/pellet(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
	else
		new /obj/item/gun/projectile/shotgun/doublebarrel(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
	if(prob(65))
		new /obj/item/storage/pouch/small_generic(src)
	if(prob(65))
		new /obj/item/storage/pouch/medium_generic(src)
	if(prob(65))
		new /obj/random/pouch/always_spawn(src)
	if(prob(75))
		new /obj/item/storage/firstaid/regular(src)
	if(prob(65))
		new /obj/item/reagent_containers/syringe/stim/turbo(src)
		new /obj/item/reagent_containers/syringe/stim/boxer(src)
		new /obj/item/reagent_containers/syringe/stim/violence_ultra(src)
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
	new /obj/item/clothing/accessory/armband/cargo(src)

/obj/structure/closet/secure_closet/reinforced/quartermaster
	name = "surface operations manager's locker"
	req_access = list(access_merchant)
	icon_state = "qm"

/obj/structure/closet/secure_closet/reinforced/quartermaster/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
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
	new /obj/item/clothing/under/rank/cargotech(src)
	new /obj/item/clothing/shoes/color/brown(src)
	new /obj/item/device/radio/headset/headset_cargo(src)
	new /obj/item/clothing/gloves/thick(src)
	new /obj/item/clothing/accessory/halfcape/som(src)
	new /obj/item/tank/emergency_oxygen(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/clothing/glasses/powered/meson(src)
	new /obj/item/clothing/head/soft(src)
	new /obj/item/device/scanner/price(src)
	new /obj/item/gun/projectile/revolver/little_comet(src)
	new /obj/item/gun_upgrade/mechanism/glass_widow(src)
	new /obj/item/ammo_magazine/ammobox/pistol_35(src)
	new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
	new /obj/item/ammo_magazine/ammobox/pistol_35/rubber(src)
	new /obj/item/ammo_magazine/speed_loader_pistol_35/rubber(src)
	new /obj/item/stack/os_cash/random(src)
	new /obj/item/direct_line(src)
	new /obj/item/tool/omnitool(src)
	new /obj/item/pc_part/drive/disk/design/cargo(src)

//Prospector gear, you'll notice it is immensely heavily randomized, this is intentional to add some replayibility to prospector starts.
//To anyone editing this, I advise using if statements over switch to better have control of what loot spawns, it rolls each in order of success so you can better set the odds.
//The lockers are set to personal to prevent prospectors from opening every locker in an effort to get the best gear rolls. -Kazkin
/obj/structure/closet/secure_closet/personal/prospector
	name = "prospector locker"
	req_access = list(access_foreman)
	access_occupy = list(access_prospector)
	icon_state = "prospector" // Mixed dirt/jungle camo for the soul, since they usually brave the jungle a lot. - Seb
	var/main_weapon_cache
	var/side_arm_cache
	var/melee_cache
	var/armor_cache
	var/bag_cache


/obj/structure/closet/secure_closet/personal/prospector/proc/gain_rng()
	main_weapon_cache = pickweight(list("SMG" = 18, "SHOTGUN" = 8, "RIFLE" = 6, "EGUN" = 15, "WILDCARDS" = 8, "SHORT_WILDCARDS" = 12))
	side_arm_cache = pickweight(list("PISTOL" = 16, "REVOLVER" = 8, "GOOD_PISTOL" = 10, "HEAVY_PISTOL" = 2, "EGUN_P" = 4))
	melee_cache = pickweight(list("MACHETE" = 18, "LONGSWORD" = 12, "KATANA" = 6, "PHAMMER" = 4, "CHAINSAW" = 1))
	bag_cache = pickweight(list("INDUSTRIAL" = 36, "DUFFEL" = 28, "MILI" = 16, "BLUESPACE" = 1))
	armor_cache = pickweight(list("BASIC_A" = 16, "BULLET_A" = 4, "EGUN_A" = 4, "MELEE_A" = 4))

/obj/structure/closet/secure_closet/personal/prospector/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	gain_rng()

	new /obj/item/device/radio/headset/headset_pro(src)
	new /obj/item/clothing/accessory/cape/prospie(src)

	switch(bag_cache)
		if("INDUSTRIAL")
			if(prob(80))
				new /obj/item/storage/backpack/satchel/industrial(src)
			else
				new /obj/item/storage/backpack/industrial(src)
		if("DUFFEL")
			new /obj/item/storage/backpack/duffelbag(src)
		if("MILI")
			new /obj/item/storage/backpack/military(src)
		if("BLUESPACE")
			new /obj/item/storage/backpack/holding(src)
	//armor
	switch(armor_cache)
		if("BASIC_A")
			new /obj/item/clothing/suit/storage/scavengerarmor(src)
			new /obj/item/clothing/head/helmet/handmade/scavengerhelmet(src)
			new /obj/item/clothing/gloves/thick/combat(src)
			new /obj/item/clothing/shoes/combat(src)
		if("BULLET_A")
			new /obj/item/clothing/suit/armor/platecarrier(src)
			new /obj/item/clothing/head/helmet/ballistic(src)
			new /obj/item/clothing/gloves/thick/combat(src)
			new /obj/item/clothing/shoes/combat(src)
		if("MELEE_A")
			new /obj/item/clothing/suit/armor/heavy/riot(src)
			new /obj/item/clothing/head/helmet/faceshield/riot(src)
			new /obj/item/clothing/gloves/thick/combat(src)
			new /obj/item/clothing/shoes/combat(src)
		if("EGUN_A")
			new /obj/item/clothing/suit/armor/laserproof(src)
			new /obj/item/clothing/head/helmet/visor/cyberpunkgoggle(src) //shitty helmet but it looks cool with the vest
			new /obj/item/clothing/gloves/thick/combat(src)
			new /obj/item/clothing/shoes/combat(src)

	//longarms
	switch(main_weapon_cache)
		if("SMG")
			if(prob(50))
				new /obj/item/gun/projectile/automatic/luger(src)
				new /obj/item/ammo_magazine/smg_35(src)
				new /obj/item/ammo_magazine/smg_35(src)
			else
				new /obj/item/gun/projectile/automatic/mac(src)
				new /obj/item/ammo_magazine/smg_35(src)
				new /obj/item/ammo_magazine/smg_35(src)
		if("WILDCARDS")
			//why prospies have to stay in the past?
			if(prob(50))
				new /obj/item/gun/projectile/automatic/bren(src)
				new /obj/item/ammo_magazine/light_rifle_257(src)
				new /obj/item/ammo_magazine/light_rifle_257(src)
			else
				new /obj/item/gun/projectile/automatic/nordwind/strelki(src)
				new /obj/item/ammo_magazine/rifle_75(src)
				new /obj/item/ammo_magazine/rifle_75(src)
		if("SHOTGUN")
			if(prob(50))
				new /obj/item/gun/projectile/shotgun/doublebarrel(src)
				new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
				new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
			else
				new /obj/item/gun/projectile/shotgun/pump(src)
				new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
				new /obj/item/ammo_magazine/speed_loader_shotgun/empty(src)
		if("SHORT_WILDCARDS")
			if(prob(20))
				new /obj/item/gun/projectile/automatic/vector(src)
				new /obj/item/ammo_magazine/smg_magnum_40(src)
				new /obj/item/ammo_magazine/smg_magnum_40(src)
			else
				new /obj/item/gun/projectile/automatic/luty(src)
				new /obj/item/ammo_magazine/smg_35(src)
				new /obj/item/ammo_magazine/smg_35(src)
				new /obj/item/ammo_magazine/smg_35(src)
		if("RIFLE")
			if(prob(50))
				new /obj/item/gun/projectile/boltgun/sa(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
			else
				new /obj/item/gun/projectile/boltgun(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		if("EGUN")
			switch(rand(1,100))
				if(1 to 35) //35% chance Cog
					new /obj/item/gun/energy/cog(src)
					new /obj/item/cell/medium(src)
					new /obj/item/cell/medium(src)
					new /obj/item/cell/medium(src)
				if(36 to 65) //30% chance lasercore
					new /obj/item/gun/energy/lasercore(src)
					new /obj/item/cell/medium(src)
					new /obj/item/cell/medium(src)
					new /obj/item/cell/medium(src)
				if(66 to 95) //30% chance Lightfall
					new /obj/item/gun/energy/laser(src)
					new /obj/item/cell/medium(src)
					new /obj/item/cell/medium(src)
					new /obj/item/cell/medium(src)
				if(96 to 100) //5% chance Concillium, you only get two cells because they're large
					new /obj/item/gun/energy/concillium(src)
					new /obj/item/cell/large(src)
					new /obj/item/cell/large(src)

	//pistols
	new /obj/item/gun/projectile/automatic/slaught_o_matic(src)

	switch(side_arm_cache)
		if("PISTOL")
			switch(rand(1,100))
				if(1 to 40) //40% Sigia
					new /obj/item/gun/projectile/ladon/sa(src)
					new /obj/item/ammo_magazine/magnum_40(src)
					new /obj/item/ammo_magazine/magnum_40(src)
				if(41 to 70) //30% Thorn
					new /obj/item/gun/projectile/mk58(src)
					new /obj/item/ammo_magazine/highcap_pistol_35(src)
					new /obj/item/ammo_magazine/highcap_pistol_35(src)
				if(71 to 100) //30% Rose
					new /obj/item/gun/projectile/mk58/wood(src)
					new /obj/item/ammo_magazine/magnum_40(src)
					new /obj/item/ammo_magazine/magnum_40(src)
		if("REVOLVER")
			switch(rand(1,100))
				if(1 to 30) //30% Havelock
					new /obj/item/gun/projectile/revolver/detective(src)
					new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
					new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
				if(31 to 60) //30% Cowboy
					new /obj/item/gun/projectile/revolver/rev10/rex10(src)
					new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
					new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
				if(61 to 100) //40% Pilgrim
					new /obj/item/gun/projectile/revolver/lemant(src)
					new /obj/item/ammo_magazine/speed_loader_magnum_40(src)
					new /obj/item/ammo_magazine/speed_loader_magnum_40(src)
					new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		if("GOOD_PISTOL")
			if(prob(50))
				new /obj/item/gun/projectile/colt(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
			else
				new /obj/item/gun/projectile/makarov(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
		if("HEAVY_PISTOL")
			if(prob(50))
				new /obj/item/gun/projectile/basilisk(src)
				new /obj/item/ammo_magazine/kurtz_50(src)
				new /obj/item/ammo_magazine/kurtz_50(src)
			else
				new /obj/item/gun/projectile/revolver/longboi(src)
				new /obj/item/ammo_magazine/speed_loader_kurtz_50(src)
				new /obj/item/ammo_magazine/speed_loader_kurtz_50(src)
				new /obj/item/ammo_magazine/speed_loader_kurtz_50(src)
		if("EGUN_P")
			if(prob(50))
				new /obj/item/gun/energy/gun(src)
				new /obj/random/powercell/medium_safe_lonestar(src)
				new /obj/item/cell/medium/high(src)
			else
				new /obj/item/gun/energy/gun/martin(src)
				new /obj/random/powercell/small_safe_lonestar(src)
				new /obj/item/cell/small/high(src)

	//melee

	switch(melee_cache)
		if("MACHETE")
			new /obj/item/clothing/accessory/holster/saber/machete(src)
			new /obj/item/tool/sword/machete(src)
		if ("LONGSWORD")
			new /obj/item/clothing/accessory/holster/saber/greatsword/churchprint(src)
			new /obj/item/tool/sword/nt/longsword(src)
		if("KATANA")
			new /obj/item/tool/sword/katana(src)
		if("PHAMMER")
			new /obj/item/tool/hammer/powered_hammer(src)
		if("CHAINSAW")
			new /obj/item/tool/saw/chain(src)


	//Regular spawns
	new /obj/item/tool/knife/dagger(src)
	if(prob(50))
		new /obj/item/gun/projectile/boltgun/flare_gun(src)
		new /obj/item/ammo_casing/flare/blue/prespawn(src)
		new /obj/item/ammo_casing/flare/green/prespawn(src)
		new /obj/item/ammo_casing/flare/prespawn(src)
	else
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)

	//Nades
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
	icon_state = "oldstyle" // Placeholder for lack of a better salvage-oriented looking locker.
	var/main_weapon_cache
	var/side_arm_cache
	var/melee_cache
	var/armor_cache
	var/bag_cache


/obj/structure/closet/secure_closet/personal/salvager/proc/gain_rng()
	main_weapon_cache = pickweight(list("SMG" = 12, "WILDCARDS" = 4, "SHORT_WILDCARDS" = 10, "SHOTGUN" = 8, "RIFLE" = 6, "EGUN" = 6))
	side_arm_cache = pickweight(list("PISTOL" = 12, "REVOLVER" = 4, "GOOD_PISTOL" = 10, "HEAVY_PISTOL" = 2, "EGUN_P" = 4))
	melee_cache = pickweight(list("MACHETE" = 12, "LONGSWORD" = 8, "KATANA" = 8, "PHAMMER" = 4, "CHAINSAW" = 1))
	bag_cache = pickweight(list("INDUSTRIAL" = 24, "DUFFEL" = 16, "MILI" = 8, "BLUESPACE" = 1))
	armor_cache = pickweight(list("BASIC_A" = 12, "BULLET_A" = 4, "EGUN_A" = 4, "MELEE_A" = 8))

/obj/structure/closet/secure_closet/personal/salvager/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	gain_rng()

	new /obj/item/device/radio/headset/headset_pro(src)
	new /obj/item/clothing/accessory/cape/prospie(src)

	switch(bag_cache)
		if("INDUSTRIAL")
			if(prob(80))
				new /obj/item/storage/backpack/satchel/industrial(src)
			else
				new /obj/item/storage/backpack/industrial(src)
		if("DUFFEL")
			new /obj/item/storage/backpack/duffelbag(src)
		if("MILI")
			new /obj/item/storage/backpack/military(src)
		if("BLUESPACE")
			new /obj/item/storage/backpack/holding(src)
	//armor
	new /obj/item/clothing/suit/storage/scavengerarmor(src)
	new /obj/item/clothing/head/helmet/handmade/scavengerhelmet(src)
	new /obj/item/clothing/gloves/thick/combat(src)
	//longarms
	switch(main_weapon_cache)
		if("SMG")
			if(prob(50))
				new /obj/item/gun/projectile/automatic/luger(src)
				new /obj/item/ammo_magazine/smg_35(src)
				new /obj/item/ammo_magazine/smg_35(src)
			else
				new /obj/item/gun/projectile/automatic/greasegun(src)
				new /obj/item/ammo_magazine/smg_35(src)
				new /obj/item/ammo_magazine/smg_35(src)
		if("WILDCARDS")
			//why prospies have to stay in the past?
			if(prob(60))
				new /obj/item/gun/projectile/boltgun/lever/shotgun(src)
				new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
				new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
			else
				new /obj/item/gun/projectile/automatic/nordwind/strelki(src)
				new /obj/item/ammo_magazine/rifle_75(src)
				new /obj/item/ammo_magazine/rifle_75(src)
		if("SHOTGUN")
			if(prob(50))
				new /obj/item/gun/projectile/shotgun/doublebarrel(src)
				new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
				new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
			else
				new /obj/item/gun/projectile/shotgun/pump(src)
				new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
				new /obj/item/ammo_magazine/speed_loader_shotgun/empty(src)
		if("SHORT_WILDCARDS")
			if(prob(20))
				new /obj/item/gun/projectile/automatic/vector(src)
				new /obj/item/ammo_magazine/smg_magnum_40(src)
				new /obj/item/ammo_magazine/smg_magnum_40(src)
			else
				new /obj/item/gun/projectile/automatic/luty(src)
				new /obj/item/ammo_magazine/smg_35(src)
				new /obj/item/ammo_magazine/smg_35(src)
				new /obj/item/ammo_magazine/smg_35(src)
		if("RIFLE")
			if(prob(50))
				new /obj/item/gun/projectile/boltgun/sa(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
			else
				new /obj/item/gun/projectile/boltgun(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
				new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		if("EGUN")
			switch(rand(1,100))
				if(1 to 35) //35% chance Cog
					new /obj/item/gun/energy/cog(src)
					new /obj/random/powercell/medium_safe_lonestar(src)
					new /obj/item/cell/medium(src)
				if(36 to 65) //30% chance lasercore
					new /obj/item/gun/energy/lasercore(src)
					new /obj/random/powercell/medium_safe_lonestar(src)
					new /obj/item/cell/medium(src)
				if(66 to 95) //30% chance Lightfall
					new /obj/item/gun/energy/laser(src)
					new /obj/random/powercell/medium_safe_lonestar(src)
					new /obj/item/cell/medium(src)
				if(96 to 100) //5% chance Concillium, you only get two cells because they're large
					new /obj/item/gun/energy/concillium(src)
					new /obj/item/cell/large(src)
					new /obj/item/cell/large(src)



	//pistols
	new /obj/item/gun/projectile/automatic/slaught_o_matic(src)

	switch(side_arm_cache)
		if("PISTOL")
			switch(rand(1,100))
				if(1 to 40) //40% Sigia
					new /obj/item/gun/projectile/ladon/sa(src)
					new /obj/item/ammo_magazine/magnum_40(src)
					new /obj/item/ammo_magazine/magnum_40(src)
				if(41 to 70) //30% Thorn
					new /obj/item/gun/projectile/mk58(src)
					new /obj/item/ammo_magazine/highcap_pistol_35(src)
					new /obj/item/ammo_magazine/highcap_pistol_35(src)
				if(71 to 100) //30% Rose
					new /obj/item/gun/projectile/mk58/wood(src)
					new /obj/item/ammo_magazine/magnum_40(src)
					new /obj/item/ammo_magazine/magnum_40(src)
		if("REVOLVER")
			switch(rand(1,100))
				if(1 to 30) //30% Havelock
					new /obj/item/gun/projectile/revolver/detective(src)
					new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
					new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
				if(31 to 60) //30% Cowboy
					new /obj/item/gun/projectile/revolver/rev10/rex10(src)
					new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
					new /obj/item/ammo_magazine/speed_loader_pistol_35(src)
				if(61 to 100) //40% Pilgrim
					new /obj/item/gun/projectile/revolver/lemant(src)
					new /obj/item/ammo_magazine/speed_loader_magnum_40(src)
					new /obj/item/ammo_magazine/speed_loader_magnum_40(src)
					new /obj/item/ammo_casing/shotgun/pellet/prespawned(src)
		if("GOOD_PISTOL")
			if(prob(50))
				new /obj/item/gun/projectile/colt(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
			else
				new /obj/item/gun/projectile/makarov(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
				new /obj/item/ammo_magazine/highcap_pistol_35(src)
		if("HEAVY_PISTOL")
			if(prob(50))
				new /obj/item/gun/projectile/basilisk(src)
				new /obj/item/ammo_magazine/kurtz_50(src)
				new /obj/item/ammo_magazine/kurtz_50(src)
			else
				new /obj/item/gun/projectile/revolver/longboi(src)
				new /obj/item/ammo_magazine/speed_loader_kurtz_50(src)
				new /obj/item/ammo_magazine/speed_loader_kurtz_50(src)
				new /obj/item/ammo_magazine/speed_loader_kurtz_50(src)
		if("EGUN_P")
			if(prob(50))
				new /obj/item/gun/energy/gun(src)
				new /obj/random/powercell/medium_safe_lonestar(src)
				new /obj/item/cell/medium/high(src)
			else
				new /obj/item/gun/energy/gun/martin(src)
				new /obj/random/powercell/small_safe_lonestar(src)
				new /obj/item/cell/small/high(src)

	//melee
	switch(melee_cache)
		if("MACHETE")
			new /obj/item/clothing/accessory/holster/saber/machete(src)
			new /obj/item/tool/sword/machete(src)
		if ("LONGSWORD")
			new /obj/item/clothing/accessory/holster/saber/greatsword/churchprint(src)
			new /obj/item/tool/sword/nt/longsword(src)
		if("KATANA")
			new /obj/item/tool/sword/katana(src)
		if("PHAMMER")
			new /obj/item/tool/hammer/powered_hammer(src)
		if("CHAINSAW")
			new /obj/item/tool/saw/chain(src)

	//Regular Spawns
	new /obj/item/device/radio/headset/headset_pro(src)
	new /obj/item/tool/knife/dagger(src)
	if(prob(50))
		new /obj/item/gun/projectile/boltgun/flare_gun(src)
		new /obj/item/ammo_casing/flare/blue/prespawn(src)
		new /obj/item/ammo_casing/flare/green/prespawn(src)
		new /obj/item/ammo_casing/flare/prespawn(src)
	else
		new /obj/item/device/lighting/glowstick/flare(src)
		new /obj/item/device/lighting/glowstick/flare(src)
	new /obj/item/device/radio/off(src)
	//Salvager
	if(prob(50))
		new /obj/item/storage/belt/utility/full(src)
	else
		new /obj/item/storage/belt/utility/handmade/full(src)
	new /obj/item/storage/firstaid/regular(src)
	if(prob(95))
		new /obj/item/storage/firstaid/ifak(src)
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
	icon_state = "foreman"

//Small note from Trilby: Forman loot picks are basically just the BEST versons of the scav lockers so theirs no doble coin flip
//Also dosnt have a side arm loot spawn but still has the vars for one if someone wants to mirrow it or do something like that in furchture

	var/main_weapon_cache
	var/side_arm_cache
	var/melee_cache
	var/armor_cache
	var/bag_cache

/obj/structure/closet/secure_closet/reinforced/foreman/proc/gain_rng()
	main_weapon_cache = pickweight(list("SMG" = 12, "LMG" = 4, "GOOD_SMG" = 10, "SHOTGUN" = 8, "RIFLE" = 6, "EGUN" = 4))
	side_arm_cache = pickweight(list("PISTOL" = 12, "REVOLVER" = 4, "GOOD_PISTOL" = 10, "HEAVY_PISTOL" = 2, "EGUN_P" = 4))
	melee_cache = pickweight(list("MACHETE" = 12, "LONGSWORD" = 8, "KATANA" = 8, "PHAMMER" = 4, "CHAINSAW" = 1))
	bag_cache = pickweight(list("INDUSTRIAL" = 24, "DUFFEL" = 16, "MILI" = 8, "BLUESPACE" = 1))
	armor_cache = pickweight(list("BASIC_A" = 12, "BULLET_A" = 4, "EGUN_A" = 4, "MELEE_A" = 8))

/obj/structure/closet/secure_closet/reinforced/foreman/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	gain_rng()

	new /obj/item/device/radio/headset/heads/foreman(src)
	new /obj/item/clothing/accessory/cape/prospie(src)
	new /obj/item/clothing/accessory/halfcape/foreman(src)
	switch(bag_cache)
		if("INDUSTRIAL")
			if(prob(80))
				new /obj/item/storage/backpack/satchel/industrial(src)
			else
				new /obj/item/storage/backpack/industrial(src)
		if("DUFFEL")
			new /obj/item/storage/backpack/duffelbag(src)
		if("MILI")
			new /obj/item/storage/backpack/military(src)
		if("BLUESPACE")
			new /obj/item/storage/backpack/holding(src)
	//armor
	new /obj/item/clothing/head/helmet/foreman(src)
	new /obj/item/clothing/suit/storage/vest/scav(src)
	//Still roll the rng ones for laser proof armor other fancy armor types that are better in a case then are normal foreman one
	switch(armor_cache)
		if("BASIC_A")
			new /obj/item/clothing/suit/storage/scavengerarmor(src)
			new /obj/item/clothing/head/helmet/handmade/scavengerhelmet(src)
			new /obj/item/clothing/gloves/thick/combat(src)
			new /obj/item/clothing/shoes/combat(src)
		if("BULLET_A")
			new /obj/item/clothing/suit/armor/platecarrier(src)
			new /obj/item/clothing/head/helmet/ballistic(src)
			new /obj/item/clothing/gloves/thick/combat(src)
			new /obj/item/clothing/shoes/combat(src)
		if("MELEE_A")
			new /obj/item/clothing/suit/armor/heavy/riot(src)
			new /obj/item/clothing/head/helmet/faceshield/riot(src)
			new /obj/item/clothing/gloves/thick/combat(src)
			new /obj/item/clothing/shoes/combat(src)
		if("EGUN_A")
			new /obj/item/clothing/suit/armor/laserproof(src)
			new /obj/item/clothing/head/helmet/visor/cyberpunkgoggle(src) //shitty helmet but it looks cool with the vest
			new /obj/item/clothing/gloves/thick/combat(src)
			new /obj/item/clothing/shoes/combat(src)

	//longarms
	switch(main_weapon_cache)
		if("SMG")
			new /obj/item/gun/projectile/automatic/luger(src)
			new /obj/item/ammo_magazine/smg_35(src)
			new /obj/item/ammo_magazine/smg_35(src)
		if("LMG")
			//Well not a lmg at the top its still a good gun to roll in its place
			new /obj/item/gun/projectile/automatic/nordwind/strelki(src)
			new /obj/item/ammo_magazine/rifle_75(src)
			new /obj/item/ammo_magazine/rifle_75(src)
		if("SHOTGUN")
			new /obj/item/gun/projectile/shotgun/pump/combat(src) //Foreman can get Regulator rather than the lame regular pump
			new /obj/item/ammo_magazine/ammobox/shotgun/scrap_pellet(src)
			new /obj/item/ammo_magazine/speed_loader_shotgun/empty(src)
		if("GOOD_SMG")
			new /obj/item/gun/projectile/automatic/vector(src)
			new /obj/item/ammo_magazine/smg_magnum_40(src)
			new /obj/item/ammo_magazine/smg_magnum_40(src)
		if("RIFLE")
			new /obj/item/gun/projectile/boltgun(src)
			new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
			new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
			new /obj/item/ammo_magazine/speed_loader_rifle_75(src)
		if("EGUN")
			new /obj/item/gun/energy/lasercore(src)
			new /obj/random/powercell/medium_safe_lonestar(src)
			new /obj/item/cell/medium(src)
			new /obj/item/cell/medium(src)
	//pistols
	new /obj/item/gun/projectile/automatic/slaught_o_matic(src) //has silver eye
	new /obj/item/gun/projectile/silvereye(src)
	new /obj/item/ammo_magazine/kurtz_50(src)
	new /obj/item/ammo_magazine/kurtz_50(src)
	new /obj/item/ammo_magazine/kurtz_50(src)
	new /obj/item/ammo_magazine/ammobox/kurtz_50/hv(src)
	//melee

	switch(melee_cache)
		if("MACHETE")
			new /obj/item/clothing/accessory/holster/saber/machete(src)
			new /obj/item/tool/sword/machete(src)
		if ("LONGSWORD")
			new /obj/item/clothing/accessory/holster/saber/greatsword/churchprint(src)
			new /obj/item/tool/sword/nt/longsword(src)
		if("KATANA")
			new /obj/item/tool/sword/katana(src)
		if("PHAMMER")
			new /obj/item/tool/power_fist(src)
		if("CHAINSAW")
			new /obj/item/tool/saw/hyper(src)


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
	//Salvager improved
	new /obj/item/storage/belt/utility/full(src)
	new /obj/item/storage/firstaid/regular(src)
	if(prob(70))
		new /obj/item/storage/firstaid/ifak(src)
	else
		new /obj/item/storage/firstaid/combat(src)
	if(prob(40))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)
	if(prob(20))
		new /obj/item/grenade/spawnergrenade/manhacks/junkbot(src)


/obj/structure/closet/secure_closet/reinforced/foreman/fence //essentially just a modified foreman locker. This is fine for now.
	name = "Fences locker"
	req_access = list(access_fence)
	icon_state = "fence"

/obj/structure/closet/secure_closet/reinforced/foreman/fence/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/suit/storage/scavengerarmor(src)
	new /obj/item/clothing/head/helmet/handmade/scavengerhelmet(src)
	new /obj/item/gun/projectile/automatic/vector(src)
	new /obj/item/ammo_magazine/smg_magnum_40(src)
	new /obj/item/ammo_magazine/smg_magnum_40(src)
	new /obj/item/ammo_magazine/smg_magnum_40/lethal(src)
	new /obj/item/gun/projectile/automatic/slaught_o_matic(src)
	new /obj/item/gun/projectile/ladon/sa(src)
	new /obj/item/ammo_magazine/magnum_40(src)
	new /obj/item/ammo_magazine/magnum_40(src)
	new /obj/item/tool/knife/dagger(src)
	new /obj/item/device/radio/off(src)
	new /obj/item/storage/belt/utility/full(src)

/obj/structure/closet/secure_closet/personal/artist
	name = "lonestar artist's locker"
	req_access = list(access_theatre)
	access_occupy = list(access_cargo)
	icon_state = "cargo"

/obj/structure/closet/secure_closet/personal/artist/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	new /obj/item/clothing/suit/artist(src)
	new /obj/item/clothing/under/rank/artist(src)
	new /obj/item/clothing/suit/artist(src)
	new /obj/item/clothing/shoes/artist_shoes(src)
	new /obj/item/clothing/head/beret/artist(src)
	new /obj/item/clothing/glasses/artist(src)
	new /obj/item/clothing/mask/gas/artist_hat(src)
	new /obj/item/device/radio/headset/headset_cargo(src)
	new /obj/item/circuitboard/artist_bench(src)
	new /obj/item/storage/pouch/grow_a_gun(src)
	new /obj/item/toy/badtothebone(src) // They should be able to use this just as much.

/obj/structure/closet/wardrobe/color/pink/artist

/obj/structure/closet/wardrobe/color/pink/artist/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	//new/obj/item/clothing/under/mime(src)
	new/obj/item/clothing/shoes/color/black(src)
	new/obj/item/clothing/gloves/color/white(src)
	//new/obj/item/clothing/mask/gas/mime(src)
	new/obj/item/clothing/head/beret(src)
	new/obj/item/pen/crayon/mime(src)
	new/obj/item/reagent_containers/drinks/bottle/bottleofnothing(src)
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
