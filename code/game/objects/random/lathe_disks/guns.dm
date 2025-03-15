/obj/random/lathe_disk/any_gun
	name = "random any gun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/any_gun/item_to_spawn() // pickweight is calculated from advanced list = / 2 - 1. If lower than 1 - delete from the list;
	return pickweight(list(
				/obj/random/lathe_disk/ion_gun = 1,
				/obj/random/lathe_disk/ammo = 5,
				/obj/random/lathe_disk/laser_gun = 2,
				/obj/random/lathe_disk/revolver = 5,
				/obj/random/lathe_disk/shotgun = 3,
				/obj/random/lathe_disk/grande = 1,
				/obj/random/lathe_disk/pistol = 6,
				/obj/random/lathe_disk/rifle = 4,
				/obj/random/lathe_disk/rifle_heavy = 2,
				/obj/random/lathe_disk/smg = 3,
				/obj/random/lathe_disk/lmg = 2,
				/obj/random/lathe_disk/bolt_gun = 5))

/obj/random/lathe_disk/any_gun/low_chance
	name = "low chance any gun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

//Higher weighted to be good guns

/obj/random/lathe_disk/better_any_gun
	name = "random better any gun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/better_any_gun/item_to_spawn() // pickweight is calculated from advanced list = / 2 - 1. If lower than 1 - delete from the list;
	return pickweight(list(
				/obj/random/lathe_disk/ion_gun = 3,
				/obj/random/lathe_disk/ammo = 2,
				/obj/random/lathe_disk/laser_gun = 6,
				/obj/random/lathe_disk/revolver = 3,
				/obj/random/lathe_disk/shotgun = 5,
				/obj/random/lathe_disk/grande = 4,
				/obj/random/lathe_disk/pistol = 1,
				/obj/random/lathe_disk/rifle = 4,
				/obj/random/lathe_disk/rifle_heavy = 2,
				/obj/random/lathe_disk/smg = 1,
				/obj/random/lathe_disk/lmg = 4,
				/obj/random/lathe_disk/bolt_gun = 1))

/obj/random/lathe_disk/better_any_gun/low_chance
	name = "low chance better gun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

///More defined gun types then just any

/obj/random/lathe_disk/bolt_gun
	name = "random boltgun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/bolt_gun/low_chance
	name = "low chance boltgun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/bolt_gun/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/guns/heavysniper = 1,
				/obj/item/pc_part/drive/disk/design/guns/armstrong = 6,
				/obj/item/pc_part/drive/disk/design/guns/custer = 4,
				/obj/item/pc_part/drive/disk/design/guns/roe = 4,
				/obj/item/pc_part/drive/disk/design/guns/boltgun_sa = 6,
				/obj/item/pc_part/drive/disk/design/blackshield/bounty_lever = 2))

/obj/random/lathe_disk/lmg
	name = "random lmg lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/lmg/low_chance
	name = "low chance lmg lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/lmg/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/blackshield/dp = 3,
				/obj/item/pc_part/drive/disk/design/blackshield/semyonovich = 4,
				/obj/item/pc_part/drive/disk/design/guns/sa_pk = 2,
				/obj/item/pc_part/drive/disk/design/guns/tk = 1.5,
				/obj/item/pc_part/drive/disk/design/guns/ex_ppsh = 1,
				/obj/item/pc_part/drive/disk/design/nt/concillium = 2))


/obj/random/lathe_disk/smg
	name = "random smg lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/smg/low_chance
	name = "low chance smg lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/smg/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/guns/texan = 6,
				/obj/item/pc_part/drive/disk/design/blackshield/semyonovich = 5,
				/obj/item/pc_part/drive/disk/design/guns/bastard = 3,
				/obj/item/pc_part/drive/disk/design/guns/thompson = 4,
				/obj/item/pc_part/drive/disk/design/guns/freedom = 2,
				/obj/item/pc_part/drive/disk/design/guns/vector = 3,
				/obj/item/pc_part/drive/disk/design/guns/specop = 2,
				/obj/item/pc_part/drive/disk/design/blackshield/triage = 2,
				/obj/item/pc_part/drive/disk/design/guns/ex_drozd = 1))

/obj/random/lathe_disk/rifle
	name = "random assault rifle lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/rifle/low_chance
	name = "low chance assault rifle lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/rifle/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/guns/bulldog = 4,
				/obj/item/pc_part/drive/disk/design/guns/sol = 4,
				/obj/item/pc_part/drive/disk/design/guns/ostwind = 5,
				/obj/item/pc_part/drive/disk/design/guns/pulse_rifle = 1,
				/obj/item/pc_part/drive/disk/design/guns/sa_kalashnikov = 2,
				/obj/item/pc_part/drive/disk/design/guns/tac_kalashnikov = 1,
				/obj/item/pc_part/drive/disk/design/guns/viper = 1,
				/obj/item/pc_part/drive/disk/design/guns/copperhead = 2,
				/obj/item/pc_part/drive/disk/design/blackshield/luger = 3,
				/obj/item/pc_part/drive/disk/design/guns/bulldog = 3,
				/obj/item/pc_part/drive/disk/design/blackshield/duty = 1,
				/obj/item/pc_part/drive/disk/design/blackshield/watchtower = 2,
				/obj/item/pc_part/drive/disk/design/strelki = 3,))

/obj/random/lathe_disk/rifle_heavy
	name = "random heavy rifle lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/rifle_heavy/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/nt/shepherd,
				/obj/item/pc_part/drive/disk/design/guns/omni/longarm,
				/obj/item/pc_part/drive/disk/design/guns/omni = 4))



/obj/random/lathe_disk/pistol
	name = "random pistol lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/pistol/low_chance
	name = "low chance pistol lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/pistol/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/nt/mk58 = 5,
				/obj/item/pc_part/drive/disk/design/guns/colt = 5,
				/obj/item/pc_part/drive/disk/design/guns/rafale = 2,
				/obj/item/pc_part/drive/disk/design/guns/lamia = 2,
				/obj/item/pc_part/drive/disk/design/guns/basilisk = 1,
				/obj/item/pc_part/drive/disk/design/guns/cheap_guns = 6,
				/obj/item/pc_part/drive/disk/design/guns/liberty = 2,
				/obj/item/pc_part/drive/disk/design/guns/glock = 2,
				/obj/item/pc_part/drive/disk/design/guns/judiciary =2))

/obj/random/lathe_disk/grande
	name = "random grenade based weapon lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/grande/low_chance
	name = "low chance grenade based weapon lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/grande/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/nt/protector = 3,
				/obj/item/pc_part/drive/disk/design/guns/lenar = 2,
				/obj/item/pc_part/drive/disk/design/guns/china = 4,
				/obj/item/pc_part/drive/disk/design/guns/pitbull = 2,
				/obj/item/pc_part/drive/disk/design/nt/antebellum = 1))

/obj/random/lathe_disk/shotgun
	name = "random shotgun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/shotgun/low_chance
	name = "low chance shotgun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/shotgun/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/guns/doublebarrel = 5,
				/obj/item/pc_part/drive/disk/design/guns/grizzly = 7,
				/obj/item/pc_part/drive/disk/design/nt/regulator = 4,
				/obj/item/pc_part/drive/disk/design/guns/gladstone = 5,
				/obj/item/pc_part/drive/disk/design/nt/lemant = 2, //Has a built in shotgun, so low odds but still here
				/obj/item/pc_part/drive/disk/design/guns/state = 4,
				/obj/item/pc_part/drive/disk/design/guns/pug = 3,
				/obj/item/pc_part/drive/disk/design/guns/sbaw = 0.7)) // Should be rarer as it has become too good.

/obj/random/lathe_disk/revolver
	name = "random revolver lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/revolver/low_chance
	name = "low chance revolver lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/revolver/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/guns/cheap_guns = 5,
				/obj/item/pc_part/drive/disk/design/nt/lemant = 5,
				/obj/item/pc_part/drive/disk/design/guns/rex10 = 5,
				/obj/item/pc_part/drive/disk/design/guns/rev10 = 3,
				/obj/item/pc_part/drive/disk/design/guns/revolver = 4,
				/obj/item/pc_part/drive/disk/design/guns/stun_revolver = 2,
				/obj/item/pc_part/drive/disk/design/guns/sixshot = 2,
				/obj/item/pc_part/drive/disk/design/guns/mateba = 1))

/obj/random/lathe_disk/ammo
	name = "random ammo lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/ammo/low_chance
	name = "low chance ammo lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/ammo/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/nonlethal_ammo = 3,
				/obj/item/pc_part/drive/disk/design/exotic_ammo = 1,
				/obj/item/pc_part/drive/disk/design/lethal_ammo = 2,
				/obj/item/pc_part/drive/disk/design/ammo_boxes_smallarms = 2,
				/obj/item/pc_part/drive/disk/design/ammo_boxes_rifle = 2))

/obj/random/lathe_disk/laser_gun
	name = "random laser gun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/laser_gun/low_chance
	name = "low chance laser gun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/laser_gun/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/nt/counselor = 6,
				/obj/item/pc_part/drive/disk/design/guns/spiderrose = 4,
				/obj/item/pc_part/drive/disk/design/guns/martin = 4,
				/obj/item/pc_part/drive/disk/design/guns/firestorm = 3,
				/obj/item/pc_part/drive/disk/design/guns/lasercore = 2,
				/obj/item/pc_part/drive/disk/design/guns/lasercannon = 2,
				/obj/item/pc_part/drive/disk/design/guns/sunrise = 1,
				/obj/item/pc_part/drive/disk/design/guns/centauri = 1,

				/obj/item/pc_part/drive/disk/design/guns/stun_revolver = 1,

				/obj/item/pc_part/drive/disk/design/nt/nemesis = 2,
				/obj/item/pc_part/drive/disk/design/nt/themis = 4,
				/obj/item/pc_part/drive/disk/design/nt/lightfall = 4,
				/obj/item/pc_part/drive/disk/design/nt/carpedie = 1,
				/obj/item/pc_part/drive/disk/design/nt/valkirye = 2,
				/obj/random/lathe_disk/ion_gun/low_chance = 2,

				/obj/item/pc_part/drive/disk/design/nt/dominion = 2,
				/obj/item/pc_part/drive/disk/design/nt/purger = 2,
				/obj/item/pc_part/drive/disk/design/guns/cassad = 1))

/obj/random/lathe_disk/ion_gun
	name = "random ion gun lathe disk"
	icon_state = "tech-green"

/obj/random/lathe_disk/ion_gun/low_chance
	name = "low chance ion gun lathe disk"
	icon_state = "tech-green-low"
	spawn_nothing_percentage = 80

/obj/random/lathe_disk/ion_gun/item_to_spawn()
	return pickweight(list(
				/obj/item/pc_part/drive/disk/design/nt/halicon = 2,
				/obj/item/pc_part/drive/disk/design/guns/ion_pistol = 1))
