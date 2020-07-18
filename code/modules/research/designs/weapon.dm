/datum/design/research/item/weapon
	category = CAT_WEAPON

// Weapons
/datum/design/research/item/weapon/AssembleDesignDesc()
	if(!desc && build_path)
		var/obj/item/I = build_path
		desc = initial(I.desc)
	else
		..()

/datum/design/research/item/weapon/stunrevolver
	build_path = /obj/item/weapon/gun/energy/stunrevolver
	sort_string = "TAAAA"

/datum/design/research/item/weapon/nuclear_gun
	build_path = /obj/item/weapon/gun/energy/gun/nuclear
	sort_string = "TAAAB"

/datum/design/research/item/weapon/lasercannon
	desc = "The lasing medium of this prototype is enclosed in a tube lined with uranium-235 and subjected to high neutron flux in a nuclear reactor core."
	build_path = /obj/item/weapon/gun/energy/lasercannon
	sort_string = "TAAAC"

/datum/design/research/item/weapon/c20r
	name = "C20R-prototype"
	desc = "The C-20r is a lightweight and rapid-firing SMG. Uses .35 rounds."
	build_path = /obj/item/weapon/gun/projectile/automatic/c20r
	sort_string = "TAAAF"

/datum/design/research/item/weapon/centurio
	build_path = /obj/item/weapon/gun/energy/centurio
	sort_string = "TAAAD"

/datum/design/research/item/weapon/auretian
	build_path = /obj/item/weapon/gun/energy/plasma/auretian
	sort_string = "TAAAE"

/datum/design/research/item/weapon/decloner
	build_path = /obj/item/weapon/gun/energy/decloner
	sort_string = "TAAAF"

/datum/design/research/item/weapon/chemsprayer
	desc = "An advanced chem spraying device."
	build_path = /obj/item/weapon/reagent_containers/spray/chemsprayer
	sort_string = "TABAA"

/datum/design/research/item/weapon/rapidsyringe
	build_path = /obj/item/weapon/gun/launcher/syringe/rapid
	sort_string = "TABAB"

/datum/design/research/item/weapon/temp_gun
	desc = "A gun that shoots high-powered glass-encased energy temperature bullets."
	build_path = /obj/item/weapon/gun/energy/temperature
	sort_string = "TABAC"

/datum/design/research/item/weapon/large_grenade
	build_path = /obj/item/weapon/grenade/chem_grenade/large
	sort_string = "TACAA"

/datum/design/research/item/weapon/flora_gun
	build_path = /obj/item/weapon/gun/energy/floragun
	sort_string = "TBAAA"

/datum/design/research/item/weapon/bluespace_harpoon
	build_path = /obj/item/weapon/bluespace_harpoon
	sort_string = "TBAAB"

/datum/design/research/item/weapon/soteriaarmorchest
	name = "'Mark II' enviromental protection suit"
	desc = "For working in hazardous enviroments. While its built for most enviroments, one of those is not space. This suit is a cheap and badly made copy of the Artificer Guilds original design. \
	Unlike its superior, it offers alot less armor but it is made out of basic steel, making it a cheaper, easier alternative to build."
	build_path = /obj/item/clothing/suit/armor/vest/soteriasuit
	sort_string = "TBAAC"

/datum/design/research/item/weapon/soteriaarmorhead
	name = "'Mark II' enviromental protection helmet"
	desc = "You feel like this helmet is cheap, for some reason."
	build_path = /obj/item/clothing/head/helmet/soteriasuit
	sort_string = "TBAAD"

/datum/design/research/item/weapon/medarmor
	name = "soteria medical void armor"
	desc = "A suit of all purpose soteria medical void armor. Used for operations where oxygen is a rarity and protection is needed."
	build_path = /obj/item/clothing/suit/space/void/medarmor
	sort_string = "TBAAE"

/datum/design/research/item/weapon/hatton
	name = "Soteria BT \"Q-del\""
	desc = "This breaching tool was reverse engineered from the \"Hatton\" design. \
			Despite the Artificer's Guild \"Hatton\" being traded on the free market through guild channels, \
			this device suffers from a wide number of reliability issues stemming from it being lathe printed."
	build_path = /obj/item/weapon/hatton/moebius
	sort_string = "TBAAD"

//Starstriker - The gun thats able to strike the stars!
/datum/design/research/item/weapon/starstriker
	name = "\"Star Striker\" laser boltgun"
	desc = "A mix of the lighter version of the Sike point 257 hunting rifle, but with the twist of using laser based casings rather then normal bullet based projectiles."
	build_path = /obj/item/weapon/gun/projectile/boltgun/scout/sci
	sort_string = "TBAAE"

// Ammo
/datum/design/research/item/ammo
	name_category = "ammunition"
	category = CAT_WEAPON

/datum/design/research/item/ammo/shotgun_stun
	name = "shotgun, stun"
	desc = "A stunning shell for a shotgun."
	build_path = /obj/item/ammo_casing/shotgun/stunshell
	sort_string = "TAACB"

/datum/design/research/item/ammo/hatton
	name = "Soteria BT \"Q-del\" gas tube"
	build_path = /obj/item/weapon/hatton_magazine/moebius
	sort_string = "TAACC"

/datum/design/research/item/ammo/rapidsyringe
	name = "syringe revolver cartridge"
	build_path = /obj/item/weapon/syringe_cartridge
	sort_string = "TAACD"

/datum/design/research/item/ammo/laser
	name = "\"Star Striker\" casing"
	desc = "A single casing for the Star Striker laser rifle."
	build_path = /obj/item/ammo_casing/beam
	materials = list(MATERIAL_STEEL = 1, MATERIAL_GLASS = 1, MATERIAL_SILVER = 0.5) //Takes silver
	sort_string = "TAACF"

/datum/design/research/item/ammo/laser/ap
	name = "\"Star Striker\" piercing laser casing."
	desc = "A single casing for the Star Striker laser rifle. Meant for penetration of armor."
	build_path = /obj/item/ammo_casing/beam/ap
	materials = list(MATERIAL_STEEL = 1, MATERIAL_GLASS = 1, MATERIAL_GOLD = 0.5) //Takes gold
	sort_string = "TAACF"

/datum/design/research/item/ammo/laser/lethal
	name = "\"Star Striker\" dense laser casing."
	desc = "A single casing for the Star Striker laser rifle. Compact laser that deals more damage but is easily blocked by armor."
	materials = list(MATERIAL_STEEL = 1, MATERIAL_GLASS = 1, MATERIAL_PLASMA = 0.5) //Takes plasma
	build_path = /obj/item/ammo_casing/beam/lethal
	sort_string = "TAACF"


//Disks
/datum/design/research/item/disk/blackshield
	name = "Blackshield Sovereignty Disk"
	desc = "A unique disk for printing and creating Blackshield arms and ammunition."
	build_path = /obj/item/weapon/computer_hardware/hard_drive/portable/design/blackshield
	sort_string = "TAACE"
