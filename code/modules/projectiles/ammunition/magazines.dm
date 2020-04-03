/obj/item/ammo_magazine/
	name = "not a magazine"
	icon_state = "10l"

/obj/item/ammo_magazine/pickup(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/pistol_magout.ogg',20,3)

/obj/item/ammo_magazine/dropped(mob/user)
	..()
	playsound(src,'sound/weapons/guns/interact/hpistol_magout.ogg',20,3)

/////////////Standard/////////////
/obj/item/ammo_magazine/pistol
	name = "standard magazine (.35 Auto)"
	desc = "a 10 round magazine marked for .35 Auto."
	icon_state = "pistol_l"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_STEEL = 3)
	caliber = CAL_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/pistol/empty
	icon_state = "pistol"
	initial_ammo = 0

/obj/item/ammo_magazine/pistol/practice
	name = "standard magazine (.35 Auto practice)"
	icon_state = "pistol_p"
	ammo_type = /obj/item/ammo_casing/pistol/practice

/obj/item/ammo_magazine/pistol/highvelocity
	name = "standard magazine (.35 Auto high-velocity)"
	icon_state = "pistol_hv"
	ammo_type = /obj/item/ammo_casing/pistol/hv

/obj/item/ammo_magazine/pistol/rubber
	name = "standard magazine (.35 Auto rubber)"
	icon_state = "pistol_r"
	ammo_type = /obj/item/ammo_casing/pistol/rubber

/////////////HighCap/////////////
/obj/item/ammo_magazine/hpistol
	name = "highcap pistol magazine"
	desc = "a 16 round magazine marked for .35 Auto."
	icon_state = "hpistol_l"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_H_PISTOL
	matter = list(MATERIAL_STEEL = 3)
	caliber = CAL_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol
	max_ammo = 16
	multiple_sprites = 1

/obj/item/ammo_magazine/hpistol/empty
	icon_state = "hpistol"
	initial_ammo = 0

/obj/item/ammo_magazine/hpistol/practice
	name = "highcap magazine (.35 Auto practice)"
	icon_state = "hpistol_p"
	ammo_type = /obj/item/ammo_casing/pistol/practice

/obj/item/ammo_magazine/hpistol/highvelocity
	name = "highcap magazine (.35 Auto high-velocity)"
	icon_state = "hpistol_hv"
	ammo_type = /obj/item/ammo_casing/pistol/hv

/obj/item/ammo_magazine/hpistol/rubber
	name = "highcap magazine (.35 Auto rubber)"
	icon_state = "hpistol_r"
	ammo_type = /obj/item/ammo_casing/pistol/rubber

/////////////SMG/////////////

/obj/item/ammo_magazine/smg
	name = "smg magazine"
	desc = "a 32 round magazine marked for .35 Auro."
	icon_state = "smg_l"
	ammo_color = "-l"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_SMG
	matter = list(MATERIAL_STEEL = 4)
	caliber = CAL_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol
	max_ammo = 32
	multiple_sprites = 1

/obj/item/ammo_magazine/smg/empty
	icon_state = "smg"
	ammo_color = ""
	initial_ammo = 0

/obj/item/ammo_magazine/smg/practice
	name = "smg magazine (.35 Auto practice)"
	icon_state = "smg_p"
	ammo_color = "-p"
	ammo_type = /obj/item/ammo_casing/pistol/practice

/obj/item/ammo_magazine/smg/hv
	name = "smg magazine (.35 Auto high-velocity)"
	icon_state = "smg_hv"
	ammo_color = "-hv"
	ammo_type = /obj/item/ammo_casing/pistol/hv

/obj/item/ammo_magazine/smg/rubber
	name = "smg magazine (.35 Auto rubber)"
	icon_state = "smg_r"
	ammo_color = "-r"
	ammo_type = /obj/item/ammo_casing/pistol/rubber

///////////// .40 pistol ///////////

/obj/item/ammo_magazine/magnum
	name = "magnum pistol magazine"
	desc = "a 10 round magazine marked for .40 Magnum."
	icon_state = "magnum_l"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	ammo_mag = "mag_cl40m"
	ammo_type = /obj/item/ammo_casing/magnum
	matter = list(MATERIAL_STEEL = 4)
	caliber = CAL_MAGNUM
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/magnum/empty
	icon_state = "magnum"
	initial_ammo = 0

/obj/item/ammo_magazine/magnum/practice
	name = "magazine (40 Magnum practice)"
	icon_state = "magnum_p"
	ammo_type = /obj/item/ammo_casing/magnum/practice

/obj/item/ammo_magazine/magnum/hv
	name = "magazine (40 Magnum high-velocity)"
	icon_state = "magnum_hv"
	ammo_type = /obj/item/ammo_casing/magnum/hv

/obj/item/ammo_magazine/magnum/rubber
	name = "magazine (40 Magnum rubber)"
	icon_state = "magnum_r"
	ammo_type = /obj/item/ammo_casing/magnum/rubber

///////////// .208 RIFLE /////////////

/obj/item/ammo_magazine/srifle
	name = "rifle magazine"
	desc = "a 30 round magazine marked for .208 rifle."
	icon_state = "srifle_l"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_STANMAG
	caliber = CAL_SRIFLE
	matter = list(MATERIAL_STEEL = 6)
	ammo_type = /obj/item/ammo_casing/srifle
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/srifle/empty
	icon_state = "srifle"
	matter = list(MATERIAL_STEEL = 3)
	initial_ammo = 0

/obj/item/ammo_magazine/srifle/practice
	name = "rifle magazine (practice)"
	icon_state = "srifle_p"
	ammo_type = /obj/item/ammo_casing/srifle/practice

/obj/item/ammo_magazine/srifle/rubber
	name = "rifle magazine (rubber)"
	icon_state = "srifle_r"
	ammo_type = /obj/item/ammo_casing/srifle/rubber

////s h o r t////

/obj/item/ammo_magazine/srifle/short
	name = "short rifle magazine"
	desc = "a 20 round magazine marked for .208 rifle."
	icon_state = "srifle_l"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_STANMAG
	caliber = CAL_SRIFLE
	matter = list(MATERIAL_STEEL = 6)
	ammo_type = /obj/item/ammo_casing/srifle
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/srifle/short/empty
	icon_state = "srifle"
	matter = list(MATERIAL_STEEL = 3)
	initial_ammo = 0

/obj/item/ammo_magazine/srifle/short/practice
	name = "short rifle magazine (practice)"
	icon_state = "srifle_p"
	ammo_type = /obj/item/ammo_casing/srifle/practice


/obj/item/ammo_magazine/srifle/short/rubber
	name = "short rifle magazine (rubber)"
	icon_state = "srifle_r"
	ammo_type = /obj/item/ammo_casing/srifle/rubber

////6.5x39mm////

/obj/item/ammo_magazine/lrifle
	name = "carbine magazine (6.5mm)"
	desc = "a 30 round magazine marked for 6.5 Carbine."
	icon_state = "lrifle_long_l"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_ROCKIN
	caliber = "lrifle"
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_STEEL = 5)
	ammo_type = /obj/item/ammo_casing/lrifle
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/lrifle/empty
	icon_state = "lrifle_long"
	initial_ammo = 0

/obj/item/ammo_magazine/lrifle/practice
	name = "carbine magazine (6.5mm practice)"
	icon_state = "lrifle_long_p"
	ammo_type = /obj/item/ammo_casing/lrifle/practice

/obj/item/ammo_magazine/lrifle/highvelocity
	name = "carbine magazine (6.5mm high-velocity)"
	icon_state = "lrifle_long_hv"
	ammo_type = /obj/item/ammo_casing/lrifle/hv

/obj/item/ammo_magazine/lrifle/rubber
	name = "carbine magazine (6.5mm rubber)"
	icon_state = "lrifle_long_r"
	ammo_type = /obj/item/ammo_casing/lrifle/rubber

////short////

/obj/item/ammo_magazine/lrifle/short
	name = "short carbine magazine"
	desc = "a 20 round magazine marked for 6.5 Carbine."
	icon_state = "lrifle_short_l"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_ROCKIN
	caliber = "lrifle"
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_STEEL = 5)
	ammo_type = /obj/item/ammo_casing/lrifle
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/lrifle/short/empty
	icon_state = "lrifle_short"
	initial_ammo = 0

/obj/item/ammo_magazine/lrifle/short/practice
	name = "short carbine magazine (practice)"
	icon_state = "lrifle_short_p"
	ammo_type = /obj/item/ammo_casing/lrifle/practice

/obj/item/ammo_magazine/lrifle/short/highvelocity
	name = "short carbine magazine (high-velocity)"
	icon_state = "lrifle_short_hv"
	ammo_type = /obj/item/ammo_casing/lrifle/hv

/obj/item/ammo_magazine/lrifle/short/rubber
	name = "short carbine magazine (rubber)"
	icon_state = "lrifle_short_r"
	ammo_type = /obj/item/ammo_casing/lrifle/rubber

///////// 7.62 RIFLE /////////

/obj/item/ammo_magazine/hrifle
	name = "magazine box (7.62mm Rifle)"
	icon_state = "hrifle_box"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_BOX
	caliber = CAL_HRIFLE
	matter = list(MATERIAL_STEEL = 8)
	ammo_type = /obj/item/ammo_casing/hrifle
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/hrifle/empty
	initial_ammo = 0

/obj/item/ammo_magazine/hrifle/pk
	name = "PK munitions box (7.62mm Rifle)"
	icon_state = "pk_box"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_BOX
	caliber = CAL_HRIFLE
	matter = list(MATERIAL_STEEL = 8)
	ammo_type = /obj/item/ammo_casing/hrifle
	max_ammo = 100
	multiple_sprites = 1

/obj/item/ammo_magazine/ammobox/hrifle/pk/update_icon()
	if (!stored_ammo.len)
		icon_state = "pk_box-0"
		return
	if (stored_ammo.len == max_ammo)
		icon_state = "pk_box"
		return
	var/number = 0
	if (stored_ammo.len && max_ammo)
		var/percent = (stored_ammo.len / max_ammo) * 100
		number = round(percent, 25)
	icon_state = "pk_box-[number]"

/obj/item/ammo_magazine/hrifle/pk/empty
	initial_ammo = 0

/obj/item/ammo_magazine/maxim
	name = "pan magazine (7.62mm Rifle)"
	icon_state = "maxim"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PAN
	caliber = CAL_HRIFLE
	matter = list(MATERIAL_STEEL = 10)
	ammo_type = /obj/item/ammo_casing/hrifle
	max_ammo = 96
	multiple_sprites = 1

////10mm pistol////

/obj/item/ammo_magazine/a10mm
	name = "large pistol magazine"
	desc = "an 8 round magazine marked for 10mm Auto."
	icon_state = "10l"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	caliber = "10mm"
	matter = list(MATERIAL_STEEL = 2)
	ammo_type = /obj/item/ammo_casing/a10mm
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a10mm/empty
	icon_state = "10"
	initial_ammo = 0

/obj/item/ammo_magazine/a10mm/rubber
	name = "large pistol magazine (rubber)"
	icon_state = "10r"
	ammo_type = /obj/item/ammo_casing/a10mm/rubber

/obj/item/ammo_magazine/a10mm/hv
	name = "large pistol magazine (high-velocity)"
	icon_state = "10hv"
	ammo_type = /obj/item/ammo_casing/a10mm/hv

////10mm rifle////

/obj/item/ammo_magazine/c10mm
	name = "large rifle magazine"
	icon_state = "c10mm"
	desc = "a 20 round magazine marked for 10x50mm Omni."
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_OMNI
	caliber = "10x50mm"
	matter = list(MATERIAL_STEEL = 2)
	ammo_type = /obj/item/ammo_casing/c10mm
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/c10mm/rubber
	name = "large rifle magazine (rubber)"
	icon_state = "c10mmr"
	ammo_type = /obj/item/ammo_casing/c10mm/rubber

/obj/item/ammo_magazine/c10mm/practice
	name = "large rifle magazine (training)"
	icon_state = "c10mmp"
	ammo_type = /obj/item/ammo_casing/c10mm/practice

/obj/item/ammo_magazine/c10mm/hv
	name = "large rifle magazine (SLAP)"
	icon_state = "c10mmhv"
	ammo_type = /obj/item/ammo_casing/c10mm/hv

/obj/item/ammo_magazine/c10mm/lethal
	name = "large rifle magazine (HP)"
	icon_state = "c10mml"
	ammo_type = /obj/item/ammo_casing/c10mm/lethal

////10mm caseless////

/obj/item/ammo_magazine/c10x24
	name = "caseless magazine"
	desc = "An unsual magazine, marked for 10x24mm caseles."
	icon_state = "10x24"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_GENERIC
	caliber = "10x24"
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 1)
	ammo_type = /obj/item/ammo_casing/c10x24
	max_ammo = 99
	multiple_sprites = 1

////.50 kurtz////

/obj/item/ammo_magazine/a50
	name = "heavy pistol magazine"
	desc = "an 8 round magazine marked for .50 Kurtz."
	icon_state = "kurtz_l"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	caliber = CAL_50
	matter = list(MATERIAL_STEEL = 4)
	ammo_type = /obj/item/ammo_casing/a50
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a50/empty
	icon_state = "kurtz"
	initial_ammo = 0

/obj/item/ammo_magazine/a50/rubber
	name = "heavy pistol magazine (rubber)"
	icon_state = "kurtz_r"
	ammo_type = /obj/item/ammo_casing/a50/rubber


///////// SPEEDLOADERS ///////////

//////// .35 SPEEDLOADERS //////////

/obj/item/ammo_magazine/slpistol
	name = "speed loader (.35 Special)"
	icon_state = "slpistol_l"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_PISTOL
	matter = list(MATERIAL_STEEL = 3)
	ammo_type = /obj/item/ammo_casing/pistol
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/slpistol/practice
	name = "speed loader (.35 Special practice)"
	icon_state = "slpistol_p"
	ammo_type = /obj/item/ammo_casing/pistol/practice

/obj/item/ammo_magazine/slpistol/hv
	name = "speed loader (.35 Special high-velocity)"
	icon_state = "slpistol_hv"
	ammo_type = /obj/item/ammo_casing/pistol/hv

/obj/item/ammo_magazine/slpistol/rubber
	name = "speed loader (.35 Special rubber)"
	icon_state = "slpistol_r"
	ammo_type = /obj/item/ammo_casing/pistol/rubber

//////// .40 SPEEDLOADERS //////////

/obj/item/ammo_magazine/slmagnum
	name = "speed loader (.40 Magnum)"
	icon_state = "slmagnum_l"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_MAGNUM
	ammo_type = /obj/item/ammo_casing/magnum
	matter = list(MATERIAL_STEEL = 3)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/slmagnum/practice
	name = "speed loader (.40 Magnum practice)"
	icon_state = "slmagnum_p"
	ammo_type = /obj/item/ammo_casing/magnum/practice

/obj/item/ammo_magazine/slmagnum/highvelocity
	name = "speed loader (.40 Magnum high-velocity)"
	icon_state = "slmagnum_hv"
	ammo_type = /obj/item/ammo_casing/magnum/hv

/obj/item/ammo_magazine/slmagnum/rubber
	name = "speed loader (.40 Magnum rubber)"
	icon_state = "slmagnum_r"
	ammo_type = /obj/item/ammo_casing/magnum/rubber

////.50 speed loader////

/obj/item/ammo_magazine/sl50
	name = "speed loader (.50 Kurtz)"
	icon_state = "slmagnum_l"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_50
	ammo_type = /obj/item/ammo_casing/a50
	matter = list(MATERIAL_STEEL = 3)
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/slmagnum/rubber
	name = "speed loader (.50 Kurtz rubber)"
	icon_state = "slmagnum_r"
	ammo_type = /obj/item/ammo_casing/a50/rubber

//////// 7.62  RIFLE SPEEDLOADERS ////////

/obj/item/ammo_magazine/slhrifle
	name = "ammo strip (7.62mm Rifle)"
	icon_state = "hrifle"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = "hrifle"
	caliber = CAL_HRIFLE
	matter = list(MATERIAL_STEEL = 3)
	ammo_type = /obj/item/ammo_casing/hrifle
	max_ammo = 5
	multiple_sprites = 1

////other////

/obj/item/ammo_magazine/caps
	name = "speed loader (caps)"
	icon_state = "38r"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_CAP
	color = "#FF0000"
	ammo_type = /obj/item/ammo_casing/cap
	matter = list(MATERIAL_STEEL = 2)
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a75
	name = "ammo magazine (.70 gyro)"
	icon_state = "75"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	caliber = CAL_70
	ammo_type = /obj/item/ammo_casing/a75
	multiple_sprites = 1
	max_ammo = 4

/obj/item/ammo_magazine/a75/empty
	initial_ammo = 0

////////////Shotguns!////////////

/obj/item/ammo_magazine/m12
	name = "20mm ammo drum (sabot slug)"
	icon_state = "m12_slug"
	mag_type = MAGAZINE
	mag_well =  MAG_WELL_GENERIC
	caliber = CAL_SHOTGUN
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_STEEL = 6)
	multiple_sprites = 1
	max_ammo = 8
	ammo_color = "-slug"

/obj/item/ammo_magazine/m12/empty
	icon_state = "m12"
	ammo_color = ""
	initial_ammo = 0

/obj/item/ammo_magazine/m12/pellet
	name = "20mm ammo drum (buckshot)"
	icon_state = "m12_pellets"
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	ammo_color = "-pellets"

/obj/item/ammo_magazine/m12/beanbag
	name = "20mm ammo drum (beanbag)"
	icon_state = "m12_beanbag"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	ammo_color = "-beanbag"