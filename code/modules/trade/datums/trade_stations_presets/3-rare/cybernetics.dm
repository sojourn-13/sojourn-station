/datum/trade_station/cybermoebus
	spawn_probability = 0 //were bugged
	name_pool = list("FTS 'PentaOptium'" = "Free Trade Station 'PentaOptium'. \"Oh, you, I think I can sell you some cybernetics.\"")
	inventory = list(
		"Soteria" = list(
			/obj/item/organ/external/robotic/moebius/l_arm,
			/obj/item/organ/external/robotic/moebius/r_arm,
			/obj/item/organ/external/robotic/moebius/l_leg,
			/obj/item/organ/external/robotic/moebius/r_leg,
			/obj/item/organ/external/robotic/moebius/groin
		),
		"Salvaged Greyson Tech" = list(
			/obj/item/organ/external/robotic/one_star/l_arm,
			/obj/item/organ/external/robotic/one_star/r_arm,
			/obj/item/organ/external/robotic/one_star/l_leg,
			/obj/item/organ/external/robotic/one_star/r_leg
		),
		"Artificer Guild" = list(
			/obj/item/organ/external/robotic/technomancer/l_arm,
			/obj/item/organ/external/robotic/technomancer/r_arm,
			/obj/item/organ/external/robotic/technomancer/l_leg,
			/obj/item/organ/external/robotic/technomancer/r_leg
		),
		"H&S" = list(
			/obj/item/organ/external/robotic/frozen_star/l_arm,
			/obj/item/organ/external/robotic/frozen_star/r_arm,
			/obj/item/organ/external/robotic/frozen_star/l_leg,
			/obj/item/organ/external/robotic/frozen_star/r_leg
		),
		"Voidwolf" = list(
			/obj/item/organ/external/robotic/serbian/l_arm,
			/obj/item/organ/external/robotic/serbian/r_arm,
			/obj/item/organ/external/robotic/serbian/l_leg,
			/obj/item/organ/external/robotic/serbian/r_leg
		),
		"Blackmarket Blackshield" = list(
			/obj/item/organ/external/robotic/blackshield/l_arm,
			/obj/item/organ/external/robotic/blackshield/r_arm,
			/obj/item/organ/external/robotic/blackshield/l_leg,
			/obj/item/organ/external/robotic/blackshield/r_leg
		)
	)//No real better place to put this honestly

	offer_types = list(
		/obj/item/organ_module/active/simple/armblade = offer_data("implanted armblade", 300, 0),
		/obj/item/organ_module/active/simple/armsmg = offer_data("implanted arm smg", 800, 0),
		/obj/item/organ_module/active/simple/armshield = offer_data("implant arm shield", 900, 0),
		/obj/item/organ_module/active/simple/engineer = offer_data("implanted engineering omni tool", 800, 0),
		/obj/item/organ_module/active/hud/med = offer_data("implanted med hud", 600, 0),
		/obj/item/organ_module/active/hud/sec = offer_data("implanted sec hud", 1000, 0),
		/obj/item/organ_module/active/hud/night = offer_data("implanted nv goggles", 1300, 0),
		/obj/item/organ_module/active/hud/thermal = offer_data("implanted thermal goggles", 2800, 0),
		/obj/item/organ_module/active/hud/welder = offer_data("implanted welding goggles", 800, 0),
		/obj/item/organ_module/active/multitool = offer_data("implanted multitool", 600, 0),
		/obj/item/organ_module/active/simple/surgical = offer_data("implanted omni surgical tool", 600, 0),
		/obj/item/organ_module/active/simple/taser = offer_data("implanted taser", 1485, 0)
	)

/obj/item/organ/external/robotic/moebius
	price_tag = 450 //Has plasteel

/obj/item/organ/external/robotic/blackshield
	price_tag = 750 //Has blackmarket

/obj/item/organ/external/robotic/one_star
	price_tag = 1250 //Has legit the best in the game

/obj/item/organ/external/robotic/technomancer
	price_tag = 375 //basic

/obj/item/organ/external/robotic/serbian
	price_tag = 375 //basic

/obj/item/organ/external/robotic/frozen_star
	price_tag = 375 //basic
