
//Exoidic disks from random other places.

//Sun Branch
/obj/item/pc_part/drive/disk/design/sun_branch
	disk_name = "Sun Branch Armerments"
	icon_state = "sun_branch_disk"
	license = 3
	designs = list(
		/datum/design/autolathe/clothing/firefly_glasses,
		/datum/design/autolathe/tool/dawn = 2,
		/datum/design/autolathe/tool/midday,
		/datum/design/autolathe/tool/sun_set,
	)

//Stamped Branch
/obj/item/pc_part/drive/disk/design/stamped_branch
	disk_name = "Stamped Branch Armerments"
	icon_state = "stamped_branch_disk"
	license = 12
	designs = list(
		/datum/design/autolathe/clothing/stamped_wired_suit = 7, //Cheap suit that has good armor so we dont allow mass printing
		/datum/design/autolathe/clothing/stamped_huds = 0, //Its useless
		/datum/design/autolathe/gun/stamped = 3,
		/datum/design/autolathe/gun/stamped_smg = 4,
		/datum/design/autolathe/ammo/stamped_mag,
		/datum/design/autolathe/ammo/stamped_mag_hv,
		/datum/design/autolathe/ammo/stamped_mag_rubber,
		/datum/design/autolathe/ammo/stamped_mag_lethal,
		/datum/design/autolathe/ammo/stamped_mag_practice
	)
