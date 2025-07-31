/obj/structure/closet/secure_closet/personal/scientist
	name = "soteria scientist's locker"
	req_access = list(access_rd)
	access_occupy = list(access_tox_storage)
	icon_state = "science"

/obj/structure/closet/secure_closet/personal/scientist/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	if(prob(50))
		new /obj/item/storage/backpack/purple/scientist(src)
	else
		new /obj/item/storage/backpack/satchel/purple/scientist(src)
	new /obj/item/clothing/under/rank/scientist(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat/science(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/device/radio/headset/headset_sci(src)
	new /obj/item/tank/air(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/storage/belt/sci(src)
	new /obj/item/storage/bag/xenobio(src)
	new /obj/item/bodybag/xenobio(src)
	new /obj/item/device/science_tool(src)

/obj/structure/closet/secure_closet/personal/robo
	name = "soteria roboticist's locker"
	req_access = list(access_robotics)
	icon_state = "science"

/obj/structure/closet/secure_closet/personal/robo/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	if(prob(50))
		new /obj/item/storage/backpack/purple/scientist(src)
	else
		new /obj/item/storage/backpack/satchel/purple/scientist(src)
	new /obj/item/clothing/under/rank/roboticist(src)
	new /obj/item/clothing/suit/storage/rank/robotech_jacket(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/device/radio/headset/headset_sci(src)
	new /obj/item/tank/air(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/storage/belt/sci(src)
	new /obj/item/device/robotanalyzer(src)
	new /obj/item/hydrogen_fuel_cell(src)


/obj/structure/closet/secure_closet/reinforced/RD
	name = "soteria research overseer's locker"
	req_access = list(access_rd)
	icon_state = "rd"

/obj/structure/closet/secure_closet/reinforced/RD/populate_contents()
	if(populated_contents)
		return
	populated_contents = TRUE
	//Clothing
	new /obj/item/clothing/suit/bio_suit/scientist(src)
	new /obj/item/clothing/head/bio_hood/scientist(src)
	new /obj/item/clothing/accessory/halfcape/cro(src)
	new /obj/item/clothing/under/rank/expedition_overseer(src)
	new /obj/item/clothing/suit/storage/toggle/labcoat(src)
	new /obj/item/clothing/shoes/color(src)
	new /obj/item/clothing/shoes/leather(src)
	new /obj/item/clothing/gloves/latex(src)
	new /obj/item/device/radio/headset/heads/rd(src)
	new /obj/item/clothing/mask/gas(src)
	new /obj/item/rig/advhazmat/equipped(src)
	//RD eclsuive disks
	new /obj/item/pc_part/drive/disk/design/xenobio/rd(src)
	new /obj/item/pc_part/drive/disk/design/rped/rd(src)
	new /obj/item/pc_part/drive/disk/design/computer/rd(src)
	new /obj/item/pc_part/drive/disk/design/genetics_kit(src)
	//Storage
	new /obj/item/storage/bag/xenobio(src)
	new /obj/item/storage/belt/sci(src)
	new /obj/item/bodybag/xenobio(src)
	new /obj/item/device/aicard(src)
	//Misc
	new /obj/item/tank/air(src)
	new /obj/item/device/flash(src)
	new /obj/item/shield_projector/rectangle/soteria_personal(src)
	new /obj/item/tool/hydrogen_sword(src)
	new /obj/item/circuitboard/teleporter(src)
	new /obj/item/circuitboard/aicore(src)
	new /obj/item/oddity/chem_book(src)
	new /obj/item/clothing/accessory/holster/saber/rapiersci/occupied(src)
