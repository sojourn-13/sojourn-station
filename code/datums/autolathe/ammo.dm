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
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/shotgun_pellet_box
	name = "shotgun shells box (buckshot)"
	build_path = /obj/item/ammo_magazine/ammobox/shotgun/buckshot
	materials = list(MATERIAL_STEEL = 15)

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
	materials = list(MATERIAL_STEEL = 6, MATERIAL_SILVER = 0.6, MATERIAL_GOLD = 0.6, MATERIAL_URANIUM = 0.6)

/datum/design/autolathe/ammo/shotgun_plasma_heavy
	name = "shotgun shells (Heavy Plasma)"
	build_path = /obj/item/ammo_casing/shotgun/plasma_heavy/prespawned
	materials = list(MATERIAL_STEEL = 6, MATERIAL_SILVER = 1, MATERIAL_GOLD = 1, MATERIAL_URANIUM = 1)

/datum/design/autolathe/ammo/shotgun_biomatter
	name = "shotgun shells box (caustic)"
	build_path = /obj/item/ammo_magazine/ammobox/shotgun/biomatter
	materials = list(MATERIAL_BIOMATTER = 60) //Double the cost of magnum rounds, i guess? It works.
/*
/datum/design/autolathe/ammo/shotgun_he
	name = "20mm shells (HEFI)"
	build_path = /obj/item/ammo_casing/shotgun/payload/prespawned
	chemicals = list("phosphorus" = 2)
*/
/datum/design/autolathe/ammo/shotgun_speedloader_slug
	name = "20mm loader tube (slug)"
	build_path = /obj/item/ammo_magazine/speed_loader_shotgun
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/shotgun_speedloader_buckshot
	name = "20mm loader tube (buckshot)"
	build_path = /obj/item/ammo_magazine/speed_loader_shotgun/pellet
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/shotgun_speedloader_beanbag
	name = "20mm loader tube (beanbag)"
	build_path = /obj/item/ammo_magazine/speed_loader_shotgun/beanbag
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/shotgun_speedloader_empty
	name = "20mm loader tube (empty)"
	build_path = /obj/item/ammo_magazine/speed_loader_shotgun/empty

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
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/sbaw_pellet
	name = "SBAW magazine (20mm buckshot)"
	build_path = /obj/item/ammo_magazine/sbaw/pellet
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/sbaw_beanbag
	name = "SBAW magazine (20mm beanbag)"
	build_path = /obj/item/ammo_magazine/sbaw/beanbag
	materials = list(MATERIAL_STEEL = 10)
/*
/datum/design/autolathe/ammo/sbaw_payload
	name = "SBAW magazine (20mm HEFI)"
	build_path = /obj/item/ammo_magazine/sbaw/he
	materials = list(MATERIAL_STEEL = 10)
*/
/datum/design/autolathe/ammo/sbaw_empty
	name = "SBAW magazine (empty)"
	build_path = /obj/item/ammo_magazine/sbaw/empty

//9mm mags

/datum/design/autolathe/ammo/pistol
	name = "standard magazine (9mm)"
	build_path = /obj/item/ammo_magazine/pistol_35
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/pistol_rubber
	name = "standard magazine (9mm rubber)"
	build_path = /obj/item/ammo_magazine/pistol_35/rubber
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/pistol_practice
	name = "standard magazine (9mm practice)"
	build_path = /obj/item/ammo_magazine/pistol_35/practice
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/pistol_lethal
	name = "standard magazine (9mm hollow-point)"
	build_path = /obj/item/ammo_magazine/pistol_35/lethal
	materials = list(MATERIAL_STEEL = 1)

// 9mm Highcap

/datum/design/autolathe/ammo/hpistol
	name = "high cap magazine (9mm)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/hpistol_rubber
	name = "high cap magazine (9mm rubber)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/rubber
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/hpistol_practice
	name = "high cap magazine (9mm practice)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/practice
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/hpistol_lethal
	name = "high cap magazine (9mm hollow-point)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/lethal
	materials = list(MATERIAL_STEEL = 2)

//9mm SMG
/datum/design/autolathe/ammo/smg
	name = "SMG magazine (9mm SMG)"
	build_path = /obj/item/ammo_magazine/smg_35
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/smg_rubber
	name = "SMG magazine (9mm rubber)"
	build_path = /obj/item/ammo_magazine/smg_35/rubber
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/smg_practice
	name = "SMG magazine (9mm practice)"
	build_path = /obj/item/ammo_magazine/smg_35/practice
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/smg_lethal
	name = "SMG magazine (9mm hollow-point)"
	build_path = /obj/item/ammo_magazine/smg_35/lethal
	materials = list(MATERIAL_STEEL = 6)

//9mm drum
/datum/design/autolathe/ammo/pistol_35_drum
	name = "standard drum (9mm)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/drum
	materials = list(MATERIAL_STEEL = 18)

/datum/design/autolathe/ammo/pistol_35_drum/empty
	name = "standard drum (9mm empty)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/drum/empty

/datum/design/autolathe/ammo/pistol_35_drum/rubber
	name = "standard drum (9mm rubber)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/drum/rubber
	materials = list(MATERIAL_STEEL = 18)

/datum/design/autolathe/ammo/pistol_35_drum/hv
	name = "standard drum (9mm high-velocity)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/drum/hv
	materials = list(MATERIAL_STEEL = 18)

/datum/design/autolathe/ammo/pistol_35_drum/lethal
	name = "standard drum (9mm hollow-point)"
	build_path = /obj/item/ammo_magazine/highcap_pistol_35/drum/lethal
	materials = list(MATERIAL_STEEL = 18)


// 9mm Speed Loaders

/datum/design/autolathe/ammo/slpistol_practice
	name = "speed loader (9mm practice)"
	build_path = /obj/item/ammo_magazine/speed_loader_pistol_35/practice
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slpistol_rubber
	name = "speed loader (9mm rubber)"
	build_path = /obj/item/ammo_magazine/speed_loader_pistol_35/rubber
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slpistol
	name = "speed loader (9mm)"
	build_path = /obj/item/ammo_magazine/speed_loader_pistol_35
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slpistol_lethal
	name = "speed loader (9mm hollow point)"
	build_path = /obj/item/ammo_magazine/speed_loader_pistol_35/lethal
	materials = list(MATERIAL_STEEL = 1)

// 9mm ammobox

/datum/design/autolathe/ammo/pistol_ammobox
	name = "ammunition box (9mm)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/pistol_ammobox_rubber
	name = "ammunition box (9mm rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/rubber
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/pistol_ammobox_practice
	name = "ammunition box (9mm practice)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/practice
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/pistol_ammobox_lethal
	name = "ammunition box (9mm hollow-point)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/lethal
	materials = list(MATERIAL_STEEL = 6)

/datum/design/autolathe/ammo/pistol_ammobox_biomatter
	name = "ammunition box (9mm Caustic)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/biomatter
	materials = list(MATERIAL_BIOMATTER = 20)

//9mm large box
/datum/design/autolathe/ammo/pistol_ammobox/large
	name = "large ammunition box(9mm)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/large
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/pistol_ammobox/largelethal
	name = "large ammunition box(9mm hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/large/lethal
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/pistol_ammobox/largerubber
	name = "large ammunition box(9mm rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/large/rubber
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/pistol_ammobox/largehv
	name = "large ammunition box(9mm high-velocity)"
	build_path = /obj/item/ammo_magazine/ammobox/pistol_35/large/hv
	materials = list(MATERIAL_STEEL = 12)

// 10mm Speed Loaders + mags
//speed loaders

/datum/design/autolathe/ammo/slmagnum_practice
	name = "speed loader (10mm Magnum practice)"
	build_path = /obj/item/ammo_magazine/speed_loader_magnum_40/practice
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slmagnum_rubber
	name = "speed loader (10mm Magnum rubber)"
	build_path = /obj/item/ammo_magazine/speed_loader_magnum_40/rubber
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slmagnum
	name = "speed loader (10mm Magnum)"
	build_path = /obj/item/ammo_magazine/speed_loader_magnum_40
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slmagnum_lethal
	name = "speed loader (10mm Magnum hollow-point)"
	build_path = /obj/item/ammo_magazine/speed_loader_magnum_40/lethal
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slmagnum_hv
	name = "speed loader (10mm Magnum high-velocity)"
	build_path = /obj/item/ammo_magazine/speed_loader_magnum_40/highvelocity
	materials = list(MATERIAL_STEEL = 1)


//mags

/datum/design/autolathe/ammo/magnum_practice
	name = "magazine (10mm Auto-Mag practice)"
	build_path = /obj/item/ammo_magazine/magnum_40/practice
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/magnum_rubber
	name = "magazine (10mm Auto-Mag rubber)"
	build_path = /obj/item/ammo_magazine/magnum_40/rubber
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/magnum_pepperball
	name = "magazine (10mm Auto-Mag pepperspray)"
	build_path = /obj/item/ammo_magazine/magnum_40/rubber/pepperball
	materials = list(MATERIAL_STEEL = 3, MATERIAL_PLASTIC = 2)
	chemicals = list("condensedcapsaicin" = 5)


/datum/design/autolathe/ammo/magnum
	name = "magazine (10mm Auto-Mag)"
	build_path = /obj/item/ammo_magazine/magnum_40
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/magnum_lethal
	name = "magazine (10mm Auto-Mag hollow point)"
	build_path = /obj/item/ammo_magazine/magnum_40/lethal
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/magnum_hv
	name = "magazine (10mm Auto-Mag high-velocity)"
	build_path = /obj/item/ammo_magazine/magnum_40/hv
	materials = list(MATERIAL_STEEL = 3)

//10mm boxes
/datum/design/autolathe/ammo/magnum_ammobox
	name = "ammunition box (10mm Auto-Mag)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40
	materials = list(MATERIAL_STEEL = 9)

/datum/design/autolathe/ammo/magnum_ammobox_lethal
	name = "ammunition box (10mm Auto-Mag hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/lethal
	materials = list(MATERIAL_STEEL = 9)

/datum/design/autolathe/ammo/magnum_ammobox_rubber
	name = "ammunition box (10mm Auto-Mag rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/rubber
	materials = list(MATERIAL_STEEL = 9)

/datum/design/autolathe/ammo/magnum_ammobox_pepperball
	name = "ammunition box (10mm Auto-Mag pepperspray)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/rubber/pepperball
	materials = list(MATERIAL_PLASTIC = 9)
	chemicals = list("condensedcapsaicin" = 150)

/datum/design/autolathe/ammo/magnum_ammobox_practice
	name = "ammunition box (10mm Auto-Mag practice)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/practice
	materials = list(MATERIAL_STEEL = 9)

/datum/design/autolathe/ammo/magnum_ammobox_biomatter
	name = "ammunition box (10mm Auto-Mag Caustic)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/biomatter
	materials = list(MATERIAL_BIOMATTER = 25)

// 10mm magnum large boxes
/datum/design/autolathe/ammo/magnum_ammobox/large
	name = "large ammunition box (10mm Auto-Mag)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/large
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/magnum_ammobox/largehp
	name = "large ammunition box (10mm Auto-Mag hollow-point)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/large/lethal
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/magnum_ammobox/largerubber
	name = "large ammunition box (10mm Auto-Mag rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/large/rubber
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/magnum_ammobox/largehv
	name = "large ammunition box (10mm Auto-Mag high-velocity)"
	build_path = /obj/item/ammo_magazine/ammobox/magnum_40/large/hv
	materials = list(MATERIAL_STEEL = 15)

//10mm Magnum SMG
/datum/design/autolathe/ammo/smg_magnum_40
	name = "SMG magazine (10mm Magnum)"
	build_path = /obj/item/ammo_magazine/smg_magnum_40
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/smg_magnum_40_rubber
	name = "SMG magazine (10mm Magnum rubber)"
	build_path = /obj/item/ammo_magazine/smg_magnum_40/rubber
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/smg_magnum_40_practice
	name = "SMG magazine (10mm Magnum practice)"
	build_path = /obj/item/ammo_magazine/smg_magnum_40/practice
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/smg_magnum_40_lethal
	name = "SMG magazine (10mm Magnum hollow-point)"
	build_path = /obj/item/ammo_magazine/smg_magnum_40/lethal
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/smg_magnum_40_empty
	name = "SMG magazine (10mm Magnum Empty)"
	build_path = /obj/item/ammo_magazine/smg_magnum_40/empty
	materials = list(MATERIAL_STEEL = 12)



// 12mm Kurtz mags and speed loaders
//mags

/datum/design/autolathe/ammo/kurtz_rubber
	name = "magazine (12mm rubber)"
	build_path = /obj/item/ammo_magazine/kurtz_50/rubber
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/kurtz
	name = "magazine (12mm)"
	build_path = /obj/item/ammo_magazine/kurtz_50
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/kurtz_lethal
	name = "magazine (12mm hollow point)"
	build_path = /obj/item/ammo_magazine/kurtz_50/lethal
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/kurtz_practice
	name = "magazine (12mm practice)"
	build_path = /obj/item/ammo_magazine/kurtz_50/practice
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/kurtz_hv
	name = "magazine (12mm high-velocity)"
	build_path = /obj/item/ammo_magazine/kurtz_50/hv
	materials = list(MATERIAL_STEEL = 2)


//speed loaders

/datum/design/autolathe/ammo/slkurtz_rubber
	name = "speed loader (12mm rubber)"
	build_path = /obj/item/ammo_magazine/speed_loader_kurtz_50/rubber
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slkurtz
	name = "speed loader (12mm Kurtz)"
	build_path = /obj/item/ammo_magazine/speed_loader_kurtz_50
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slkurtz_lethal
	name = "speed loader (12mm hollow point)"
	build_path = /obj/item/ammo_magazine/speed_loader_kurtz_50/lethal
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slkurtz_practice
	name = "speed loader (12mm practice)"
	build_path = /obj/item/ammo_magazine/speed_loader_kurtz_50/practice
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/slkurtz_hv
	name = "speed loader (12mm high-velocity)"
	build_path = /obj/item/ammo_magazine/speed_loader_kurtz_50/highvelocity
	materials = list(MATERIAL_STEEL = 1)

//12mm Kurtz boxes
/datum/design/autolathe/ammo/kurtz_ammobox
	name = "ammunition box (12mm)"
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/kurtz_ammobox_rubber
	name = "ammunition box (12mm rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50/rubber
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/kurtz_ammobox_practice
	name = "ammunition box (12mm practice)"
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50/practice
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/kurtz_ammobox_hv
	name = "ammunition box (12mm high-velocity)"
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50/hv
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/kurtz_ammobox_lethal
	name = "ammunition box (12mm hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/kurtz_50/lethal
	materials = list(MATERIAL_STEEL = 12)


//6mm Carbine

/datum/design/autolathe/ammo/lrifle
	name = "6.5×39mm carbine magazine (ball)"
	build_path = /obj/item/ammo_magazine/light_rifle_257
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/lrifle_practice
	name = "6.5×39mm carbine magazine (practice)"
	build_path = /obj/item/ammo_magazine/light_rifle_257/practice
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/lrifle_rubber
	name = "6.5×39mm carbine magazine (rubber)"
	build_path = /obj/item/ammo_magazine/light_rifle_257/rubber
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/lrifle_lethal
	name = "6.5×39mm carbine magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/light_rifle_257/lethal
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/lrifle_short
	name = "short 6.5×39mm carbine magazine (ball)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_short
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/lrifle_short_rubber
	name = "short 6.5×39mm carbine magazine (rubber)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_short/rubber
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/lrifle_short_practice
	name = "short 6.5×39mm carbine magazine (practice)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_short/practice
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/lrifle_short_lethal
	name = "short 6.5×39mm carbine magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_short/lethal
	materials = list(MATERIAL_STEEL = 2)

//drums

/datum/design/autolathe/ammo/lrifle_drum
	name = "6.5×39mm carbine drum magazine (ball)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_drum
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/lrifle_drum_practice
	name = "6.5×39mm carbine drum magazine (practice)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_drum/practice
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/lrifle_drum_rubber
	name = "6.5×39mm carbine drum magazine (rubber)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_drum/rubber
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/lrifle_drum_lethal
	name = "6.5×39mm carbine drum magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_drum/lethal
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/lrifle_drum_hv
	name = "6.5×39mm carbine drum magazine (high velocity)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_drum/highvelocity
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/lrifle_drum_empty
	name = "6.5×39mm carbine drum magazine (empty)"
	build_path = /obj/item/ammo_magazine/light_rifle_257_drum/empty
	materials = list(MATERIAL_STEEL = 6)

//6mm carbine box and speed loader
/datum/design/autolathe/ammo/lrifle_ammobox
	name = "ammunition box 6.5×39mm Carbine (ball)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257
	materials = list(MATERIAL_STEEL = 20)

/datum/design/autolathe/ammo/lrifle_ammobox_lethal
	name = "ammunitioon box 6.5×39mm Carbine (hollow-point)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257/lethal

/datum/design/autolathe/ammo/lrifle_ammobox_rubber
	name = "ammunition box 6.5×39mm Carbine (rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257/rubber
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/lrifle_ammobox_small
	name = "ammunition box 6.5×39mm Carbine (ball)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257_small
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/lrifle_ammobox_small_practice
	name = "ammunition box 6.5×39mm Carbine (practice)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257_small/practice
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/lrifle_ammobox_small_rubber
	name = "ammunition box 6.5×39mm Carbine (rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257_small/rubber
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/lrifle_ammobox_small_lethal
	name = "ammunition box 6.5×39mm Carbine (hollow-point)"
	build_path = /obj/item/ammo_magazine/ammobox/light_rifle_257_small/lethal
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/lrifle_belt
	name = "linked ammunition box 6.5×39mm Carbine (ball)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257
	materials = list(MATERIAL_STEEL = 7)

/datum/design/autolathe/ammo/lrifle_belt_empty
	name = "linked ammunition box 6.5×39mm Carbine (empty)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/empty

/datum/design/autolathe/ammo/lrifle_speed_loader
	name = "stripper clip 6.5×39mm Carbine (ball)"
	build_path = /obj/item/ammo_magazine/speed_loader_light_rifle_257
	materials = list(MATERIAL_STEEL = 0.1)

//7.62 rifle
//mags

/datum/design/autolathe/ammo/rifle
	name = "7.62×39mm Rifle magazine (ball)"
	build_path = /obj/item/ammo_magazine/rifle_75
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/rifle_rubber
	name = "7.62×39mm Rifle magazine (rubber)"
	build_path = /obj/item/ammo_magazine/rifle_75/rubber
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/rifle_practice
	name = "7.62×39mm Rifle magazine (practice)"
	build_path = /obj/item/ammo_magazine/rifle_75/practice
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/rifle_hv
	name = "7.62×39mm Rifle magazine (APDS)"
	build_path = /obj/item/ammo_magazine/rifle_75/highvelocity
	materials = list(MATERIAL_STEEL = 2)

/datum/design/autolathe/ammo/rifle_lethal
	name = "7.62×39mm Rifle magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/rifle_75/lethal
	materials = list(MATERIAL_STEEL = 2)

//short

/datum/design/autolathe/ammo/rifle_short
	name = "short 7.62×39mm Rifle magazine (ball)"
	build_path = /obj/item/ammo_magazine/rifle_75_short
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/rifle_short_rubber
	name = "short 7.62×39mm Rifle magazine (rubber)"
	build_path = /obj/item/ammo_magazine/rifle_75_short/rubber
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/rifle_short_practice
	name = "short 7.62×39mm Rifle magazine (practice)"
	build_path = /obj/item/ammo_magazine/rifle_75_short/practice
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/rifle_short_hv
	name = "short 7.62×39mm Rifle magazine (APDS)"
	build_path = /obj/item/ammo_magazine/rifle_75_short/highvelocity
	materials = list(MATERIAL_STEEL = 1)

/datum/design/autolathe/ammo/rifle_short_lethal
	name = "short 7.62×39mm Rifle magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/rifle_75_short/lethal
	materials = list(MATERIAL_STEEL = 1)

//drum

/datum/design/autolathe/ammo/rifle_drum
	name = "7.62×39mm Rifle drum magazine (ball)"
	build_path = /obj/item/ammo_magazine/rifle_75_drum
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_drum_rubber
	name = "7.62×39mm Rifle drum magazine (rubber)"
	build_path = /obj/item/ammo_magazine/rifle_75_drum/rubber
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_drum_practice
	name = "7.62×39mm Rifle drum magazine (practice)"
	build_path = /obj/item/ammo_magazine/rifle_75_drum/practice
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_drum_hv
	name = "7.62×39mm Rifle drum magazine (APDS)"
	build_path = /obj/item/ammo_magazine/rifle_75_drum/highvelocity
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_drum_lethal
	name = "7.62×39mm Rifle drum magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/rifle_75_drum/lethal
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_drum_empty
	name = "7.62×39mm Rifle drum magazine (empty)"
	build_path = /obj/item/ammo_magazine/rifle_75_drum/empty
	materials = list(MATERIAL_STEEL = 6)

///boxes and stripper clips

/datum/design/autolathe/ammo/rifle_ammobox
	name = "ammunition box 7.62×39mm Rifle (ball)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75
	materials = list(MATERIAL_STEEL = 20)

/datum/design/autolathe/ammo/rifle_ammobox_lethal
	name = "ammunition box 7.62×39mm Rifle (hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75/lethal
	materials = list(MATERIAL_STEEL = 20)

/datum/design/autolathe/ammo/sl_rifle
	name = "stripper clip 7.62×39mm Rifle (ball)"
	build_path = /obj/item/ammo_magazine/speed_loader_rifle_75
	materials = list(MATERIAL_STEEL = 5)

/datum/design/autolathe/ammo/rifle_ammobox_small
	name = "ammunition packet 7.62×39mm Rifle (ball)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_ammobox_small_practice
	name = "ammunition packet 7.62×39mm Rifle (practice)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small/practice
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_ammobox_small_rubber
	name = "ammunition packet 7.62×39mm Rifle (rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small/rubber
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_ammobox_small_lethal
	name = "ammunition packet 7.62×39mm Rifle (hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small/lethal
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_ammobox_small_hv
	name = "ammunition packet 7.62×39mm Rifle (APDS)"
	build_path = /obj/item/ammo_magazine/ammobox/rifle_75_small/hv
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/rifle_pk
	name = "linked ammunition box 7.62×39mm Rifle (ball)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box
	materials = list(MATERIAL_STEEL = 20)

/datum/design/autolathe/ammo/rifle_pk_empty
	name = "linked ammunition box 7.62×39mm Rifle (empty)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/empty

/datum/design/autolathe/ammo/maxim
	name = "pan magazine 7.62×39mm Rifle (ball)"
	build_path = /obj/item/ammo_magazine/maxim_75
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/maxim_empty
	name = "pan magazine 7.62×39mm Rifle (empty)"
	build_path = /obj/item/ammo_magazine/maxim_75/empty

//10mm heavy rifle

/datum/design/autolathe/ammo/hrifle
	name = "8.6mm heavy rifle magazine (ball)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/hrifle_rubber
	name = "8.6mm heavy rifle magazine (rubber)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408/rubber
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/hrifle_practice
	name = "8.6mm heavy rifle magazine (practice)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408/practice
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/hrifle_hv
	name = "8.6mm heavy rifle magazine (SLAP)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408/hv
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/hrifle_lethal
	name = "8.6mm heavy rifle magazine (hollow point)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408/lethal
	materials = list(MATERIAL_STEEL = 3)

/datum/design/autolathe/ammo/hrifle_drum
	name = "8.6mm heavy rifle drum (ball)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408_drum
	materials = list(MATERIAL_STEEL = 9)

/datum/design/autolathe/ammo/hrifle_drum_empty
	name = "8.6mm heavy rifle drum (empty)"
	build_path = /obj/item/ammo_magazine/heavy_rifle_408_drum/empty
	materials = list(MATERIAL_STEEL = 3)

//10mm heavy rifle boxes
/datum/design/autolathe/ammo/hrifle_ammobox
	name = "ammunition box 8.6mm H-Rifle(ball)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408
	materials = list(MATERIAL_STEEL = 30)

/datum/design/autolathe/ammo/hrifle_ammobox_rubber
	name = "ammunition box 8.6mm H-Rifle(rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408/rubber
	materials = list(MATERIAL_STEEL = 30)

/datum/design/autolathe/ammo/hrifle_ammobox_practice
	name = "ammunition box 8.6mm (training)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408/practice
	materials = list(MATERIAL_STEEL = 30)

/datum/design/autolathe/ammo/hrifle_ammobox_hv
	name = "ammunition box 8.6mm H-Rifle (SLAP)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408/hv
	materials = list(MATERIAL_STEEL = 30, MATERIAL_PLASTEEL = 10)

/datum/design/autolathe/ammo/hrifle_ammobox_lethal
	name = "ammunition box 8.6mm H-Rifle (hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408/lethal
	materials = list(MATERIAL_STEEL = 30)

/datum/design/autolathe/ammo/hrifle_ammobox_linked
	name = "linked ammunition box 8.6mm H-Rifle (ball)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/hrifle_ammobox_linked_rubber
	name = "linked ammunition box 8.6mm H-Rifle(rubber)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/rubber
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/hrifle_ammobox_linked_lethal
	name = "linked ammunition box 8.6mm H-Rifle (hollow point)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/lethal
	materials = list(MATERIAL_STEEL = 10)

/datum/design/autolathe/ammo/hrifle_ammobox_linked_hv
	name = "linked ammunition box 8.6mm H-Rifle (SLAP)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/highvelocity
	materials = list(MATERIAL_STEEL = 10, MATERIAL_PLASTEEL = 4)

/datum/design/autolathe/ammo/hrifle_ammobox_linked_empty
	name = "linked ammunition box 8.6mm H-Rifle (empty)"
	build_path = /obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/empty
	materials = list(MATERIAL_STEEL = 5)

///10mm heavy rifle packets
/datum/design/autolathe/ammo/hrifle_ammobox_small
	name = "ammunition packet 8.6mm Heavy Rifle (ball)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/hrifle_ammobox_small_practice
	name = "ammunition packet 8.6mm Heavy Rifle (practice)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/practice
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/hrifle_ammobox_small_rubber
	name = "ammunition packet 8.6mm Heavy Rifle (rubber)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/rubber
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/hrifle_ammobox_small_lethal
	name = "ammunition packet 8.6mm Heavy Rifle (hollow point)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/lethal
	materials = list(MATERIAL_STEEL = 15)

/datum/design/autolathe/ammo/hrifle_ammobox_small_hv
	name = "ammunition packet 8.6mm Heavy Rifle (SLAP)"
	build_path = /obj/item/ammo_magazine/ammobox/heavy_rifle_408_small/hv
	materials = list(MATERIAL_STEEL = 15)

//snowflake caseless
/datum/design/autolathe/ammo/c10x24
	name = "pulse rifle magazine (10x24mm Caseless)"
	build_path = /obj/item/ammo_magazine/c10x24
	materials = list(MATERIAL_STEEL = 12)

/datum/design/autolathe/ammo/box_10x24_small
	name = "ammo packet (10x24mm Caseless)"
	build_path = /obj/item/ammo_magazine/ammobox/c10x24_small
	materials = list(MATERIAL_STEEL = 5)

/datum/design/autolathe/ammo/box_10x24
	name = "ammo box (10x24mm Caseless)"
	build_path = /obj/item/ammo_magazine/ammobox/c10x24
	materials = list(MATERIAL_STEEL = 25)

/datum/design/autolathe/ammo/mag_10x24
	name = "high capacity box magazine (10x24mm Caseless)"
	build_path = /obj/item/ammo_magazine/smg_10x24
	materials = list(MATERIAL_STEEL = 2)

//14.5×114mm anti-materiel
/datum/design/autolathe/ammo/box_antim
	name = "ammunition box (14.5×114mm)"
	build_path = /obj/item/ammo_magazine/ammobox/antim
	materials = list(MATERIAL_STEEL = 30, MATERIAL_PLASTEEL = 30)

/datum/design/autolathe/ammo/antim
	name = "loose shells (14.5×114mm)"
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

/datum/design/autolathe/ammo/grenade/stinger
	name = "stinger grenade shell"
	build_path = /obj/item/ammo_casing/grenade/frag/stinger
	materials = list(MATERIAL_STEEL = 7, MATERIAL_PLASTIC = 7)

/datum/design/autolathe/ammo/grenade/emp
	name = "EMP grenade shell"
	build_path = /obj/item/ammo_casing/grenade/emp
	materials = list(MATERIAL_STEEL = 2, MATERIAL_IRON = 1, MATERIAL_URANIUM = 1)

/datum/design/autolathe/ammo/grenade/flash
	name= "flash grenade shell"
	build_path = /obj/item/ammo_casing/grenade/flash
	materials = list(MATERIAL_STEEL = 4, MATERIAL_SILVER = 0.5, MATERIAL_GLASS = 0.5)

/datum/design/autolathe/ammo/fs_stinger
	name = "Seinemetall Defense GmbH sting shell"
	build_path = /obj/item/ammo_casing/grenade

/* Todo: these
/datum/design/autolathe/ammo/nt_stinger
	name = "OT sting shell"
	build_path = /obj/item/ammo_casing/grenade/weak

/datum/design/autolathe/ammo/shell_heatwave
	name = "NT heatwave shell"
	build_path = /obj/item/ammo_casing/grenade/heatwave
*/
// Flare Shells
/datum/design/autolathe/ammo/flare_shell
	name = "red flare shell"
	build_path = /obj/item/ammo_casing/flare/prespawn

/datum/design/autolathe/ammo/flare_shell_b
	name = "blue flare shell"
	build_path = /obj/item/ammo_casing/flare/blue/prespawn

/datum/design/autolathe/ammo/flare_shell_g
	name = "green flare shell"
	build_path = /obj/item/ammo_casing/flare/green/prespawn
