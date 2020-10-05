// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1
// greyson positronic
/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar
	disk_name = "Greyson Positronics Tool Pack"
	icon_state = "onestar"
	license = 5
	designs = list(
		/datum/design/autolathe/tool/crowbar_onestar,
		/datum/design/autolathe/tool/combi_driver_onestar,
		/datum/design/autolathe/tool/jackhammer_onestar,
		/datum/design/autolathe/tool/drill_onestar,
		/datum/design/autolathe/tool/weldertool_onestar,
		/datum/design/autolathe/tool/hammer_onestar = 2,
		/datum/design/autolathe/tool/omni_surgery_onestar = 2,
		/datum/design/autolathe/tool/pickaxe_onestar,
		/datum/design/autolathe/part/greyson/ai = 3,

	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar/stockparts
	disk_name = "Greyson Positronics Stockpart Pack"
	icon_state = "onestar"
	license = 8
	designs = list(
		/datum/design/autolathe/greyson/laser,
		/datum/design/autolathe/greyson/matter,
		/datum/design/autolathe/greyson/module,
		/datum/design/autolathe/greyson/capacitor,
		/datum/design/autolathe/greyson/manipulator,

	)


/obj/item/weapon/computer_hardware/hard_drive/portable/design/onestar/cog
	disk_name = "Greyson Positronics - Cog"
	icon_state = "onestar"
	license = 6
	designs = list(
		/datum/design/autolathe/gun/greyson_cog = 2,
		/datum/design/autolathe/cell/medium/high,

	)

// Excelsior
/obj/item/weapon/computer_hardware/hard_drive/portable/design/excelsior
	disk_name = "Excelsior Means of Production"
	desc = "The back has a machine etching: \"This struggle must be organised, according to \"all the rules of the art\", by people who are professionally engaged in revolutionary activity.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,						//guns
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/gun/ak47,
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
		/datum/design/autolathe/ammo/lrifle,						//AK ammo
		/datum/design/autolathe/ammo/lrifle_short_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/circuit/autolathe_excelsior,		//circuits
		/datum/design/autolathe/circuit/shieldgen_excelsior,
		/datum/design/autolathe/circuit/reconstructor_excelsior,
		/datum/design/autolathe/circuit/diesel_excelsior,
		/datum/design/autolathe/circuit/turret_excelsior,
		/datum/design/autolathe/circuit/autolathe_disk_cloner = 3,
		/datum/design/research/item/part/micro_mani,				//machine parts
		/datum/design/research/item/part/subspace_amplifier,
		/datum/design/research/item/part/subspace_crystal,
		/datum/design/research/item/part/subspace_transmitter,
		/datum/design/autolathe/part/igniter,						//regular parts
		/datum/design/autolathe/part/signaler,
		/datum/design/autolathe/part/sensor_prox,
		/datum/design/research/item/part/basic_capacitor,
		/datum/design/autolathe/cell/large/excelsior,				//power cells
		/datum/design/autolathe/cell/medium/excelsior,
		/datum/design/autolathe/cell/small/excelsior,
		/datum/design/autolathe/device/excelsiormine,				//security
		/datum/design/autolathe/sec/beartrap,
		/datum/design/autolathe/prosthesis/excelsior/l_arm,         //prostheses
		/datum/design/autolathe/prosthesis/excelsior/r_arm,
		/datum/design/autolathe/prosthesis/excelsior/l_leg,
		/datum/design/autolathe/prosthesis/excelsior/r_leg,
		/datum/design/autolathe/device/implanter,					//misc
		/datum/design/autolathe/clothing/excelsior_armor,
		/datum/design/autolathe/device/excelbaton,
		/datum/design/autolathe/excelsior/laser,
		/datum/design/autolathe/excelsior/matter,
		/datum/design/autolathe/excelsior/module,
		/datum/design/autolathe/excelsior/capacitor,
		/datum/design/autolathe/excelsior/manipulator
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/excelsior_weapons
	disk_name = "Excelsior Means of Revolution"
	desc = "The back has a machine etching: \"We stand for organized terror - this should be frankly admitted. Terror is an absolute necessity during times of revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/ammo/pistol,				//makarov ammo
		/datum/design/autolathe/ammo/pistol_rubber,
		/datum/design/autolathe/ammo/pistol_ammobox,
		/datum/design/autolathe/ammo/pistol_ammobox_rubber,
		/datum/design/autolathe/ammo/smg,							//drozd ammo
		/datum/design/autolathe/ammo/smg_rubber,
		/datum/design/autolathe/ammo/sl_rifle,						//boltgun ammo
		/datum/design/autolathe/ammo/lrifle,						//AK ammo
		/datum/design/autolathe/ammo/lrifle_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/ammo/rifle,							//vintorez ammo
		/datum/design/autolathe/ammo/rifle_short_hv,
		/datum/design/autolathe/ammo/lrifle_ammobox,
		/datum/design/autolathe/sec/silencer,						//misc
		/datum/design/autolathe/clothing/excelsior_armor,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/ex_parts
	disk_name = "Excelsior - Stocking Revolution"
	desc = "The back has a machine etching: \"Everything can be apart of the revolution!\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/circuit/autolathe_excelsior,//circuits
		/datum/design/autolathe/circuit/diesel_excelsior,
		/datum/design/autolathe/circuit/autolathe_disk_cloner,
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


/obj/item/weapon/computer_hardware/hard_drive/portable/design/ex_cells
	disk_name = "Excelsior - Means of Power"
	desc = "The back has a machine etching: \"The power of the people!\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/cell/large/excelsior,
		/datum/design/autolathe/cell/medium/excelsior,
		/datum/design/autolathe/cell/small/excelsior
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_drozd
	disk_name = "Excelsior - .35 Drozd SMG"
	desc = "The back has a machine etching: \"Nobody is to be blamed for being born a slave; but a slave who not only eschews a striving for freedom but justifies and eulogies his slavery - such a slave is a lickspittle and a boor, who arouses a legitimate feeling of indignation, contempt, and loathing..\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/drozd,
		/datum/design/autolathe/ammo/smg,
		/datum/design/autolathe/ammo/smg_rubber
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_makarov
	disk_name = "Excelsior - Makarov"
	desc = "The back has a machine etching: \"The Equalizer that fits in your pocket.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/makarov,
		/datum/design/autolathe/ammo/pistol,				//makarov ammo
		/datum/design/autolathe/ammo/pistol_rubber,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_vintorez
	disk_name = "Excelsior - Vintorez"
	desc = "The back has a machine etching: \"The gun of long revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/vintorez,
		/datum/design/autolathe/ammo/rifle,
		/datum/design/autolathe/ammo/lrifle_ammobox,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_boltgun
	disk_name = "Excelsior - Kardashev-Mosin"
	desc = "The back has a machine etching: \"The gun of endless revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/boltgun,
		/datum/design/autolathe/ammo/sl_rifle,
		/datum/design/autolathe/ammo/rifle_ammobox_small,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_ak
	disk_name = "Excelsior - Kalashnikov"
	desc = "The back has a machine etching: \"The gun of modern revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/ak47,
		/datum/design/autolathe/ammo/lrifle,						//AK ammo
		/datum/design/autolathe/ammo/lrifle_rubber,
		/datum/design/autolathe/ammo/lrifle_ammobox,
	)

/obj/item/weapon/computer_hardware/hard_drive/portable/design/guns/ex_reclaimer
	disk_name = "Excelsior - Reclaimer"
	desc = "The back has a machine etching: \"The gun of clean revolution.\""
	icon_state = "excelsior"

	license = -1
	designs = list(
		/datum/design/autolathe/gun/reclaimer
		)