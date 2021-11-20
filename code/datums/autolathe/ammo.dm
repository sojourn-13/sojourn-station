// Shotguns

/datum/design/autolathe/ammo/shotgun
	name = "shotgun shells (slug)"
	build_path = /obj/item/ammo_casing/shotgun/prespawned
	materials = list(MATERIAL_STEEL = 5)

/datum/design/autolathe/ammo/shotgun_pellet
	name = "shotgun shells (buckshot)"
	build_path = /obj/item/ammo_casing/shotgun/pellet/prespawned
	materials = list(MATERIAL_STEEL = 5)

/datum/design/autolathe/ammo/shotgun_box
	name = "shotgun shells box (slug)"
	build_path = /obj/item/ammo_magazine/ammobox/shotgun
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/shotgun_pellet_box
	name = "shotgun shells box (buckshot)"
	build_path = /obj/item/ammo_magazine/ammobox/shotgun/buckshot
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/shotgun_blanks
	name = "shotgun shells (blank)"
	build_path = /obj/item/ammo_casing/shotgun/blank/prespawned
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/shotgun_beanbag
	name = "shotgun shells (beanbag)"
	build_path = /obj/item/ammo_casing/shotgun/beanbag/prespawned
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/shotgun_illumination
	name = "shotgun shells (illumination)"
	build_path = /obj/item/ammo_casing/shotgun/illumination/prespawned
	materials = list(MATERIAL_STEEL = 6, MATERIAL_SILVER = 2)

/datum/design/autolathe/ammo/shotgun_plasma
	name = "shotgun shells (Plasma)"
	build_path = /obj/item/ammo_casing/shotgun/plasma/prespawned
	materials = list(MATERIAL_STEEL = 6, MATERIAL_SILVER = 1, MATERIAL_GOLD = 1, MATERIAL_URANIUM = 1)

/datum/design/autolathe/ammo/shotgun_plasma_heavy
	name = "shotgun shells (Heavy Plasma)"
	build_path = /obj/item/ammo_casing/shotgun/plasma_heavy/prespawned
	materials = list(MATERIAL_STEEL = 6, MATERIAL_SILVER = 2, MATERIAL_GOLD = 2, MATERIAL_URANIUM = 2)

/datum/design/autolathe/ammo/shotgun_he
	name = "20mm shells (HEFI)"
	build_path = /obj/item/ammo_casing/shotgun/payload/prespawned
	chemicals = list("phosphorus" = 2)

/datum/design/autolathe/ammo/m12empty
	name = "20mm ammo drum (empty)"
	build_path = /obj/item/ammo_magazine/m12/empty

/datum/design/autolathe/ammo/m12beanbag
	name = "ammo drum (20mm beanbag)"
	build_path = /obj/item/ammo_magazine/m12/beanbag
	materials = list(MATERIAL_STEEL = 8)

/datum/design/autolathe/ammo/m12pellet
	name = "ammo drum (20mm pellet)"
	build_path = /obj/item/ammo_magazine/m12/pellet
	materials = list(MATERIAL_STEEL = 8)

/datum/design/autolathe/ammo/m12slug
	name = "ammo drum (20mm slug)"
	build_path = /obj/item/ammo_magazine/m12
	materials = list(MATERIAL_STEEL = 8)

/datum/design/autolathe/ammo/sbaw_slug
	name = "SBAW magazine (20mm slug)"
	build_path = /obj/item/ammo_magazine/sbaw
	materials = list(MATERIAL_STEEL = 10) //Unlike the pug this one holds 10

/datum/design/autolathe/ammo/sbaw_pellet
	name = "SBAW magazine (20mm buckshot)"
	build_path = /obj/item/ammo_magazine/sbaw/pellet
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/sbaw_beanbag
	name = "SBAW magazine (20mm beanbag)"
	build_path = /obj/item/ammo_magazine/sbaw/beanbag
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/sbaw_payload
	name = "SBAW magazine (20mm HEFI)"
	build_path = /obj/item/ammo_magazine/sbaw/he
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/sbaw_empty
	name = "SBAW magazine (empty)"
	build_path = /obj/item/ammo_magazine/sbaw/empty

//.35 mags

/datum/design/autolathe/ammo/pistol
	name = "standard magazine (.35 Auto)"
	build_path = /obj/item/ammo_magazine/pistol_35
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/pistol_rubber
	name = "standard magazine (.35 Auto rubber)"
	build_path = /obj/item/ammo_magazine/pistol_35/rubber
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/pistol_practice
	name = "standard magazine (.35 Auto practice)"
	build_path = /obj/item/ammo_magazine/pistol_35/practice
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/pistol_lethal
	name = "standard magazine (.35 Auto hollow-point)"
	build_path = /obj/item/ammo_magazine/pistol_35/lethal
	materials = list(MATERIAL_STEEL = 1)

// .35 Highcap

/datum/design/autolathe/ammo/hpistol
	name = "high cap magazine (.35 Auto)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/hpistol_rubber
	name = "high cap magazine (.35 Auto rubber)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/rubber
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/hpistol_practice
	name = "high cap magazine (.35 Auto practice)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/practice
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/hpistol_lethal
	name = "high cap magazine (.35 Auto hollow-point)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/lethal
	materials = list(MATERIAL_STEEL = 2)

//.35 SMG
/datum/design/autolathe/ammo/smg
	name = "SMG magazine (.35 Auto)"
	build_path = /obj/item/ammo_magazine/smg_35
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/smg_rubber
	name = "SMG magazine (.35 Auto rubber)"
	build_path = /obj/item/ammo_magazine/smg_35/rubber
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/smg_practice
	name = "SMG magazine (.35 Auto practice)"
	build_path = /obj/item/ammo_magazine/smg_35/practice
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/smg_lethal
	name = "SMG magazine (.35 Auto hollow-point)"
	build_path = /obj/item/ammo_magazine/smg_35/lethal
	materials = list(MATERIAL_STEEL = 6)

//.35 drum
/datum/design/autolathe/ammo/pistol_35_drum
	name = "standard drum (.35 Auto)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/drum
	materials = list(MATERIAL_STEEL = 18)

/datum/design/autolathe/ammo/pistol_35_drum/empty
	name = "standard drum (.35 Auto empty)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/drum/empty

/datum/design/autolathe/ammo/pistol_35_drum/rubber
	name = "standard drum (.35 Auto rubber)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/drum/rubber
	materials = list(MATERIAL_STEEL = 18)

/datum/design/autolathe/ammo/pistol_35_drum/hv
	name = "standard drum (.35 Auto high-velocity)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/drum/hv
	materials = list(MATERIAL_STEEL = 18)

/datum/design/autolathe/ammo/pistol_35_drum/lethal
	name = "standard drum (.35 Auto hollow-point)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/drum/lethal
	materials = list(MATERIAL_STEEL = 18)


// .35 Speed Loaders

/datum/design/autolathe/ammo/slpistol_practice
	name = "speed loader (.35 Auto practice)"
	build_path = /obj/item/ammo_magazine/speed_loader_pistol_35/practice
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slpistol_rubber
	name = "speed loader (.35 Auto rubber)"
	build_path = /obj/item/ammo_magazine/speed_loader_pistol_35/rubber
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slpistol
	name = "speed loader (.35 Auto)"
	build_path = /obj/item/ammo_magazine/speed_loader_pistol_35
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slpistol_lethal
	name = "speed loader (.35 Auto hollow point)"
	build_path = /obj/item/ammo_magazine/speed_loader_pistol_35/lethal
	materials = list(MATERIAL_STEEL = 1)

// .35 ammobox

/datum/design/autolathe/ammo/pistol_ammobox
	name = "ammunition box (.35 Auto)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/pistol_ammobox_rubber
	name = "ammunition box (.35 Auto rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/rubber
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/pistol_ammobox_practice
	name = "ammunition box (.35 Auto practice)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/practice
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/pistol_ammobox_lethal
	name = "ammunition box (.35 Auto hollow-point)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/lethal
	materials = list(MATERIAL_STEEL = 6)

// .40 Speed Loaders + mags
//speed loaders

/datum/design/autolathe/ammo/slmagnum_practice
	name = "speed loader (.40 Magnum practice)"
	build_path = /obj/item/ammo_magazine/speed_loader_magnum_40/practice
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slmagnum_rubber
	name = "speed loader (.40 Magnum rubber)"
	build_path = /obj/item/ammo_magazine/speed_loader_magnum_40/rubber
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slmagnum
	name = "speed loader (.40 Magnum)"
	build_path = /obj/item/ammo_magazine/speed_loader_magnum_40
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slmagnum_lethal
	name = "speed loader (.40 Magnum hollow-point)"
	build_path = /obj/item/ammo_magazine/speed_loader_magnum_40/lethal
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slmagnum_hv
	name = "speed loader (.40 Magnum high-velocity)"
	build_path = /obj/item/ammo_magazine/speed_loader_magnum_40/highvelocity
	materials = list(MATERIAL_STEEL = 1)


//mags

/datum/design/autolathe/ammo/magnum_practice
	name = "magazine (.40 Auto-Mag practice)"
	build_path = /obj/item/ammo_magazine/magnum_40/practice
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/magnum_rubber
	name = "magazine (.40 Auto-Mag rubber)"
	build_path = /obj/item/ammo_magazine/magnum_40/rubber
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/magnum
	name = "magazine (.40 Auto-Mag)"
	build_path = /obj/item/ammo_magazine/magnum_40
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/magnum_lethal
	name = "magazine (.40 Auto-Mag hollow point)"
	build_path = /obj/item/ammo_magazine/magnum_40/lethal
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/magnum_hv
	name = "magazine (.40 Auto-Mag high-velocity)"
	build_path = /obj/item/ammo_magazine/magnum_40/hv
	materials = list(MATERIAL_STEEL = 3)

//.40 boxes
/datum/design/autolathe/ammo/magnum_ammobox
	name = "ammunition box (.40 Auto-Mag)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40
	materials = list(MATERIAL_STEEL = 9)

/datum/design/autolathe/ammo/magnum_ammobox_lethal
	name = "ammunition box (.40 Auto-Mag hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/lethal
	materials = list(MATERIAL_STEEL = 9)

/datum/design/autolathe/ammo/magnum_ammobox_rubber
	name = "ammunition box (.40 Auto-Mag rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/rubber
	materials = list(MATERIAL_STEEL = 9)

/datum/design/autolathe/ammo/magnum_ammobox_practice
	name = "ammunition box (.40 Auto-Mag practice)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/practice
	materials = list(MATERIAL_STEEL = 9)


//.35 SMG
/datum/design/autolathe/ammo/smg_magnum_40
	name = "SMG magazine (.40 Magnum)"
	build_path = /obj/item/ammo_magazine/smg_magnum_40
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/smg_magnum_40_rubber
	name = "SMG magazine (.40 Magnum rubber)"
	build_path = /obj/item/ammo_magazine/smg_magnum_40/rubber
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/smg_magnum_40_practice
	name = "SMG magazine (.40 Magnum practice)"
	build_path = /obj/item/ammo_magazine/smg_magnum_40/practice
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/smg_magnum_40_lethal
	name = "SMG magazine (.40 Magnum hollow-point)"
	build_path = /obj/item/ammo_magazine/smg_magnum_40/lethal
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/smg_magnum_40_empty
	name = "SMG magazine (.40 Magnum Empty)"
	build_path = /obj/item/ammo_magazine/smg_magnum_40/empty
	materials = list(MATERIAL_STEEL = 12)

// .50 Kurtz mags and speed loaders
//mags

/datum/design/autolathe/ammo/kurtz_rubber
	name = "magazine (.50 Kurtz rubber)"
	build_path = /obj/item/ammo_magazine/kurtz_50/rubber
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/kurtz
	name = "magazine (.50 Kurtz)"
	build_path = /obj/item/ammo_magazine/kurtz_50
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/kurtz_lethal
	name = "magazine (.50 Kurtz hollow point)"
	build_path = /obj/item/ammo_magazine/kurtz_50/lethal
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/kurtz_practice
	name = "magazine (.50 Kurtz practice)"
	build_path = /obj/item/ammo_magazine/kurtz_50/practice
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/kurtz_hv
	name = "magazine (.50 Kurtz high-velocity)"
	build_path = /obj/item/ammo_magazine/kurtz_50/hv
	materials = list(MATERIAL_STEEL = 2)


//speed loaders

/datum/design/autolathe/ammo/slkurtz_rubber
	name = "speed loader (.50 Kurtz rubber)"
	build_path = /obj/item/ammo_magazine/speed_loader_kurtz_50/rubber
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slkurtz
	name = "speed loader (.50 Kurtz)"
	build_path = /obj/item/ammo_magazine/speed_loader_kurtz_50
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slkurtz_lethal
	name = "speed loader (.50 Kurtz hollow point)"
	build_path = /obj/item/ammo_magazine/speed_loader_kurtz_50/lethal
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slkurtz_practice
	name = "speed loader (.50 Kurtz practice)"
	build_path = /obj/item/ammo_magazine/speed_loader_kurtz_50/practice
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slkurtz_hv
	name = "speed loader (.50 Kurtz high-velocity)"
	build_path = /obj/item/ammo_magazine/speed_loader_kurtz_50/highvelocity
	materials = list(MATERIAL_STEEL = 1)

//.50 Kurtz boxes
/datum/design/autolathe/ammo/kurtz_ammobox
	name = "ammunition box (.50 Kurtz)"
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/kurtz_ammobox_rubber
	name = "ammunition box (.50 Kurtz rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50/rubber
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/kurtz_ammobox_practice
	name = "ammunition box (.50 Kurtz practice)"
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50/practice
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/kurtz_ammobox_hv
	name = "ammunition box (.50 Kurtz high-velocity)"
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50/hv
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/kurtz_ammobox_lethal
	name = "ammunition box (.50 Kurtz hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50/lethal
	materials = list(MATERIAL_STEEL = 12)


//.257 Carbine

/datum/design/autolathe/ammo/lrifle
	name = ".257 carbine magazine (ball)"
	build_path = /obj/item/ammo_magazine/light_rifle_257
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/lrifle_practice
	name = ".257 carbine magazine (practice)"
	build_path = /obj/item/ammo_magazine/light_rifle_257/practice
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/lrifle_rubber
	name = ".257 carbine magazine (rubber)"
	build_path = /obj/item/ammo_magazine/light_rifle_257/rubber
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/lrifle_lethal
	name = ".257 carbine magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/light_rifle_257/lethal
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/lrifle_short
	name = ".257 short carbine magazine (ball)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_short
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/lrifle_short_rubber
	name = "short .257 carbine magazine (rubber)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_short/rubber
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/lrifle_short_practice
	name = "short .257 carbine magazine (practice)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_short/practice
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/lrifle_short_lethal
	name = "short .257 carbine magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_short/lethal
	materials = list(MATERIAL_STEEL = 2)


//.257 box and speed loader
/datum/design/autolathe/ammo/lrifle_ammobox
	name = "ammunition box .257 Carbine (ball)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257
	materials = list(MATERIAL_STEEL = 20)

/datum/design/autolathe/ammo/lrifle_ammobox_rubber
	name = "ammunition box .257 Carbine (rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257/rubber
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/lrifle_ammobox_small
	name = "ammunition box .257 Carbine (ball)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257_small
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/lrifle_ammobox_small_practice
	name = "ammunition box .257 Carbine (practice)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257_small/practice
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber
	name = "ammunition box .257 Carbine (rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal
	name = "ammunition box .257 Carbine (hollow-point)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257_small/lethal
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/lrifle_belt
	name = "linked ammunition box .257 Carbine (ball)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257
	materials = list(MATERIAL_STEEL = 7)

/datum/design/autolathe/ammo/lrifle_belt_empty
	name = "linked ammunition box .257 Carbine (empty)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/empty

/datum/design/autolathe/ammo/lrifle_speed_loader
	name = "stripper clip .257 Carbine (ball)"
	build_path = /obj/item/ammo_magazine/speed_loader_light_rifle_257
	materials = list(MATERIAL_STEEL = 0.1)

//7.62 rifle
//mags

/datum/design/autolathe/ammo/rifle
	name = "7.5mm Rifle magazine (ball)"
	build_path = /obj/item/ammo_magazine/rifle_75
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/rifle_rubber
	name = "7.5mm Rifle magazine (rubber)"
	build_path = /obj/item/ammo_magazine/rifle_75/rubber
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/rifle_practice
	name = "7.5mm Rifle magazine (practice)"
	build_path = /obj/item/ammo_magazine/rifle_75/practice
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/rifle_hv
	name = "7.5mm Rifle magazine (AP)"
	build_path = /obj/item/ammo_magazine/rifle_75/highvelocity
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/rifle_lethal
	name = "7.5mm Rifle magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/rifle_75/lethal
	materials = list(MATERIAL_STEEL = 2)

//short

/datum/design/autolathe/ammo/rifle_short
	name = "short 7.5mm Rifle magazine (ball)"
	build_path = /obj/item/ammo_magazine/rifle_75_short
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/rifle_short_rubber
	name = "short 7.5mm Rifle magazine (rubber)"
	build_path = /obj/item/ammo_magazine/rifle_75_short/rubber
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/rifle_short_practice
	name = "short 7.5mm Rifle magazine (practice)"
	build_path = /obj/item/ammo_magazine/rifle_75_short/practice
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/rifle_short_hv
	name = "short 7.5mm Rifle magazine (AP)"
	build_path = /obj/item/ammo_magazine/rifle_75_short/highvelocity
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/rifle_short_lethal
	name = "short 7.5mm Rifle magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/rifle_75_short/lethal
	materials = list(MATERIAL_STEEL = 1)

///boxes and stripper clips

/datum/design/autolathe/ammo/rifle_ammobox
	name = "ammunition box 7.5mm Rifle (ball)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75
	materials = list(MATERIAL_STEEL = 5)

/datum/design/autolathe/ammo/sl_rifle
	name = "stripper clip 7.5mm Rifle (ball)"
	build_path = /obj/item/ammo_magazine/speed_loader_rifle_75
	materials = list(MATERIAL_STEEL = 5)

/datum/design/autolathe/ammo/rifle_ammobox_small
	name = "ammunition packet 7.5mm Rifle (ball)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_ammobox_small_practice
	name = "ammunition packet 7.5mm Rifle (practice)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small/practice
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_ammobox_small_rubber
	name = "ammunition packet 7.5mm Rifle (rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small/rubber
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_ammobox_small_lethal
	name = "ammunition packet 7.5mm Rifle (hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small/lethal
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_ammobox_small_hv
	name = "ammunition packet 7.5mm Rifle (AP)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small/hv
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_pk
	name = "linked ammunition box 7.5mm Rifle (ball)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box
	materials = list(MATERIAL_STEEL = 5)

/datum/design/autolathe/ammo/rifle_pk_empty
	name = "linked ammunition box 7.5mm Rifle (empty)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/empty

/datum/design/autolathe/ammo/maxim
	name = "pan magazine 7.5mm Rifle (ball)"
	build_path = /obj/item/ammo_magazine/maxim_75
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/maxim_empty
	name = "pan magazine 7.5mm Rifle (empty)"
	build_path = /obj/item/ammo_magazine/maxim_75/empty

//.408 rifle

/datum/design/autolathe/ammo/hrifle
	name = ".408 heavy rifle magazine (ball)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/hrifle_rubber
	name = ".408 heavy rifle magazine (rubber)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408/rubber
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/hrifle_practice
	name = ".408 heavy rifle magazine (practice)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408/practice
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/hrifle_hv
	name = ".408 heavy rifle magazine (SLAP)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408/hv
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/hrifle_lethal
	name = ".408 heavy rifle magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408/lethal
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/hrifle_drum
	name = ".408 heavy rifle drum (ball)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408_drum
	materials = list(MATERIAL_STEEL = 9)

/datum/design/autolathe/ammo/hrifle_drum_empty
	name = ".408 heavy rifle drum (empty)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408_drum/empty
	materials = list(MATERIAL_STEEL = 3)

//.408 rifle boxes
/datum/design/autolathe/ammo/hrifle_ammobox
	name = "ammunition box .408 H-Rifle(ball)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408
	materials = list(MATERIAL_STEEL = 20)

/datum/design/autolathe/ammo/hrifle_ammobox_rubber
	name = "ammunition box .408 H-Rifle(rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408/rubber
	materials = list(MATERIAL_STEEL = 20)

/datum/design/autolathe/ammo/hrifle_ammobox_practice
	name = "ammunition box .408 (training)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408/practice
	materials = list(MATERIAL_STEEL = 20)

/datum/design/autolathe/ammo/hrifle_ammobox_hv
	name = "ammunition box .408 H-Rifle (SLAP)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv
	materials = list(MATERIAL_STEEL = 20, MATERIAL_PLASTEEL = 10)

/datum/design/autolathe/ammo/hrifle_ammobox_lethal
	name = "ammunition box .408 H-Rifle (hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408/lethal
	materials = list(MATERIAL_STEEL = 20)

///.408 packets
/datum/design/autolathe/ammo/hrifle_ammobox_small
	name = "ammunition packet .408 Heavy Rifle (ball)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/hrifle_ammobox_small_practice
	name = "ammunition packet .408 Heavy Rifle (practice)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/practice
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/hrifle_ammobox_small_rubber
	name = "ammunition packet .408 Heavy Rifle (rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/rubber
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/hrifle_ammobox_small_lethal
	name = "ammunition packet .408 Heavy Rifle (hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/lethal
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/hrifle_ammobox_small_hv
	name = "ammunition packet .408 Heavy Rifle (AP)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/hv
	materials = list(MATERIAL_STEEL = 15)

//snowflake caseless
/datum/design/autolathe/ammo/c10x24
	name = "box magazine (10x24mm Caseless)"
	build_path = /obj/item/ammo_magazine/c10x24
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/box_10x24
	name = "ammo box (10x24mm Caseless)"
	build_path = /obj/item/ammo_magazine/ammobox/c10x24
	materials = list(MATERIAL_STEEL = 5)

/datum/design/autolathe/ammo/mag_10x24
	name = "magazine (10x24mm Caseless)"
	build_path = /obj/item/ammo_magazine/rifle_10x24
	materials = list(MATERIAL_STEEL = 2)

//.60-06
/datum/design/autolathe/ammo/box_antim
	name = "ammunition box (.60-06)"
	build_path = /obj/item/ammo_magazine/ammobox/antim
	materials = list(MATERIAL_STEEL = 30, MATERIAL_PLASTEEL = 30)

/datum/design/autolathe/ammo/antim
	name = "loose shells (.60-06)"
	build_path = /obj/item/ammo_casing/antim/prespawned
	materials = list(MATERIAL_STEEL = 5, MATERIAL_PLASTEEL = 5)

// Grenade Shells

/datum/design/autolathe/ammo/grenade
	name = "baton round"
	build_path = /obj/item/ammo_casing/grenade
	materials = list(MATERIAL_STEEL = 2, MATERIAL_PLASTIC = 2)

/datum/design/autolathe/ammo/grenade/blast
	name = "blast grenade shell"
	build_path = /obj/item/ammo_casing/grenade/blast
	materials = list(MATERIAL_STEEL = 2, MATERIAL_PLASMA = 0.5)

/datum/design/autolathe/ammo/grenade/frag
	name = "fragmentation grenade shell"
	build_path = /obj/item/ammo_casing/grenade/frag
	materials = list(MATERIAL_STEEL = 14)

/datum/design/autolathe/ammo/grenade/emp
	name = "EMP grenade shell"
	build_path = /obj/item/ammo_casing/grenade/emp
	materials = list(MATERIAL_STEEL = 2, MATERIAL_IRON = 1, MATERIAL_URANIUM = 1)

/datum/design/autolathe/ammo/grenade/flash
	name= "flash grenade shell"
	build_path = /obj/item/ammo_casing/grenade/flash
	materials = list(MATERIAL_STEEL = 4, MATERIAL_SILVER = 0.5, MATERIAL_GLASS = 0.5)

// Flare Shells
/datum/design/autolathe/ammo/flare_shell
	name = ".22 red flare shell"
	build_path = /obj/item/ammo_casing/flare/prespawn

/datum/design/autolathe/ammo/flare_shell_b
	name = ".22blue flare shell"
	build_path = /obj/item/ammo_casing/flare/blue/prespawn

/datum/design/autolathe/ammo/flare_shell_g
	name = ".22green flare shell"
	build_path = /obj/item/ammo_casing/flare/green/prespawn