/datum/design/research/item/weapon
	category = CAT_WEAPON

// Weapons
/datum/design/research/item/weapon/AssembleDesignDesc()
	if(!desc && build_path)
		var/obj/item/I = build_path
		desc = initial(I.desc)
	else
		..()

/datum/design/research/item/flash
	name = "Flash"
	build_type = AUTOLATHE | MECHFAB
	build_path = /obj/item/device/flash
	category = "Misc"

/datum/design/research/item/weapon/stunrevolver
	name = "\"Hera\" Stun Revolver"
	build_path = /obj/item/gun/energy/stunrevolver/sci

/datum/design/research/item/weapon/nuclear_gun
	name = "Prototype: Advanced Energy Gun"
	build_path = /obj/item/gun/energy/gun/nuclear

/datum/design/research/item/weapon/lasercannon
	name = "\"Solaris\" Laser Cannon"
	desc = "The lasing medium of this prototype is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core."
	build_path = /obj/item/gun/energy/lasercannon/rnd

/datum/design/research/item/weapon/c20r
	name = "Lightweight C20R"
	desc = "The C-20r is a lightweight and rapid-firing SMG. Uses .35 Auto rounds."
	build_path = /obj/item/gun/projectile/automatic/c20r/sci

/datum/design/research/item/weapon/centurio
	name = "\"Centurio\" Plasma Pistol"
	build_path = /obj/item/gun/energy/centurio

/datum/design/research/item/weapon/auretian
	name = "\"Auretian\" Energy Pistol"
	build_path = /obj/item/gun/energy/plasma/auretian

/datum/design/research/item/weapon/centauri
	name = "\"Centauri\" Energy PDW"
	build_path = /obj/item/gun/energy/centauri

/datum/design/research/item/weapon/decloner
	name = "Prototype: Biological Demolecularizer"
	build_path = /obj/item/gun/energy/decloner

/datum/design/research/item/weapon/slimegun
	name = "Prototype: \"Ranch\" core stopper gun"
	build_path = /obj/item/gun/energy/slimegun

/datum/design/research/item/weapon/chemsprayer
	name = "Chemical Sprayer"
	desc = "An advanced chem spraying device."
	build_path = /obj/item/reagent_containers/spray/chemsprayer

/datum/design/research/item/weapon/rapidsyringe
	name = "Rapid Syringe Gun"
	build_path = /obj/item/gun/launcher/syringe/rapid

/datum/design/research/item/weapon/temp_gun
	name = "Temperature Gun"
	desc = "A gun that shoots high-powered glass-encased energy temperature bullets."
	build_path = /obj/item/gun/energy/temperature

/datum/design/research/item/weapon/large_grenade
	name = "Large Grenade Casing"
	build_path = /obj/item/grenade/chem_grenade/large/moebius

/datum/design/research/item/weapon/flora_gun
	name = "Floral Somatoray"
	build_path = /obj/item/gun/energy/floragun/si

/datum/design/research/item/weapon/bluespace_harpoon
	name = "Bluespace Harpoon"
	build_path = /obj/item/bluespace_harpoon
	category = "Bluespace Telecoms"

/datum/design/research/item/clothing/soteriaarmorchest
	name = "'Mark II' environmental protection suit"
	desc = "For working in hazardous environments. While its built for most environments, one of those is not space. This suit is a cheap and badly made copy of the Artificer Guilds original design. \
	Unlike its superior, it offers significantly less armor but it is made out of basic steel, making it a cheaper, easier alternative to build."
	build_path = /obj/item/clothing/suit/armor/vest/soteriasuit

/datum/design/research/item/clothing/soteriaarmorhead
	name = "'Mark II' environmental protection helmet"
	desc = "You feel like this helmet is cheap, for some reason."
	build_path = /obj/item/clothing/head/helmet/soteriasuit

/datum/design/research/item/clothing/armor_laserproof
	name = "Reflector armor vest"
	desc = "Laser reflective armor."
	build_path = /obj/item/clothing/suit/armor/laserproof/rnd

/datum/design/research/item/weapon/katana
	name = "Soteria \"Muramasa\" Katana"
	build_path = /obj/item/tool/sword/katana/nano

/datum/design/research/item/weapon/slimebaton
	name = "Soteria xenobio baton"
	build_path = /obj/item/melee/baton/slimebaton

/datum/design/research/item/weapon/bluespace_dagger
	name = "Soteria \"Displacement Dagger\""
	build_path = /obj/item/tool/knife/dagger/bluespace

/datum/design/research/item/clothing/medarmor
	name = "Soteria Medical Void Armor"
	desc = "A suit of all purpose Soteria medical void armor. Used for operations where oxygen is a rarity and protection is needed."
	build_path = /obj/item/clothing/suit/space/void/medarmor

/datum/design/research/item/weapon/hatton
	name = "Soteria Breaching Tool \"Q-del\""
	desc = "This breaching tool was reverse engineered from the \"Hatton\" design. \
			Despite the Artificer's Guild \"Hatton\" being traded on the free market through guild channels, \
			this device suffers from a wide number of reliability issues stemming from it being lathe printed."
	build_path = /obj/item/hatton/moebius

//Starstriker - The gun thats able to strike the stars!
/datum/design/research/item/weapon/starstriker
	name = "\"Star Striker\" laser boltgun"
	desc = "A mix of the lighter version of the Sike point 257 hunting rifle, but with the twist of using laser based casings rather then normal bullet based projectiles. Its cal is .233 unlike the gun its based on."
	build_path = /obj/item/gun/projectile/boltgun/sci

//LAK - The gun thats able to laser shot away most proplems
/datum/design/research/item/weapon/laser_ak
	name = "\"Legkiy-Kalashnikov\" laser carbine"
	build_path = /obj/item/gun/projectile/automatic/ak47/akl

// Plasma guns
/datum/design/research/item/weapon/hydrogen_rifle
	name = "Hydrogen \"Venatori\" Rifle"
	build_path = /obj/item/gun/hydrogen

/datum/design/research/item/weapon/hydrogen_pistol
	name = "Hydrogen \"Classia\" Pistol"
	build_path = /obj/item/gun/hydrogen/pistol

/datum/design/research/item/weapon/hydrogen_cannon
	name = "Hydrogen \"Sollex\" Cannon"
	build_path = /obj/item/gun/hydrogen/cannon

/datum/design/research/item/weapon/hydrogen_welder
	name = "Hydrogen Torch"
	build_path = /obj/item/tool/plasma_torch

// Ammo
/datum/design/research/item/ammo
	name_category = "ammunition"
	category = "Ammo"

/datum/design/research/item/ammo/smg_mag
	name = "SMG Magazine .35 Auto (Empty) "
	desc = "A magazine for .35 Auto, used in smgs."
	build_path = /obj/item/ammo_magazine/smg_35/empty
	materials = list(MATERIAL_STEEL = 15)

/datum/design/research/item/ammo/smg_mag/lethal
	name = "SMG Magazine .35 Auto"
	desc = "A magazine for .35 auto, used in smgs."
	build_path = /obj/item/ammo_magazine/smg_35
	materials = list(MATERIAL_STEEL = 30)

/datum/design/research/item/ammo/smg_mag/rubber
	name = "SMG Magazine .35 Auto (Rubber)"
	desc = "A magazine for .35 Auto (Rubber), used in smgs."
	build_path = /obj/item/ammo_magazine/smg_35/rubber
	materials = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 5)

/datum/design/research/item/ammo/pistol_laser
	name = "Auto .35, laser"
	desc = "Auto .35 cases fitted with a one time use laser payload."
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/laser
	materials = list(MATERIAL_STEEL = 5, MATERIAL_SILVER = 15, MATERIAL_GOLD = 15)

/datum/design/research/item/ammo/magum_laser
	name = "Magnum .40, laser case"
	desc = "Magnum .40 cases fitted with a one time use laser payload."
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/laser
	materials = list(MATERIAL_STEEL = 5, MATERIAL_SILVER = 15, MATERIAL_GOLD = 15)

/datum/design/research/item/ammo/light_rifle_257
	name = "Light rifle .257 laser casing."
	desc = ".257 casings fitted with a one time use laser payload."
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257_small/laser
	materials = list(MATERIAL_STEEL = 10, MATERIAL_SILVER = 30, MATERIAL_GOLD = 30)

/datum/design/research/item/ammo/rifle_75
	name = "Rifle 7.5 laser casing."
	desc = "7.5 casings fitted with a one time use laser payload."
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small/laser
	materials = list(MATERIAL_STEEL = 10, MATERIAL_SILVER = 30, MATERIAL_GOLD = 30)

/datum/design/research/item/ammo/heavy_rifle_408
	name = "Omni .408 laser casing."
	desc = ".408 Omni casing fitted with a one time use laser payload."
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/laser
	materials = list(MATERIAL_STEEL = 15, MATERIAL_SILVER = 30, MATERIAL_GOLD = 30)

/datum/design/research/item/ammo/kurtz_laser
	name = "Kurtz .50 , laser cases"
	desc = ".50 Kurtz cases fitted with a one time use laser payload."
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50/laser
	materials = list(MATERIAL_STEEL = 15, MATERIAL_SILVER = 15, MATERIAL_GOLD = 15)

// Shotgun Ammo

/datum/design/research/item/ammo/shotgun_stun
	name = "Shotgun ammo (Stun)"
	desc = "Stunning shells for a shotgun."
	build_path = /obj/item/ammo_casing/shotgun/stunshell/prespawned
	materials = list(MATERIAL_STEEL = 4, MATERIAL_SILVER = 5)

/datum/design/research/item/ammo/shotgun_fire
	name = "Shotgun ammo (Incendiary)"
	desc = "Incendiary shells for a shotgun."
	build_path = /obj/item/ammo_casing/shotgun/incendiary/prespawned
	materials = list(MATERIAL_STEEL = 4, MATERIAL_PLASMA = 5)


/datum/design/research/item/ammo/shotgun_laser
	name = "Shotgun ammo (Laser Case)"
	desc = "Laser based shells for a shotgun."
	build_path = /obj/item/ammo_casing/shotgun/laser/prespawned
	materials = list(MATERIAL_STEEL = 4, MATERIAL_SILVER = 4, MATERIAL_GOLD = 4)

// Misc Ammo

/datum/design/research/item/ammo/hatton
	name = "Soteria BT \"Q-del\" gas tube"
	build_path = /obj/item/hatton_magazine/moebius

/datum/design/research/item/ammo/rapidsyringe
	name = "Syringe Gun Cartridge"
	build_path = /obj/item/syringe_cartridge

/datum/design/research/item/ammo/laser_mag
	name = "Laser .223 casing mag (empty)"
	desc = "A 20 round magazine marked for .223 Carbine laser ammunition."
	build_path = /obj/item/ammo_magazine/rifle_223/empty

/datum/design/research/item/ammo/laser
	name = "\"Star Striker\" casing"
	desc = "A packet of casings for the Star Striker laser rifle, its cal is .233."
	build_path = /obj/item/ammo_magazine/ammobox/laser_223
	materials = list(MATERIAL_STEEL = 30, MATERIAL_GLASS = 30, MATERIAL_SILVER = 15) //Takes silver

/datum/design/research/item/ammo/laser/ap
	name = "\"Star Striker\" piercing laser casing."
	desc = "A packet of casings for the Star Striker laser rifle. Meant for penetration of armor, its cal is .233."
	build_path = /obj/item/ammo_magazine/ammobox/laser_223/ap
	materials = list(MATERIAL_STEEL = 30, MATERIAL_GLASS = 30, MATERIAL_GOLD = 15) //Takes gold

/datum/design/research/item/ammo/laser/lethal
	name = "\"Star Striker\" dense laser casing."
	desc = "A packet of casings for the Star Striker laser rifle. Compact laser that deals more damage but is easily blocked by armor, its cal is .233."
	materials = list(MATERIAL_STEEL = 30, MATERIAL_GLASS = 30, MATERIAL_PLASMA = 15) //Takes plasma
	build_path = /obj/item/ammo_magazine/ammobox/laser_223/lethal

//Disks
/datum/design/research/item/disk/blackshield
	name = "Blackshield Sovereignty Disk"
	desc = "A unique disk for printing and creating Blackshield arms and ammunition."
	build_path = /obj/item/computer_hardware/hard_drive/portable/design/blackshield

//Weapon mods
/datum/design/research/item/weapon/weapon_upgrade
	name_category = "weapon upgrades"
	category = CAT_GUNMODS

/datum/design/research/item/weapon/weapon_upgrade/penetrator
	name = "Soteria \"Penetrator\" magnetic accelerator barrel"
	build_path = /obj/item/gun_upgrade/barrel/mag_accel

/datum/design/research/item/weapon/weapon_upgrade/overheat
	name = "Soteria \"Caster\" magnetic overheat barrel"
	build_path = /obj/item/gun_upgrade/barrel/overheat

/datum/design/research/item/weapon/weapon_upgrade/battery_shunt
	name = "Soteria \"Thunder\" battery shunt"
	build_path = /obj/item/gun_upgrade/mechanism/battery_shunt

/datum/design/research/item/weapon/weapon_upgrade/overdrive
	name = "Soteria \"Tesla\" overdrive chip"
	build_path = /obj/item/gun_upgrade/mechanism/overdrive

/datum/design/research/item/weapon/weapon_upgrade/toxin_coater
	name = "Soteria \"Black Viper\" toxin coater"
	build_path = /obj/item/gun_upgrade/barrel/toxin_coater
/*
/datum/design/research/item/weapon/weapon_upgrade/isotope_diffuser
	name = "Soteria \"Atomik\" isotope diffuser"
	build_path = /obj/item/gun_upgrade/barrel/isotope_diffuser

/datum/design/research/item/weapon/weapon_upgrade/psionic_catalyst
	name = "Moebius \"Mastermind\" psionic catalyst"
	build_path = /obj/item/gun_upgrade/mechanism/psionic_catalyst
*/

// HIGH-TECH TOOLMODS
/datum/design/research/item/weapon/toolmod
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/stick
	name = "Brace Bar"
	build_path = /obj/item/tool_upgrade/reinforcement/stick
	sort_string = "TAAAA"

/datum/design/research/item/weapon/toolmod/heatsink
	name = "Heat Sink"
	build_path = /obj/item/tool_upgrade/reinforcement/heatsink
	sort_string = "TAAAB"

/datum/design/research/item/weapon/toolmod/plating
	name = "Reinforced Plating"
	build_path = /obj/item/tool_upgrade/reinforcement/plating
	sort_string = "TAAAC"

/datum/design/research/item/weapon/toolmod/guard
	name = "Metal Guard"
	build_path = /obj/item/tool_upgrade/reinforcement/guard
	sort_string = "TAAAD"

/datum/design/research/item/weapon/toolmod/plasmablock
	name = "Plasma Block"
	build_path = /obj/item/tool_upgrade/reinforcement/plasmablock
	sort_string = "TAAAE"

/datum/design/research/item/weapon/toolmod/rubbermesh
	name = "Rubber Mesh"
	build_path = /obj/item/tool_upgrade/reinforcement/rubbermesh
	sort_string = "TAAAF"

/datum/design/research/item/weapon/toolmod/ergonomicgrip
	name = "Ergonomic Grip"
	build_path = /obj/item/tool_upgrade/productivity/ergonomic_grip
	sort_string = "TAAAG"

/datum/design/research/item/weapon/toolmod/ratchet
	name = "Ratcheting Mechanism"
	build_path = /obj/item/tool_upgrade/productivity/ratchet
	sort_string = "TAAAH"

/datum/design/research/item/weapon/toolmod/redpaint
	name = "Red Paint"
	build_path = /obj/item/tool_upgrade/productivity/red_paint
	sort_string = "TAAAI"

/datum/design/research/item/weapon/toolmod/whetstone
	name = "Sharpening Block"
	build_path = /obj/item/tool_upgrade/productivity/whetstone
	sort_string = "TAAAJ"

/datum/design/research/item/weapon/toolmod/dblade
	name = "Lonestar \"Gleaming Edge\": Diamond Blade"
	build_path = /obj/item/tool_upgrade/productivity/diamond_blade
	sort_string = "TAAAK"

/datum/design/research/item/weapon/toolmod/oxyjet
	name = "Oxyjet Canister"
	build_path = /obj/item/tool_upgrade/productivity/oxyjet
	sort_string = "TAAAL"

/datum/design/research/item/weapon/toolmod/motor
	name = "High Power Motor"
	build_path = /obj/item/tool_upgrade/productivity/motor
	sort_string = "TAAAM"

/datum/design/research/item/weapon/toolmod/antistaining
	name = "Anti-Staining Paint"
	build_path = /obj/item/tool_upgrade/productivity/antistaining
	sort_string = "TAAAN"

/datum/design/research/item/weapon/toolmod/booster
	name = "Booster"
	build_path = /obj/item/tool_upgrade/productivity/booster
	sort_string = "TAAAO"

/datum/design/research/item/weapon/toolmod/injector
	name = "Plasma Injector"
	build_path = /obj/item/tool_upgrade/productivity/injector
	sort_string = "TAAAP"

/datum/design/research/item/weapon/toolmod/laserguide
	name = "Lonestar \"Guiding Light\" Laser Guide"
	build_path = /obj/item/tool_upgrade/refinement/laserguide
	sort_string = "TAAAQ"

/datum/design/research/item/weapon/toolmod/stabilizedgrip
	name = "Gyro-Stabilized Grip"
	build_path = /obj/item/tool_upgrade/refinement/stabilized_grip
	sort_string = "TAAAR"

/datum/design/research/item/weapon/toolmod/magbit
	name = "Magnetic Bit"
	build_path = /obj/item/tool_upgrade/refinement/magbit
	sort_string = "TAAAS"

/datum/design/research/item/weapon/toolmod/portedbarrel
	name = "Ported Barrel"
	build_path = /obj/item/tool_upgrade/refinement/ported_barrel
	sort_string = "TAAAT"

/datum/design/research/item/weapon/toolmod/compensatedbarrel
	name = "Gravity-Compensated Barrel"
	build_path = /obj/item/tool_upgrade/refinement/compensatedbarrel
	sort_string = "TAAAU"

/datum/design/research/item/weapon/toolmod/vibcompensator
	name = "Vibration Compensator"
	build_path = /obj/item/tool_upgrade/refinement/vibcompensator
	sort_string = "TAAAV"

/datum/design/research/item/weapon/toolmod/cellmount
	name = "Heavy Cell Mount"
	build_path = /obj/item/tool_upgrade/augment/cell_mount
	sort_string = "TAAAW"

/datum/design/research/item/weapon/toolmod/fueltank
	name = "Expanded Fuel Tank"
	build_path = /obj/item/tool_upgrade/augment/fuel_tank
	sort_string = "TAAAX"

/datum/design/research/item/weapon/toolmod/expansion
	name = "Expansion Port"
	build_path = /obj/item/tool_upgrade/augment/expansion
	sort_string = "TAAAY"

/datum/design/research/item/weapon/toolmod/spikes
	name = "Spikes"
	build_path = /obj/item/tool_upgrade/augment/spikes
	sort_string = "TAAAZ"
/*
/datum/design/research/item/weapon/toolmod/hammeraddon
	name = "Flat Surface"
	build_path = /obj/item/tool_upgrade/augment/hammer_addon
	sort_string = "TAABA"
*/
/datum/design/research/item/weapon/toolmod/hydraulic
	name = "Hydraulic Circuits"
	build_path = /obj/item/tool_upgrade/augment/hydraulic
	sort_string = "TAABB"

/datum/design/research/item/weapon/toolmod/celladapt
	name = "Cell Adapter"
	build_path = /obj/item/tool_upgrade/augment/cell_adapt
	sort_string = "TAABC"
