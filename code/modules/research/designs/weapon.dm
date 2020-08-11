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
	category = CAT_WEAPON

/datum/design/research/item/ammo/smg_mag
	name = "smg magazine .35 Auto (Empty) "
	desc = "A magazine for .35 Auto, used in smgs."
	build_path = /obj/item/ammo_magazine/smg/empty
	materials = list(MATERIAL_STEEL = 15)

/datum/design/research/item/ammo/smg_mag/lethal
	name = "smg magazine .35 Auto"
	desc = "A magazine for .35 auto, used in smgs."
	build_path = /obj/item/ammo_magazine/smg
	materials = list(MATERIAL_STEEL = 30)

/datum/design/research/item/ammo/smg_mag/rubber
	name = "smg magazine .35 Auto (Rubber)"
	desc = "A magazine for .35 Auto (Rubber), used in smgs."
	build_path = /obj/item/ammo_magazine/smg/rubber
	materials = list(MATERIAL_STEEL = 15, MATERIAL_PLASTIC = 5)

// Shotgun Ammo

/datum/design/research/item/ammo/shotgun_stun
	name = "shotgun, stun"
	desc = "A stunning shell for a shotgun."
	build_path = /obj/item/ammo_casing/shotgun/stunshell //We print one at a time fore balance

/datum/design/research/item/ammo/shotgun_fire
	name = "shotgun, incendiary"
	desc = "A incendiary shell for a shotgun."
	build_path = /obj/item/projectile/bullet/shotgun/incendiary //We print one at a time fore balance

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
