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
/obj/item/ammo_magazine/pistol_35
	name = "standard magazine (.35)"
	desc = "a 10 round magazine marked for .35."
	icon_state = "pistol"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	matter = list(MATERIAL_STEEL = 3)
	caliber = CAL_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol_35
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/pistol_35/empty
	icon_state = "pistol"
	initial_ammo = 0

/obj/item/ammo_magazine/pistol_35/practice
	name = "standard magazine (.35 practice)"
	icon_state = "pistol_p"
	ammo_type = /obj/item/ammo_casing/pistol_35/practice

/obj/item/ammo_magazine/pistol_35/highvelocity
	name = "standard magazine (.35 high-velocity)"
	icon_state = "pistol_hv"
	ammo_type = /obj/item/ammo_casing/pistol_35/hv

/obj/item/ammo_magazine/pistol_35/rubber
	name = "standard magazine (.35 rubber)"
	icon_state = "pistol_r"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber

/obj/item/ammo_magazine/pistol_35/rubber/pepperball
	name = "standard magazine (.35 pepperball)"
	icon_state = "pistol_l"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber/pepperball

/obj/item/ammo_magazine/pistol_35/lethal
	name = "standard magazine (.35 hollow-point)"
	icon_state = "pistol_l"
	ammo_type = /obj/item/ammo_casing/pistol_35/lethal

/obj/item/ammo_magazine/pistol_35/scrap
	name = "old standard magazine (.35)"
	icon_state = "pistol_s"
	ammo_type = /obj/item/ammo_casing/pistol_35/scrap

/obj/item/ammo_magazine/pistol_35/scrap/empty
	initial_ammo = 0

/obj/item/ammo_magazine/highcap_pistol_35/drum
	name = "standard auto drum magazine"
	icon_state = "ldrum"
	desc = "A 71 round drum magazine marked for .35."
	origin_tech = list(TECH_COMBAT = 2)
	w_class = ITEM_SIZE_NORMAL
	mag_type = MAGAZINE
	mag_well = MAG_WELL_DRUM
	caliber = CAL_PISTOL
	matter = list(MATERIAL_STEEL = 4)
	ammo_type = /obj/item/ammo_casing/pistol_35
	max_ammo = 71
	multiple_sprites = FALSE //I guess?

/obj/item/ammo_magazine/highcap_pistol_35/drum/update_icon()
	..()
	//small about of snowflake code for drums
	if(contents.len)
		icon_state = "[initial(icon_state)]-72"
	else
		icon_state = "[initial(icon_state)]"

/obj/item/ammo_magazine/highcap_pistol_35/drum/rubber
	name = "standard auto drum (rubber)"
	icon_state = "ldrum_r"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber

/obj/item/ammo_magazine/highcap_pistol_35/drum/rubber/pepperball
	name = "standard auto drum (pepperball)"
	icon_state = "ldrum_l"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber/pepperball

/obj/item/ammo_magazine/highcap_pistol_35/drum/soporific_cbo
	name = "standard auto drum (sleeper)"
	icon_state = "ldrum_r"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber/soporific_cbo

/obj/item/ammo_magazine/highcap_pistol_35/drum/lethal
	name = "standard auto drum (hollow-point)"
	ammo_type = /obj/item/ammo_casing/pistol_35/lethal
	icon_state = "ldrum_l"

/obj/item/ammo_magazine/highcap_pistol_35/drum/hv
	name = "standard auto drum (high-velocity)"
	ammo_type = /obj/item/ammo_casing/pistol_35/hv
	icon_state = "ldrum_hv"

/obj/item/ammo_magazine/highcap_pistol_35/drum/empty
	name = "standard drum magazine"
	icon_state = "ldrum"
	initial_ammo = 0


/////////////HighCap/////////////
/obj/item/ammo_magazine/highcap_pistol_35
	name = "highcap pistol magazine"
	desc = "A 16 round magazine marked for .35."
	icon_state = "hpistol"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_H_PISTOL
	matter = list(MATERIAL_STEEL = 3)
	caliber = CAL_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol_35
	max_ammo = 16
	multiple_sprites = 1

/obj/item/ammo_magazine/highcap_pistol_35/empty
	icon_state = "hpistol"
	initial_ammo = 0

/obj/item/ammo_magazine/highcap_pistol_35/practice
	name = "highcap magazine (.35 practice)"
	icon_state = "hpistol_p"
	ammo_type = /obj/item/ammo_casing/pistol_35/practice

/obj/item/ammo_magazine/highcap_pistol_35/highvelocity
	name = "highcap magazine (.35 high-velocity)"
	icon_state = "hpistol_hv"
	ammo_type = /obj/item/ammo_casing/pistol_35/hv

/obj/item/ammo_magazine/highcap_pistol_35/rubber
	name = "highcap magazine (.35 rubber)"
	icon_state = "hpistol_r"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber

/obj/item/ammo_magazine/highcap_pistol_35/rubber/pepperball
	name = "highcap magazine (.35 pepperball)"
	icon_state = "hpistol_l"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber/pepperball

/obj/item/ammo_magazine/highcap_pistol_35/lethal
	name = "highcap magazine (.35 hollow-point)"
	icon_state = "hpistol_l"
	ammo_type = /obj/item/ammo_casing/pistol_35/lethal

/////////////SMG/////////////

/obj/item/ammo_magazine/smg_35
	name = "smg magazine"
	desc = "A 32 round magazine marked for .35."
	icon_state = "smg"
	ammo_color = "-l"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_SMG
	matter = list(MATERIAL_STEEL = 4)
	caliber = CAL_PISTOL
	ammo_type = /obj/item/ammo_casing/pistol_35
	max_ammo = 32
	multiple_sprites = 1

/obj/item/ammo_magazine/smg_35/empty
	icon_state = "smg"
	ammo_color = ""
	initial_ammo = 0

/obj/item/ammo_magazine/smg_35/practice
	name = "smg magazine (.35 practice)"
	icon_state = "smg_p"
	ammo_color = "-p"
	ammo_type = /obj/item/ammo_casing/pistol_35/practice

/obj/item/ammo_magazine/smg_35/hv
	name = "smg magazine (.35 high-velocity)"
	icon_state = "smg_hv"
	ammo_color = "-hv"
	ammo_type = /obj/item/ammo_casing/pistol_35/hv

/obj/item/ammo_magazine/smg_35/hv/empty

	ammo_color = ""
	initial_ammo = 0

/obj/item/ammo_magazine/smg_35/rubber
	name = "smg magazine (.35 rubber)"
	icon_state = "smg_r"
	ammo_color = "-r"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber

/obj/item/ammo_magazine/smg_35/rubber/pepperball
	name = "smg magazine (.35 pepperball)"
	icon_state = "smg_l"
	ammo_color = "-l"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber/pepperball

/obj/item/ammo_magazine/smg_35/lethal
	name = "smg magazine (.35 hollow-point)"
	icon_state = "smg_l"
	ammo_color = "-l"
	ammo_type = /obj/item/ammo_casing/pistol_35/lethal

///////////// .40 pistol ///////////

/obj/item/ammo_magazine/magnum_40
	name = "magnum pistol magazine"
	desc = "A 10 round magazine marked for .40 Magnum."
	icon_state = "magnum"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	ammo_type = /obj/item/ammo_casing/magnum_40
	matter = list(MATERIAL_STEEL = 4)
	caliber = CAL_MAGNUM
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/magnum_40/empty
	icon_state = "magnum"
	initial_ammo = 0

/obj/item/ammo_magazine/magnum_40/practice
	name = "magazine (.40 Magnum practice)"
	icon_state = "magnum_p"
	ammo_type = /obj/item/ammo_casing/magnum_40/practice

/obj/item/ammo_magazine/magnum_40/hv
	name = "magazine (.40 Magnum high-velocity)"
	icon_state = "magnum_hv"
	ammo_type = /obj/item/ammo_casing/magnum_40/hv

/obj/item/ammo_magazine/magnum_40/rubber
	name = "magazine (.40 Magnum rubber)"
	icon_state = "magnum_r"
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber

/obj/item/ammo_magazine/magnum_40/rubber/pepperball
	name = "magazine(.40 Magnum pepperball)"
	icon_state = "magnum_l"
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber/pepperball

/obj/item/ammo_magazine/magnum_40/lethal
	name = "magazine (.40 Magnum hollow-point)"
	icon_state = "magnum_l"
	ammo_type = /obj/item/ammo_casing/magnum_40/lethal

/obj/item/ammo_magazine/magnum_40/old
	name = "old magazine (.40 Magnum)"
	icon_state = "magnum_s"
	ammo_type = /obj/item/ammo_casing/magnum_40/scrap

////.40 SMG////

/obj/item/ammo_magazine/smg_magnum_40
	name = "smg magnum magazine (.40 Magnum)"
	desc = "A 30 round magazine marked for .40 Magnum."
	icon_state = "smg_magnum"
	origin_tech = list(TECH_COMBAT = 3)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_SMG
	matter = list(MATERIAL_STEEL = 4)
	caliber = CAL_MAGNUM
	ammo_type = /obj/item/ammo_casing/magnum_40
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/smg_magnum_40/empty
	icon_state = "smg_magnum"
	initial_ammo = 0

/obj/item/ammo_magazine/smg_magnum_40/practice
	name = "smg magazine (.40 Magnum practice)"
	icon_state = "smg_magnum_p"
	ammo_type = /obj/item/ammo_casing/magnum_40/practice

/obj/item/ammo_magazine/smg_magnum_40/hv
	name = "smg magazine (.40 Magnum high-velocity)"
	icon_state = "smg_magnum_hv"
	ammo_type = /obj/item/ammo_casing/magnum_40/hv

/obj/item/ammo_magazine/smg_magnum_40/rubber
	name = "smg magazine (.40 Magnum rubber)"
	icon_state = "smg_magnum_r"
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber

/obj/item/ammo_magazine/smg_magnum_40/rubber/pepperball
	name = "smg magazine (.40 Magnum pepperball)"
	icon_state = "smg_magnum_l"
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber/pepperball

/obj/item/ammo_magazine/smg_magnum_40/lethal
	name = "smg magazine (.40 Magnum hollow-point)"
	icon_state = "smg_magnum_l"
	ammo_type = /obj/item/ammo_casing/magnum_40/lethal

/obj/item/ammo_magazine/smg_magnum_40/old
	name = "old smg magazine (.40 Magnum)"
	icon_state = "smg_magnum_s"
	ammo_type = /obj/item/ammo_casing/magnum_40/scrap

////6.5 Carbine////

/obj/item/ammo_magazine/light_rifle_257
	name = "carbine magazine"
	desc = "A 30 round magazine marked for .257 Carbine."
	icon_state = "lrifle_long"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = "lrifle"
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_STEEL = 5)
	ammo_type = /obj/item/ammo_casing/light_rifle_257
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/light_rifle_257/empty
	icon_state = "lrifle_long"
	initial_ammo = 0

/obj/item/ammo_magazine/light_rifle_257/practice
	name = "carbine magazine (practice)"
	icon_state = "lrifle_long_p"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/practice

/obj/item/ammo_magazine/light_rifle_257/highvelocity
	name = "carbine magazine (high-velocity)"
	icon_state = "lrifle_long_hv"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/hv

/obj/item/ammo_magazine/light_rifle_257/rubber
	name = "carbine magazine (rubber)"
	icon_state = "lrifle_long_r"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber

/obj/item/ammo_magazine/light_rifle_257/rubber/pepperball
	name = "carbine magazine (pepperball)"
	icon_state = "lrifle_long_l"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber/pepperball

/obj/item/ammo_magazine/light_rifle_257/lethal
	name = "carbine magazine (hollow-point)"
	icon_state = "lrifle_long_l"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/lethal

/obj/item/ammo_magazine/light_rifle_257/scrap
	name = "old carbine magazine (ball)"
	icon_state = "srifle_long_s"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/scrap

/obj/item/ammo_magazine/light_rifle_257/scrap/empty
	initial_ammo = 0

////short////

/obj/item/ammo_magazine/light_rifle_257_short
	name = "short carbine magazine"
	desc = "A 20 round magazine marked for .257 Carbine."
	icon_state = "lrifle_short"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = "lrifle"
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_STEEL = 5)
	ammo_type = /obj/item/ammo_casing/light_rifle_257
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/light_rifle_257_short/empty
	icon_state = "lrifle_short"
	initial_ammo = 0

/obj/item/ammo_magazine/light_rifle_257_short/practice
	name = "short carbine magazine (practice)"
	icon_state = "lrifle_short_p"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/practice

/obj/item/ammo_magazine/light_rifle_257_short/highvelocity
	name = "short carbine magazine (high-velocity)"
	icon_state = "lrifle_short_hv"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/hv

/obj/item/ammo_magazine/light_rifle_257_short/rubber
	name = "short carbine magazine (rubber)"
	icon_state = "lrifle_short_r"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber

/obj/item/ammo_magazine/light_rifle_257_short/rubber/pepperball
	name = "short carbine magazine (pepperball)"
	icon_state = "lrifle_short_l"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber/pepperball

/obj/item/ammo_magazine/light_rifle_257_short/lethal
	name = "short carbine magazine (hollow-point)"
	icon_state = "lrifle_short_l"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/lethal

////6.5 Drum ////

/obj/item/ammo_magazine/light_rifle_257_drum
	name = "carbine drum magazine"
	desc = "A 50 round drum magazine marked for .257 Carbine."
	icon_state = "lrifle_drum"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	w_class = ITEM_SIZE_NORMAL
	caliber = "lrifle"
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_STEEL = 12)
	ammo_type = /obj/item/ammo_casing/light_rifle_257
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/light_rifle_257_drum/empty
	icon_state = "lrifle_drum"
	initial_ammo = 0

/obj/item/ammo_magazine/light_rifle_257_drum/practice
	name = "carbine drum magazine (practice)"
	icon_state = "lrifle_drum_p"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/practice

/obj/item/ammo_magazine/light_rifle_257_drum/highvelocity
	name = "carbine drum magazine (high-velocity)"
	icon_state = "lrifle_drum_hv"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/hv

/obj/item/ammo_magazine/light_rifle_257_drum/rubber
	name = "carbine drum magazine (rubber)"
	icon_state = "lrifle_drum_r"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber

/obj/item/ammo_magazine/light_rifle_257_drum/rubber/pepperball
	name = "carbine drum magazine (pepperball)"
	icon_state = "lrifle_drum_pep"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber/pepperball

/obj/item/ammo_magazine/light_rifle_257_drum/lethal
	name = "carbine drum magazine (hollow-point)"
	icon_state = "lrifle_drum_l"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/lethal

///////// 7.5 RIFLE /////////

/obj/item/ammo_magazine/rifle_75
	name = "rifle magazine"
	desc = "A 20 round magazine marked for 7.5mm Rifle."
	icon_state = "rifle"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = "rifle"
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 5)
	ammo_type = /obj/item/ammo_casing/rifle_75
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/rifle_75/empty
	icon_state = "rifle"
	initial_ammo = 0

/obj/item/ammo_magazine/rifle_75/practice
	name = "rifle magazine (practice)"
	icon_state = "rifle_p"
	ammo_type = /obj/item/ammo_casing/rifle_75/practice

/obj/item/ammo_magazine/rifle_75/highvelocity
	name = "rifle magazine (APDS)"
	icon_state = "rifle_hv"
	ammo_type = /obj/item/ammo_casing/rifle_75/hv

/obj/item/ammo_magazine/rifle_75/rubber
	name = "rifle magazine (rubber)"
	icon_state = "rifle_r"
	ammo_type = /obj/item/ammo_casing/rifle_75/rubber

/obj/item/ammo_magazine/rifle_75/lethal
	name = "rifle magazine (hollow-point)"
	icon_state = "rifle_l"
	ammo_type = /obj/item/ammo_casing/rifle_75/lethal

/obj/item/ammo_magazine/rifle_75/scrap
	name = "old rifle magazine (ball)"
	icon_state = "rifle_s"
	ammo_type = /obj/item/ammo_casing/rifle_75/scrap

/obj/item/ammo_magazine/rifle_75_short/scrap/empty
	initial_ammo = 0

////short////

/obj/item/ammo_magazine/rifle_75_short
	name = "short rifle magazine"
	desc = "A 10 round magazine marked for 7.5mm Rifle."
	icon_state = "rifle_short"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = "rifle"
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 5)
	ammo_type = /obj/item/ammo_casing/rifle_75
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/rifle_75_short/empty
	icon_state = "rifle_short"
	initial_ammo = 0

/obj/item/ammo_magazine/rifle_75_short/practice
	name = "short rifle magazine (practice)"
	icon_state = "rifle_short_p"
	ammo_type = /obj/item/ammo_casing/rifle_75/practice

/obj/item/ammo_magazine/rifle_75_short/highvelocity
	name = "short rifle magazine (APDS)"
	icon_state = "rifle_short_hv"
	ammo_type = /obj/item/ammo_casing/rifle_75/hv

/obj/item/ammo_magazine/rifle_75_short/rubber
	name = "short rifle magazine (rubber)"
	icon_state = "rifle_short_r"
	ammo_type = /obj/item/ammo_casing/rifle_75/rubber

/obj/item/ammo_magazine/rifle_75_short/lethal
	name = "short rifle magazine (hollow-point)"
	icon_state = "rifle_short_l"
	ammo_type = /obj/item/ammo_casing/rifle_75/lethal

//// Drum 7.5mm ////

/obj/item/ammo_magazine/rifle_75_drum
	name = "rifle drum magazine"
	desc = "A 40 round drum magazine marked for 7.5mm Rifle."
	icon_state = "rifle_drum"
	w_class = ITEM_SIZE_NORMAL
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = "rifle"
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 12)
	ammo_type = /obj/item/ammo_casing/rifle_75
	max_ammo = 40
	multiple_sprites = 1

/obj/item/ammo_magazine/rifle_75_drum/empty
	icon_state = "rifle_drum"
	initial_ammo = 0

/obj/item/ammo_magazine/rifle_75_drum/practice
	name = "rifle drum magazine (practice)"
	icon_state = "rifle_drum_p"
	ammo_type = /obj/item/ammo_casing/rifle_75/practice

/obj/item/ammo_magazine/rifle_75_drum/highvelocity
	name = "rifle drum magazine (APDS)"
	icon_state = "rifle_drum_hv"
	ammo_type = /obj/item/ammo_casing/rifle_75/hv

/obj/item/ammo_magazine/rifle_75_drum/rubber
	name = "rifle drum magazine (rubber)"
	icon_state = "rifle_drum_r"
	ammo_type = /obj/item/ammo_casing/rifle_75/rubber

/obj/item/ammo_magazine/rifle_75_drum/lethal
	name = "rifle drum magazine (hollow-point)"
	icon_state = "rifle_drum_l"
	ammo_type = /obj/item/ammo_casing/rifle_75/lethal

//Linked 7.5mm

/obj/item/ammo_magazine/rifle_75_linked_box
	name = "linked ammunition box (7.5mm Rifle)"
	desc = "A 100 round linked box marked for 7.5mm Rifle."
	icon_state = "pk_box"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_LINKED_BOX
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 2)
	ammo_type = /obj/item/ammo_casing/rifle_75
	max_ammo = 100
	multiple_sprites = 1
	w_class = ITEM_SIZE_BULKY //Balance change, these things are the size a box due to being legit 5 mags worth of ammo. Wacky that it was normal-sized before.
	extra_bulk = -2

/obj/item/ammo_magazine/rifle_75_linked_box/update_icon()
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

/obj/item/ammo_magazine/rifle_75_linked_box/highvelocity
	name = "linked ammunition box (7.5mm Rifle APDS)"
	ammo_type = /obj/item/ammo_casing/rifle_75/hv

/obj/item/ammo_magazine/rifle_75_linked_box/rubber
	name = "linked ammunition box (7.5mm Rifle rubber)"
	ammo_type = /obj/item/ammo_casing/rifle_75/rubber

/obj/item/ammo_magazine/rifle_75_linked_box/lethal
	name = "linked ammunition box (7.5mm Rifle hollowpoint)"
	ammo_type = /obj/item/ammo_casing/rifle_75/lethal

/obj/item/ammo_magazine/rifle_75_linked_box/empty
	initial_ammo = 0

///easiest to make it a child
/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257
	name = "linked ammunition box (.257 Carbine)"
	desc = "A 100 round linked box marked for .257 Carbine."
	icon_state = "pkl_box"
	caliber = CAL_LRIFLE
	ammo_type = /obj/item/ammo_casing/light_rifle_257
	matter = list(MATERIAL_STEEL = 2)
	multiple_sprites = 1

/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/highvelocity
	name = "linked ammunition box (.257 Carbine highvelocity)"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/hv

/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/rubber
	name = "linked ammunition box (.257 Carbine rubber)"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/rubber

/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/lethal
	name = "linked ammunition box (.257 Carbine hollowpoint)"
	ammo_type = /obj/item/ammo_casing/light_rifle_257/lethal

/obj/item/ammo_magazine/rifle_75_linked_box/light_rifle_257/empty
	initial_ammo = 0

/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408
	name = "linked ammunition box (.408 Heavy Rifle)"
	desc = "A 64 round linked box marked for 8.6x70mm Heavy Rifle."
	max_ammo = 64
	icon_state = "pkh_box"
	caliber = CAL_HRIFLE
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408
	matter = list(MATERIAL_STEEL = 2)
	multiple_sprites = 1

/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/highvelocity
	name = "linked ammunition box (.408 Heavy Rifle SLAP)"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/hv

/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/rubber
	name = "linked ammunition box (.408 Heavy Rifle rubber)"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/rubber

/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/lethal
	name = "linked ammunition box (.408 Heavy Rifle hollowpoint)"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/lethal

/obj/item/ammo_magazine/rifle_75_linked_box/heavy_rifle_408/empty
	initial_ammo = 0

//Pan 7.5mm

/obj/item/ammo_magazine/maxim_75
	name = "pan magazine (7.5mm Rifle)"
	desc = "A 96 round pan magazine marked for 7.5mm Rifle."
	icon_state = "maxim"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PAN
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 2)
	ammo_type = /obj/item/ammo_casing/rifle_75
	max_ammo = 96
	multiple_sprites = 1

/obj/item/ammo_magazine/maxim_75/empty
	initial_ammo = 0

////.408 heavy rifle////

/obj/item/ammo_magazine/heavy_rifle_408
	name = "heavy rifle magazine"
	icon_state = "hrifle"
	desc = "A 14 round magazine marked for 8.6x70mm Heavy Rifle."
	origin_tech = list(TECH_COMBAT = 2)
	w_class = ITEM_SIZE_NORMAL
	mag_type = MAGAZINE
	mag_well = MAG_WELL_HRIFLE
	caliber = CAL_HRIFLE
	matter = list(MATERIAL_STEEL = 4)
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408
	max_ammo = 14
	multiple_sprites = 1

/obj/item/ammo_magazine/heavy_rifle_408/empty
	icon_state = "hrifle"
	initial_ammo = 0

/obj/item/ammo_magazine/heavy_rifle_408/rubber
	name = "heavy rifle magazine (rubber)"
	icon_state = "hrifle_r"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/rubber

/obj/item/ammo_magazine/heavy_rifle_408/practice
	name = "heavy rifle magazine (practice)"
	icon_state = "hrifle_p"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/practice

/obj/item/ammo_magazine/heavy_rifle_408/hv
	name = "heavy rifle magazine (SLAP)"
	icon_state = "hrifle_hv"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/hv

/obj/item/ammo_magazine/heavy_rifle_408/lethal
	name = "heavy rifle magazine (HP)"
	icon_state = "hrifle_l"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/lethal

/obj/item/ammo_magazine/heavy_rifle_408/scrap
	name = "old heavy rifle magazine (ball)"
	icon_state = "hrifle_s"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/scrap

/obj/item/ammo_magazine/heavy_rifle_408/scrap/empty
	initial_ammo = 0

/obj/item/ammo_magazine/heavy_rifle_408_drum
	name = "heavy rifle drum magazine (ball)"
	icon_state = "hdrum"
	desc = "A 36 round drum magazine marked for 8.6x70mm Heavy Rifle."
	origin_tech = list(TECH_COMBAT = 2)
	w_class = ITEM_SIZE_NORMAL
	mag_type = MAGAZINE
	mag_well = MAG_WELL_DRUM
	caliber = CAL_HRIFLE
	matter = list(MATERIAL_STEEL = 12)
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408
	max_ammo = 36
	multiple_sprites = 1

/obj/item/ammo_magazine/heavy_rifle_408_drum/lethal
	name = "heavy rifle drum magazine (hollow-tip)"
	icon_state = "hdrumhp"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/lethal

/obj/item/ammo_magazine/heavy_rifle_408_drum/rubber
	name = "heavy rifle drum magazine (baton)"
	icon_state = "hdrumltl"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/rubber

/obj/item/ammo_magazine/heavy_rifle_408_drum/slap
	name = "heavy rifle drum magazine (SLAP)"
	icon_state = "hdrumhv"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/hv

/obj/item/ammo_magazine/heavy_rifle_408_drum/incend
	name = "heavy rifle drum magazine (incendiary)"
	icon_state = "hdrumincend"
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408/incend

/obj/item/ammo_magazine/heavy_rifle_408_drum/empty
	name = "heavy rifle magazine"
	icon_state = "hdrum"
	matter = list(MATERIAL_STEEL = 12)
	initial_ammo = 0

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

/obj/item/ammo_magazine/c10x24/empty
	icon_state = "10x24"
	initial_ammo = 0

/obj/item/ammo_magazine/smg_10x24 // Refactors as it's not intended for a rifle but rather the Spec Ops.
	name = "high-capacity box magazine"
	desc = "A 40 round magazine marked for 10x24mm rounds."
	icon_state = "rifle"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	matter = list(MATERIAL_STEEL = 8)
	caliber = "10x24"
	ammo_type = /obj/item/ammo_casing/c10x24
	max_ammo = 40
	multiple_sprites = 1

//// .50 Kurz Heavy Pistol ////

/obj/item/ammo_magazine/kurz_50
	name = "heavy pistol magazine"
	desc = "A 7 round magazine marked for .50 Kurz."
	icon_state = "kurz"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	caliber = CAL_50
	matter = list(MATERIAL_STEEL = 4)
	ammo_type = /obj/item/ammo_casing/kurz_50
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/kurz_50/empty
	icon_state = "kurz"
	initial_ammo = 0

/obj/item/ammo_magazine/kurz_50/rubber
	name = "heavy pistol magazine (rubber)"
	icon_state = "kurz_r"
	ammo_type = /obj/item/ammo_casing/kurz_50/rubber

/obj/item/ammo_magazine/kurz_50/rubber/pepperball
	name = "heavy pistol magazine (pepperball)"
	icon_state = "kurz_l"
	ammo_type = /obj/item/ammo_casing/kurz_50/rubber/pepperball

/obj/item/ammo_magazine/kurz_50/practice
	name = "heavy pistol magazine (practice)"
	icon_state = "kurz_r"
	ammo_type = /obj/item/ammo_casing/kurz_50/practice

/obj/item/ammo_magazine/kurz_50/hv
	name = "heavy pistol magazine (high-velocity)"
	icon_state = "kurz_hv"
	ammo_type = /obj/item/ammo_casing/kurz_50/hv

/obj/item/ammo_magazine/kurz_50/lethal
	name = "heavy pistol magazine (hollow-point)"
	icon_state = "kurz_l"
	ammo_type = /obj/item/ammo_casing/kurz_50/lethal

///////// SPEEDLOADERS ///////////

//////// .35 SPEEDLOADERS //////////

/obj/item/ammo_magazine/speed_loader_pistol_35
	name = "speed loader (.35 Special)"
	desc = "A 6 round speed loader marked for (.35."
	icon_state = "slpistol_base"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_PISTOL
	matter = list(MATERIAL_STEEL = 3)
	ammo_type = /obj/item/ammo_casing/pistol_35
	max_ammo = 6

/obj/item/ammo_magazine/speed_loader_pistol_35/update_icon()
	cut_overlays()
	var/count = 0
	for(var/obj/item/ammo_casing/AC in stored_ammo)
		count++
		add_overlay("slpistol_[AC.shell_color]-[count]")

/obj/item/ammo_magazine/speed_loader_pistol_35/practice
	name = "speed loader (.35 Special practice)"
	ammo_type = /obj/item/ammo_casing/pistol_35/practice

/obj/item/ammo_magazine/speed_loader_pistol_35/hv
	name = "speed loader (.35 Special high-velocity)"
	ammo_type = /obj/item/ammo_casing/pistol_35/hv

/obj/item/ammo_magazine/speed_loader_pistol_35/rubber
	name = "speed loader (.35 Special rubber)"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber

/obj/item/ammo_magazine/speed_loader_pistol_35/rubber/pepperball
	name = "speed loader (.35 Special pepperball)"
	ammo_type = /obj/item/ammo_casing/pistol_35/rubber/pepperball

/obj/item/ammo_magazine/speed_loader_pistol_35/lethal
	name = "speed loader (.35 Special hollow point)"
	ammo_type = /obj/item/ammo_casing/pistol_35/lethal

/obj/item/ammo_magazine/speed_loader_pistol_35/scrap
	name = "old speed loader (.35 Special)"
	ammo_type = /obj/item/ammo_casing/pistol_35/scrap

//////// .40 SPEEDLOADERS //////////

/obj/item/ammo_magazine/speed_loader_magnum_40
	name = "speed loader (.40 Magnum)"
	desc = "A 6 round speed loader marked for .40 Magnum."
	icon_state = "slmagnum_base"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_MAGNUM
	ammo_type = /obj/item/ammo_casing/magnum_40
	matter = list(MATERIAL_STEEL = 3)
	max_ammo = 6

/obj/item/ammo_magazine/speed_loader_magnum_40/update_icon()
	cut_overlays()
	var/count = 0
	for(var/obj/item/ammo_casing/AC in stored_ammo)
		count++
		add_overlay("slmagnum_[AC.shell_color]-[count]")

/obj/item/ammo_magazine/speed_loader_magnum_40/Initialize()
	. = ..()
	update_icon()

/obj/item/ammo_magazine/speed_loader_magnum_40/practice
	name = "speed loader (.40 Magnum practice)"
	ammo_type = /obj/item/ammo_casing/magnum_40/practice

/obj/item/ammo_magazine/speed_loader_magnum_40/highvelocity
	name = "speed loader (.40 Magnum high-velocity)"
	ammo_type = /obj/item/ammo_casing/magnum_40/hv

/obj/item/ammo_magazine/speed_loader_magnum_40/rubber
	name = "speed loader (.40 Magnum rubber)"
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber

/obj/item/ammo_magazine/speed_loader_magnum_40/rubber/pepperball
	name = "speed loader (.40 Magnum pepperball)"
	ammo_type = /obj/item/ammo_casing/magnum_40/rubber/pepperball

/obj/item/ammo_magazine/speed_loader_magnum_40/lethal
	name = "speed loader (.40 Magnum hollow-point)"
	ammo_type = /obj/item/ammo_casing/magnum_40/lethal

/obj/item/ammo_magazine/speed_loader_magnum_40/scrap
	name = "old speed loader (.40 Magnum)"
	ammo_type = /obj/item/ammo_casing/magnum_40/scrap

/obj/item/ammo_magazine/speed_loader_magnum_40/biomatter
	name = "speed loader (.40 Magnum Caustic)"
	ammo_type = /obj/item/ammo_casing/magnum_40/biomatter

//// .50 Kurz speed loader ////

/obj/item/ammo_magazine/speed_loader_kurz_50
	name = "speed loader (.50 Kurz Special)"
	desc = "A 5 round speed loader marked for .50 Kurz."
	icon_state = "slmagnum_base"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_50
	ammo_type = /obj/item/ammo_casing/kurz_50
	matter = list(MATERIAL_STEEL = 3)
	max_ammo = 5

/obj/item/ammo_magazine/speed_loader_kurz_50/update_icon()
	cut_overlays()
	var/count = 0
	for(var/obj/item/ammo_casing/AC in stored_ammo)
		count++
		add_overlay("slmagnum_[AC.shell_color]-[count]")

/obj/item/ammo_magazine/speed_loader_kurz_50/practice
	name = "speed loader (.50 Kurz practice)"
	ammo_type = /obj/item/ammo_casing/kurz_50/practice

/obj/item/ammo_magazine/speed_loader_kurz_50/rubber
	name = "speed loader (.50 Kurz rubber)"
	ammo_type = /obj/item/ammo_casing/kurz_50/rubber

/obj/item/ammo_magazine/speed_loader_kurz_50/rubber/pepperball
	name = "speed loader (.50 Kurz pepperball)"
	ammo_type = /obj/item/ammo_casing/kurz_50/rubber/pepperball

/obj/item/ammo_magazine/speed_loader_kurz_50/lethal
	name = "speed loader (.50 Kurz hollow-point)"
	ammo_type = /obj/item/ammo_casing/kurz_50/lethal

/obj/item/ammo_magazine/speed_loader_kurz_50/highvelocity
	name = "speed loader (.50 Kurz high-velocity)"
	ammo_type = /obj/item/ammo_casing/kurz_50/hv

//////// RIFLE SPEEDLOADERS ////////

/obj/item/ammo_magazine/speed_loader_rifle_75
	name = "ammo strip (7.5mm Rifle)"
	desc = "A 10 round ammo strip for 7.5mm Rifle."
	icon_state = "stripper_base"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_RIFLE
	matter = list(MATERIAL_STEEL = 1)
	ammo_type = /obj/item/ammo_casing/rifle_75
	max_ammo = 10

/obj/item/ammo_magazine/speed_loader_rifle_75/update_icon()
	cut_overlays()
	var/count = 0
	for(var/obj/item/ammo_casing/AC in stored_ammo)
		count++
		add_overlay("stripper_[AC.shell_color]-[count]")

/obj/item/ammo_magazine/speed_loader_rifle_75/Initialize()
	. = ..()
	update_icon()

/obj/item/ammo_magazine/speed_loader_rifle_75/empty
	initial_ammo = 0
	icon_state = "stripper_base"

/obj/item/ammo_magazine/speed_loader_light_rifle_257
	name = "ammo strip (.257 Carbine)"
	desc = "A 10 round ammo strip for .257 Carbine."
	icon_state = "stripper_base"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_LRIFLE
	matter = list(MATERIAL_STEEL = 1)
	ammo_type = /obj/item/ammo_casing/light_rifle_257
	max_ammo = 10

/obj/item/ammo_magazine/speed_loader_light_rifle_257/update_icon()
	cut_overlays()
	var/count = 0
	for(var/obj/item/ammo_casing/AC in stored_ammo)
		count++
		add_overlay("stripper_[AC.shell_color]-[count]")

/obj/item/ammo_magazine/speed_loader_light_rifle_257/Initialize()
	. = ..()
	update_icon()

/obj/item/ammo_magazine/speed_loader_light_rifle_257/empty
	initial_ammo = 0
	icon_state = "stripper_base"

/obj/item/ammo_magazine/speed_loader_heavy_rifle_408
	name = "ammo strip (.408 Heavy Rifle)"
	desc = "A 10 round ammo strip for 8.6x70mm Heavy Rifle."
	icon_state = "stripper_base"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_HRIFLE
	matter = list(MATERIAL_STEEL = 1)
	ammo_type = /obj/item/ammo_casing/heavy_rifle_408
	max_ammo = 10

/obj/item/ammo_magazine/speed_loader_heavy_rifle_408/update_icon()
	cut_overlays()
	var/count = 0
	for(var/obj/item/ammo_casing/AC in stored_ammo)
		count++
		add_overlay("stripper_[AC.shell_color]-[count]")

/obj/item/ammo_magazine/speed_loader_heavy_rifle_408/Initialize()
	. = ..()
	update_icon()

/obj/item/ammo_magazine/speed_loader_heavy_rifle_408/empty
	icon_state = "stripper_base"
	initial_ammo = 0

//////// SHOTGUN SPEEDLOADERS ////////
/obj/item/ammo_magazine/speed_loader_shotgun
	name = "20mm loader tube (sabot slug)"
	desc = "A 6 round speed loader marked for 20mm Shells."
	icon = 'icons/obj/ammo_speed.dmi'
	icon_state = "shot_tube_s"
	caliber = CAL_SHOTGUN
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_STEEL = 4, MATERIAL_PLASTIC = 2)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/speed_loader_shotgun/empty
	name = "20mm loader tube (shells)"
	initial_ammo = 0
	icon_state = "shot_tube"

/obj/item/ammo_magazine/speed_loader_shotgun/pellet
	name = "20mm loader tube (buckshot)"
	icon_state = "shot_tube_l"
	ammo_type = /obj/item/ammo_casing/shotgun/pellet

/obj/item/ammo_magazine/speed_loader_shotgun/beanbag
	name = "20mm loader tube (beanbag)"
	icon_state = "shot_tube_r"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag

/obj/item/ammo_magazine/speed_loader_shotgun/beanbag/pepperball
	name = "20mm loader tube (beanbag)"
	icon_state = "shot_tube_l"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag/pepperball

////other////

/obj/item/ammo_magazine/caps
	name = "speed loader (caps)"
	desc = "A 8 round speed loader for cap guns."
	icon_state = "slpistol_l"
	icon = 'icons/obj/ammo_speed.dmi'
	caliber = CAL_CAP
	color = "#FF0000"
	ammo_type = /obj/item/ammo_casing/cap
	matter = list(MATERIAL_STEEL = 2)
	max_ammo = 8
	multiple_sprites = 1
/*
/obj/item/ammo_magazine/a75
	name = "ammo magazine (1.35 gyro)"
	desc = "A 4 magazine in 1.35 gyro."
	icon_state = "gyropistol"
	icon = 'icons/obj/ammo_mags.dmi'
	mag_type = MAGAZINE
	mag_well = MAG_WELL_PISTOL
	caliber = CAL_70
	ammo_type = /obj/item/ammo_casing/a75
	multiple_sprites = 1
	max_ammo = 4

/obj/item/ammo_magazine/a75/empty
	initial_ammo = 0
	icon_state = "gyropistol-0"
*/
////////////Shotguns!////////////

/obj/item/ammo_magazine/m12
	name = "20mm ammo drum (sabot slug)"
	desc = "A 20mm ammo drum for automatic and semiautomatic shotguns, holds 12 shells"
	icon_state = "m12_hv"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_DRUM
	caliber = CAL_SHOTGUN
	ammo_type = /obj/item/ammo_casing/shotgun
	matter = list(MATERIAL_STEEL = 2)
	max_ammo = 12 //back to twelve, rest in peace chud, if anyone uses "realism" IRL drums also use 12 majority of time
	ammo_color = "-hv"

/obj/item/ammo_magazine/m12/update_icon()
	cut_overlays()
	if(stored_ammo.len)
		var/obj/item/ammo_casing/AC = stored_ammo[1] //look at next casing.
		add_overlay("m12_shell_[AC.shell_color]") //look and display the overlay for the ammo

/obj/item/ammo_magazine/m12/Initialize()
	. = ..()
	update_icon()

/obj/item/ammo_magazine/m12/empty
	icon_state = "m12"
	initial_ammo = 0
	ammo_color = ""

/obj/item/ammo_magazine/m12/pellet
	name = "20mm ammo drum (buckshot)"
	icon_state = "m12_l"
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
	ammo_color = "-l"

/obj/item/ammo_magazine/m12/beanbag
	name = "20mm ammo drum (beanbag)"
	icon_state = "m12_r"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag
	ammo_color = "-r"

/obj/item/ammo_magazine/sbaw
	name = "20mm SBAW magazine (sabot slug)"
	desc = "An 8 round magazine for 20mm shotgun shells."
	icon_state = "sbaw_s"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_RIFLE
	caliber = CAL_SHOTGUN
	ammo_type = /obj/item/ammo_casing/shotgun
	multiple_sprites = 1
	max_ammo = 8 //Normal for detachable stick mags in shotguns / largest saiga has anyway

/obj/item/ammo_magazine/sbaw/empty
	name = "20mm SBAW magazine"
	icon_state = "sbaw"
	matter = list(MATERIAL_STEEL = 1)
	initial_ammo = 0

/obj/item/ammo_magazine/sbaw/beanbag
	name = "20mm SBAW magazine (beanbag)"
	icon_state = "sbaw_bb"
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag

/obj/item/ammo_magazine/sbaw/pellet
	name = "20mm SBAW magazine (buckshot)"
	icon_state = "sbaw_buck"
	ammo_type = /obj/item/ammo_casing/shotgun/pellet
/*
/obj/item/ammo_magazine/sbaw/he
	name = "20mm SBAW magazine (HEFI)"
	icon_state = "sbaw_he"
	ammo_type = /obj/item/ammo_casing/shotgun/payload
*/
// SCI ammo
/obj/item/ammo_magazine/rifle_223
	name = "short carbine magazine"
	desc = "A 20 round magazine marked for .223 Carbine laser ammunition."
	icon_state = "lsrifle"
	mag_type = MAGAZINE
	mag_well = MAG_WELL_LSRIFLE
	caliber = CAL_SCI
	matter = list(MATERIAL_STEEL = 10)
	ammo_type = /obj/item/ammo_casing/beam
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/rifle_223/empty
	initial_ammo = 0
