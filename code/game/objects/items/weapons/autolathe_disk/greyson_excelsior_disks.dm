// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1
// greyson positronic
/obj/item/pc_part/drive/disk/design/onestar
	disk_name = "Greyson Positronics Tool Pack"
	icon_state = "onestar"
	license = 5
	designs = list(
		/datum/design/autolathe/tool/crowbar_onestar,
		/datum/design/autolathe/tool/combi_driver_onestar,
		/datum/design/autolathe/tool/weldertool_onestar,
		/datum/design/autolathe/tool/onestar_saw,
		/datum/design/autolathe/tool/multitool/multitool_onestar = 2,
		/datum/design/autolathe/tool/hammer_onestar = 2,
		/datum/design/autolathe/tool/omni_surgery_onestar = 2,
		/datum/design/autolathe/tool/onestar_pliers = 2,
		/datum/design/autolathe/tool/pickaxe_onestar,
		/datum/design/autolathe/tool/onestar_shovel,
		/datum/design/autolathe/tool/jackhammer_onestar,
		/datum/design/autolathe/tool/drill_onestar,
		/datum/design/autolathe/part/greyson/ai = 3,
	)

/obj/item/pc_part/drive/disk/design/onestar/stockparts
	disk_name = "Greyson Positronics Stock Parts Pack"
	icon_state = "onestar"
	license = 8
	designs = list(
		/datum/design/autolathe/greyson/laser,
		/datum/design/autolathe/greyson/matter,
		/datum/design/autolathe/greyson/module,
		/datum/design/autolathe/greyson/capacitor,
		/datum/design/autolathe/greyson/manipulator,
	)

/obj/item/pc_part/drive/disk/design/onestar/cog
	disk_name = "Greyson Positronics - Cog"
	icon_state = "onestar"
	license = 6
	designs = list(
		/datum/design/autolathe/gun/greyson_cog = 2,
		/datum/design/autolathe/cell/medium/high,
	)

/obj/item/pc_part/drive/disk/design/onestar/spring
	disk_name = "Greyson Positronics - Spring"
	icon_state = "onestar"
	license = 10
	designs = list(
		/datum/design/autolathe/gun/spring = 4,
		/datum/design/autolathe/ammo/pistol_practice = 0,
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol,
		/datum/design/autolathe/ammo/pistol_lethal = 2,
	)

/obj/item/pc_part/drive/disk/design/onestar/rivet
	disk_name = "Greyson Positronics - Rivet"
	icon_state = "onestar"
	license = 10
	designs = list(
		/datum/design/autolathe/gun/rivet = 4,
		/datum/design/autolathe/ammo/magnum_practice = 0,
		/datum/design/autolathe/ammo/magnum_rubber,
		/datum/design/autolathe/ammo/magnum,
		/datum/design/autolathe/ammo/magnum_lethal = 2,
	)

/obj/item/pc_part/drive/disk/design/onestar/rebar
	disk_name = "Greyson Positronics - rebar"
	icon_state = "onestar"
	license = 10
	designs = list(
		/datum/design/autolathe/gun/rebar = 3,
		/datum/design/autolathe/ammo/kurtz_practice = 0,
		/datum/design/autolathe/ammo/kurtz_rubber,
		/datum/design/autolathe/ammo/kurtz,
		/datum/design/autolathe/ammo/kurtz_lethal = 2,
		)

/obj/item/pc_part/drive/disk/design/onestar/nail_gun
	disk_name = "Greyson Positronics - Nail Gun"
	icon_state = "onestar"
	license = 16
	designs = list(
		/datum/design/autolathe/gun/nail_gun = 6,
		/datum/design/autolathe/ammo/lrifle_short_practice = 0,
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_short,
		/datum/design/autolathe/ammo/lrifle_short_lethal = 2,
		/datum/design/autolathe/ammo/lrifle_practice = 1,
		/datum/design/autolathe/ammo/lrifle_rubber = 2,
		/datum/design/autolathe/ammo/lrifle = 2,
		/datum/design/autolathe/ammo/lrifle_lethal = 4,
	)

/obj/item/pc_part/drive/disk/design/onestar/scaffold
	disk_name = "Greyson Positronics - Scaffold"
	icon_state = "onestar"
	license = 6
	designs = list(
		/datum/design/autolathe/gun/scaffold = 2,
		/datum/design/autolathe/ammo/c10x24,
		/datum/design/autolathe/ammo/box_10x24 = 2,
	)

/obj/item/pc_part/drive/disk/design/onestar/trouble_shooter
	disk_name = "Greyson Positronics - Trouble Shooter"
	icon_state = "onestar"

	license = 6
	designs = list(
		/datum/design/autolathe/gun/trouble_shooter = 3,
		/datum/design/autolathe/ammo/rifle,						//AK ammo
		/datum/design/autolathe/ammo/rifle_lethal,
		/datum/design/autolathe/ammo/rifle_ammobox
	)

/obj/item/pc_part/drive/disk/design/onestar/armor
	disk_name = "Greyson Positronics - Ablative Vest"
	icon_state = "onestar"
	license = 6 //3 sets
	designs = list(
		/datum/design/autolathe/clothing/iron_lock_security_armor,
		/datum/design/autolathe/clothing/iron_lock_security_helmet,
		/datum/design/autolathe/clothing/iron_lock_security_gloves,
		/datum/design/autolathe/clothing/iron_lock_security_boots,
	)

// Excelsior We also replace "name" for spawning reasons
/obj/item/pc_part/drive/disk/design/excelsior
	name = "design disk Means of Production"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"This struggle must be organized, according to \"all the rules of the art\", by people who are professionally engaged in revolutionary activity.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,						//guns
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/gun/ak47_saiga,
		/datum/design/autolathe/gun/maxim,
		/datum/design/autolathe/gun/ppsh,
		/datum/design/autolathe/gun/reclaimer,
		/datum/design/autolathe/ammo/pistol,				//makarov ammo
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/smg,							//drozd ammo
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/rifle,							//vintorez ammo
		/datum/design/autolathe/ammo/rifle_short_hv,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/sl_rifle,						//boltgun ammo
		/datum/design/autolathe/ammo/rifle,						//AK ammo
		/datum/design/autolathe/ammo/rifle_short_rubber,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/pistol_35_drum,				//ppsh
		/datum/design/autolathe/ammo/pistol_35_drum/empty,
		/datum/design/autolathe/ammo/pistol_35_drum/rubber,
		/datum/design/autolathe/ammo/pistol_35_drum/hv,
		/datum/design/autolathe/ammo/pistol_35_drum/lethal,
		/datum/design/autolathe/ammo/sbaw_slug,						//saiga ammo
		/datum/design/autolathe/ammo/sbaw_pellet,
		/datum/design/autolathe/ammo/maxim,							//maxim ammo
		/datum/design/autolathe/circuit/autolathe_excelsior,		//circuits
		/datum/design/autolathe/circuit/shieldgen_excelsior,
		/datum/design/autolathe/circuit/reconstructor_excelsior,
		/datum/design/autolathe/circuit/diesel_excelsior,
		/datum/design/autolathe/circuit/turret_excelsior,
		/datum/design/autolathe/circuit/recharger,
		/datum/design/autolathe/circuit/autolathe_disk_cloner,
		/datum/design/research/item/part/micro_mani,				//machine parts
		/datum/design/research/item/part/subspace_amplifier,
		/datum/design/research/item/part/subspace_crystal,
		/datum/design/research/item/part/subspace_transmitter,
		/datum/design/autolathe/part/igniter,						//regular parts
		/datum/design/autolathe/part/signaler,
		/datum/design/autolathe/part/sensor_prox,
		/datum/design/autolathe/part/cable_coil,
		/datum/design/autolathe/cell/large/excelsior,				//power cells
		/datum/design/autolathe/cell/medium/excelsior,
		/datum/design/autolathe/cell/small/excelsior,
		/datum/design/autolathe/device/excelsiormine,				//security
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/sec/handcuffs_adv,
		/datum/design/autolathe/prosthesis/excelsior/l_arm,         //prostheses
		/datum/design/autolathe/prosthesis/excelsior/r_arm,
		/datum/design/autolathe/prosthesis/excelsior/l_leg,
		/datum/design/autolathe/prosthesis/excelsior/r_leg,
		/datum/design/autolathe/prosthesis/excelsior/groin,
		/datum/design/autolathe/prosthesis/excelsior/chest,
		/datum/design/autolathe/prosthesis/excelsior/head,
		/datum/design/autolathe/device/implanter,					//misc
		/datum/design/autolathe/device/propaganda_chip,
		/datum/design/autolathe/clothing/excelsior_armor,
		/datum/design/autolathe/device/excelbaton,
		/datum/design/autolathe/tool/excelsior_hammer,
		/datum/design/autolathe/sec/excelsior_shield,
		/datum/design/autolathe/container/ammocan_excel,
		/datum/design/autolathe/excelsior/laser,
		/datum/design/autolathe/excelsior/matter,
		/datum/design/autolathe/excelsior/module,
		/datum/design/autolathe/excelsior/capacitor,
		/datum/design/autolathe/excelsior/manipulator
	)

/obj/item/pc_part/drive/disk/design/excelsior_weapons
	name = "design disk Means of Revolution"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"We stand for organized terror - this should be frankly admitted. Terror is an absolute necessity during times of revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/gun/ak47_saiga,
		/datum/design/autolathe/gun/maxim,
		/datum/design/autolathe/gun/ppsh,
		/datum/design/autolathe/ammo/hpistol,				//makarov ammo
		/datum/design/autolathe/ammo/hpistol_rubber,
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/smg,							//ppsh ammo
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/smg_magnum_40,					//drozd ammo
		/datum/design/autolathe/ammo/sl_rifle,						//boltgun ammo
		/datum/design/autolathe/ammo/rifle,						//AK ammo
		/datum/design/autolathe/ammo/rifle_rubber,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/ammo/rifle,							//vintorez ammo
		/datum/design/autolathe/ammo/rifle_short_hv,
		/datum/design/autolathe/ammo/pistol_35_drum,				//ppsh
		/datum/design/autolathe/ammo/pistol_35_drum/empty,
		/datum/design/autolathe/ammo/pistol_35_drum/rubber,
		/datum/design/autolathe/ammo/pistol_35_drum/hv,
		/datum/design/autolathe/ammo/pistol_35_drum/lethal,
		/datum/design/autolathe/ammo/sbaw_slug,						//saiga ammo
		/datum/design/autolathe/ammo/sbaw_pellet,
		/datum/design/autolathe/ammo/maxim, 						//maxim
		/datum/design/autolathe/sec/silencer,						//misc
		/datum/design/autolathe/sec/excelsior_shield,
		/datum/design/autolathe/sec/handcuffs_adv,
		/datum/design/autolathe/tool/excelsior_hammer,
		/datum/design/autolathe/clothing/excelsior_armor,
		/datum/design/autolathe/container/ammocan_excel
	)

/obj/item/pc_part/drive/disk/design/ex_parts
	name = "design disk Stocking Revolution"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"Everything can be a part of the revolution!\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/circuit/autolathe_excelsior,//circuits
		/datum/design/autolathe/circuit/diesel_excelsior,
		/datum/design/autolathe/circuit/autolathe_disk_cloner,
		/datum/design/autolathe/circuit/recharger,
		/datum/design/autolathe/device/propaganda_chip,
		/datum/design/autolathe/part/cable_coil,
		/datum/design/autolathe/part/igniter,//regular parts
		/datum/design/autolathe/part/signaler,
		/datum/design/autolathe/part/sensor_prox,
		/datum/design/autolathe/part/consolescreen,
		/datum/design/autolathe/excelsior/laser, //Good parts
		/datum/design/autolathe/excelsior/matter,
		/datum/design/autolathe/excelsior/module,
		/datum/design/autolathe/excelsior/capacitor,
		/datum/design/autolathe/excelsior/manipulator
	)


/obj/item/pc_part/drive/disk/design/ex_cells
	name = "design disk Means of Power"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"The power of the people!\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/cell/large/excelsior,
		/datum/design/autolathe/cell/medium/excelsior,
		/datum/design/autolathe/cell/small/excelsior
	)

/obj/item/pc_part/drive/disk/design/guns/ex_drozd
	name = "design disk 9mm Drozd SMG"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"Nobody is to be blamed for being born a slave; but a slave who not only eschews a striving for freedom but justifies and eulogies his slavery - such a slave is a lickspittle and a boor, who arouses a legitimate feeling of indignation, contempt, and loathing..\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/container/ammocan_excel
	)

/obj/item/pc_part/drive/disk/design/guns/ex_makarov
	name = "design disk Makarov"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"The Equalizer that fits in your pocket.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,
		/datum/design/autolathe/ammo/hpistol,				//makarov ammo
		/datum/design/autolathe/ammo/hpistol_rubber,
		/datum/design/autolathe/container/ammocan_excel
	)

/obj/item/pc_part/drive/disk/design/guns/ex_vintorez
	name = "design disk Vintorez"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"The gun of long revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/container/ammocan_excel
	)

/obj/item/pc_part/drive/disk/design/guns/ex_boltgun
	name = "design disk Kardashev-Mosin"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"The gun of endless revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/ammo/sl_rifle,
		/datum/design/autolathe/ammo/rifle_ammobox_small,
		/datum/design/autolathe/container/ammocan_excel
	)

/obj/item/pc_part/drive/disk/design/guns/ex_ak
	name = "design disk Kalashnikov"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"The gun of modern revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/ammo/rifle,						//AK ammo
		/datum/design/autolathe/ammo/rifle_rubber,
		/datum/design/autolathe/ammo/rifle_ammobox,
		/datum/design/autolathe/container/ammocan_excel
	)

/obj/item/pc_part/drive/disk/design/guns/ex_reclaimer
	name = "design disk Reclaimer"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"The gun of clean revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/reclaimer
		)

/obj/item/pc_part/drive/disk/design/guns/ex_ppsh
	name = "design disk Shpagin"
	disk_name = "Excelsior"
	desc = "The back has a machine etching: \"The hammer to break the chains.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/ppsh,
		/datum/design/autolathe/ammo/pistol_35_drum,
		/datum/design/autolathe/ammo/pistol_35_drum/empty,
		/datum/design/autolathe/ammo/pistol_35_drum/rubber,
		/datum/design/autolathe/ammo/pistol_35_drum/hv,
		/datum/design/autolathe/ammo/pistol_35_drum/lethal,
		/datum/design/autolathe/container/ammocan_excel
		)
