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
	icon_state = "pistol"
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

/obj/item/ammo_magazine/pistol/lethal
	name = "standard magazine (.35 Auto hollow-point)"
	icon_state = "pistol_l"
	ammo_type = /obj/item/ammo_casing/pistol/lethal


/////////////HighCap/////////////
/obj/item/ammo_magazine/hpistol
	name = "highcap pistol magazine"
	desc = "A 16 round magazine marked for .35 Auto."
	icon_state = "hpistol"
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

/obj/item/ammo_magazine/hpistol/lethal
	name = "highcap magazine (.35 Auto hollow-point)"
	icon_state = "hpistol_l"
	ammo_type = /obj/item/ammo_casing/pistol/lethal


/////////////SMG/////////////

/obj/item/ammo_magazine/smg
	name = "smg magazine"
	desc = "A 32 round magazine marked for .35 auto."
	icon_state = "smg"
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

/obj/item/ammo_magazine/smg/lethal
	name = "smg magazine (.35 Auto hollow-point)"
	icon_state = "smg_l"
	ammo_color = "-l"
	ammo_type = /obj/item/ammo_casing/pistol/lethal


///////////// .40 pistol ///////////

/obj/item/ammo_magazine/magnum
	name = "magnum pistol magazine"
	desc = "A 10 round magazine marked for .40 Magnum."
	icon_state = "magnum"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
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

/obj/item/ammo_magazine/magnum/lethal
	name = "magazine (40 Magnum hollow-point)"
	icon_state = "magnum_l"
	ammo_type = /obj/item/ammo_casing/magnum/lethal



////.257 Carbine////

/obj/item/ammo_magazine/lrifle
	name = "carbine magazine"
	desc = "A 30 round magazine marked for .257 Carbine."
	icon_state = "lrifle_long"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_STANMAG
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
	name = "carbine magazine (practice)"
	icon_state = "lrifle_long_p"
	ammo_type = /obj/item/ammo_casing/lrifle/practice

/obj/item/ammo_magazine/lrifle/highvelocity
	name = "carbine magazine (high-velocity)"
	icon_state = "lrifle_long_hv"
	ammo_type = /obj/item/ammo_casing/lrifle/hv

/obj/item/ammo_magazine/lrifle/rubber
	name = "carbine magazine (rubber)"
	icon_state = "lrifle_long_r"
	ammo_type = /obj/item/ammo_casing/lrifle/rubber

/obj/item/ammo_magazine/lrifle/lethal
	name = "carbine magazine (hollow-point)"
	icon_state = "lrifle_long_r"
	ammo_type = /obj/item/ammo_casing/lrifle/lethal

////short////

/obj/item/ammo_magazine/lrifle_short
	name = "short carbine magazine"
	desc = "A 20 round magazine marked for .257 Carbine."
	icon_state = "lrifle_short"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_STANMAG
	caliber = "lrifle"
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_STEEL = 5)
	ammo_type = /obj/item/ammo_casing/lrifle
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/lrifle_short/empty
	icon_state = "lrifle_short"
	initial_ammo = 0

/obj/item/ammo_magazine/lrifle_short/practice
	name = "short carbine magazine (practice)"
	icon_state = "lrifle_short_p"
	ammo_type = /obj/item/ammo_casing/lrifle/practice

/obj/item/ammo_magazine/lrifle_short/highvelocity
	name = "short carbine magazine (high-velocity)"
	icon_state = "lrifle_short_hv"
	ammo_type = /obj/item/ammo_casing/lrifle/hv

/obj/item/ammo_magazine/lrifle_short/rubber
	name = "short carbine magazine (rubber)"
	icon_state = "lrifle_short_r"
	ammo_type = /obj/item/ammo_casing/lrifle/rubber

/obj/item/ammo_magazine/lrifle_short/lethal
	name = "short carbine magazine (hollow-point)"
	icon_state = "lrifle_short_l"
	ammo_type = /obj/item/ammo_casing/lrifle/lethal

///////// 7.5 RIFLE /////////

/obj/item/ammo_magazine/rifle
	name = "rifle magazine"
	desc = "A 20 round magazine marked for 7.5mm Rifle."
	icon_state = "rifle"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = "rifle"
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 5)
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/rifle/empty
	icon_state = "rifle"
	initial_ammo = 0

/obj/item/ammo_magazine/rifle/practice
	name = "rifle magazine (practice)"
	icon_state = "rifle_p"
	ammo_type = /obj/item/ammo_casing/rifle/practice

/obj/item/ammo_magazine/rifle/highvelocity
	name = "rifle magazine (high-velocity)"
	icon_state = "rifle_hv"
	ammo_type = /obj/item/ammo_casing/rifle/hv

/obj/item/ammo_magazine/rifle/rubber
	name = "rifle magazine (rubber)"
	icon_state = "rifle_r"
	ammo_type = /obj/item/ammo_casing/rifle/rubber

/obj/item/ammo_magazine/rifle/lethal
	name = "rifle magazine (hollow-point)"
	icon_state = "rifle_l"
	ammo_type = /obj/item/ammo_casing/rifle/lethal

////short////

/obj/item/ammo_magazine/rifle_short
	name = "short rifle magazine"
	desc = "A 10 round magazine marked for .7.5mm Rifle."
	icon_state = "rifle_short"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = "rifle_short"
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 5)
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/rifle_short/empty
	icon_state = "rifle_short"
	initial_ammo = 0

/obj/item/ammo_magazine/rifle_short/practice
	name = "short rifle magazine (practice)"
	icon_state = "rifle_short_p"
	ammo_type = /obj/item/ammo_casing/rifle/practice

/obj/item/ammo_magazine/rifle_short/highvelocity
	name = "short rifle magazine (high-velocity)"
	icon_state = "rifle_short_hv"
	ammo_type = /obj/item/ammo_casing/rifle/hv

/obj/item/ammo_magazine/rifle_short/rubber
	name = "short rifle magazine (rubber)"
	icon_state = "rifle_short_r"
	ammo_type = /obj/item/ammo_casing/rifle/rubber

/obj/item/ammo_magazine/rifle_short/lethal
	name = "short rifle magazine (hollow-point)"
	icon_state = "rifle_short_l"
	ammo_type = /obj/item/ammo_casing/rifle/lethal

///unused?
/obj/item/ammo_magazine/rifle_box
	name = "magazine box (7.5mm Rifle)"
	icon_state = "a762"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_BOX
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 8)
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/rifle_box/empty
	initial_ammo = 0

/obj/item/ammo_magazine/rifle_pk
	name = "PK munitions box (7.5mm Rifle)"
	icon_state = "pk_box"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_BOX
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 8)
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 100
	multiple_sprites = 1

/obj/item/ammo_magazine/ammobox/rifle/pk/update_icon()
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

/obj/item/ammo_magazine/rifle_pk/empty
	initial_ammo = 0

/obj/item/ammo_magazine/maxim
	name = "pan magazine (7.5mm Rifle)"
	icon_state = "maxim"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PAN
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 10)
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 96
	multiple_sprites = 1

////.408 rifle////

/obj/item/ammo_magazine/hrifle
	name = "heavy rifle magazine"
	icon_state = "hrifle"
	desc = "A 20 round magazine marked for .408 Omni."
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_HRIFLE
	caliber = CAL_HRIFLE
	matter = list(MATERIAL_STEEL = 2)
	ammo_type = /obj/item/ammo_casing/hrifle
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/hrifle/empty
	icon_state = "hrifle"
	initial_ammo = 0

/obj/item/ammo_magazine/hrifle/rubber
	name = "heavy rifle magazine (rubber)"
	icon_state = "hrifle_r"
	ammo_type = /obj/item/ammo_casing/hrifle/rubber

/obj/item/ammo_magazine/hrifle/practice
	name = "heavy rifle magazine (training)"
	icon_state = "hrifle_p"
	ammo_type = /obj/item/ammo_casing/hrifle/practice

/obj/item/ammo_magazine/hrifle/hv
	name = "heavy rifle magazine (SLAP)"
	icon_state = "hrifle_hv"
	ammo_type = /obj/item/ammo_casing/hrifle/hv

/obj/item/ammo_magazine/hrifle/lethal
	name = "heavy rifle magazine (HP)"
	icon_state = "hrifle_l"
	ammo_type = /obj/item/ammo_casing/hrifle/lethal

////10mm caseless////

/obj/item/ammo_magazine/c10x24
	name = "caseless magazine"
	desc = "An unsual magazine, marked for 10x24mm caseless."
	icon_state = "10x24"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PULSE
	caliber = "10x24"
	matter = list(MATERIAL_STEEL = 8, MATERIAL_PLASTIC = 1)
	ammo_type = /obj/item/ammo_casing/c10x24
	max_ammo = 99
	multiple_sprites = 1

////.50 kurtz////

/obj/item/ammo_magazine/kurtz
	name = "heavy pistol magazine"
	desc = "an 8 round magazine marked for .50 Kurtz."
	icon_state = "kurtz"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	caliber = CAL_50
	matter = list(MATERIAL_STEEL = 4)
	ammo_type = /obj/item/ammo_casing/kurtz
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/kurtz/empty
	icon_state = "kurtz"
	initial_ammo = 0

/obj/item/ammo_magazine/kurtz/rubber
	name = "heavy pistol magazine (rubber)"
	icon_state = "kurtz_r"
	ammo_type = /obj/item/ammo_casing/kurtz/rubber

/obj/item/ammo_magazine/kurtz/hv
	name = "heavy pistol magazine (practice)"
	icon_state = "kurtz_r"
	ammo_type = /obj/item/ammo_casing/kurtz/practice

/obj/item/ammo_magazine/kurtz/practice
	name = "heavy pistol magazine (high-velocity)"
	icon_state = "kurtz_hv"
	ammo_type = /obj/item/ammo_casing/kurtz/hv

/obj/item/ammo_magazine/kurtz/lethal
	name = "heavy pistol magazine (hollow-point)"
	icon_state = "kurtz_l"
	ammo_type = /obj/item/ammo_casing/kurtz/lethal

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

/obj/item/ammo_magazine/slpistol/lethal
	name = "speed loader (.35 Special hollow point)"
	icon_state = "slpistol_r"
	ammo_type = /obj/item/ammo_casing/pistol/lethal

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

/obj/item/ammo_magazine/slmagnum/lethal
	name = "speed loader (.40 Magnum hollow-point)"
	icon_state = "slmagnum_l"
	ammo_type = /obj/item/ammo_casing/magnum/lethal

////.50 speed loader////

/obj/item/ammo_magazine/slkurtz
	name = "speed loader (.50 Kurtz)"
	icon_state = "slmagnum_p"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_50
	ammo_type = /obj/item/ammo_casing/kurtz
	matter = list(MATERIAL_STEEL = 3)
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/slkurtz/practice
	name = "speed loader (.50 Kurtz practice)"
	icon_state = "slmagnum_p"
	ammo_type = /obj/item/ammo_casing/kurtz/practice

/obj/item/ammo_magazine/slkurtz/rubber
	name = "speed loader (.50 Kurtz rubber)"
	icon_state = "slmagnum_r"
	ammo_type = /obj/item/ammo_casing/kurtz/rubber

/obj/item/ammo_magazine/slkurtz/lethal
	name = "speed loader (.50 Kurtz hollow-point)"
	icon_state = "slmagnum_l"
	ammo_type = /obj/item/ammo_casing/kurtz/lethal

/obj/item/ammo_magazine/slkurtz/highvelocity
	name = "speed loader (.50 Kurtz high-velocity)"
	icon_state = "slmagnum_hv"
	ammo_type = /obj/item/ammo_casing/kurtz/hv


//////// RIFLE SPEEDLOADERS ////////

/obj/item/ammo_magazine/slrifle
	name = "ammo strip (7.5mm Rifle)"
	icon_state = "rifle"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = "rifle"
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 3)
	ammo_type = /obj/item/ammo_casing/rifle
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/slhrifle
	name = "ammo strip (.408 Rifle)"
	icon_state = "rifle"
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
	icon_state = "slpistol_l"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_CAP
	color = "#FF0000"
	ammo_type = /obj/item/ammo_casing/cap
	matter = list(MATERIAL_STEEL = 2)
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a75
	name = "ammo magazine (.70 gyro)"
	icon_state = "darts"
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
	mag_well =  MAG_WELL_DRUM
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