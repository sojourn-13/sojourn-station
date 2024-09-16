/obj/structure/closet/secure_closet/reinforced/engineering_chief
	name = "guild master's locker"
	req_access = list(access_ce)
	icon_state = "ce"

/obj/structure/closet/secure_closet/reinforced/engineering_chief/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/industrial(src)
	else
		new /obj/item/storage/backpack/satchel/industrial(src)
	new /obj/item/blueprints(src)
	new /obj/item/clothing/under/rank/exultant(src)
	new /obj/item/clothing/head/firefighter/chief(src)
	new /obj/item/clothing/head/welding(src)
	new /obj/item/clothing/gloves/insulated(src)
	new /obj/item/clothing/shoes/color/brown(src)
	new /obj/item/clothing/accessory/halfcape/gm(src)
	new /obj/item/device/radio/headset/heads/ce(src)
	new /obj/item/storage/toolbox/mechanical(src)
	new /obj/item/clothing/suit/storage/hazardvest(src)
	new /obj/item/clothing/mask/gas/artificer(src)
	new /obj/item/tool/multitool(src)
	new /obj/item/device/flash(src)
	new /obj/item/taperoll/engineering(src)
	new /obj/item/tool/tape_roll/flextape(src)
	new /obj/item/storage/pouch/engineering_supply(src)
	new /obj/item/device/t_scanner/advanced(src)
	new /obj/item/storage/hcases/parts(src)
	new /obj/item/storage/hcases/engi(src)
	new /obj/item/circuitboard/bullet_fab(src)
	new /obj/item/rpd(src)
	new /obj/item/gun/energy/laser/railgun/pistol/slab(src)
	if(prob(50))
		new /obj/item/tool_upgrade/augment/ai_tool(src)
	else if(prob(50))
		new /obj/item/tool_upgrade/augment/repair_nano(src)
	else
		new /obj/item/tool_upgrade/augment/randomizer(src)
	new /obj/item/clothing/glasses/powered/meson(src)
	new /obj/item/hand_labeler(src)
	new /obj/item/storage/briefcase(src)
	new /obj/item/storage/lunchbox(src)

/obj/structure/closet/secure_closet/engineering_electrical
	name = "electrical supplies"
	req_access = list(access_engine_equip)
	icon_state = "eng"
	icon_door = "eng_elec"

/obj/structure/closet/secure_closet/engineering_electrical/populate_contents()
	new /obj/item/clothing/gloves/insulated(src)
	new /obj/item/clothing/gloves/insulated(src)
	new /obj/item/storage/toolbox/electrical(src)
	new /obj/item/storage/toolbox/electrical(src)
	new /obj/item/storage/toolbox/electrical(src)
	new /obj/item/circuitboard/apc(src)
	new /obj/item/circuitboard/apc(src)
	new /obj/item/circuitboard/apc(src)
	new /obj/item/tool/multitool(src)
	new /obj/item/tool/multitool(src)
	new /obj/item/tool/multitool(src)
	new /obj/item/storage/hcases/parts(src)
	new /obj/item/storage/hcases/engi(src)

/obj/structure/closet/secure_closet/engineering_welding
	name = "welding supplies"
	req_access = list(access_construction)
	icon_state = "eng"
	icon_door = "eng_weld"

/obj/structure/closet/secure_closet/engineering_welding/populate_contents()
	new /obj/item/clothing/head/welding(src)
	new /obj/item/clothing/head/welding(src)
	new /obj/item/clothing/head/welding(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/tool/weldingtool(src)
	new /obj/item/weldpack(src)
	new /obj/item/weldpack(src)
	new /obj/item/weldpack(src)
	new /obj/item/tool_upgrade/augment/fuel_tank(src)
	new /obj/item/tool_upgrade/augment/fuel_tank(src)
	new /obj/item/tool_upgrade/augment/fuel_tank(src)
	new /obj/item/storage/hcases/parts(src)
	new /obj/item/storage/hcases/engi(src)

/obj/structure/closet/secure_closet/personal/engineering_personal
	name = "guild adept's locker"
	req_access = list(access_ce)
	access_occupy = list(access_engine_equip)
	icon_state = "eng"
	icon_door = "eng_secure"

/obj/structure/closet/secure_closet/personal/engineering_personal/populate_contents()
	if(prob(50))
		new /obj/item/storage/backpack/industrial(src)
	else
		new /obj/item/storage/backpack/satchel/industrial(src)
	new /obj/item/storage/toolbox/mechanical(src)
	new /obj/item/clothing/under/rank/engineer(src)
	new /obj/item/clothing/head/hardhat(src)
	new /obj/item/clothing/head/welding(src)
	new /obj/item/clothing/gloves/insulated(src)
	new /obj/item/device/radio/headset/headset_eng(src)
	new /obj/item/clothing/suit/storage/hazardvest(src)
	new /obj/item/clothing/mask/gas/artificer(src)
	new /obj/item/clothing/glasses/powered/meson(src)
	new /obj/item/device/t_scanner/advanced(src)
	new /obj/item/storage/hcases/parts(src)
	new /obj/item/storage/hcases/engi(src)
	new /obj/item/rpd(src)
	new /obj/item/taperoll/engineering(src)
