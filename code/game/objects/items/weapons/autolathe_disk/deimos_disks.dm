// Deimos autolathe disks - groups for new Deimos weapon designs

/obj/item/pc_part/drive/disk/design/deimos
	name = "Deimos Armaments Solutions: Solutions Pack"
	desc = "A disk from SI's experimental weapons manufacturing branch. Contains autolathe designs for Deimos pattern weapons."
	icon_state = "deimos"
	license = 20

	designs = list(

	)

/obj/item/pc_part/drive/disk/design/deimos/supply_spec
	name = "Deimos Armaments Solutions: Security Pack"
	desc = "A disk from SI's experimental weapons manufacturing branch. Contains autolathe designs for Deimos pattern weapons. This one is intended explicitly for Nadezhda Security use only."
	icon_state = "deimos-marshal"
	license = 20

	designs = list(
		/datum/design/autolathe/gun/deimos/keris = 2,     // pistol
		/datum/design/autolathe/gun/deimos/celurit = 4,   // carbine
		/datum/design/autolathe/gun/deimos/tombak = 8,    // advanced rifle
		/datum/design/autolathe/gun/deimos/palu = 4,      // CAWS
		/datum/design/autolathe/gun/deimos/golok = 3,     // sabul-type
		/datum/design/autolathe/gun/deimos/parang = 3,   // parang (mabul)
		/datum/design/autolathe/gun/deimos/panah = 10,	// recoilless / rocket
	)

/obj/item/pc_part/drive/disk/design/deimos/caseless
	name = "Deimos Armaments Solutions: Caseless Pack"
	icon_state = "deimos"
	license = 8
	designs = list(
		/datum/design/autolathe/gun/deimos/keris = 2,     // pistol
		/datum/design/autolathe/gun/deimos/celurit = 4,   // carbine
		/datum/design/autolathe/gun/deimos/tombak = 6,    // advanced rifle
		// Ammo designs
		/datum/design/autolathe/ammo/caseless_8x16 = 1, // 8x16mm caseless
		/datum/design/autolathe/ammo/caseless_10x24 = 2, // 10x24mm caseless
		/datum/design/autolathe/ammo/caseless_12x64 = 2, // 12x64mm caseless
	)

/obj/item/pc_part/drive/disk/design/deimos/shotguns
	name = "Deimos Armaments Solutions: Shotgun Pack"
	icon_state = "deimos"
	license = 6
	designs = list(
		/datum/design/autolathe/gun/deimos/palu = 3,      // CAWS
		// Shotgun ammo designs
		/datum/design/autolathe/ammo/sbaw_slug = 1,
		/datum/design/autolathe/ammo/sbaw_beanbag = 1,
		/datum/design/autolathe/ammo/sbaw_pellet = 1,
		/datum/design/autolathe/ammo/m12slug = 3,
		/datum/design/autolathe/ammo/m12beanbag = 3,
		/datum/design/autolathe/ammo/m12pellet = 3,
	)

/obj/item/pc_part/drive/disk/design/deimos/launchers
	name = "Deimos Armaments Solutions: Launcher Pack"
	icon_state = "deimos"
	license = 5
	designs = list(
		/datum/design/autolathe/gun/deimos/golok = 2,     // sabul-type
		/datum/design/autolathe/gun/deimos/parang = 2,   // parang (mabul)
		// grenade ammo designs
		/datum/design/autolathe/ammo/grenade = 1,
		/datum/design/autolathe/ammo/grenade/blast = 1,
		/datum/design/autolathe/ammo/grenade/frag = 1,
		/datum/design/autolathe/ammo/grenade/stinger = 1,
		/datum/design/autolathe/ammo/grenade/emp = 1,
		/datum/design/autolathe/ammo/grenade/flash = 1,
		/datum/design/autolathe/ammo/grenade/netshell = 1,
		
	)

/obj/item/pc_part/drive/disk/design/deimos/rockets
	name = "Deimos Armaments Solutions: Anti-Tank Pack"
	icon_state = "deimos"
	license = 8
	designs = list(
		/datum/design/autolathe/gun/deimos/panah = 4,    // recoilless / rocket
		/datum/design/autolathe/ammo/mini_rocket = 2,          // placeholder: mini-rocket or similar
	)
