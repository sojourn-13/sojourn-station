// These are basically USB data sticks and may be used to transfer files between devices
/obj/item/pc_part/drive/disk
	name = "data disk"
	desc = "A removable disk used to store data."
	w_class = ITEM_SIZE_SMALL
	icon = 'icons/obj/discs.dmi'
	icon_state = "blue"
	critical = FALSE
	hardware_size = 1
	power_usage = 30
	max_capacity = 64
	default_files = list()
	origin_tech = list(TECH_DATA = 2)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 2, MATERIAL_GOLD = 0.25)
	price_tag = 25
	var/disk_name
	var/license = 0

/obj/item/pc_part/drive/get_item_cost(export)
	. = ..()
	for(var/datum/computer_file/wealth_of_file in stored_files)
		. += (wealth_of_file.added_wealth * wealth_of_file.size)

/obj/item/pc_part/drive/disk/basic
	name = "basic data disk"
	icon_state = "yellow"
	max_capacity = 16
	origin_tech = list(TECH_DATA = 1)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 2)
	price_tag = 10

/obj/item/pc_part/drive/disk/adv
	name = "advanced data disk"
	desc = "A removable disk used to store large amounts of data."
	icon_state = "black"
	max_capacity = 256
	origin_tech = list(TECH_DATA = 4)
	matter = list(MATERIAL_STEEL = 1, MATERIAL_PLASTIC = 2, MATERIAL_GOLD = 0.5)
	price_tag = 150


/obj/item/pc_part/drive/disk/adv/shady
	name = "old data disk"
	icon_state = "onestar"
	disk_name = "warez"
	default_files = list(
		/datum/computer_file/program/filemanager,
		/datum/computer_file/program/access_decrypter,
		/datum/computer_file/program/bootkit,
		/datum/computer_file/program/ntnet_dos,
		/datum/computer_file/program/camera_monitor/hacked,
		/datum/computer_file/program/revelation
	)

/obj/item/pc_part/drive/disk/adv/nuke
	name = "old data disk"
	icon_state = "onestar"
	disk_name = "nuke"
	default_files = list(
		/datum/computer_file/program/revelation/primed
	)

/obj/item/pc_part/drive/disk/adv/coin
	name = "data disk"
	icon_state = "ruined"
	disk_name = "Key-Authenticated Zipped K-oin"
	max_capacity = 60 //50 x 60 = 3000
	default_files = list(
		/datum/computer_file/program/coin_miner/disk //Fancy anticheat verson
	)

/obj/item/pc_part/drive/disk/Initialize()
	. = ..()
	w_class = ITEM_SIZE_SMALL
	if(disk_name)
		SetName("[initial(name)] - '[disk_name]'")

/obj/item/pc_part/drive/disk/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/pen))
		var/new_name = input(user, "What would you like to label the disk?", "Tape labeling") as null|text
		if(isnull(new_name)) return
		new_name = sanitizeSafe(new_name)
		if(new_name)
			SetName("[initial(name)] - '[new_name]'")
			to_chat(user, SPAN_NOTICE("You label the disk '[new_name]'."))
		else
			SetName("[initial(name)]")
			to_chat(user, SPAN_NOTICE("You wipe off the label."))
		return

	..()

/obj/item/pc_part/drive/disk/install_default_files()
	if(disk_name)
		var/datum/computer_file/data/text/D = new
		D.filename = "DISK_NAME"
		D.stored_data = disk_name

		store_file(D)
	..()

/obj/item/pc_part/drive/disk/nano_ui_data()
	var/list/data = ..()
	data["license"] = license
	return data
