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
	name = "flash"
	build_type = AUTOLATHE | MECHFAB
	build_path = /obj/item/device/flash
	category = "Misc"

/datum/design/research/item/weapon/stunrevolver
	build_path = /obj/item/weapon/gun/energy/stunrevolver

/datum/design/research/item/weapon/nuclear_gun
	build_path = /obj/item/weapon/gun/energy/gun/nuclear

/datum/design/research/item/weapon/lasercannon
	desc = "The lasing medium of this prototype is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core."
	build_path = /obj/item/weapon/gun/energy/lasercannon

/datum/design/research/item/weapon/c20r
	name = "Lightweight C20R"
	desc = "The C-20r is a lightweight and rapid-firing SMG. Uses .35 Auto rounds."
	build_path = /obj/item/weapon/gun/projectile/automatic/c20r/sci

/datum/design/research/item/weapon/centurio
	build_path = /obj/item/weapon/gun/energy/centurio

/datum/design/research/item/weapon/auretian
	build_path = /obj/item/weapon/gun/energy/plasma/auretian

/datum/design/research/item/weapon/decloner
	build_path = /obj/item/weapon/gun/energy/decloner

/datum/design/research/item/weapon/chemsprayer
	desc = "An advanced chem spraying device."
	build_path = /obj/item/weapon/reagent_containers/spray/chemsprayer

/datum/design/research/item/weapon/rapidsyringe
	build_path = /obj/item/weapon/gun/launcher/syringe/rapid

/datum/design/research/item/weapon/temp_gun
	desc = "A gun that shoots high-powered glass-encased energy temperature bullets."
	build_path = /obj/item/weapon/gun/energy/temperature

/datum/design/research/item/weapon/large_grenade
	build_path = /obj/item/weapon/grenade/chem_grenade/large

/datum/design/research/item/weapon/flora_gun
	build_path = /obj/item/weapon/gun/energy/floragun

/datum/design/research/item/weapon/bluespace_harpoon
	build_path = /obj/item/weapon/bluespace_harpoon
	category = "Bluespace Telecoms"

/datum/design/research/item/weapon/soteriaarmorchest
	name = "'Mark II' enviromental protection suit"
	desc = "For working in hazardous enviroments. While its built for most enviroments, one of those is not space. This suit is a cheap and badly made copy of the Artificer Guilds original design. \
	Unlike its superior, it offers alot less armor but it is made out of basic steel, making it a cheaper, easier alternative to build."
	build_path = /obj/item/clothing/suit/armor/vest/soteriasuit

/datum/design/research/item/weapon/soteriaarmorhead
	name = "'Mark II' enviromental protection helmet"
	desc = "You feel like this helmet is cheap, for some reason."
	build_path = /obj/item/clothing/head/helmet/soteriasuit

/datum/design/research/item/weapon/armor_laserproof
	name = "Reflector armor vest"
	desc = "Laser reflective armor."
	build_path = /obj/item/clothing/suit/armor/laserproof/rnd

/datum/design/research/item/weapon/katana
	name = "Soteria \"Muramasa\" Katana"
	build_path = /obj/item/weapon/tool/sword/katana/nano

/datum/design/research/item/weapon/bluespace_dagger
	name = "Soteria \"Displacement Dagger\""
	build_path = /obj/item/weapon/tool/knife/dagger/bluespace

/datum/design/research/item/weapon/medarmor
	name = "soteria medical void armor"
	desc = "A suit of all purpose soteria medical void armor. Used for operations where oxygen is a rarity and protection is needed."
	build_path = /obj/item/clothing/suit/space/void/medarmor

/datum/design/research/item/weapon/hatton
	name = "Soteria BT \"Q-del\""
	desc = "This breaching tool was reverse engineered from the \"Hatton\" design. \
			Despite the Artificer's Guild \"Hatton\" being traded on the free market through guild channels, \
			this device suffers from a wide number of reliability issues stemming from it being lathe printed."
	build_path = /obj/item/weapon/hatton/moebius

//Starstriker - The gun thats able to strike the stars!
/datum/design/research/item/weapon/starstriker
	name = "\"Star Striker\" laser boltgun"
	desc = "A mix of the lighter version of the Sike point 257 hunting rifle, but with the twist of using laser based casings rather then normal bullet based projectiles."
	build_path = /obj/item/weapon/gun/projectile/boltgun/scout/sci

// Ammo
/datum/design/research/item/ammo
	name_category = "ammunition"
	category = "Ammo"

/datum/design/research/item/ammo/smg_mag
	name = "smg magazine .35 Auto (Empty) "
	desc = "A magazine for .35 Auto, used in smgs."
	build_path = /obj/item/ammo_magazine/smg_35/empty
	materials = list(MATERIAL_STEEL = 15)

/datum/design/research/item/ammo/smg_mag/lethal
	name = "smg magazine .35 Auto"
	desc = "A magazine for .35 auto, used in smgs."
	build_path = /obj/item/ammo_magazine/smg_35
	materials = list(MATERIAL_STEEL = 30)

/datum/design/research/item/ammo/smg_mag/rubber
	name = "smg magazine .35 Auto (Rubber)"
	desc = "A magazine for .35 Auto (Rubber), used in smgs."
	build_path = /obj/item/ammo_magazine/smg_35/rubber
	materials = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 5)

/datum/design/research/item/ammo/pistol_laser
	name = "auto .35, laser case"
	desc = "An auto .35 case fitted with a one time use laser payload."
	build_path = /obj/item/ammo_casing/pistol_35/laser

/datum/design/research/item/ammo/magum_laser
	name = "magnum .40, laser case"
	desc = "A magnum .40 case fitted with a one time use laser payload."
	build_path = /obj/item/ammo_casing/magnum_40/laser

/datum/design/research/item/ammo/rifle_laser
	name = "omni .408 laser casing."
	desc = "A .408 Omni casing fitted with a one time use laser payload."
	build_path = /obj/item/ammo_casing/heavy_rifle_408/laser

/datum/design/research/item/ammo/kurtz_laser
	name = "kurtz .50 , laser case"
	desc = "A .50 kurtz case fitted with a one time use laser payload."
	build_path = /obj/item/ammo_casing/kurtz_50/laser

// Shotgun Ammo

/datum/design/research/item/ammo/shotgun_stun
	name = "shotgun, stun"
	desc = "A stunning shell for a shotgun."
	build_path = /obj/item/ammo_casing/shotgun/stunshell //We print one at a time fore balance

/datum/design/research/item/ammo/shotgun_fire
	name = "shotgun, incendiary"
	desc = "A incendiary shell for a shotgun."
	build_path = /obj/item/ammo_casing/shotgun/incendiary //We print one at a time fore balance

/datum/design/research/item/ammo/shotgun_laser
	name = "shotgun, laser case"
	desc = "A laser based shell for a shotgun."
	build_path = /obj/item/ammo_casing/shotgun/laser //We print one at a time fore balance

// Misc Ammo

/datum/design/research/item/ammo/hatton
	name = "Soteria BT \"Q-del\" gas tube"
	build_path = /obj/item/weapon/hatton_magazine/moebius

/datum/design/research/item/ammo/rapidsyringe
	name = "syringe revolver cartridge"
	build_path = /obj/item/weapon/syringe_cartridge

/datum/design/research/item/ammo/laser
	name = "\"Star Striker\" casing"
	desc = "A single casing for the Star Striker laser rifle."
	build_path = /obj/item/ammo_casing/beam
	materials = list(MATERIAL_STEEL = 1, MATERIAL_GLASS = 1, MATERIAL_SILVER = 0.5) //Takes silver

/datum/design/research/item/ammo/laser/ap
	name = "\"Star Striker\" piercing laser casing."
	desc = "A single casing for the Star Striker laser rifle. Meant for penetration of armor."
	build_path = /obj/item/ammo_casing/beam/ap
	materials = list(MATERIAL_STEEL = 1, MATERIAL_GLASS = 1, MATERIAL_GOLD = 0.5) //Takes gold

/datum/design/research/item/ammo/laser/lethal
	name = "\"Star Striker\" dense laser casing."
	desc = "A single casing for the Star Striker laser rifle. Compact laser that deals more damage but is easily blocked by armor."
	materials = list(MATERIAL_STEEL = 1, MATERIAL_GLASS = 1, MATERIAL_PLASMA = 0.5) //Takes plasma
	build_path = /obj/item/ammo_casing/beam/lethal

//Disks
/datum/design/research/item/disk/blackshield
	name = "Blackshield Sovereignty Disk"
	desc = "A unique disk for printing and creating Blackshield arms and ammunition."
	build_path = /obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield

//Weapon mods
/datum/design/research/item/weapon_upgrade
	name_category = "weapon upgrades"
	category = CAT_WEAPON

/datum/design/research/item/weapon_upgrade/penetrator
	name = "Soteria \"Penetrator\" magnetic accelerator barrel"
	build_path = /obj/item/weapon/gun_upgrade/barrel/mag_accel

/datum/design/research/item/weapon_upgrade/overheat
	name = "Soteria \"Caster\" magnetic overheat barrel"
	build_path = /obj/item/weapon/gun_upgrade/barrel/overheat

// HIGH-TECH GUNMODS
/datum/design/research/item/weapon/gunmod/penetrator
	build_path = /obj/item/weapon/gun_upgrade/barrel/mag_accel
	sort_string = "GAAAA"
	category = CAT_GUNMODS

/datum/design/research/item/weapon/gunmod/overheat
	build_path = /obj/item/weapon/gun_upgrade/barrel/overheat
	sort_string = "GAAAB"
	category = CAT_GUNMODS

/datum/design/research/item/weapon/gunmod/battery_shunt
	build_path = /obj/item/weapon/gun_upgrade/mechanism/battery_shunt
	sort_string = "GAAAC"
	category = CAT_GUNMODS

/datum/design/research/item/weapon/gunmod/overdrive
	build_path = /obj/item/weapon/gun_upgrade/mechanism/overdrive
	sort_string = "GAAAD"
	category = CAT_GUNMODS

/datum/design/research/item/weapon/gunmod/toxin_coater
	build_path = /obj/item/weapon/gun_upgrade/barrel/toxin_coater
	sort_string = "GAAAF"
	category = CAT_GUNMODS
/*
/datum/design/research/item/weapon/gunmod/isotope_diffuser
	build_path = /obj/item/weapon/gun_upgrade/barrel/isotope_diffuser
	sort_string = "GAAAG"
	category = CAT_GUNMODS

/datum/design/research/item/weapon/gunmod/psionic_catalyst
	build_path = /obj/item/weapon/gun_upgrade/mechanism/psionic_catalyst
	sort_string = "GAAAH"
	category = CAT_GUNMODS
*/

// HIGH-TECH TOOLMODS
/datum/design/research/item/weapon/toolmod/stick
	build_path = /obj/item/weapon/tool_upgrade/reinforcement/stick
	sort_string = "TAAAA"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/heatsink
	build_path = /obj/item/weapon/tool_upgrade/reinforcement/heatsink
	sort_string = "TAAAB"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/plating
	build_path = /obj/item/weapon/tool_upgrade/reinforcement/plating
	sort_string = "TAAAC"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/guard
	build_path = /obj/item/weapon/tool_upgrade/reinforcement/guard
	sort_string = "TAAAD"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/plasmablock
	build_path = /obj/item/weapon/tool_upgrade/reinforcement/plasmablock
	sort_string = "TAAAE"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/rubbermesh
	build_path = /obj/item/weapon/tool_upgrade/reinforcement/rubbermesh
	sort_string = "TAAAF"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/ergonomicgrip
	build_path = /obj/item/weapon/tool_upgrade/productivity/ergonomic_grip
	sort_string = "TAAAG"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/ratchet
	build_path = /obj/item/weapon/tool_upgrade/productivity/ratchet
	sort_string = "TAAAH"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/redpaint
	build_path = /obj/item/weapon/tool_upgrade/productivity/red_paint
	sort_string = "TAAAI"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/whetstone
	build_path = /obj/item/weapon/tool_upgrade/productivity/whetstone
	sort_string = "TAAAJ"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/dblade
	build_path = /obj/item/weapon/tool_upgrade/productivity/diamond_blade
	sort_string = "TAAAK"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/oxyjet
	build_path = /obj/item/weapon/tool_upgrade/productivity/oxyjet
	sort_string = "TAAAL"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/motor
	build_path = /obj/item/weapon/tool_upgrade/productivity/motor
	sort_string = "TAAAM"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/antistaining
	build_path = /obj/item/weapon/tool_upgrade/productivity/antistaining
	sort_string = "TAAAN"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/booster
	build_path = /obj/item/weapon/tool_upgrade/productivity/booster
	sort_string = "TAAAO"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/injector
	build_path = /obj/item/weapon/tool_upgrade/productivity/injector
	sort_string = "TAAAP"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/laserguide
	build_path = /obj/item/weapon/tool_upgrade/refinement/laserguide
	sort_string = "TAAAQ"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/stabilizedgrip
	build_path = /obj/item/weapon/tool_upgrade/refinement/stabilized_grip
	sort_string = "TAAAR"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/magbit
	build_path = /obj/item/weapon/tool_upgrade/refinement/magbit
	sort_string = "TAAAS"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/portedbarrel
	build_path = /obj/item/weapon/tool_upgrade/refinement/ported_barrel
	sort_string = "TAAAT"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/compensatedbarrel
	build_path = /obj/item/weapon/tool_upgrade/refinement/compensatedbarrel
	sort_string = "TAAAU"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/vibcompensator
	build_path = /obj/item/weapon/tool_upgrade/refinement/vibcompensator
	sort_string = "TAAAV"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/cellmount
	build_path = /obj/item/weapon/tool_upgrade/augment/cell_mount
	sort_string = "TAAAW"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/fueltank
	build_path = /obj/item/weapon/tool_upgrade/augment/fuel_tank
	sort_string = "TAAAX"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/expansion
	build_path = /obj/item/weapon/tool_upgrade/augment/expansion
	sort_string = "TAAAY"
	category = CAT_TOOLMODS

/datum/design/research/item/weapon/toolmod/spikes
	build_path = /obj/item/weapon/tool_upgrade/augment/spikes
	sort_string = "TAAAZ"
	category = CAT_TOOLMODS
/*
/datum/design/research/item/weapon/toolmod/hammeraddon
	build_path = /obj/item/weapon/tool_upgrade/augment/hammer_addon
	sort_string = "TAABA"
	category = CAT_TOOLMODS
*/
/datum/design/research/item/weapon/toolmod/hydraulic
	build_path = /obj/item/weapon/tool_upgrade/augment/hydraulic
	sort_string = "TAABB"
	category = CAT_TOOLMODS
