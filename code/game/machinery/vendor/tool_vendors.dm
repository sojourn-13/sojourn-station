
/obj/machinery/vending/assist
	products = list(
		/obj/item/device/assembly/prox_sensor = 10,
		/obj/item/device/assembly/igniter = 10,
		/obj/item/device/assembly/signaler = 10,
		/obj/item/tool/wirecutters = 5,
		/obj/item/tool/wirecutters/pliers = 5,
		/obj/item/cartridge/signal = 10,
		/obj/item/device/lighting/toggleable/flashlight = 5,
		/obj/item/device/assembly/timer = 10,
		)
	product_ads = "Only the finest!;Have some tools.;The most robust equipment.;The finest gear in space!"
	shut_up = 1
	auto_price = FALSE
	give_discounts = FALSE
	give_discount_points = FALSE

/obj/machinery/vending/tool
	name = "YouTool"
	desc = "Tools for tools."
	product_slogans = "Tools, Gloves and everything you would need!; Need a belt?; Top quality tools, only here!; Doors shocked again? We have gloves!;Better than the competitors!"
	product_ads = "Reliable!;Highest Quality!;Take a belt!;Colorful cables!;Insulated Gloves, only here!"
	icon_state = "tool"
	icon_deny = "tool-deny"
	products = list(/obj/item/stack/cable_coil/random = 10,
					/obj/item/tool/crowbar = 5,
					/obj/item/tool/weldingtool = 5,
					/obj/item/tool/wirecutters = 3,
					/obj/item/tool/wirecutters/pliers = 3,
					/obj/item/tool/wrench = 5,
					/obj/item/tool/hammer = 5,
					/obj/item/device/scanner/gas = 5,
					/obj/item/device/t_scanner = 5,
					/obj/item/tool/screwdriver = 5,
					/obj/item/clothing/gloves/insulated/cheap = 4,
					/obj/item/clothing/gloves/insulated = 2,
					/obj/item/storage/pouch/engineering_tools = 2,
					/obj/item/storage/pouch/engineering_supply = 2,
					/obj/item/weldpack/canister = 4,
					/obj/item/weldpack = 2)
	prices = list(/obj/item/tool/hammer = 30,
					/obj/item/stack/cable_coil/random = 50,
					/obj/item/tool/crowbar = 30,
					/obj/item/tool/weldingtool = 50,
					/obj/item/tool/wirecutters = 30,
					/obj/item/tool/wirecutters/pliers = 30,
					/obj/item/tool/wrench = 30,
					/obj/item/device/scanner/gas = 50,
					/obj/item/device/t_scanner = 50,
					/obj/item/tool/screwdriver = 30,
					/obj/item/clothing/gloves/insulated/cheap = 80,
					/obj/item/clothing/gloves/insulated = 600,
					/obj/item/storage/pouch/engineering_tools = 150,
					/obj/item/storage/pouch/engineering_supply = 300,
					/obj/item/weldpack/canister = 200,
					/obj/item/weldpack = 300)

/obj/machinery/vending/engivend
	name = "Guild-Vend"
	desc = "Spare tool vending. What? Did you expect some witty description?"
	product_slogans = "Spare tools for your Engineering needs!;Forgot where we keep mesons again, didn't you?;Need a battery?;You need electronics? I got electronics."
	shut_up = 1
	icon_state = "engivend"
	icon_deny = "engivend-deny"
	products = list(/obj/item/clothing/glasses/powered/meson = 2,
					/obj/item/clothing/glasses/welding = 2,
					/obj/item/clothing/head/welding = 2,
					/obj/item/tool/multitool = 4,
					/obj/item/airlock_electronics = 10,
					/obj/item/circuitboard/apc = 10,
					/obj/item/airalarm_electronics = 10,
					/obj/item/cell/large/high = 2,
					/obj/item/storage/belt/utility = 3,
					/obj/item/weldpack/canister = 4,
					/obj/item/weldpack = 2)
	contraband = list(/obj/item/cell/large/potato = 3)
	auto_price = FALSE

//This one's from bay12
/obj/machinery/vending/engineering
	name = "Artificer's Tool Maker"
	desc = "Everything you need for do-it-yourself colony repair."
	product_slogans = "Home project planned? Do it yourself!;Legally, I have to ask you not to use those tools to hack into anything.;Locked door? Tools here!;Big project and you're missing your precious wrench? I bet I can replace it!;The most robust tools on the colony!"
	product_ads = "Best tools!;Cheap!;Reliable!;Do-It-Yourself!"
	icon_state = "engi"
	icon_deny = "engi-deny"
	vendor_department = DEPARTMENT_ENGINEERING
	products = list(/obj/item/clothing/head/hardhat = 4,
					/obj/item/storage/belt/utility = 4,
					/obj/item/storage/belt/webbing/artificer = 2,
					/obj/item/clothing/glasses/powered/meson = 4,
					/obj/item/clothing/glasses/powered/night/guild = 4,
					/obj/item/clothing/gloves/insulated = 4,
					/obj/item/tool/screwdriver = 12,
					/obj/item/tool/crowbar = 12,
					/obj/item/tool/wirecutters = 12,
					/obj/item/tool/wirecutters/pliers = 6,
					/obj/item/tool/multitool = 12,
					/obj/item/tool/hammer = 10,
					/obj/item/tool/wrench = 12,
					/obj/item/device/t_scanner = 12,
					/obj/item/cell/large = 8,
					/obj/item/tool/weldingtool = 8,
					/obj/item/clothing/head/welding = 8,
					/obj/item/weldpack/canister = 4,
					/obj/item/weldpack = 2,
					/obj/item/light/tube = 30,
					/obj/item/light/tube/power_saver = 30,
					/obj/item/light/tube/large = 15,
					/obj/item/light/bulb = 30,
					/obj/item/light/bulb/power_saver = 30,
					/obj/item/light/bulb/spotlight = 15,
					/obj/item/clothing/suit/fire = 4,
					/obj/item/clothing/suit/armor/vest/technomancersuit = 3,
					/obj/item/clothing/head/helmet/technomancersuit = 3,
					/obj/item/storage/bag/sheetsnatcher/guild = 6,
					/obj/item/tool_upgrade/reinforcement/plasmablock = 6,
					/obj/item/tool_upgrade/reinforcement/rubbermesh = 6,
					/obj/item/tool_upgrade/productivity/booster = 6,
					/obj/item/tool_upgrade/productivity/injector = 6,
					/obj/item/stock_parts/scanning_module = 5,
					/obj/item/stock_parts/micro_laser = 5,
					/obj/item/stock_parts/matter_bin = 5,
					/obj/item/stock_parts/manipulator = 5,
					/obj/item/stock_parts/console_screen = 5)
	prices = list(/obj/item/clothing/head/hardhat = 4,
					/obj/item/storage/belt/utility = 75,
					/obj/item/storage/belt/webbing/artificer = 2500,
					/obj/item/clothing/glasses/powered/meson = 150,
					/obj/item/clothing/glasses/powered/night/guild = 1200,
					/obj/item/clothing/gloves/insulated = 600,
					/obj/item/tool/screwdriver = 30,
					/obj/item/tool/crowbar = 30,
					/obj/item/tool/wirecutters = 30,
					/obj/item/tool/wirecutters/pliers = 30,
					/obj/item/tool/multitool = 40,
					/obj/item/tool/hammer = 30,
					/obj/item/tool/wrench = 40,
					/obj/item/device/t_scanner = 50,
					/obj/item/cell/large = 500,
					/obj/item/tool/weldingtool = 40,
					/obj/item/clothing/head/welding = 80,
					/obj/item/weldpack/canister = 100,
					/obj/item/weldpack = 200,
					/obj/item/light/tube = 10,
					/obj/item/light/tube/power_saver = 5,
					/obj/item/light/tube/large = 20,
					/obj/item/light/bulb = 5,
					/obj/item/light/bulb/power_saver = 2,
					/obj/item/light/bulb/spotlight = 15,
					/obj/item/clothing/suit/fire = 150,
					/obj/item/clothing/suit/armor/vest/technomancersuit = 3600,
					/obj/item/clothing/head/helmet/technomancersuit = 1400,
					/obj/item/storage/bag/sheetsnatcher/guild = 600,
					/obj/item/tool_upgrade/reinforcement/plasmablock = 950,
					/obj/item/tool_upgrade/reinforcement/rubbermesh = 950,
					/obj/item/tool_upgrade/productivity/booster = 950,
					/obj/item/tool_upgrade/productivity/injector = 950,
					/obj/item/stock_parts/scanning_module = 40,
					/obj/item/stock_parts/micro_laser = 40,
					/obj/item/stock_parts/matter_bin = 40,
					/obj/item/stock_parts/manipulator = 40,
					/obj/item/stock_parts/console_screen = 40)


//FOR ACTORS GUILD - Containers
/obj/machinery/vending/containers
	name = "Storage King"
	desc = "A container that dispenses containers."
	icon_state = "robotics"
	products = list(/obj/structure/closet/crate/freezer = 2,
					/obj/structure/closet = 3,
					/obj/structure/closet/crate = 3)
	auto_price = FALSE
	give_discounts = FALSE
	give_discount_points = FALSE

/obj/machinery/vending/powermat
	name = "Lonestar Power-Mat"
	desc = "Trust is power, and there's no power you can trust like Robustcell."
	product_slogans = "Trust is power, and there's no cell you can trust like Robustcell.;No battery is stronger nor lasts longer.;One that Lasts!;You can't top the copper top!;Tesla doesn't have anything on us!;Don't believe the competitors, Our cells last longer!"
	product_ads = "Robust!;Trustworthy!;Durable!;Robustcell - For your power needs!;Better than the others!;Stronger than the others!"
	icon_state = "powermat"
	products = list(/obj/item/cell/large = 10,
					/obj/item/cell/large/high = 10,
					/obj/item/cell/medium = 15,
					/obj/item/cell/medium/high = 15,
					/obj/item/cell/small = 20,
					/obj/item/cell/small/high = 20,
					/obj/item/pc_part/drive/disk/adv/coin = 60)
	contraband = list(/obj/item/cell/large/super = 5,
						/obj/item/cell/medium/super = 5,
						/obj/item/cell/small/super = 5)
	prices = list(/obj/item/cell/large = 500,
					/obj/item/cell/large/high = 700,
					/obj/item/cell/medium = 300,
					/obj/item/cell/medium/high = 400,
					/obj/item/cell/small = 100,
					/obj/item/cell/small/high = 200,
					/obj/item/pc_part/drive/disk/adv/coin = 60,
					/obj/item/cell/large/super = 900,
					/obj/item/cell/medium/super = 600,
					/obj/item/cell/small/super = 300)

/obj/machinery/vending/printomat
	name = "Lonestar Print-Mat"
	desc = "Everything you can imagine (not really) on a disc! Print your own gun TODAY."
	product_slogans = "Print your own gun TODAY!;The future is NOW!;Can't stop the industrial revolution!;Everything you can imagine, RIGHT HERE!;Don't copy that floppy!;Who needs dreams when you can print everything you need?"
	product_ads = "Almost free!;Print it yourself!;Don't copy that floppy!;Industrial Revolution!;Future!;Print your dreams TODAY!;Cheap and reliable!"
	icon_state = "discomat"
	products = list(/obj/item/pc_part/drive/disk = 20,
					 /obj/item/storage/box/data_disk/basic = 5,
					 /obj/item/pc_part/drive/disk/design/misc = 20,
					 /obj/item/pc_part/drive/disk/design/janitor = 10,
					 /obj/item/pc_part/drive/disk/design/components = 10,
					 /obj/item/pc_part/drive/disk/design/adv_tools = 5,
					 /obj/item/pc_part/drive/disk/design/circuits = 5,
					 /obj/item/pc_part/drive/disk/design/logistics = 2,
					 /obj/item/pc_part/drive/disk/design/medical = 10,
					 /obj/item/pc_part/drive/disk/design/computer = 10,
					 /obj/item/pc_part/drive/disk/design/security = 5,
					 /obj/item/pc_part/drive/disk/design/guns/cheap_guns = 5,
					 /obj/item/pc_part/drive/disk/design/guns/armstrong = 2,
					 /obj/item/pc_part/drive/disk/design/nonlethal_ammo = 10,
					 /obj/item/pc_part/drive/disk/design/strelki = 2,
					 /obj/item/pc_part/drive/disk/design/guns/survivalrifle = 2,
					 /obj/item/pc_part/drive/disk/design/powerwork = 3,
					 /obj/item/pc_part/drive/disk/adv/coin = 300,
					 /obj/item/circuitboard/autolathe = 3,
					 /obj/item/circuitboard/vending = 10,
					 /obj/item/stack/material/plastic/five = 4,
					 /obj/item/stack/material/plastic/ten = 6,
					 /obj/item/stack/material/steel/five = 4,
					 /obj/item/stack/material/steel/ten = 6,
					 /obj/item/stack/material/glass/five = 4,
					 /obj/item/stack/material/glass/ten = 6,
					 /obj/item/stack/material/wood/five = 4,
					 /obj/item/stack/material/wood/ten = 6,
					 /obj/item/stack/material/cardboard/five = 4,
					 /obj/item/stack/material/cardboard/ten = 6
					 )
	contraband = list(/obj/item/pc_part/drive/disk/design/ammo_boxes_smallarms = 3,
						/obj/item/stack/material/iron/five = 4,
						/obj/item/stack/material/iron/ten = 10,
						/obj/item/stack/material/sandstone/five = 4,
						/obj/item/stack/material/sandstone/ten = 10,
						/obj/item/stack/material/marble/five = 4,
						/obj/item/stack/material/marble/ten = 10,
						/obj/item/stack/material/cloth/five = 4,
						/obj/item/stack/material/cloth/ten = 10)
	prices = list(/obj/item/pc_part/drive/disk = 50,
				 /obj/item/storage/box/data_disk/basic = 100,
				 /obj/item/pc_part/drive/disk/design/misc = 200,
				 /obj/item/pc_part/drive/disk/design/janitor = 120,
				 /obj/item/pc_part/drive/disk/design/components = 250,
				 /obj/item/pc_part/drive/disk/design/adv_tools = 900,
				 /obj/item/pc_part/drive/disk/design/circuits = 300,
				 /obj/item/pc_part/drive/disk/design/logistics = 200,
				 /obj/item/pc_part/drive/disk/design/medical = 200,
				 /obj/item/pc_part/drive/disk/design/computer = 250,
				 /obj/item/pc_part/drive/disk/design/security = 300,
				 /obj/item/pc_part/drive/disk/design/guns/cheap_guns = 500,
				 /obj/item/pc_part/drive/disk/design/guns/armstrong = 600,
				 /obj/item/pc_part/drive/disk/design/nonlethal_ammo = 350,
				 /obj/item/pc_part/drive/disk/design/strelki = 850,
				 /obj/item/pc_part/drive/disk/design/guns/survivalrifle = 450,
				 /obj/item/pc_part/drive/disk/adv/coin = 60,
				 /obj/item/pc_part/drive/disk/design/powerwork = 300,
				 /obj/item/circuitboard/autolathe = 350,
				 /obj/item/circuitboard/vending = 200,
				 /obj/item/stack/material/plastic/five = 150,
				 /obj/item/stack/material/plastic/ten = 300,
				 /obj/item/stack/material/steel/five = 150,
				 /obj/item/stack/material/steel/ten = 300,
				 /obj/item/stack/material/glass/five = 150,
				 /obj/item/stack/material/glass/ten = 300,
				 /obj/item/stack/material/wood/five = 150,
				 /obj/item/stack/material/wood/ten = 300,
				 /obj/item/stack/material/cardboard/five = 150,
				 /obj/item/stack/material/cardboard/ten = 300,
				 /obj/item/pc_part/drive/disk/design/ammo_boxes_smallarms = 400,
				 /obj/item/stack/material/iron/five = 150,
				 /obj/item/stack/material/iron/ten = 300,
				 /obj/item/stack/material/sandstone/five = 150,
				 /obj/item/stack/material/sandstone/ten = 300,
				 /obj/item/stack/material/marble/five = 150,
				 /obj/item/stack/material/marble/ten = 300,
				 /obj/item/stack/material/cloth/five = 150,
				 /obj/item/stack/material/cloth/ten = 300)

//This one's from bay12
/obj/machinery/vending/plasmaresearch
	name = "Toximate 3000"
	desc = "All the fine parts you need in one vending machine!"
	shut_up = 1
	products = list(/obj/item/clothing/under/rank/scientist = 6,
					/obj/item/clothing/suit/bio_suit = 6,
					/obj/item/clothing/head/bio_hood = 6,
					/obj/item/clothing/suit/storage/toggle/labcoat/poofy = 6,
					/obj/item/device/transfer_valve = 6,
					/obj/item/device/assembly/timer = 6,
					/obj/item/device/assembly/signaler = 6,
					/obj/item/device/assembly/prox_sensor = 6,
					/obj/item/device/assembly/igniter = 6)
	auto_price = FALSE
	give_discounts = FALSE
	give_discount_points = FALSE

//This one's from bay12
/obj/machinery/vending/robotics
	name = "Robotech Deluxe"
	desc = "All the tools you need to create your own robot army."
	product_slogans = "Build your robot army TODAY!;How about a mech?;You know you need that Durand!;Lost your jumpsuit again?;Let's implant them, we both know they need it."
	icon_state = "robotics"
	icon_deny = "robotics-deny"
	products = list(/obj/item/clothing/suit/storage/toggle/labcoat = 4,
					/obj/item/clothing/under/rank/roboticist = 4,
					/obj/item/stack/cable_coil = 4,
					/obj/item/device/flash = 4,
					/obj/item/cell/large/high = 12,
					/obj/item/device/assembly/prox_sensor = 3,
					/obj/item/device/assembly/signaler = 3,
					/obj/item/device/scanner/health = 3,
					/obj/item/tool/scalpel = 2,
					/obj/item/tool/saw/circular = 2,
					/obj/item/tank/anesthetic = 2,
					/obj/item/clothing/mask/breath/medical = 5,
					/obj/item/tool/screwdriver = 5,
					/obj/item/tool/crowbar = 5,
					/obj/item/weldpack/canister = 2,
					/obj/item/weldpack = 1,
					/obj/item/device/defib_kit/jumper_kit = 5,
					//Drone Fabrication Kits
					/obj/item/storage/box/roomba_kit = 3,
					/obj/item/storage/box/sword_drone_kit = 1,
					/obj/item/storage/box/mantis_drone_kit = 1,
					//Ripley
					/obj/item/device/kit/paint/ripley = 3,
					/obj/item/device/kit/paint/ripley/death = 3,
					/obj/item/device/kit/paint/ripley/flames_red = 3,
					/obj/item/device/kit/paint/ripley/flames_blue = 3,
					/obj/item/device/kit/paint/ripley/syndieripley = 3,
					/obj/item/device/kit/paint/ripley/titan = 3,
					/obj/item/device/kit/paint/ripley/glass = 3,
					/obj/item/device/kit/paint/ripley/ripley_zairjah = 3,
					/obj/item/device/kit/paint/ripley/combatripley = 3,
					/obj/item/device/kit/paint/ripley/flathead = 3,
					/obj/item/device/kit/paint/ripley/orange_box = 3,
					/obj/item/device/kit/paint/ripley/clark = 3,
					/obj/item/device/kit/paint/ripley/clark_orange = 3,
					/obj/item/device/kit/paint/ripley/clark_veteran = 3,
					//Ivan
					/obj/item/device/kit/paint/rust_ivan = 3,
					/obj/item/device/kit/paint/utility_ivan = 3,
					//Ody
					/obj/item/device/kit/paint/odysseus = 3,
					/obj/item/device/kit/paint/odysseus/blue_racer = 3,
					/obj/item/device/kit/paint/odysseus/yellow_racer = 3,
					/obj/item/device/kit/paint/odysseus/murderody = 3,
					/obj/item/device/kit/paint/odysseus/hermes = 3,
					//Durand
					/obj/item/device/kit/paint/durand = 3,
					/obj/item/device/kit/paint/durand/seraph = 3,
					/obj/item/device/kit/paint/durand/gator = 3,
					/obj/item/device/kit/paint/durand/dollhouse = 3,
					//Gygax
					/obj/item/device/kit/paint/gygax/darkgygax = 3,
					/obj/item/device/kit/paint/gygax/darkgygax_old = 3,
					/obj/item/device/kit/paint/gygax/recitence = 3,
					/obj/item/device/kit/paint/gygax/classic = 3,
					/obj/item/device/kit/paint/gygax/pobeda = 3,
					//Phazon
					/obj/item/device/kit/paint/phazon = 3,
					/obj/item/device/kit/paint/phazon/plazmus = 3,
					/obj/item/device/kit/paint/phazon/imperion = 3,
					/obj/item/device/kit/paint/phazon/janus = 3)
	contraband = list(/obj/item/device/kit/paint/durand/phazon = 1,
					/obj/item/device/kit/paint/odysseus/mime = 1,
					/obj/item/device/kit/paint/gygax = 1,
					/obj/item/device/kit/paint/ripley/clark_spider = 1)
	prices = list(	/obj/item/storage/box/roomba_kit = 250,
					/obj/item/storage/box/sword_drone_kit = 750,
					/obj/item/storage/box/mantis_drone_kit = 750)

	auto_price = FALSE
