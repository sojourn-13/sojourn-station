/obj/machinery/vending/signal_electronics
	name = "Common electronics"
	products = list(
		/obj/item/device/assembly/signaler = 60,
		/obj/item/device/assembly/prox_sensor = 25,
		/obj/item/device/assembly/igniter = 25,
		/obj/item/device/assembly/timer = 25,
		/obj/item/device/assembly/infra = 25,
		/obj/item/device/assembly/voice = 25,
		/obj/item/device/transfer_valve = 25,
		/obj/item/device/text_to_speech = 25,
		/obj/item/tool/screwdriver = 6,
		/obj/item/cartridge/signal = 10,
		/obj/item/device/debugger = 5)
	product_ads = "Spark them all!;Everything you need!"
	auto_price = FALSE

/obj/machinery/vending/integrated_electronics_cases
	name = "Integrated electronics cases and tools"
	products = list(
		/obj/item/implant/integrated_circuit = 20,
		/obj/item/device/electronic_assembly = 20,
		/obj/item/device/electronic_assembly/drone = 10,
		/obj/item/device/electronic_assembly/medium = 10,
		/obj/item/device/electronic_assembly/large = 10,
		/obj/item/device/integrated_electronics/wirer = 6,
		/obj/item/device/integrated_electronics/debugger = 6,
		/obj/item/tool/screwdriver = 6,
		/obj/item/tool/crowbar = 6,
		/obj/item/implanter = 6)
	product_ads = "Automation for all your research needs!;Stainless steel!"
	auto_price = FALSE

/obj/machinery/vending/integrated_electronics
	name = "Integrated electronics"
	products = list(
		/obj/item/integrated_circuit/input/button = 40,
		/obj/item/integrated_circuit/input/toggle_button = 40,
		/obj/item/integrated_circuit/input/numberpad = 40,
		/obj/item/integrated_circuit/input/textpad = 40,
		/obj/item/integrated_circuit/input/med_scanner = 40,
		/obj/item/integrated_circuit/input/adv_med_scanner = 40,
		/obj/item/integrated_circuit/input/local_locator = 40,
		/obj/item/integrated_circuit/input/adjacent_locator = 40,
		/obj/item/integrated_circuit/input/signaler = 40,
		/obj/item/integrated_circuit/input/EPv2 = 40,
		/obj/item/integrated_circuit/input/gps = 40,
		/obj/item/integrated_circuit/input/microphone = 40,
		/obj/item/integrated_circuit/input/sensor = 40,

		/obj/item/integrated_circuit/output/screen/medium = 40,
		/obj/item/integrated_circuit/output/screen/large = 40,
		/obj/item/integrated_circuit/output/screen = 40,
		/obj/item/integrated_circuit/output/light/advanced = 40,
		/obj/item/integrated_circuit/output/light = 40,
		/obj/item/integrated_circuit/output/sound/beeper = 40,
		/obj/item/integrated_circuit/output/sound/beepsky = 40,
		/obj/item/integrated_circuit/output/text_to_speech = 40,
		/obj/item/integrated_circuit/output/video_camera = 40,
		/obj/item/integrated_circuit/output/led = 40,
		/obj/item/integrated_circuit/output/led/red = 40,
		/obj/item/integrated_circuit/output/led/orange = 40,
		/obj/item/integrated_circuit/output/led/yellow = 40,
		/obj/item/integrated_circuit/output/led/green = 40,
		/obj/item/integrated_circuit/output/led/blue = 40,
		/obj/item/integrated_circuit/output/led/purple = 40,
		/obj/item/integrated_circuit/output/led/cyan = 40,
		/obj/item/integrated_circuit/output/led/white = 40,
		/obj/item/integrated_circuit/output/led/pink = 40,

		/obj/item/integrated_circuit/manipulation/weapon_firing = 10,
		/obj/item/integrated_circuit/manipulation/locomotion = 10,
		/obj/item/integrated_circuit/reagent/smoke = 40,
		/obj/item/integrated_circuit/reagent/injector = 40,
		/obj/item/integrated_circuit/reagent/pump = 40,
		/obj/item/integrated_circuit/reagent/storage/cryo = 40,
		/obj/item/integrated_circuit/reagent/storage = 40,

		/obj/item/integrated_circuit/passive/power/solar_cell = 40,
		/obj/item/integrated_circuit/passive/power/metabolic_siphon/synthetic = 40,
		/obj/item/integrated_circuit/passive/power/metabolic_siphon = 40,
		/obj/item/integrated_circuit/passive/power/relay/large = 40,
		/obj/item/integrated_circuit/passive/power/relay = 40,
		/obj/item/integrated_circuit/power/transmitter/large = 40,
		/obj/item/integrated_circuit/power/transmitter = 40,

		/obj/item/integrated_circuit/logic/binary/equals = 40,
		/obj/item/integrated_circuit/logic/binary/not_equals = 40,
		/obj/item/integrated_circuit/logic/binary/and = 40,
		/obj/item/integrated_circuit/logic/binary/or = 40,
		/obj/item/integrated_circuit/logic/binary/less_than = 40,
		/obj/item/integrated_circuit/logic/binary/less_than_or_equal = 40,
		/obj/item/integrated_circuit/logic/binary/greater_than = 40,
		/obj/item/integrated_circuit/logic/binary/greater_than_or_equal = 40,
		/obj/item/integrated_circuit/logic/unary/not = 40,

		/obj/item/integrated_circuit/time/ticker = 40,
		/obj/item/integrated_circuit/time/ticker/slow = 40,
		/obj/item/integrated_circuit/time/ticker/fast = 40,
		/obj/item/integrated_circuit/time/clock = 40,
		/obj/item/integrated_circuit/time/delay/tenth_sec = 40,
		/obj/item/integrated_circuit/time/delay/half_sec = 40,
		/obj/item/integrated_circuit/time/delay/one_sec = 40,
		/obj/item/integrated_circuit/time/delay = 40,
		/obj/item/integrated_circuit/time/delay/five_sec = 40,
		/obj/item/integrated_circuit/time/delay/custom = 40,

		/obj/item/integrated_circuit/arithmetic/addition = 40,
		/obj/item/integrated_circuit/arithmetic/subtraction = 40,
		/obj/item/integrated_circuit/arithmetic/multiplication = 40,
		/obj/item/integrated_circuit/arithmetic/division = 40,
		/obj/item/integrated_circuit/arithmetic/exponent = 40,
		/obj/item/integrated_circuit/arithmetic/sign = 40,
		/obj/item/integrated_circuit/arithmetic/round = 40,
		/obj/item/integrated_circuit/arithmetic/absolute = 40,
		/obj/item/integrated_circuit/arithmetic/average = 40,
		/obj/item/integrated_circuit/arithmetic/pi = 40,
		/obj/item/integrated_circuit/arithmetic/random = 40,
		/obj/item/integrated_circuit/arithmetic/square_root = 40,
		/obj/item/integrated_circuit/arithmetic/modulo = 40,

		/obj/item/integrated_circuit/trig/sine = 40,
		/obj/item/integrated_circuit/trig/cosine = 40,
		/obj/item/integrated_circuit/trig/tangent = 40,
		/obj/item/integrated_circuit/trig/cotangent = 40,
		/obj/item/integrated_circuit/trig/cosecant = 40,
		/obj/item/integrated_circuit/trig/secant = 40,

		/obj/item/integrated_circuit/smart/basic_pathfinder = 10,

		/obj/item/integrated_circuit/memory = 40,
		/obj/item/integrated_circuit/memory/medium = 40,
		/obj/item/integrated_circuit/memory/large = 40,
		/obj/item/integrated_circuit/memory/huge = 40,
		/obj/item/integrated_circuit/memory/constant = 40,

		/obj/item/integrated_circuit/transfer/multiplexer/medium = 40,
		/obj/item/integrated_circuit/transfer/multiplexer/large = 40,
		/obj/item/integrated_circuit/transfer/multiplexer/huge = 40,
		/obj/item/integrated_circuit/transfer/multiplexer = 40,
		/obj/item/integrated_circuit/transfer/demultiplexer/medium = 40,
		/obj/item/integrated_circuit/transfer/demultiplexer/large = 40,
		/obj/item/integrated_circuit/transfer/demultiplexer/huge = 40,
		/obj/item/integrated_circuit/transfer/splitter/medium = 40,
		/obj/item/integrated_circuit/transfer/splitter/large = 40,
		/obj/item/integrated_circuit/transfer/splitter = 40,
		/obj/item/integrated_circuit/transfer/activator_splitter/medium = 40,
		/obj/item/integrated_circuit/transfer/activator_splitter/large = 40,
		/obj/item/integrated_circuit/transfer/activator_splitter = 40,
		/obj/item/integrated_circuit/converter/num2text = 40,
		/obj/item/integrated_circuit/converter/text2num = 40,
		/obj/item/integrated_circuit/converter/ref2text = 40,
		/obj/item/integrated_circuit/converter/lowercase = 40,
		/obj/item/integrated_circuit/converter/uppercase = 40,
		/obj/item/integrated_circuit/converter/concatenatior = 40,
		/obj/item/integrated_circuit/converter/radians2degrees = 40,
		/obj/item/integrated_circuit/converter/degrees2radians = 40,
		/obj/item/integrated_circuit/converter/abs_to_rel_coords = 40)
	product_ads = "Automation for people!;Hack them all!"
	auto_price = FALSE

//This one's from bay12
/obj/machinery/vending/cart
	name = "PTech"
	desc = "PDAs and hardware."
	product_slogans = "PDAs for everyone!;You get a PDA! And you get a PDA!;You lost it again?;"
	icon_state = "cart"
	icon_deny = "cart-deny"
	products = list(/obj/item/modular_computer/pda = 10,
					/obj/item/computer_hardware/scanner/medical = 6,
					/obj/item/computer_hardware/scanner/reagent = 6,
					/obj/item/computer_hardware/scanner/atmos = 6,
					/obj/item/computer_hardware/scanner/paper = 10,
					/obj/item/computer_hardware/printer = 10,
					/obj/item/computer_hardware/card_slot = 3,
					/obj/item/computer_hardware/ai_slot = 4)
	auto_price = FALSE

/obj/machinery/vending/cigarette
	name = "Smooth Cigarettes" //OCD had to be uppercase to look nice with the new formating
	desc = "If you want to get cancer, might as well do it in style!"
	product_slogans = "Brand name cigarettes taste good like a cigarette should.;Don't believe the reports - smoke today!;Almost no negative side effects;Addiction? Better get it in style!;A brand for every man!;Don't stop smoking now, You'll get fat!"
	product_ads = "Probably not bad for you!;Don't believe the scientists!;It's good for you!;Don't quit, buy more!;Smoke!;Nicotine heaven.;Best cigarettes since 2150.;Award-winning cigs.;Cigars avalible for premium customers.;Best taste in space!"
	vend_delay = 34
	icon_state = "cigs"
	products = list(/obj/item/storage/fancy/cigarettes = 7,
				/obj/item/storage/fancy/cigarettes/lonestar = 7,
				/obj/item/storage/fancy/cigarettes/ishimura = 7,
				/obj/item/storage/fancy/cigarettes/tannhauser = 7,
				/obj/item/storage/fancy/cigarettes/brouzouf = 7,
				/obj/item/storage/fancy/cigarettes/frozen = 7,
				/obj/item/storage/fancy/cigarettes/shodan = 7,
				/obj/item/storage/fancy/cigarettes/toha = 7,
				/obj/item/storage/fancy/cigarettes/fortress = 7,
				/obj/item/storage/fancy/cigarettes/fortressred = 7,
				/obj/item/storage/fancy/cigarettes/fortressblue = 7,
				/obj/item/storage/fancy/cigar = 2,
				/obj/item/clothing/mask/vape = 5,
				/obj/item/clothing/mask/smokable/pipe = 2,
				/obj/item/clothing/mask/smokable/pipe/cobpipe = 2,
				/obj/item/clothing/mask/smokable/pipe/glass = 2,
				/obj/item/reagent_containers/glass/beaker/vial/vape/berry = 10,
				/obj/item/reagent_containers/glass/beaker/vial/vape/banana = 10,
				/obj/item/reagent_containers/glass/beaker/vial/vape/lemon = 10,
				/obj/item/reagent_containers/glass/beaker/vial/vape/nicotine = 5,
				/obj/item/storage/box/matches = 10,
				/obj/item/flame/lighter/random = 4,
				/obj/item/flame/lighter/zippo = 4,
				/obj/item/flame/lighter/zippo/blue = 4,
				/obj/item/flame/lighter/zippo/red = 4,
				/obj/item/flame/lighter/zippo/gold = 4,
				/obj/item/flame/lighter/zippo/rainbow = 4,
				/obj/item/flame/lighter/zippo/engraved = 4,
				/obj/item/flame/lighter/zippo/black = 4,
				/obj/item/flame/lighter/zippo/moff = 4,
				/obj/item/flame/lighter/zippo/ironic = 4,
				/obj/item/flame/lighter/zippo/capitalist = 4,
				/obj/item/flame/lighter/zippo/royal = 4,
				/obj/item/flame/lighter/zippo/gonzo = 4,
				/obj/item/flame/lighter/zippo/bullet = 4,
				/obj/item/flame/lighter/zippo/absolutism = 4)
	contraband = list(/obj/item/flame/lighter/zippo/communist = 2,
				/obj/item/flame/lighter/zippo/excelsior = 4,
				/obj/item/flame/lighter/zippo/soyfed = 2,
				/obj/item/storage/fancy/cigarettes/khi = 2,
				/obj/item/storage/fancy/cigarettes/comred = 1)
	prices = list(/obj/item/storage/fancy/cigarettes = 40,
				/obj/item/storage/fancy/cigarettes/lonestar = 35,
				/obj/item/storage/fancy/cigarettes/ishimura = 70,
				/obj/item/storage/fancy/cigarettes/tannhauser = 45,
				/obj/item/storage/fancy/cigarettes/brouzouf = 55,
				/obj/item/storage/fancy/cigarettes/frozen = 70,
				/obj/item/storage/fancy/cigarettes/shodan = 75,
				/obj/item/storage/fancy/cigarettes/toha = 100,
				/obj/item/storage/fancy/cigarettes/fortress = 50,
				/obj/item/storage/fancy/cigarettes/fortressred = 50,
				/obj/item/storage/fancy/cigarettes/fortressblue = 50,
				/obj/item/reagent_containers/glass/beaker/vial/vape/berry = 25,
				/obj/item/reagent_containers/glass/beaker/vial/vape/banana = 25,
				/obj/item/reagent_containers/glass/beaker/vial/vape/lemon = 25,
				/obj/item/reagent_containers/glass/beaker/vial/vape/nicotine = 25,
				/obj/item/storage/box/matches = 10,
				/obj/item/flame/lighter/random = 25,
				/obj/item/flame/lighter/zippo = 50,
				/obj/item/flame/lighter/zippo/blue = 50,
				/obj/item/flame/lighter/zippo/red = 50,
				/obj/item/flame/lighter/zippo/gold = 50,
				/obj/item/flame/lighter/zippo/rainbow = 50,
				/obj/item/flame/lighter/zippo/engraved = 50,
				/obj/item/flame/lighter/zippo/black = 50,
				/obj/item/flame/lighter/zippo/moff = 50,
				/obj/item/flame/lighter/zippo/ironic = 50,
				/obj/item/flame/lighter/zippo/capitalist = 500, // Item description, meant to be expensive
				/obj/item/flame/lighter/zippo/royal = 50,
				/obj/item/flame/lighter/zippo/gonzo = 50,
				/obj/item/flame/lighter/zippo/bullet = 50,
				/obj/item/flame/lighter/zippo/communist = 250, // Idiot tax, but still affordable
				/obj/item/storage/fancy/cigar = 250,
				/obj/item/clothing/mask/vape = 150,
				/obj/item/clothing/mask/smokable/pipe = 75,
				/obj/item/clothing/mask/smokable/pipe/cobpipe = 25,
				/obj/item/clothing/mask/smokable/pipe/glass = 150,
				/obj/item/storage/fancy/cigarettes/khi = 500,
				/obj/item/storage/fancy/cigarettes/comred = 525,
				/obj/item/flame/lighter/zippo/excelsior = 0, // For the people!
				/obj/item/flame/lighter/zippo/soyfed = 250,
				)


//FOR ACTORS GUILD - mainly props that cannot be spawned otherwise
/obj/machinery/vending/props
	name = "Portable Stage"
	desc = "All the costumes a performer could need. Probably."
	product_slogans = "Be witty!;Make them smile!;Honk!;Dress to impress!"
	product_ads = "All animal costumes made out of real fur!;Now featuring our new history selection!;Want to cause a fright? Try our halloween selection!;Non-set costume pieces found in our surplus kits!"
	icon_state = "Theater"
	products = list(/obj/item/storage/box/costume/bandit = 2,
					/obj/item/storage/box/costume/bunny = 2,
					/obj/item/storage/box/costume/cardborg = 2,
					/obj/item/storage/box/costume/carp = 2,
					/obj/item/storage/box/costume/chicken = 2,
					/obj/item/storage/box/costume/clownblue = 2,
					/obj/item/storage/box/costume/clowngreen = 2,
					/obj/item/storage/box/costume/clownorange = 2,
					/obj/item/storage/box/costume/clownpurple = 2,
					/obj/item/storage/box/costume/clownred = 2,
					/obj/item/storage/box/costume/clownyellow = 2,
					/obj/item/storage/box/costume/cowboy = 2,
					/obj/item/storage/box/costume/deathofficer = 2,
					/obj/item/storage/box/costume/flash = 2,
					/obj/item/storage/box/costume/gladiator = 2,
					/obj/item/storage/box/costume/griffin = 2,
					/obj/item/storage/box/costume/gnome =2,
					/obj/item/storage/box/costume/ian = 2,
					/obj/item/storage/box/costume/imperiummonk = 2,
					/obj/item/storage/box/costume/jester = 2,
					/obj/item/storage/box/costume/judge = 2,
					/obj/item/storage/box/costume/lobster = 2,
					/obj/item/storage/box/costume/madscientist = 2,
					/obj/item/storage/box/costume/mailman = 2,
					/obj/item/storage/box/costume/monkey = 2,
					/obj/item/storage/box/costume/mime = 2,
					/obj/item/storage/box/costume/mummy = 2,
					/obj/item/storage/box/costume/napoleonic = 2,
					/obj/item/storage/box/costume/nekomaid = 2,
					/obj/item/storage/box/costume/nurse = 2,
					/obj/item/storage/box/costume/nun = 2,
					/obj/item/storage/box/costume/police = 2,
					/obj/item/storage/box/costume/pirate = 2,
					/obj/item/storage/box/costume/plaguedoctor = 2,
					/obj/item/storage/box/costume/owl = 2,
					/obj/item/storage/box/costume/santa = 2,
					/obj/item/storage/box/costume/scarecrow = 2,
					/obj/item/storage/box/costume/skeleton = 2,
					/obj/item/storage/box/costume/snowman = 2,
					/obj/item/storage/box/costume/soviet = 2,
					/obj/item/storage/box/costume/syndicate = 2,
					/obj/item/storage/box/costume/techpriest = 2,
					/obj/item/storage/box/costume/techpriest_explorator = 2,
					/obj/item/storage/box/costume/xeno = 2,
					/obj/item/storage/box/costume/surplusanimal = 2,
					/obj/item/storage/box/costume/surplusgeneric = 2,
					/obj/item/storage/box/costume/surplushalloween = 2,
					/obj/item/storage/box/costume/bonusjustice = 2,
					/obj/item/storage/box/costume/bonuswrestling = 2,
					/obj/item/clothing/mask/gas/dal = 1,
					/obj/item/clothing/mask/gas/wolf = 1,
					/obj/item/clothing/mask/gas/hox = 1,
					/obj/item/clothing/mask/gas/cha = 1)
	prices = list(/obj/item/storage/box/costume/bandit = 100,
					/obj/item/storage/box/costume/bunny = 100,
					/obj/item/storage/box/costume/cardborg = 100,
					/obj/item/storage/box/costume/carp = 100,
					/obj/item/storage/box/costume/chicken = 100,
					/obj/item/storage/box/costume/clownblue = 100,
					/obj/item/storage/box/costume/clowngreen = 100,
					/obj/item/storage/box/costume/clownorange = 100,
					/obj/item/storage/box/costume/clownpurple = 100,
					/obj/item/storage/box/costume/clownred = 100,
					/obj/item/storage/box/costume/clownyellow = 100,
					/obj/item/storage/box/costume/cowboy = 100,
					/obj/item/storage/box/costume/deathofficer = 100,
					/obj/item/storage/box/costume/flash = 100,
					/obj/item/storage/box/costume/gladiator = 100,
					/obj/item/storage/box/costume/gnome = 100,
					/obj/item/storage/box/costume/griffin = 100,
					/obj/item/storage/box/costume/ian = 100,
					/obj/item/storage/box/costume/imperiummonk = 200,
					/obj/item/storage/box/costume/jester = 100,
					/obj/item/storage/box/costume/judge = 100,
					/obj/item/storage/box/costume/lobster = 100,
					/obj/item/storage/box/costume/madscientist = 100,
					/obj/item/storage/box/costume/mailman = 100,
					/obj/item/storage/box/costume/monkey = 100,
					/obj/item/storage/box/costume/mime = 100,
					/obj/item/storage/box/costume/mummy = 100,
					/obj/item/storage/box/costume/napoleonic = 100,
					/obj/item/storage/box/costume/nekomaid = 100,
					/obj/item/storage/box/costume/nurse = 100,
					/obj/item/storage/box/costume/nun = 100,
					/obj/item/storage/box/costume/police = 100,
					/obj/item/storage/box/costume/pirate = 100,
					/obj/item/storage/box/costume/plaguedoctor = 100,
					/obj/item/storage/box/costume/owl = 100,
					/obj/item/storage/box/costume/santa = 100,
					/obj/item/storage/box/costume/scarecrow = 100,
					/obj/item/storage/box/costume/skeleton = 100,
					/obj/item/storage/box/costume/snowman = 100,
					/obj/item/storage/box/costume/soviet = 100,
					/obj/item/storage/box/costume/syndicate = 100,
					/obj/item/storage/box/costume/techpriest = 100,
					/obj/item/storage/box/costume/techpriest_explorator = 150,
					/obj/item/storage/box/costume/xeno = 100,
					/obj/item/storage/box/costume/surplusanimal = 200,
					/obj/item/storage/box/costume/surplusgeneric = 200,
					/obj/item/storage/box/costume/surplushalloween = 200,
					/obj/item/storage/box/costume/bonusjustice = 200,
					/obj/item/storage/box/costume/bonuswrestling = 200,
					/obj/item/clothing/mask/gas/dal = 50,
					/obj/item/clothing/mask/gas/wolf = 50,
					/obj/item/clothing/mask/gas/hox = 50,
					/obj/item/clothing/mask/gas/cha = 50)

/obj/machinery/vending/style
	name = "Style vendor"
	desc = "Vendor selling probably salvaged stylish clothing."
	product_slogans = "Highly stylish clothing for sale!;Latest fashion trends right here!"
	product_ads = "Contact our consumer department for refunds, fees apply.;Coolness sold here.;Fashion over function!"
	icon_state = "style"
	products = list(
		//Glasses
		/obj/item/clothing/glasses/binoclard_lenses = 5,
		//Gloves
		/obj/item/clothing/gloves/knuckles = 3,
		/obj/item/clothing/gloves/evening = 3,
		/obj/item/clothing/gloves/ash_evening = 3,
		/obj/item/clothing/gloves/aerostatic_gloves = 3,
		/obj/item/clothing/gloves/latex = 3,
		//Head stuff
		/obj/item/clothing/head/ranger = 4,
		/obj/item/clothing/head/inhaler = 2,
		/obj/item/clothing/head/ushanka = 3,
		/obj/item/clothing/head/hairflower = 3,
		/obj/item/clothing/head/hairflower/blue = 3,
		/obj/item/clothing/head/hairflower/pink = 3,
		/obj/item/clothing/head/hairflower/yellow = 3,
		/obj/item/clothing/head/hairflower/violet = 3,
		/obj/item/clothing/head/hairflower/orange = 3,
		/obj/item/clothing/head/hairflower/white = 3,
		/obj/item/clothing/head/tophat = 4,
		/obj/item/clothing/head/tophat/purple = 4,
		/obj/item/clothing/head/tophat/beaverhat = 2,
		/obj/item/clothing/head/bowler/bowlerclassic = 4,
		/obj/item/clothing/head/bowler/bowlerbasil = 4,
		/obj/item/clothing/head/bowler = 4,
		/obj/item/clothing/head/cowboy = 4,
		/obj/item/clothing/head/cowboy/desperado = 4,
		/obj/item/clothing/head/cowboy/journeyman = 4,
		/obj/item/clothing/head/cowboy/marshal = 4,
		/obj/item/clothing/head/cowboy/shootist = 4,
		/obj/item/clothing/head/cowboy/wrangler = 4,
		/obj/item/clothing/head/cowboy/bandit = 4,
		/obj/item/clothing/head/cowboy/longhorn = 4,
		/obj/item/clothing/head/cowboy/greenhorn = 4,
		/obj/item/clothing/head/cowboy/frontiersman = 4,
		/obj/item/clothing/head/fedora = 5,
		/obj/item/clothing/head/fedora/brown = 5,
		/obj/item/clothing/head/fedora/grey = 5,
		/obj/item/clothing/head/fedora/feathered = 2,
		/obj/item/clothing/head/fez = 3,
		//Boots
		/obj/item/clothing/shoes/jackboots/redboot = 4,
		/obj/item/clothing/shoes/jackboots/longboot = 3,
		/obj/item/clothing/shoes/jackboots/german = 4,
		/obj/item/clothing/shoes/jackboots/laced_jackboots = 4,
		/obj/item/clothing/shoes/leather = 3,
		/obj/item/clothing/shoes/laceup = 3,
		/obj/item/clothing/shoes/laceup/white = 3,
		/obj/item/clothing/shoes/aerostatic_boots = 3,
		/obj/item/clothing/shoes/render = 2,
		/obj/item/clothing/shoes/track_shoes = 5,
		/obj/item/clothing/shoes/highheels = 5,
		/obj/item/clothing/shoes/highheels/red = 5,
		/obj/item/clothing/shoes/highheels/black = 5,
		/obj/item/clothing/shoes/highheels/purple = 5,
		/obj/item/clothing/shoes/highheels/blue = 5,
		/obj/item/clothing/shoes/flats = 5,
		/obj/item/clothing/shoes/flats/white = 5,
		/obj/item/clothing/shoes/flats/red = 5,
		/obj/item/clothing/shoes/flats/purple = 5,
		/obj/item/clothing/shoes/flats/blue = 5,
		/obj/item/clothing/shoes/flats/brown = 5,
		/obj/item/clothing/shoes/flats/orange = 5,
		/obj/item/clothing/shoes/hitops = 5,
		/obj/item/clothing/shoes/hitops/red = 5,
		/obj/item/clothing/shoes/hitops/brown = 5,
		/obj/item/clothing/shoes/hitops/black = 5,
		/obj/item/clothing/shoes/hitops/orange = 5,
		/obj/item/clothing/shoes/hitops/blue = 5,
		/obj/item/clothing/shoes/hitops/green = 5,
		/obj/item/clothing/shoes/hitops/purple = 5,
		/obj/item/clothing/shoes/hitops/yellow = 5,
		/obj/item/clothing/shoes/customhitops = 5,
		/obj/item/clothing/shoes/cowboy = 5,
		/obj/item/clothing/shoes/cowboy/classic = 5,
		/obj/item/clothing/shoes/cowboy/snakeskin = 5,
		//Under Clothing
		/obj/item/clothing/under/suit_jacket/black = 4,
		/obj/item/clothing/under/suit_jacket/blackskirt = 4,
		/obj/item/clothing/under/suit_jacket/blazer = 4,
		/obj/item/clothing/under/suit_jacket/blazerskirt = 4,
		/obj/item/clothing/under/suit_jacket/bluebusiness = 4,
		/obj/item/clothing/under/suit_jacket/bluebusinessskirt = 4,
		/obj/item/clothing/under/suit_jacket/brown = 4,
		/obj/item/clothing/under/suit_jacket/brownskirt = 4,
		/obj/item/clothing/under/suit_jacket/chestnut = 4,
		/obj/item/clothing/under/suit_jacket/chestnutskirt = 4,
		/obj/item/clothing/under/suit_jacket/cinnabar = 4,
		/obj/item/clothing/under/suit_jacket/cinnabarskirt = 4,
		/obj/item/clothing/under/suit_jacket/classic = 4,
		/obj/item/clothing/under/suit_jacket/classicskirt = 4,
		/obj/item/clothing/under/suit_jacket/crimson = 4,
		/obj/item/clothing/under/suit_jacket/executivedress = 4,
		/obj/item/clothing/under/suit_jacket/executivedressskirt = 4,
		/obj/item/clothing/under/suit_jacket/executive = 4,
		/obj/item/clothing/under/suit_jacket/executiveskirt = 4,
		/obj/item/clothing/under/suit_jacket/formal = 4,
		/obj/item/clothing/under/suit_jacket/green = 4,
		/obj/item/clothing/under/suit_jacket/greenskirt = 4,
		/obj/item/clothing/under/suit_jacket/pink = 4,
		/obj/item/clothing/under/suit_jacket/pinkskirt = 4,
		/obj/item/clothing/under/suit_jacket/red = 4,
		/obj/item/clothing/under/suit_jacket/redskirt = 4,
		/obj/item/clothing/under/suit_jacket/redbusiness = 4,
		/obj/item/clothing/under/suit_jacket/redbusinessskirt = 4,
		/obj/item/clothing/under/suit_jacket/silver = 4,
		/obj/item/clothing/under/suit_jacket/smoky = 4,
		/obj/item/clothing/under/suit_jacket/teal = 4,
		/obj/item/clothing/under/suit_jacket/tealskirt = 4,
		/obj/item/clothing/under/suit_jacket/white = 4,
		/obj/item/clothing/under/suit_jacket = 4,
		/obj/item/clothing/under/modular/black = 4,
		/obj/item/clothing/under/modular/blackskirt = 4,
		/obj/item/clothing/under/modular/blue = 4,
		/obj/item/clothing/under/modular/blueskirt = 4,
		/obj/item/clothing/under/modular/burgundy = 4,
		/obj/item/clothing/under/modular/burgundyskirt = 4,
		/obj/item/clothing/under/modular/charcoal = 4,
		/obj/item/clothing/under/modular/charcoalskirt = 4,
		/obj/item/clothing/under/modular/checkered = 4,
		/obj/item/clothing/under/modular/checkeredskirt = 4,
		/obj/item/clothing/under/modular/green = 4,
		/obj/item/clothing/under/modular/greenskirt = 4,
		/obj/item/clothing/under/modular/navy = 4,
		/obj/item/clothing/under/modular/navyskirt = 4,
		/obj/item/clothing/under/modular/purple = 4,
		/obj/item/clothing/under/modular/purpleskirt = 4,
		/obj/item/clothing/under/modular/smoky = 4,
		/obj/item/clothing/under/modular/smokyskirt = 4,
		/obj/item/clothing/under/modular/tan = 4,
		/obj/item/clothing/under/modular = 4,
		/obj/item/clothing/under/white = 4,
		/obj/item/clothing/under/red = 4,
		/obj/item/clothing/under/green = 4,
		/obj/item/clothing/under/grey = 4,
		/obj/item/clothing/under/black = 4,
		/obj/item/clothing/under/dress/black = 4,
		/obj/item/clothing/under/dress/white = 4,
		/obj/item/clothing/under/helltaker = 4,
		/obj/item/clothing/under/johnny = 3,
		/obj/item/clothing/under/raider = 3,
		/obj/item/clothing/under/dress = 5,
		/obj/item/clothing/under/dress/blue = 5,
		/obj/item/clothing/under/dress/red = 5,
		/obj/item/clothing/under/dismas = 5,
		/obj/item/clothing/under/top/dimmadome = 5,
		/obj/item/clothing/under/leisure = 5,
		/obj/item/clothing/under/leisure/white = 5,
		/obj/item/clothing/under/leisure/pullover = 5,
		/obj/item/clothing/under/jamrock_suit = 5,
		/obj/item/clothing/under/aerostatic_suit = 5,
		/obj/item/clothing/under/track_suit = 5,
		/obj/item/clothing/under/neon = 5,
		/obj/item/clothing/under/neon/yellow = 5,
		/obj/item/clothing/under/neon/blue = 5,
		/obj/item/clothing/under/neon/red = 5,
		//Over Clothing
		/obj/item/clothing/suit/storage/toggle/labcoat/poofy = 5,
		/obj/item/clothing/suit/storage/texan = 2,
		/obj/item/clothing/suit/storage/triad = 2,
		/obj/item/clothing/suit/storage/akira = 2,
		/obj/item/clothing/suit/storage/aerostatic_bomber_jacket = 3,
		/obj/item/clothing/suit/storage/jamrock_blazer = 3

					)
	prices = list(
		//Glasses
		/obj/item/clothing/glasses/binoclard_lenses = 50,
		//Gloves
		/obj/item/clothing/gloves/knuckles = 65,
		/obj/item/clothing/gloves/evening = 70,
		/obj/item/clothing/gloves/ash_evening = 70,
		/obj/item/clothing/gloves/aerostatic_gloves = 50,
		/obj/item/clothing/gloves/latex = 30,
		//Head stuff
		/obj/item/clothing/head/ranger = 55,
		/obj/item/clothing/head/inhaler = 75,
		/obj/item/clothing/head/ushanka = 20,
		/obj/item/clothing/head/hairflower = 13,
		/obj/item/clothing/head/hairflower/blue = 13,
		/obj/item/clothing/head/hairflower/pink = 13,
		/obj/item/clothing/head/hairflower/yellow = 13,
		/obj/item/clothing/head/hairflower/violet = 13,
		/obj/item/clothing/head/hairflower/orange = 13,
		/obj/item/clothing/head/hairflower/white = 13,
		/obj/item/clothing/head/tophat = 75,
		/obj/item/clothing/head/tophat/purple = 75,
		/obj/item/clothing/head/tophat/beaverhat = 35,
		/obj/item/clothing/head/bowler/bowlerclassic = 75,
		/obj/item/clothing/head/bowler/bowlerbasil = 75,
		/obj/item/clothing/head/bowler = 75,
		/obj/item/clothing/head/cowboy = 45,
		/obj/item/clothing/head/cowboy/desperado = 45,
		/obj/item/clothing/head/cowboy/journeyman = 45,
		/obj/item/clothing/head/cowboy/marshal = 45,
		/obj/item/clothing/head/cowboy/shootist = 45,
		/obj/item/clothing/head/cowboy/wrangler = 45,
		/obj/item/clothing/head/cowboy/bandit = 45,
		/obj/item/clothing/head/cowboy/longhorn = 45,
		/obj/item/clothing/head/cowboy/greenhorn = 45,
		/obj/item/clothing/head/cowboy/frontiersman = 45,
		/obj/item/clothing/head/fedora = 55,
		/obj/item/clothing/head/fedora/brown = 55,
		/obj/item/clothing/head/fedora/grey = 55,
		/obj/item/clothing/head/fedora/feathered = 110,
		/obj/item/clothing/head/fez = 30,
		//Boots
		/obj/item/clothing/shoes/jackboots/redboot = 45,
		/obj/item/clothing/shoes/jackboots/longboot = 55,
		/obj/item/clothing/shoes/jackboots/german = 45,
		/obj/item/clothing/shoes/jackboots/laced_jackboots = 45,
		/obj/item/clothing/shoes/leather = 40,
		/obj/item/clothing/shoes/laceup = 50,
		/obj/item/clothing/shoes/laceup/white = 50,
		/obj/item/clothing/shoes/aerostatic_boots = 60,
		/obj/item/clothing/shoes/render = 120,
		/obj/item/clothing/shoes/track_shoes = 30,
		/obj/item/clothing/shoes/highheels = 25,
		/obj/item/clothing/shoes/highheels/red = 25,
		/obj/item/clothing/shoes/highheels/black = 25,
		/obj/item/clothing/shoes/highheels/purple = 25,
		/obj/item/clothing/shoes/highheels/blue = 25,
		/obj/item/clothing/shoes/flats = 25,
		/obj/item/clothing/shoes/flats/white = 25,
		/obj/item/clothing/shoes/flats/red = 25,
		/obj/item/clothing/shoes/flats/purple = 25,
		/obj/item/clothing/shoes/flats/blue = 25,
		/obj/item/clothing/shoes/flats/brown = 25,
		/obj/item/clothing/shoes/flats/orange = 25,
		/obj/item/clothing/shoes/hitops = 25,
		/obj/item/clothing/shoes/hitops/red = 25,
		/obj/item/clothing/shoes/hitops/brown = 25,
		/obj/item/clothing/shoes/hitops/black = 25,
		/obj/item/clothing/shoes/hitops/orange = 25,
		/obj/item/clothing/shoes/hitops/blue = 25,
		/obj/item/clothing/shoes/hitops/green = 25,
		/obj/item/clothing/shoes/hitops/purple = 25,
		/obj/item/clothing/shoes/hitops/yellow = 25,
		/obj/item/clothing/shoes/customhitops = 25,
		/obj/item/clothing/shoes/cowboy = 25,
		/obj/item/clothing/shoes/cowboy/classic = 25,
		/obj/item/clothing/shoes/cowboy/snakeskin = 25,
		//Under Clothing
		/obj/item/clothing/under/suit_jacket/black = 45,
		/obj/item/clothing/under/suit_jacket/blackskirt = 45,
		/obj/item/clothing/under/suit_jacket/blazer = 45,
		/obj/item/clothing/under/suit_jacket/blazerskirt = 45,
		/obj/item/clothing/under/suit_jacket/bluebusiness = 45,
		/obj/item/clothing/under/suit_jacket/bluebusinessskirt = 45,
		/obj/item/clothing/under/suit_jacket/brown = 45,
		/obj/item/clothing/under/suit_jacket/brownskirt = 45,
		/obj/item/clothing/under/suit_jacket/chestnut = 55,
		/obj/item/clothing/under/suit_jacket/chestnutskirt = 55,
		/obj/item/clothing/under/suit_jacket/cinnabar = 55,
		/obj/item/clothing/under/suit_jacket/cinnabarskirt = 55,
		/obj/item/clothing/under/suit_jacket/classic = 55,
		/obj/item/clothing/under/suit_jacket/classicskirt = 55,
		/obj/item/clothing/under/suit_jacket/crimson = 55,
		/obj/item/clothing/under/suit_jacket/executivedress = 45,
		/obj/item/clothing/under/suit_jacket/executivedressskirt = 45,
		/obj/item/clothing/under/suit_jacket/executive = 45,
		/obj/item/clothing/under/suit_jacket/executiveskirt = 45,
		/obj/item/clothing/under/suit_jacket/formal = 45,
		/obj/item/clothing/under/suit_jacket/green = 45,
		/obj/item/clothing/under/suit_jacket/greenskirt = 45,
		/obj/item/clothing/under/suit_jacket/pink = 45,
		/obj/item/clothing/under/suit_jacket/pinkskirt = 45,
		/obj/item/clothing/under/suit_jacket/red = 45,
		/obj/item/clothing/under/suit_jacket/redskirt = 45,
		/obj/item/clothing/under/suit_jacket/redbusiness = 45,
		/obj/item/clothing/under/suit_jacket/redbusinessskirt = 45,
		/obj/item/clothing/under/suit_jacket/silver = 45,
		/obj/item/clothing/under/suit_jacket/smoky = 45,
		/obj/item/clothing/under/suit_jacket/teal = 45,
		/obj/item/clothing/under/suit_jacket/tealskirt = 45,
		/obj/item/clothing/under/suit_jacket/white = 50,
		/obj/item/clothing/under/suit_jacket = 45,
		/obj/item/clothing/under/modular/black = 40,
		/obj/item/clothing/under/modular/blackskirt = 40,
		/obj/item/clothing/under/modular/blue = 40,
		/obj/item/clothing/under/modular/blueskirt = 40,
		/obj/item/clothing/under/modular/burgundy = 40,
		/obj/item/clothing/under/modular/burgundyskirt = 40,
		/obj/item/clothing/under/modular/charcoal = 45,
		/obj/item/clothing/under/modular/charcoalskirt = 45,
		/obj/item/clothing/under/modular/checkered = 45,
		/obj/item/clothing/under/modular/checkeredskirt = 45,
		/obj/item/clothing/under/modular/green = 40,
		/obj/item/clothing/under/modular/greenskirt = 40,
		/obj/item/clothing/under/modular/navy = 40,
		/obj/item/clothing/under/modular/navyskirt = 40,
		/obj/item/clothing/under/modular/purple = 40,
		/obj/item/clothing/under/modular/purpleskirt = 40,
		/obj/item/clothing/under/modular/smoky = 45,
		/obj/item/clothing/under/modular/smokyskirt = 45,
		/obj/item/clothing/under/modular/tan = 40,
		/obj/item/clothing/under/modular = 40,
		/obj/item/clothing/under/white = 60,
		/obj/item/clothing/under/red = 60,
		/obj/item/clothing/under/green = 60,
		/obj/item/clothing/under/grey = 60,
		/obj/item/clothing/under/black = 60,
		/obj/item/clothing/under/dress/black = 60,
		/obj/item/clothing/under/dress/white = 60,
		/obj/item/clothing/under/helltaker = 60,
		/obj/item/clothing/under/johnny = 75,
		/obj/item/clothing/under/raider = 75,
		/obj/item/clothing/under/dress = 75,
		/obj/item/clothing/under/dress/blue = 75,
		/obj/item/clothing/under/dress/red = 75,
		/obj/item/clothing/under/dismas = 75,
		/obj/item/clothing/under/top/dimmadome = 75,
		/obj/item/clothing/under/leisure = 75,
		/obj/item/clothing/under/leisure/white = 75,
		/obj/item/clothing/under/leisure/pullover = 75,
		/obj/item/clothing/under/jamrock_suit = 75,
		/obj/item/clothing/under/aerostatic_suit = 75,
		/obj/item/clothing/under/track_suit = 55,
		/obj/item/clothing/under/neon = 55,
		/obj/item/clothing/under/neon/yellow = 55,
		/obj/item/clothing/under/neon/blue = 55,
		/obj/item/clothing/under/neon/red = 55,
		//Over Clothing
		/obj/item/clothing/suit/storage/toggle/labcoat/poofy = 150, //labcoats are exspensive
		/obj/item/clothing/suit/storage/texan = 100,
		/obj/item/clothing/suit/storage/triad = 120,
		/obj/item/clothing/suit/storage/akira = 75,
		/obj/item/clothing/suit/storage/aerostatic_bomber_jacket = 130,
		/obj/item/clothing/suit/storage/jamrock_blazer = 130
					)

/obj/machinery/vending/kink
	name = "KinkMate"
	desc = "A vending machine for all your unmentionable desires."
	icon_state = "kink"
	product_slogans = "Kinky!;Sexy!;Check me out, big boy!"
	product_ads = "We all need some relax time.;Feeling frisky?"
	vend_reply = "Have fun, you shameless pervert!"
	products = list(
				/obj/item/clothing/suit/costume/kinky/alyson = 5,
				/obj/item/clothing/suit/ivory = 5,
				/obj/item/clothing/suit/blacksilk = 5,
				/obj/item/clothing/under/costume/kinky/latex_maid = 5,
				/obj/item/clothing/under/costume/kinky/leather = 5,
				/obj/item/clothing/under/costume/kinky/sexy_clown = 5,
				/obj/item/clothing/under/costume/kinky/sexy_mime = 5,
				/obj/item/clothing/under/costume/kinky/stripper_green = 5,
				/obj/item/clothing/under/costume/kinky/stripper_pink = 5,
				/obj/item/clothing/suit/costume/kinky/sexy_engineer = 5,
				/obj/item/clothing/suit/costume/kinky/sexy_internalaffairs = 5,
				/obj/item/clothing/suit/costume/kinky/sexy_lumberjack = 5,
				/obj/item/clothing/suit/costume/kinky/sexy_miner = 5,
				/obj/item/clothing/suit/costume/kinky/sexy_scientist = 5,
				/obj/item/clothing/mask/costume/kinky/sexy_clown = 5,
				/obj/item/clothing/mask/costume/kinky/sexy_mime = 5,
				/obj/item/clothing/suit/storage/toggle/labcoat/poofy = 3,
				/obj/item/clothing/under/rank/trooper/skirt = 5,
				/obj/item/clothing/under/rank/engineer/skirt = 5,
				/obj/item/clothing/under/rank/engineer/skirt/alt = 5,
				/obj/item/clothing/mask/muzzle = 5,
				/obj/item/clothing/glasses/blindfold = 5,
				/obj/item/handcuffs/fuzzy = 5,
				/obj/item/tool/tape_roll = 5,
				/obj/item/stack/cable_coil/random = 5,
				/obj/item/clothing/suit/straight_jacket = 5,
				/obj/item/legcuffs/fuzzy = 5)
	prices = list(
				/obj/item/clothing/suit/costume/kinky/alyson = 100,
				/obj/item/clothing/suit/ivory = 100,
				/obj/item/clothing/suit/blacksilk = 100,
				/obj/item/clothing/under/costume/kinky/latex_maid = 100,
				/obj/item/clothing/under/costume/kinky/leather = 100,
				/obj/item/clothing/under/costume/kinky/sexy_clown = 100,
				/obj/item/clothing/under/costume/kinky/sexy_mime = 100,
				/obj/item/clothing/under/costume/kinky/stripper_green = 100,
				/obj/item/clothing/under/costume/kinky/stripper_pink = 100,
				/obj/item/clothing/suit/costume/kinky/sexy_engineer = 100,
				/obj/item/clothing/suit/costume/kinky/sexy_internalaffairs = 100,
				/obj/item/clothing/suit/costume/kinky/sexy_lumberjack = 100,
				/obj/item/clothing/suit/costume/kinky/sexy_miner = 100,
				/obj/item/clothing/suit/costume/kinky/sexy_scientist = 100,
				/obj/item/clothing/mask/costume/kinky/sexy_clown = 100,
				/obj/item/clothing/mask/costume/kinky/sexy_mime = 100,
				/obj/item/clothing/suit/storage/toggle/labcoat/poofy = 200,
				/obj/item/clothing/under/rank/trooper/skirt = 100,
				/obj/item/clothing/under/rank/engineer/skirt = 125, //has rad shielding
				/obj/item/clothing/under/rank/engineer/skirt/alt = 125,
				/obj/item/clothing/mask/muzzle = 100,
				/obj/item/clothing/glasses/blindfold = 100,
				/obj/item/handcuffs/fuzzy = 100,
				/obj/item/tool/tape_roll = 50,
				/obj/item/stack/cable_coil/random = 50,
				/obj/item/clothing/suit/straight_jacket = 100,
				/obj/item/legcuffs/fuzzy = 100)

/obj/machinery/vending/fortune
	name = "The Great Zoltan"
	desc = "An archaic fortune teller machine. It looks recently refurbished."
	icon_state = "fortuneteller"
	icon_vend = "fortuneteller-vend"
	vendor_department = DEPARTMENT_CHURCH
	product_slogans = list("Ha ha ha ha ha!",
	"I am the great wizard Zoltan!",
	"Learn your fate!")
	product_ads = "Pick a card, any card..."
	products = list(
					/obj/item/paper/fortune = 30)
	prices = list(
					/obj/item/paper/fortune = 25)

/obj/machinery/vending/fortune/postvend_effect()
	playsound(loc, 'sound/machines/fortune_riff.ogg', 100, 1)
	return

//For the propis loot
/obj/machinery/vending/propis_loot_box
	name = "Prospectors 'Git-yer-Shit' Vendor"
	desc = "The prospectors much loved 'Git-yer-Shit' a machine meant to sap the credits... 'reward' people for playing a lottery like system for boxes of items. Please spend responsibly."
	icon_state = "MagiVend"
	product_slogans = list("Imagine the rare stuff and buy more!", "Rare stuff if you buy more!", "Buy and get random items!", "Don't quit, buy more!", "Its not a lootbox, its surprise mechanics!")
	vendor_department = DEPARTMENT_PROSPECTOR
	products = list(
		/obj/item/storage/box/vendor_lootbox = 3,
		/obj/item/storage/box/vendor_lootbox/combat_basic_light = 3,
		/obj/item/storage/box/vendor_lootbox/combat_basic_medium = 3,
		/obj/item/storage/box/vendor_lootbox/combat_basic_high = 3,
		/obj/item/storage/box/vendor_lootbox/medicine_basic = 3,
		/obj/item/storage/box/vendor_lootbox/medicine_moderate = 3,
		/obj/item/storage/box/vendor_lootbox/medicine_high = 3,
		/obj/item/storage/box/vendor_lootbox/oddity_low = 3,
		/obj/item/storage/box/vendor_lootbox/oddity_moderate = 3,
		/obj/item/storage/box/vendor_lootbox/oddity_high = 3,
		/obj/item/grenade/spawnergrenade/manhacks/junkbot = 3
		)
	prices = list(
		/obj/item/storage/box/vendor_lootbox = 50,
		/obj/item/storage/box/vendor_lootbox/combat_basic_light = 100,
		/obj/item/storage/box/vendor_lootbox/combat_basic_medium = 250,
		/obj/item/storage/box/vendor_lootbox/combat_basic_high = 500,
		/obj/item/storage/box/vendor_lootbox/medicine_basic = 100,
		/obj/item/storage/box/vendor_lootbox/medicine_moderate = 250,
		/obj/item/storage/box/vendor_lootbox/medicine_high = 500,
		/obj/item/storage/box/vendor_lootbox/oddity_low = 150,
		/obj/item/storage/box/vendor_lootbox/oddity_moderate = 300,
		/obj/item/storage/box/vendor_lootbox/oddity_high = 600,
		/obj/item/grenade/spawnergrenade/manhacks/junkbot = 100
		)
	product_ads = "Imagine the rare stuff and buy more!;Rare stuff if you buy more!;Buy and get random items!;Don't quit, buy more!;Its not a lootbox, its surprise mechanics!"
	auto_price = FALSE

//For Blackshield Kits
/obj/machinery/vending/blackshield_kit
	name = "\improper Blackshield Kit Vendor"
	desc = "A vendor that can dispense specialized equipment kits for Blackshield Troopers."
	icon_state = "trashvend"
	products = list( // 5 in stock for the default blackshield kit, 3 for the rest
		/obj/item/storage/box/bs_kit/mosin = 5,
		/obj/item/storage/box/bs_kit/sts = 3,
		/obj/item/storage/box/bs_kit/cog = 3,
		/obj/item/storage/box/bs_kit/greasegun = 3,
		/obj/item/storage/box/bs_kit/grizzly = 3,
		/obj/item/storage/box/bs_kit/stallion = 5,
		/obj/item/storage/box/bs_kit/lamia = 3,
		/obj/item/storage/box/bs_kit/martin = 5,
		/obj/item/storage/box/bs_kit/standard_armor = 5,
		/obj/item/storage/box/bs_kit/flak_armor = 3,
		/obj/item/storage/box/bs_kit/laser_armor = 3
		)
	prices = list( // 500$ for default Blackshield stuff, 750 for the rest
		/obj/item/storage/box/bs_kit/mosin = 500,
		/obj/item/storage/box/bs_kit/sts = 750,
		/obj/item/storage/box/bs_kit/cog = 750,
		/obj/item/storage/box/bs_kit/greasegun = 750,
		/obj/item/storage/box/bs_kit/grizzly = 750,
		/obj/item/storage/box/bs_kit/stallion = 500,
		/obj/item/storage/box/bs_kit/lamia = 750,
		/obj/item/storage/box/bs_kit/martin = 500,
		/obj/item/storage/box/bs_kit/standard_armor = 500,
		/obj/item/storage/box/bs_kit/flak_armor = 750,
		/obj/item/storage/box/bs_kit/laser_armor = 750
		)
	auto_price = FALSE

/obj/machinery/vending/blackshield_kit/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/voucher/blackshield))
		var/obj/item/voucher/blackshield/Voucher = I
		switch(Voucher.voucher_type)
			if("Primary")
				RedeemPrimary(I, user)
			if("Secondary")
				RedeemSecondary(I, user)
			if("Armor")
				RedeemArmor(I, user)
		return
	return ..()

/obj/machinery/vending/blackshield_kit/proc/RedeemPrimary(obj/item/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/bs_kit/mosin = "Mosin",
					/obj/item/storage/box/bs_kit/sts = "STS",
					/obj/item/storage/box/bs_kit/cog = "Cog",
					/obj/item/storage/box/bs_kit/greasegun = "Grease Gun",
					/obj/item/storage/box/bs_kit/grizzly = "Grizzly"
					)
	var/selection = input(redeemer, "Pick your primary weapon", "Blackshield Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE

/obj/machinery/vending/blackshield_kit/proc/RedeemSecondary(obj/item/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/bs_kit/stallion = "Stallion",
					/obj/item/storage/box/bs_kit/lamia = "Lamia",
					/obj/item/storage/box/bs_kit/martin = "Martin"
					)
	var/selection = input(redeemer, "Pick your side-arm", "Blackshield Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE

/obj/machinery/vending/blackshield_kit/proc/RedeemArmor(obj/item/voucher, mob/redeemer)
	var/items = list(
					/obj/item/storage/box/bs_kit/standard_armor = "Plate",
					/obj/item/storage/box/bs_kit/flak_armor = "Flak",
					/obj/item/storage/box/bs_kit/laser_armor = "Ablative"
					)
	var/selection = input(redeemer, "Pick your armor", "Blackshield Voucher Redemption") as null|anything in items
	if(selection)
		new selection(loc)
		qdel(voucher)
		return TRUE
