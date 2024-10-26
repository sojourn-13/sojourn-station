/obj/random/tool
	name = "random tool"
	icon_state = "tool-grey"
	spawn_nothing_percentage = 15
	has_postspawn = TRUE

/obj/random/tool/item_to_spawn()
	return pickweight(list(/obj/random/pack/rare = 2,
				/obj/item/tool/omnitool = 0.5,
				/obj/item/tool/screwdriver = 4,
				/obj/item/tool/screwdriver/improvised = 8,
				/obj/item/tool/screwdriver/electric = 2,
				/obj/item/tool/screwdriver/combi_driver = 1,
				/obj/item/tool/wirecutters = 4,
				/obj/item/tool/wirecutters/improvised = 6,
				/obj/item/tool/wirecutters/pliers = 4,
				/obj/item/tool/wirecutters/armature = 2,
				/obj/item/tool/weldingtool = 4,
				/obj/item/tool/weldingtool/improvised = 8,
				/obj/item/tool/weldingtool/advanced = 2,
				/obj/item/tool/crowbar = 8,
				/obj/item/tool/crowbar/improvised = 12,
				/obj/item/tool/crowbar/pneumatic = 2,
				/obj/item/tool/wrench = 4,
				/obj/item/tool/wrench/improvised = 6,
				/obj/item/tool/wrench/big_wrench = 2,
				/obj/item/tool/hammer = 8,
				/obj/item/tool/hammer/deadblow = 4,
				/obj/item/tool/hammer/homewrecker = 10,
				/obj/item/tool/hammer/powered_hammer = 2,
				/obj/item/tool/multitool = 3,
				/obj/item/tool/multitool/improvised = 4,
				/obj/item/tool/multitool/uplink = 0.01, //REALLY RARE
				/obj/item/tool/multitool/advanced = 1,
				/obj/item/tool/saw = 4,
				/obj/item/tool/saw/improvised = 6,
				/obj/item/tool/saw/circular = 2,
				/obj/item/tool/saw/circular/advanced = 1,
				/obj/item/tool/saw/chain = 0.5,
				/obj/item/tool/saw/hyper = 0.5,
				/obj/item/tool/surgicaldrill = 4,
				/obj/item/tool/surgicaldrill/adv = 1,
				/obj/item/tool/shovel = 3,
				/obj/item/tool/shovel/improvised = 6,
				/obj/item/tool/shovel/spade = 2.5,
				/obj/item/tool/shovel/power = 1,
				/obj/item/tool/pickaxe = 2,
				/obj/item/tool/pickaxe/jackhammer = 1,
				/obj/item/tool/pickaxe/drill = 1,
				/obj/item/tool/pickaxe/diamonddrill = 0.5,
				/obj/item/tool/pickaxe/excavation = 1,
				/obj/item/tool/tape_roll/web = 8, //real tape rarer do to making tools last so long / gives a reason to print it
				/obj/item/tool/tape_roll = 5,
				/obj/item/tool/tape_roll/fiber = 2,
				/obj/item/tool/tape_roll/glue = 4,
				/obj/item/tool/knife/shiv = 7,
				/obj/item/reagent_containers/spray/vvd40 = 0.5,
				/obj/item/storage/belt/utility = 5,
				/obj/item/storage/belt/utility/full = 1,
				/obj/item/clothing/gloves/insulated/cheap = 5,
				/obj/item/clothing/gloves/insulated = 2,
				/obj/item/clothing/head/welding = 5,
				/obj/item/extinguisher = 5,
				/obj/item/device/t_scanner = 2,
				/obj/item/device/scanner/price = 2,
				/obj/item/device/destTagger = 1,
				/obj/item/device/scanner/plant = 1,
				/obj/item/autopsy_scanner = 1,
				/obj/item/device/scanner/health = 3,
				/obj/item/device/scanner/mass_spectrometer = 1,
				/obj/item/device/robotanalyzer = 1,
				/obj/item/device/gps = 3,
				/obj/item/device/scanner/gas = 2,
				/obj/item/stack/cable_coil = 5,
				/obj/item/weldpack/canister = 2,
				/obj/item/packageWrap = 1,
				/obj/item/device/flash = 2,
				/obj/item/mop = 5,
				/obj/item/inflatable_dispenser = 3,
				/obj/item/grenade/chem_grenade/cleaner = 2,
				/obj/item/device/lighting/toggleable/flashlight = 10,
				/obj/item/tank/jetpack/carbondioxide = 1.5,
				/obj/item/tank/jetpack/oxygen = 1,
				/obj/item/storage/makeshift_grinder = 2,
				/obj/item/device/makeshift_electrolyser = 1,
				/obj/item/device/makeshift_centrifuge = 1,
				/obj/item/robot_parts/robot_component/jetpack = 0.75,))


//Randomly spawned tools will often be in imperfect condition if they've been left lying out
/obj/random/tool/post_spawn(var/list/spawns)
	if (isturf(loc))
		for (var/obj/O in spawns)
			if (!istype(O, /obj/random) && prob(20))
				O.make_old()


/obj/random/tool/low_chance
	name = "low chance random tool"
	icon_state = "tool-grey-low"
	spawn_nothing_percentage = 60


/obj/random/tool/advanced
	name = "random advanced tool"
	icon_state = "tool-orange"

/obj/random/tool/advanced/always_spawn
	name = "random always spawn advanced tool"
	icon_state = "material-blue"

/obj/random/tool/advanced/item_to_spawn()
	return pickweight(list(
				/obj/item/tool/screwdriver/combi_driver = 3,
				/obj/item/tool/wirecutters/armature = 3,
				/obj/item/tool/omnitool = 2,
				/obj/item/tool/crowbar/pneumatic = 3,
				/obj/item/tool/wrench/big_wrench = 3,
				/obj/item/tool/weldingtool/advanced = 3,
				/obj/item/tool/saw/circular/advanced = 2,
				/obj/item/tool/saw/chain = 1,
				/obj/item/tool/saw/hyper = 1,
				/obj/item/tool/pickaxe/diamonddrill = 2,
				/obj/item/tool/hammer/deadblow = 2,
				/obj/item/tool/tape_roll/fiber = 2,
				/obj/item/tool/multitool/advanced = 1,
				/obj/item/tool/multitool/uplink = 0.05, //REALLY RARE
				//obj/item/tool/tape_roll/flextape = 1,
				/obj/item/tool/fireaxe = 1))

/obj/random/tool/advanced/low_chance
	name = "low chance advanced tool"
	icon_state = "tool-orange-low"
	spawn_nothing_percentage = 60

/obj/random/toolbox
	name = "random toolbox"
	icon_state = "box-green"

/obj/random/toolbox/item_to_spawn()
	return pickweight(list(/obj/item/storage/toolbox/mechanical = 3,
				/obj/item/storage/toolbox/electrical = 2,
				/obj/item/storage/toolbox/emergency = 1))

/obj/random/toolbox/low_chance
	name = "low chance random toolbox"
	icon_state = "box-green-low"
	spawn_nothing_percentage = 60

/obj/random/tool/advanced/onestar
	name = "random greyson tool"

/obj/random/tool/advanced/onestar/item_to_spawn()
	return pickweight(list(/obj/item/tool/crowbar/onestar = 1,
						/obj/item/tool/medmultitool = 1,
						/obj/item/tool/pickaxe/onestar = 1,
						/obj/item/tool/pickaxe/jackhammer/onestar = 1,
						/obj/item/tool/pickaxe/drill/onestar = 1,
						/obj/item/tool/shovel/onestar_shovel = 0.5,
						/obj/item/tool/saw/onestar_saw = 1,
						/obj/item/tool/hammer/powered_hammer/onestar_hammer = 0.5,
						/obj/item/tool/screwdriver/combi_driver/onestar = 1,
						/obj/item/tool/weldingtool/onestar = 1,
						/obj/item/tool/wirecutters/onestar_pliers = 0.2,
						/obj/item/tool/multitool/advanced/onestar = 0.1))

/obj/random/tool/advanced/onestar/low_chance
	icon_state = "tool-orange-low"
	spawn_nothing_percentage = 60


/obj/random/handmade_tool
	name = "random handmade tool"
	icon_state = "box-green"

/obj/random/handmade_tool/item_to_spawn()
	return pickweight(list(
				/obj/item/tool/screwdriver/improvised = 8,
				/obj/item/tool/wirecutters/improvised = 6,
				/obj/item/tool/weldingtool/improvised = 8,
				/obj/item/tool/crowbar/improvised = 12,
				/obj/item/tool/wrench/improvised = 6,
				/obj/item/tool/hammer/homewrecker = 10,
				/obj/item/tool/multitool/improvised = 4,
				/obj/item/tool/saw/improvised = 6,
				/obj/item/tool/shovel/improvised = 6,
				/obj/item/clothing/head/welding = 5,
				/obj/item/device/scanner/plant = 1,
				/obj/item/device/scanner/mass_spectrometer = 1,
				/obj/item/stack/cable_coil = 5,
				/obj/item/weldpack/canister = 2,
				/obj/item/device/flash = 2,,
				/obj/item/storage/makeshift_grinder = 2,
				/obj/item/device/makeshift_electrolyser = 1,
				/obj/item/device/makeshift_centrifuge = 1,))

/obj/random/handmade_tool/low_chance
	name = "low chance random handmade tool"
	icon_state = "box-green-low"
	spawn_nothing_percentage = 60
