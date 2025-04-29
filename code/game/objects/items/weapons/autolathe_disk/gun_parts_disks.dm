// Disks formated as /designpath = pointcost , if no point cost is specified it defaults to 1.
// To make a design unprotect use -1

/*
This is the master-file for all gun parts crafting disks. All gun parts in autolathe printing form can be found inside datums/autolathe/parts.dm.

Parts disks should be kept VERY RARE to encourage players to trade and go to specific departments to buy bulk-parts, or encourage them to go and find parts themselves.
However, bootleg parts - i.e steel parts - should be easily printed and easier to find as they, currently (as of the making of the gun parts PR), can only be used in bootleg hamdemades.

Avoid any disks here being found or used commonly beyond an intended purpose, otherwise you will flood the economy full of parts.
*/

// Master-disk for example, full of 'lower-end' regular parts. Unused currently. Maybe consider putting on beacon or RARE loot rotation if gun parts are an issue.
/obj/item/pc_part/drive/disk/design/gun_parts/resale
	disk_name = "NM - \"Do it yourself!\" firearm parts"
	icon_state = "marshal"

	license = 20
	designs = list(
		/datum/design/autolathe/part/grip/wood = 0,
		/datum/design/autolathe/part/grip/plastic,
		/datum/design/autolathe/part/grip/serb = 2,
		/datum/design/autolathe/part/mechanism/pistol,
		/datum/design/autolathe/part/mechanism/revolver,
		/datum/design/autolathe/part/mechanism/boltgun,
		/datum/design/autolathe/part/mechanism/shotgun = 2,
		/datum/design/autolathe/part/mechanism/autorifle = 3,
		/datum/design/autolathe/part/barrel/pistol,
		/datum/design/autolathe/part/barrel/magnum,
		/datum/design/autolathe/part/barrel/carbine = 2,
		/datum/design/autolathe/part/barrel/rifle = 2,
	)

// Marshal-specific disk, used by Marshals for high-end gun crafting. MOST gun parts should be here, but thankfully licenses keep it at limited-use.
// Infinate given gun parts are mass-printed by Guild, orderable by LS, and can be taken from broken down guns. Guild can mass-produce better, but only Marshals can print high-end.
/obj/item/pc_part/drive/disk/design/gun_parts/marshal
	disk_name = "NM - \"Gunsmiths United\" firearm parts"
	icon_state = "marshal"

	license = -1
	designs = list(
		/datum/design/autolathe/part/grip/wood,
		/datum/design/autolathe/part/grip/plastic,
		/datum/design/autolathe/part/grip/serb,
		/datum/design/autolathe/part/grip/rubber,
		/datum/design/autolathe/part/mechanism/pistol,
		/datum/design/autolathe/part/mechanism/revolver,
		/datum/design/autolathe/part/mechanism/shotgun,
		/datum/design/autolathe/part/mechanism/autorifle,
		/datum/design/autolathe/part/mechanism/smg,
		/datum/design/autolathe/part/mechanism/machinegun,
		/datum/design/autolathe/part/barrel/pistol,
		/datum/design/autolathe/part/barrel/magnum,
		/datum/design/autolathe/part/barrel/kurtz,
		/datum/design/autolathe/part/barrel/carbine,
		/datum/design/autolathe/part/barrel/rifle,
		/datum/design/autolathe/part/barrel/heavy,
		/datum/design/autolathe/part/barrel/shotgun,
		/datum/design/autolathe/part/barrel/amr,
	)

// Bootleg-gun production stuff. Found in loot-piles, can be bought by LSS for a slightly inflated price.
// Relatively useless, but might be useful for Outsiders, Prospies, and anyone wanting really cheap guns instead of paying inflated prices just for a single normal gun.
/obj/item/pc_part/drive/disk/design/gun_parts/bootleg
	disk_name = "No License - \"Anarchist Dream\" gun parts"
	icon_state = "black"

	license = -1	// No point to limit prints, steel parts can only be used in homemade guns.
	designs = list(
		/datum/design/autolathe/part/grip/wood,
		/datum/design/autolathe/part/mechanism/pistol/steel,
		/datum/design/autolathe/part/mechanism/revolver/steel,
		/datum/design/autolathe/part/mechanism/shotgun/steel,
		/datum/design/autolathe/part/mechanism/autorifle/steel,
		/datum/design/autolathe/part/mechanism/smg/steel,
		/datum/design/autolathe/part/mechanism/boltgun,
		/datum/design/autolathe/part/barrel/pistol/steel,
		/datum/design/autolathe/part/barrel/magnum/steel,
		/datum/design/autolathe/part/barrel/carbine/steel,
		/datum/design/autolathe/part/barrel/rifle/steel,
		/datum/design/autolathe/part/barrel/shotgun/steel,
	)


/////////////////////
// Gun frame disks //
/////////////////////

// This section contains gun frame disks, including Marshal gun frame disks used to make Marshal specific guns.
// Guns here should keep in mind that you can produce these for retail and resale at LSS, as some are going to be orderable by Cargo. Return for investment and time, really.

// Resale disk for LSS to make and sell guns. Maybe put into piles.
/obj/item/pc_part/drive/disk/design/gun_frames/resale
	disk_name = "Blackmarket - \"Make-Your-Own-Gun! For ages 9+!\" gun frames"
	icon_state = "black"

	license = 14
	designs = list(
		/datum/design/autolathe/gun_frame/colt,
		/datum/design/autolathe/gun_frame/havelock,
		/datum/design/autolathe/gun_frame/giskard,
		/datum/design/autolathe/gun_frame/roe,
		/datum/design/autolathe/gun_frame/doublebarrel,
		/datum/design/autolathe/gun_frame/grizzly,
	)

// Resale disk for LSS to make and sell guns. Higher-end frames, still have to get the parts themselves. Do NOT put this into piles.
/obj/item/pc_part/drive/disk/design/gun_frames/resale/high
	disk_name = "SA - \"Resale Distributors Pack\" gun frames"
	icon_state = "frozenstar"

	license = 8
	designs = list(
		/datum/design/autolathe/gun_frame/ak47 = 2,
		/datum/design/autolathe/gun_frame/grease,
		/datum/design/autolathe/gun_frame/pug = 2,
		/datum/design/autolathe/gun_frame/strelki,
	)

// Marshal gun-frame print disk, allows the printing of what used to be on the Negotiator disk to the Spec and WO. Do NOT put this into piles.
/obj/item/pc_part/drive/disk/design/gun_frames/marshal
	disk_name = "NM - \"Framework of Dreams\" gun frames"
	icon_state = "marshal"

	license = -1	// No point to limit prints, the gun parts themselves will be the limit.
	designs = list(
		/datum/design/autolathe/gun_frame/judiciary,
		/datum/design/autolathe/gun_frame/colt,
		/datum/design/autolathe/gun_frame/amnesty,
		/datum/design/autolathe/gun_frame/judge,
		/datum/design/autolathe/gun_frame/freedom,
		/datum/design/autolathe/gun_frame/specop,
		/datum/design/autolathe/gun_frame/mamba,
		/datum/design/autolathe/gun_frame/opshot,
		/datum/design/autolathe/gun_frame/wind,
		/datum/design/autolathe/gun_frame/takeshi
	)
//Rearranged into Pistol > Revolver > SMG > Carbine > Shotgun > Rifle > MG for better clarity

/obj/item/pc_part/drive/disk/design/gun_frames/marshal/surplus
	disk_name = "NM - \"Ironing Surplus with Hammers\" gun frames"
//This right here if you ever readd old marshal / ironhammer guns put it right here there that there, also into the actual vendor outside.
	designs = list(
		/datum/design/autolathe/gun_frame/glock,
		/datum/design/autolathe/gun_frame/ladon,
		/datum/design/autolathe/gun_frame/grease,
		/datum/design/autolathe/gun_frame/canine,
		/datum/design/autolathe/gun_frame/grizzly,
		/datum/design/autolathe/gun_frame/gladstone,
		/datum/design/autolathe/gun_frame/bastard,
		/datum/design/autolathe/gun_frame/dp
	)
