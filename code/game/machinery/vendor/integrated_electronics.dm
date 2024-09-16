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
	give_discounts = FALSE
	give_discount_points = FALSE

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
	give_discounts = FALSE
	give_discount_points = FALSE

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
		/obj/item/integrated_circuit/input/gps = 40,
		/obj/item/integrated_circuit/input/microphone = 40,
		/obj/item/integrated_circuit/input/sensor = 40,

		/obj/item/integrated_circuit/output/screen = 40,
		/obj/item/integrated_circuit/output/light/advanced = 40,
		/obj/item/integrated_circuit/output/light = 40,
		/obj/item/integrated_circuit/output/sound/beeper = 40,
		/obj/item/integrated_circuit/output/sound/beepsky = 40,
		/obj/item/integrated_circuit/output/text_to_speech = 40,
		/obj/item/integrated_circuit/output/video_camera = 40,
		/obj/item/integrated_circuit/output/led = 40,

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
		/obj/item/integrated_circuit/converter/num2text = 40,
		/obj/item/integrated_circuit/converter/text2num = 40,
		/obj/item/integrated_circuit/converter/ref2text = 40,
		/obj/item/integrated_circuit/converter/radians2degrees = 40,
		/obj/item/integrated_circuit/converter/degrees2radians = 40,
		/obj/item/integrated_circuit/converter/abs_to_rel_coords = 40)
	product_ads = "Automation for people!;Hack them all!"
	auto_price = FALSE
	give_discounts = FALSE
	give_discount_points = FALSE
